# SmartWard

Local-first iOS research strategist. The source of truth for requirements, design and phasing is `docs/PLAN.md`. Its decision IDs (D1–D6) are referenced in code.

## Layout

- `ShareExtension/`: the share extension. It never opens the SwiftData store; it only writes to `ShareInbox`.
- `SmartWard/`: the iOS app (SwiftUI). The Xcode project is generated from `project.yml` by XcodeGen and is not committed.
- `Packages/SmartWardKit/`: local SPM package. Keep logic here, not in views, so `swift test` covers it without a simulator.
  - `KnowledgeStore`: the SwiftData models, `KnowledgeSchema`, `ContextPolicy`, `ThemeStrength`, cost tracking (`UsageLedger`, `PriceBook`, `DailyBudget`), export and backup (`LibraryArchive`, the versioned JSON of every table, with `restore(into:)` and `erase`; `EncryptedBackup`; `MarkdownExport`).
  - `IngestKit`: source ingestion and GitHub.
    - Sources: `SourceEndpoint` (what a user typed → the URL fetched), `SourceFetcher` (per-kind adapters), `FeedParser` (RSS/Atom/RDF), `ArticleExtractor` (SwiftSoup; HTML → clean text), `PolitenessGate` (rate limits, backoff, robots.txt), `FeedIngest` (dedupe and store).
    - GitHub: the GET-only `GitHubClient`, `GitHubDeviceFlow`, `GitHubTokenStore` (device-only Keychain), `ManifestParser`, and `RepoSync` (repo docs → articles, dependency radar).
  - `Pipeline`: `PipelineRunner` (the resumable stage machine: triage → full text → chunk + embed), `Triage` and `InterestModel` (T0 relevance), `ArticleIndexer`, `EmbeddingModel`, `VectorCoding`, the graph view's data (`GraphSnapshot` scopes, `ForceLayout`) and user corrections (`GraphEditing` merge and split, which write user aliases), GraphRAG (`GraphRetriever`, `ReferenceContext`, and the read-only tools `search_corpus`, `graph_neighbors` and `open_article`), the action tools that need approval (`FetchURLTool`, `AddSourceTool`, which validates through `SourceIntake` like the Shortcuts action), the digest (`DigestBuilder`: clustering, ranking, tiered summaries), GraphML export (`GraphExport`, via GraphKit), the knowledge graph (`EntityExtracting` with `BYOKExtractor`, `EntityResolver`, `GraphLinker`, `GraphIndexer` with the D2/D5 routing), and hybrid search (`LexicalIndex` BM25 + vectors, fused with reciprocal rank fusion in `HybridSearchIndex`). It sits on OnDeviceKit's `RetrievalKit`; qualify `KnowledgeStore.Chunk` vs `RetrievalKit.Chunk` in files that import both.
  - `ShareInbox`: the App Group inbox (JSON files) shared with the share extension. It must stay dependency-free: it's the only SmartWardKit module the extension links. `IngestKit.SharedImport` moves its items into the store.
  - `AppLock`: `AppLockPolicy` (when to lock), `AppLockCoordinator` (biometrics first, PIN fallback, re-baseline after enrollment changes), and `PINRules`. It sits on OnDeviceKit's `PINLockKit` and `BiometricLockKit`.
  - `StrategistCore`: the tool-calling loop (`StrategistRunner`, which asks for approval before a tool's `ActionRequest`), mode prompts and their tool allow-lists (`StrategistPrompt.allowedTools(for:)`), the living brief (`BriefEditing`, `BriefDiff`, `BriefReviser`, `ProposeBriefUpdateTool`), model fallback (`FallbackLLM`, `ModelFallback` over ModelCatalogKit), history budgeting, and project tools. It depends on OnDeviceKit's `BYOKLLMKit`.
- Shared, domain-agnostic code belongs in [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), not here.

## Invariants — do not break

- **Private content never goes to a BYOK provider (D5).** Anything that assembles provider context or runs BYOK extraction must filter through `ContextPolicy`. Private-repo articles and chunks carry `localOnly = true`, and there is no user override.
- **The schema stays CloudKit-compatible** (PLAN §4). No `@Attribute(.unique)`. Every stored property has a default or is optional. Every relationship is optional, with its inverse declared on exactly one side. Every new `@Model` must be added to `KnowledgeSchema.models`.
- **Graph strength and weight are derived**, not stored counters: `Mention` and `ThemeEdge` rows are append-only, and `ThemeStrength` computes strength from them.
- API keys and tokens live only in the Keychain, never in `UserDefaults`, SwiftData or backups.
- SmartWard never writes to GitHub. `GitHubClient` issues GET requests only; the two device-flow auth calls to github.com are the only exceptions. Only docs and manifests are synced, never source code. A private repo's articles are always `localOnly`.
- Every ingestion request goes through `PolitenessGate` (truthful User-Agent, per-host rate limit, backoff; robots.txt for web pages), and all fetched HTML goes through `ArticleExtractor`, which drops hidden text, comments and invisible characters before anything is stored. Articles are deduped by `CanonicalURL` and content hash across all sources.
- Everything sent to the provider as library context goes through `GraphRetriever` or `OpenArticleTool`, both of which apply `ContextPolicy`, and is rendered by `ReferenceContext` inside `<reference>` fences that the content can't close.
- Extraction routing lives in `GraphIndexer.tiers(for:)`: local-only content and off-the-record chats are T1 (on-device) only and wait rather than fall back to a provider. Every provider extraction call records a `UsageRecord`.
- Pipeline stages are idempotent and save after every article; never add a stage that can't be re-run safely. Chunks record `embeddingModel`, and vectors from different models are never compared.
- Any tool that reaches the network or writes durable state (sources, strategy items) must return an `ActionRequest` from `confirmation(for:)`, so the runner asks the user before `run`; validate arguments there (throwing skips the prompt), again in `run`, and put exactly what will happen in `detail`. The runner declines when no `confirm` handler is given. Chat offers only the tools in the mode's allow-list. Settings → "Approve fetches and new sources automatically" (`ActionTools.autoApproveKey`) lets `ChatController` answer `fetch_url`/`add_source` confirmations itself, still logged as "Auto-approved"; it's the one deliberate exception, chosen by the user, and it never covers `record_strategy_item`.
- Untrusted text (article content, titles, theme names, fetched pages) goes into prompts only through `UntrustedText.body`/`.attribute` inside its fence. When you add a tool or a prompt that sees untrusted text, add an attack for it to `RedTeamTests`; that suite must keep passing with zero unapproved side effects.
- The brief's text changes only through `BriefEditing`: accepting a proposal, or your own edit. Both record a `BriefRevision`. The strategist and the reviser only propose, and a proposal made against text that has since changed is never applied.
- Record every provider call with `UsageLedger.record`, which prices calls whose cost the provider didn't report, and never insert `UsageRecord`s directly. Background provider work must respect `DailyBudget` (see `GraphIndexer.withinBudget`): when the budget is spent it falls back to on-device or waits. Foreground calls in the app go through `ModelCatalogController.shared.fallbackLLM()`, so a 429 or 5xx rotates to a fallback model.
- Every strategist turn must end: the runner's last round forces `toolChoice = .none`, and tool failures go back to the model as error results instead of aborting the turn.
- When you add a model or a stored property, add it to `LibraryArchive` (its record, `snapshot` and `restore`) in the same change, or export and backup silently drop it; `BackupTests` checks that wipe → restore reproduces the library exactly.
- Per-query paths (search, retrieval, tools, the graph view) must not fetch whole tables: use predicates on ids or `normalizedKey`, prefetch relationships you walk, and `TopK` for rankings. `PerformanceTests` prints timings at scale; wrap new latency-sensitive paths in `PerfTrace.measure` so they show up in the developer readout and Instruments. The search index is updated in place (`SearchCorpus.update`); call `SearchController.shared.markStale()` after anything that replaces chunks.
- Enum-backed model fields store a raw `String` with a literal default and expose a typed computed property that falls back on unknown values.

## Checks

- Package tests run on the iOS Simulator, because OnDeviceKit declares iOS only: `cd Packages/SmartWardKit && xcodebuild test -scheme SmartWardKit-Package -destination 'platform=iOS Simulator,OS=<latest>,name=<iPhone NN Pro>'`
- `xcodegen generate && xcodebuild build -project SmartWard.xcodeproj -scheme SmartWard -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO`
- CI (`.github/workflows/ci.yml`) runs both on `macos-latest` with the latest stable Xcode.

<!-- gitnexus:start -->
# GitNexus — Code Intelligence

This project is indexed by GitNexus as **SmartWard** (5399 symbols, 24368 relationships, 262 execution flows).

> Index stale? Run `node .gitnexus/run.cjs analyze --index-only` from the project root — it auto-selects an available runner. No `.gitnexus/run.cjs` yet? Bootstrap with `npx`, `bunx`, or `pnpm dlx` — e.g. `bunx gitnexus@latest analyze` (npm 11 npx crash; #1939).

## Always Do

- **MUST run impact before editing.** Use `impact({target: "symbolName", direction: "upstream"})` or `node .gitnexus/run.cjs impact "symbolName" --direction upstream --repo .`; report callers, processes, and risk. Never substitute grep for graph analysis.
- **MUST analyze graph changes before committing.** Use `detect_changes({scope: "all"})` (MCP) or `node .gitnexus/run.cjs detect-changes --scope all --repo .` (CLI fallback). `partial: true` or `truncated: true` is not a clean check — a zero means unseen, not unaffected; re-run it. For regression review: `detect_changes({scope: "compare", base_ref: "main"})` or `node .gitnexus/run.cjs detect-changes --scope compare --base-ref "main" --repo .`.
- MUST warn on HIGH/CRITICAL `risk` pre-edit; never use `riskSharedAxes` to waive a HIGH/CRITICAL `risk` warning. Compare File/symbol: MCP File omits axes; Graph-RAG expands File.
- **MUST treat `risk: UNKNOWN` as unresolved, not as low.** An empty caller set is not evidence the symbol is unused — it can also mean the callers are not resolvable by the index (plain-object property access, dynamic dispatch, cross-language calls). `impact` pairs `UNKNOWN` with a `riskNote` saying so. Confirm with a text search before treating the symbol as safe to change or delete; do not proceed on the strength of a zero.
- **MUST use `query({search_query: "concept"})` for concepts/flows, `context({name: "symbolName"})` for a named symbol, or `impact` for blast radius, on read-only callers, dependencies, imports, or execution flow.** Graph first; text search only for empty/`UNKNOWN`/literals.
- For security review, `explain({target: "fileOrSymbol"})` lists taint findings (source→sink flows; needs `analyze --pdg`).

## Never Do

- NEVER edit a function, class, or method before MCP/CLI impact analysis.
- NEVER ignore HIGH or CRITICAL risk warnings from impact analysis, and never read `UNKNOWN` as an all-clear — it means the walk could not answer, which is the one verdict that requires confirming by other means.
- NEVER rename symbols with find-and-replace — use `rename` which understands the call graph.
- NEVER commit before MCP/CLI graph change analysis.

## Resources

| Resource | Use for |
| --- | --- |
| `gitnexus://repo/SmartWard/context` | Codebase overview, check index freshness |
| `gitnexus://repo/SmartWard/clusters` | All functional areas |
| `gitnexus://repo/SmartWard/processes` | All execution flows |
| `gitnexus://repo/SmartWard/process/{name}` | Step-by-step execution trace |

## CLI

| Task | Read this skill file |
| --- | --- |
| Understand architecture / "How does X work?" | `.claude/skills/gitnexus-exploring/SKILL.md` |
| Blast radius / "What breaks if I change X?" | `.claude/skills/gitnexus-impact-analysis/SKILL.md` |
| Trace bugs / "Why is X failing?" | `.claude/skills/gitnexus-debugging/SKILL.md` |
| Rename / extract / split / refactor | `.claude/skills/gitnexus-refactoring/SKILL.md` |
| Tools, resources, schema reference | `.claude/skills/gitnexus-guide/SKILL.md` |
| Index, status, clean, wiki CLI commands | `.claude/skills/gitnexus-cli/SKILL.md` |

<!-- gitnexus:end -->

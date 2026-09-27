# SmartWard

Local-first iOS research strategist. The source of truth for requirements, design and phasing is `docs/PLAN.md`. Its decision IDs (D1–D6) are referenced in code.

## Layout

- `ShareExtension/`: the share extension. It never opens the SwiftData store; it only writes to `ShareInbox`.
- `SmartWard/`: the iOS app (SwiftUI). The Xcode project is generated from `project.yml` by XcodeGen and is not committed.
- `Packages/SmartWardKit/`: local SPM package. Keep logic here, not in views, so `swift test` covers it without a simulator.
  - `KnowledgeStore`: the SwiftData models, `KnowledgeSchema`, `ContextPolicy` and `ThemeStrength`.
  - `IngestKit`: source ingestion and GitHub.
    - Sources: `SourceEndpoint` (what a user typed → the URL fetched), `SourceFetcher` (per-kind adapters), `FeedParser` (RSS/Atom/RDF), `ArticleExtractor` (SwiftSoup; HTML → clean text), `PolitenessGate` (rate limits, backoff, robots.txt), `FeedIngest` (dedupe and store).
    - GitHub: the GET-only `GitHubClient`, `GitHubDeviceFlow`, `GitHubTokenStore` (device-only Keychain), `ManifestParser`, and `RepoSync` (repo docs → articles, dependency radar).
  - `Pipeline`: `PipelineRunner` (the resumable stage machine: triage → full text → chunk + embed), `Triage` and `InterestModel` (T0 relevance), `ArticleIndexer`, `EmbeddingModel`, `VectorCoding`, and hybrid search (`LexicalIndex` BM25 + vectors, fused with reciprocal rank fusion in `HybridSearchIndex`). It sits on OnDeviceKit's `RetrievalKit`; qualify `KnowledgeStore.Chunk` vs `RetrievalKit.Chunk` in files that import both.
  - `ShareInbox`: the App Group inbox (JSON files) shared with the share extension. It must stay dependency-free: it's the only SmartWardKit module the extension links. `IngestKit.SharedImport` moves its items into the store.
  - `AppLock`: `AppLockPolicy` (when to lock), `AppLockCoordinator` (biometrics first, PIN fallback, re-baseline after enrollment changes), and `PINRules`. It sits on OnDeviceKit's `PINLockKit` and `BiometricLockKit`.
  - `StrategistCore`: the tool-calling loop (`StrategistRunner`), mode prompts, history budgeting, and project tools. It depends on OnDeviceKit's `BYOKLLMKit`.
- Shared, domain-agnostic code belongs in [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), not here.

## Invariants — do not break

- **Private content never goes to a BYOK provider (D5).** Anything that assembles provider context or runs BYOK extraction must filter through `ContextPolicy`. Private-repo articles and chunks carry `localOnly = true`, and there is no user override.
- **The schema stays CloudKit-compatible** (PLAN §4). No `@Attribute(.unique)`. Every stored property has a default or is optional. Every relationship is optional, with its inverse declared on exactly one side. Every new `@Model` must be added to `KnowledgeSchema.models`.
- **Graph strength and weight are derived**, not stored counters: `Mention` and `ThemeEdge` rows are append-only, and `ThemeStrength` computes strength from them.
- API keys and tokens live only in the Keychain, never in `UserDefaults`, SwiftData or backups.
- SmartWard never writes to GitHub. `GitHubClient` issues GET requests only; the two device-flow auth calls to github.com are the only exceptions. Only docs and manifests are synced, never source code. A private repo's articles are always `localOnly`.
- Every ingestion request goes through `PolitenessGate` (truthful User-Agent, per-host rate limit, backoff; robots.txt for web pages), and all fetched HTML goes through `ArticleExtractor`, which drops hidden text, comments and invisible characters before anything is stored. Articles are deduped by `CanonicalURL` and content hash across all sources.
- Pipeline stages are idempotent and save after every article; never add a stage that can't be re-run safely. Chunks record `embeddingModel`, and vectors from different models are never compared.
- Every strategist turn must end: the runner's last round forces `toolChoice = .none`, and tool failures go back to the model as error results instead of aborting the turn.
- Enum-backed model fields store a raw `String` with a literal default and expose a typed computed property that falls back on unknown values.

## Checks

- Package tests run on the iOS Simulator, because OnDeviceKit declares iOS only: `cd Packages/SmartWardKit && xcodebuild test -scheme SmartWardKit-Package -destination 'platform=iOS Simulator,OS=<latest>,name=<iPhone NN Pro>'`
- `xcodegen generate && xcodebuild build -project SmartWard.xcodeproj -scheme SmartWard -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO`
- CI (`.github/workflows/ci.yml`) runs both on `macos-latest` with the latest stable Xcode.

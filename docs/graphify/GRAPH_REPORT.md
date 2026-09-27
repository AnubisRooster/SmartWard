# Graph Report - SmartWard  (2026-09-27)

## Corpus Check
- Large corpus: 148 files · ~572,662 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2687 nodes · 6913 edges · 153 communities (149 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 846 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ActionRequest
- ModelFallback
- ThemeNode
- BackupView
- IngestError
- SharedInbox
- StrategyItemKind
- Project
- Conversation
- ExtractionTiers
- GitHubDeviceFlow
- GitHubClient
- Sendable
- .lines()
- Choice
- ReferenceLedger
- PipelineRunner
- InterestModel
- SwiftData
- .extract()
- OnboardingProposal
- AddSourceTool
- .parse()
- .makeContainer()
- EmbeddingModel
- Phase 5: Hardening
- BYOKLLMKit
- Pipeline module (ingestion, graph, searc
- RawItem
- GitHubError
- SourceFetcher
- Digest
- DigestSummaryRequest
- View
- Invariant D5: Private content never goes
- Dependency
- DigestBuilder
- .load()
- ProjectSnapshot
- .body
- GraphRAG
- AppLockCoordinator
- GitHubRepo
- GraphSnapshot
- RetrievedPassage
- GitHubRepoPicker
- ModelCatalogController
- IngestController
- PerfTrace
- KnowledgeStore
- HybridSearchIndex
- .retrieve()
- .article()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- Article
- .fetchURL()
- .build()
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- makeContext()
- PriceBook
- String
- Approval Before Actions
- Strategist Layer
- ShareModel
- GitHubAccount
- DigestCluster
- .seal()
- GraphIndexer
- SearchHit
- .plan()
- OnboardingView
- AskStrategistIntent
- CodingKeys
- SmartWard (iOS Application Target)
- DailyBudget
- .decode()
- SearchDocument
- .messages()
- PlaybackLLM
- ThemeDetailView
- ChatController
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphExtraction.swift
- GraphView
- .projects()
- Source
- .process()
- XCTestCase
- XCTest
- IngestKit
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SourceKind
- .data()
- RetrievalFixture
- AppLockController
- SecuritySettingsSection
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- ParsedFeed
- OnboardingReviewView
- DeveloperView
- AppLock.swift
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .score()
- String
- SourceKindOption
- GraphCanvas
- .testEveryPromptFenceHoldsAgainstPoisone
- TopK
- FakeBiometrics
- FoundationModelsEntityExtractor
- AppLockTests.swift
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- LibraryArchive
- .documents()
- AppTab
- graphify_pipeline.py
- LocalizedError
- ArchiveError
- Graph View
- ArticleReaderView
- UntrustedText (body/attribute inside its
- RepoSync.swift
- .availability()
- BackupError
- BriefError
- LibraryFixture
- Living Project Brief
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- UnionFind
- ExtractedGraph
- .library()
- SeededRandom
- Apple Intelligence Preflight
- AppStore
- IntentFailure
- GitHubTokenPoll
- FakePIN
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 87 edges
2. `SwiftData` - 75 edges
3. `Project` - 68 edges
4. `Article` - 63 edges
5. `Source` - 50 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 36 edges
8. `LibraryArchive` - 34 edges
9. `ProjectLink` - 34 edges
10. `HybridSearchIndex` - 33 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
- `SourceIntake (shared validation for adding sources)` --implements--> `add_source Tool`  [INFERRED]
  CLAUDE.md → README.md

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Build Targets and the Package Products They Link** — project_smartward, project_smartwardshare, project_smartwardkit, project_ondevicekit, project_shareinbox, project_knowledgestore, project_strategistcore, project_ingestkit, project_applock, project_pipeline, project_byokllmkit, project_modelcatalogkit, project_pinlockkit, project_biometriclockkit [EXTRACTED 1.00]
- **Device-Only Capabilities the Simulator Cannot Verify** — docs_device_testing_apple_intelligence_on_device_triage, docs_device_testing_on_device_theme_extraction, docs_device_testing_summarized_on_device_digest, docs_device_testing_background_processing_bgtaskscheduler, docs_device_testing_share_extension_safari_capture, docs_device_testing_app_lock_face_id, docs_device_testing_siri_ask_smartward, docs_device_testing_shortcuts_app_intents [EXTRACTED 1.00]
- **Ingestion pipeline and politeness subsystem** — claude_ingestkit, claude_politenessgate, claude_articleextractor, claude_reposync, claude_pipelinerunner, claude_articleindexer, claude_embeddingmodel, claude_politeness_invariant, claude_idempotent_stages [EXTRACTED 1.00]
- **Phase 1 Foundation feature set** — readme_phase1_foundation, readme_knowledgestore, readme_app_shell, readme_strategist_chat, readme_onboarding_interview, readme_github_signin, readme_repo_sync, readme_app_lock [EXTRACTED 1.00]
- **Inference tier stack T0-T3** — docs_plan_inference_tiers, docs_plan_t0_heuristics, docs_plan_t1_foundation_models, docs_plan_t2_cheap_byok, docs_plan_t3_frontier_byok, docs_plan_applefmkit, docs_plan_byokllmkit, docs_plan_modelcatalogkit, docs_plan_usageledger [EXTRACTED 1.00]
- **Knowledge Layer subsystem** — docs_plan_knowledge_layer, docs_plan_retrievalkit, docs_plan_graphkit, docs_plan_graphretrievalkit, docs_plan_entityresolver, docs_plan_contextassembler, docs_plan_graphrag [EXTRACTED 1.00]
- **SwiftData theme-graph entity set** — docs_plan_themenode, docs_plan_entityalias, docs_plan_mention, docs_plan_themeedge, docs_plan_chunk, docs_plan_article, docs_plan_message, docs_plan_conversation, docs_plan_project, docs_plan_projectlink, docs_plan_projectbrief, docs_plan_strategyitem, docs_plan_interestprofile, docs_plan_readingsignal, docs_plan_source, docs_plan_usagerecord [EXTRACTED 1.00]
- **App Group Shared-Container Mechanism (extension writes, app imports)** — project_app_group_entitlement, project_shareinbox, project_smartward, project_smartwardshare, docs_device_testing_app_group_registration [INFERRED 0.85]
- **Prompt isolation and approval boundary** — readme_approval_before_actions, readme_reference_fencing, readme_prompt_fence_escaping, readme_red_team_suite, readme_poisoned_corpus, readme_private_content_policy, claude_untrustedtext, claude_contextpolicy, claude_action_confirmation, claude_untrusted_text_rule [INFERRED 0.85]

## Communities (153 total, 4 thin omitted)

### Community 0 - "ActionRequest"
Cohesion: 0.05
Nodes (51): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+43 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "ThemeNode"
Cohesion: 0.09
Nodes (27): Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, ProjectLinkKind, githubRepo, url (+19 more)

### Community 3 - "BackupView"
Cohesion: 0.06
Nodes (37): Any, Context, GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests (+29 more)

### Community 4 - "IngestError"
Cohesion: 0.08
Nodes (30): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+22 more)

### Community 5 - "SharedInbox"
Cohesion: 0.09
Nodes (22): JSONDecoder, JSONEncoder, Result, SharedImport, Date, Int, ModelContext, SharedInbox (+14 more)

### Community 6 - "StrategyItemKind"
Cohesion: 0.08
Nodes (27): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+19 more)

### Community 7 - "Project"
Cohesion: 0.13
Nodes (20): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Project (+12 more)

### Community 8 - "Conversation"
Cohesion: 0.08
Nodes (24): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+16 more)

### Community 9 - "ExtractionTiers"
Cohesion: 0.10
Nodes (22): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, BudgetTests, Double, ModelContext (+14 more)

### Community 10 - "GitHubDeviceFlow"
Cohesion: 0.10
Nodes (22): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+14 more)

### Community 11 - "GitHubClient"
Cohesion: 0.12
Nodes (15): GitHubClient, .isAuthenticated, GitHubUser, HTTPTransport, String, URLSessionTransport, FakeTransport, GitHubClientTests (+7 more)

### Community 12 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 13 - ".lines()"
Cohesion: 0.10
Nodes (23): BriefDiff, Line, added, removed, same, BriefController, BriefDiffView, .body (+15 more)

### Community 14 - "Choice"
Cohesion: 0.07
Nodes (30): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+22 more)

### Community 15 - "ReferenceLedger"
Cohesion: 0.13
Nodes (16): Decodable, ReferenceContext, Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger (+8 more)

### Community 16 - "PipelineRunner"
Cohesion: 0.12
Nodes (22): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+14 more)

### Community 17 - "InterestModel"
Cohesion: 0.15
Nodes (17): CaseIterable, Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off (+9 more)

### Community 18 - "SwiftData"
Cohesion: 0.14
Nodes (6): Accelerate, AppIntents, Foundation, NaturalLanguage, RetrievalKit, SwiftData

### Community 19 - ".extract()"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 20 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 21 - "AddSourceTool"
Cohesion: 0.16
Nodes (14): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, JSONValue, LLMTool (+6 more)

### Community 22 - ".parse()"
Cohesion: 0.13
Nodes (11): DateFormatter, ISO8601DateFormatter, FeedParser, Data, CanonicalURL, FeedDate, Date, Set (+3 more)

### Community 23 - ".makeContainer()"
Cohesion: 0.15
Nodes (8): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, LinkParsingTests

### Community 24 - "EmbeddingModel"
Cohesion: 0.17
Nodes (12): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+4 more)

### Community 25 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 26 - "BYOKLLMKit"
Cohesion: 0.13
Nodes (5): BYOKLLMKit, ModelCatalogKit, ActionTools, BriefOrigin, StrategistCore

### Community 27 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 28 - "RawItem"
Cohesion: 0.18
Nodes (11): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+3 more)

### Community 29 - "GitHubError"
Cohesion: 0.13
Nodes (15): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+7 more)

### Community 30 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 31 - "Digest"
Cohesion: 0.14
Nodes (17): Digest, .clusters, Bool, Date, DigestController, .notificationsEnabled, Bool, ModelContext (+9 more)

### Community 32 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (13): BYOKDigestSummarizer, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider (+5 more)

### Community 33 - "View"
Cohesion: 0.11
Nodes (20): KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body, DigestSettingsSection, NewProjectView (+12 more)

### Community 34 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 35 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 36 - "DigestBuilder"
Cohesion: 0.18
Nodes (12): DigestBuilder, Group, Bool, Date, Int, ModelContext, TimeInterval, DigestBuilderTests (+4 more)

### Community 37 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 38 - "ProjectSnapshot"
Cohesion: 0.19
Nodes (7): Item, ProjectSnapshot, StrategistPrompt, Bool, Set, String, StrategistPromptTests

### Community 39 - ".body"
Cohesion: 0.12
Nodes (15): App, Scene, SmartWardApp, .body, BackgroundWork, TimeInterval, LockScreen, PrivacyCover (+7 more)

### Community 40 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 41 - "AppLockCoordinator"
Cohesion: 0.16
Nodes (12): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+4 more)

### Community 42 - "GitHubRepo"
Cohesion: 0.21
Nodes (11): GitHubRepo, .id, Bool, ApplyResult, Document, RepoSnapshot, RepoSync, Date (+3 more)

### Community 43 - "GraphSnapshot"
Cohesion: 0.20
Nodes (15): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+7 more)

### Community 44 - "RetrievedPassage"
Cohesion: 0.16
Nodes (16): RetrievedPassage, ActionConfirmationCard, .body, .body, EmptyChatHint, .body, .purpose, MessageRow (+8 more)

### Community 45 - "GitHubRepoPicker"
Cohesion: 0.11
Nodes (17): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+9 more)

### Community 46 - "ModelCatalogController"
Cohesion: 0.19
Nodes (14): BudgetSettings, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry, Date (+6 more)

### Community 47 - "IngestController"
Cohesion: 0.14
Nodes (14): BGContinuedProcessingTask, Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext (+6 more)

### Community 48 - "PerfTrace"
Cohesion: 0.19
Nodes (13): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+5 more)

### Community 49 - "KnowledgeStore"
Cohesion: 0.18
Nodes (4): KnowledgeStore, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 50 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+4 more)

### Community 51 - ".retrieve()"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 52 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 53 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 54 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 55 - "Article"
Cohesion: 0.18
Nodes (15): Article, ReadingSignal, .body, ArticleRow, .body, .content, ReadingView, .emptyState (+7 more)

### Community 56 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 57 - ".build()"
Cohesion: 0.25
Nodes (11): Bool, Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval (+3 more)

### Community 58 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 59 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 60 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 61 - "makeContext()"
Cohesion: 0.15
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 62 - "PriceBook"
Cohesion: 0.23
Nodes (10): Line, .id, Price, PriceBook, Bool, Int, String, Calendar (+2 more)

### Community 63 - "String"
Cohesion: 0.22
Nodes (7): BYOKExtractor, ExtractionOutput, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 64 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 65 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 66 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 67 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 68 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 69 - ".seal()"
Cohesion: 0.23
Nodes (9): EncryptedBackup, Data, LibraryArchive, String, UInt32, BackupTests, UInt32, SymmetricKey (+1 more)

### Community 70 - "GraphIndexer"
Cohesion: 0.23
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 71 - "SearchHit"
Cohesion: 0.22
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 72 - ".plan()"
Cohesion: 0.22
Nodes (12): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+4 more)

### Community 73 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 74 - "AskStrategistIntent"
Cohesion: 0.18
Nodes (14): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, IntentResult, LocalizedStringResource, ParameterSummary, AddSourceIntent (+6 more)

### Community 75 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 76 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 77 - "DailyBudget"
Cohesion: 0.32
Nodes (6): DailyBudget, Calendar, Date, Double, ModelContext, UsageLedger

### Community 78 - ".decode()"
Cohesion: 0.16
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 79 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 80 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 81 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 82 - "ThemeDetailView"
Cohesion: 0.21
Nodes (13): Connection, .id, String, UUID, Void, ThemeDetailView, .body, .connections (+5 more)

### Community 83 - "ChatController"
Cohesion: 0.21
Nodes (10): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, String, ConversationView, .composer (+2 more)

### Community 84 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 85 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 86 - "GraphExtraction.swift"
Cohesion: 0.15
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 87 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 88 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 89 - "Source"
Cohesion: 0.25
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 90 - ".process()"
Cohesion: 0.18
Nodes (10): FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, ModelContext, String, TimeInterval, Triage.Strength (+2 more)

### Community 91 - "XCTestCase"
Cohesion: 0.14
Nodes (9): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, SampleLibraryTests, ExtractionTests, TopKTests, BriefDiffTests (+1 more)

### Community 93 - "IngestKit"
Cohesion: 0.17
Nodes (3): BackgroundTasks, IngestKit, ShareInbox

### Community 94 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 95 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 96 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 97 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 98 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 99 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 100 - "SecuritySettingsSection"
Cohesion: 0.19
Nodes (12): SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding, Double (+4 more)

### Community 101 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 102 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 103 - "ParsedFeed"
Cohesion: 0.27
Nodes (8): NSObject, Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 104 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 105 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 106 - "AppLock.swift"
Cohesion: 0.27
Nodes (7): AnyObject, BiometricLockKit, BiometricService, BiometricUnlocking, PINService, PINVerifying, PINAttemptResult

### Community 107 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, EntityQuery, libraryContext(), ProjectEntity, .displayRepresentation, ProjectQuery, ModelContext, UUID

### Community 108 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 109 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 110 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 111 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 112 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 113 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 114 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 115 - "GraphCanvas"
Cohesion: 0.27
Nodes (7): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, .body

### Community 116 - ".testEveryPromptFenceHoldsAgainstPoisone"
Cohesion: 0.27
Nodes (5): ExtractionPrompt, .schema, JSONValue, String, UntrustedText

### Community 117 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 118 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 119 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 120 - "AppLockTests.swift"
Cohesion: 0.25
Nodes (4): AppLock, PINRules, PINRulesTests, PINLockKit

### Community 121 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 122 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 123 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 124 - "LibraryArchive"
Cohesion: 0.39
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 125 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 126 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 127 - "graphify_pipeline.py"
Cohesion: 0.29
Nodes (6): json, pathlib, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 128 - "LocalizedError"
Cohesion: 0.25
Nodes (8): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse

### Community 129 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 130 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 131 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 132 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 133 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 134 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 135 - "BackupError"
Cohesion: 0.29
Nodes (7): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, Int

### Community 136 - "BriefError"
Cohesion: 0.29
Nodes (7): BriefError, empty, .errorDescription, notPending, outdated, unchanged, Int

### Community 137 - "LibraryFixture"
Cohesion: 0.38
Nodes (4): LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 138 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 139 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 140 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 141 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 143 - "ExtractedGraph"
Cohesion: 0.80
Nodes (3): Entity, ExtractedGraph, Relation

### Community 144 - ".library()"
Cohesion: 0.50
Nodes (3): ModelContainer, ModelContext, ThemeStrengthCacheTests

### Community 145 - "SeededRandom"
Cohesion: 0.60
Nodes (3): SeededRandom, UInt64, RandomNumberGenerator

### Community 146 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 147 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 148 - "IntentFailure"
Cohesion: 0.40
Nodes (5): IntentFailure, .errorDescription, libraryUnavailable, noProvider, String

### Community 149 - "GitHubTokenPoll"
Cohesion: 0.50
Nodes (4): GitHubTokenPoll, pending, slowDown, token

### Community 150 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **279 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+274 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 551 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ThemeNode`, `ArticleReaderView`, `SharedInbox`, `Conversation`, `ExtractionTiers`, `PipelineRunner`, `InterestModel`, `.library()`, `.makeContainer()`, `EmbeddingModel`, `DigestBuilder`, `.load()`, `GitHubRepo`, `RetrievedPassage`, `IngestController`, `.article()`, `makeContext()`, `DigestCluster`, `GraphIndexer`, `SearchHit`, `SearchDocument`, `Source`, `RetrievalFixture`, `FakeEmbedder`?**
  _High betweenness centrality (0.046) - this node is a cross-community bridge._
- **Why does `Project` connect `Project` to `ActionRequest`, `View`, `ThemeNode`, `DigestBuilder`, `StrategyItemKind`, `ProjectSnapshot`, `Conversation`, `LibraryFixture`, `GitHubRepo`, `GitHubRepoPicker`, `.lines()`, `OnboardingProposal`, `.article()`, `GraphView`, `.makeContainer()`, `.projects()`, `makeContext()`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `ActionRequest`, `ThemeNode`, `BackupView`, `IngestError`, `RepoSync.swift`, `SharedInbox`, `ExtractionTiers`, `GitHubDeviceFlow`, `GitHubClient`, `KnowledgeSchema`, `.extract()`, `AppStore`, `.parse()`, `BYOKLLMKit`, `SourceFetcher`, `Dependency`, `ProjectSnapshot`, `PerfTrace`, `DailyBudget`, `GraphExtraction.swift`, `IngestKit`, `ParsedFeed`, `AppLock.swift`, `.score()`, `.testEveryPromptFenceHoldsAgainstPoisone`, `TopK`?**
  _High betweenness centrality (0.043) - this node is a cross-community bridge._
- **Are the 24 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 24 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _279 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ActionRequest` be split into smaller, more focused modules?**
  _Cohesion score 0.05493827160493827 - nodes in this community are weakly interconnected._
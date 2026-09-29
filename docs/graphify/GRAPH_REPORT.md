# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 163 files · ~614,709 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2912 nodes · 7482 edges · 152 communities (146 shown, 6 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 890 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- DigestBuilder
- IngestError
- ModelFallback
- .plan()
- SharedInbox
- StrategyItemKind
- DailyBudget
- Project
- RefreshEagerness
- GitHubDeviceFlow
- Source
- Conversation
- ExtractionTiers
- StrategistRunner
- KnowledgeStore
- ReferenceLedger
- ThemeNode
- Sendable
- Article
- Foundation
- String
- Digest
- .messages()
- ExtractedArticle
- SwiftData
- .run()
- GitHubClient
- .makeContainer()
- ExtractedGraph
- ActionRequest
- AppLockCoordinator
- FetchURLTool
- PipelineRunner
- SecuritySettingsSection
- Phase 5: Hardening
- View
- Pipeline module (ingestion, graph, searc
- .parse()
- .fetch()
- SourceFetcher
- .load()
- .fetch()
- .outcome()
- Choice
- .process()
- Invariant D5: Private content never goes
- Dependency
- GraphRAG
- InterestModel
- OnboardingView
- BYOKLLMKit
- FakeBiometrics
- NewConversationView
- GraphIndexer
- .testGraphQueriesDoNotScaleWithTheWholeG
- HybridSearchIndex
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- .build()
- OnboardingProposal
- Scenario
- ConversationView
- .fetchURL()
- .article()
- BriefError
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- PerfTrace
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- .refresh()
- RetrievalFixture
- Approval Before Actions
- ArticleStage
- Strategist Layer
- GitHubAccount
- SearchController
- .save()
- Kind
- CodingKeys
- SmartWard (iOS Application Target)
- LibraryArchive
- SearchDocument
- ThemeStrengthCache
- FakeTransport
- PlaybackLLM
- BackupView
- EditLinkView
- GraphSnapshot
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- .projects()
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SourceKind
- .data()
- RetrievedPassage
- AppLockController
- GitHubRepoPicker
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GitHubError
- LibraryFixture
- OnboardingReviewView
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- Identifiable
- .score()
- String
- SeededRandom
- graphify_pipeline.py
- .graphML()
- .decision()
- TopK
- FoundationModelsEntityExtractor
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- GraphExtraction.swift
- SearchHit
- AppTab
- ArchiveError
- ProposeBriefUpdateTool
- XCTestCase
- Graph View
- .body
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- .availability()
- SmartWardIntents.swift
- Living Project Brief
- .library()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- KnowledgeSchema
- Apple Intelligence Preflight
- AppStore
- ApprovalDecision
- .layout()
- Result
- Result
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 90 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 68 edges
5. `Source` - 55 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `XCTest` - 36 edges
9. `BYOKLLMKit` - 35 edges
10. `PipelineRunner` - 35 edges

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

## Communities (152 total, 6 thin omitted)

### Community 0 - "DigestBuilder"
Cohesion: 0.06
Nodes (35): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+27 more)

### Community 1 - "IngestError"
Cohesion: 0.06
Nodes (41): NSObject, IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL (+33 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - ".plan()"
Cohesion: 0.05
Nodes (49): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery, IntentAuthenticationPolicy (+41 more)

### Community 4 - "SharedInbox"
Cohesion: 0.07
Nodes (30): JSONDecoder, JSONEncoder, NSExtensionContext, SharedImport, Date, ModelContext, SharedInbox, .itemsDirectory (+22 more)

### Community 5 - "StrategyItemKind"
Cohesion: 0.07
Nodes (29): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+21 more)

### Community 6 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 7 - "Project"
Cohesion: 0.10
Nodes (28): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+20 more)

### Community 8 - "RefreshEagerness"
Cohesion: 0.06
Nodes (32): App, RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests, Scene (+24 more)

### Community 9 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (27): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+19 more)

### Community 10 - "Source"
Cohesion: 0.11
Nodes (21): FeedIngest, Bool, Date, Error, ModelContext, String, TimeInterval, RawItem (+13 more)

### Community 11 - "Conversation"
Cohesion: 0.09
Nodes (19): ContextPolicy, Bool, Chunk, Conversation, .mode, ConversationMode, brainstorm, critique (+11 more)

### Community 12 - "ExtractionTiers"
Cohesion: 0.09
Nodes (22): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, BudgetTests, Double, ModelContext (+14 more)

### Community 13 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 14 - "KnowledgeStore"
Cohesion: 0.13
Nodes (5): IngestKit, KnowledgeStore, Pipeline, GitHubConfig, XCTest

### Community 15 - "ReferenceLedger"
Cohesion: 0.12
Nodes (18): Decodable, Arguments, ReferenceContext, Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition (+10 more)

### Community 16 - "ThemeNode"
Cohesion: 0.14
Nodes (17): EntityAlias, ThemeNode, EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool (+9 more)

### Community 17 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, GitHubUser, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord (+22 more)

### Community 18 - "Article"
Cohesion: 0.10
Nodes (26): Article, ThemesRow, .body, .nodes, Connection, .id, MergeReviewView, .body (+18 more)

### Community 19 - "Foundation"
Cohesion: 0.07
Nodes (7): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security

### Community 20 - "String"
Cohesion: 0.14
Nodes (13): InterestProfile, Mention, MergeSuggestion, ReadingSignal, Bool, Date, Double, Int (+5 more)

### Community 21 - "Digest"
Cohesion: 0.14
Nodes (22): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+14 more)

### Community 22 - ".messages()"
Cohesion: 0.09
Nodes (15): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+7 more)

### Community 23 - "ExtractedArticle"
Cohesion: 0.14
Nodes (12): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, URL (+4 more)

### Community 24 - "SwiftData"
Cohesion: 0.13
Nodes (7): BackgroundTasks, ShareInbox, BriefOrigin, SwiftData, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 25 - ".run()"
Cohesion: 0.16
Nodes (15): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+7 more)

### Community 26 - "GitHubClient"
Cohesion: 0.18
Nodes (12): GitHubClient, .isAuthenticated, GitHubRepo, .id, Bool, Data, HTTPURLResponse, Set (+4 more)

### Community 27 - ".makeContainer()"
Cohesion: 0.14
Nodes (11): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+3 more)

### Community 28 - "ExtractedGraph"
Cohesion: 0.16
Nodes (14): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation, JSONValue (+6 more)

### Community 29 - "ActionRequest"
Cohesion: 0.13
Nodes (20): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+12 more)

### Community 30 - "AppLockCoordinator"
Cohesion: 0.14
Nodes (17): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINOutcome, incorrect (+9 more)

### Community 31 - "FetchURLTool"
Cohesion: 0.14
Nodes (14): AddSourceTool, .definition, .kinds, FetchURLTool, .definition, Bool, JSONValue, LLMTool (+6 more)

### Community 32 - "PipelineRunner"
Cohesion: 0.19
Nodes (12): PipelineRunner, Report, Bool, Date, Double, Int, ModelContext, Set (+4 more)

### Community 33 - "SecuritySettingsSection"
Cohesion: 0.11
Nodes (21): AppLock, BiometricLockKit, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body (+13 more)

### Community 34 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 35 - "View"
Cohesion: 0.12
Nodes (21): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+13 more)

### Community 36 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 37 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 38 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 39 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 40 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 41 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 42 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 43 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 44 - ".process()"
Cohesion: 0.12
Nodes (16): BGContinuedProcessingTask, Triage, .body, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, Int (+8 more)

### Community 45 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 46 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 47 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 48 - "InterestModel"
Cohesion: 0.20
Nodes (11): Interest, InterestModel, .isEmpty, Bool, Double, Float, String, TriageScore (+3 more)

### Community 49 - "OnboardingView"
Cohesion: 0.11
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 50 - "BYOKLLMKit"
Cohesion: 0.20
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 51 - "FakeBiometrics"
Cohesion: 0.18
Nodes (10): AppLockCoordinatorTests, FakeBiometrics, FakePIN, BiometricResult, BiometricUnavailable, BiometryType, PINAttemptResult, Result (+2 more)

### Community 52 - "NewConversationView"
Cohesion: 0.11
Nodes (18): .status, BriefRevisionStatus, accepted, pending, rejected, superseded, ChatListView, .body (+10 more)

### Community 53 - "GraphIndexer"
Cohesion: 0.19
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 54 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 55 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 56 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 57 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 58 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 59 - ".build()"
Cohesion: 0.22
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 60 - "OnboardingProposal"
Cohesion: 0.19
Nodes (11): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+3 more)

### Community 61 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 62 - "ConversationView"
Cohesion: 0.14
Nodes (13): ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText, EmptyChatHint, .body (+5 more)

### Community 63 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 64 - ".article()"
Cohesion: 0.23
Nodes (8): ArticleIndexer, FakeFullText, FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext, Set

### Community 65 - "BriefError"
Cohesion: 0.14
Nodes (15): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+7 more)

### Community 66 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 67 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 68 - "PerfTrace"
Cohesion: 0.20
Nodes (12): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+4 more)

### Community 69 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 70 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 71 - ".refresh()"
Cohesion: 0.19
Nodes (14): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+6 more)

### Community 72 - "RetrievalFixture"
Cohesion: 0.21
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 73 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 74 - "ArticleStage"
Cohesion: 0.12
Nodes (16): CaseIterable, .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched (+8 more)

### Community 75 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 76 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 77 - "SearchController"
Cohesion: 0.21
Nodes (9): T, SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID (+1 more)

### Community 78 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 79 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 80 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 81 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 82 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 83 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 84 - "ThemeStrengthCache"
Cohesion: 0.30
Nodes (10): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+2 more)

### Community 85 - "FakeTransport"
Cohesion: 0.22
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 86 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 87 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 88 - "EditLinkView"
Cohesion: 0.14
Nodes (12): EditLinkView, .body, .trimmed, NewProjectView, .body, ProjectDetailView, .body, .links (+4 more)

### Community 89 - "GraphSnapshot"
Cohesion: 0.22
Nodes (12): CGFloat, Color, GraphSnapshot, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 90 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 91 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 92 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 93 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

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

### Community 98 - "RetrievedPassage"
Cohesion: 0.27
Nodes (8): RetrievedPassage, ActionConfirmationCard, .body, SourcesList, .body, Bool, String, Void

### Community 99 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 100 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 101 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 102 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 103 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 104 - "GitHubError"
Cohesion: 0.20
Nodes (10): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+2 more)

### Community 105 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 106 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 107 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

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

### Community 112 - "Identifiable"
Cohesion: 0.20
Nodes (11): Identifiable, Filter, all, .id, starred, unread, Order, .id (+3 more)

### Community 113 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 114 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 115 - "SeededRandom"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 116 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 117 - ".graphML()"
Cohesion: 0.29
Nodes (6): GraphKit, GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 118 - ".decision()"
Cohesion: 0.33
Nodes (4): ActionTools, Set, String, ApprovalPolicyTests

### Community 119 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 120 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 121 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 122 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 123 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 124 - "GraphExtraction.swift"
Cohesion: 0.25
Nodes (3): FoundationModels, Observation, UserNotifications

### Community 125 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 126 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 127 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 128 - "ProposeBriefUpdateTool"
Cohesion: 0.25
Nodes (6): ProjectStateTool, .definition, ProposeBriefUpdateTool, .definition, LLMTool, .tools

### Community 129 - "XCTestCase"
Cohesion: 0.25
Nodes (5): NormalizedKeyTests, AddSourceToolTests, GraphExportTests, TopKTests, XCTestCase

### Community 130 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 131 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 132 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 133 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 134 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 135 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 136 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 137 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 138 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 139 - ".library()"
Cohesion: 0.47
Nodes (3): ModelContainer, ModelContext, ThemeStrengthCacheTests

### Community 140 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 141 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 143 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 144 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 145 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 146 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **306 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+301 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 603 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `Foundation` to `DigestBuilder`, `IngestError`, `SharedInbox`, `DailyBudget`, `RefreshEagerness`, `GitHubDeviceFlow`, `SmartWardIntents.swift`, `Conversation`, `KnowledgeStore`, `KnowledgeSchema`, `AppStore`, `Digest`, `ExtractedArticle`, `SwiftData`, `ExtractedGraph`, `ActionRequest`, `AppLockCoordinator`, `.parse()`, `SourceFetcher`, `.outcome()`, `Dependency`, `BYOKLLMKit`, `PerfTrace`, `.canonicalize()`, `GitHubError`, `.score()`, `.graphML()`, `TopK`, `GraphExtraction.swift`?**
  _High betweenness centrality (0.067) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `SourceFetcher`, `SmartWardIntents.swift`, `.library()`, `ThemeNode`, `AppStore`, `BYOKLLMKit`, `Foundation`, `SearchDocument`, `.graphML()`, `GraphIndexer`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `SwiftData`, `.build()`, `GraphExtraction.swift`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `DigestBuilder`, `SharedInbox`, `ArticleReaderView`, `Source`, `Conversation`, `ExtractionTiers`, `.library()`, `ThemeNode`, `String`, `Digest`, `.makeContainer()`, `PipelineRunner`, `.fetch()`, `.load()`, `GraphIndexer`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `.article()`, `.refresh()`, `RetrievalFixture`, `ArticleStage`, `SearchController`, `.save()`, `SearchDocument`, `RetrievedPassage`, `FakeEmbedder`?**
  _High betweenness centrality (0.038) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _306 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `DigestBuilder` be split into smaller, more focused modules?**
  _Cohesion score 0.06247086247086247 - nodes in this community are weakly interconnected._
- **Should `IngestError` be split into smaller, more focused modules?**
  _Cohesion score 0.05625 - nodes in this community are weakly interconnected._
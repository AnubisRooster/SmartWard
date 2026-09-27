# Graph Report - SmartWard  (2026-09-27)

## Corpus Check
- Large corpus: 146 files · ~565,386 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2653 nodes · 6843 edges · 132 communities (130 shown, 2 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 813 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- KnowledgeStore
- Sendable
- ModelFallback
- SourceKindOption
- SharedInbox
- RetrievedPassage
- Article
- .record()
- View
- OnboardingView
- ThemeNode
- LibraryFixture
- Conversation
- GitHubDeviceFlow
- Project
- StrategistRunner
- PipelineRunner
- IngestError
- PerfTrace
- ExtractedArticle
- StrategyItemKind
- ExtractionTiers
- AddSourceTool
- GitHubClient
- InterestModel
- ActionRequest
- ExtractedGraph
- ReferenceLedger
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- GraphRAG
- EmbeddingModel
- .load()
- RecordStrategyItemTool
- .dismiss()
- AppLockCoordinator
- Invariant D5: Private content never goes
- .items()
- Dependency
- Digest
- ProjectLink
- ThemeStrengthCache
- BackgroundWork
- SourceFetcher
- .fetchURL()
- DigestBuilder
- HybridSearchIndex
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- AddSourceView
- Scenario
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- .makeContainer()
- XCTestCase
- Approval Before Actions
- .body
- GitHubRepo
- Strategist Layer
- IngestController
- GitHubAccount
- DigestCluster
- DigestSummaryRequest
- .body
- Kind
- GraphSnapshot
- CodingKeys
- SmartWard (iOS Application Target)
- ContextAssembler token budget and fencin
- .data()
- SearchDocument
- .testToolsOutsideTheModeAreNeverOffered(
- BackupView
- .send()
- .canonicalize()
- SmartWardShare (Share Extension Target)
- AppLockPolicy
- .apply()
- FoundationModelsEntityExtractor
- Node
- .process()
- Choice
- SmartWard XcodeGen Project Spec
- Inference Layer
- GraphView
- LibraryArchive
- SourceKind
- FakeTransport
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- ThemeNode (SwiftData model)
- SearchHit
- GitHubError
- .render()
- FakeClock
- AppLockController
- DeveloperView
- What the Simulator Can't Show
- Presentation Layer (SwiftUI)
- FakeEmbedder
- .session()
- .apply()
- .score()
- String
- FakeSummarizer
- SourcesView
- FakeBiometrics
- Prompt-injection defense
- ArticleStage
- TopK
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .build()
- AppTab
- DailyBudget
- Graph View
- ArticleReaderView
- ReadingView
- ActivitySheet
- UntrustedText (body/attribute inside its
- Living Project Brief
- .color()
- PINOutcome
- BriefRevisionStatus
- Apple Intelligence Preflight
- .isAcceptable()
- KnowledgeSchema
- FakePIN
- graphify_pipeline.py
- AppStore
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 87 edges
2. `SwiftData` - 75 edges
3. `Project` - 69 edges
4. `Article` - 60 edges
5. `Source` - 48 edges
6. `ThemeNode` - 48 edges
7. `Conversation` - 36 edges
8. `HybridSearchIndex` - 35 edges
9. `LibraryArchive` - 34 edges
10. `SourceKind` - 33 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `SourceIntake (shared validation for adding sources)` --implements--> `add_source Tool`  [INFERRED]
  CLAUDE.md → README.md
- `LibraryArchive (versioned JSON, snapshot/restore/erase)` --implements--> `Versioned Library JSON Export`  [INFERRED]
  CLAUDE.md → README.md
- `iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement` --semantically_similar_to--> `Apple Intelligence-Capable Device Floor (iPhone 15 Pro+)`  [INFERRED] [semantically similar]
  docs/DEVICE_TESTING.md → project.yml
- `com.intelligentdesignsllc.smartward.processing Task Identifier` --shares_data_with--> `Bundle ID Prefix com.intelligentdesignsllc`  [INFERRED]
  docs/DEVICE_TESTING.md → project.yml

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

## Communities (132 total, 2 thin omitted)

### Community 0 - "KnowledgeStore"
Cohesion: 0.05
Nodes (28): Accelerate, AppIntents, BackgroundTasks, BYOKLLMKit, CommonCrypto, CryptoKit, Foundation, FoundationModels (+20 more)

### Community 1 - "Sendable"
Cohesion: 0.08
Nodes (60): Codable, Equatable, Identifiable, AliasRecord, ArchiveError, .errorDescription, newerVersion, notAnArchive (+52 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "SourceKindOption"
Cohesion: 0.06
Nodes (47): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery, IntentAuthenticationPolicy (+39 more)

### Community 4 - "SharedInbox"
Cohesion: 0.06
Nodes (30): JSONDecoder, JSONEncoder, NSExtensionContext, Result, SharedImport, Date, Int, ModelContext (+22 more)

### Community 5 - "RetrievedPassage"
Cohesion: 0.06
Nodes (39): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+31 more)

### Community 6 - "Article"
Cohesion: 0.10
Nodes (27): Article, Chunk, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal, StrategyItem (+19 more)

### Community 7 - ".record()"
Cohesion: 0.09
Nodes (29): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+21 more)

### Community 8 - "View"
Cohesion: 0.06
Nodes (40): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+32 more)

### Community 9 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 10 - "ThemeNode"
Cohesion: 0.10
Nodes (21): EntityAlias, Data, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext (+13 more)

### Community 11 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 12 - "Conversation"
Cohesion: 0.07
Nodes (27): ContextPolicy, Bool, Conversation, .mode, ConversationMode, brainstorm, critique, onboarding (+19 more)

### Community 13 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+18 more)

### Community 14 - "Project"
Cohesion: 0.14
Nodes (17): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+9 more)

### Community 15 - "StrategistRunner"
Cohesion: 0.14
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 16 - "PipelineRunner"
Cohesion: 0.14
Nodes (18): ArticleIndexer, PipelineRunner, .stages, Report, Bool, Date, Double, Int (+10 more)

### Community 17 - "IngestError"
Cohesion: 0.11
Nodes (24): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+16 more)

### Community 18 - "PerfTrace"
Cohesion: 0.11
Nodes (19): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+11 more)

### Community 19 - "ExtractedArticle"
Cohesion: 0.14
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 20 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Item (+7 more)

### Community 21 - "ExtractionTiers"
Cohesion: 0.12
Nodes (18): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 22 - "AddSourceTool"
Cohesion: 0.14
Nodes (16): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, JSONValue, LLMTool (+8 more)

### Community 23 - "GitHubClient"
Cohesion: 0.18
Nodes (10): GitHubClient, .isAuthenticated, GitHubUser, Data, HTTPURLResponse, Set, String, T (+2 more)

### Community 24 - "InterestModel"
Cohesion: 0.14
Nodes (17): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+9 more)

### Community 25 - "ActionRequest"
Cohesion: 0.13
Nodes (21): LocalizedError, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+13 more)

### Community 26 - "ExtractedGraph"
Cohesion: 0.17
Nodes (13): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+5 more)

### Community 27 - "ReferenceLedger"
Cohesion: 0.18
Nodes (13): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+5 more)

### Community 28 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 29 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 30 - "GraphRAG"
Cohesion: 0.17
Nodes (23): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, C5 Store vectors as binary Data, not JSON snapshots, C7 Explicit Mention join entity replaces many-to-many, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-11 GraphRAG every turn with why-retrieved (+15 more)

### Community 31 - "EmbeddingModel"
Cohesion: 0.17
Nodes (13): EmbeddingModel, EmbeddingProviding, String, GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date (+5 more)

### Community 32 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 33 - "RecordStrategyItemTool"
Cohesion: 0.16
Nodes (13): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, .definition (+5 more)

### Community 34 - ".dismiss()"
Cohesion: 0.12
Nodes (18): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+10 more)

### Community 35 - "AppLockCoordinator"
Cohesion: 0.19
Nodes (12): AnyObject, AppLockCoordinator, .biometryName, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService (+4 more)

### Community 36 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 37 - ".items()"
Cohesion: 0.17
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 38 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 39 - "Digest"
Cohesion: 0.15
Nodes (16): Digest, .clusters, Bool, Date, DigestController, .notificationsEnabled, Bool, ModelContext (+8 more)

### Community 40 - "ProjectLink"
Cohesion: 0.14
Nodes (12): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+4 more)

### Community 41 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 42 - "BackgroundWork"
Cohesion: 0.13
Nodes (12): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, TimeInterval, .body (+4 more)

### Community 43 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 44 - ".fetchURL()"
Cohesion: 0.23
Nodes (8): SourceEndpoint, String, URL, SourceEndpointTests, String, URL, .defaultName, .storedURL

### Community 45 - "DigestBuilder"
Cohesion: 0.21
Nodes (10): DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext, TimeInterval (+2 more)

### Community 46 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 47 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 48 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 49 - "AddSourceView"
Cohesion: 0.16
Nodes (15): CaseIterable, AddSourceView, .body, .trimmedInput, Filter, all, .id, starred (+7 more)

### Community 50 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 51 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 52 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 53 - ".makeContainer()"
Cohesion: 0.26
Nodes (6): RawItem, FetchedSource, Bool, ModelContainer, Source, FeedIngestTests

### Community 54 - "XCTestCase"
Cohesion: 0.15
Nodes (11): CanonicalURLTests, PerfTraceTests, PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void (+3 more)

### Community 55 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 56 - ".body"
Cohesion: 0.17
Nodes (13): AppLock, BiometricLockKit, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .lockBinding (+5 more)

### Community 57 - "GitHubRepo"
Cohesion: 0.19
Nodes (10): Decodable, GitHubRepo, .id, Bool, Document, RepoSnapshot, String, RepoSyncTests (+2 more)

### Community 58 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 59 - "IngestController"
Cohesion: 0.17
Nodes (12): Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set (+4 more)

### Community 60 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 61 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 62 - "DigestSummaryRequest"
Cohesion: 0.23
Nodes (9): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String (+1 more)

### Community 63 - ".body"
Cohesion: 0.12
Nodes (14): KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body, DigestSettingsSection, .body (+6 more)

### Community 64 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 65 - "GraphSnapshot"
Cohesion: 0.22
Nodes (14): CGFloat, GraphSnapshot, Connection, .id, GraphCanvas, .body, Int, UUID (+6 more)

### Community 66 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 67 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 68 - "ContextAssembler token budget and fencin"
Cohesion: 0.18
Nodes (15): B3 Extraction routing by content class, BYOKExtractor, C2 BYOKLLMKit lacks tool calling and structured output, ContextAssembler token budget and fencing, Conversation indexing pipeline, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol (+7 more)

### Community 69 - ".data()"
Cohesion: 0.21
Nodes (8): Data, Float, VectorCoding, FixedJudge, Bool, Float, String, VectorCodingTests

### Community 70 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 71 - ".testToolsOutsideTheModeAreNeverOffered("
Cohesion: 0.24
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 72 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 73 - ".send()"
Cohesion: 0.25
Nodes (8): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, LLMProvider, ModelContext, String

### Community 74 - ".canonicalize()"
Cohesion: 0.20
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL

### Community 75 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 76 - "AppLockPolicy"
Cohesion: 0.21
Nodes (9): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests (+1 more)

### Community 77 - ".apply()"
Cohesion: 0.22
Nodes (8): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval

### Community 78 - "FoundationModelsEntityExtractor"
Cohesion: 0.22
Nodes (9): ExtractionPrompt, .schema, JSONValue, ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation (+1 more)

### Community 79 - "Node"
Cohesion: 0.30
Nodes (9): Edge, ForceLayout, Node, Point, Double, Int, String, UUID (+1 more)

### Community 80 - ".process()"
Cohesion: 0.19
Nodes (11): Triage, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, ModelContext, String, TimeInterval (+3 more)

### Community 81 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 82 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 83 - "Inference Layer"
Cohesion: 0.21
Nodes (13): AppleFMKit, D3 iPhone 15 Pro minimum device, DecisionKit proposed ODK module, DecisionProviding protocol seam, Inference Layer, Jev typed decision models, LangChain - What Is Jev?, LocalLLMKit dropped from scope (+5 more)

### Community 84 - "GraphView"
Cohesion: 0.24
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 85 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 86 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 87 - "FakeTransport"
Cohesion: 0.23
Nodes (7): FakeTransport, GitHubClientTests, GitHubDeviceCodeFixture, Data, HTTPURLResponse, URLRequest, Reply

### Community 88 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 89 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 90 - "ThemeNode (SwiftData model)"
Cohesion: 0.29
Nodes (12): B2 Never auto-merge differing version tokens, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver, FR-13 Theme-clustered digest with notification, FR-17 Usage and cost ledger with daily cap, FR-7 Entity resolution and manual merge/split (+4 more)

### Community 91 - "SearchHit"
Cohesion: 0.21
Nodes (11): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body (+3 more)

### Community 92 - "GitHubError"
Cohesion: 0.17
Nodes (10): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+2 more)

### Community 93 - ".render()"
Cohesion: 0.27
Nodes (5): DigestPrompt, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 94 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 95 - "AppLockController"
Cohesion: 0.23
Nodes (7): ScenePhase, AppLockController, .isEnabled, Bool, Date, String, .body

### Community 96 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 97 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 98 - "Presentation Layer (SwiftUI)"
Cohesion: 0.22
Nodes (11): C4 ODK core packages are iOS-only, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts, FR-21 Mac companion with CloudKit sync, NFR-3 Data ownership and open formats, NFR-4 Retrieval latency under 500 ms, Phase 5 Hardening, Phase 6 Mac companion and sync (+3 more)

### Community 99 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 100 - ".session()"
Cohesion: 0.25
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 101 - ".apply()"
Cohesion: 0.36
Nodes (5): ApplyResult, RepoSync, Date, Int, ModelContext

### Community 102 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 103 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 104 - "FakeSummarizer"
Cohesion: 0.27
Nodes (7): DigestBuilderTests, DigestFixture, FakeSummarizer, Date, LLMUsage, ModelContainer, ModelContext

### Community 105 - "SourcesView"
Cohesion: 0.22
Nodes (9): SourceRow, .body, SourcesView, .body, .following, .listed, .paused, .suggested (+1 more)

### Community 106 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): BiometricResult, BiometricUnavailable, BiometryType, FakeBiometrics, Result, Void

### Community 107 - "Prompt-injection defense"
Cohesion: 0.29
Nodes (10): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage, NFR-7 Injection-safe tool execution (+2 more)

### Community 108 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 109 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 110 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 111 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 112 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 113 - ".build()"
Cohesion: 0.28
Nodes (7): Scope, all, recent, source, Bool, Date, Set

### Community 114 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 115 - "DailyBudget"
Cohesion: 0.36
Nodes (5): DailyBudget, BudgetTests, Double, ModelContext, String

### Community 116 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 117 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 118 - "ReadingView"
Cohesion: 0.25
Nodes (8): ReadingView, .emptyState, .filteredOutCount, .hasFollowedSources, .reading, .visible, Bool, Int

### Community 119 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 120 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 121 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 122 - ".color()"
Cohesion: 0.40
Nodes (4): Color, .body, ThemeStyle, .body

### Community 123 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 124 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 125 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 127 - "KnowledgeSchema"
Cohesion: 0.67
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 128 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 129 - "graphify_pipeline.py"
Cohesion: 0.67
Nodes (3): keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…

### Community 130 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **275 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+270 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 526 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **2 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `KnowledgeStore` to `SharedInbox`, `Article`, `.record()`, `GitHubDeviceFlow`, `IngestError`, `PerfTrace`, `ExtractedArticle`, `StrategyItemKind`, `ExtractionTiers`, `ActionRequest`, `AppLockCoordinator`, `.items()`, `Dependency`, `SourceFetcher`, `.body`, `.canonicalize()`, `GitHubError`, `.render()`, `.session()`, `.score()`, `TopK`?**
  _High betweenness centrality (0.056) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `.session()`, `RetrievedPassage`, `SearchDocument`, `ThemeStrengthCache`, `ThemeNode`, `SourceFetcher`, `StrategistRunner`, `StrategyItemKind`, `EmbeddingModel`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Why does `SwiftData` connect `KnowledgeStore` to `Article`, `.record()`?**
  _High betweenness centrality (0.037) - this node is a cross-community bridge._
- **Are the 21 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 21 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _275 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `KnowledgeStore` be split into smaller, more focused modules?**
  _Cohesion score 0.053838484546360914 - nodes in this community are weakly interconnected._
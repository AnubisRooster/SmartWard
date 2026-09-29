# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 165 files · ~620,959 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2931 nodes · 7526 edges · 164 communities (160 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 893 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- DigestBuilder
- ModelFallback
- .record()
- SourceKindOption
- GitHubClient
- KnowledgeStore
- GitHubDeviceFlow
- String
- StrategistRunner
- FetchURLTool
- IngestError
- PipelineRunner
- GraphIndexer
- ExtractedGraph
- RetrievedPassage
- Sendable
- SwiftUI
- BriefRevision
- .messages()
- SwiftData
- ThemeNode
- ConversationView
- Digest
- .dismiss()
- Identifiable
- ExtractedArticle
- StrategyItemKind
- .run()
- RawItem
- Project
- ActionRequest
- SharedInbox
- makeContext()
- Article
- ReferenceLedger
- OnboardingProposal
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- PerfTrace
- .parse()
- SourceFetcher
- .load()
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- Dependency
- Conversation
- InterestModel
- BYOKLLMKit
- GraphRAG
- .makeContainer()
- BriefError
- .article()
- BriefViews.swift
- FakeBiometrics
- HybridSearchIndex
- AppLockCoordinator
- ProjectLink
- EmbeddingModel
- .build()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- EntityResolver
- Scenario
- View
- BackgroundWork
- .fetchURL()
- SearchHit
- PlaybackLLM
- SearchDocument
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- .fetch()
- Node
- Approval Before Actions
- Strategist Layer
- .refresh()
- ShareModel
- GitHubAccount
- .plan()
- OnboardingView
- CodingKeys
- SmartWard (iOS Application Target)
- RedirectPolicy
- LibraryArchive
- .process()
- BackupView
- GraphSnapshot
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- .projects()
- Source
- .index()
- AppLockController
- RefreshEagerness
- Choice
- SmartWard XcodeGen Project Spec
- SourceKind
- SecuritySettingsSection
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .graphML()
- .seal()
- .text()
- StepProgress
- FakeClock
- LibraryFixture
- OnboardingReviewView
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .importItems()
- .score()
- String
- XCTestCase
- AppLock.swift
- graphify_pipeline.py
- AppLockPolicy
- TopK
- ThemeDetailView
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .documents()
- RelevanceJudging
- AppTab
- AddSourceView
- ArchiveError
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- .availability()
- BackupError
- .update()
- SmartWardIntents.swift
- Living Project Brief
- .color()
- BriefRevisionStatus
- ExtractionTier
- .importPending()
- .send()
- ProviderKeyRow
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- GraphExtraction.swift
- .isAcceptable()
- SeededRandom
- Apple Intelligence Preflight
- FoundationModelsEntityExtractor
- ComingSoonView
- KnowledgeSchema
- ApprovalDecision
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 90 edges
2. `SwiftData` - 77 edges
3. `Article` - 69 edges
4. `Project` - 68 edges
5. `Source` - 55 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `XCTest` - 37 edges
9. `BYOKLLMKit` - 35 edges
10. `PipelineRunner` - 35 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `SourceIntake (shared validation for adding sources)` --implements--> `add_source Tool`  [INFERRED]
  CLAUDE.md → README.md
- `LibraryArchive (versioned JSON, snapshot/restore/erase)` --implements--> `Versioned Library JSON Export`  [INFERRED]
  CLAUDE.md → README.md
- `iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement` --semantically_similar_to--> `Apple Intelligence-Capable Device Floor (iPhone 15 Pro+)`  [INFERRED] [semantically similar]
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

## Communities (164 total, 4 thin omitted)

### Community 0 - "DigestBuilder"
Cohesion: 0.06
Nodes (35): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+27 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 3 - "SourceKindOption"
Cohesion: 0.07
Nodes (36): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery, IntentAuthenticationPolicy (+28 more)

### Community 4 - "GitHubClient"
Cohesion: 0.12
Nodes (17): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+9 more)

### Community 5 - "KnowledgeStore"
Cohesion: 0.12
Nodes (5): IngestKit, KnowledgeStore, Pipeline, RetrievalKit, XCTest

### Community 6 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 7 - "String"
Cohesion: 0.13
Nodes (22): Chunk, InterestProfile, Mention, Message, ReadingSignal, StrategyItem, .status, StrategyItemStatus (+14 more)

### Community 8 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 9 - "FetchURLTool"
Cohesion: 0.10
Nodes (18): ActionTools, AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool (+10 more)

### Community 10 - "IngestError"
Cohesion: 0.11
Nodes (25): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+17 more)

### Community 11 - "PipelineRunner"
Cohesion: 0.11
Nodes (23): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+15 more)

### Community 12 - "GraphIndexer"
Cohesion: 0.10
Nodes (22): DailyBudget, ExtractionTiers, GraphIndexer, .suggestionsAdded, Date, BudgetTests, Double, ModelContext (+14 more)

### Community 13 - "ExtractedGraph"
Cohesion: 0.12
Nodes (17): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation (+9 more)

### Community 14 - "RetrievedPassage"
Cohesion: 0.11
Nodes (20): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+12 more)

### Community 15 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 16 - "SwiftUI"
Cohesion: 0.08
Nodes (14): AppLock, BackgroundTasks, Observation, PINLockKit, ShareInbox, LockScreen, PrivacyCover, .body (+6 more)

### Community 17 - "BriefRevision"
Cohesion: 0.15
Nodes (13): BriefRevision, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date, LLMCompleting (+5 more)

### Community 18 - ".messages()"
Cohesion: 0.09
Nodes (16): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+8 more)

### Community 19 - "SwiftData"
Cohesion: 0.11
Nodes (7): CommonCrypto, CryptoKit, Foundation, NaturalLanguage, Security, GitHubConfig, SwiftData

### Community 20 - "ThemeNode"
Cohesion: 0.14
Nodes (12): EntityAlias, MergeSuggestion, Data, ThemeEdge, ThemeNode, GraphEditing, ModelContext, GraphEditingTests (+4 more)

### Community 21 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 22 - "Digest"
Cohesion: 0.14
Nodes (21): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+13 more)

### Community 23 - ".dismiss()"
Cohesion: 0.09
Nodes (22): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+14 more)

### Community 24 - "Identifiable"
Cohesion: 0.09
Nodes (27): CaseIterable, Identifiable, Filter, all, .id, starred, unread, Order (+19 more)

### Community 25 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 26 - "StrategyItemKind"
Cohesion: 0.14
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 27 - ".run()"
Cohesion: 0.16
Nodes (15): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+7 more)

### Community 28 - "RawItem"
Cohesion: 0.16
Nodes (12): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+4 more)

### Community 29 - "Project"
Cohesion: 0.16
Nodes (13): Project, Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool (+5 more)

### Community 30 - "ActionRequest"
Cohesion: 0.13
Nodes (20): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+12 more)

### Community 31 - "SharedInbox"
Cohesion: 0.15
Nodes (13): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+5 more)

### Community 32 - "makeContext()"
Cohesion: 0.12
Nodes (8): ContextPolicy, Bool, ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests, ModelContainer, ModelContext

### Community 33 - "Article"
Cohesion: 0.12
Nodes (18): Article, Int, ModelContainer, ModelContext, ArticleRow, .body, .content, .relevancePercent (+10 more)

### Community 34 - "ReferenceLedger"
Cohesion: 0.17
Nodes (13): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+5 more)

### Community 35 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 36 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 37 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 38 - "PerfTrace"
Cohesion: 0.15
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 39 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 40 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 41 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 42 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 43 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 44 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 45 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 46 - "Conversation"
Cohesion: 0.13
Nodes (20): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+12 more)

### Community 47 - "InterestModel"
Cohesion: 0.18
Nodes (14): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+6 more)

### Community 48 - "BYOKLLMKit"
Cohesion: 0.18
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 49 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 50 - ".makeContainer()"
Cohesion: 0.18
Nodes (10): Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests (+2 more)

### Community 51 - "BriefError"
Cohesion: 0.13
Nodes (16): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+8 more)

### Community 52 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 53 - "BriefViews.swift"
Cohesion: 0.17
Nodes (15): BriefController, BriefEditorView, .body, BriefHistoryView, .body, BriefOrigin, BriefReviewView, .body (+7 more)

### Community 54 - "FakeBiometrics"
Cohesion: 0.17
Nodes (11): BiometricLockKit, AppLockCoordinatorTests, FakeBiometrics, FakePIN, BiometricResult, BiometricUnavailable, BiometryType, PINAttemptResult (+3 more)

### Community 55 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+4 more)

### Community 56 - "AppLockCoordinator"
Cohesion: 0.15
Nodes (14): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, PINOutcome, incorrect (+6 more)

### Community 57 - "ProjectLink"
Cohesion: 0.17
Nodes (9): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+1 more)

### Community 58 - "EmbeddingModel"
Cohesion: 0.17
Nodes (11): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ArticleIndexer, ModelContext (+3 more)

### Community 59 - ".build()"
Cohesion: 0.22
Nodes (12): Bool, Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval (+4 more)

### Community 60 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 61 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 62 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 63 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 64 - "View"
Cohesion: 0.17
Nodes (17): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+9 more)

### Community 65 - "BackgroundWork"
Cohesion: 0.16
Nodes (10): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Date, String (+2 more)

### Community 66 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 67 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 68 - "PlaybackLLM"
Cohesion: 0.16
Nodes (11): Set, answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse (+3 more)

### Community 69 - "SearchDocument"
Cohesion: 0.21
Nodes (9): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update (+1 more)

### Community 70 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 71 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 72 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 73 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 74 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 75 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 76 - "Node"
Cohesion: 0.22
Nodes (12): Edge, Node, Scope, all, recent, source, Date, Double (+4 more)

### Community 77 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 78 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 79 - ".refresh()"
Cohesion: 0.20
Nodes (14): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+6 more)

### Community 80 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 81 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 82 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 83 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 84 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 85 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 86 - "RedirectPolicy"
Cohesion: 0.16
Nodes (11): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+3 more)

### Community 87 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 88 - ".process()"
Cohesion: 0.19
Nodes (9): Triage, .body, ExtractionSettings, PipelineController, .strength, Int, ModelContext, TimeInterval (+1 more)

### Community 89 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 90 - "GraphSnapshot"
Cohesion: 0.24
Nodes (11): CGFloat, ForceLayout, GraphSnapshot, Point, GraphCanvas, .body, Void, ThemeList (+3 more)

### Community 91 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 92 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 93 - "GraphView"
Cohesion: 0.23
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 94 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 95 - "Source"
Cohesion: 0.25
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 96 - ".index()"
Cohesion: 0.22
Nodes (6): GraphLinker, Result, Int, ModelContext, String, UUID

### Community 97 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 98 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 99 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 100 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 101 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 102 - "SecuritySettingsSection"
Cohesion: 0.19
Nodes (12): SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding, Double (+4 more)

### Community 103 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL

### Community 104 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 105 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 106 - ".graphML()"
Cohesion: 0.23
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 107 - ".seal()"
Cohesion: 0.33
Nodes (7): EncryptedBackup, Data, LibraryArchive, String, UInt32, SymmetricKey, UInt8

### Community 108 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 109 - "StepProgress"
Cohesion: 0.21
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 110 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 111 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 112 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 113 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 114 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 115 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 116 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 117 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 118 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 119 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 120 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 121 - "XCTestCase"
Cohesion: 0.18
Nodes (6): CanonicalURLTests, PublicHostTests, AddSourceToolTests, TopKTests, BriefDiffTests, XCTestCase

### Community 122 - "AppLock.swift"
Cohesion: 0.31
Nodes (6): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, PINAttemptResult

### Community 123 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 124 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 125 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 126 - "ThemeDetailView"
Cohesion: 0.31
Nodes (8): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions

### Community 127 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 128 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 129 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 130 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 131 - "RelevanceJudging"
Cohesion: 0.25
Nodes (7): RelevanceJudging, FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 132 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 133 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 134 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 135 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 136 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 137 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 138 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 139 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 140 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 141 - "BackupError"
Cohesion: 0.29
Nodes (7): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, Int

### Community 142 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 143 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 144 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 145 - ".color()"
Cohesion: 0.40
Nodes (4): Color, .body, ThemeStyle, .body

### Community 146 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 147 - "ExtractionTier"
Cohesion: 0.47
Nodes (5): ExtractionTier, byok, onDevice, FakeSummarizer, LLMUsage

### Community 148 - ".importPending()"
Cohesion: 0.47
Nodes (3): ShareIntake, Int, ModelContext

### Community 149 - ".send()"
Cohesion: 0.33
Nodes (4): Data, HTTPURLResponse, URLRequest, Reply

### Community 150 - "ProviderKeyRow"
Cohesion: 0.33
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 151 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 152 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 155 - "SeededRandom"
Cohesion: 0.60
Nodes (3): SeededRandom, UInt64, RandomNumberGenerator

### Community 156 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 157 - "FoundationModelsEntityExtractor"
Cohesion: 0.70
Nodes (5): FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 158 - "ComingSoonView"
Cohesion: 0.40
Nodes (4): ComingSoonView, .body, RootView, String

### Community 159 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 160 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 161 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **309 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+304 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 607 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `DigestBuilder`, `GitHubClient`, `KnowledgeStore`, `GitHubDeviceFlow`, `String`, `IngestError`, `ExtractedGraph`, `SmartWardIntents.swift`, `SwiftUI`, `Digest`, `ExtractedArticle`, `GraphExtraction.swift`, `Project`, `ActionRequest`, `SharedInbox`, `makeContext()`, `PerfTrace`, `.parse()`, `SourceFetcher`, `.outcome()`, `Dependency`, `BYOKLLMKit`, `ProjectLink`, `SearchDocument`, `RedirectPolicy`, `.canonicalize()`, `.graphML()`, `.text()`, `StepProgress`, `.score()`, `AppLock.swift`, `TopK`?**
  _High betweenness centrality (0.077) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `.index()`, `makeContext()`, `Article`, `SearchDocument`, `SourceFetcher`, `StrategistRunner`, `.graphML()`, `Node`, `RetrievedPassage`, `SmartWardIntents.swift`, `BYOKLLMKit`, `SwiftUI`, `SwiftData`, `ThemeNode`, `BriefViews.swift`, `GraphExtraction.swift`, `Project`, `EntityResolver`?**
  _High betweenness centrality (0.037) - this node is a cross-community bridge._
- **Why does `SwiftData` connect `SwiftData` to `makeContext()`, `SearchDocument`, `KnowledgeStore`, `String`, `SmartWardIntents.swift`, `BYOKLLMKit`, `SwiftUI`, `BriefViews.swift`, `Digest`, `GraphExtraction.swift`?**
  _High betweenness centrality (0.034) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _309 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `DigestBuilder` be split into smaller, more focused modules?**
  _Cohesion score 0.058823529411764705 - nodes in this community are weakly interconnected._
- **Should `ModelFallback` be split into smaller, more focused modules?**
  _Cohesion score 0.05628415300546448 - nodes in this community are weakly interconnected._
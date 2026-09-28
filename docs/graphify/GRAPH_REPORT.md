# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 150 files · ~579,808 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2726 nodes · 7016 edges · 152 communities (148 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 855 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ModelFallback
- Project
- DailyBudget
- String
- OnboardingView
- LibraryFixture
- GitHubDeviceFlow
- KnowledgeStore
- StrategistRunner
- View
- IngestError
- .makeContainer()
- Sendable
- GitHubClient
- GraphView
- .dismiss()
- ReferenceLedger
- GraphIndexer
- PipelineRunner
- Conversation
- ExtractedGraph
- GraphSnapshot
- FetchURLTool
- InterestModel
- Foundation
- OnboardingProposal
- RawItem
- .fetch()
- .parse()
- ExtractedArticle
- ThemeNode
- Phase 5: Hardening
- BYOKLLMKit
- Pipeline module (ingestion, graph, searc
- PerfTrace
- SourceFetcher
- .load()
- Invariant D5: Private content never goes
- SharedInbox
- Dependency
- RecordStrategyItemTool
- ProjectSnapshot
- ActionRequest
- GraphRAG
- .extract()
- .testGraphQueriesDoNotScaleWithTheWholeG
- RetrievedPassage
- FakeExtractor
- HybridSearchIndex
- .fetchURL()
- XCTestCase
- .process()
- .article()
- SecuritySettingsSection
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- makeContext()
- Digest
- DigestSummaryRequest
- .build()
- Scenario
- .send()
- Observation
- SearchDocument
- AppLockCoordinator
- CaseIterable
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- EntityResolver
- Approval Before Actions
- .importPending()
- Strategist Layer
- LocalizedError
- ShareModel
- DigestBuilder
- .build()
- SearchHit
- .body
- Kind
- SwiftUI
- CodingKeys
- SmartWard (iOS Application Target)
- GitHubAccount
- .plan()
- .lines()
- PlaybackLLM
- SmartWardIntents.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- RefreshEagerness
- Choice
- BackupView
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SourceKind
- StrategyItemKind
- FakeTransport
- AppLockController
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- FakePIN
- FakeClock
- OnboardingReviewView
- DeveloperView
- .buildIfDue()
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .graphML()
- .importItems()
- .render()
- String
- SmartWardApp
- SourceKindOption
- LibraryArchive
- ArticleStage
- TopK
- FakeBiometrics
- RetrievalFixture
- FoundationModelsEntityExtractor
- ProjectEntity
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- GitHubError
- EmbeddingModel
- .documents()
- AddSourceView
- ActivitySheet
- graphify_pipeline.py
- Graph View
- ArticleReaderView
- DigestClusterSection
- UntrustedText (body/attribute inside its
- .availability()
- .data()
- SeededRandom
- Living Project Brief
- .perform()
- PINOutcome
- .color()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- Apple Intelligence Preflight
- SharedInboxTests
- IntentFailure
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 89 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 66 edges
5. `Source` - 53 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 36 edges
8. `LibraryArchive` - 34 edges
9. `ProjectLink` - 34 edges
10. `HybridSearchIndex` - 33 edges

## Surprising Connections (you probably didn't know these)
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (152 total, 4 thin omitted)

### Community 0 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 1 - "Project"
Cohesion: 0.08
Nodes (33): Project, ProjectBrief, StrategyItem, BriefEditing, BriefError, empty, .errorDescription, notPending (+25 more)

### Community 2 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 3 - "String"
Cohesion: 0.11
Nodes (31): Set, BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded (+23 more)

### Community 4 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 5 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 6 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+18 more)

### Community 7 - "KnowledgeStore"
Cohesion: 0.16
Nodes (5): IngestKit, KnowledgeStore, Pipeline, SwiftData, XCTest

### Community 8 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 9 - "View"
Cohesion: 0.10
Nodes (30): Article, Source, GraphSnapshotTests, LockScreen, PrivacyCover, .body, Bool, ArticleRow (+22 more)

### Community 10 - "IngestError"
Cohesion: 0.11
Nodes (25): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+17 more)

### Community 11 - ".makeContainer()"
Cohesion: 0.11
Nodes (15): Bool, ModelContainer, String, FetchedPageImport, Bool, Date, ModelContext, URL (+7 more)

### Community 12 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 13 - "GitHubClient"
Cohesion: 0.14
Nodes (15): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, Bool, Data (+7 more)

### Community 14 - "GraphView"
Cohesion: 0.11
Nodes (27): Hashable, Connection, .id, GraphView, .asList, .body, .graphScope, RefreshKey (+19 more)

### Community 15 - ".dismiss()"
Cohesion: 0.09
Nodes (24): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+16 more)

### Community 16 - "ReferenceLedger"
Cohesion: 0.16
Nodes (14): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+6 more)

### Community 17 - "GraphIndexer"
Cohesion: 0.13
Nodes (17): EntityExtracting, ExtractionPrompt, .schema, ExtractionTier, byok, onDevice, ExtractionTiers, JSONValue (+9 more)

### Community 18 - "PipelineRunner"
Cohesion: 0.14
Nodes (16): FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext, Set (+8 more)

### Community 19 - "Conversation"
Cohesion: 0.11
Nodes (23): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+15 more)

### Community 20 - "ExtractedGraph"
Cohesion: 0.15
Nodes (13): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+5 more)

### Community 21 - "GraphSnapshot"
Cohesion: 0.16
Nodes (18): CGFloat, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all (+10 more)

### Community 22 - "FetchURLTool"
Cohesion: 0.14
Nodes (15): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool, JSONValue (+7 more)

### Community 23 - "InterestModel"
Cohesion: 0.16
Nodes (13): Bool, Interest, InterestModel, .isEmpty, Bool, Double, Float, ModelContext (+5 more)

### Community 24 - "Foundation"
Cohesion: 0.10
Nodes (10): CommonCrypto, CryptoKit, Foundation, NaturalLanguage, KnowledgeSchema, .schema, PersistentModel, RetrievalKit (+2 more)

### Community 25 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 26 - "RawItem"
Cohesion: 0.16
Nodes (12): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+4 more)

### Community 27 - ".fetch()"
Cohesion: 0.17
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 28 - ".parse()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 29 - "ExtractedArticle"
Cohesion: 0.11
Nodes (16): ExtractedArticle, Date, Bool, URL, FullTextError, .errorDescription, nothingMore, IngestController (+8 more)

### Community 30 - "ThemeNode"
Cohesion: 0.16
Nodes (9): EntityAlias, Data, ThemeNode, GraphEditing, ModelContext, GraphEditingTests, Date, MergeReviewView (+1 more)

### Community 31 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 32 - "BYOKLLMKit"
Cohesion: 0.12
Nodes (9): BYOKLLMKit, FoundationModels, ModelCatalogKit, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, StrategistCore (+1 more)

### Community 33 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 34 - "PerfTrace"
Cohesion: 0.15
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 35 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 36 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 37 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 38 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 39 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 40 - "RecordStrategyItemTool"
Cohesion: 0.16
Nodes (12): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue (+4 more)

### Community 41 - "ProjectSnapshot"
Cohesion: 0.17
Nodes (8): Item, ProjectSnapshot, StrategistPrompt, Bool, Set, String, .system, StrategistPromptTests

### Community 42 - "ActionRequest"
Cohesion: 0.16
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 43 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 44 - ".extract()"
Cohesion: 0.22
Nodes (7): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, Unicode

### Community 45 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 46 - "RetrievedPassage"
Cohesion: 0.16
Nodes (16): RetrievedPassage, ActionConfirmationCard, .body, .body, EmptyChatHint, .body, .purpose, MessageRow (+8 more)

### Community 47 - "FakeExtractor"
Cohesion: 0.15
Nodes (13): FakeCompletion, FakeExtractor, GraphIndexingTests, AsyncThrowingStream, Bool, Error, Int, LLMRequest (+5 more)

### Community 48 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+4 more)

### Community 49 - ".fetchURL()"
Cohesion: 0.23
Nodes (7): SourceEndpoint, String, URL, SourceEndpointTests, String, URL, AddSourceToolTests

### Community 50 - "XCTestCase"
Cohesion: 0.13
Nodes (12): Date, Double, TimeInterval, ThemeStrength, NormalizedKeyTests, TimeInterval, ThemeStrengthTests, ModelContainer (+4 more)

### Community 51 - ".process()"
Cohesion: 0.12
Nodes (16): Strength, balanced, off, strict, .threshold, Triage, FoundationModelsRelevanceJudge, PipelineController (+8 more)

### Community 52 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 53 - "SecuritySettingsSection"
Cohesion: 0.15
Nodes (15): AppLock, BiometricLockKit, PINLockKit, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView (+7 more)

### Community 54 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 55 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 56 - "makeContext()"
Cohesion: 0.15
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 57 - "Digest"
Cohesion: 0.25
Nodes (13): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+5 more)

### Community 58 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (10): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider, LLMUsage (+2 more)

### Community 59 - ".build()"
Cohesion: 0.24
Nodes (11): Bool, Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval (+3 more)

### Community 60 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 61 - ".send()"
Cohesion: 0.20
Nodes (11): CheckedContinuation, Never, ActionTools, Set, ChatController, Bool, LLMCompleting, LLMProvider (+3 more)

### Community 62 - "Observation"
Cohesion: 0.12
Nodes (12): Observation, AppNavigation, AppTab, chat, graph, projects, reading, today (+4 more)

### Community 63 - "SearchDocument"
Cohesion: 0.21
Nodes (9): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update (+1 more)

### Community 64 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService, PINVerifying (+2 more)

### Community 65 - "CaseIterable"
Cohesion: 0.12
Nodes (17): CaseIterable, .status, StrategyItemStatus, done, invalidated, open, superseded, Filter (+9 more)

### Community 66 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 67 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 68 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 69 - "EntityResolver"
Cohesion: 0.26
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 70 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 71 - ".importPending()"
Cohesion: 0.19
Nodes (8): BGContinuedProcessingTask, .body, BackgroundWork, ShareIntake, Int, ModelContext, TimeInterval, .body

### Community 72 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 73 - "LocalizedError"
Cohesion: 0.12
Nodes (14): LocalizedError, ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int, RestoreError (+6 more)

### Community 74 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 75 - "DigestBuilder"
Cohesion: 0.24
Nodes (9): DigestBuilder, DigestPrompt, DigestSummarizing, Group, Bool, Date, TimeInterval, UUID (+1 more)

### Community 76 - ".build()"
Cohesion: 0.18
Nodes (8): ModelContext, DigestBuilderTests, DigestFixture, FakeSummarizer, Date, LLMUsage, ModelContainer, ModelContext

### Community 77 - "SearchHit"
Cohesion: 0.22
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 78 - ".body"
Cohesion: 0.13
Nodes (11): GitHubSettingsSection, ReadingSettingsSection, .body, DigestSettingsSection, .body, ProviderKeyRow, .body, SettingsView (+3 more)

### Community 79 - "Kind"
Cohesion: 0.15
Nodes (14): ExportView, Kind, .detail, .fileExtension, graph, .id, library, projects (+6 more)

### Community 80 - "SwiftUI"
Cohesion: 0.16
Nodes (5): BackgroundTasks, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 81 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 82 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 83 - "GitHubAccount"
Cohesion: 0.23
Nodes (9): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+1 more)

### Community 84 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 85 - ".lines()"
Cohesion: 0.21
Nodes (10): BriefDiff, Line, added, removed, same, Int, BriefDiffTests, BriefDiffView (+2 more)

### Community 86 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 87 - "SmartWardIntents.swift"
Cohesion: 0.24
Nodes (13): AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+5 more)

### Community 88 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 89 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 90 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 91 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 92 - "BackupView"
Cohesion: 0.20
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 93 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 94 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 95 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 96 - "StrategyItemKind"
Cohesion: 0.19
Nodes (10): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+2 more)

### Community 97 - "FakeTransport"
Cohesion: 0.23
Nodes (7): FakeTransport, GitHubClientTests, GitHubDeviceCodeFixture, Data, HTTPURLResponse, URLRequest, Reply

### Community 98 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 99 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 100 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 101 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 102 - "FakePIN"
Cohesion: 0.27
Nodes (5): BiometricResult, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 103 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 104 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 105 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 106 - ".buildIfDue()"
Cohesion: 0.24
Nodes (8): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, TodayView, .body

### Community 107 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 108 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 109 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 110 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 111 - ".graphML()"
Cohesion: 0.25
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 112 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 113 - ".render()"
Cohesion: 0.33
Nodes (3): ReferenceContext, String, UntrustedText

### Community 114 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 115 - "SmartWardApp"
Cohesion: 0.20
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 116 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 117 - "LibraryArchive"
Cohesion: 0.33
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 118 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 119 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 120 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 121 - "RetrievalFixture"
Cohesion: 0.29
Nodes (6): GraphRetrieverTests, RetrievalFixture, Bool, ModelContainer, ModelContext, UUID

### Community 122 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 123 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 124 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 125 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 126 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 127 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 128 - "EmbeddingModel"
Cohesion: 0.33
Nodes (5): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, Int

### Community 129 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 130 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 131 - "ActivitySheet"
Cohesion: 0.32
Nodes (6): Any, Context, ActivitySheet, .body, UIActivityViewController, UIViewControllerRepresentable

### Community 132 - "graphify_pipeline.py"
Cohesion: 0.29
Nodes (6): json, pathlib, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 133 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 134 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 135 - "DigestClusterSection"
Cohesion: 0.32
Nodes (6): DigestClusterSection, .body, DigestSections, .body, String, UUID

### Community 136 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 137 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 138 - ".data()"
Cohesion: 0.52
Nodes (3): Data, Float, VectorCoding

### Community 139 - "SeededRandom"
Cohesion: 0.38
Nodes (4): SeededRandom, UInt64, TopKTests, RandomNumberGenerator

### Community 140 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 141 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 142 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 143 - ".color()"
Cohesion: 0.50
Nodes (3): Color, .body, ThemeStyle

### Community 144 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 145 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 147 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 149 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **288 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+283 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 568 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `Foundation` to `DailyBudget`, `String`, `LibraryFixture`, `GitHubDeviceFlow`, `KnowledgeStore`, `IngestError`, `GitHubClient`, `ReferenceLedger`, `GraphIndexer`, `GraphSnapshot`, `.parse()`, `ExtractedArticle`, `BYOKLLMKit`, `PerfTrace`, `SourceFetcher`, `SharedInbox`, `Dependency`, `ProjectSnapshot`, `XCTestCase`, `SecuritySettingsSection`, `makeContext()`, `Digest`, `.build()`, `Observation`, `SearchDocument`, `AppLockCoordinator`, `DigestBuilder`, `.body`, `SwiftUI`, `SmartWardIntents.swift`, `.canonicalize()`, `.graphML()`, `.render()`, `LibraryArchive`, `TopK`?**
  _High betweenness centrality (0.068) - this node is a cross-community bridge._
- **Why does `Article` connect `View` to `EmbeddingModel`, `String`, `ArticleReaderView`, `DigestClusterSection`, `.makeContainer()`, `.dismiss()`, `GraphIndexer`, `PipelineRunner`, `InterestModel`, `.fetch()`, `ExtractedArticle`, `ThemeNode`, `.load()`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `RetrievedPassage`, `FakeExtractor`, `XCTestCase`, `.article()`, `makeContext()`, `DigestSummaryRequest`, `Scenario`, `SearchDocument`, `DigestBuilder`, `SearchHit`, `FakeEmbedder`, `.importItems()`, `ArticleStage`, `RetrievalFixture`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Project`, `StrategistRunner`, `View`, `ReferenceLedger`, `GraphIndexer`, `Conversation`, `GraphSnapshot`, `Foundation`, `ThemeNode`, `BYOKLLMKit`, `SourceFetcher`, `ProjectSnapshot`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `XCTestCase`, `.build()`, `Observation`, `SearchDocument`, `DigestBuilder`, `.body`, `SwiftUI`, `SmartWardIntents.swift`, `.graphML()`?**
  _High betweenness centrality (0.036) - this node is a cross-community bridge._
- **Are the 24 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 24 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _288 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ModelFallback` be split into smaller, more focused modules?**
  _Cohesion score 0.05737704918032787 - nodes in this community are weakly interconnected._
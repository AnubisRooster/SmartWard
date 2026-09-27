# Graph Report - SmartWard  (2026-09-27)

## Corpus Check
- Large corpus: 146 files · ~567,723 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2682 nodes · 6901 edges · 156 communities (151 shown, 5 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 842 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ModelFallback
- RetrievedPassage
- DailyBudget
- IngestError
- OnboardingView
- View
- LibraryFixture
- GitHubDeviceFlow
- StrategistRunner
- ReferenceLedger
- SwiftData
- Sendable
- String
- Project
- .makeContainer()
- BYOKLLMKit
- GitHubClient
- ThemeNode
- StrategyItemKind
- ActionRequest
- KnowledgeStore
- InterestModel
- .extract()
- Conversation
- GraphIndexer
- .body
- ExtractedGraph
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .fetch()
- Invariant D5: Private content never goes
- SharedInbox
- HybridSearchIndex
- Dependency
- Digest
- .load()
- BriefError
- XCTestCase
- PerfTrace
- GraphRAG
- .fetchURL()
- ConversationMode
- DigestBuilder
- RecordStrategyItemTool
- BriefViews.swift
- LexicalIndex
- OnboardingProposal
- RawItem
- SourceFetcher
- GraphNeighborsTool
- Scenario
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- ProjectLink
- DigestSummaryRequest
- SearchDocument
- ThemeStrengthCache
- GraphSnapshot
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppLockCoordinator
- Article
- EntityResolver
- .build()
- Approval Before Actions
- .importPending()
- Strategist Layer
- IngestController
- GitHubAccount
- DigestCluster
- PipelineRunner
- Kind
- AppLock.swift
- CodingKeys
- SmartWard (iOS Application Target)
- .render()
- SearchHit
- .plan()
- BackupView
- .send()
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- ShareModel
- Source
- .process()
- FakeTransport
- PlaybackLLM
- Choice
- AskStrategistIntent
- .canonicalize()
- SmartWard XcodeGen Project Spec
- LibraryArchive
- SourceKind
- .data()
- .article()
- AppLockController
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- ParsedFeed
- OnboardingReviewView
- DeveloperView
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .parse()
- .importItems()
- .score()
- SourceKindOption
- AppLockPolicy
- ArticleStage
- TopK
- FakeBiometrics
- AppTab
- FoundationModelsEntityExtractor
- SmartWardApp
- ProjectEntity
- ShareViewController.swift
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- GitHubError
- .clusters()
- EmbeddingModel
- .graphML()
- ThemeDetailView
- AddSourceView
- Observation
- ArchiveError
- .vector()
- Graph View
- ArticleReaderView
- ActivitySheet
- UntrustedText (body/attribute inside its
- graphify_pipeline.py
- .availability()
- Living Project Brief
- .color()
- EncryptedBackup.swift
- .perform()
- PINOutcome
- BriefRevisionStatus
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- Apple Intelligence Preflight
- IntentFailure
- Step
- KnowledgeSchema
- SharedInboxTests
- AppStore
- Result
- GraphExport.swift
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 87 edges
2. `SwiftData` - 75 edges
3. `Project` - 67 edges
4. `Article` - 62 edges
5. `Source` - 49 edges
6. `ThemeNode` - 47 edges
7. `Conversation` - 35 edges
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
- `AppLockController` --calls--> `BiometricService`  [INFERRED]
  SmartWard/Lock/AppLockController.swift → Packages/SmartWardKit/Sources/AppLock/AppLock.swift

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

## Communities (156 total, 5 thin omitted)

### Community 0 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 1 - "RetrievedPassage"
Cohesion: 0.06
Nodes (41): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+33 more)

### Community 2 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 3 - "IngestError"
Cohesion: 0.08
Nodes (30): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+22 more)

### Community 4 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 5 - "View"
Cohesion: 0.06
Nodes (38): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+30 more)

### Community 6 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 7 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 8 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 9 - "ReferenceLedger"
Cohesion: 0.10
Nodes (19): Decodable, AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, JSONValue (+11 more)

### Community 10 - "SwiftData"
Cohesion: 0.11
Nodes (6): Accelerate, AppIntents, Foundation, NaturalLanguage, RetrievalKit, SwiftData

### Community 11 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, GitHubUser, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord (+22 more)

### Community 12 - "String"
Cohesion: 0.10
Nodes (17): InterestProfile, ReadingSignal, StrategyItem, .status, StrategyItemStatus, done, invalidated, open (+9 more)

### Community 13 - "Project"
Cohesion: 0.15
Nodes (13): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+5 more)

### Community 14 - ".makeContainer()"
Cohesion: 0.10
Nodes (19): Bool, ModelContainer, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor (+11 more)

### Community 15 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (6): BYOKLLMKit, IngestKit, ModelCatalogKit, ActionTools, StrategistCore, XCTest

### Community 16 - "GitHubClient"
Cohesion: 0.15
Nodes (14): GitHubClient, .isAuthenticated, GitHubRepo, .id, HTTPTransport, Bool, Data, HTTPURLResponse (+6 more)

### Community 17 - "ThemeNode"
Cohesion: 0.16
Nodes (13): EntityAlias, Mention, MergeSuggestion, ThemeEdge, ThemeNode, GraphEditing, ModelContext, GraphEditingTests (+5 more)

### Community 18 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 19 - "ActionRequest"
Cohesion: 0.12
Nodes (21): LocalizedError, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+13 more)

### Community 20 - "KnowledgeStore"
Cohesion: 0.16
Nodes (4): FoundationModels, KnowledgeStore, Pipeline, SwiftUI

### Community 21 - "InterestModel"
Cohesion: 0.15
Nodes (16): Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+8 more)

### Community 22 - ".extract()"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 23 - "Conversation"
Cohesion: 0.13
Nodes (11): ContextPolicy, Bool, Chunk, Conversation, Message, Data, ContextPolicyTests, makeContext() (+3 more)

### Community 24 - "GraphIndexer"
Cohesion: 0.15
Nodes (14): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, GraphIndexer, .suggestionsAdded, GraphLinker (+6 more)

### Community 25 - ".body"
Cohesion: 0.12
Nodes (20): AppLock, BiometricLockKit, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body (+12 more)

### Community 26 - "ExtractedGraph"
Cohesion: 0.18
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 27 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 28 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 29 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 30 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 31 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 32 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (11): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+3 more)

### Community 33 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 34 - "Digest"
Cohesion: 0.15
Nodes (16): Digest, .clusters, Bool, Date, DigestController, .notificationsEnabled, Bool, ModelContext (+8 more)

### Community 35 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 36 - "BriefError"
Cohesion: 0.14
Nodes (17): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+9 more)

### Community 37 - "XCTestCase"
Cohesion: 0.11
Nodes (14): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, SampleLibraryTests, PerformanceTests, SeededRandom, String, TimeInterval (+6 more)

### Community 38 - "PerfTrace"
Cohesion: 0.18
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 39 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 40 - ".fetchURL()"
Cohesion: 0.22
Nodes (7): SourceEndpoint, Bool, String, URL, SourceEndpointTests, String, URL

### Community 41 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 42 - "DigestBuilder"
Cohesion: 0.16
Nodes (12): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, FakeSummarizer (+4 more)

### Community 43 - "RecordStrategyItemTool"
Cohesion: 0.17
Nodes (11): Arguments, ProjectStateTool, .definition, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue, LLMTool (+3 more)

### Community 44 - "BriefViews.swift"
Cohesion: 0.17
Nodes (15): BriefController, BriefEditorView, .body, BriefHistoryView, .body, BriefOrigin, BriefReviewView, .body (+7 more)

### Community 45 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 46 - "OnboardingProposal"
Cohesion: 0.18
Nodes (12): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+4 more)

### Community 47 - "RawItem"
Cohesion: 0.22
Nodes (9): FeedIngest, Date, Error, ModelContext, String, TimeInterval, RawItem, FetchedSource (+1 more)

### Community 48 - "SourceFetcher"
Cohesion: 0.23
Nodes (6): SourceDescriptor, SourceFetcher, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 49 - "GraphNeighborsTool"
Cohesion: 0.19
Nodes (12): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, SearchCorpusTool, .definition, JSONValue (+4 more)

### Community 50 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 51 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 52 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 53 - "ProjectLink"
Cohesion: 0.19
Nodes (9): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+1 more)

### Community 54 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (10): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider, LLMUsage (+2 more)

### Community 55 - "SearchDocument"
Cohesion: 0.23
Nodes (10): SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID, Update (+2 more)

### Community 56 - "ThemeStrengthCache"
Cohesion: 0.24
Nodes (11): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+3 more)

### Community 57 - "GraphSnapshot"
Cohesion: 0.20
Nodes (13): CGFloat, ForceLayout, GraphSnapshot, Point, GraphSnapshotTests, GraphCanvas, .body, UUID (+5 more)

### Community 58 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 59 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 60 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 61 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 62 - "Article"
Cohesion: 0.17
Nodes (15): Article, ModelContainer, ModelContext, ArticleRow, .body, .content, ReadingView, .emptyState (+7 more)

### Community 63 - "EntityResolver"
Cohesion: 0.26
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 64 - ".build()"
Cohesion: 0.24
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 65 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 66 - ".importPending()"
Cohesion: 0.19
Nodes (7): BGContinuedProcessingTask, BackgroundWork, ShareIntake, Int, ModelContext, TimeInterval, .body

### Community 67 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 68 - "IngestController"
Cohesion: 0.17
Nodes (12): Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set (+4 more)

### Community 69 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 70 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 71 - "PipelineRunner"
Cohesion: 0.27
Nodes (10): FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext, Set (+2 more)

### Community 72 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 73 - "AppLock.swift"
Cohesion: 0.22
Nodes (8): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricResult, PINAttemptResult, String

### Community 74 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 75 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 76 - ".render()"
Cohesion: 0.21
Nodes (7): DigestPrompt, ExtractionPrompt, .schema, JSONValue, ReferenceContext, String, UntrustedText

### Community 77 - "SearchHit"
Cohesion: 0.21
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 78 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 79 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 80 - ".send()"
Cohesion: 0.24
Nodes (8): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, LLMProvider, ModelContext, String

### Community 81 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 82 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 83 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 84 - "ShareModel"
Cohesion: 0.20
Nodes (8): NSExtensionContext, ShareModel, .canSave, ShareView, .body, Bool, String, UUID

### Community 85 - "Source"
Cohesion: 0.25
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 86 - ".process()"
Cohesion: 0.18
Nodes (10): FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, ModelContext, String, TimeInterval, Triage.Strength (+2 more)

### Community 87 - "FakeTransport"
Cohesion: 0.23
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 88 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 89 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 90 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary (+5 more)

### Community 91 - ".canonicalize()"
Cohesion: 0.22
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL

### Community 92 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 93 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 94 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 95 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 96 - ".article()"
Cohesion: 0.33
Nodes (5): FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 97 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 98 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 99 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 100 - "ParsedFeed"
Cohesion: 0.27
Nodes (8): NSObject, Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 101 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 102 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 103 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, Filter, all, .id, starred, unread, Order, .id (+3 more)

### Community 104 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 105 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 106 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 107 - ".parse()"
Cohesion: 0.29
Nodes (3): FeedParser, Data, FeedParserTests

### Community 108 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 109 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 110 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 111 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 112 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 113 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 114 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 115 - "AppTab"
Cohesion: 0.24
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 116 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 117 - "SmartWardApp"
Cohesion: 0.22
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 118 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 119 - "ShareViewController.swift"
Cohesion: 0.22
Nodes (6): BackgroundTasks, ShareViewController, ShareInbox, UIKit, UIViewController, UniformTypeIdentifiers

### Community 120 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 121 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 122 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 123 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 124 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 125 - "EmbeddingModel"
Cohesion: 0.33
Nodes (5): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, Int

### Community 126 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 127 - "ThemeDetailView"
Cohesion: 0.36
Nodes (7): Connection, .id, String, ThemeDetailView, .body, .connections, .recentMentions

### Community 128 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 129 - "Observation"
Cohesion: 0.25
Nodes (3): Observation, GitHubConfig, UserNotifications

### Community 130 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 131 - ".vector()"
Cohesion: 0.36
Nodes (5): RelevanceJudging, FixedJudge, Bool, Float, String

### Community 132 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 133 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 134 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 135 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 136 - "graphify_pipeline.py"
Cohesion: 0.33
Nodes (6): json, pathlib, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 137 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 138 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 139 - ".color()"
Cohesion: 0.40
Nodes (4): Color, .body, ThemeStyle, .body

### Community 140 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 141 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 142 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 143 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 144 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 145 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 147 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 148 - "IntentFailure"
Cohesion: 0.40
Nodes (5): IntentFailure, .errorDescription, libraryUnavailable, noProvider, String

### Community 149 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 150 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 152 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  /Users/mikefink/Downloads/SmartWard/README.md · relation: conceptually_related_to

## Knowledge Gaps
- **279 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+274 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 550 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `RetrievedPassage`, `ArticleReaderView`, `View`, `String`, `.makeContainer()`, `ThemeNode`, `InterestModel`, `Conversation`, `GraphIndexer`, `.fetch()`, `.load()`, `LexicalIndex`, `Scenario`, `DigestSummaryRequest`, `SearchDocument`, `IngestController`, `DigestCluster`, `PipelineRunner`, `SearchHit`, `Source`, `.article()`, `.importItems()`, `ArticleStage`, `.clusters()`, `EmbeddingModel`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `Observation`, `DailyBudget`, `IngestError`, `GitHubDeviceFlow`, `EncryptedBackup.swift`, `Project`, `BYOKLLMKit`, `GitHubClient`, `ThemeNode`, `StrategyItemKind`, `ActionRequest`, `KnowledgeStore`, `.extract()`, `GraphIndexer`, `.body`, `GraphExport.swift`, `SharedInbox`, `Dependency`, `PerfTrace`, `SourceFetcher`, `AppLock.swift`, `.render()`, `.canonicalize()`, `ParsedFeed`, `.score()`, `TopK`, `AppTab`, `ShareViewController.swift`?**
  _High betweenness centrality (0.043) - this node is a cross-community bridge._
- **Why does `Project` connect `Project` to `.article()`, `BriefError`, `View`, `LibraryFixture`, `ConversationMode`, `DigestBuilder`, `RecordStrategyItemTool`, `String`, `BriefViews.swift`, `OnboardingProposal`, `.makeContainer()`, `ThemeNode`, `StrategyItemKind`, `Scenario`, `GraphView`, `ProjectLink`, `Conversation`, `.fetch()`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Are the 23 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 23 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _279 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ModelFallback` be split into smaller, more focused modules?**
  _Cohesion score 0.05737704918032787 - nodes in this community are weakly interconnected._
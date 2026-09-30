# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 176 files · ~667,940 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3165 nodes · 8194 edges · 176 communities (169 shown, 7 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 940 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Sendable
- ThemeNode
- ModelFallback
- Project
- .record()
- Conversation
- StrategistRunner
- GitHubDeviceFlow
- ProjectArticlesTests
- RetrievedPassage
- GitHubClient
- .makeArticle()
- SwiftData
- ConversationView
- KnowledgeStore
- ArticleSummary
- DailyBudget
- XCTest
- RetrievalFixture
- InterestModel
- RawItem
- SourceKind
- View
- PipelineRunner
- ThemeDetailView
- .makeContainer()
- FetchURLTool
- GitHubRepoPicker
- ExtractedGraph
- RecordStrategyItemTool
- ActionRequest
- ArticleSummaryCard
- .extract()
- .run()
- SourceFetcher
- Phase 5: Hardening
- ProviderModelController
- Pipeline module (ingestion, graph, searc
- GitHubError
- ProjectSnapshot
- .process()
- Invariant D5: Private content never goes
- SharedInbox
- Dependency
- Digest
- .load()
- SwiftUI
- GraphRAG
- .parse()
- Source
- StrategyItemKind
- DigestBuilder
- GraphIndexer
- ThemeStrengthCache
- FakeBiometrics
- GitHubRepo
- AppLockCoordinator
- Article
- EmbeddingModel
- GraphSnapshot
- PerfTrace
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- GraphView
- .seal()
- DigestSummaryRequest
- EntityResolver
- Scenario
- RedirectPolicy
- .fetchURL()
- SecuritySettingsSection
- CaseIterable
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- ExtractionTier
- HybridSearchIndex
- .fetch()
- Approval Before Actions
- RefreshEagerness
- OnboardingView
- Strategist Layer
- .refresh()
- ShareModel
- .parse()
- GitHubAccount
- DigestCluster
- StubTool
- SearchController
- Kind
- CodingKeys
- SmartWard (iOS Application Target)
- .stored()
- LibraryArchive
- SearchDocument
- .messages()
- .outcome()
- .article()
- BackupView
- .canonicalize()
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- Observation
- PolitenessGate
- .projects()
- String
- PlaybackLLM
- AppLockController
- Choice
- SmartWard XcodeGen Project Spec
- ExtractedArticle
- XCTestCase
- AskStrategistIntent
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .text()
- StepProgress
- FakeClock
- LibraryFixture
- DeveloperView
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- RobotsRules
- IngestError
- .importItems()
- .fromPastedURL()
- .score()
- String
- AppLock.swift
- GraphCanvas
- graphify_pipeline.py
- AppLockPolicy
- ArticleStage
- TopK
- FoundationModelsEntityExtractor
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- .clusters()
- .user()
- .documents()
- AppTab
- SourceKindOption
- .graphML()
- StartBlocker
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- .perform()
- .availability()
- .init()
- .update()
- FoundationModelsRelevanceJudge
- SmartWardIntents.swift
- Living Project Brief
- EncryptedBackup.swift
- FetchError
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- Refused
- SeededRandom
- Apple Intelligence Preflight
- .importPending()
- .layout()
- SharedInboxTests
- IntentFailure
- graphify_refresh.sh
- GraphExport.swift
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 98 edges
2. `SwiftData` - 85 edges
3. `Article` - 85 edges
4. `Project` - 72 edges
5. `Source` - 59 edges
6. `ThemeNode` - 48 edges
7. `Conversation` - 40 edges
8. `XCTest` - 40 edges
9. `PipelineRunner` - 39 edges
10. `Pipeline` - 39 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `SourceIntake (shared validation for adding sources)` --implements--> `add_source Tool`  [INFERRED]
  CLAUDE.md → README.md
- `LibraryArchive (versioned JSON, snapshot/restore/erase)` --implements--> `Versioned Library JSON Export`  [INFERRED]
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

## Communities (176 total, 7 thin omitted)

### Community 0 - "Sendable"
Cohesion: 0.05
Nodes (75): Codable, Equatable, Identifiable, AliasRecord, ArchiveError, .errorDescription, newerVersion, notAnArchive (+67 more)

### Community 1 - "ThemeNode"
Cohesion: 0.08
Nodes (34): Set, Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ProjectLink (+26 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "Project"
Cohesion: 0.09
Nodes (29): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+21 more)

### Community 4 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 5 - "Conversation"
Cohesion: 0.07
Nodes (27): ContextPolicy, Bool, Conversation, .mode, ConversationMode, brainstorm, critique, onboarding (+19 more)

### Community 6 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 7 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 8 - "ProjectArticlesTests"
Cohesion: 0.11
Nodes (25): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+17 more)

### Community 9 - "RetrievedPassage"
Cohesion: 0.12
Nodes (21): ReferenceContext, RetrievedPassage, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval (+13 more)

### Community 10 - "GitHubClient"
Cohesion: 0.12
Nodes (15): GitHubClient, .isAuthenticated, GitHubUser, HTTPTransport, Set, String, FakeTransport, GitHubClientTests (+7 more)

### Community 11 - ".makeArticle()"
Cohesion: 0.15
Nodes (11): ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage, ModelContext, String (+3 more)

### Community 12 - "SwiftData"
Cohesion: 0.12
Nodes (5): Accelerate, Foundation, NaturalLanguage, RetrievalKit, SwiftData

### Community 13 - "ConversationView"
Cohesion: 0.10
Nodes (21): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 14 - "KnowledgeStore"
Cohesion: 0.15
Nodes (4): BYOKLLMKit, KnowledgeStore, ModelCatalogKit, StrategistCore

### Community 15 - "ArticleSummary"
Cohesion: 0.11
Nodes (20): Decoder, ArticleSummary, .isEmpty, CodingKeys, about, evidence, matters, remember (+12 more)

### Community 16 - "DailyBudget"
Cohesion: 0.11
Nodes (19): DailyBudget, ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor (+11 more)

### Community 17 - "XCTest"
Cohesion: 0.11
Nodes (3): IngestKit, Pipeline, XCTest

### Community 18 - "RetrievalFixture"
Cohesion: 0.12
Nodes (17): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+9 more)

### Community 19 - "InterestModel"
Cohesion: 0.13
Nodes (19): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+11 more)

### Community 20 - "RawItem"
Cohesion: 0.14
Nodes (12): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+4 more)

### Community 21 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 22 - "View"
Cohesion: 0.09
Nodes (27): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen, PrivacyCover (+19 more)

### Community 23 - "PipelineRunner"
Cohesion: 0.17
Nodes (14): PipelineRunner, Report, Bool, Date, Double, Int, ModelContext, Set (+6 more)

### Community 24 - "ThemeDetailView"
Cohesion: 0.10
Nodes (23): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+15 more)

### Community 25 - ".makeContainer()"
Cohesion: 0.12
Nodes (17): KnowledgeSchema, .schema, Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext (+9 more)

### Community 26 - "FetchURLTool"
Cohesion: 0.13
Nodes (17): AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval, .definition (+9 more)

### Community 27 - "GitHubRepoPicker"
Cohesion: 0.09
Nodes (23): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+15 more)

### Community 28 - "ExtractedGraph"
Cohesion: 0.16
Nodes (14): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation, JSONValue (+6 more)

### Community 29 - "RecordStrategyItemTool"
Cohesion: 0.14
Nodes (15): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+7 more)

### Community 30 - "ActionRequest"
Cohesion: 0.13
Nodes (20): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+12 more)

### Community 31 - "ArticleSummaryCard"
Cohesion: 0.11
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 32 - ".extract()"
Cohesion: 0.18
Nodes (9): ArticleExtractor, Bool, Element, String, URL, Document, ArticleExtractorTests, SwiftSoup (+1 more)

### Community 33 - ".run()"
Cohesion: 0.18
Nodes (14): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+6 more)

### Community 34 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 35 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 36 - "ProviderModelController"
Cohesion: 0.20
Nodes (13): CatalogCache, .modelField, AvailableModelsView, .body, .providersWithKeys, LLMProvider, ProviderModelController, Bool (+5 more)

### Community 37 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 38 - "GitHubError"
Cohesion: 0.13
Nodes (15): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+7 more)

### Community 39 - "ProjectSnapshot"
Cohesion: 0.18
Nodes (8): Item, ProjectSnapshot, StrategistPrompt, Bool, Set, String, .system, StrategistPromptTests

### Community 40 - ".process()"
Cohesion: 0.12
Nodes (13): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, TimeInterval (+5 more)

### Community 41 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 42 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 43 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 44 - "Digest"
Cohesion: 0.15
Nodes (16): Digest, .clusters, Bool, Date, DigestController, .notificationsEnabled, Bool, ModelContext (+8 more)

### Community 45 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 46 - "SwiftUI"
Cohesion: 0.11
Nodes (5): BackgroundTasks, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 47 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 48 - ".parse()"
Cohesion: 0.18
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 49 - "Source"
Cohesion: 0.17
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 50 - "StrategyItemKind"
Cohesion: 0.13
Nodes (18): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+10 more)

### Community 51 - "DigestBuilder"
Cohesion: 0.16
Nodes (12): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, FakeSummarizer (+4 more)

### Community 52 - "GraphIndexer"
Cohesion: 0.17
Nodes (10): EntityExtracting, GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext (+2 more)

### Community 53 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 54 - "FakeBiometrics"
Cohesion: 0.17
Nodes (11): BiometricLockKit, AppLockCoordinatorTests, FakeBiometrics, FakePIN, BiometricResult, BiometricUnavailable, BiometryType, PINAttemptResult (+3 more)

### Community 55 - "GitHubRepo"
Cohesion: 0.19
Nodes (11): Decodable, GitHubRepo, .id, Bool, ApplyResult, RepoSnapshot, RepoSync, Date (+3 more)

### Community 56 - "AppLockCoordinator"
Cohesion: 0.15
Nodes (14): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, PINOutcome, incorrect (+6 more)

### Community 57 - "Article"
Cohesion: 0.16
Nodes (17): Article, Int, ArticleRow, .body, .content, .relevancePercent, ReadingView, .activity (+9 more)

### Community 58 - "EmbeddingModel"
Cohesion: 0.17
Nodes (11): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ArticleIndexer, ModelContext (+3 more)

### Community 59 - "GraphSnapshot"
Cohesion: 0.23
Nodes (14): Edge, GraphSnapshot, Node, Scope, all, recent, source, Bool (+6 more)

### Community 60 - "PerfTrace"
Cohesion: 0.17
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 61 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 62 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 63 - "GraphView"
Cohesion: 0.16
Nodes (18): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+10 more)

### Community 64 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 65 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (10): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider, LLMUsage (+2 more)

### Community 66 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 67 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 68 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 69 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 70 - "SecuritySettingsSection"
Cohesion: 0.15
Nodes (15): AppLock, PINLockKit, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body (+7 more)

### Community 71 - "CaseIterable"
Cohesion: 0.12
Nodes (17): CaseIterable, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Filter (+9 more)

### Community 72 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 73 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 74 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 75 - "ExtractionTier"
Cohesion: 0.18
Nodes (9): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+1 more)

### Community 76 - "HybridSearchIndex"
Cohesion: 0.22
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, PerformanceTests, String (+2 more)

### Community 77 - ".fetch()"
Cohesion: 0.20
Nodes (8): ProviderModelFetcher, CatalogEntry, Data, LLMProvider, String, URLRequest, URLSession, ProviderModelFetcherTests

### Community 78 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 79 - "RefreshEagerness"
Cohesion: 0.13
Nodes (16): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+8 more)

### Community 80 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 81 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 82 - ".refresh()"
Cohesion: 0.21
Nodes (13): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+5 more)

### Community 83 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 84 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 85 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 86 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 87 - "StubTool"
Cohesion: 0.16
Nodes (9): ActionTools, Set, ApprovalPolicyTests, StubTool, .definition, Bool, JSONValue, LLMTool (+1 more)

### Community 88 - "SearchController"
Cohesion: 0.21
Nodes (9): T, SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID (+1 more)

### Community 89 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 90 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 91 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 92 - ".stored()"
Cohesion: 0.23
Nodes (5): SourceHealth, Error, String, SourceHealthTests, .body

### Community 93 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 94 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 95 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 96 - ".outcome()"
Cohesion: 0.22
Nodes (6): Outcome, fail, listen, speak, String, VoiceTurnTests

### Community 97 - ".article()"
Cohesion: 0.29
Nodes (5): FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext

### Community 98 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 99 - ".canonicalize()"
Cohesion: 0.20
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL

### Community 100 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 101 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 102 - "Observation"
Cohesion: 0.16
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 103 - "PolitenessGate"
Cohesion: 0.22
Nodes (10): PolitenessGate, async, Data, Date, HTTPURLResponse, Int, TimeInterval, URL (+2 more)

### Community 104 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 105 - "String"
Cohesion: 0.29
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 106 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 107 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 108 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 109 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 110 - "ExtractedArticle"
Cohesion: 0.19
Nodes (7): ExtractedArticle, Date, URL, FetchURLToolTests, FakeFullText, Set, URL

### Community 111 - "XCTestCase"
Cohesion: 0.15
Nodes (8): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, SampleLibraryTests, GraphExportTests, TopKTests, TriageDisplayTests, XCTestCase

### Community 112 - "AskStrategistIntent"
Cohesion: 0.26
Nodes (12): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent (+4 more)

### Community 113 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 114 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 115 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 116 - "StepProgress"
Cohesion: 0.21
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 117 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 118 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 119 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 120 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 121 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 122 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 123 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 124 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 125 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 126 - "IngestError"
Cohesion: 0.18
Nodes (11): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+3 more)

### Community 127 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 129 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 130 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 131 - "AppLock.swift"
Cohesion: 0.31
Nodes (6): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, PINAttemptResult

### Community 132 - "GraphCanvas"
Cohesion: 0.27
Nodes (7): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, .body

### Community 133 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 134 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 135 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 136 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 137 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 138 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 139 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 140 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 141 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 142 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 143 - ".user()"
Cohesion: 0.36
Nodes (3): DigestPrompt, String, UntrustedText

### Community 144 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 145 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 146 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 147 - ".graphML()"
Cohesion: 0.39
Nodes (5): GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 148 - "StartBlocker"
Cohesion: 0.29
Nodes (5): StartBlocker, missingKey, needsAutoApprove, Bool, VoiceTurn

### Community 149 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 150 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 151 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 152 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 153 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 154 - ".perform()"
Cohesion: 0.38
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 155 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 156 - ".init()"
Cohesion: 0.43
Nodes (4): KeyedExtractor, Bool, ModelContext, String

### Community 157 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 158 - "FoundationModelsRelevanceJudge"
Cohesion: 0.33
Nodes (6): FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 159 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 160 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 161 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 162 - "FetchError"
Cohesion: 0.33
Nodes (6): FetchError, .errorDescription, http, invalidKey, unreadable, Int

### Community 163 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 164 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 166 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 167 - "SeededRandom"
Cohesion: 0.60
Nodes (3): SeededRandom, UInt64, RandomNumberGenerator

### Community 168 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 169 - ".importPending()"
Cohesion: 0.60
Nodes (3): ShareIntake, Int, ModelContext

### Community 172 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **347 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+342 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 673 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `ThemeNode`, `.score()`, `AppLock.swift`, `.record()`, `GitHubDeviceFlow`, `TopK`, `GitHubClient`, `KnowledgeStore`, `ArticleSummary`, `.user()`, `StartBlocker`, `ExtractedGraph`, `ActionRequest`, `SmartWardIntents.swift`, `.extract()`, `EncryptedBackup.swift`, `SourceFetcher`, `SharedInbox`, `Dependency`, `GraphExport.swift`, `SwiftUI`, `.parse()`, `PerfTrace`, `RedirectPolicy`, `.parse()`, `.stored()`, `.canonicalize()`, `Observation`, `.text()`, `StepProgress`, `RobotsRules`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `ThemeNode`, `Conversation`, `ArticleStage`, `ProjectArticlesTests`, `.makeArticle()`, `ConversationView`, `.clusters()`, `ArticleSummary`, `DailyBudget`, `RetrievalFixture`, `RawItem`, `ArticleReaderView`, `PipelineRunner`, `.makeContainer()`, `.init()`, `ArticleSummaryCard`, `.load()`, `Source`, `GraphIndexer`, `ThemeStrengthCache`, `GitHubRepo`, `EmbeddingModel`, `DigestSummaryRequest`, `Scenario`, `ExtractionTier`, `.refresh()`, `DigestCluster`, `SearchController`, `SearchDocument`, `.article()`, `FakeEmbedder`, `.importItems()`?**
  _High betweenness centrality (0.051) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `EncryptedBackup.swift`, `SourceFetcher`, `EntityResolver`, `ThemeNode`, `Project`, `StrategistRunner`, `Observation`, `SwiftData`, `GraphExport.swift`, `SwiftUI`, `XCTest`, `RetrievalFixture`, `GraphIndexer`, `ThemeStrengthCache`, `GraphSnapshot`, `SearchDocument`, `SmartWardIntents.swift`?**
  _High betweenness centrality (0.048) - this node is a cross-community bridge._
- **Are the 29 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 29 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _347 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Sendable` be split into smaller, more focused modules?**
  _Cohesion score 0.053860719545550176 - nodes in this community are weakly interconnected._
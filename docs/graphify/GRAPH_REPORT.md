# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 172 files · ~635,413 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3093 nodes · 7976 edges · 171 communities (169 shown, 2 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 928 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- GraphView
- ModelFallback
- Project
- DeveloperView
- .record()
- ThemeNode
- Conversation
- StrategistRunner
- GitHubClient
- GitHubDeviceFlow
- FetchURLTool
- SwiftData
- DailyBudget
- RetrievalFixture
- Sendable
- ReferenceLedger
- XCTest
- SourceFetcher
- RetrievedPassage
- SharedInbox
- ArticleSummary
- StrategyItemKind
- RawItem
- PipelineRunner
- StubSummarizer
- .parse()
- SourceKind
- ThemeDetailView
- ExtractedArticle
- .makeContainer()
- InterestModel
- BYOKLLMKit
- .run()
- ArticleSummaryCard
- KnowledgeStore
- Article
- OnboardingProposal
- Phase 5: Hardening
- ProviderModelController
- Pipeline module (ingestion, graph, searc
- .fetch()
- ProjectLink
- DigestSummaryRequest
- .load()
- RecordStrategyItemTool
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- Dependency
- ExtractedGraph
- View
- GraphRAG
- Source
- StrategistTool
- .article()
- EmbeddingModel
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- EntityResolver
- Scenario
- BackgroundWork
- RedirectPolicy
- .fetchURL()
- String
- HybridSearchIndex
- SearchDocument
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppLockCoordinator
- GitHubError
- DigestBuilder
- .plan()
- Approval Before Actions
- OnboardingView
- Strategist Layer
- ShareModel
- GitHubAccount
- DigestCluster
- GraphIndexer
- .save()
- .body
- Kind
- AppLock.swift
- CodingKeys
- SmartWard (iOS Application Target)
- LocalizedError
- .messages()
- PlaybackLLM
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- Digest
- .projects()
- .decode()
- AppLockController
- RefreshEagerness
- EditLinkView
- SmartWard XcodeGen Project Spec
- Observation
- IngestError
- .render()
- GitHubRepoPicker
- AskStrategistIntent
- FoundationModelsEntityExtractor
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .text()
- StepProgress
- FakeClock
- LibraryFixture
- XCTestCase
- OnboardingReviewView
- .refresh()
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- RobotsRules
- .importItems()
- LibraryArchive
- .score()
- .summarize()
- .clusters()
- LexicalIndex
- .process()
- .buildIfDue()
- SourceKindOption
- graphify_pipeline.py
- FakeEmbedder
- AppLockPolicy
- ArticleStage
- TopK
- FakeBiometrics
- ProjectEntity
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .graphML()
- PipelineController
- AppLockTests.swift
- .send()
- ArchiveError
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- Identifiable
- .availability()
- PolitenessGate
- .documents()
- .update()
- SmartWardIntents.swift
- Living Project Brief
- EncryptedBackup.swift
- .perform()
- PINOutcome
- BriefRevisionStatus
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Apple Intelligence Preflight
- ComingSoonView
- KnowledgeSchema
- ApprovalDecision
- ArticleSummaryError
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 95 edges
2. `SwiftData` - 82 edges
3. `Article` - 78 edges
4. `Project` - 68 edges
5. `Source` - 57 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `PipelineRunner` - 39 edges
9. `XCTest` - 39 edges
10. `BYOKLLMKit` - 38 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.body` --references--> `SearchHit`  [INFERRED]
  SmartWard/Reading/SearchController.swift → Packages/SmartWardKit/Sources/Pipeline/HybridSearch.swift
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

## Communities (171 total, 2 thin omitted)

### Community 0 - "GraphView"
Cohesion: 0.05
Nodes (61): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+53 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "Project"
Cohesion: 0.09
Nodes (31): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+23 more)

### Community 3 - "DeveloperView"
Cohesion: 0.06
Nodes (38): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+30 more)

### Community 4 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 5 - "ThemeNode"
Cohesion: 0.12
Nodes (26): Chunk, EntityAlias, InterestProfile, Mention, Message, ReadingSignal, StrategyItem, .status (+18 more)

### Community 6 - "Conversation"
Cohesion: 0.07
Nodes (27): ContextPolicy, Bool, Conversation, .mode, ConversationMode, brainstorm, critique, onboarding (+19 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 8 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 9 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 10 - "FetchURLTool"
Cohesion: 0.10
Nodes (19): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+11 more)

### Community 11 - "SwiftData"
Cohesion: 0.11
Nodes (5): Accelerate, Foundation, NaturalLanguage, RetrievalKit, SwiftData

### Community 12 - "DailyBudget"
Cohesion: 0.09
Nodes (22): DailyBudget, ExtractionTier, byok, onDevice, ExtractionTiers, BudgetTests, Double, ModelContext (+14 more)

### Community 13 - "RetrievalFixture"
Cohesion: 0.10
Nodes (21): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+13 more)

### Community 14 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 15 - "ReferenceLedger"
Cohesion: 0.12
Nodes (21): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, ReferenceLedger (+13 more)

### Community 16 - "XCTest"
Cohesion: 0.11
Nodes (5): BackgroundTasks, IngestKit, Pipeline, ShareInbox, XCTest

### Community 17 - "SourceFetcher"
Cohesion: 0.14
Nodes (12): CanonicalURL, Set, String, URL, SourceDescriptor, SourceFetcher, Bool, Data (+4 more)

### Community 18 - "RetrievedPassage"
Cohesion: 0.11
Nodes (21): RetrievedPassage, ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 19 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 20 - "ArticleSummary"
Cohesion: 0.11
Nodes (20): Decoder, ArticleSummary, .isEmpty, CodingKeys, about, evidence, matters, remember (+12 more)

### Community 21 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 22 - "RawItem"
Cohesion: 0.14
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 23 - "PipelineRunner"
Cohesion: 0.16
Nodes (15): FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+7 more)

### Community 24 - "StubSummarizer"
Cohesion: 0.17
Nodes (10): ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage, ModelContext, String (+2 more)

### Community 25 - ".parse()"
Cohesion: 0.13
Nodes (13): DateFormatter, ISO8601DateFormatter, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data (+5 more)

### Community 26 - "SourceKind"
Cohesion: 0.07
Nodes (27): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+19 more)

### Community 27 - "ThemeDetailView"
Cohesion: 0.10
Nodes (20): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+12 more)

### Community 28 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 29 - ".makeContainer()"
Cohesion: 0.13
Nodes (11): Bool, ModelContainer, MergeSuggestion, GraphEditing, ModelContext, GraphEditingTests, GraphSnapshotTests, Date (+3 more)

### Community 30 - "InterestModel"
Cohesion: 0.16
Nodes (15): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+7 more)

### Community 31 - "BYOKLLMKit"
Cohesion: 0.14
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 32 - ".run()"
Cohesion: 0.17
Nodes (15): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+7 more)

### Community 33 - "ArticleSummaryCard"
Cohesion: 0.11
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, Generated (+9 more)

### Community 34 - "KnowledgeStore"
Cohesion: 0.15
Nodes (5): GraphKit, KnowledgeStore, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 35 - "Article"
Cohesion: 0.13
Nodes (18): Article, Int, TriageDisplayTests, ArticleRow, .body, .content, .relevancePercent, ReadingView (+10 more)

### Community 36 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 37 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 38 - "ProviderModelController"
Cohesion: 0.20
Nodes (13): CatalogCache, .modelField, AvailableModelsView, .body, .providersWithKeys, LLMProvider, ProviderModelController, Bool (+5 more)

### Community 39 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 40 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 41 - "ProjectLink"
Cohesion: 0.16
Nodes (10): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+2 more)

### Community 42 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (13): BYOKDigestSummarizer, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider (+5 more)

### Community 43 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 44 - "RecordStrategyItemTool"
Cohesion: 0.15
Nodes (14): Arguments, ProjectStateTool, .asksForApproval, .definition, ProposeBriefUpdateTool, .asksForApproval, .definition, RecordStrategyItemTool (+6 more)

### Community 45 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 46 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 47 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 48 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 49 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 50 - "View"
Cohesion: 0.14
Nodes (20): PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding, .toggleTitle (+12 more)

### Community 51 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 52 - "Source"
Cohesion: 0.17
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 53 - "StrategistTool"
Cohesion: 0.14
Nodes (16): StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult, StrategistTool (+8 more)

### Community 54 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 55 - "EmbeddingModel"
Cohesion: 0.17
Nodes (11): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ArticleIndexer, ModelContext (+3 more)

### Community 56 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 57 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 58 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 59 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 60 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 61 - "BackgroundWork"
Cohesion: 0.16
Nodes (10): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Date, String (+2 more)

### Community 62 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 63 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 64 - "String"
Cohesion: 0.20
Nodes (10): ArticleSummaryOutput, ArticleSummaryPrompt, .schema, BYOKArticleSummarizer, JSONValue, LLMCompleting, LLMProvider, LLMRequest (+2 more)

### Community 65 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, PerformanceTests, String (+2 more)

### Community 66 - "SearchDocument"
Cohesion: 0.23
Nodes (10): SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID, Update (+2 more)

### Community 67 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 68 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 69 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 70 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 71 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 72 - "DigestBuilder"
Cohesion: 0.21
Nodes (9): DigestBuilder, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date, ModelContainer (+1 more)

### Community 73 - ".plan()"
Cohesion: 0.23
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 74 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 75 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 76 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 77 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 78 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 79 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 80 - "GraphIndexer"
Cohesion: 0.19
Nodes (8): EntityExtracting, GraphIndexer, .suggestionsAdded, GraphLinker, Date, Int, ModelContext, String

### Community 81 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 82 - ".body"
Cohesion: 0.12
Nodes (14): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+6 more)

### Community 83 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 84 - "AppLock.swift"
Cohesion: 0.22
Nodes (8): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricResult, PINAttemptResult, String

### Community 85 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 86 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 87 - "LocalizedError"
Cohesion: 0.13
Nodes (15): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+7 more)

### Community 88 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 89 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 90 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 91 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 92 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 93 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 94 - "Digest"
Cohesion: 0.24
Nodes (11): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body (+3 more)

### Community 95 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 96 - ".decode()"
Cohesion: 0.18
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 97 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 98 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 99 - "EditLinkView"
Cohesion: 0.15
Nodes (12): EditLinkView, .body, .trimmed, NewProjectView, .body, ProjectDetailView, .body, .links (+4 more)

### Community 100 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 101 - "Observation"
Cohesion: 0.18
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 102 - "IngestError"
Cohesion: 0.15
Nodes (12): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+4 more)

### Community 103 - ".render()"
Cohesion: 0.23
Nodes (6): ExtractionPrompt, .schema, JSONValue, ReferenceContext, String, UntrustedText

### Community 104 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 105 - "AskStrategistIntent"
Cohesion: 0.26
Nodes (12): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent (+4 more)

### Community 106 - "FoundationModelsEntityExtractor"
Cohesion: 0.26
Nodes (9): Color, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String, .body, ThemeStyle (+1 more)

### Community 107 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 108 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 109 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 110 - "StepProgress"
Cohesion: 0.21
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 111 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 112 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 113 - "XCTestCase"
Cohesion: 0.20
Nodes (7): NormalizedKeyTests, AddSourceToolTests, SeededRandom, UInt64, TopKTests, RandomNumberGenerator, XCTestCase

### Community 114 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 115 - ".refresh()"
Cohesion: 0.30
Nodes (9): IngestController, Bool, Int, ModelContext, Set, String, UUID, Void (+1 more)

### Community 116 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, Filter, all, .id, starred, unread, Order, .id (+3 more)

### Community 117 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 118 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 119 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 120 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 121 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 122 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 123 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 124 - ".summarize()"
Cohesion: 0.31
Nodes (6): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID

### Community 125 - ".clusters()"
Cohesion: 0.31
Nodes (6): Group, Bool, Int, UUID, UnionFind, .body

### Community 126 - "LexicalIndex"
Cohesion: 0.27
Nodes (3): LexicalIndex, .count, LexicalIndexTests

### Community 127 - ".process()"
Cohesion: 0.24
Nodes (6): .body, ExtractionSettings, Int, ModelContext, TimeInterval, Void

### Community 128 - ".buildIfDue()"
Cohesion: 0.24
Nodes (8): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, DigestSettingsSection, .body

### Community 129 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 130 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 131 - "FakeEmbedder"
Cohesion: 0.33
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 132 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 133 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 134 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 135 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 136 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 137 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 138 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 139 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 140 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 141 - "PipelineController"
Cohesion: 0.25
Nodes (8): FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, String, Triage.Strength, .label, Verdict

### Community 142 - "AppLockTests.swift"
Cohesion: 0.25
Nodes (4): AppLock, BiometricLockKit, PINRules, PINRulesTests

### Community 143 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 144 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 145 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 146 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 147 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 148 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 149 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 150 - "Identifiable"
Cohesion: 0.33
Nodes (7): Identifiable, OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double

### Community 151 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 152 - "PolitenessGate"
Cohesion: 0.33
Nodes (6): PolitenessGate, async, Date, Int, TimeInterval, Void

### Community 153 - ".documents()"
Cohesion: 0.43
Nodes (3): IncrementalIndexTests, Int, Range

### Community 154 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 155 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 156 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 157 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 158 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 159 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 160 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 161 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 162 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 163 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 164 - "ComingSoonView"
Cohesion: 0.40
Nodes (4): ComingSoonView, .body, RootView, String

### Community 165 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 166 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 167 - "ArticleSummaryError"
Cohesion: 0.50
Nodes (4): ArticleSummaryError, empty, .errorDescription, tooShort

### Community 168 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **342 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+337 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 659 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **2 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `DeveloperView`, `ThemeNode`, `TopK`, `GitHubClient`, `GitHubDeviceFlow`, `XCTest`, `SourceFetcher`, `SharedInbox`, `ArticleSummary`, `StrategyItemKind`, `.parse()`, `SmartWardIntents.swift`, `ExtractedArticle`, `EncryptedBackup.swift`, `BYOKLLMKit`, `KnowledgeStore`, `.outcome()`, `Dependency`, `RedirectPolicy`, `AppLock.swift`, `.stored()`, `Observation`, `.render()`, `.text()`, `StepProgress`, `RobotsRules`, `.score()`?**
  _High betweenness centrality (0.070) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `GraphView`, `FakeEmbedder`, `DeveloperView`, `ThemeNode`, `ArticleStage`, `Conversation`, `DailyBudget`, `RetrievalFixture`, `RetrievedPassage`, `ArticleReaderView`, `PipelineRunner`, `StubSummarizer`, `.makeContainer()`, `InterestModel`, `ArticleSummaryCard`, `.fetch()`, `ProjectLink`, `.load()`, `Source`, `.article()`, `EmbeddingModel`, `SearchDocument`, `DigestBuilder`, `DigestCluster`, `.save()`, `.refresh()`, `.importItems()`, `.summarize()`, `.clusters()`?**
  _High betweenness centrality (0.046) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `GraphView`, `SearchDocument`, `Project`, `Observation`, `SwiftData`, `SmartWardIntents.swift`, `RetrievalFixture`, `GraphIndexer`, `SourceFetcher`, `XCTest`, `.makeContainer()`, `StrategyItemKind`, `EntityResolver`, `EncryptedBackup.swift`, `BYOKLLMKit`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Are the 29 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 29 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _342 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `GraphView` be split into smaller, more focused modules?**
  _Cohesion score 0.05063291139240506 - nodes in this community are weakly interconnected._
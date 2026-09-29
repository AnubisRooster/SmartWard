# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 175 files · ~658,695 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3135 nodes · 8099 edges · 178 communities (175 shown, 3 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 937 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Article
- ModelFallback
- Project
- DailyBudget
- .makeContainer()
- RetrievedPassage
- RefreshEagerness
- StrategistRunner
- GitHubDeviceFlow
- ProjectArticlesTests
- SwiftData
- Sendable
- ExtractionTier
- ConversationView
- SharedInbox
- XCTest
- RetrievalFixture
- InterestModel
- KnowledgeStore
- BYOKLLMKit
- SourceKind
- StrategyItemKind
- StubSummarizer
- OpenArticleTool
- RawItem
- StrategyItem
- Conversation
- .extract()
- PipelineRunner
- RecordStrategyItemTool
- GitHubClient
- OnboardingProposal
- ExtractedGraph
- ActionRequest
- ArticleSummaryCard
- .run()
- ArticleSummary
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .fetch()
- EmbeddingModel
- XCTestCase
- HybridSearchIndex
- .load()
- .fetch()
- View
- Invariant D5: Private content never goes
- PerfTrace
- .parse()
- Dependency
- Source
- GraphRAG
- SourceFetcher
- .build()
- ThemeStrengthCache
- LexicalIndex
- .score()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .fetchURL()
- .seal()
- StubTool
- DigestSummaryRequest
- EntityResolver
- BriefError
- .process()
- RedirectPolicy
- String
- Scenario
- ReadingView
- AppLockCoordinator
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- Approval Before Actions
- OnboardingView
- Strategist Layer
- .refresh()
- ShareModel
- GitHubAccount
- DigestCluster
- DigestBuilder
- .article()
- Kind
- SmartWard (iOS Application Target)
- LibraryArchive
- .data()
- .messages()
- .outcome()
- FakeTransport
- .dismiss()
- BackupView
- GraphSnapshot
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- .stored()
- .projects()
- .decode()
- SearchDocument
- AppLockController
- Choice
- EditLinkView
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SeededRandom
- GitHubRepoPicker
- .buildIfDue()
- AskStrategistIntent
- AppLockTests.swift
- FoundationModelsEntityExtractor
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- Observation
- FakePIN
- GitHubError
- .user()
- SearchController
- StepProgress
- FakeClock
- LibraryFixture
- OnboardingReviewView
- DeveloperView
- ProjectEntity
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- RobotsRules
- IngestError
- .importItems()
- .summarize()
- .update()
- graphify_pipeline.py
- Digest
- ArticleStage
- TopK
- FakeBiometrics
- ThemeDetailView
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- .clusters()
- AppTab
- SourceKindOption
- CodingKeys
- .send()
- ArchiveError
- StartBlocker
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- CodingKeys
- .perform()
- .availability()
- PolitenessGate
- ProviderKeyRow
- SmartWardIntents.swift
- Living Project Brief
- PINOutcome
- CodingKeys
- BriefRevisionStatus
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- Apple Intelligence Preflight
- AppStore
- ApprovalDecision
- ArticleSummaryError
- FakeSummarizer
- IntentFailure
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 98 edges
2. `SwiftData` - 85 edges
3. `Article` - 84 edges
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
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift

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

## Communities (178 total, 3 thin omitted)

### Community 0 - "Article"
Cohesion: 0.10
Nodes (27): Article, Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal (+19 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "Project"
Cohesion: 0.09
Nodes (31): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+23 more)

### Community 3 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 4 - ".makeContainer()"
Cohesion: 0.08
Nodes (19): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+11 more)

### Community 5 - "RetrievedPassage"
Cohesion: 0.10
Nodes (22): ExtractedArticle, Date, AddSourceTool, .asksForApproval, .definition, .kinds, FetchURLTool, .asksForApproval (+14 more)

### Community 6 - "RefreshEagerness"
Cohesion: 0.06
Nodes (29): App, BGContinuedProcessingTask, RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests (+21 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 8 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (27): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+19 more)

### Community 9 - "ProjectArticlesTests"
Cohesion: 0.11
Nodes (25): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+17 more)

### Community 10 - "SwiftData"
Cohesion: 0.10
Nodes (9): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security, GitHubConfig (+1 more)

### Community 11 - "Sendable"
Cohesion: 0.26
Nodes (31): Codable, Equatable, GitHubUser, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord (+23 more)

### Community 12 - "ExtractionTier"
Cohesion: 0.10
Nodes (21): ExtractionTier, byok, onDevice, ExtractionTiers, BudgetTests, Double, ModelContext, String (+13 more)

### Community 13 - "ConversationView"
Cohesion: 0.10
Nodes (21): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 14 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 15 - "XCTest"
Cohesion: 0.11
Nodes (3): IngestKit, Pipeline, XCTest

### Community 16 - "RetrievalFixture"
Cohesion: 0.12
Nodes (17): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+9 more)

### Community 17 - "InterestModel"
Cohesion: 0.13
Nodes (19): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+11 more)

### Community 18 - "KnowledgeStore"
Cohesion: 0.12
Nodes (7): BackgroundTasks, GraphKit, KnowledgeStore, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 19 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 20 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 21 - "StrategyItemKind"
Cohesion: 0.13
Nodes (15): StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition, Item (+7 more)

### Community 22 - "StubSummarizer"
Cohesion: 0.17
Nodes (10): ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage, ModelContext, String (+2 more)

### Community 23 - "OpenArticleTool"
Cohesion: 0.13
Nodes (20): Decodable, Arguments, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval (+12 more)

### Community 24 - "RawItem"
Cohesion: 0.15
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 25 - "StrategyItem"
Cohesion: 0.10
Nodes (15): ContextPolicy, Bool, StrategyItem, .kind, .status, StrategyItemStatus, done, invalidated (+7 more)

### Community 26 - "Conversation"
Cohesion: 0.10
Nodes (22): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+14 more)

### Community 27 - ".extract()"
Cohesion: 0.16
Nodes (8): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, SwiftSoup, Unicode

### Community 28 - "PipelineRunner"
Cohesion: 0.18
Nodes (13): PipelineRunner, Report, Bool, Date, Double, Int, ModelContext, Set (+5 more)

### Community 29 - "RecordStrategyItemTool"
Cohesion: 0.13
Nodes (16): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+8 more)

### Community 30 - "GitHubClient"
Cohesion: 0.18
Nodes (12): GitHubClient, .isAuthenticated, GitHubRepo, .id, Bool, Data, HTTPURLResponse, Set (+4 more)

### Community 31 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 32 - "ExtractedGraph"
Cohesion: 0.17
Nodes (13): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+5 more)

### Community 33 - "ActionRequest"
Cohesion: 0.13
Nodes (20): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+12 more)

### Community 34 - "ArticleSummaryCard"
Cohesion: 0.11
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, Generated (+9 more)

### Community 35 - ".run()"
Cohesion: 0.18
Nodes (14): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+6 more)

### Community 36 - "ArticleSummary"
Cohesion: 0.16
Nodes (14): Decoder, ArticleSummary, .isEmpty, Draft, Question, about, evidence, matters (+6 more)

### Community 37 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 38 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 39 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 40 - "EmbeddingModel"
Cohesion: 0.14
Nodes (12): EmbeddingModel, EmbeddingProviding, String, EntityExtracting, GraphIndexer, .suggestionsAdded, GraphLinker, Date (+4 more)

### Community 41 - "XCTestCase"
Cohesion: 0.12
Nodes (15): ReferenceContext, NormalizedKeyTests, answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest (+7 more)

### Community 42 - "HybridSearchIndex"
Cohesion: 0.17
Nodes (11): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Bool, Float, Int, Set (+3 more)

### Community 43 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 44 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 45 - "View"
Cohesion: 0.13
Nodes (20): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+12 more)

### Community 46 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 47 - "PerfTrace"
Cohesion: 0.16
Nodes (15): DispatchTime, os, PerfTrace, .samples, Sample, Summary, Date, Double (+7 more)

### Community 48 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 49 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 50 - "Source"
Cohesion: 0.16
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 51 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 52 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 53 - ".build()"
Cohesion: 0.20
Nodes (14): Edge, Node, Scope, all, recent, source, Bool, Date (+6 more)

### Community 54 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 55 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 56 - ".score()"
Cohesion: 0.14
Nodes (12): Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive, String (+4 more)

### Community 57 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 58 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 59 - ".fetchURL()"
Cohesion: 0.25
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 60 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 61 - "StubTool"
Cohesion: 0.14
Nodes (12): ActionTools, Bool, Set, String, .names, ApprovalPolicyTests, StubTool, .definition (+4 more)

### Community 62 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (10): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider, LLMUsage (+2 more)

### Community 63 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 64 - "BriefError"
Cohesion: 0.15
Nodes (14): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+6 more)

### Community 65 - ".process()"
Cohesion: 0.15
Nodes (13): .body, ExtractionSettings, FoundationModelsRelevanceJudge, PipelineController, Bool, Int, ModelContext, String (+5 more)

### Community 66 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 67 - "String"
Cohesion: 0.20
Nodes (10): ArticleSummaryOutput, ArticleSummaryPrompt, .schema, BYOKArticleSummarizer, JSONValue, LLMCompleting, LLMProvider, LLMRequest (+2 more)

### Community 68 - "Scenario"
Cohesion: 0.21
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 69 - "ReadingView"
Cohesion: 0.12
Nodes (16): ArticleRow, .body, .content, .relevancePercent, ReadingView, .activity, .body, .emptyState (+8 more)

### Community 70 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService, PINVerifying (+2 more)

### Community 71 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 72 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 73 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 74 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 75 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 76 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 77 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 78 - ".refresh()"
Cohesion: 0.20
Nodes (14): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+6 more)

### Community 79 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 80 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 81 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 82 - "DigestBuilder"
Cohesion: 0.22
Nodes (10): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date (+2 more)

### Community 83 - ".article()"
Cohesion: 0.25
Nodes (5): Int, PipelineRunnerTests, ModelContainer, ModelContext, TriageDisplayTests

### Community 84 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 85 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 86 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 87 - ".data()"
Cohesion: 0.21
Nodes (8): Data, Float, VectorCoding, FixedJudge, Bool, Float, String, VectorCodingTests

### Community 88 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 89 - ".outcome()"
Cohesion: 0.22
Nodes (6): Outcome, fail, listen, speak, String, VoiceTurnTests

### Community 90 - "FakeTransport"
Cohesion: 0.22
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 91 - ".dismiss()"
Cohesion: 0.19
Nodes (12): SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding, Double (+4 more)

### Community 92 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 93 - "GraphSnapshot"
Cohesion: 0.24
Nodes (11): CGFloat, ForceLayout, GraphSnapshot, Point, GraphCanvas, .body, Void, ThemeList (+3 more)

### Community 94 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 95 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 96 - "GraphView"
Cohesion: 0.23
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 97 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 98 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 99 - ".decode()"
Cohesion: 0.18
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 100 - "SearchDocument"
Cohesion: 0.32
Nodes (8): SearchCorpus, SearchDocument, ModelContext, String, UUID, Update, .isEmpty, Sequence

### Community 101 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 102 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 103 - "EditLinkView"
Cohesion: 0.19
Nodes (12): EditLinkView, .body, .trimmed, NewProjectView, .body, ProjectDetailView, .body, .links (+4 more)

### Community 104 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 105 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 106 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 107 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 108 - ".buildIfDue()"
Cohesion: 0.22
Nodes (9): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, TodayView, .body (+1 more)

### Community 109 - "AskStrategistIntent"
Cohesion: 0.26
Nodes (12): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent (+4 more)

### Community 110 - "AppLockTests.swift"
Cohesion: 0.21
Nodes (7): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit, LockScreen, Bool

### Community 111 - "FoundationModelsEntityExtractor"
Cohesion: 0.26
Nodes (9): Color, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String, .body, ThemeStyle (+1 more)

### Community 112 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 113 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 114 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 115 - "Observation"
Cohesion: 0.20
Nodes (3): FoundationModels, Observation, UserNotifications

### Community 116 - "FakePIN"
Cohesion: 0.27
Nodes (5): BiometricResult, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 117 - "GitHubError"
Cohesion: 0.20
Nodes (10): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+2 more)

### Community 118 - ".user()"
Cohesion: 0.24
Nodes (6): DigestPrompt, ExtractionPrompt, .schema, JSONValue, String, UntrustedText

### Community 119 - "SearchController"
Cohesion: 0.27
Nodes (7): SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID

### Community 120 - "StepProgress"
Cohesion: 0.21
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 121 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 122 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 123 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 124 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 125 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 126 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, Filter, all, .id, starred, unread, Order, .id (+3 more)

### Community 127 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 128 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 129 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 130 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 131 - "IngestError"
Cohesion: 0.18
Nodes (11): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+3 more)

### Community 132 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 133 - ".summarize()"
Cohesion: 0.31
Nodes (6): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID

### Community 134 - ".update()"
Cohesion: 0.22
Nodes (8): PrivacyCover, .body, LockOverlay, .body, LockWindow, Bool, UIWindow, UIWindowScene

### Community 135 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 136 - "Digest"
Cohesion: 0.31
Nodes (8): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body

### Community 137 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 138 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 139 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 140 - "ThemeDetailView"
Cohesion: 0.31
Nodes (8): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions

### Community 141 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 142 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 143 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 144 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 145 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 146 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 147 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 148 - "CodingKeys"
Cohesion: 0.25
Nodes (8): CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt, topics

### Community 149 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 150 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 151 - "StartBlocker"
Cohesion: 0.29
Nodes (5): StartBlocker, missingKey, needsAutoApprove, Bool, VoiceTurn

### Community 152 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 153 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 154 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 155 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 156 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 157 - "CodingKeys"
Cohesion: 0.29
Nodes (7): CodingKey, CodingKeys, about, evidence, matters, remember, says

### Community 158 - ".perform()"
Cohesion: 0.38
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 159 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 160 - "PolitenessGate"
Cohesion: 0.33
Nodes (6): PolitenessGate, async, Date, Int, TimeInterval, Void

### Community 161 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 162 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 163 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 164 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 165 - "CodingKeys"
Cohesion: 0.33
Nodes (6): CodingKeys, deviceCode, expiresIn, interval, userCode, verificationURI

### Community 166 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 167 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 168 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 169 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 170 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 171 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 172 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 173 - "ArticleSummaryError"
Cohesion: 0.50
Nodes (4): ArticleSummaryError, empty, .errorDescription, tooShort

### Community 175 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **344 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+339 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 669 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `Article`, `RobotsRules`, `DailyBudget`, `RefreshEagerness`, `GitHubDeviceFlow`, `TopK`, `SharedInbox`, `XCTest`, `KnowledgeStore`, `BYOKLLMKit`, `StartBlocker`, `.extract()`, `SmartWardIntents.swift`, `ArticleSummary`, `KnowledgeSchema`, `AppStore`, `PerfTrace`, `.parse()`, `Dependency`, `SourceFetcher`, `.score()`, `RedirectPolicy`, `AppLockCoordinator`, `.stored()`, `AppLockTests.swift`, `.canonicalize()`, `Observation`, `GitHubError`, `.user()`, `StepProgress`?**
  _High betweenness centrality (0.065) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Article`, `SmartWardIntents.swift`, `Project`, `SearchDocument`, `EditLinkView`, `EmbeddingModel`, `SwiftData`, `AppStore`, `XCTest`, `RetrievalFixture`, `BYOKLLMKit`, `SourceFetcher`, `.build()`, `ThemeStrengthCache`, `Observation`, `EntityResolver`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `.importItems()`, `.summarize()`, `.makeContainer()`, `ArticleStage`, `ProjectArticlesTests`, `ExtractionTier`, `ConversationView`, `RetrievalFixture`, `.clusters()`, `StubSummarizer`, `StrategyItem`, `Conversation`, `ArticleReaderView`, `PipelineRunner`, `ArticleSummaryCard`, `.fetch()`, `EmbeddingModel`, `.load()`, `Source`, `ThemeStrengthCache`, `LexicalIndex`, `DigestSummaryRequest`, `ReadingView`, `DigestCluster`, `.article()`, `.dismiss()`, `SearchDocument`, `SearchController`?**
  _High betweenness centrality (0.042) - this node is a cross-community bridge._
- **Are the 29 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 29 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _344 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Article` be split into smaller, more focused modules?**
  _Cohesion score 0.09771825396825397 - nodes in this community are weakly interconnected._
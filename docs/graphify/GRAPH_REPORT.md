# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 150 files · ~581,874 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2728 nodes · 7018 edges · 155 communities (152 shown, 3 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 855 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Article
- ModelFallback
- Identifiable
- GraphView
- RetrievedPassage
- .record()
- IngestError
- .dismiss()
- OnboardingView
- .makeContainer()
- StrategistRunner
- Sendable
- GitHubClient
- KnowledgeStore
- InterestModel
- OnboardingProposal
- SwiftData
- StrategyItemKind
- GitHubDeviceFlow
- Conversation
- ExtractedGraph
- ReferenceLedger
- PipelineRunner
- FetchURLTool
- RawItem
- Project
- .body
- GraphSnapshot
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .parse()
- .fetch()
- ActionRequest
- SwiftUI
- BYOKLLMKit
- Invariant D5: Private content never goes
- .extract()
- Dependency
- ExtractionTiers
- .load()
- View
- BackgroundWork
- GraphRAG
- GitHubAccount
- AddSourceView
- SourceFetcher
- HybridSearchIndex
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .process()
- .suggest()
- AppLock.swift
- .send()
- .fetchURL()
- makeContext()
- Scenario
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppLockCoordinator
- .seal()
- .article()
- Approval Before Actions
- PerfTrace
- Strategist Layer
- IngestController
- DigestCluster
- DigestSummaryRequest
- DigestBuilder
- EntityResolver
- .save()
- GraphIndexer
- ThemeStrengthCache
- XCTestCase
- Kind
- CodingKeys
- SmartWard (iOS Application Target)
- SearchDocument
- .plan()
- FakeTransport
- PlaybackLLM
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .projects()
- Source
- RefreshEagerness
- Choice
- AskStrategistIntent
- SmartWard XcodeGen Project Spec
- LocalizedError
- SourceKind
- .render()
- PipelineController
- LibraryFixture
- AppLockController
- GitHubRepoPicker
- ReadingView
- .buildIfDue()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- DeveloperView
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .score()
- String
- SeededRandom
- .canonicalize()
- graphify_pipeline.py
- AppLockPolicy
- Digest
- ArticleStage
- TopK
- BriefError
- FakeBiometrics
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- GitHubError
- LibraryArchive
- .clusters()
- EmbeddingModel
- SourceKindOption
- Observation
- ArchiveError
- .data()
- .graphML()
- Graph View
- ArticleReaderView
- ActivitySheet
- UntrustedText (body/attribute inside its
- RepoSync.swift
- .availability()
- ExtractedArticle
- Living Project Brief
- .perform()
- PINOutcome
- BriefRevisionStatus
- ExtractionTier
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- .library()
- Apple Intelligence Preflight
- AppStore
- GitHubDeviceCode
- BYOKDigestSummarizer
- Line
- .isInvisibleScalar()
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
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift

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

## Communities (155 total, 3 thin omitted)

### Community 0 - "Article"
Cohesion: 0.10
Nodes (33): Article, Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, ReadingSignal, StrategyItem (+25 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "Identifiable"
Cohesion: 0.06
Nodes (33): Identifiable, JSONDecoder, JSONEncoder, NSExtensionContext, Result, SharedImport, Date, Int (+25 more)

### Community 3 - "GraphView"
Cohesion: 0.06
Nodes (47): CGFloat, Color, Hashable, AppNavigation, AppTab, chat, graph, projects (+39 more)

### Community 4 - "RetrievedPassage"
Cohesion: 0.06
Nodes (40): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+32 more)

### Community 5 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 6 - "IngestError"
Cohesion: 0.09
Nodes (29): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+21 more)

### Community 7 - ".dismiss()"
Cohesion: 0.10
Nodes (23): BriefRevision, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date, LLMCompleting (+15 more)

### Community 8 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 9 - ".makeContainer()"
Cohesion: 0.08
Nodes (18): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+10 more)

### Community 10 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 11 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 12 - "GitHubClient"
Cohesion: 0.14
Nodes (14): GitHubClient, .isAuthenticated, GitHubRepo, .id, HTTPTransport, Bool, Data, HTTPURLResponse (+6 more)

### Community 13 - "KnowledgeStore"
Cohesion: 0.15
Nodes (4): IngestKit, KnowledgeStore, Pipeline, XCTest

### Community 14 - "InterestModel"
Cohesion: 0.13
Nodes (19): Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+11 more)

### Community 15 - "OnboardingProposal"
Cohesion: 0.10
Nodes (23): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+15 more)

### Community 16 - "SwiftData"
Cohesion: 0.12
Nodes (7): Accelerate, AppIntents, Foundation, GraphKit, NaturalLanguage, RetrievalKit, SwiftData

### Community 17 - "StrategyItemKind"
Cohesion: 0.13
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 18 - "GitHubDeviceFlow"
Cohesion: 0.12
Nodes (18): GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured, GitHubTokenPoll (+10 more)

### Community 19 - "Conversation"
Cohesion: 0.10
Nodes (22): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+14 more)

### Community 20 - "ExtractedGraph"
Cohesion: 0.15
Nodes (14): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation (+6 more)

### Community 21 - "ReferenceLedger"
Cohesion: 0.15
Nodes (14): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+6 more)

### Community 22 - "PipelineRunner"
Cohesion: 0.15
Nodes (16): DailyBudget, FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext (+8 more)

### Community 23 - "FetchURLTool"
Cohesion: 0.14
Nodes (15): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool, JSONValue (+7 more)

### Community 24 - "RawItem"
Cohesion: 0.16
Nodes (12): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+4 more)

### Community 25 - "Project"
Cohesion: 0.17
Nodes (13): Project, Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool (+5 more)

### Community 26 - ".body"
Cohesion: 0.12
Nodes (20): AppLock, BiometricLockKit, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body (+12 more)

### Community 27 - "GraphSnapshot"
Cohesion: 0.19
Nodes (16): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+8 more)

### Community 28 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 29 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 30 - ".parse()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 31 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 32 - "ActionRequest"
Cohesion: 0.15
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 33 - "SwiftUI"
Cohesion: 0.11
Nodes (6): BackgroundTasks, FoundationModels, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 34 - "BYOKLLMKit"
Cohesion: 0.13
Nodes (4): BYOKLLMKit, ModelCatalogKit, BriefOrigin, StrategistCore

### Community 35 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 36 - ".extract()"
Cohesion: 0.23
Nodes (5): ArticleExtractor, Element, String, URL, ArticleExtractorTests

### Community 37 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 38 - "ExtractionTiers"
Cohesion: 0.16
Nodes (14): ExtractionTiers, FakeCompletion, FakeExtractor, GraphIndexingTests, AsyncThrowingStream, Bool, Error, Int (+6 more)

### Community 39 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 40 - "View"
Cohesion: 0.13
Nodes (19): BriefDiff, ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, BriefDiffView (+11 more)

### Community 41 - "BackgroundWork"
Cohesion: 0.12
Nodes (13): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, TimeInterval (+5 more)

### Community 42 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 43 - "GitHubAccount"
Cohesion: 0.15
Nodes (14): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+6 more)

### Community 44 - "AddSourceView"
Cohesion: 0.14
Nodes (17): CaseIterable, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Filter, all (+9 more)

### Community 45 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 46 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 47 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 48 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 49 - ".process()"
Cohesion: 0.17
Nodes (11): T, ModelContext, TimeInterval, SearchController, SearchResultsView, .body, Int, ModelContext (+3 more)

### Community 50 - ".suggest()"
Cohesion: 0.13
Nodes (14): BriefController, BriefSection, StrategyItemsSection, .body, ModelContext, String, NewProjectView, .body (+6 more)

### Community 51 - "AppLock.swift"
Cohesion: 0.18
Nodes (9): AnyObject, BiometricService, BiometricUnlocking, PINRules, PINService, PINVerifying, BiometricResult, PINAttemptResult (+1 more)

### Community 52 - ".send()"
Cohesion: 0.20
Nodes (11): CheckedContinuation, Never, ActionTools, Set, ChatController, Bool, LLMCompleting, LLMProvider (+3 more)

### Community 53 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 54 - "makeContext()"
Cohesion: 0.15
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 55 - "Scenario"
Cohesion: 0.21
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 56 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 57 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 58 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 59 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 60 - ".seal()"
Cohesion: 0.21
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 61 - ".article()"
Cohesion: 0.24
Nodes (7): FakeFullText, PipelineRunnerTests, Float, ModelContainer, ModelContext, Set, String

### Community 62 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 63 - "PerfTrace"
Cohesion: 0.22
Nodes (11): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+3 more)

### Community 64 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 65 - "IngestController"
Cohesion: 0.17
Nodes (12): Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set (+4 more)

### Community 66 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 67 - "DigestSummaryRequest"
Cohesion: 0.23
Nodes (7): DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMUsage, String, FoundationModelsDigestSummarizer

### Community 68 - "DigestBuilder"
Cohesion: 0.22
Nodes (10): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date (+2 more)

### Community 69 - "EntityResolver"
Cohesion: 0.29
Nodes (7): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID

### Community 70 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 71 - "GraphIndexer"
Cohesion: 0.22
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 72 - "ThemeStrengthCache"
Cohesion: 0.28
Nodes (10): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+2 more)

### Community 73 - "XCTestCase"
Cohesion: 0.12
Nodes (10): PINRulesTests, CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, SampleLibraryTests, GraphExportTests, ExtractionTests (+2 more)

### Community 74 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 75 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 76 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 77 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 78 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 79 - "FakeTransport"
Cohesion: 0.19
Nodes (8): FakeTransport, GitHubClientTests, GitHubDeviceCodeFixture, Data, HTTPURLResponse, Int, URLRequest, Reply

### Community 80 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 81 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 82 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 83 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 84 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 85 - "Source"
Cohesion: 0.25
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 86 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 87 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 88 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary (+5 more)

### Community 89 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 90 - "LocalizedError"
Cohesion: 0.15
Nodes (13): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+5 more)

### Community 91 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 92 - ".render()"
Cohesion: 0.26
Nodes (5): DigestPrompt, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 93 - "PipelineController"
Cohesion: 0.18
Nodes (11): RelevanceJudging, FixedJudge, Bool, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, String (+3 more)

### Community 94 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 95 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 96 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 97 - "ReadingView"
Cohesion: 0.17
Nodes (12): ArticleRow, .body, .content, ReadingView, .emptyState, .filteredOutCount, .hasFollowedSources, .reading (+4 more)

### Community 98 - ".buildIfDue()"
Cohesion: 0.22
Nodes (9): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, TodayView, .body (+1 more)

### Community 99 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 100 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 101 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 102 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 103 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 104 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 105 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 106 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 107 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 108 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 109 - "SeededRandom"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 110 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 111 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 112 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 113 - "Digest"
Cohesion: 0.31
Nodes (8): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body

### Community 114 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 115 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 116 - "BriefError"
Cohesion: 0.20
Nodes (8): BriefError, empty, .errorDescription, notPending, outdated, unchanged, Int, BriefDiffTests

### Community 117 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 118 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 119 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 120 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 121 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 122 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 123 - "LibraryArchive"
Cohesion: 0.39
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 124 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 125 - "EmbeddingModel"
Cohesion: 0.33
Nodes (5): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, Int

### Community 126 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 127 - "Observation"
Cohesion: 0.25
Nodes (3): Observation, GitHubConfig, UserNotifications

### Community 128 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 129 - ".data()"
Cohesion: 0.43
Nodes (4): Data, Float, VectorCoding, VectorCodingTests

### Community 130 - ".graphML()"
Cohesion: 0.39
Nodes (5): GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 131 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 132 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 133 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 134 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 135 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 136 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 137 - "ExtractedArticle"
Cohesion: 0.33
Nodes (4): ExtractedArticle, Date, URL, SwiftSoup

### Community 138 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 139 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 140 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 141 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 142 - "ExtractionTier"
Cohesion: 0.47
Nodes (5): ExtractionTier, byok, onDevice, FakeSummarizer, LLMUsage

### Community 143 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 144 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 145 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 146 - ".library()"
Cohesion: 0.50
Nodes (3): ModelContainer, ModelContext, ThemeStrengthCacheTests

### Community 147 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 148 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 149 - "GitHubDeviceCode"
Cohesion: 0.50
Nodes (4): Decodable, GitHubUser, GitHubDeviceCode, Int

### Community 150 - "BYOKDigestSummarizer"
Cohesion: 0.83
Nodes (3): BYOKDigestSummarizer, LLMCompleting, LLMProvider

### Community 151 - "Line"
Cohesion: 0.50
Nodes (4): Line, added, removed, same

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **288 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+283 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 570 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `Article`, `Identifiable`, `IngestError`, `RepoSync.swift`, `ExtractedArticle`, `GitHubClient`, `KnowledgeStore`, `KnowledgeSchema`, `GitHubDeviceFlow`, `ExtractedGraph`, `AppStore`, `.body`, `.parse()`, `ActionRequest`, `SwiftUI`, `BYOKLLMKit`, `Dependency`, `SourceFetcher`, `AppLock.swift`, `PerfTrace`, `.render()`, `.score()`, `.canonicalize()`, `TopK`, `Observation`?**
  _High betweenness centrality (0.068) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `Identifiable`, `RetrievedPassage`, `ArticleReaderView`, `.dismiss()`, `.makeContainer()`, `InterestModel`, `.library()`, `Conversation`, `PipelineRunner`, `.fetch()`, `ExtractionTiers`, `.load()`, `.process()`, `makeContext()`, `.article()`, `IngestController`, `DigestCluster`, `DigestSummaryRequest`, `.save()`, `GraphIndexer`, `SearchDocument`, `Source`, `ReadingView`, `FakeEmbedder`, `ArticleStage`, `.clusters()`, `EmbeddingModel`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Article`, `SwiftUI`, `BYOKLLMKit`, `RetrievedPassage`, `EntityResolver`, `RepoSync.swift`, `GraphIndexer`, `StrategistRunner`, `SourceFetcher`, `SearchDocument`, `SwiftData`, `.library()`, `AppStore`, `Observation`?**
  _High betweenness centrality (0.036) - this node is a cross-community bridge._
- **Are the 24 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 24 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _288 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Article` be split into smaller, more focused modules?**
  _Cohesion score 0.09626216077828981 - nodes in this community are weakly interconnected._
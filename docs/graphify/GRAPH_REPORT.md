# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 159 files · ~602,286 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2847 nodes · 7298 edges · 163 communities (159 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 873 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- BriefRevision
- GitHubDeviceFlow
- ModelFallback
- IngestError
- ThemeNode
- LocalizedError
- StrategistRunner
- ExtractionTiers
- BYOKLLMKit
- Sendable
- .makeContainer()
- Article
- KnowledgeStore
- DailyBudget
- .messages()
- OnboardingProposal
- Conversation
- SourceKind
- ExtractedGraph
- ConversationView
- Foundation
- FetchURLTool
- InterestModel
- SharedInbox
- ExtractedArticle
- RawItem
- DigestBuilder
- .parse()
- GitHubClient
- DigestSummaryRequest
- Phase 5: Hardening
- View
- SwiftData
- Pipeline module (ingestion, graph, searc
- .fetch()
- SourceFetcher
- Digest
- StrategyItemKind
- .load()
- Choice
- Invariant D5: Private content never goes
- AppLockCoordinator
- Dependency
- ActionRequest
- .outcome()
- ModelCatalogController
- SourceKindOption
- GraphRAG
- RetrievedPassage
- ThemeStrengthCache
- ProjectSnapshot
- .run()
- PerfTrace
- .fetchURL()
- .retrieve()
- OpenArticleTool
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- GitHubError
- .seal()
- PipelineRunner
- Scenario
- EntityResolver
- .build()
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- ShareModel
- Project
- .article()
- Approval Before Actions
- BackgroundWork
- Strategist Layer
- IngestController
- DigestCluster
- .save()
- OnboardingView
- EditLinkView
- Kind
- SmartWard (iOS Application Target)
- SearchDocument
- PlaybackLLM
- .update()
- .dismiss()
- BackupView
- AppLock.swift
- GraphSnapshot
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- SharedItem
- .projects()
- AppLockController
- RefreshEagerness
- NewConversationView
- SmartWard XcodeGen Project Spec
- GraphView
- AppLockPolicy
- Source
- EmbeddingModel
- SeededRandom
- GitHubRepoPicker
- Identifiable
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GitHubRepo
- SearchController
- .data()
- DeveloperView
- AskStrategistIntent
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .score()
- HybridSearchIndex
- String
- LibraryFixture
- XCTestCase
- .process()
- AppLockTests.swift
- graphify_pipeline.py
- ArticleStage
- .decision()
- TopK
- FakeBiometrics
- FoundationModelsEntityExtractor
- ThemeDetailView
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- .graphML()
- .documents()
- RetrievalFixture
- AppTab
- ArchiveError
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- RepoSync.swift
- FakeTransport
- .vector()
- ProviderKeyRow
- Living Project Brief
- .color()
- PINOutcome
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- Apple Intelligence Preflight
- AppStore
- ConversationView.swift
- ApprovalDecision
- Summary
- IntentFailure
- SmartWardShortcuts
- Result
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 89 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 66 edges
5. `Source` - 53 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 39 edges
8. `BYOKLLMKit` - 35 edges
9. `LibraryArchive` - 34 edges
10. `ProjectLink` - 34 edges

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

## Communities (163 total, 4 thin omitted)

### Community 0 - "BriefRevision"
Cohesion: 0.06
Nodes (39): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, ProjectBrief (+31 more)

### Community 1 - "GitHubDeviceFlow"
Cohesion: 0.05
Nodes (43): CodingKey, CodingKeys, deviceCode, expiresIn, interval, userCode, verificationURI, GitHubDeviceCode (+35 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "IngestError"
Cohesion: 0.08
Nodes (30): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+22 more)

### Community 4 - "ThemeNode"
Cohesion: 0.12
Nodes (22): Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal, Bool (+14 more)

### Community 5 - "LocalizedError"
Cohesion: 0.06
Nodes (34): LocalizedError, LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext (+26 more)

### Community 6 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 7 - "ExtractionTiers"
Cohesion: 0.10
Nodes (20): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, GraphLinker, String, FakeCompletion (+12 more)

### Community 8 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (6): BYOKLLMKit, FoundationModels, ModelCatalogKit, Observation, StrategistCore, UserNotifications

### Community 9 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 10 - ".makeContainer()"
Cohesion: 0.11
Nodes (14): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+6 more)

### Community 11 - "Article"
Cohesion: 0.10
Nodes (20): Article, GraphEditing, ModelContext, GraphEditingTests, GraphSnapshotTests, Date, Bool, ModelContext (+12 more)

### Community 12 - "KnowledgeStore"
Cohesion: 0.16
Nodes (4): IngestKit, KnowledgeStore, Pipeline, XCTest

### Community 13 - "DailyBudget"
Cohesion: 0.16
Nodes (16): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+8 more)

### Community 14 - ".messages()"
Cohesion: 0.09
Nodes (15): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+7 more)

### Community 15 - "OnboardingProposal"
Cohesion: 0.10
Nodes (23): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+15 more)

### Community 16 - "Conversation"
Cohesion: 0.10
Nodes (15): ContextPolicy, Bool, Conversation, .mode, ConversationMode, brainstorm, critique, onboarding (+7 more)

### Community 17 - "SourceKind"
Cohesion: 0.10
Nodes (25): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+17 more)

### Community 18 - "ExtractedGraph"
Cohesion: 0.14
Nodes (16): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation, JSONValue (+8 more)

### Community 19 - "ConversationView"
Cohesion: 0.11
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 20 - "Foundation"
Cohesion: 0.08
Nodes (7): Accelerate, AppIntents, Foundation, GraphKit, NaturalLanguage, RetrievalKit, GitHubConfig

### Community 21 - "FetchURLTool"
Cohesion: 0.12
Nodes (18): Decodable, AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool (+10 more)

### Community 22 - "InterestModel"
Cohesion: 0.15
Nodes (17): Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+9 more)

### Community 23 - "SharedInbox"
Cohesion: 0.13
Nodes (12): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedProject, URL, SharedInboxTests (+4 more)

### Community 24 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 25 - "RawItem"
Cohesion: 0.15
Nodes (12): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+4 more)

### Community 26 - "DigestBuilder"
Cohesion: 0.16
Nodes (14): DigestBuilder, DigestSummarizing, Group, Bool, Date, ModelContext, TimeInterval, UUID (+6 more)

### Community 27 - ".parse()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 28 - "GitHubClient"
Cohesion: 0.19
Nodes (8): GitHubClient, .isAuthenticated, GitHubUser, Set, String, T, GitHubClientTests, URLQueryItem

### Community 29 - "DigestSummaryRequest"
Cohesion: 0.16
Nodes (12): BYOKDigestSummarizer, DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider (+4 more)

### Community 30 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 31 - "View"
Cohesion: 0.13
Nodes (21): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+13 more)

### Community 32 - "SwiftData"
Cohesion: 0.15
Nodes (4): BackgroundTasks, ShareInbox, SwiftData, SwiftUI

### Community 33 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 34 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 35 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 36 - "Digest"
Cohesion: 0.14
Nodes (17): Digest, .clusters, Bool, Date, DigestController, .notificationsEnabled, FoundationModelsDigestSummarizer, Bool (+9 more)

### Community 37 - "StrategyItemKind"
Cohesion: 0.11
Nodes (20): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+12 more)

### Community 38 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 39 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 40 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 41 - "AppLockCoordinator"
Cohesion: 0.18
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, PINAttemptResult, String, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 42 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 43 - "ActionRequest"
Cohesion: 0.16
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 44 - ".outcome()"
Cohesion: 0.15
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 45 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 46 - "SourceKindOption"
Cohesion: 0.13
Nodes (18): AppEntity, AppEnum, DisplayRepresentation, EntityQuery, libraryContext(), ProjectEntity, .displayRepresentation, ProjectQuery (+10 more)

### Community 47 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 48 - "RetrievedPassage"
Cohesion: 0.18
Nodes (7): ReferenceContext, RetrievedPassage, ReferenceLedger, String, UntrustedText, FetchURLToolTests, ResearchToolTests

### Community 49 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 50 - "ProjectSnapshot"
Cohesion: 0.20
Nodes (7): Item, ProjectSnapshot, StrategistPrompt, Bool, Set, String, StrategistPromptTests

### Community 51 - ".run()"
Cohesion: 0.22
Nodes (10): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+2 more)

### Community 52 - "PerfTrace"
Cohesion: 0.18
Nodes (12): DispatchTime, os, PerfTrace, .names, .samples, Sample, Date, Double (+4 more)

### Community 53 - ".fetchURL()"
Cohesion: 0.23
Nodes (7): SourceEndpoint, String, URL, SourceEndpointTests, String, URL, AddSourceToolTests

### Community 54 - ".retrieve()"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 55 - "OpenArticleTool"
Cohesion: 0.19
Nodes (12): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, SearchCorpusTool, .definition, JSONValue (+4 more)

### Community 56 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 57 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 58 - "GitHubError"
Cohesion: 0.15
Nodes (14): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, HTTPTransport (+6 more)

### Community 59 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 60 - "PipelineRunner"
Cohesion: 0.22
Nodes (12): FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext, Set (+4 more)

### Community 61 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 62 - "EntityResolver"
Cohesion: 0.25
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 63 - ".build()"
Cohesion: 0.22
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 64 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 65 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 66 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 67 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 68 - "ShareModel"
Cohesion: 0.17
Nodes (11): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+3 more)

### Community 69 - "Project"
Cohesion: 0.25
Nodes (8): Project, ProjectStateTool, .definition, RecordStrategyItemTool, JSONValue, LLMTool, String, ProjectToolTests

### Community 70 - ".article()"
Cohesion: 0.24
Nodes (7): ArticleIndexer, Int, FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 71 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 72 - "BackgroundWork"
Cohesion: 0.17
Nodes (9): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, TimeInterval (+1 more)

### Community 73 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 74 - "IngestController"
Cohesion: 0.17
Nodes (12): Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set (+4 more)

### Community 75 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 76 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 77 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 78 - "EditLinkView"
Cohesion: 0.13
Nodes (13): BriefSection, EditLinkView, .body, .trimmed, NewProjectView, .body, ProjectDetailView, .body (+5 more)

### Community 79 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 80 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 81 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 82 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 83 - ".update()"
Cohesion: 0.16
Nodes (11): LockScreen, PrivacyCover, .body, Bool, LockOverlay, .body, LockWindow, Bool (+3 more)

### Community 84 - ".dismiss()"
Cohesion: 0.19
Nodes (12): SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding, Double (+4 more)

### Community 85 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 86 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 87 - "GraphSnapshot"
Cohesion: 0.24
Nodes (11): CGFloat, ForceLayout, GraphSnapshot, Point, GraphCanvas, .body, Void, ThemeList (+3 more)

### Community 88 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 89 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 90 - "SharedItem"
Cohesion: 0.26
Nodes (8): SharedImport, Date, ModelContext, SharedItem, Date, String, UUID, SharedImportTests

### Community 91 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 92 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 93 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 94 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 95 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 96 - "GraphView"
Cohesion: 0.24
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 97 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 98 - "Source"
Cohesion: 0.28
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 99 - "EmbeddingModel"
Cohesion: 0.23
Nodes (8): EmbeddingModel, EmbeddingProviding, String, GraphIndexer, .suggestionsAdded, Date, Int, ModelContext

### Community 100 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 101 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 102 - "Identifiable"
Cohesion: 0.20
Nodes (12): CaseIterable, Identifiable, Filter, all, .id, starred, unread, Order (+4 more)

### Community 103 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 104 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 105 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 106 - "GitHubRepo"
Cohesion: 0.18
Nodes (11): CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt, topics (+3 more)

### Community 107 - "SearchController"
Cohesion: 0.27
Nodes (7): SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID

### Community 108 - ".data()"
Cohesion: 0.27
Nodes (6): Data, Float, VectorCoding, ModelContext, Set, UUID

### Community 109 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 110 - "AskStrategistIntent"
Cohesion: 0.29
Nodes (10): AppIntent, IntentAuthenticationPolicy, IntentResult, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent, OpenDigestIntent (+2 more)

### Community 111 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 112 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 113 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 114 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 115 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 116 - "HybridSearchIndex"
Cohesion: 0.38
Nodes (6): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int

### Community 117 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 118 - "LibraryFixture"
Cohesion: 0.22
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 119 - "XCTestCase"
Cohesion: 0.22
Nodes (7): NormalizedKeyTests, BudgetTests, Double, ModelContext, String, VectorCodingTests, XCTestCase

### Community 120 - ".process()"
Cohesion: 0.24
Nodes (9): FoundationModelsRelevanceJudge, PipelineController, Bool, ModelContext, String, TimeInterval, Triage.Strength, .label (+1 more)

### Community 121 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 122 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 123 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 124 - ".decision()"
Cohesion: 0.33
Nodes (4): ActionTools, Set, String, ApprovalPolicyTests

### Community 125 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 126 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 127 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 128 - "ThemeDetailView"
Cohesion: 0.31
Nodes (8): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions

### Community 129 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 130 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 131 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 132 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 133 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 134 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 135 - "RetrievalFixture"
Cohesion: 0.42
Nodes (4): GraphRetrieverTests, RetrievalFixture, ModelContainer, UUID

### Community 136 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 137 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 138 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 139 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 140 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 141 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 142 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 143 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 144 - "FakeTransport"
Cohesion: 0.43
Nodes (5): FakeTransport, Data, HTTPURLResponse, URLRequest, Reply

### Community 145 - ".vector()"
Cohesion: 0.43
Nodes (4): FixedJudge, Bool, Float, String

### Community 146 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 147 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 148 - ".color()"
Cohesion: 0.40
Nodes (4): Color, .body, ThemeStyle, .body

### Community 149 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 150 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 151 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 152 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 153 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 154 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 156 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 157 - "Summary"
Cohesion: 0.50
Nodes (4): Summary, Int, .parameterSummary, .parameterSummary

### Community 158 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

### Community 159 - "SmartWardShortcuts"
Cohesion: 0.67
Nodes (3): AppShortcut, AppShortcutsProvider, SmartWardShortcuts

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **303 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+298 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 594 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ThemeNode`, `ExtractionTiers`, `RetrievalFixture`, `.makeContainer()`, `ArticleReaderView`, `Conversation`, `ConversationView`, `InterestModel`, `DigestBuilder`, `DigestSummaryRequest`, `.fetch()`, `.load()`, `ThemeStrengthCache`, `PipelineRunner`, `.article()`, `IngestController`, `DigestCluster`, `.save()`, `SearchDocument`, `.dismiss()`, `SharedItem`, `Source`, `SearchController`, `FakeEmbedder`, `XCTestCase`, `ArticleStage`?**
  _High betweenness centrality (0.055) - this node is a cross-community bridge._
- **Why does `Foundation` connect `Foundation` to `GitHubDeviceFlow`, `IngestError`, `ThemeNode`, `BYOKLLMKit`, `KnowledgeStore`, `DailyBudget`, `RepoSync.swift`, `SharedInbox`, `ExtractedArticle`, `KnowledgeSchema`, `AppStore`, `.parse()`, `ConversationView.swift`, `SwiftData`, `SourceFetcher`, `Dependency`, `.outcome()`, `RetrievedPassage`, `PerfTrace`, `GitHubError`, `AppLock.swift`, `.canonicalize()`, `.score()`, `AppLockTests.swift`, `TopK`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `SwiftData`, `SourceFetcher`, `EmbeddingModel`, `StrategistRunner`, `ExtractionTiers`, `BYOKLLMKit`, `Article`, `RepoSync.swift`, `SearchDocument`, `ThemeStrengthCache`, `Foundation`, `.retrieve()`, `AppStore`, `ConversationView.swift`, `EntityResolver`?**
  _High betweenness centrality (0.033) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _303 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `BriefRevision` be split into smaller, more focused modules?**
  _Cohesion score 0.0642243328810493 - nodes in this community are weakly interconnected._
- **Should `GitHubDeviceFlow` be split into smaller, more focused modules?**
  _Cohesion score 0.05288207297726071 - nodes in this community are weakly interconnected._
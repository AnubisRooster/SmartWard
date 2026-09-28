# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 161 files · ~606,087 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2872 nodes · 7358 edges · 158 communities (154 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 878 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ThemeNode
- AppLockCoordinator
- IngestError
- DailyBudget
- PipelineRunner
- Source
- Project
- StrategistRunner
- GitHubDeviceFlow
- StrategyItemKind
- FetchURLTool
- Choice
- KnowledgeStore
- .makeContainer()
- Foundation
- Sendable
- .dismiss()
- GitHubClient
- ReferenceLedger
- SwiftData
- ExtractedArticle
- GraphSnapshot
- RawItem
- DigestBuilder
- Article
- OnboardingProposal
- Phase 5: Hardening
- BYOKLLMKit
- Pipeline module (ingestion, graph, searc
- .parse()
- SourceFetcher
- ExtractedGraph
- RecordStrategyItemTool
- .fetch()
- .outcome()
- OnboardingView
- Invariant D5: Private content never goes
- PerfTrace
- .score()
- SharedInbox
- Dependency
- ProjectLink
- .load()
- StrategistTool
- XCTestCase
- ThemeDetailView
- GraphRAG
- DigestSummaryRequest
- RetrievedPassage
- HybridSearchIndex
- BriefError
- .body
- View
- .run()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- FlakyLLM
- SearchHit
- .seal()
- GraphIndexer
- Scenario
- SearchDocument
- GitHubRepo
- FakeEmbedder
- .fetchURL()
- Digest
- ThemeStrengthCache
- .importPending()
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- ShareModel
- .fetch()
- .decode()
- Approval Before Actions
- ConversationView
- GitHubRepoPicker
- AskStrategistIntent
- Strategist Layer
- GitHubAccount
- .process()
- .plan()
- Kind
- CodingKeys
- SmartWard (iOS Application Target)
- Identifiable
- LibraryArchive
- EntityResolver
- .save()
- .messages()
- PlaybackLLM
- RetrievalFixture
- BackupView
- FallbackLLM
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- .projects()
- InterestModel
- NewConversationView
- SourcesList
- .buildIfDue()
- SmartWard XcodeGen Project Spec
- SourceKind
- .data()
- AppLockController
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- DigestSummary
- LibraryFixture
- OnboardingReviewView
- DeveloperView
- .body
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .importItems()
- ModelFallback
- .canonicalize()
- graphify_pipeline.py
- TopK
- CannedLLM
- AppTab
- .update()
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- LocalizedError
- FoundationModelsEntityExtractor
- SourceKindOption
- ArchiveError
- LexicalIndex
- Strength
- FakeCompletion
- Graph View
- ArticleReaderView
- DigestClusterSection
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- .perform()
- ExtractionTier
- ModelFallbackTests
- Living Project Brief
- .send()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- RepoSyncTests
- Apple Intelligence Preflight
- AppStore
- ConversationView.swift
- ApprovalDecision
- SharedInboxTests
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 89 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 66 edges
5. `Source` - 54 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 39 edges
8. `BYOKLLMKit` - 35 edges
9. `XCTest` - 35 edges
10. `LibraryArchive` - 34 edges

## Surprising Connections (you probably didn't know these)
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (158 total, 4 thin omitted)

### Community 0 - "ThemeNode"
Cohesion: 0.07
Nodes (39): ContextPolicy, Bool, Chunk, Conversation, EntityAlias, InterestProfile, Mention, MergeSuggestion (+31 more)

### Community 1 - "AppLockCoordinator"
Cohesion: 0.06
Nodes (40): AnyObject, AppLockCoordinator, .biometryName, .isPINLockedOut, .pinLockoutRemaining, AppLockPolicy, BiometricService, BiometricStep (+32 more)

### Community 2 - "IngestError"
Cohesion: 0.06
Nodes (40): NSObject, IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL (+32 more)

### Community 3 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 4 - "PipelineRunner"
Cohesion: 0.11
Nodes (21): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, PipelineRunner, .stages, Report, Bool (+13 more)

### Community 5 - "Source"
Cohesion: 0.08
Nodes (33): BGContinuedProcessingTask, Source, .body, FullTextError, .errorDescription, nothingMore, IngestController, Bool (+25 more)

### Community 6 - "Project"
Cohesion: 0.13
Nodes (21): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Project (+13 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 8 - "GitHubDeviceFlow"
Cohesion: 0.10
Nodes (22): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, failed, GitHubTokenPoll, pending, slowDown, token (+14 more)

### Community 9 - "StrategyItemKind"
Cohesion: 0.09
Nodes (22): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, .kind (+14 more)

### Community 10 - "FetchURLTool"
Cohesion: 0.10
Nodes (18): ActionTools, AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool (+10 more)

### Community 11 - "Choice"
Cohesion: 0.07
Nodes (31): CaseIterable, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv (+23 more)

### Community 12 - "KnowledgeStore"
Cohesion: 0.14
Nodes (5): IngestKit, KnowledgeStore, Pipeline, GitHubConfig, XCTest

### Community 13 - ".makeContainer()"
Cohesion: 0.11
Nodes (16): Bool, ModelContainer, EntityExtracting, ExtractionTiers, BudgetTests, Double, ModelContext, String (+8 more)

### Community 14 - "Foundation"
Cohesion: 0.07
Nodes (9): AppIntents, BackgroundTasks, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security (+1 more)

### Community 15 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 16 - ".dismiss()"
Cohesion: 0.10
Nodes (22): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit, LockScreen, PrivacyCover, .body (+14 more)

### Community 17 - "GitHubClient"
Cohesion: 0.16
Nodes (11): GitHubClient, .isAuthenticated, Data, HTTPURLResponse, Set, String, T, URLRequest (+3 more)

### Community 18 - "ReferenceLedger"
Cohesion: 0.14
Nodes (16): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+8 more)

### Community 19 - "SwiftData"
Cohesion: 0.15
Nodes (5): FoundationModels, Observation, SwiftData, SwiftUI, UserNotifications

### Community 20 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 21 - "GraphSnapshot"
Cohesion: 0.17
Nodes (19): CGFloat, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all (+11 more)

### Community 22 - "RawItem"
Cohesion: 0.15
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 23 - "DigestBuilder"
Cohesion: 0.15
Nodes (15): DigestBuilder, DigestSummarizing, Group, Bool, Date, ModelContext, TimeInterval, UUID (+7 more)

### Community 24 - "Article"
Cohesion: 0.09
Nodes (16): Article, .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched (+8 more)

### Community 25 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 26 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 27 - "BYOKLLMKit"
Cohesion: 0.14
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 28 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 29 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 30 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 31 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 32 - "RecordStrategyItemTool"
Cohesion: 0.15
Nodes (12): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue (+4 more)

### Community 33 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 34 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 35 - "OnboardingView"
Cohesion: 0.10
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 36 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 37 - "PerfTrace"
Cohesion: 0.16
Nodes (15): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+7 more)

### Community 38 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 39 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 40 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 41 - "ProjectLink"
Cohesion: 0.16
Nodes (11): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+3 more)

### Community 42 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 43 - "StrategistTool"
Cohesion: 0.14
Nodes (16): StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult, StrategistTool (+8 more)

### Community 44 - "XCTestCase"
Cohesion: 0.11
Nodes (14): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, SampleLibraryTests, PerformanceTests, SeededRandom, String (+6 more)

### Community 45 - "ThemeDetailView"
Cohesion: 0.14
Nodes (17): Color, .body, ThemeStyle, Connection, .id, String, UUID, Void (+9 more)

### Community 46 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 47 - "DigestSummaryRequest"
Cohesion: 0.16
Nodes (9): DigestPrompt, DigestSummaryRequest, Int, ExtractionPrompt, .schema, JSONValue, ReferenceContext, String (+1 more)

### Community 48 - "RetrievedPassage"
Cohesion: 0.17
Nodes (14): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+6 more)

### Community 49 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (9): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+1 more)

### Community 50 - "BriefError"
Cohesion: 0.13
Nodes (16): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+8 more)

### Community 51 - ".body"
Cohesion: 0.15
Nodes (16): BriefController, BriefEditorView, .body, BriefHistoryView, .body, BriefOrigin, BriefReviewView, .body (+8 more)

### Community 52 - "View"
Cohesion: 0.15
Nodes (18): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+10 more)

### Community 53 - ".run()"
Cohesion: 0.24
Nodes (10): CheckedContinuation, Never, ActionRequest, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider (+2 more)

### Community 54 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 55 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 56 - "FlakyLLM"
Cohesion: 0.16
Nodes (13): LLMCompletionError, Behavior, fail, failMidStream, ok, FallbackLLMTests, FlakyLLM, AsyncThrowingStream (+5 more)

### Community 57 - "SearchHit"
Cohesion: 0.17
Nodes (15): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body (+7 more)

### Community 58 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 59 - "GraphIndexer"
Cohesion: 0.21
Nodes (10): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+2 more)

### Community 60 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 61 - "SearchDocument"
Cohesion: 0.22
Nodes (11): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID (+3 more)

### Community 62 - "GitHubRepo"
Cohesion: 0.14
Nodes (15): Decodable, GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized (+7 more)

### Community 63 - "FakeEmbedder"
Cohesion: 0.19
Nodes (9): EmbeddingProviding, FakeEmbedder, .dimension, FixedJudge, Bool, Float, Int, String (+1 more)

### Community 64 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 65 - "Digest"
Cohesion: 0.26
Nodes (13): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+5 more)

### Community 66 - "ThemeStrengthCache"
Cohesion: 0.24
Nodes (11): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+3 more)

### Community 67 - ".importPending()"
Cohesion: 0.17
Nodes (9): App, Scene, SmartWardApp, .body, BackgroundWork, ShareIntake, Int, ModelContext (+1 more)

### Community 68 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 69 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 70 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 71 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 72 - "ShareModel"
Cohesion: 0.17
Nodes (11): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+3 more)

### Community 73 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 74 - ".decode()"
Cohesion: 0.15
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 75 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 76 - "ConversationView"
Cohesion: 0.17
Nodes (11): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+3 more)

### Community 77 - "GitHubRepoPicker"
Cohesion: 0.14
Nodes (14): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+6 more)

### Community 78 - "AskStrategistIntent"
Cohesion: 0.17
Nodes (16): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent (+8 more)

### Community 79 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 80 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 81 - ".process()"
Cohesion: 0.16
Nodes (11): Triage, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, ModelContext, String, TimeInterval (+3 more)

### Community 82 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 83 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 84 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 85 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 86 - "Identifiable"
Cohesion: 0.14
Nodes (15): Identifiable, BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id (+7 more)

### Community 87 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 88 - "EntityResolver"
Cohesion: 0.30
Nodes (7): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID

### Community 89 - ".save()"
Cohesion: 0.24
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 90 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 91 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 92 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 93 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 94 - "FallbackLLM"
Cohesion: 0.25
Nodes (9): Alternatives, LLMCompleting, FallbackLLM, AsyncThrowingStream, Error, Int, LLMRequest, LLMResponse (+1 more)

### Community 95 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 96 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 97 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 98 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 99 - "InterestModel"
Cohesion: 0.32
Nodes (7): Interest, InterestModel, .isEmpty, Bool, Float, String, TriageTests

### Community 100 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 101 - "SourcesList"
Cohesion: 0.19
Nodes (10): EmptyChatHint, .body, .purpose, MessageRow, .body, .bubble, .speaker, SourcesList (+2 more)

### Community 102 - ".buildIfDue()"
Cohesion: 0.20
Nodes (10): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, DigestSettingsSection, .body (+2 more)

### Community 103 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 104 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 105 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 106 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 107 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 108 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 109 - "DigestSummary"
Cohesion: 0.27
Nodes (7): BYOKDigestSummarizer, DigestSummary, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String

### Community 110 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 111 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 112 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 113 - ".body"
Cohesion: 0.17
Nodes (10): NewProjectView, .body, ProjectsView, .body, IndexSet, ComingSoonView, .body, RootView (+2 more)

### Community 114 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 115 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 116 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 117 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 118 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 119 - "ModelFallback"
Cohesion: 0.40
Nodes (5): ModelFallback, Bool, CatalogEntry, LLMProvider, String

### Community 120 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 121 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 122 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 123 - "CannedLLM"
Cohesion: 0.27
Nodes (7): CannedLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent, String

### Community 124 - "AppTab"
Cohesion: 0.24
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 125 - ".update()"
Cohesion: 0.27
Nodes (6): LockOverlay, LockWindow, Bool, UIKit, UIWindow, UIWindowScene

### Community 126 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 127 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 128 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 129 - "LocalizedError"
Cohesion: 0.22
Nodes (9): LocalizedError, GitHubDeviceFlowError, denied, .errorDescription, expired, notConfigured, StrategistError, .errorDescription (+1 more)

### Community 130 - "FoundationModelsEntityExtractor"
Cohesion: 0.39
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 131 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 132 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 133 - "LexicalIndex"
Cohesion: 0.36
Nodes (3): LexicalIndex, .count, LexicalIndexTests

### Community 134 - "Strength"
Cohesion: 0.29
Nodes (7): Strength, balanced, off, strict, .threshold, Double, TriageScore

### Community 135 - "FakeCompletion"
Cohesion: 0.29
Nodes (6): FakeCompletion, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent

### Community 136 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 137 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 138 - "DigestClusterSection"
Cohesion: 0.32
Nodes (6): DigestClusterSection, .body, DigestSections, .body, String, UUID

### Community 139 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 140 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 141 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 142 - ".perform()"
Cohesion: 0.38
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 143 - "ExtractionTier"
Cohesion: 0.38
Nodes (5): ExtractionTier, byok, onDevice, FakeSummarizer, LLMUsage

### Community 144 - "ModelFallbackTests"
Cohesion: 0.38
Nodes (6): ModelFallbackTests, .catalog, Bool, CatalogEntry, Double, Int

### Community 145 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 146 - ".send()"
Cohesion: 0.33
Nodes (4): Data, HTTPURLResponse, URLRequest, Reply

### Community 147 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 148 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 149 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 150 - "RepoSyncTests"
Cohesion: 0.50
Nodes (3): RepoSyncTests, Bool, String

### Community 151 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 152 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 154 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **303 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+298 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 599 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ThemeNode`, `PipelineRunner`, `Source`, `ArticleReaderView`, `DigestClusterSection`, `.makeContainer()`, `.dismiss()`, `DigestBuilder`, `.load()`, `DigestSummaryRequest`, `View`, `SearchHit`, `GraphIndexer`, `SearchDocument`, `.fetch()`, `.save()`, `RetrievalFixture`, `SourcesList`, `.importItems()`?**
  _High betweenness centrality (0.046) - this node is a cross-community bridge._
- **Why does `Foundation` connect `Foundation` to `ThemeNode`, `AppLockCoordinator`, `IngestError`, `DailyBudget`, `GitHubDeviceFlow`, `KnowledgeStore`, `.dismiss()`, `SwiftData`, `ExtractedArticle`, `KnowledgeSchema`, `AppStore`, `ConversationView.swift`, `BYOKLLMKit`, `.parse()`, `SourceFetcher`, `.outcome()`, `PerfTrace`, `.score()`, `SharedInbox`, `Dependency`, `StrategistTool`, `DigestSummaryRequest`, `SearchDocument`, `GitHubRepo`, `.canonicalize()`, `TopK`, `AppTab`?**
  _High betweenness centrality (0.043) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `ThemeNode`, `.score()`, `StrategistRunner`, `BYOKLLMKit`, `Foundation`, `RetrievedPassage`, `AppStore`, `SwiftData`, `Article`, `ConversationView.swift`, `GraphIndexer`, `SearchDocument`, `SourceFetcher`?**
  _High betweenness centrality (0.036) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _303 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ThemeNode` be split into smaller, more focused modules?**
  _Cohesion score 0.06538987688098495 - nodes in this community are weakly interconnected._
- **Should `AppLockCoordinator` be split into smaller, more focused modules?**
  _Cohesion score 0.058653846153846154 - nodes in this community are weakly interconnected._
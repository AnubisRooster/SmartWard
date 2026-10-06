# Graph Report - SmartWard  (2026-10-06)

## Corpus Check
- Large corpus: 208 files · ~858,473 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 4060 nodes · 10581 edges · 198 communities (192 shown, 6 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 1228 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- AnalyzerCommandRecognizer
- GraphView
- .load()
- ArticleReadoutController
- ModelFallback
- String
- VoiceCommandController
- .outcome()
- VoiceCommand
- SourceKindOption
- ThemeNode
- FetchURLTool
- PipelineRunner
- ExtractionTiers
- StrategistRunner
- .makeContainer()
- ArticleSummary
- Section
- Project
- ProjectArticlesTests
- GitHubDeviceFlow
- StrategyItemKind
- SwiftData
- KnowledgeStore
- Sendable
- GitHubClient
- String
- DigestBuilder
- Source
- DailyBudget
- RetrievedPassage
- SharedInbox
- GraphIndexer
- ConversationView
- View
- DigestSummaryRequest
- VoiceIntent
- .outcome()
- SourceKind
- .body
- RawItem
- String
- Pipeline
- BYOKLLMKit
- BriefingTests
- OpenArticleTool
- Article
- RecordStrategyItemTool
- .run()
- XCTestCase
- OnboardingProposal
- Chunk
- CaseIterable
- AppLockCoordinator
- SourceFetcher
- ActionRequest
- VoiceCommandTests
- Phase 5: Hardening
- OnboardingView
- ProviderModelController
- Pipeline module (ingestion, graph, searc
- GraphIndexer.swift
- .extract()
- .items()
- .check()
- VoiceConfirmationGate
- .fetch()
- Invariant D5: Private content never goes
- .score()
- Dependency
- Conversation
- Choice
- ModelCatalogController
- CodingKeys
- GraphRAG
- ExtractedArticle
- Scenario
- ReadoutPlayback
- HybridSearchIndex
- VoiceContext
- PerfTrace
- .seal()
- VoiceCommands.swift
- VoiceSpeaker
- .extract()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- LocalizedError
- IngestError
- .check()
- GitHubRepo
- RedirectPolicy
- .fetchURL()
- Digest
- ReadoutSegment
- BackgroundWork
- ConversationView.swift
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- .parse()
- .makeFixture()
- .article()
- .check()
- Approval Before Actions
- GitHubRepoPicker
- Strategist Layer
- ShareModel
- .parse()
- GitHubAccount
- Kind
- SmartWard (iOS Application Target)
- .segments()
- ThemeEdge
- .decode()
- VoiceTab
- .messages()
- FakeTransport
- PlaybackLLM
- AppLockController
- BackupView
- VoiceIntentResolver
- AppLock.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- SeededRandom
- .check()
- PipelineController
- ArticleSummaryController
- .refresh()
- RootView
- SmartWard XcodeGen Project Spec
- BriefViews.swift
- AppLockPolicy
- Anchor
- SearchDocument
- .text()
- StepProgress
- RefreshEagerness
- .update()
- .start()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .insertRows()
- SearchController
- FakeClock
- LibraryFixture
- .check()
- OnboardingReviewView
- ArticleReaderView
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .apply()
- .fromPastedURL()
- String
- IndexingDetailsView
- AppLockTests.swift
- graphify_pipeline.py
- AppNavigation
- RobotsRules
- TopK
- FakeBiometrics
- .body
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- GraphRunStats
- .buildIfDue()
- ArchiveError
- Graph View
- UntrustedText (body/attribute inside its
- ActivitySheet
- .send()
- StubTool
- .fallbackLLM()
- FoundationModelsRelevanceJudge
- Living Project Brief
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- Status
- ExtractedGraph
- Outcome
- Apple Intelligence Preflight
- AppStore
- Phase
- FakePIN
- Result
- ApprovalDecision
- Refused
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 120 edges
2. `KnowledgeStore` - 113 edges
3. `SwiftData` - 96 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 79 edges
6. `Source` - 63 edges
7. `Pipeline` - 58 edges
8. `PipelineRunner` - 54 edges
9. `ArticleReadoutController` - 53 edges
10. `VoiceCommandController` - 53 edges

## Surprising Connections (you probably didn't know these)
- `.body` --references--> `Digest`  [INFERRED]
  SmartWard/Today/TodayView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Digest.swift
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift

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

## Communities (198 total, 6 thin omitted)

### Community 0 - "AnalyzerCommandRecognizer"
Cohesion: 0.05
Nodes (40): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, AnalyzerCommandRecognizer (+32 more)

### Community 1 - "GraphView"
Cohesion: 0.07
Nodes (47): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+39 more)

### Community 2 - ".load()"
Cohesion: 0.06
Nodes (40): Data, Float, VectorCoding, SampleLibrary, Size, SplitMix, Bool, Date (+32 more)

### Community 3 - "ArticleReadoutController"
Cohesion: 0.07
Nodes (32): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, MPRemoteCommand, ObjectIdentifier, ReadoutScope, summaryOnly, whole (+24 more)

### Community 4 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 5 - "String"
Cohesion: 0.09
Nodes (28): Set, BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded (+20 more)

### Community 6 - "VoiceCommandController"
Cohesion: 0.09
Nodes (17): AVAudioSession, CommandRecognizing, Outcome, Bool, ModelContext, Never, NSObjectProtocol, String (+9 more)

### Community 7 - ".outcome()"
Cohesion: 0.10
Nodes (14): LibraryVoiceQueries, SpokenAnswer, Bool, Date, Double, Int, ModelContext, String (+6 more)

### Community 8 - "VoiceCommand"
Cohesion: 0.04
Nodes (47): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+39 more)

### Community 9 - "SourceKindOption"
Cohesion: 0.06
Nodes (40): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, AudioPlaybackIntent, DisplayRepresentation, EntityQuery (+32 more)

### Community 10 - "ThemeNode"
Cohesion: 0.10
Nodes (27): ThemeNode, EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float (+19 more)

### Community 11 - "FetchURLTool"
Cohesion: 0.09
Nodes (21): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+13 more)

### Community 12 - "PipelineRunner"
Cohesion: 0.12
Nodes (18): ArticleIndexer, Backlog, .total, FullTextFetching, PipelineRunner, Report, Bool, Date (+10 more)

### Community 13 - "ExtractionTiers"
Cohesion: 0.10
Nodes (19): ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, .inputs (+11 more)

### Community 14 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 15 - ".makeContainer()"
Cohesion: 0.14
Nodes (14): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Error, Int (+6 more)

### Community 16 - "ArticleSummary"
Cohesion: 0.10
Nodes (17): ArticleSummarizer, ArticleSummarizing, ArticleSummaryOutput, BYOKArticleSummarizer, Bool, Date, LLMCompleting, LLMProvider (+9 more)

### Community 17 - "Section"
Cohesion: 0.07
Nodes (37): Section, entities, relations, ActionApprovalSettingsSection, .body, .body, VoiceSettingsSection, .body (+29 more)

### Community 18 - "Project"
Cohesion: 0.12
Nodes (17): Project, ProjectBrief, ProjectVoiceQueries, Int, ModelContext, BriefEditing, tooLong, BriefReviser (+9 more)

### Community 19 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 20 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 21 - "StrategyItemKind"
Cohesion: 0.09
Nodes (22): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+14 more)

### Community 22 - "SwiftData"
Cohesion: 0.09
Nodes (9): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security, GitHubConfig (+1 more)

### Community 23 - "KnowledgeStore"
Cohesion: 0.11
Nodes (6): BackgroundTasks, IngestKit, KnowledgeStore, ShareInbox, SwiftUI, UniformTypeIdentifiers

### Community 24 - "Sendable"
Cohesion: 0.25
Nodes (32): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+24 more)

### Community 25 - "GitHubClient"
Cohesion: 0.13
Nodes (16): GitHubClient, .isAuthenticated, HTTPTransport, Bool, Data, HTTPURLResponse, Int, Set (+8 more)

### Community 26 - "String"
Cohesion: 0.16
Nodes (12): Decoder, EchoGuard, Bool, Int, VoiceCommandParser, VoiceParse, command, ignored (+4 more)

### Community 27 - "DigestBuilder"
Cohesion: 0.12
Nodes (18): DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext, TimeInterval (+10 more)

### Community 28 - "Source"
Cohesion: 0.09
Nodes (26): Source, ArticleRow, .body, .content, ReadingView, .activity, .body, .emptyState (+18 more)

### Community 29 - "DailyBudget"
Cohesion: 0.16
Nodes (16): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+8 more)

### Community 30 - "RetrievedPassage"
Cohesion: 0.12
Nodes (18): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+10 more)

### Community 31 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 32 - "GraphIndexer"
Cohesion: 0.16
Nodes (14): ExtractionTier, byok, onDevice, ExtractionAttempt, ExtractionResult, GraphIndexer, .suggestionsAdded, GraphLinker (+6 more)

### Community 33 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 34 - "View"
Cohesion: 0.10
Nodes (24): ProjectRouteView, ArticleSummaryCard, .body, .status, String, DigestClusterSection, .body, DigestRow (+16 more)

### Community 35 - "DigestSummaryRequest"
Cohesion: 0.12
Nodes (15): BYOKDigestSummarizer, DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage (+7 more)

### Community 36 - "VoiceIntent"
Cohesion: 0.11
Nodes (23): Action, Answer, CodingKeys, action, change, filter, kind, number (+15 more)

### Community 37 - ".outcome()"
Cohesion: 0.10
Nodes (17): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+9 more)

### Community 38 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 39 - ".body"
Cohesion: 0.11
Nodes (22): BriefDiff, Line, added, removed, same, Int, BriefDiffTests, BriefDiffView (+14 more)

### Community 40 - "RawItem"
Cohesion: 0.15
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 41 - "String"
Cohesion: 0.12
Nodes (13): BYOKExtractor, EntityExtracting, ExtractionOutput, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String (+5 more)

### Community 43 - "BYOKLLMKit"
Cohesion: 0.12
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 44 - "BriefingTests"
Cohesion: 0.16
Nodes (9): .groupPosition, BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext (+1 more)

### Community 45 - "OpenArticleTool"
Cohesion: 0.13
Nodes (18): ReferenceContext, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition (+10 more)

### Community 46 - "Article"
Cohesion: 0.09
Nodes (18): Article, .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched (+10 more)

### Community 47 - "RecordStrategyItemTool"
Cohesion: 0.13
Nodes (16): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+8 more)

### Community 48 - ".run()"
Cohesion: 0.17
Nodes (14): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+6 more)

### Community 49 - "XCTestCase"
Cohesion: 0.11
Nodes (15): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, SharedImport (+7 more)

### Community 50 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 51 - "Chunk"
Cohesion: 0.14
Nodes (9): ContextPolicy, Bool, Chunk, Data, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer (+1 more)

### Community 52 - "CaseIterable"
Cohesion: 0.09
Nodes (23): CaseIterable, .isEmpty, Question, about, evidence, matters, remember, says (+15 more)

### Community 53 - "AppLockCoordinator"
Cohesion: 0.14
Nodes (13): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+5 more)

### Community 54 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 55 - "ActionRequest"
Cohesion: 0.14
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 56 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 57 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 58 - "OnboardingView"
Cohesion: 0.10
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 59 - "ProviderModelController"
Cohesion: 0.20
Nodes (13): CatalogCache, .modelField, AvailableModelsView, .body, .providersWithKeys, LLMProvider, ProviderModelController, Bool (+5 more)

### Community 60 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 61 - "GraphIndexer.swift"
Cohesion: 0.15
Nodes (13): Error, ExtractionBusy, .errorDescription, ExtractionJob, ExtractionTimedOut, .errorDescription, GraphIndexError, extractionFailed (+5 more)

### Community 62 - ".extract()"
Cohesion: 0.19
Nodes (8): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, SwiftSoup, Unicode

### Community 63 - ".items()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 64 - ".check()"
Cohesion: 0.12
Nodes (13): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+5 more)

### Community 65 - "VoiceConfirmationGate"
Cohesion: 0.18
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 66 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 67 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 68 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 69 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 70 - "Conversation"
Cohesion: 0.13
Nodes (19): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+11 more)

### Community 71 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 72 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 73 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 74 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 75 - "ExtractedArticle"
Cohesion: 0.16
Nodes (10): ExtractedArticle, Date, FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests (+2 more)

### Community 76 - "Scenario"
Cohesion: 0.17
Nodes (14): approve, Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue (+6 more)

### Community 77 - "ReadoutPlayback"
Cohesion: 0.20
Nodes (7): ReadoutPlayback, .current, .currentGroup, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 78 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 79 - "VoiceContext"
Cohesion: 0.17
Nodes (5): VoiceContext, LLMProvider, LLMRequest, String, VoiceIntentTests

### Community 80 - "PerfTrace"
Cohesion: 0.18
Nodes (12): DispatchTime, os, PerfTrace, .names, .samples, Sample, Date, Double (+4 more)

### Community 81 - ".seal()"
Cohesion: 0.17
Nodes (15): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+7 more)

### Community 82 - "VoiceCommands.swift"
Cohesion: 0.10
Nodes (18): Set, VoiceItemMatcher, VoiceReadingFilter, all, starred, unread, VoiceReadingOrder, mostRelevant (+10 more)

### Community 83 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (11): AVSpeechSynthesisVoice, String, VoiceSettings, .current, AppAudio, Bool, Bool, String (+3 more)

### Community 84 - ".extract()"
Cohesion: 0.15
Nodes (14): Color, LanguageModelSession, Entity, ExtractionDeclined, .errorDescription, FoundationModelsEntityExtractor, GuidedGraph, .graph (+6 more)

### Community 85 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 86 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 87 - "LocalizedError"
Cohesion: 0.11
Nodes (19): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, ArticleSummaryError, declined, empty (+11 more)

### Community 88 - "IngestError"
Cohesion: 0.12
Nodes (17): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+9 more)

### Community 89 - ".check()"
Cohesion: 0.15
Nodes (5): VoiceCommandHelp, StaticString, String, UInt, VoiceFindCommandTests

### Community 90 - "GitHubRepo"
Cohesion: 0.15
Nodes (15): Decodable, GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized (+7 more)

### Community 91 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 92 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 93 - "Digest"
Cohesion: 0.26
Nodes (11): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+3 more)

### Community 94 - "ReadoutSegment"
Cohesion: 0.25
Nodes (6): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String

### Community 95 - "BackgroundWork"
Cohesion: 0.16
Nodes (10): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Bool, Date (+2 more)

### Community 96 - "ConversationView.swift"
Cohesion: 0.15
Nodes (5): AVFoundation, MediaPlayer, Speech, UIKit, VoiceLoopKit

### Community 97 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 98 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 99 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 100 - ".parse()"
Cohesion: 0.18
Nodes (4): ExtractionText, Bool, ExtractionTextTests, typed

### Community 101 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 102 - ".article()"
Cohesion: 0.24
Nodes (7): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext, Set

### Community 103 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 104 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 105 - "GitHubRepoPicker"
Cohesion: 0.14
Nodes (14): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+6 more)

### Community 106 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 107 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 108 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 109 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 110 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 111 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 112 - ".segments()"
Cohesion: 0.30
Nodes (5): Locale, ArticleReadout, Builder, String, TimeZone

### Community 113 - "ThemeEdge"
Cohesion: 0.23
Nodes (6): ThemeEdge, GraphEditing, ModelContext, GraphEditingTests, GraphSnapshotTests, Date

### Community 114 - ".decode()"
Cohesion: 0.16
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 115 - "VoiceTab"
Cohesion: 0.14
Nodes (14): VoiceTab, chat, graph, projects, reading, .title, today, AppTab (+6 more)

### Community 116 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 117 - "FakeTransport"
Cohesion: 0.22
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 118 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 119 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 120 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 121 - "VoiceIntentResolver"
Cohesion: 0.21
Nodes (11): Bool, LLMProvider, ModelContext, Sendable, String, T, TimeInterval, VoiceIntentResolver (+3 more)

### Community 122 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 123 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 124 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 125 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 126 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 127 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 128 - ".check()"
Cohesion: 0.22
Nodes (4): StaticString, String, UInt, VoiceHandsFreeCommandTests

### Community 129 - "PipelineController"
Cohesion: 0.22
Nodes (11): .body, PipelineController, .indexesWhileOpen, .isIndexingWhileOpen, Date, Int, ModelContext, Never (+3 more)

### Community 130 - "ArticleSummaryController"
Cohesion: 0.16
Nodes (12): .state, ArticleSummaryController, State, failed, generating, tooShort, unavailable, Bool (+4 more)

### Community 131 - ".refresh()"
Cohesion: 0.24
Nodes (12): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+4 more)

### Community 132 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .shouldListenByVoice, .tabs, Bool, String, String (+4 more)

### Community 133 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 134 - "BriefViews.swift"
Cohesion: 0.18
Nodes (3): FoundationModels, Observation, UserNotifications

### Community 135 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 136 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 137 - "SearchDocument"
Cohesion: 0.28
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 138 - ".text()"
Cohesion: 0.23
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 139 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 140 - "RefreshEagerness"
Cohesion: 0.17
Nodes (13): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+5 more)

### Community 141 - ".update()"
Cohesion: 0.18
Nodes (10): LockScreen, PrivacyCover, .body, Bool, LockOverlay, .body, LockWindow, Bool (+2 more)

### Community 142 - ".start()"
Cohesion: 0.18
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 143 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 144 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 145 - ".insertRows()"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 146 - "SearchController"
Cohesion: 0.27
Nodes (7): SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID

### Community 147 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 148 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 149 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 150 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 151 - "ArticleReaderView"
Cohesion: 0.21
Nodes (9): ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL, .paragraphs, Bool, String (+1 more)

### Community 152 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 153 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 154 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 155 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 156 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 157 - ".apply()"
Cohesion: 0.36
Nodes (5): ApplyResult, RepoSync, Date, Int, ModelContext

### Community 159 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 160 - "IndexingDetailsView"
Cohesion: 0.25
Nodes (10): IndexingDetailsView, .body, .budget, .budgetLine, .graph, .onDeviceLine, .pauseLine, .report (+2 more)

### Community 161 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 162 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 163 - "AppNavigation"
Cohesion: 0.27
Nodes (4): NavigationPath, AppNavigation, Bool, UUID

### Community 164 - "RobotsRules"
Cohesion: 0.40
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 165 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 166 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 167 - ".body"
Cohesion: 0.29
Nodes (7): BriefController, BriefSection, StrategyItemsSection, .body, String, .body, IndexSet

### Community 168 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 169 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 170 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 171 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 172 - "GraphRunStats"
Cohesion: 0.31
Nodes (5): GraphRunStats, .isEmpty, .onDeviceSecondsPerCall, .providerSecondsPerCall, Double

### Community 173 - ".buildIfDue()"
Cohesion: 0.31
Nodes (6): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval

### Community 174 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 175 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 176 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 177 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 178 - ".send()"
Cohesion: 0.48
Nodes (4): Data, HTTPURLResponse, URL, URLRequest

### Community 179 - "StubTool"
Cohesion: 0.33
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 181 - "FoundationModelsRelevanceJudge"
Cohesion: 0.33
Nodes (6): FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 182 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 183 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 184 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 185 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 186 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 187 - "ExtractedGraph"
Cohesion: 0.80
Nodes (3): Entity, ExtractedGraph, Relation

### Community 188 - "Outcome"
Cohesion: 0.40
Nodes (5): Outcome, cancelled, failed, linked, unavailable

### Community 189 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 190 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 191 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 192 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 194 - "ApprovalDecision"
Cohesion: 0.67
Nodes (3): ApprovalDecision, ask, decline

### Community 195 - "Refused"
Cohesion: 0.67
Nodes (3): Refused, device, provider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **509 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+504 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 938 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `GraphView`, `.load()`, `ArticleReadoutController`, `ArticleSummaryController`, `String`, `VoiceCommandController`, `.outcome()`, `SearchDocument`, `ThemeNode`, `PipelineRunner`, `ExtractionTiers`, `.makeContainer()`, `ArticleSummary`, `.insertRows()`, `Project`, `ProjectArticlesTests`, `Section`, `SearchController`, `ArticleReaderView`, `DigestBuilder`, `Source`, `.apply()`, `RetrievedPassage`, `FakeEmbedder`, `GraphIndexer`, `ConversationView`, `View`, `DigestSummaryRequest`, `AppNavigation`, `BriefingTests`, `XCTestCase`, `Chunk`, `ExtractedArticle`, `Scenario`, `ReadoutSegment`, `.makeFixture()`, `.article()`, `.segments()`, `ThemeEdge`?**
  _High betweenness centrality (0.060) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `String`, `BriefViews.swift`, `.outcome()`, `Anchor`, `VoiceCommandController`, `.text()`, `StepProgress`, `ArticleSummary`, `GitHubDeviceFlow`, `KnowledgeStore`, `DailyBudget`, `SharedInbox`, `AppLockTests.swift`, `DigestSummaryRequest`, `TopK`, `.outcome()`, `BYOKLLMKit`, `XCTestCase`, `Chunk`, `SourceFetcher`, `ActionRequest`, `KnowledgeSchema`, `GraphIndexer.swift`, `.extract()`, `.items()`, `.check()`, `AppStore`, `.score()`, `Dependency`, `PerfTrace`, `VoiceCommands.swift`, `IngestError`, `GitHubRepo`, `RedirectPolicy`, `ConversationView.swift`, `.parse()`, `.parse()`, `AppLock.swift`, `.stored()`?**
  _High betweenness centrality (0.057) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `GraphView`, `BriefViews.swift`, `.outcome()`, `Anchor`, `SearchDocument`, `ThemeNode`, `StrategistRunner`, `SwiftData`, `RetrievedPassage`, `GraphIndexer`, `Pipeline`, `BYOKLLMKit`, `Article`, `Chunk`, `SourceFetcher`, `GraphIndexer.swift`, `AppStore`, `.score()`, `ConversationView.swift`, `ThemeEdge`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _509 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `AnalyzerCommandRecognizer` be split into smaller, more focused modules?**
  _Cohesion score 0.052289815447710185 - nodes in this community are weakly interconnected._
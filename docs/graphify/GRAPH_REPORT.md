# Graph Report - SmartWard  (2026-10-04)

## Corpus Check
- Large corpus: 208 files · ~854,348 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 4058 nodes · 10573 edges · 204 communities (196 shown, 8 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 1227 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- AnalyzerCommandRecognizer
- ExtractedGraph
- DigestBuilder
- DailyBudget
- .plan()
- ModelFallback
- GraphIndexer
- Article
- ArticleReadoutController
- Project
- SwiftData
- PipelineRunner
- VoiceCommand
- String
- GitHubClient
- VoiceCommandController
- SharedInbox
- String
- StrategistRunner
- VoiceContext
- Source
- GitHubDeviceFlow
- HybridSearchIndex
- String
- .propose()
- .makeArticle()
- Sendable
- KnowledgeStore
- BYOKLLMKit
- FetchURLTool
- ReferenceLedger
- ThemeNode
- RetrievedPassage
- .run()
- ConversationMode
- ArticleSummarizer
- .extract()
- BriefingTests
- Pipeline
- View
- ProjectLink
- EmbeddingModel
- ConversationView
- VoiceCommandTests
- ArticleSummaryCard
- AppLockCoordinator
- GraphSnapshot
- BriefError
- .outcome()
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .check()
- .load()
- VoiceConfirmationGate
- .fetch()
- Invariant D5: Private content never goes
- PerfTrace
- .items()
- Dependency
- PipelineController
- GraphView
- CodingKeys
- GraphRAG
- SourceFetcher
- ReadoutPlayback
- Section
- ThemeStrengthCache
- OnboardingProposal
- ArticleSummary
- .decode()
- .matches()
- StrategistTool
- ProjectArticlesTests
- .body
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- IngestError
- makeContext()
- ArticleStage
- Scenario
- OnboardingView
- VoiceEngine
- VoiceSpeaker
- RedirectPolicy
- .fetchURL()
- .seal()
- ReadoutSegment
- SearchHit
- ExtractionOutput
- .dismiss()
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppNavigation
- GitHubError
- .fetch()
- InterestModel
- VoiceParse
- .makeFixture()
- .check()
- Approval Before Actions
- RefreshEagerness
- Strategist Layer
- ShareModel
- .parse()
- GitHubAccount
- DigestCluster
- Digest
- StubTool
- ArticleReaderView
- ThemeDetailView
- ReadingView
- Kind
- BackgroundWork
- SmartWard (iOS Application Target)
- .segments()
- .messages()
- PlaybackLLM
- AppLockController
- .refresh()
- BackupView
- AppLock.swift
- SmartWardIntents.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- VoiceCommands.swift
- VoiceIntentTests
- Choice
- SmartWard XcodeGen Project Spec
- LexicalIndex
- AppLockPolicy
- Conversation
- SourceKind
- StrategyItemKind
- Anchor
- .data()
- .text()
- StepProgress
- LibraryFixture
- .check()
- NewConversationView
- .start()
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- CodingKeys
- FakeClock
- .check()
- OnboardingReviewView
- DeveloperView
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .graphML()
- .score()
- FakeCompletion
- AppLockTests.swift
- graphify_pipeline.py
- FakeEmbedder
- RobotsRules
- TopK
- FakeBiometrics
- XCTestCase
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- GraphRunStats
- .nodes
- ArchiveError
- Why
- Strength
- .lines()
- Graph View
- AddSourceView
- UntrustedText (body/attribute inside its
- RepoSync.swift
- ActivitySheet
- .send()
- .merge()
- .update()
- DigestController
- .ask()
- Living Project Brief
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- Refused
- Apple Intelligence Preflight
- Step
- Phase
- ApprovalDecision
- .relatedArticles()
- FakePIN
- .elapsed()
- .vector()
- Result
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

## Communities (204 total, 8 thin omitted)

### Community 0 - "AnalyzerCommandRecognizer"
Cohesion: 0.05
Nodes (40): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, AnalyzerCommandRecognizer (+32 more)

### Community 1 - "ExtractedGraph"
Cohesion: 0.05
Nodes (35): LanguageModelSession, LocalizedError, LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int (+27 more)

### Community 2 - "DigestBuilder"
Cohesion: 0.06
Nodes (34): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+26 more)

### Community 3 - "DailyBudget"
Cohesion: 0.07
Nodes (42): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+34 more)

### Community 4 - ".plan()"
Cohesion: 0.05
Nodes (51): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, AudioPlaybackIntent, DisplayRepresentation, EntityQuery (+43 more)

### Community 5 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 6 - "GraphIndexer"
Cohesion: 0.08
Nodes (32): Error, ExtractionTier, byok, onDevice, ExtractionAttempt, ExtractionBusy, .errorDescription, ExtractionJob (+24 more)

### Community 7 - "Article"
Cohesion: 0.06
Nodes (30): ExtractedArticle, Date, KnowledgeSchema, .schema, Bool, ModelContainer, Article, FetchedPageImport (+22 more)

### Community 8 - "ArticleReadoutController"
Cohesion: 0.09
Nodes (23): MPRemoteCommand, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor, .currentArticle, .currentText, .isActive (+15 more)

### Community 9 - "Project"
Cohesion: 0.08
Nodes (32): Project, Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval (+24 more)

### Community 10 - "SwiftData"
Cohesion: 0.09
Nodes (8): Accelerate, BackgroundTasks, Foundation, IngestKit, NaturalLanguage, RetrievalKit, ShareInbox, SwiftData

### Community 11 - "PipelineRunner"
Cohesion: 0.14
Nodes (17): ExtractionTiers, PipelineRunner, Report, Date, Double, ModelContext, Set, TimeInterval (+9 more)

### Community 12 - "VoiceCommand"
Cohesion: 0.04
Nodes (47): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+39 more)

### Community 13 - "String"
Cohesion: 0.09
Nodes (14): LibraryVoiceQueries, SpokenAnswer, Bool, Date, Double, Int, ModelContext, String (+6 more)

### Community 14 - "GitHubClient"
Cohesion: 0.10
Nodes (19): GitHubClient, .isAuthenticated, GitHubRepo, .id, HTTPTransport, Bool, Set, String (+11 more)

### Community 15 - "VoiceCommandController"
Cohesion: 0.10
Nodes (19): VoiceSpeedChange, faster, normal, slower, Outcome, Bool, ModelContext, Never (+11 more)

### Community 16 - "SharedInbox"
Cohesion: 0.09
Nodes (22): JSONDecoder, JSONEncoder, Result, SharedImport, Date, Int, ModelContext, SharedInbox (+14 more)

### Community 17 - "String"
Cohesion: 0.13
Nodes (27): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Chunk (+19 more)

### Community 18 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 19 - "VoiceContext"
Cohesion: 0.11
Nodes (26): VoiceContext, Action, Answer, Outcome, actions, notUnderstood, Bool, Int (+18 more)

### Community 20 - "Source"
Cohesion: 0.11
Nodes (21): FeedIngest, Bool, Date, Error, ModelContext, String, TimeInterval, RawItem (+13 more)

### Community 21 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 22 - "HybridSearchIndex"
Cohesion: 0.13
Nodes (19): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, SearchCorpus, SearchDocument, Bool, Float (+11 more)

### Community 23 - "String"
Cohesion: 0.15
Nodes (15): Decoder, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceTab, chat (+7 more)

### Community 24 - ".propose()"
Cohesion: 0.11
Nodes (13): BriefEditing, tooLong, BriefReviser, Suggestion, Date, LLMCompleting, LLMProvider, LLMResponse (+5 more)

### Community 25 - ".makeArticle()"
Cohesion: 0.16
Nodes (11): ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage, ModelContext, String (+3 more)

### Community 26 - "Sendable"
Cohesion: 0.26
Nodes (31): Codable, Equatable, GitHubUser, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord (+23 more)

### Community 27 - "KnowledgeStore"
Cohesion: 0.12
Nodes (8): FoundationModels, KnowledgeStore, Observation, GitHubConfig, SwiftUI, UIKit, UniformTypeIdentifiers, UserNotifications

### Community 28 - "BYOKLLMKit"
Cohesion: 0.09
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 29 - "FetchURLTool"
Cohesion: 0.12
Nodes (19): Decodable, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+11 more)

### Community 30 - "ReferenceLedger"
Cohesion: 0.14
Nodes (18): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, ReferenceLedger (+10 more)

### Community 31 - "ThemeNode"
Cohesion: 0.15
Nodes (13): EntityAlias, Data, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext (+5 more)

### Community 32 - "RetrievedPassage"
Cohesion: 0.14
Nodes (13): GraphRetriever, RetrievedPassage, Float, ModelContext, String, UUID, GraphRetrieverTests, RetrievalFixture (+5 more)

### Community 33 - ".run()"
Cohesion: 0.14
Nodes (18): CheckedContinuation, ActionRequest, StrategistError, .errorDescription, incompleteResponse, String, ChatController, .autoApproveEnabled (+10 more)

### Community 34 - "ConversationMode"
Cohesion: 0.13
Nodes (14): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, Item (+6 more)

### Community 35 - "ArticleSummarizer"
Cohesion: 0.15
Nodes (13): ArticleSummarizer, ArticleSummarizing, ArticleSummaryOutput, BYOKArticleSummarizer, Bool, Date, LLMCompleting, LLMProvider (+5 more)

### Community 36 - ".extract()"
Cohesion: 0.16
Nodes (8): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, SwiftSoup, Unicode

### Community 37 - "BriefingTests"
Cohesion: 0.16
Nodes (9): .groupPosition, BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext (+1 more)

### Community 39 - "View"
Cohesion: 0.10
Nodes (23): LockScreen, PrivacyCover, .body, Bool, LockOverlay, .body, AvailableModelsView, .body (+15 more)

### Community 40 - "ProjectLink"
Cohesion: 0.13
Nodes (13): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+5 more)

### Community 41 - "EmbeddingModel"
Cohesion: 0.15
Nodes (10): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, RelevanceJudging, FixedJudge, PipelineRunnerTests, Bool (+2 more)

### Community 42 - "ConversationView"
Cohesion: 0.11
Nodes (19): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+11 more)

### Community 43 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 44 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 45 - "AppLockCoordinator"
Cohesion: 0.14
Nodes (13): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+5 more)

### Community 46 - "GraphSnapshot"
Cohesion: 0.20
Nodes (16): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+8 more)

### Community 47 - "BriefError"
Cohesion: 0.12
Nodes (18): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+10 more)

### Community 48 - ".outcome()"
Cohesion: 0.13
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 49 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 50 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 51 - ".check()"
Cohesion: 0.12
Nodes (13): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+5 more)

### Community 52 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 53 - "VoiceConfirmationGate"
Cohesion: 0.18
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 54 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 55 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 56 - "PerfTrace"
Cohesion: 0.16
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 57 - ".items()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 58 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 59 - "PipelineController"
Cohesion: 0.14
Nodes (18): .body, FoundationModelsRelevanceJudge, PipelineController, .indexesWhileOpen, .isIndexingWhileOpen, Bool, Date, Int (+10 more)

### Community 60 - "GraphView"
Cohesion: 0.16
Nodes (20): CGFloat, Hashable, GraphCanvas, .body, GraphView, .asList, .body, .graphScope (+12 more)

### Community 61 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 62 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 63 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 64 - "ReadoutPlayback"
Cohesion: 0.20
Nodes (7): ReadoutPlayback, .current, .currentGroup, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 65 - "Section"
Cohesion: 0.13
Nodes (20): Section, entities, relations, ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys (+12 more)

### Community 66 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 67 - "OnboardingProposal"
Cohesion: 0.18
Nodes (12): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+4 more)

### Community 68 - "ArticleSummary"
Cohesion: 0.14
Nodes (11): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+3 more)

### Community 69 - ".decode()"
Cohesion: 0.12
Nodes (11): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, OnboardingLinksSheet, .body (+3 more)

### Community 70 - ".matches()"
Cohesion: 0.15
Nodes (18): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+10 more)

### Community 71 - "StrategistTool"
Cohesion: 0.15
Nodes (16): confirm, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+8 more)

### Community 72 - "ProjectArticlesTests"
Cohesion: 0.25
Nodes (8): ProjectArticlesTests, Date, Double, Int, ModelContainer, ModelContext, String, World

### Community 73 - ".body"
Cohesion: 0.12
Nodes (18): BriefEditorView, BriefHistoryView, .body, BriefOrigin, .body, BriefVersionView, ProjectRoute, briefHistory (+10 more)

### Community 74 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 75 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 76 - "IngestError"
Cohesion: 0.12
Nodes (17): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+9 more)

### Community 77 - "makeContext()"
Cohesion: 0.14
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 78 - "ArticleStage"
Cohesion: 0.13
Nodes (14): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+6 more)

### Community 79 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 80 - "OnboardingView"
Cohesion: 0.12
Nodes (15): OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .links, .providersWithKeys, .welcome (+7 more)

### Community 81 - "VoiceEngine"
Cohesion: 0.16
Nodes (7): AVAudioSession, CommandRecognizing, VoiceEngine, .current, .id, newer, standard

### Community 82 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (11): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, SpeechFinishDelegate, Void, AppAudio, Bool, Bool (+3 more)

### Community 83 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 84 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 85 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 86 - "ReadoutSegment"
Cohesion: 0.25
Nodes (6): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String

### Community 87 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 88 - "ExtractionOutput"
Cohesion: 0.16
Nodes (8): EntityExtracting, ExtractionOutput, SlowExtractor, Double, String, KeyedExtractor, Bool, String

### Community 89 - ".dismiss()"
Cohesion: 0.15
Nodes (14): SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding, Double (+6 more)

### Community 90 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 91 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 92 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 93 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 94 - "AppNavigation"
Cohesion: 0.15
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 95 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 96 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 97 - "InterestModel"
Cohesion: 0.26
Nodes (9): Interest, InterestModel, .isEmpty, Bool, Float, String, Triage, TriageTests (+1 more)

### Community 98 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 99 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 100 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 101 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 102 - "RefreshEagerness"
Cohesion: 0.13
Nodes (16): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+8 more)

### Community 103 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 104 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 105 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 106 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 107 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 108 - "Digest"
Cohesion: 0.20
Nodes (11): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body (+3 more)

### Community 109 - "StubTool"
Cohesion: 0.16
Nodes (9): ActionTools, Set, ApprovalPolicyTests, StubTool, .definition, Bool, JSONValue, LLMTool (+1 more)

### Community 110 - "ArticleReaderView"
Cohesion: 0.16
Nodes (12): ReadoutScope, summaryOnly, whole, ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL (+4 more)

### Community 111 - "ThemeDetailView"
Cohesion: 0.19
Nodes (11): Connection, .id, MergeReviewView, .body, Int, String, ThemeDetailView, .body (+3 more)

### Community 112 - "ReadingView"
Cohesion: 0.14
Nodes (15): ArticleRow, .body, .content, ReadingView, .activity, .emptyState, .failingSourceTitles, .filter (+7 more)

### Community 113 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 114 - "BackgroundWork"
Cohesion: 0.18
Nodes (8): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, TimeInterval, .body

### Community 115 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 116 - ".segments()"
Cohesion: 0.30
Nodes (5): Locale, ArticleReadout, Builder, String, TimeZone

### Community 117 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 118 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 119 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 120 - ".refresh()"
Cohesion: 0.22
Nodes (13): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+5 more)

### Community 121 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 122 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 123 - "SmartWardIntents.swift"
Cohesion: 0.19
Nodes (5): AppIntents, AVFoundation, MediaPlayer, Speech, VoiceLoopKit

### Community 124 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 125 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 126 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 127 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 128 - "VoiceCommands.swift"
Cohesion: 0.14
Nodes (13): EchoGuard, VoiceReadingFilter, all, starred, unread, VoiceReadingOrder, mostRelevant, newest (+5 more)

### Community 130 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 131 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 132 - "LexicalIndex"
Cohesion: 0.24
Nodes (6): OptionSet, LexicalIndex, .count, MatchKind, Int, LexicalIndexTests

### Community 133 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 134 - "Conversation"
Cohesion: 0.24
Nodes (6): Conversation, Message, Double, ModelContext, String, GraphSnapshotTests

### Community 135 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 136 - "StrategyItemKind"
Cohesion: 0.21
Nodes (11): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+3 more)

### Community 137 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 138 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 139 - ".text()"
Cohesion: 0.23
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 140 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 141 - "LibraryFixture"
Cohesion: 0.22
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 142 - ".check()"
Cohesion: 0.24
Nodes (4): StaticString, String, UInt, VoiceHandsFreeCommandTests

### Community 143 - "NewConversationView"
Cohesion: 0.19
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 144 - ".start()"
Cohesion: 0.18
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 145 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 146 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 147 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 148 - "CodingKeys"
Cohesion: 0.17
Nodes (11): CodingKeys, action, change, filter, kind, number, on, order (+3 more)

### Community 149 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 150 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 151 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 152 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 153 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, ReadingFilter, all, .id, starred, unread, ReadingOrder, .id (+3 more)

### Community 154 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 155 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 156 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 157 - ".graphML()"
Cohesion: 0.25
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 158 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 159 - "FakeCompletion"
Cohesion: 0.20
Nodes (8): FakeCompletion, AsyncThrowingStream, Error, Int, LLMRequest, LLMResponse, LLMStreamEvent, LLMUsage

### Community 160 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 161 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 162 - "FakeEmbedder"
Cohesion: 0.31
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 163 - "RobotsRules"
Cohesion: 0.40
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 164 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 165 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 166 - "XCTestCase"
Cohesion: 0.24
Nodes (6): NormalizedKeyTests, SeededRandom, UInt64, TopKTests, RandomNumberGenerator, XCTestCase

### Community 167 - "VoiceSettings"
Cohesion: 0.28
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 168 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 169 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 170 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 171 - "GraphRunStats"
Cohesion: 0.31
Nodes (5): GraphRunStats, .isEmpty, .onDeviceSecondsPerCall, .providerSecondsPerCall, Double

### Community 172 - ".nodes"
Cohesion: 0.29
Nodes (6): Color, ThemesRow, .body, .nodes, ThemeStyle, .body

### Community 173 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 174 - "Why"
Cohesion: 0.25
Nodes (8): Bool, Why, connected, .description, direct, fetched, .isGraphHop, named

### Community 175 - "Strength"
Cohesion: 0.29
Nodes (7): Strength, balanced, off, strict, .threshold, Double, TriageScore

### Community 177 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 178 - "AddSourceView"
Cohesion: 0.39
Nodes (5): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput

### Community 179 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 180 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 181 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 182 - ".send()"
Cohesion: 0.48
Nodes (4): Data, HTTPURLResponse, URL, URLRequest

### Community 184 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 185 - "DigestController"
Cohesion: 0.33
Nodes (5): DigestController, .notificationsEnabled, Bool, String, TimeInterval

### Community 186 - ".ask()"
Cohesion: 0.38
Nodes (6): Answer, failed, spoken, ModelContext, String, VoiceAsk

### Community 187 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 188 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 189 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 190 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 191 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 192 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 193 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 194 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 195 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 196 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 197 - ".relatedArticles()"
Cohesion: 0.50
Nodes (3): ProjectVoiceQueries, Int, ModelContext

### Community 198 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 199 - ".elapsed()"
Cohesion: 0.50
Nodes (3): String, TimeInterval, Void

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **509 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+504 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 938 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **8 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `DigestBuilder`, `GraphIndexer`, `Conversation`, `ArticleReadoutController`, `PipelineRunner`, `String`, `VoiceCommandController`, `SharedInbox`, `String`, `Source`, `HybridSearchIndex`, `.makeArticle()`, `ThemeNode`, `RetrievedPassage`, `ArticleSummarizer`, `BriefingTests`, `ProjectLink`, `EmbeddingModel`, `.nodes`, `ArticleSummaryCard`, `.load()`, `ThemeStrengthCache`, `.relatedArticles()`, `.matches()`, `ProjectArticlesTests`, `makeContext()`, `ArticleStage`, `ReadoutSegment`, `SearchHit`, `ExtractionOutput`, `.dismiss()`, `AppNavigation`, `.fetch()`, `.makeFixture()`, `DigestCluster`, `ArticleReaderView`, `ReadingView`, `BackgroundWork`, `.segments()`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `VoiceCommands.swift`, `DigestBuilder`, `DailyBudget`, `GraphIndexer`, `Anchor`, `.text()`, `StepProgress`, `String`, `GitHubClient`, `SharedInbox`, `.canonicalize()`, `String`, `GitHubDeviceFlow`, `KnowledgeStore`, `BYOKLLMKit`, `.graphML()`, `.score()`, `AppLockTests.swift`, `.extract()`, `TopK`, `ProjectLink`, `.outcome()`, `.check()`, `RepoSync.swift`, `PerfTrace`, `.items()`, `Dependency`, `SourceFetcher`, `ArticleSummary`, `IngestError`, `makeContext()`, `VoiceEngine`, `RedirectPolicy`, `ExtractionOutput`, `.parse()`, `AppLock.swift`, `SmartWardIntents.swift`, `.stored()`?**
  _High betweenness centrality (0.056) - this node is a cross-community bridge._
- **Why does `Project` connect `Project` to `DigestBuilder`, `Conversation`, `StrategyItemKind`, `LibraryFixture`, `String`, `NewConversationView`, `VoiceCommandController`, `String`, `.propose()`, `ThemeNode`, `ConversationMode`, `ProjectLink`, `EmbeddingModel`, `GraphView`, `OnboardingProposal`, `.relatedArticles()`, `.matches()`, `ProjectArticlesTests`, `.body`, `makeContext()`, `Scenario`, `.dismiss()`, `AppNavigation`, `.fetch()`, `.projects()`?**
  _High betweenness centrality (0.038) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _509 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `AnalyzerCommandRecognizer` be split into smaller, more focused modules?**
  _Cohesion score 0.052289815447710185 - nodes in this community are weakly interconnected._
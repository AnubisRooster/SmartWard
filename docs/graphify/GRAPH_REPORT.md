# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 206 files · ~807,871 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3879 nodes · 9984 edges · 204 communities (199 shown, 5 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1122 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Project
- ModelFallback
- LocalizedError
- String
- GraphView
- ArticleReadoutController
- EmbeddingModel
- VoiceCommand
- StrategistRunner
- .makeContainer()
- KnowledgeStore
- ProjectArticlesTests
- GitHubDeviceFlow
- ProjectLink
- GitHubClient
- Sendable
- VoiceCommandController
- ExtractionTiers
- BYOKLLMKit
- DailyBudget
- PipelineRunner
- Foundation
- RawItem
- ThemeNode
- ReadoutPlayback
- DigestSummaryRequest
- ConversationView
- FetchURLTool
- StrategyItemKind
- String
- HybridSearchIndex
- SourceKind
- SpeechCommandRecognizer
- DigestBuilder
- GitHubRepo
- SharedInbox
- Digest
- Article
- AnalyzerCommandRecognizer
- .run()
- OpenArticleTool
- VoiceContext
- RecordStrategyItemTool
- VoiceCommandTests
- AppNavigation
- .items()
- XCTestCase
- ExtractedGraph
- Pipeline
- Phase 5: Hardening
- View
- OnboardingView
- ArticleSummaryCard
- Pipeline module (ingestion, graph, searc
- .extract()
- makeContext()
- String
- .check()
- .load()
- ActionRequest
- .outcome()
- Invariant D5: Private content never goes
- PerfTrace
- String
- Dependency
- .fetchURL()
- .testGraphQueriesDoNotScaleWithTheWholeG
- InterestModel
- VoiceAnswersTests
- VoiceConfirmationGate
- .outcome()
- ModelCatalogController
- CodingKeys
- GraphRAG
- AppLockCoordinator
- SourceFetcher
- Source
- ArticleSummary
- ThemeStrengthCache
- .importPending()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- ExtractionTier
- OnboardingProposal
- Scenario
- ReadoutSegment
- BriefingTests
- SearchHit
- .process()
- VoiceCommands.swift
- SearchDocument
- AnalyzerFeed
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- RedirectPolicy
- VoiceParse
- .makeFixture()
- RetrievalFixture
- .check()
- Approval Before Actions
- RefreshEagerness
- SecuritySettingsSection
- VoiceEngine
- ArticleStage
- Strategist Layer
- .segments()
- ShareModel
- .parse()
- GitHubAccount
- ArticleReaderView
- .save()
- Kind
- AskStrategistIntent
- FoundationModelsEntityExtractor
- SmartWard (iOS Application Target)
- .stored()
- .decode()
- VoiceTab
- .messages()
- PlaybackLLM
- .article()
- AppLockController
- BackupView
- ConversationView.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- Observation
- .projects()
- Choice
- .buildIfDue()
- RootView
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- Anchor
- String
- .data()
- StepProgress
- .start()
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .text()
- FakeClock
- LibraryFixture
- .check()
- OnboardingReviewView
- .refresh()
- DeveloperView
- VoiceSpeaker
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- Identifiable
- RobotsRules
- IngestError
- .importItems()
- .fromPastedURL()
- .score()
- SourceKindOption
- AppLockTests.swift
- graphify_pipeline.py
- TopK
- FakeBiometrics
- ProjectEntity
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- Failure
- AppLock.swift
- ApprovalDecision
- .graphML()
- .update()
- .perform()
- .send()
- ArchiveError
- StubTool
- Graph View
- UntrustedText (body/attribute inside its
- ActivitySheet
- .availability()
- PolitenessGate
- .lines()
- SeededRandom
- .ask()
- Living Project Brief
- BriefRevisionStatus
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- Refused
- Apple Intelligence Preflight
- Step
- Phase
- KnowledgeSchema
- FakePIN
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 112 edges
2. `Article` - 112 edges
3. `SwiftData` - 94 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 71 edges
6. `Source` - 63 edges
7. `Pipeline` - 56 edges
8. `ArticleReadoutController` - 53 edges
9. `ThemeNode` - 51 edges
10. `XCTest` - 50 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
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

## Communities (204 total, 5 thin omitted)

### Community 0 - "Project"
Cohesion: 0.06
Nodes (45): BriefRevision, Project, ProjectBrief, BriefDiff, BriefEditing, tooLong, BriefReviser, Line (+37 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "LocalizedError"
Cohesion: 0.05
Nodes (41): LocalizedError, LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext (+33 more)

### Community 3 - "String"
Cohesion: 0.10
Nodes (31): Chunk, Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan (+23 more)

### Community 4 - "GraphView"
Cohesion: 0.09
Nodes (37): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+29 more)

### Community 5 - "ArticleReadoutController"
Cohesion: 0.08
Nodes (28): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, MPRemoteCommand, ObjectIdentifier, ArticleReadoutController, .currentAnchor, .currentArticle (+20 more)

### Community 6 - "EmbeddingModel"
Cohesion: 0.09
Nodes (22): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+14 more)

### Community 7 - "VoiceCommand"
Cohesion: 0.04
Nodes (45): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+37 more)

### Community 8 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 9 - ".makeContainer()"
Cohesion: 0.14
Nodes (14): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage (+6 more)

### Community 10 - "KnowledgeStore"
Cohesion: 0.13
Nodes (6): BackgroundTasks, IngestKit, KnowledgeStore, ShareInbox, SwiftData, SwiftUI

### Community 11 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 12 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 13 - "ProjectLink"
Cohesion: 0.07
Nodes (31): Set, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url, ModelContext (+23 more)

### Community 14 - "GitHubClient"
Cohesion: 0.13
Nodes (14): GitHubClient, .isAuthenticated, GitHubUser, HTTPTransport, Set, String, T, FakeTransport (+6 more)

### Community 15 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 16 - "VoiceCommandController"
Cohesion: 0.13
Nodes (13): Outcome, Bool, ModelContext, Never, NSObjectProtocol, String, Task, TimeInterval (+5 more)

### Community 17 - "ExtractionTiers"
Cohesion: 0.11
Nodes (19): EntityExtracting, ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor (+11 more)

### Community 18 - "BYOKLLMKit"
Cohesion: 0.09
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 19 - "DailyBudget"
Cohesion: 0.16
Nodes (16): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+8 more)

### Community 20 - "PipelineRunner"
Cohesion: 0.15
Nodes (16): ArticleIndexer, FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int (+8 more)

### Community 21 - "Foundation"
Cohesion: 0.08
Nodes (7): CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, RetrievalKit, Security

### Community 22 - "RawItem"
Cohesion: 0.13
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 23 - "ThemeNode"
Cohesion: 0.12
Nodes (17): Data, ThemeNode, GraphEditing, GraphEditingTests, Date, Connection, .id, MergeReviewView (+9 more)

### Community 24 - "ReadoutPlayback"
Cohesion: 0.17
Nodes (7): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 25 - "DigestSummaryRequest"
Cohesion: 0.12
Nodes (16): BYOKDigestSummarizer, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider (+8 more)

### Community 26 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 27 - "FetchURLTool"
Cohesion: 0.11
Nodes (20): Decodable, ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool (+12 more)

### Community 28 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 29 - "String"
Cohesion: 0.20
Nodes (8): Decoder, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceText, String

### Community 30 - "HybridSearchIndex"
Cohesion: 0.13
Nodes (16): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+8 more)

### Community 31 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 32 - "SpeechCommandRecognizer"
Cohesion: 0.14
Nodes (13): NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, RequestBox, SpeechCommandRecognizer, AVAudioNodeTapBlock, AVAudioPCMBuffer, Bool (+5 more)

### Community 33 - "DigestBuilder"
Cohesion: 0.14
Nodes (14): DigestBuilder, Group, Bool, Date, Int, ModelContext, TimeInterval, UUID (+6 more)

### Community 34 - "GitHubRepo"
Cohesion: 0.16
Nodes (14): GitHubRepo, .id, Bool, ApplyResult, Document, RepoSnapshot, RepoSync, Date (+6 more)

### Community 35 - "SharedInbox"
Cohesion: 0.14
Nodes (13): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+5 more)

### Community 36 - "Digest"
Cohesion: 0.17
Nodes (19): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+11 more)

### Community 37 - "Article"
Cohesion: 0.11
Nodes (21): Article, Int, .body, .sourceLabel, String, ArticleRow, .body, .content (+13 more)

### Community 38 - "AnalyzerCommandRecognizer"
Cohesion: 0.15
Nodes (10): AnalyzerCommandRecognizer, Bool, Double, Never, NSObjectProtocol, String, Task, Timer (+2 more)

### Community 39 - ".run()"
Cohesion: 0.17
Nodes (15): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+7 more)

### Community 40 - "OpenArticleTool"
Cohesion: 0.15
Nodes (16): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, SearchCorpusTool (+8 more)

### Community 41 - "VoiceContext"
Cohesion: 0.15
Nodes (9): VoiceContext, String, VoiceRephrase, VoiceRephrasing, VoiceRephraseTests, FoundationModelsVoiceRephraser, .isAvailable, Bool (+1 more)

### Community 42 - "RecordStrategyItemTool"
Cohesion: 0.14
Nodes (15): Arguments, ProjectStateTool, .asksForApproval, .definition, ProposeBriefUpdateTool, .asksForApproval, .definition, RecordStrategyItemTool (+7 more)

### Community 43 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 44 - "AppNavigation"
Cohesion: 0.11
Nodes (16): NavigationPath, AppNavigation, Bool, UUID, ChatListView, .body, modeLabel(), String (+8 more)

### Community 45 - ".items()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 46 - "XCTestCase"
Cohesion: 0.16
Nodes (11): ExtractedArticle, Date, ReferenceContext, RetrievedPassage, ReferenceLedger, FetchURLToolTests, FakeFullText, Set (+3 more)

### Community 47 - "ExtractedGraph"
Cohesion: 0.18
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 49 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 50 - "View"
Cohesion: 0.13
Nodes (21): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+13 more)

### Community 51 - "OnboardingView"
Cohesion: 0.10
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 52 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 53 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 54 - ".extract()"
Cohesion: 0.19
Nodes (8): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, SwiftSoup, Unicode

### Community 55 - "makeContext()"
Cohesion: 0.12
Nodes (8): ContextPolicy, Bool, ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests, ModelContainer, ModelContext

### Community 56 - "String"
Cohesion: 0.18
Nodes (5): Bool, Int, String, ThemeDescription, VoiceAnswers

### Community 57 - ".check()"
Cohesion: 0.12
Nodes (13): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+5 more)

### Community 58 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 59 - "ActionRequest"
Cohesion: 0.15
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 60 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 61 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 62 - "PerfTrace"
Cohesion: 0.16
Nodes (15): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+7 more)

### Community 63 - "String"
Cohesion: 0.17
Nodes (9): EmbeddingProviding, LexicalIndex, .count, String, FakeEmbedder, .dimension, Int, HybridSearchTests (+1 more)

### Community 64 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 65 - ".fetchURL()"
Cohesion: 0.21
Nodes (7): SourceEndpoint, Bool, String, URL, SourceEndpointTests, String, URL

### Community 66 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.15
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 67 - "InterestModel"
Cohesion: 0.19
Nodes (11): Interest, InterestModel, .isEmpty, Bool, Double, Float, String, TriageScore (+3 more)

### Community 68 - "VoiceAnswersTests"
Cohesion: 0.13
Nodes (8): LibraryVoiceQueries, Date, Double, ModelContext, ModelContainer, ModelContext, VoiceAnswersTests, World

### Community 69 - "VoiceConfirmationGate"
Cohesion: 0.19
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 70 - ".outcome()"
Cohesion: 0.16
Nodes (5): ProjectVoiceQueries, Int, ModelContext, .readoutBar, .openProject

### Community 71 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 72 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 73 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 74 - "AppLockCoordinator"
Cohesion: 0.16
Nodes (12): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+4 more)

### Community 75 - "SourceFetcher"
Cohesion: 0.23
Nodes (6): SourceDescriptor, SourceFetcher, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 76 - "Source"
Cohesion: 0.17
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 77 - "ArticleSummary"
Cohesion: 0.14
Nodes (11): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+3 more)

### Community 78 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 79 - ".importPending()"
Cohesion: 0.15
Nodes (11): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, ShareIntake, Int (+3 more)

### Community 80 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 81 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 82 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 83 - "ExtractionTier"
Cohesion: 0.19
Nodes (11): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+3 more)

### Community 84 - "OnboardingProposal"
Cohesion: 0.19
Nodes (11): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+3 more)

### Community 85 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 86 - "ReadoutSegment"
Cohesion: 0.27
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 87 - "BriefingTests"
Cohesion: 0.22
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 88 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 89 - ".process()"
Cohesion: 0.14
Nodes (14): Triage, .body, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, Int, ModelContext (+6 more)

### Community 90 - "VoiceCommands.swift"
Cohesion: 0.11
Nodes (17): EchoGuard, VoiceReadingFilter, all, starred, unread, VoiceReadingOrder, mostRelevant, newest (+9 more)

### Community 91 - "SearchDocument"
Cohesion: 0.21
Nodes (9): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update (+1 more)

### Community 92 - "AnalyzerFeed"
Cohesion: 0.19
Nodes (10): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, AnalyzerFeed, Session, AVAudioNodeTapBlock, AVAudioPCMBuffer (+2 more)

### Community 93 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 94 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 95 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 96 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 97 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 98 - "RedirectPolicy"
Cohesion: 0.14
Nodes (11): PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest, URLSession (+3 more)

### Community 99 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 100 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 101 - "RetrievalFixture"
Cohesion: 0.21
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 102 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 103 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 104 - "RefreshEagerness"
Cohesion: 0.13
Nodes (16): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+8 more)

### Community 105 - "SecuritySettingsSection"
Cohesion: 0.17
Nodes (16): LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView (+8 more)

### Community 106 - "VoiceEngine"
Cohesion: 0.17
Nodes (8): AnyObject, AVAudioSession, CommandRecognizing, VoiceEngine, .current, .id, newer, standard

### Community 107 - "ArticleStage"
Cohesion: 0.12
Nodes (16): CaseIterable, .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched (+8 more)

### Community 108 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 109 - ".segments()"
Cohesion: 0.28
Nodes (6): Locale, ArticleReadout, Builder, .current, String, TimeZone

### Community 110 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 111 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 112 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 113 - "ArticleReaderView"
Cohesion: 0.16
Nodes (12): ReadoutScope, summaryOnly, whole, ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL (+4 more)

### Community 114 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 115 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 116 - "AskStrategistIntent"
Cohesion: 0.21
Nodes (15): AppIntent, AppShortcut, AppShortcutsProvider, AudioPlaybackIntent, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+7 more)

### Community 117 - "FoundationModelsEntityExtractor"
Cohesion: 0.22
Nodes (9): Color, ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String, .body (+1 more)

### Community 118 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 119 - ".stored()"
Cohesion: 0.23
Nodes (5): SourceHealth, Error, String, SourceHealthTests, .body

### Community 120 - ".decode()"
Cohesion: 0.16
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 121 - "VoiceTab"
Cohesion: 0.14
Nodes (14): VoiceTab, chat, graph, projects, reading, .title, today, AppTab (+6 more)

### Community 122 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 123 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 124 - ".article()"
Cohesion: 0.29
Nodes (5): FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext

### Community 125 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 126 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 127 - "ConversationView.swift"
Cohesion: 0.19
Nodes (5): AVFoundation, MediaPlayer, UIKit, UniformTypeIdentifiers, VoiceLoopKit

### Community 128 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 129 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 130 - "Observation"
Cohesion: 0.16
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 131 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 132 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 133 - ".buildIfDue()"
Cohesion: 0.20
Nodes (10): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, DigestSettingsSection, .body (+2 more)

### Community 134 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .shouldListenByVoice, .tabs, Bool, String, String (+4 more)

### Community 135 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 136 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 137 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 138 - "String"
Cohesion: 0.31
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 139 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 140 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 141 - ".start()"
Cohesion: 0.18
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 142 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 143 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 144 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 145 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 146 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 147 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 148 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 149 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 150 - ".refresh()"
Cohesion: 0.30
Nodes (9): IngestController, Bool, Int, ModelContext, Set, String, UUID, Void (+1 more)

### Community 151 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 152 - "VoiceSpeaker"
Cohesion: 0.20
Nodes (6): AppAudio, Bool, Bool, String, VoiceSpeaker, .isBusy

### Community 153 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 154 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 155 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 156 - "Identifiable"
Cohesion: 0.20
Nodes (11): Identifiable, ReadingFilter, all, .id, starred, unread, ReadingOrder, .id (+3 more)

### Community 157 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 158 - "IngestError"
Cohesion: 0.18
Nodes (11): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+3 more)

### Community 159 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 161 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 162 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 163 - "AppLockTests.swift"
Cohesion: 0.24
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 164 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 165 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 166 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 167 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 168 - "VoiceSettings"
Cohesion: 0.28
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 169 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 170 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 171 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 172 - "Failure"
Cohesion: 0.22
Nodes (9): Error, Failure, engineUnavailable, .errorDescription, micNotReady, notResponding, onDeviceUnsupported, permissionDenied (+1 more)

### Community 173 - "AppLock.swift"
Cohesion: 0.33
Nodes (5): BiometricService, BiometricUnlocking, PINService, PINVerifying, PINAttemptResult

### Community 174 - "ApprovalDecision"
Cohesion: 0.28
Nodes (5): ApprovalDecision, approve, ask, decline, ApprovalPolicyTests

### Community 175 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 176 - ".update()"
Cohesion: 0.31
Nodes (5): LockOverlay, LockWindow, Bool, UIWindow, UIWindowScene

### Community 177 - ".perform()"
Cohesion: 0.32
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 178 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 179 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 180 - "StubTool"
Cohesion: 0.29
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 181 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 182 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 183 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 184 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 185 - "PolitenessGate"
Cohesion: 0.33
Nodes (6): PolitenessGate, async, Date, Int, TimeInterval, Void

### Community 187 - "SeededRandom"
Cohesion: 0.38
Nodes (4): SeededRandom, UInt64, TopKTests, RandomNumberGenerator

### Community 188 - ".ask()"
Cohesion: 0.38
Nodes (6): Answer, failed, spoken, ModelContext, String, VoiceAsk

### Community 189 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 190 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 191 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 192 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 193 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 194 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 195 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 196 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 197 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 198 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 199 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 200 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 201 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **475 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+470 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 889 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `String`, `ArticleReadoutController`, `EmbeddingModel`, `.makeContainer()`, `ProjectArticlesTests`, `ExtractionTiers`, `PipelineRunner`, `RawItem`, `ThemeNode`, `.refresh()`, `ConversationView`, `.importItems()`, `DigestBuilder`, `GitHubRepo`, `Digest`, `AppNavigation`, `XCTestCase`, `ArticleSummaryCard`, `makeContext()`, `.load()`, `String`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `VoiceAnswersTests`, `.outcome()`, `Source`, `ThemeStrengthCache`, `.importPending()`, `ExtractionTier`, `ReadoutSegment`, `BriefingTests`, `SearchHit`, `SearchDocument`, `.makeFixture()`, `RetrievalFixture`, `ArticleStage`, `.segments()`, `ArticleReaderView`, `.save()`, `.article()`?**
  _High betweenness centrality (0.066) - this node is a cross-community bridge._
- **Why does `Foundation` connect `Foundation` to `Observation`, `String`, `Anchor`, `KnowledgeStore`, `GitHubDeviceFlow`, `ProjectLink`, `GitHubClient`, `.canonicalize()`, `StepProgress`, `ExtractionTiers`, `BYOKLLMKit`, `DailyBudget`, `.text()`, `DigestSummaryRequest`, `StrategyItemKind`, `RobotsRules`, `.score()`, `SharedInbox`, `AppLockTests.swift`, `TopK`, `VoiceContext`, `.items()`, `AppLock.swift`, `.extract()`, `makeContext()`, `.check()`, `.outcome()`, `PerfTrace`, `Dependency`, `SourceFetcher`, `ArticleSummary`, `ReadoutSegment`, `VoiceCommands.swift`, `SearchDocument`, `AnalyzerFeed`, `RedirectPolicy`, `VoiceEngine`, `.parse()`, `.stored()`, `ConversationView.swift`?**
  _High betweenness centrality (0.058) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `.testGraphQueriesDoNotScaleWithTheWholeG`, `Observation`, `GraphView`, `Article`, `EmbeddingModel`, `StrategistRunner`, `Anchor`, `SourceFetcher`, `ThemeStrengthCache`, `Pipeline`, `BYOKLLMKit`, `ThemeNode`, `Foundation`, `ReadoutSegment`, `makeContext()`, `SearchDocument`, `StrategyItemKind`, `ConversationView.swift`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _475 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Project` be split into smaller, more focused modules?**
  _Cohesion score 0.06027306027306027 - nodes in this community are weakly interconnected._
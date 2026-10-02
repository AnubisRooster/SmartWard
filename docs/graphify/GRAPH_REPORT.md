# Graph Report - SmartWard  (2026-10-02)

## Corpus Check
- Large corpus: 208 files · ~838,666 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 4009 nodes · 10371 edges · 201 communities (195 shown, 6 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1155 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- .makeArticle()
- String
- AnalyzerCommandRecognizer
- Project
- StrategyItemKind
- GraphView
- ModelFallback
- Article
- VoiceCommand
- GraphIndexer
- ArticleReadoutController
- StrategistRunner
- VoiceCommandController
- GitHubDeviceFlow
- ExtractedGraph
- GitHubClient
- String
- Pipeline
- SwiftData
- ThemeNode
- Sendable
- ProjectLink
- .run()
- SourceFetcher
- FetchURLTool
- KnowledgeStore
- PipelineRunner
- OnboardingProposal
- ReadoutPlayback
- RetrievedPassage
- ConversationView
- BYOKLLMKit
- .run()
- VoiceIntent
- View
- SourceKind
- ReferenceLedger
- ReadingView
- ActionRequest
- ExtractedArticle
- InterestModel
- Choice
- RawItem
- DigestBuilder
- VoiceCommandTests
- AppLockCoordinator
- .fetch()
- .makeContainer()
- Phase 5: Hardening
- PipelineController
- ProviderModelController
- Pipeline module (ingestion, graph, searc
- SharedInbox
- PolitenessGate
- .fetchURL()
- DigestSummaryRequest
- .load()
- VoiceContext
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- .score()
- HybridSearchIndex
- Dependency
- Source
- OnboardingView
- CodingKeys
- PerfTrace
- GraphRAG
- LexicalIndex
- ArticleSummary
- BriefError
- LocalizedError
- Digest
- ReadoutSegment
- .matches()
- .check()
- ProjectArticlesTests
- BackgroundWork
- VoiceEngine
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- SharedItem
- .seal()
- Scenario
- SearchDocument
- RedirectPolicy
- BriefingTests
- EmbeddingModel
- SearchHit
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppNavigation
- .fallbackLLM()
- XCTestCase
- VoiceParse
- .makeFixture()
- .check()
- Approval Before Actions
- .dismiss()
- Strategist Layer
- .segments()
- .parse()
- GitHubError
- GitHubAccount
- makeContext()
- PriceBook
- StubTool
- .article()
- Kind
- SmartWard (iOS Application Target)
- ShareModel
- IngestError
- .messages()
- PlaybackLLM
- AppLockController
- IndexingDetailsView
- .refresh()
- BackupView
- .body
- AppLock.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- SeededRandom
- NewConversationView
- RootView
- AskStrategistIntent
- SmartWard XcodeGen Project Spec
- Observation
- AppLockPolicy
- Anchor
- Refusal
- .render()
- .text()
- .check()
- VoiceIntentTests
- RefreshEagerness
- VoiceSpeaker
- .buildIfDue()
- ConversationView.swift
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- BriefRevisionStatus
- FakeClock
- LibraryFixture
- DeveloperView
- .start()
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- ParsedFeed
- LibraryArchive
- .installRemoteControls()
- SourceKindOption
- AppLockTests.swift
- graphify_pipeline.py
- .parse()
- ArticleStage
- .record()
- TopK
- FakeBiometrics
- .check()
- ArticleReaderView
- ProjectEntity
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- FakeCompletion
- Graph View
- ModelCatalogController
- DigestClusterSection
- UntrustedText (body/attribute inside its
- ActivitySheet
- .perform()
- .vector()
- .update()
- ArticleSummaryCard
- ProjectsView
- Living Project Brief
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- VoiceStatus
- .init()
- Apple Intelligence Preflight
- Phase
- KnowledgeSchema
- ApprovalDecision
- VoiceSpeedChange
- FakePIN
- UsageLedgerTests
- AppStore
- IntentFailure
- SmartWardShortcuts
- Result
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 120 edges
2. `KnowledgeStore` - 114 edges
3. `SwiftData` - 96 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 79 edges
6. `Source` - 63 edges
7. `Pipeline` - 58 edges
8. `ArticleReadoutController` - 53 edges
9. `VoiceCommandController` - 53 edges
10. `ThemeNode` - 51 edges

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

## Communities (201 total, 6 thin omitted)

### Community 0 - ".makeArticle()"
Cohesion: 0.05
Nodes (41): ArticleSummarizer, ArticleSummarizing, ArticleSummaryOutput, BYOKArticleSummarizer, Bool, Date, LLMCompleting, LLMProvider (+33 more)

### Community 1 - "String"
Cohesion: 0.05
Nodes (34): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+26 more)

### Community 2 - "AnalyzerCommandRecognizer"
Cohesion: 0.05
Nodes (40): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, AnalyzerCommandRecognizer (+32 more)

### Community 3 - "Project"
Cohesion: 0.07
Nodes (38): BriefRevision, Project, ProjectBrief, StrategyItem, ProjectVoiceQueries, Int, ModelContext, BriefEditing (+30 more)

### Community 4 - "StrategyItemKind"
Cohesion: 0.06
Nodes (38): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, .kind (+30 more)

### Community 5 - "GraphView"
Cohesion: 0.06
Nodes (51): CGFloat, Color, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point (+43 more)

### Community 6 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 7 - "Article"
Cohesion: 0.10
Nodes (23): Article, Chunk, Conversation, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal (+15 more)

### Community 8 - "VoiceCommand"
Cohesion: 0.04
Nodes (54): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+46 more)

### Community 9 - "GraphIndexer"
Cohesion: 0.08
Nodes (30): Error, ExtractionTier, byok, onDevice, ExtractionAttempt, ExtractionJob, ExtractionResult, GraphIndexer (+22 more)

### Community 10 - "ArticleReadoutController"
Cohesion: 0.08
Nodes (30): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, MPRemoteCommand, ObjectIdentifier, ReadoutScope, summaryOnly, whole (+22 more)

### Community 11 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 12 - "VoiceCommandController"
Cohesion: 0.11
Nodes (14): Outcome, ModelContext, Never, NSObjectProtocol, String, Task, TimeInterval, Void (+6 more)

### Community 13 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (27): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+19 more)

### Community 14 - "ExtractedGraph"
Cohesion: 0.10
Nodes (20): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, ExtractionText (+12 more)

### Community 15 - "GitHubClient"
Cohesion: 0.11
Nodes (17): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, Bool, Set (+9 more)

### Community 16 - "String"
Cohesion: 0.15
Nodes (16): Decoder, EchoGuard, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceTab (+8 more)

### Community 17 - "Pipeline"
Cohesion: 0.09
Nodes (5): IngestKit, NaturalLanguage, Pipeline, RetrievalKit, XCTest

### Community 18 - "SwiftData"
Cohesion: 0.10
Nodes (5): CommonCrypto, CryptoKit, Foundation, Security, SwiftData

### Community 19 - "ThemeNode"
Cohesion: 0.13
Nodes (14): EntityAlias, Data, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext (+6 more)

### Community 20 - "Sendable"
Cohesion: 0.26
Nodes (31): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+23 more)

### Community 21 - "ProjectLink"
Cohesion: 0.09
Nodes (21): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+13 more)

### Community 22 - ".run()"
Cohesion: 0.12
Nodes (21): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+13 more)

### Community 23 - "SourceFetcher"
Cohesion: 0.13
Nodes (13): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, SourceDescriptor (+5 more)

### Community 24 - "FetchURLTool"
Cohesion: 0.12
Nodes (18): AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval, .definition (+10 more)

### Community 25 - "KnowledgeStore"
Cohesion: 0.12
Nodes (6): BackgroundTasks, KnowledgeStore, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 26 - "PipelineRunner"
Cohesion: 0.14
Nodes (16): Backlog, .total, FullTextFetching, PipelineRunner, Report, Bool, Date, Double (+8 more)

### Community 27 - "OnboardingProposal"
Cohesion: 0.10
Nodes (23): Identifiable, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+15 more)

### Community 28 - "ReadoutPlayback"
Cohesion: 0.17
Nodes (7): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 29 - "RetrievedPassage"
Cohesion: 0.13
Nodes (18): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+10 more)

### Community 30 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 31 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 32 - ".run()"
Cohesion: 0.16
Nodes (15): DailyBudget, ExtractionTiers, Void, BudgetTests, Double, ModelContext, String, FakeExtractor (+7 more)

### Community 33 - "VoiceIntent"
Cohesion: 0.11
Nodes (23): Action, Answer, CodingKeys, action, change, filter, kind, number (+15 more)

### Community 34 - "View"
Cohesion: 0.09
Nodes (29): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen, PrivacyCover (+21 more)

### Community 35 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 36 - "ReferenceLedger"
Cohesion: 0.14
Nodes (17): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, ReferenceLedger (+9 more)

### Community 37 - "ReadingView"
Cohesion: 0.09
Nodes (24): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+16 more)

### Community 38 - "ActionRequest"
Cohesion: 0.13
Nodes (21): confirm, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+13 more)

### Community 39 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 40 - "InterestModel"
Cohesion: 0.16
Nodes (15): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+7 more)

### Community 41 - "Choice"
Cohesion: 0.08
Nodes (25): CaseIterable, ReadingFilter, all, .id, starred, unread, ReadingOrder, .id (+17 more)

### Community 42 - "RawItem"
Cohesion: 0.17
Nodes (11): FeedIngest, Bool, Date, Error, ModelContext, String, TimeInterval, RawItem (+3 more)

### Community 43 - "DigestBuilder"
Cohesion: 0.16
Nodes (14): DigestBuilder, DigestSummarizing, Group, Bool, Date, ModelContext, TimeInterval, UUID (+6 more)

### Community 44 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 45 - "AppLockCoordinator"
Cohesion: 0.14
Nodes (13): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+5 more)

### Community 46 - ".fetch()"
Cohesion: 0.17
Nodes (13): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+5 more)

### Community 47 - ".makeContainer()"
Cohesion: 0.15
Nodes (10): Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext, URL, RepoSyncTests (+2 more)

### Community 48 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 49 - "PipelineController"
Cohesion: 0.13
Nodes (19): .body, FoundationModelsRelevanceJudge, PipelineController, .indexesWhileOpen, .isIndexingWhileOpen, .strength, Bool, Date (+11 more)

### Community 50 - "ProviderModelController"
Cohesion: 0.20
Nodes (13): CatalogCache, .modelField, AvailableModelsView, .body, .providersWithKeys, LLMProvider, ProviderModelController, Bool (+5 more)

### Community 51 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 52 - "SharedInbox"
Cohesion: 0.14
Nodes (10): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, URL, SharedInboxTests, URL (+2 more)

### Community 53 - "PolitenessGate"
Cohesion: 0.18
Nodes (13): PolitenessGate, RobotsRules, Rule, async, Bool, Data, HTTPURLResponse, String (+5 more)

### Community 54 - ".fetchURL()"
Cohesion: 0.20
Nodes (8): SourceEndpoint, Bool, HTTPURLResponse, String, URL, SourceEndpointTests, String, URL

### Community 55 - "DigestSummaryRequest"
Cohesion: 0.16
Nodes (12): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider, LLMUsage (+4 more)

### Community 56 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 57 - "VoiceContext"
Cohesion: 0.15
Nodes (14): VoiceContext, LLMProvider, LLMRequest, Bool, LLMProvider, ModelContext, Sendable, String (+6 more)

### Community 58 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 59 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 60 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 61 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 62 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (11): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+3 more)

### Community 63 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 64 - "Source"
Cohesion: 0.16
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 65 - "OnboardingView"
Cohesion: 0.10
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 66 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 67 - "PerfTrace"
Cohesion: 0.18
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 68 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 69 - "LexicalIndex"
Cohesion: 0.16
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 70 - "ArticleSummary"
Cohesion: 0.14
Nodes (11): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+3 more)

### Community 71 - "BriefError"
Cohesion: 0.14
Nodes (16): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+8 more)

### Community 72 - "LocalizedError"
Cohesion: 0.10
Nodes (18): LocalizedError, ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int, RestoreError (+10 more)

### Community 73 - "Digest"
Cohesion: 0.23
Nodes (13): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+5 more)

### Community 74 - "ReadoutSegment"
Cohesion: 0.23
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 75 - ".matches()"
Cohesion: 0.15
Nodes (18): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+10 more)

### Community 76 - ".check()"
Cohesion: 0.14
Nodes (5): VoiceCommandHelp, StaticString, String, UInt, VoiceProjectCommandTests

### Community 77 - "ProjectArticlesTests"
Cohesion: 0.25
Nodes (8): ProjectArticlesTests, Date, Double, Int, ModelContainer, ModelContext, String, World

### Community 78 - "BackgroundWork"
Cohesion: 0.14
Nodes (12): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Bool, Date (+4 more)

### Community 79 - "VoiceEngine"
Cohesion: 0.15
Nodes (8): AVAudioSession, CommandRecognizing, VoiceEngine, .current, .id, newer, standard, Bool

### Community 80 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 81 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 82 - "SharedItem"
Cohesion: 0.19
Nodes (11): Result, SharedImport, Date, Int, ModelContext, SharedItem, SharedProject, Date (+3 more)

### Community 83 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 84 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 85 - "SearchDocument"
Cohesion: 0.22
Nodes (11): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID (+3 more)

### Community 86 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 87 - "BriefingTests"
Cohesion: 0.21
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 88 - "EmbeddingModel"
Cohesion: 0.18
Nodes (10): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ModelContext, Set (+2 more)

### Community 89 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 90 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 91 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 92 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 93 - "AppNavigation"
Cohesion: 0.15
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 94 - ".fallbackLLM()"
Cohesion: 0.15
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 95 - "XCTestCase"
Cohesion: 0.13
Nodes (10): Int, NormalizedKeyTests, ModelContainer, ModelContext, ThemeStrengthCacheTests, GraphSnapshotTests, TriageDisplayTests, BriefReviserTests (+2 more)

### Community 96 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 97 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 98 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 99 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 100 - ".dismiss()"
Cohesion: 0.18
Nodes (12): GitHubRepoPicker, .alreadyLinked, .body, Set, .body, SetPINView, .body, String (+4 more)

### Community 101 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 102 - ".segments()"
Cohesion: 0.28
Nodes (6): Locale, ArticleReadout, Builder, .current, String, TimeZone

### Community 103 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 104 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 105 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 106 - "makeContext()"
Cohesion: 0.18
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 107 - "PriceBook"
Cohesion: 0.27
Nodes (8): Line, .id, Price, PriceBook, Bool, Double, Int, String

### Community 108 - "StubTool"
Cohesion: 0.16
Nodes (9): ActionTools, Set, ApprovalPolicyTests, StubTool, .definition, Bool, JSONValue, LLMTool (+1 more)

### Community 109 - ".article()"
Cohesion: 0.28
Nodes (6): ArticleIndexer, FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 110 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 111 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 112 - "ShareModel"
Cohesion: 0.18
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 113 - "IngestError"
Cohesion: 0.13
Nodes (14): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+6 more)

### Community 114 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 115 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 116 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 117 - "IndexingDetailsView"
Cohesion: 0.19
Nodes (11): IndexingDetailsView, .body, .budget, .budgetLine, .graph, .onDeviceLine, .providerLine, .report (+3 more)

### Community 118 - ".refresh()"
Cohesion: 0.22
Nodes (13): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+5 more)

### Community 119 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 120 - ".body"
Cohesion: 0.25
Nodes (10): BudgetSettings, .current, FallbackModelsRow, .body, Double, LLMProvider, String, UsageView (+2 more)

### Community 121 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 122 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 123 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 124 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 125 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 126 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 127 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 128 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .shouldListenByVoice, .tabs, Bool, String, String (+4 more)

### Community 129 - "AskStrategistIntent"
Cohesion: 0.26
Nodes (13): AppIntent, AudioPlaybackIntent, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary, AskStrategistIntent (+5 more)

### Community 130 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 131 - "Observation"
Cohesion: 0.18
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 132 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 133 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 134 - "Refusal"
Cohesion: 0.21
Nodes (10): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+2 more)

### Community 135 - ".render()"
Cohesion: 0.26
Nodes (5): DigestPrompt, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 136 - ".text()"
Cohesion: 0.23
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 137 - ".check()"
Cohesion: 0.24
Nodes (4): StaticString, String, UInt, VoiceHandsFreeCommandTests

### Community 139 - "RefreshEagerness"
Cohesion: 0.17
Nodes (13): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+5 more)

### Community 140 - "VoiceSpeaker"
Cohesion: 0.18
Nodes (6): AppAudio, Bool, Bool, String, VoiceSpeaker, .isBusy

### Community 141 - ".buildIfDue()"
Cohesion: 0.22
Nodes (9): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, TodayView, .body (+1 more)

### Community 142 - "ConversationView.swift"
Cohesion: 0.23
Nodes (4): AVFoundation, MediaPlayer, Speech, VoiceLoopKit

### Community 143 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 144 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 145 - "BriefRevisionStatus"
Cohesion: 0.15
Nodes (12): .status, BriefRevisionStatus, accepted, pending, rejected, superseded, .status, StrategyItemStatus (+4 more)

### Community 146 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 147 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 148 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 149 - ".start()"
Cohesion: 0.20
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 150 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 151 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 152 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 153 - "ParsedFeed"
Cohesion: 0.31
Nodes (7): Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 154 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 156 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 157 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 158 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 159 - ".parse()"
Cohesion: 0.29
Nodes (3): FeedParser, Data, FeedParserTests

### Community 160 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 161 - ".record()"
Cohesion: 0.49
Nodes (4): Calendar, Date, ModelContext, UsageLedger

### Community 162 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 163 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 164 - ".check()"
Cohesion: 0.31
Nodes (3): BriefingGateTests, Bool, TimeInterval

### Community 165 - "ArticleReaderView"
Cohesion: 0.22
Nodes (8): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, Bool, String, URL

### Community 166 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

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

### Community 171 - "FakeCompletion"
Cohesion: 0.29
Nodes (6): FakeCompletion, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent

### Community 172 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 173 - "ModelCatalogController"
Cohesion: 0.36
Nodes (5): ModelCatalogController, .fallback, Bool, CatalogEntry, Date

### Community 174 - "DigestClusterSection"
Cohesion: 0.32
Nodes (6): DigestClusterSection, .body, DigestSections, .body, String, UUID

### Community 175 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 176 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 177 - ".perform()"
Cohesion: 0.29
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 178 - ".vector()"
Cohesion: 0.43
Nodes (4): FixedJudge, Bool, Float, String

### Community 179 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 180 - "ArticleSummaryCard"
Cohesion: 0.48
Nodes (4): ArticleSummaryCard, .body, .status, String

### Community 181 - "ProjectsView"
Cohesion: 0.29
Nodes (6): NewProjectView, .body, ProjectsView, .body, IndexSet, .tabView

### Community 182 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 183 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 184 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 185 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 186 - "VoiceStatus"
Cohesion: 0.40
Nodes (5): VoiceStatus, failingSources, refresh, spendToday, unreadCount

### Community 188 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 189 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 190 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 191 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 192 - "VoiceSpeedChange"
Cohesion: 0.50
Nodes (4): VoiceSpeedChange, faster, normal, slower

### Community 193 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 194 - "UsageLedgerTests"
Cohesion: 0.50
Nodes (3): Calendar, UsageLedgerTests, .utc

### Community 195 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 196 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

### Community 197 - "SmartWardShortcuts"
Cohesion: 0.67
Nodes (3): AppShortcut, AppShortcutsProvider, SmartWardShortcuts

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **508 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+503 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 932 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `Observation`, `StrategyItemKind`, `Anchor`, `Refusal`, `Article`, `.text()`, `GraphIndexer`, `.render()`, `GitHubDeviceFlow`, `ExtractedGraph`, `GitHubClient`, `String`, `Pipeline`, `ConversationView.swift`, `SourceFetcher`, `ParsedFeed`, `KnowledgeStore`, `AppLockTests.swift`, `BYOKLLMKit`, `TopK`, `ReadingView`, `ActionRequest`, `ExtractedArticle`, `PolitenessGate`, `.outcome()`, `.score()`, `Dependency`, `PerfTrace`, `ArticleSummary`, `Digest`, `ReadoutSegment`, `VoiceEngine`, `SharedItem`, `SearchDocument`, `RedirectPolicy`, `.parse()`, `AppLock.swift`, `.stored()`?**
  _High betweenness centrality (0.066) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `.makeArticle()`, `String`, `Project`, `GraphIndexer`, `ArticleReadoutController`, `VoiceCommandController`, `ThemeNode`, `KnowledgeStore`, `PipelineRunner`, `RetrievedPassage`, `ConversationView`, `ArticleStage`, `.run()`, `ArticleReaderView`, `ReadingView`, `InterestModel`, `DigestBuilder`, `.fetch()`, `.makeContainer()`, `DigestClusterSection`, `ArticleSummaryCard`, `DigestSummaryRequest`, `.load()`, `.init()`, `Source`, `LexicalIndex`, `ReadoutSegment`, `.matches()`, `ProjectArticlesTests`, `BackgroundWork`, `SharedItem`, `SearchDocument`, `BriefingTests`, `SearchHit`, `AppNavigation`, `XCTestCase`, `.makeFixture()`, `.dismiss()`, `.segments()`, `makeContext()`, `.article()`?**
  _High betweenness centrality (0.058) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Observation`, `StrategyItemKind`, `GraphView`, `Anchor`, `Article`, `GraphIndexer`, `ReadoutSegment`, `StrategistRunner`, `ConversationView.swift`, `Pipeline`, `SwiftData`, `RetrievedPassage`, `SearchDocument`, `SourceFetcher`, `.score()`, `XCTestCase`, `BYOKLLMKit`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _508 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `.makeArticle()` be split into smaller, more focused modules?**
  _Cohesion score 0.05346164127238706 - nodes in this community are weakly interconnected._
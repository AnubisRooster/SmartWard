# Graph Report - SmartWard  (2026-10-01)

## Corpus Check
- Large corpus: 207 files · ~816,661 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3944 nodes · 10143 edges · 197 communities (191 shown, 6 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1126 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- AnalyzerCommandRecognizer
- DigestBuilder
- GraphSnapshot
- KnowledgeStore
- ModelFallback
- View
- ArticleReadoutController
- VoiceCommand
- .record()
- Source
- GraphView
- String
- String
- VoiceCommandController
- StrategistRunner
- Project
- ProjectLink
- GitHubDeviceFlow
- ProjectArticlesTests
- String
- ReferenceLedger
- OnboardingProposal
- ArticleSummary
- GitHubClient
- Sendable
- FetchURLTool
- ThemeNode
- DailyBudget
- ExtractedGraph
- .run()
- SharedInbox
- Digest
- ReadoutPlayback
- .load()
- StrategyItemKind
- VoiceIntent
- ExtractedArticle
- SourceKind
- Pipeline
- SwiftUI
- RetrievedPassage
- GitHubRepo
- .makeContainer()
- PipelineRunner
- RecordStrategyItemTool
- InterestModel
- BYOKLLMKit
- SourceFetcher
- Article
- VoiceCommandTests
- ConversationView
- ArticleSummaryCard
- SecuritySettingsSection
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- Conversation
- ActionRequest
- VoiceConfirmationGate
- .fetch()
- StubSummarizer
- Invariant D5: Private content never goes
- Dependency
- CodingKeys
- XCTestCase
- GraphRAG
- LocalizedError
- .process()
- VoiceContext
- .body
- .segments()
- HybridSearchIndex
- .outcome()
- VoiceEngine
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- ReadoutSegment
- Scenario
- BackgroundWork
- PerfTrace
- RedirectPolicy
- AppLockCoordinator
- .fetchURL()
- BriefingTests
- EmbeddingModel
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppNavigation
- AppLock.swift
- GitHubError
- VoiceParse
- .makeFixture()
- RetrievalFixture
- .check()
- Approval Before Actions
- VoiceSpeaker
- CaseIterable
- Strategist Layer
- GitHubAccount
- .fallbackLLM()
- OnboardingView
- .refresh()
- Kind
- SmartWard (iOS Application Target)
- ShareModel
- SearchDocument
- .messages()
- PlaybackLLM
- AppLockController
- BackupView
- VoiceIntentResolver
- AskStrategistIntent
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- String
- SearchController
- .article()
- RefreshEagerness
- Choice
- RootView
- SourceKindOption
- SmartWard XcodeGen Project Spec
- GraphExtraction.swift
- AppLockPolicy
- IngestError
- ArticleSummarizer
- Refusal
- StepProgress
- .check()
- GitHubRepoPicker
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- ExtractionTier
- .text()
- RelevanceJudging
- FakeClock
- LibraryFixture
- .makeArticle()
- .check()
- DeveloperView
- .start()
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- ParsedFeed
- .items()
- RobotsRules
- .importItems()
- LibraryArchive
- .fromPastedURL()
- String
- SeededRandom
- VoiceSettings.swift
- graphify_pipeline.py
- ArticleStage
- TopK
- FakeBiometrics
- .check()
- ArticleReaderView
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- .send()
- Anchor
- .lines()
- Graph View
- .body
- AddSourceView
- UntrustedText (body/attribute inside its
- ActivitySheet
- .perform()
- PolitenessGate
- StubTool
- Living Project Brief
- EncryptedBackup.swift
- PINOutcome
- BriefRevisionStatus
- AvailableModelsView
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- Status
- Apple Intelligence Preflight
- Phase
- ApprovalDecision
- .relatedArticles()
- VoiceReadingOrder
- StartBlocker
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 115 edges
2. `KnowledgeStore` - 113 edges
3. `SwiftData` - 95 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 79 edges
6. `Source` - 63 edges
7. `Pipeline` - 57 edges
8. `ArticleReadoutController` - 53 edges
9. `VoiceCommandController` - 53 edges
10. `ThemeNode` - 51 edges

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

## Communities (197 total, 6 thin omitted)

### Community 0 - "AnalyzerCommandRecognizer"
Cohesion: 0.05
Nodes (41): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, Error, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask (+33 more)

### Community 1 - "DigestBuilder"
Cohesion: 0.06
Nodes (36): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+28 more)

### Community 2 - "GraphSnapshot"
Cohesion: 0.06
Nodes (41): GraphKit, Date, Double, TimeInterval, ThemeStrength, Edge, ForceLayout, GraphSnapshot (+33 more)

### Community 3 - "KnowledgeStore"
Cohesion: 0.09
Nodes (10): Accelerate, BackgroundTasks, Foundation, IngestKit, KnowledgeStore, NaturalLanguage, RetrievalKit, ShareInbox (+2 more)

### Community 4 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 5 - "View"
Cohesion: 0.06
Nodes (45): BriefDiff, Line, added, removed, same, Int, BriefDiffTests, BriefController (+37 more)

### Community 6 - "ArticleReadoutController"
Cohesion: 0.08
Nodes (27): MPRemoteCommand, ObjectIdentifier, ReadoutScope, summaryOnly, whole, .readoutBar, ArticleReadoutController, .currentAnchor (+19 more)

### Community 7 - "VoiceCommand"
Cohesion: 0.04
Nodes (55): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+47 more)

### Community 8 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 9 - "Source"
Cohesion: 0.09
Nodes (25): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+17 more)

### Community 10 - "GraphView"
Cohesion: 0.08
Nodes (35): CGFloat, Color, Hashable, .body, ThemeStyle, Connection, .id, GraphCanvas (+27 more)

### Community 11 - "String"
Cohesion: 0.12
Nodes (21): Decoder, EchoGuard, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceStatus (+13 more)

### Community 12 - "String"
Cohesion: 0.11
Nodes (22): EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal, StrategyItem, .status (+14 more)

### Community 13 - "VoiceCommandController"
Cohesion: 0.11
Nodes (15): Outcome, Bool, ModelContext, Never, NSObjectProtocol, String, Task, TimeInterval (+7 more)

### Community 14 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 15 - "Project"
Cohesion: 0.12
Nodes (22): BriefRevision, Project, ProjectBrief, BriefEditing, BriefError, empty, .errorDescription, notPending (+14 more)

### Community 16 - "ProjectLink"
Cohesion: 0.08
Nodes (18): ContextPolicy, Bool, Set, Chunk, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+10 more)

### Community 17 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 18 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (25): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+17 more)

### Community 19 - "String"
Cohesion: 0.11
Nodes (10): LibraryVoiceQueries, Bool, Date, Double, Int, ModelContext, String, ThemeDescription (+2 more)

### Community 20 - "ReferenceLedger"
Cohesion: 0.11
Nodes (22): Decodable, Arguments, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval (+14 more)

### Community 21 - "OnboardingProposal"
Cohesion: 0.09
Nodes (26): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+18 more)

### Community 22 - "ArticleSummary"
Cohesion: 0.09
Nodes (18): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummary, .isEmpty, Question, about (+10 more)

### Community 23 - "GitHubClient"
Cohesion: 0.13
Nodes (14): GitHubClient, .isAuthenticated, GitHubUser, HTTPTransport, Set, String, T, FakeTransport (+6 more)

### Community 24 - "Sendable"
Cohesion: 0.26
Nodes (31): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+23 more)

### Community 25 - "FetchURLTool"
Cohesion: 0.10
Nodes (19): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, FetchURLTool, .asksForApproval, .definition (+11 more)

### Community 26 - "ThemeNode"
Cohesion: 0.14
Nodes (14): ThemeEdge, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext, String (+6 more)

### Community 27 - "DailyBudget"
Cohesion: 0.10
Nodes (19): DailyBudget, ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor (+11 more)

### Community 28 - "ExtractedGraph"
Cohesion: 0.12
Nodes (20): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation (+12 more)

### Community 29 - ".run()"
Cohesion: 0.12
Nodes (21): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+13 more)

### Community 30 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 31 - "Digest"
Cohesion: 0.13
Nodes (22): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+14 more)

### Community 32 - "ReadoutPlayback"
Cohesion: 0.16
Nodes (8): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, Int, ReadoutPlaybackTests

### Community 33 - ".load()"
Cohesion: 0.11
Nodes (19): Data, Float, VectorCoding, SampleLibrary, Size, SplitMix, Bool, Date (+11 more)

### Community 34 - "StrategyItemKind"
Cohesion: 0.13
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 35 - "VoiceIntent"
Cohesion: 0.11
Nodes (23): Action, Answer, CodingKeys, action, change, filter, kind, number (+15 more)

### Community 36 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, Bool (+3 more)

### Community 37 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 39 - "SwiftUI"
Cohesion: 0.10
Nodes (7): AVFoundation, MediaPlayer, Observation, Speech, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 40 - "RetrievedPassage"
Cohesion: 0.13
Nodes (16): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+8 more)

### Community 41 - "GitHubRepo"
Cohesion: 0.16
Nodes (14): GitHubRepo, .id, Bool, ApplyResult, Document, RepoSnapshot, RepoSync, Date (+6 more)

### Community 42 - ".makeContainer()"
Cohesion: 0.12
Nodes (17): KnowledgeSchema, .schema, Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext (+9 more)

### Community 43 - "PipelineRunner"
Cohesion: 0.17
Nodes (14): FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+6 more)

### Community 44 - "RecordStrategyItemTool"
Cohesion: 0.13
Nodes (16): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+8 more)

### Community 45 - "InterestModel"
Cohesion: 0.16
Nodes (14): Interest, InterestModel, .isEmpty, Bool, Double, Float, ModelContext, Set (+6 more)

### Community 46 - "BYOKLLMKit"
Cohesion: 0.15
Nodes (5): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore, VoiceLoopKit

### Community 47 - "SourceFetcher"
Cohesion: 0.20
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 48 - "Article"
Cohesion: 0.11
Nodes (21): Article, ModelContainer, ModelContext, .sourceLabel, String, ArticleRow, .body, .content (+13 more)

### Community 49 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 50 - "ConversationView"
Cohesion: 0.12
Nodes (18): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+10 more)

### Community 51 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 52 - "SecuritySettingsSection"
Cohesion: 0.11
Nodes (21): AppLock, BiometricLockKit, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body (+13 more)

### Community 53 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 54 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 55 - "Conversation"
Cohesion: 0.13
Nodes (20): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+12 more)

### Community 56 - "ActionRequest"
Cohesion: 0.15
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 57 - "VoiceConfirmationGate"
Cohesion: 0.18
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 58 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 59 - "StubSummarizer"
Cohesion: 0.21
Nodes (5): ArticleSummaryTests, StubSummarizer, Bool, String, ThrowingSummarizer

### Community 60 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 61 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 62 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 63 - "XCTestCase"
Cohesion: 0.11
Nodes (13): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests (+5 more)

### Community 64 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 65 - "LocalizedError"
Cohesion: 0.10
Nodes (19): LocalizedError, ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int, RestoreError (+11 more)

### Community 66 - ".process()"
Cohesion: 0.12
Nodes (11): Int, Triage, TriageDisplayTests, .body, ExtractionSettings, PipelineController, .strength, Int (+3 more)

### Community 67 - "VoiceContext"
Cohesion: 0.17
Nodes (5): VoiceContext, LLMProvider, LLMRequest, String, VoiceIntentTests

### Community 68 - ".body"
Cohesion: 0.10
Nodes (16): ActionApprovalSettingsSection, .body, DigestSettingsSection, .body, ProviderKeyRow, .body, .body, LLMProvider (+8 more)

### Community 69 - ".segments()"
Cohesion: 0.19
Nodes (8): Locale, Array, ArticleReadout, Builder, .current, Element, String, TimeZone

### Community 70 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 71 - ".outcome()"
Cohesion: 0.17
Nodes (8): Outcome, fail, listen, speak, Bool, String, VoiceTurn, VoiceTurnTests

### Community 72 - "VoiceEngine"
Cohesion: 0.15
Nodes (8): AnyObject, AVAudioSession, CommandRecognizing, VoiceEngine, .current, .id, newer, standard

### Community 73 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 74 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 75 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 76 - "ReadoutSegment"
Cohesion: 0.25
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 77 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 78 - "BackgroundWork"
Cohesion: 0.16
Nodes (10): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Date, String (+2 more)

### Community 79 - "PerfTrace"
Cohesion: 0.18
Nodes (13): DispatchTime, os, PerfTrace, .samples, Sample, Summary, Date, Double (+5 more)

### Community 80 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 81 - "AppLockCoordinator"
Cohesion: 0.23
Nodes (9): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, String, AppLockCoordinatorTests, FakePIN, PINAttemptResult (+1 more)

### Community 82 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 83 - "BriefingTests"
Cohesion: 0.21
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 84 - "EmbeddingModel"
Cohesion: 0.18
Nodes (10): EmbeddingModel, EmbeddingProviding, String, GraphIndexer, .suggestionsAdded, GraphLinker, Date, Int (+2 more)

### Community 85 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 86 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 87 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 88 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 89 - "AppNavigation"
Cohesion: 0.15
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 90 - "AppLock.swift"
Cohesion: 0.15
Nodes (10): .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType, PINAttemptResult (+2 more)

### Community 91 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 92 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 93 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 94 - "RetrievalFixture"
Cohesion: 0.21
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 95 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 96 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 97 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (10): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, SpeechFinishDelegate, Void, AppAudio, Bool, String (+2 more)

### Community 98 - "CaseIterable"
Cohesion: 0.13
Nodes (16): CaseIterable, Strength, balanced, off, strict, .threshold, ReadingFilter, all (+8 more)

### Community 99 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 100 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 101 - ".fallbackLLM()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 102 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 103 - ".refresh()"
Cohesion: 0.21
Nodes (13): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+5 more)

### Community 104 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 105 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 106 - "ShareModel"
Cohesion: 0.18
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 107 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 108 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 109 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 110 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 111 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 112 - "VoiceIntentResolver"
Cohesion: 0.21
Nodes (11): Bool, LLMProvider, ModelContext, Sendable, String, T, TimeInterval, VoiceIntentResolver (+3 more)

### Community 113 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, AudioPlaybackIntent, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+5 more)

### Community 114 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 115 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 116 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 117 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 118 - "String"
Cohesion: 0.29
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 119 - "SearchController"
Cohesion: 0.25
Nodes (9): StaticString, T, SearchController, SearchResultsView, .body, Int, ModelContext, String (+1 more)

### Community 120 - ".article()"
Cohesion: 0.32
Nodes (5): FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 121 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 122 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 123 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .shouldListenByVoice, .tabs, Bool, String, String (+4 more)

### Community 124 - "SourceKindOption"
Cohesion: 0.15
Nodes (13): AppEnum, IntentFailure, .errorDescription, libraryUnavailable, noProvider, SourceKindOption, arxiv, feed (+5 more)

### Community 125 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 126 - "GraphExtraction.swift"
Cohesion: 0.15
Nodes (8): FoundationModels, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body, UserNotifications

### Community 127 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 128 - "IngestError"
Cohesion: 0.15
Nodes (12): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+4 more)

### Community 129 - "ArticleSummarizer"
Cohesion: 0.29
Nodes (6): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID

### Community 130 - "Refusal"
Cohesion: 0.21
Nodes (10): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+2 more)

### Community 131 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 132 - ".check()"
Cohesion: 0.24
Nodes (4): StaticString, String, UInt, VoiceHandsFreeCommandTests

### Community 133 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 134 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 135 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 136 - "ExtractionTier"
Cohesion: 0.17
Nodes (8): ExtractionTier, byok, onDevice, Refused, device, provider, Error, LLMUsage

### Community 137 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 138 - "RelevanceJudging"
Cohesion: 0.20
Nodes (9): RelevanceJudging, FixedJudge, Bool, FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label (+1 more)

### Community 139 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 140 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 141 - ".makeArticle()"
Cohesion: 0.35
Nodes (5): IngestionSummaryTests, Int, ModelContext, TimeInterval, Void

### Community 142 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 143 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 144 - ".start()"
Cohesion: 0.20
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 145 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 146 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 147 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 148 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 149 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 150 - "ParsedFeed"
Cohesion: 0.31
Nodes (7): Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 151 - ".items()"
Cohesion: 0.29
Nodes (3): FeedParser, Data, FeedParserTests

### Community 152 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 153 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 154 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 156 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 157 - "SeededRandom"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 158 - "VoiceSettings.swift"
Cohesion: 0.27
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 159 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 160 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 161 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 162 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 163 - ".check()"
Cohesion: 0.31
Nodes (3): BriefingGateTests, Bool, TimeInterval

### Community 164 - "ArticleReaderView"
Cohesion: 0.22
Nodes (8): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, Bool, String, URL

### Community 165 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 166 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 167 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 168 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 169 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 170 - "Anchor"
Cohesion: 0.25
Nodes (8): Anchor, details, note, paragraph, relevance, summary, themes, title

### Community 172 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 173 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 174 - "AddSourceView"
Cohesion: 0.39
Nodes (5): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput

### Community 175 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 176 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 177 - ".perform()"
Cohesion: 0.38
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 178 - "PolitenessGate"
Cohesion: 0.33
Nodes (6): PolitenessGate, async, Date, Int, TimeInterval, Void

### Community 179 - "StubTool"
Cohesion: 0.33
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 180 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 181 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 182 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 183 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 184 - "AvailableModelsView"
Cohesion: 0.60
Nodes (4): AvailableModelsView, .body, .providersWithKeys, LLMProvider

### Community 185 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 186 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 188 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 189 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 190 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 191 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 192 - ".relatedArticles()"
Cohesion: 0.50
Nodes (3): ProjectVoiceQueries, Int, ModelContext

### Community 193 - "VoiceReadingOrder"
Cohesion: 0.67
Nodes (3): VoiceReadingOrder, mostRelevant, newest

### Community 194 - "StartBlocker"
Cohesion: 0.67
Nodes (3): StartBlocker, missingKey, needsAutoApprove

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **491 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+486 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 915 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ArticleSummarizer`, `DigestBuilder`, `ArticleReadoutController`, `Source`, `String`, `.makeArticle()`, `VoiceCommandController`, `Project`, `ProjectLink`, `ProjectArticlesTests`, `String`, `FakeEmbedder`, `.importItems()`, `ThemeNode`, `DailyBudget`, `Digest`, `ArticleStage`, `.load()`, `ExtractedArticle`, `ArticleReaderView`, `RetrievedPassage`, `GitHubRepo`, `.makeContainer()`, `PipelineRunner`, `ArticleSummaryCard`, `StubSummarizer`, `.relatedArticles()`, `.process()`, `.segments()`, `ReadoutSegment`, `Scenario`, `BackgroundWork`, `BriefingTests`, `EmbeddingModel`, `AppNavigation`, `.makeFixture()`, `RetrievalFixture`, `.refresh()`, `SearchDocument`, `SearchController`, `.article()`?**
  _High betweenness centrality (0.068) - this node is a cross-community bridge._
- **Why does `Foundation` connect `KnowledgeStore` to `DigestBuilder`, `GraphSnapshot`, `Refusal`, `StepProgress`, `.text()`, `String`, `String`, `Project`, `ProjectLink`, `GitHubDeviceFlow`, `ParsedFeed`, `GitHubClient`, `RobotsRules`, `ArticleSummary`, `ExtractedGraph`, `SharedInbox`, `Digest`, `VoiceSettings.swift`, `TopK`, `ExtractedArticle`, `SwiftUI`, `BYOKLLMKit`, `SourceFetcher`, `EncryptedBackup.swift`, `Dependency`, `XCTestCase`, `.body`, `.segments()`, `.outcome()`, `VoiceEngine`, `ReadoutSegment`, `PerfTrace`, `RedirectPolicy`, `AppLock.swift`, `.stored()`, `GraphExtraction.swift`?**
  _High betweenness centrality (0.048) - this node is a cross-community bridge._
- **Why does `Project` connect `Project` to `DigestBuilder`, `GitHubRepoPicker`, `View`, `Source`, `GraphView`, `String`, `VoiceCommandController`, `LibraryFixture`, `ProjectLink`, `ProjectArticlesTests`, `OnboardingProposal`, `ThemeNode`, `StrategyItemKind`, `GitHubRepo`, `RecordStrategyItemTool`, `Conversation`, `.relatedArticles()`, `Scenario`, `AppNavigation`, `RetrievalFixture`, `.projects()`, `.article()`?**
  _High betweenness centrality (0.048) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _491 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `AnalyzerCommandRecognizer` be split into smaller, more focused modules?**
  _Cohesion score 0.05128205128205128 - nodes in this community are weakly interconnected._
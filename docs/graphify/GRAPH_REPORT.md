# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 195 files · ~762,056 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3683 nodes · 9504 edges · 195 communities (189 shown, 6 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1081 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- GraphView
- DigestBuilder
- String
- ModelFallback
- Project
- DailyBudget
- SwiftData
- View
- SourceKindOption
- VoiceCommand
- ArticleReadoutController
- StrategistRunner
- GitHubClient
- .makeContainer()
- ProjectArticlesTests
- Source
- GitHubDeviceFlow
- VoiceCommandController
- FetchURLTool
- PipelineRunner
- VoiceAnswersTests
- SpeechCommandRecognizer
- Sendable
- Article
- ReferenceLedger
- ThemeNode
- .dismiss()
- Digest
- ExtractedGraph
- BYOKLLMKit
- String
- InterestModel
- ExtractedArticle
- StrategyItemKind
- .run()
- KnowledgeStore
- HybridSearchIndex
- RecordStrategyItemTool
- .process()
- ExtractionTier
- EmbeddingModel
- .article()
- ConversationView
- ArticleSummaryCard
- SourceFetcher
- ReadoutPlayback
- VoiceCommandTests
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- SharedInbox
- BriefingTests
- .run()
- .load()
- .fetch()
- .outcome()
- Pipeline
- Invariant D5: Private content never goes
- PerfTrace
- ReadoutSegment
- Dependency
- ActionRequest
- Choice
- GraphRAG
- LocalizedError
- .items()
- .segments()
- .outcome()
- SearchHit
- BriefError
- Scenario
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- OnboardingProposal
- XCTestCase
- VoiceSpeaker
- RedirectPolicy
- .fetchURL()
- .makeFixture()
- AppLockCoordinator
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- .parse()
- GitHubError
- .fetch()
- ArticleSummary
- GraphIndexer
- .check()
- Approval Before Actions
- .canonicalize()
- Strategist Layer
- ShareModel
- GitHubAccount
- .save()
- .decode()
- .plan()
- OnboardingView
- .refresh()
- Kind
- CodingKeys
- SmartWard (iOS Application Target)
- String
- .messages()
- PlaybackLLM
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- PolitenessGate
- .stored()
- .projects()
- .documents()
- makeContext()
- RefreshEagerness
- NewConversationView
- RootView
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- IngestError
- SourceKind
- .data()
- .retrieve()
- StepProgress
- .check()
- AppLockController
- SmartWardIntents.swift
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- FakePIN
- Anchor
- .text()
- FakeClock
- LibraryFixture
- RetrievalFixture
- OnboardingReviewView
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- Identifiable
- RobotsRules
- .importItems()
- LibraryArchive
- .fromPastedURL()
- .score()
- String
- AppLockTests.swift
- graphify_pipeline.py
- Observation
- ArticleStage
- TopK
- FakeBiometrics
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .graphML()
- FoundationModelsEntityExtractor
- Why
- SharedItem
- StubTool
- Graph View
- .body
- UntrustedText (body/attribute inside its
- RepoSync.swift
- ActivitySheet
- .availability()
- RetrievedPassage
- VoiceTab
- FoundationModelsRelevanceJudge
- ProviderKeyRow
- .ask()
- Living Project Brief
- PINOutcome
- BriefRevisionStatus
- StrategyItemStatus
- CodingKeys
- .send()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- .lines()
- VoiceParse
- VoiceSpeedChange
- VoiceStatus
- Refused
- Apple Intelligence Preflight
- Step
- KnowledgeSchema
- AppStore
- graphify_refresh.sh
- .init()
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 111 edges
2. `KnowledgeStore` - 109 edges
3. `SwiftData` - 91 edges
4. `Project` - 75 edges
5. `Source` - 63 edges
6. `VoiceCommand` - 54 edges
7. `ThemeNode` - 51 edges
8. `Pipeline` - 49 edges
9. `ArticleReadoutController` - 48 edges
10. `XCTest` - 46 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (195 total, 6 thin omitted)

### Community 0 - "GraphView"
Cohesion: 0.06
Nodes (53): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+45 more)

### Community 1 - "DigestBuilder"
Cohesion: 0.06
Nodes (37): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+29 more)

### Community 2 - "String"
Cohesion: 0.08
Nodes (35): ContextPolicy, Bool, Set, Chunk, Conversation, .mode, ConversationMode, brainstorm (+27 more)

### Community 3 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 4 - "Project"
Cohesion: 0.09
Nodes (31): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+23 more)

### Community 5 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 6 - "SwiftData"
Cohesion: 0.09
Nodes (9): Accelerate, BackgroundTasks, Foundation, IngestKit, NaturalLanguage, RetrievalKit, ShareInbox, GitHubConfig (+1 more)

### Community 7 - "View"
Cohesion: 0.07
Nodes (39): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen, PrivacyCover (+31 more)

### Community 8 - "SourceKindOption"
Cohesion: 0.07
Nodes (37): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery, IntentAuthenticationPolicy (+29 more)

### Community 9 - "VoiceCommand"
Cohesion: 0.05
Nodes (43): VoiceCommand, aboutTheme, ask, back, clearSearch, .confirmation, dismiss, help (+35 more)

### Community 10 - "ArticleReadoutController"
Cohesion: 0.12
Nodes (16): MPRemoteCommand, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor, .currentText, .isActive, .isBriefing (+8 more)

### Community 11 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 12 - "GitHubClient"
Cohesion: 0.12
Nodes (17): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+9 more)

### Community 13 - ".makeContainer()"
Cohesion: 0.15
Nodes (13): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage (+5 more)

### Community 14 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 15 - "Source"
Cohesion: 0.11
Nodes (21): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+13 more)

### Community 16 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 17 - "VoiceCommandController"
Cohesion: 0.10
Nodes (18): AVAudioSession, Outcome, Phase, listening, off, starting, unavailable, Bool (+10 more)

### Community 18 - "FetchURLTool"
Cohesion: 0.09
Nodes (22): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, ApprovalDecision, approve, ask (+14 more)

### Community 19 - "PipelineRunner"
Cohesion: 0.10
Nodes (23): ExtractionTiers, FullTextFetching, PipelineRunner, Double, TimeInterval, RelevanceJudging, BudgetTests, Double (+15 more)

### Community 20 - "VoiceAnswersTests"
Cohesion: 0.11
Nodes (13): LibraryVoiceQueries, Bool, Date, Double, Int, ModelContext, String, ThemeDescription (+5 more)

### Community 21 - "SpeechCommandRecognizer"
Cohesion: 0.10
Nodes (21): AVAudioNodeTapBlock, AVAudioPCMBuffer, Error, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, Failure, .errorDescription (+13 more)

### Community 22 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 23 - "Article"
Cohesion: 0.08
Nodes (29): Article, ThemesRow, .sourceLabel, String, ArticleReaderView, .body, .fullTextBanner, .metadata (+21 more)

### Community 24 - "ReferenceLedger"
Cohesion: 0.13
Nodes (19): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, ReferenceLedger (+11 more)

### Community 25 - "ThemeNode"
Cohesion: 0.11
Nodes (17): Color, Data, ThemeNode, GraphEditing, GraphEditingTests, Date, .body, ThemeStyle (+9 more)

### Community 26 - ".dismiss()"
Cohesion: 0.08
Nodes (27): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+19 more)

### Community 27 - "Digest"
Cohesion: 0.14
Nodes (22): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+14 more)

### Community 28 - "ExtractedGraph"
Cohesion: 0.13
Nodes (16): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation, JSONValue (+8 more)

### Community 29 - "BYOKLLMKit"
Cohesion: 0.10
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 30 - "String"
Cohesion: 0.21
Nodes (9): EchoGuard, Bool, Int, Set, VoiceCommandParser, VoiceContext, VoiceItemMatcher, VoiceText (+1 more)

### Community 31 - "InterestModel"
Cohesion: 0.14
Nodes (18): CaseIterable, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+10 more)

### Community 32 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, Bool (+3 more)

### Community 33 - "StrategyItemKind"
Cohesion: 0.13
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 34 - ".run()"
Cohesion: 0.16
Nodes (15): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+7 more)

### Community 35 - "KnowledgeStore"
Cohesion: 0.14
Nodes (5): GraphKit, KnowledgeStore, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 36 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (13): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, RankedDocument, SearchDocument, Float, Int (+5 more)

### Community 37 - "RecordStrategyItemTool"
Cohesion: 0.14
Nodes (16): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+8 more)

### Community 38 - ".process()"
Cohesion: 0.11
Nodes (15): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, Date (+7 more)

### Community 39 - "ExtractionTier"
Cohesion: 0.15
Nodes (11): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+3 more)

### Community 40 - "EmbeddingModel"
Cohesion: 0.17
Nodes (12): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+4 more)

### Community 41 - ".article()"
Cohesion: 0.15
Nodes (11): Int, FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext (+3 more)

### Community 42 - "ConversationView"
Cohesion: 0.12
Nodes (18): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+10 more)

### Community 43 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 44 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 45 - "ReadoutPlayback"
Cohesion: 0.19
Nodes (7): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 46 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 47 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 48 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 49 - "SharedInbox"
Cohesion: 0.14
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, URL, SharedInboxTests, URL (+3 more)

### Community 50 - "BriefingTests"
Cohesion: 0.18
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 51 - ".run()"
Cohesion: 0.17
Nodes (10): Report, Bool, Date, Int, ModelContext, Set, URL, UUID (+2 more)

### Community 52 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 53 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 54 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 56 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 57 - "PerfTrace"
Cohesion: 0.16
Nodes (15): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+7 more)

### Community 58 - "ReadoutSegment"
Cohesion: 0.19
Nodes (10): Locale, ArticleReadout, Builder, .current, ReadoutScope, summaryOnly, whole, ReadoutSegment (+2 more)

### Community 59 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 60 - "ActionRequest"
Cohesion: 0.16
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 61 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 62 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 63 - "LocalizedError"
Cohesion: 0.10
Nodes (19): LocalizedError, ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int, RestoreError (+11 more)

### Community 64 - ".items()"
Cohesion: 0.18
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 65 - ".segments()"
Cohesion: 0.20
Nodes (6): ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 66 - ".outcome()"
Cohesion: 0.15
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 67 - "SearchHit"
Cohesion: 0.15
Nodes (14): OptionSet, MatchKind, SearchHit, .id, Double, MatchBadge, .body, SearchController (+6 more)

### Community 68 - "BriefError"
Cohesion: 0.14
Nodes (15): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+7 more)

### Community 69 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 70 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 71 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 72 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 73 - "OnboardingProposal"
Cohesion: 0.19
Nodes (11): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+3 more)

### Community 74 - "XCTestCase"
Cohesion: 0.13
Nodes (12): NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, PerformanceTests, SeededRandom, String, TimeInterval, UInt64 (+4 more)

### Community 75 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (11): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, SpeechFinishDelegate, Void, AppAudio, Bool, Bool (+3 more)

### Community 76 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 77 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 78 - ".makeFixture()"
Cohesion: 0.23
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 79 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService, PINVerifying (+2 more)

### Community 80 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 81 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 82 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 83 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 84 - ".parse()"
Cohesion: 0.18
Nodes (8): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests, .line

### Community 85 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 86 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 87 - "ArticleSummary"
Cohesion: 0.17
Nodes (11): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+3 more)

### Community 88 - "GraphIndexer"
Cohesion: 0.19
Nodes (9): EntityExtracting, GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext (+1 more)

### Community 89 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 90 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 91 - ".canonicalize()"
Cohesion: 0.17
Nodes (9): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL (+1 more)

### Community 92 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 93 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 94 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 95 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 96 - ".decode()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 97 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 98 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 99 - ".refresh()"
Cohesion: 0.21
Nodes (13): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+5 more)

### Community 100 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 101 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 102 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 103 - "String"
Cohesion: 0.27
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 104 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 105 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 106 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 107 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 108 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 109 - "PolitenessGate"
Cohesion: 0.22
Nodes (10): PolitenessGate, async, Data, Date, HTTPURLResponse, Int, TimeInterval, URL (+2 more)

### Community 110 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 111 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 112 - ".documents()"
Cohesion: 0.20
Nodes (10): SearchCorpus, Bool, ModelContext, Set, Update, .isEmpty, .currentArticle, Kind (+2 more)

### Community 113 - "makeContext()"
Cohesion: 0.22
Nodes (5): ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 114 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 115 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 116 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .briefingReady, .shouldListenByVoice, .tabs, Bool, String (+4 more)

### Community 117 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 118 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 119 - "IngestError"
Cohesion: 0.15
Nodes (12): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+4 more)

### Community 120 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 121 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 122 - ".retrieve()"
Cohesion: 0.28
Nodes (5): GraphRetriever, Float, ModelContext, String, UUID

### Community 123 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 124 - ".check()"
Cohesion: 0.23
Nodes (4): StaticString, String, UInt, VoiceFindCommandTests

### Community 125 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 126 - "SmartWardIntents.swift"
Cohesion: 0.20
Nodes (5): AppIntents, AVFoundation, MediaPlayer, Speech, VoiceLoopKit

### Community 127 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 128 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 129 - "FakePIN"
Cohesion: 0.27
Nodes (5): BiometricResult, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 130 - "Anchor"
Cohesion: 0.17
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 131 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 132 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 133 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 134 - "RetrievalFixture"
Cohesion: 0.29
Nodes (6): GraphRetrieverTests, RetrievalFixture, Bool, ModelContainer, ModelContext, UUID

### Community 135 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 136 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 137 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 138 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 139 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 140 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 141 - "Identifiable"
Cohesion: 0.20
Nodes (11): Identifiable, ReadingFilter, all, .id, starred, unread, ReadingOrder, .id (+3 more)

### Community 142 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 143 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 144 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 146 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 147 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 148 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 149 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 150 - "Observation"
Cohesion: 0.24
Nodes (3): FoundationModels, Observation, UserNotifications

### Community 151 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 152 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 153 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 154 - "VoiceSettings"
Cohesion: 0.28
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 155 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 156 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 157 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 158 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 159 - "FoundationModelsEntityExtractor"
Cohesion: 0.39
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 160 - "Why"
Cohesion: 0.25
Nodes (8): Bool, Why, connected, .description, direct, fetched, .isGraphHop, named

### Community 161 - "SharedItem"
Cohesion: 0.50
Nodes (5): SharedItem, SharedProject, Date, String, UUID

### Community 162 - "StubTool"
Cohesion: 0.29
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 163 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 164 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 165 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 166 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 167 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 168 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 169 - "RetrievedPassage"
Cohesion: 0.62
Nodes (3): RetrievedPassage, SourcesList, .body

### Community 170 - "VoiceTab"
Cohesion: 0.29
Nodes (7): VoiceTab, chat, graph, projects, reading, .title, today

### Community 171 - "FoundationModelsRelevanceJudge"
Cohesion: 0.33
Nodes (6): FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 172 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 173 - ".ask()"
Cohesion: 0.38
Nodes (6): Answer, failed, spoken, ModelContext, String, VoiceAsk

### Community 174 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 175 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 176 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 177 - "StrategyItemStatus"
Cohesion: 0.33
Nodes (6): .status, StrategyItemStatus, done, invalidated, open, superseded

### Community 178 - "CodingKeys"
Cohesion: 0.33
Nodes (6): CodingKeys, about, evidence, matters, remember, says

### Community 179 - ".send()"
Cohesion: 0.33
Nodes (4): Data, HTTPURLResponse, URLRequest, Reply

### Community 180 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 181 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 182 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 184 - "VoiceParse"
Cohesion: 0.40
Nodes (5): VoiceParse, command, ignored, unrecognized, wakeOnly

### Community 185 - "VoiceSpeedChange"
Cohesion: 0.40
Nodes (4): VoiceSpeedChange, faster, normal, slower

### Community 186 - "VoiceStatus"
Cohesion: 0.40
Nodes (5): VoiceStatus, failingSources, refresh, spendToday, unreadCount

### Community 187 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 188 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 189 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 190 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 191 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **448 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+443 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 832 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `GraphView`, `DigestBuilder`, `String`, `RetrievalFixture`, `ArticleReadoutController`, `FakeEmbedder`, `.makeContainer()`, `ProjectArticlesTests`, `.importItems()`, `Source`, `VoiceCommandController`, `PipelineRunner`, `VoiceAnswersTests`, `ArticleStage`, `ThemeNode`, `.dismiss()`, `Digest`, `InterestModel`, `ExtractedArticle`, `.process()`, `ExtractionTier`, `.article()`, `RetrievedPassage`, `ArticleSummaryCard`, `BriefingTests`, `.run()`, `.load()`, `ReadoutSegment`, `.segments()`, `.outcome()`, `SearchHit`, `Scenario`, `.makeFixture()`, `.fetch()`, `.save()`, `.refresh()`, `.documents()`, `makeContext()`, `.retrieve()`?**
  _High betweenness centrality (0.068) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `DigestBuilder`, `String`, `.text()`, `DailyBudget`, `GitHubClient`, `RobotsRules`, `GitHubDeviceFlow`, `.score()`, `AppLockTests.swift`, `Observation`, `TopK`, `ExtractedGraph`, `BYOKLLMKit`, `String`, `ExtractedArticle`, `SharedItem`, `KnowledgeStore`, `RepoSync.swift`, `SourceFetcher`, `.outcome()`, `PerfTrace`, `ReadoutSegment`, `Dependency`, `.items()`, `.segments()`, `RedirectPolicy`, `AppLockCoordinator`, `.parse()`, `ArticleSummary`, `.canonicalize()`, `.stored()`, `StepProgress`, `SmartWardIntents.swift`?**
  _High betweenness centrality (0.049) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `GraphView`, `.segments()`, `RepoSync.swift`, `SwiftData`, `EmbeddingModel`, `.retrieve()`, `SourceFetcher`, `.documents()`, `makeContext()`, `Article`, `Observation`, `Pipeline`, `GraphIndexer`, `ThemeNode`, `ReadoutSegment`, `BYOKLLMKit`, `SmartWardIntents.swift`?**
  _High betweenness centrality (0.046) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _448 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `GraphView` be split into smaller, more focused modules?**
  _Cohesion score 0.06116700201207243 - nodes in this community are weakly interconnected._
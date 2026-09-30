# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 201 files · ~791,001 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3779 nodes · 9769 edges · 193 communities (186 shown, 7 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1114 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- View
- DigestBuilder
- ModelFallback
- DailyBudget
- StrategyItemKind
- IngestError
- ThemeNode
- ReadoutPlayback
- ArticleReadoutController
- FetchURLTool
- VoiceCommand
- String
- .makeContainer()
- StrategistRunner
- VoiceCommandController
- Project
- ProjectArticlesTests
- GitHubDeviceFlow
- String
- SwiftData
- SpeechCommandRecognizer
- SwiftUI
- Sendable
- GitHubRepo
- Conversation
- StrategistTool
- .run()
- ExtractionTiers
- PipelineRunner
- RawItem
- String
- ExtractedArticle
- ExtractedGraph
- RetrievedPassage
- BYOKLLMKit
- GitHubClient
- SourceKind
- EmbeddingModel
- .outcome()
- Digest
- ActionRequest
- VoiceContext
- VoiceCommandTests
- ConversationView
- ArticleSummaryCard
- KnowledgeStore
- HybridSearchIndex
- SourceFetcher
- OnboardingProposal
- Pipeline
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- PerfTrace
- .items()
- Chunk
- Article
- InterestModel
- VoiceConfirmationGate
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- SharedInbox
- Dependency
- Source
- .process()
- CodingKeys
- GraphRAG
- AppLockCoordinator
- ReadoutSegment
- BriefError
- ArticleSummary
- .build()
- Scenario
- VoiceSpeaker
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- ExtractionTier
- .load()
- BackgroundWork
- .segments()
- .fetchURL()
- SearchHit
- ThemeStrengthCache
- VoiceCommands.swift
- XCTestCase
- Identifiable
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- .parse()
- RedirectPolicy
- .fetch()
- VoiceParse
- .makeFixture()
- .article()
- .check()
- Approval Before Actions
- Strategist Layer
- FakeEmbedder
- .refresh()
- ShareModel
- GitHubAccount
- .save()
- SearchDocument
- .plan()
- OnboardingView
- Kind
- SmartWardIntents.swift
- SmartWard (iOS Application Target)
- LibraryArchive
- .decode()
- .messages()
- PlaybackLLM
- .body
- BackupView
- GraphSnapshot
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- ArticleReaderView
- String
- RefreshEagerness
- OnboardingReviewView
- RootView
- SourceKindOption
- SmartWard XcodeGen Project Spec
- Anchor
- StepProgress
- AppLockController
- GraphView
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .text()
- LibraryFixture
- .check()
- BiometricUnlocking
- ProjectEntity
- AppLock.swift
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .unlockWithBiometrics()
- .importItems()
- .fromPastedURL()
- .score()
- .update()
- graphify_pipeline.py
- AppLockPolicy
- ArticleStage
- TopK
- FakeBiometrics
- ThemeDetailView
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .graphML()
- FoundationModelsEntityExtractor
- DeveloperView
- GraphExtraction.swift
- ArchiveError
- LexicalIndex
- StubTool
- .init()
- Graph View
- UntrustedText (body/attribute inside its
- ActivitySheet
- .perform()
- .data()
- .lines()
- VoiceTab
- Living Project Brief
- .color()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- Apple Intelligence Preflight
- .importPending()
- Phase
- KnowledgeSchema
- ApprovalDecision
- .isLoaded()
- SharedInboxTests
- AppStore
- Refused
- graphify_refresh.sh
- DeveloperSettings
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 112 edges
2. `KnowledgeStore` - 111 edges
3. `SwiftData` - 93 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 71 edges
6. `Source` - 63 edges
7. `Pipeline` - 53 edges
8. `ThemeNode` - 51 edges
9. `XCTest` - 49 edges
10. `ArticleReadoutController` - 48 edges

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

## Communities (193 total, 7 thin omitted)

### Community 0 - "View"
Cohesion: 0.04
Nodes (64): Hashable, ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker (+56 more)

### Community 1 - "DigestBuilder"
Cohesion: 0.05
Nodes (42): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+34 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "DailyBudget"
Cohesion: 0.07
Nodes (36): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+28 more)

### Community 4 - "StrategyItemKind"
Cohesion: 0.07
Nodes (30): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Arguments (+22 more)

### Community 5 - "IngestError"
Cohesion: 0.08
Nodes (31): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+23 more)

### Community 6 - "ThemeNode"
Cohesion: 0.10
Nodes (19): MergeSuggestion, ThemeEdge, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext (+11 more)

### Community 7 - "ReadoutPlayback"
Cohesion: 0.11
Nodes (15): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests, BriefingTests (+7 more)

### Community 8 - "ArticleReadoutController"
Cohesion: 0.10
Nodes (20): MPRemoteCommand, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor, .currentArticle, .currentText, .isActive (+12 more)

### Community 9 - "FetchURLTool"
Cohesion: 0.09
Nodes (22): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+14 more)

### Community 10 - "VoiceCommand"
Cohesion: 0.04
Nodes (45): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+37 more)

### Community 11 - "String"
Cohesion: 0.10
Nodes (13): LibraryVoiceQueries, Bool, Date, Double, Int, ModelContext, String, ThemeDescription (+5 more)

### Community 12 - ".makeContainer()"
Cohesion: 0.14
Nodes (14): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Error, Int (+6 more)

### Community 13 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 14 - "VoiceCommandController"
Cohesion: 0.11
Nodes (15): AVAudioSession, .body, Outcome, Bool, ModelContext, Never, NSObjectProtocol, String (+7 more)

### Community 15 - "Project"
Cohesion: 0.14
Nodes (17): BriefRevision, Project, ProjectBrief, StrategyItem, BriefEditing, tooLong, BriefReviser, Suggestion (+9 more)

### Community 16 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 17 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 18 - "String"
Cohesion: 0.10
Nodes (20): Set, EntityAlias, InterestProfile, Mention, Message, ProjectLink, .kind, .sendsContentToBYOK (+12 more)

### Community 19 - "SwiftData"
Cohesion: 0.10
Nodes (8): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security, SwiftData

### Community 20 - "SpeechCommandRecognizer"
Cohesion: 0.10
Nodes (21): AVAudioNodeTapBlock, AVAudioPCMBuffer, Error, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, Failure, .errorDescription (+13 more)

### Community 21 - "SwiftUI"
Cohesion: 0.08
Nodes (10): AVFoundation, BackgroundTasks, MediaPlayer, Observation, ShareInbox, Speech, SwiftUI, UIKit (+2 more)

### Community 22 - "Sendable"
Cohesion: 0.26
Nodes (31): Codable, Equatable, GitHubUser, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord (+23 more)

### Community 23 - "GitHubRepo"
Cohesion: 0.10
Nodes (22): Decodable, GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized (+14 more)

### Community 24 - "Conversation"
Cohesion: 0.08
Nodes (32): .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Conversation, .mode (+24 more)

### Community 25 - "StrategistTool"
Cohesion: 0.11
Nodes (21): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, SearchCorpusTool (+13 more)

### Community 26 - ".run()"
Cohesion: 0.12
Nodes (21): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+13 more)

### Community 27 - "ExtractionTiers"
Cohesion: 0.11
Nodes (18): ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 28 - "PipelineRunner"
Cohesion: 0.15
Nodes (15): FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+7 more)

### Community 29 - "RawItem"
Cohesion: 0.14
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 30 - "String"
Cohesion: 0.20
Nodes (8): Decoder, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceText, String

### Community 31 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 32 - "ExtractedGraph"
Cohesion: 0.16
Nodes (14): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation, JSONValue (+6 more)

### Community 33 - "RetrievedPassage"
Cohesion: 0.13
Nodes (16): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+8 more)

### Community 34 - "BYOKLLMKit"
Cohesion: 0.12
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 35 - "GitHubClient"
Cohesion: 0.14
Nodes (11): GitHubClient, .isAuthenticated, FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, RepoSyncTests (+3 more)

### Community 36 - "SourceKind"
Cohesion: 0.07
Nodes (27): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+19 more)

### Community 37 - "EmbeddingModel"
Cohesion: 0.13
Nodes (14): EmbeddingModel, EmbeddingProviding, String, EntityExtracting, GraphIndexer, .suggestionsAdded, GraphLinker, Result (+6 more)

### Community 38 - ".outcome()"
Cohesion: 0.10
Nodes (15): NavigationPath, ProjectVoiceQueries, Int, ModelContext, AppNavigation, AppTab, chat, graph (+7 more)

### Community 39 - "Digest"
Cohesion: 0.17
Nodes (19): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+11 more)

### Community 40 - "ActionRequest"
Cohesion: 0.12
Nodes (20): confirm, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+12 more)

### Community 41 - "VoiceContext"
Cohesion: 0.15
Nodes (9): VoiceContext, String, VoiceRephrase, VoiceRephrasing, VoiceRephraseTests, FoundationModelsVoiceRephraser, .isAvailable, Bool (+1 more)

### Community 42 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 43 - "ConversationView"
Cohesion: 0.12
Nodes (18): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+10 more)

### Community 44 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 45 - "KnowledgeStore"
Cohesion: 0.15
Nodes (4): GraphKit, IngestKit, KnowledgeStore, GitHubConfig

### Community 46 - "HybridSearchIndex"
Cohesion: 0.17
Nodes (11): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+3 more)

### Community 47 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 48 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 50 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 51 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 52 - "PerfTrace"
Cohesion: 0.15
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 53 - ".items()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 54 - "Chunk"
Cohesion: 0.15
Nodes (9): ContextPolicy, Bool, Chunk, Data, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer (+1 more)

### Community 55 - "Article"
Cohesion: 0.12
Nodes (20): Article, ModelContainer, ModelContext, .sourceLabel, String, ArticleRow, .body, .content (+12 more)

### Community 56 - "InterestModel"
Cohesion: 0.18
Nodes (12): Interest, InterestModel, .isEmpty, Bool, Double, Float, ModelContext, Set (+4 more)

### Community 57 - "VoiceConfirmationGate"
Cohesion: 0.18
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 58 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 59 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 60 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 61 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 62 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 63 - "Source"
Cohesion: 0.16
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 64 - ".process()"
Cohesion: 0.11
Nodes (17): Int, Triage, TriageDisplayTests, .body, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool (+9 more)

### Community 65 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 66 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 67 - "AppLockCoordinator"
Cohesion: 0.16
Nodes (13): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+5 more)

### Community 68 - "ReadoutSegment"
Cohesion: 0.22
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 69 - "BriefError"
Cohesion: 0.13
Nodes (15): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+7 more)

### Community 70 - "ArticleSummary"
Cohesion: 0.14
Nodes (11): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+3 more)

### Community 71 - ".build()"
Cohesion: 0.21
Nodes (14): Edge, Node, Scope, all, recent, source, Bool, Date (+6 more)

### Community 72 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 73 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (12): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, NSObject, SpeechFinishDelegate, Void, AppAudio, Bool (+4 more)

### Community 74 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 75 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 76 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 77 - "ExtractionTier"
Cohesion: 0.19
Nodes (9): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+1 more)

### Community 78 - ".load()"
Cohesion: 0.20
Nodes (12): SampleLibrary, Size, SplitMix, Date, Double, Float, Int, ModelContainer (+4 more)

### Community 79 - "BackgroundWork"
Cohesion: 0.16
Nodes (10): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Date, String (+2 more)

### Community 80 - ".segments()"
Cohesion: 0.24
Nodes (6): Locale, ArticleReadout, Builder, .current, String, TimeZone

### Community 81 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 82 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 83 - "ThemeStrengthCache"
Cohesion: 0.24
Nodes (11): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+3 more)

### Community 84 - "VoiceCommands.swift"
Cohesion: 0.11
Nodes (17): EchoGuard, VoiceReadingFilter, all, starred, unread, VoiceReadingOrder, mostRelevant, newest (+9 more)

### Community 85 - "XCTestCase"
Cohesion: 0.14
Nodes (12): NormalizedKeyTests, PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests (+4 more)

### Community 86 - "Identifiable"
Cohesion: 0.13
Nodes (17): CaseIterable, Identifiable, Strength, balanced, off, strict, .threshold, ReadingFilter (+9 more)

### Community 87 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 88 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 89 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 90 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 91 - ".parse()"
Cohesion: 0.18
Nodes (8): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests, .line

### Community 92 - "RedirectPolicy"
Cohesion: 0.14
Nodes (11): PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest, URLSession (+3 more)

### Community 93 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 94 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 95 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 96 - ".article()"
Cohesion: 0.24
Nodes (7): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext, Set

### Community 97 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 98 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 99 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 100 - "FakeEmbedder"
Cohesion: 0.23
Nodes (7): EmbeddingProviding, FakeEmbedder, .dimension, Float, Int, String, HybridSearchTests

### Community 101 - ".refresh()"
Cohesion: 0.21
Nodes (13): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+5 more)

### Community 102 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 103 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 104 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 105 - "SearchDocument"
Cohesion: 0.26
Nodes (10): SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID, Update (+2 more)

### Community 106 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 107 - "OnboardingView"
Cohesion: 0.15
Nodes (13): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .canStart, .hasUserInput, .interview, .links (+5 more)

### Community 108 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 109 - "SmartWardIntents.swift"
Cohesion: 0.24
Nodes (13): AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+5 more)

### Community 110 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 111 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 112 - ".decode()"
Cohesion: 0.16
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 113 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 114 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 115 - ".body"
Cohesion: 0.13
Nodes (14): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+6 more)

### Community 116 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 117 - "GraphSnapshot"
Cohesion: 0.24
Nodes (11): CGFloat, ForceLayout, GraphSnapshot, Point, GraphCanvas, .body, Void, ThemeList (+3 more)

### Community 118 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 119 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 120 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 121 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 122 - "ArticleReaderView"
Cohesion: 0.15
Nodes (11): ReadoutScope, summaryOnly, whole, ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs (+3 more)

### Community 123 - "String"
Cohesion: 0.29
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 124 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 125 - "OnboardingReviewView"
Cohesion: 0.21
Nodes (10): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+2 more)

### Community 126 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .briefingReady, .shouldListenByVoice, .tabs, Bool, String (+4 more)

### Community 127 - "SourceKindOption"
Cohesion: 0.15
Nodes (13): AppEnum, IntentFailure, .errorDescription, libraryUnavailable, noProvider, SourceKindOption, arxiv, feed (+5 more)

### Community 128 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 129 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 130 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 131 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 132 - "GraphView"
Cohesion: 0.24
Nodes (12): GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all, project (+4 more)

### Community 133 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 134 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 135 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 136 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 137 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 138 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 139 - "BiometricUnlocking"
Cohesion: 0.22
Nodes (8): AnyObject, .biometryName, BiometricUnlocking, PINVerifying, BiometricUnavailable, BiometryType, Result, Void

### Community 140 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 141 - "AppLock.swift"
Cohesion: 0.24
Nodes (6): AppLock, BiometricLockKit, BiometricService, PINRules, PINRulesTests, PINLockKit

### Community 142 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 143 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 144 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 145 - ".unlockWithBiometrics()"
Cohesion: 0.22
Nodes (7): BiometricStep, needsPIN, unlocked, PINService, BiometricResult, PINAttemptResult, String

### Community 146 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 148 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 149 - ".update()"
Cohesion: 0.22
Nodes (8): PrivacyCover, .body, LockOverlay, .body, LockWindow, Bool, UIWindow, UIWindowScene

### Community 150 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 151 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 152 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 153 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 154 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 155 - "ThemeDetailView"
Cohesion: 0.31
Nodes (8): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions

### Community 156 - "VoiceSettings"
Cohesion: 0.28
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 157 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 158 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 159 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 160 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 161 - "FoundationModelsEntityExtractor"
Cohesion: 0.39
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 162 - "DeveloperView"
Cohesion: 0.44
Nodes (4): DeveloperView, .body, Double, String

### Community 164 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 165 - "LexicalIndex"
Cohesion: 0.36
Nodes (3): LexicalIndex, .count, LexicalIndexTests

### Community 166 - "StubTool"
Cohesion: 0.29
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 167 - ".init()"
Cohesion: 0.36
Nodes (4): KeyedExtractor, Bool, ModelContext, String

### Community 168 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 169 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 170 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 171 - ".perform()"
Cohesion: 0.38
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 172 - ".data()"
Cohesion: 0.52
Nodes (3): Data, Float, VectorCoding

### Community 174 - "VoiceTab"
Cohesion: 0.29
Nodes (7): VoiceTab, chat, graph, projects, reading, .title, today

### Community 175 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 176 - ".color()"
Cohesion: 0.40
Nodes (4): Color, .body, ThemeStyle, .body

### Community 177 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 178 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 179 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 180 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 181 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 182 - ".importPending()"
Cohesion: 0.60
Nodes (3): ShareIntake, Int, ModelContext

### Community 183 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 184 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 185 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 186 - ".isLoaded()"
Cohesion: 0.50
Nodes (3): Bool, ModelContext, .sampleLoaded

### Community 188 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 189 - "Refused"
Cohesion: 0.67
Nodes (3): Refused, device, provider

### Community 191 - "DeveloperSettings"
Cohesion: 0.67
Nodes (3): DeveloperSettings, .isEnabled, Bool

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **463 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+458 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 857 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `View`, `DigestBuilder`, `ThemeNode`, `ReadoutPlayback`, `ArticleReadoutController`, `String`, `.makeContainer()`, `VoiceCommandController`, `Project`, `ProjectArticlesTests`, `.importItems()`, `String`, `ArticleStage`, `Conversation`, `StrategistTool`, `ExtractionTiers`, `PipelineRunner`, `RawItem`, `RetrievedPassage`, `EmbeddingModel`, `.outcome()`, `.init()`, `Digest`, `ArticleSummaryCard`, `Chunk`, `Source`, `.process()`, `ReadoutSegment`, `Scenario`, `ExtractionTier`, `.load()`, `BackgroundWork`, `.segments()`, `SearchHit`, `.fetch()`, `.makeFixture()`, `.article()`, `FakeEmbedder`, `.refresh()`, `.save()`, `SearchDocument`, `ArticleReaderView`?**
  _High betweenness centrality (0.063) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `Anchor`, `StepProgress`, `DailyBudget`, `DigestBuilder`, `IngestError`, `.canonicalize()`, `StrategyItemKind`, `.text()`, `String`, `AppLock.swift`, `Project`, `GitHubDeviceFlow`, `String`, `.score()`, `SwiftUI`, `GitHubRepo`, `Conversation`, `TopK`, `ExtractedArticle`, `ExtractedGraph`, `BYOKLLMKit`, `GraphExtraction.swift`, `ActionRequest`, `VoiceContext`, `KnowledgeStore`, `SourceFetcher`, `PerfTrace`, `.items()`, `Chunk`, `.outcome()`, `SharedInbox`, `Dependency`, `ReadoutSegment`, `ArticleSummary`, `ExtractionTier`, `VoiceCommands.swift`, `.parse()`, `RedirectPolicy`, `SmartWardIntents.swift`, `.stored()`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Anchor`, `StrategyItemKind`, `ThemeNode`, `String`, `Project`, `SwiftData`, `SwiftUI`, `RetrievedPassage`, `BYOKLLMKit`, `GraphExtraction.swift`, `EmbeddingModel`, `SourceFetcher`, `Pipeline`, `Article`, `ReadoutSegment`, `.build()`, `ExtractionTier`, `SearchDocument`, `SmartWardIntents.swift`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _463 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `View` be split into smaller, more focused modules?**
  _Cohesion score 0.04219409282700422 - nodes in this community are weakly interconnected._
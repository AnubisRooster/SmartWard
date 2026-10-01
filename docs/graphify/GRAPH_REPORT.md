# Graph Report - SmartWard  (2026-10-01)

## Corpus Check
- Large corpus: 207 files · ~829,055 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3980 nodes · 10289 edges · 205 communities (198 shown, 7 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1141 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ThemeNode
- VoiceCommand
- ModelFallback
- Project
- SharedInbox
- ArticleReadoutController
- GraphSnapshot
- VoiceCommandController
- ReferenceLedger
- KnowledgeStore
- .makeContainer()
- StrategyItemKind
- String
- StrategistRunner
- VoiceContext
- View
- GitHubDeviceFlow
- PipelineRunner
- ProjectArticlesTests
- GitHubClient
- Article
- String
- Sendable
- FetchURLTool
- Foundation
- Digest
- RetrievedPassage
- .run()
- DailyBudget
- GraphIndexer
- GraphView
- RawItem
- .record()
- ExtractedGraph
- Pipeline
- BYOKLLMKit
- SpeechCommandRecognizer
- GitHubRepo
- ConversationMode
- BriefingTests
- .run()
- ExtractedArticle
- AppLockCoordinator
- VoiceCommandTests
- ConversationView.swift
- .items()
- SourceFetcher
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .load()
- ActionRequest
- VoiceConfirmationGate
- .fetch()
- .outcome()
- AnalyzerCommandRecognizer
- AskStrategistIntent
- VoiceEngine
- Invariant D5: Private content never goes
- PerfTrace
- .score()
- Dependency
- Source
- .testEachToolDeclaresWhetherItAsksAndMat
- HybridSearchIndex
- InterestModel
- ModelCatalogController
- CodingKeys
- GraphRAG
- LexicalIndex
- IngestError
- ReadoutPlayback
- ReadoutSegment
- DigestSummaryRequest
- .retrieve()
- OnboardingProposal
- .seal()
- ArticleStage
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- Scenario
- .process()
- ArticleSummaryCard
- AnalyzerFeed
- .fetchURL()
- SearchHit
- BriefError
- .body
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppNavigation
- RedirectPolicy
- EntityResolver
- VoiceParse
- .makeFixture()
- .check()
- Approval Before Actions
- RefreshEagerness
- CaseIterable
- Strategist Layer
- .parse()
- GitHubAccount
- XCTestCase
- Anchor
- .save()
- .fallbackLLM()
- .plan()
- OnboardingView
- Kind
- BackgroundWork
- SourceKindOption
- .byokSettings()
- SmartWard (iOS Application Target)
- .segments()
- String
- .messages()
- makeContext()
- PlaybackLLM
- AppLockController
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- SearchDocument
- SeededRandom
- NewConversationView
- Choice
- RootView
- SmartWard XcodeGen Project Spec
- Observation
- AppLockPolicy
- SourceKind
- ArticleSummary
- Refusal
- .check()
- VoiceIntentTests
- ArticleReaderView
- VoiceSpeaker
- .refresh()
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GitHubError
- .user()
- .data()
- .text()
- CodingKeys
- FakeClock
- LibraryFixture
- .check()
- OnboardingReviewView
- DeveloperView
- .start()
- AppLock.swift
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- Failure
- LocalizedError
- LibraryArchive
- graphify_pipeline.py
- RobotsRules
- ArticleSummarizer
- EmbeddingModel
- StepProgress
- TopK
- FakeBiometrics
- .check()
- ProjectEntity
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- Question
- .buildIfDue()
- AppLockTests.swift
- .send()
- ArchiveError
- .lines()
- FakeCompletion
- .init()
- Graph View
- .body
- UntrustedText (body/attribute inside its
- ActivitySheet
- .availability()
- ProviderKeyRow
- .ask()
- Living Project Brief
- BriefRevisionStatus
- State
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- Apple Intelligence Preflight
- Step
- KnowledgeSchema
- AppStore
- Refused
- FixedJudge
- graphify_refresh.sh
- MatchKind
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 120 edges
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
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
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

## Communities (205 total, 7 thin omitted)

### Community 0 - "ThemeNode"
Cohesion: 0.08
Nodes (33): ContextPolicy, Bool, Set, Chunk, Conversation, EntityAlias, InterestProfile, Mention (+25 more)

### Community 1 - "VoiceCommand"
Cohesion: 0.03
Nodes (64): EchoGuard, VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation (+56 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "Project"
Cohesion: 0.08
Nodes (33): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+25 more)

### Community 4 - "SharedInbox"
Cohesion: 0.06
Nodes (32): JSONDecoder, JSONEncoder, NSExtensionContext, Result, SharedImport, Date, Int, ModelContext (+24 more)

### Community 5 - "ArticleReadoutController"
Cohesion: 0.08
Nodes (28): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, MPRemoteCommand, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor (+20 more)

### Community 6 - "GraphSnapshot"
Cohesion: 0.08
Nodes (36): CGFloat, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all (+28 more)

### Community 7 - "VoiceCommandController"
Cohesion: 0.10
Nodes (18): ProjectVoiceQueries, Int, ModelContext, Outcome, Bool, ModelContext, Never, NSObjectProtocol (+10 more)

### Community 8 - "ReferenceLedger"
Cohesion: 0.09
Nodes (24): ReferenceContext, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition (+16 more)

### Community 9 - "KnowledgeStore"
Cohesion: 0.13
Nodes (7): BackgroundTasks, IngestKit, KnowledgeStore, ShareInbox, GitHubConfig, SwiftData, SwiftUI

### Community 10 - ".makeContainer()"
Cohesion: 0.14
Nodes (14): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Error, Int (+6 more)

### Community 11 - "StrategyItemKind"
Cohesion: 0.07
Nodes (30): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+22 more)

### Community 12 - "String"
Cohesion: 0.10
Nodes (13): LibraryVoiceQueries, Bool, Date, Double, Int, ModelContext, String, ThemeDescription (+5 more)

### Community 13 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 14 - "VoiceContext"
Cohesion: 0.10
Nodes (27): Decodable, VoiceContext, Action, Answer, Outcome, actions, notUnderstood, Bool (+19 more)

### Community 15 - "View"
Cohesion: 0.07
Nodes (36): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+28 more)

### Community 16 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (27): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+19 more)

### Community 17 - "PipelineRunner"
Cohesion: 0.11
Nodes (22): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, PipelineRunner, Date, Double (+14 more)

### Community 18 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 19 - "GitHubClient"
Cohesion: 0.12
Nodes (16): GitHubClient, .isAuthenticated, GitHubUser, Data, HTTPURLResponse, Set, String, T (+8 more)

### Community 20 - "Article"
Cohesion: 0.07
Nodes (34): Article, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding (+26 more)

### Community 21 - "String"
Cohesion: 0.15
Nodes (15): Decoder, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceTab, chat (+7 more)

### Community 22 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 23 - "FetchURLTool"
Cohesion: 0.09
Nodes (22): AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval, .definition (+14 more)

### Community 24 - "Foundation"
Cohesion: 0.07
Nodes (7): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security

### Community 25 - "Digest"
Cohesion: 0.13
Nodes (22): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+14 more)

### Community 26 - "RetrievedPassage"
Cohesion: 0.11
Nodes (21): RetrievedPassage, ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 27 - ".run()"
Cohesion: 0.15
Nodes (12): ArticleIndexer, Report, ModelContext, Set, UUID, Void, FakeFullText, PipelineRunnerTests (+4 more)

### Community 28 - "DailyBudget"
Cohesion: 0.13
Nodes (16): DailyBudget, DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext (+8 more)

### Community 29 - "GraphIndexer"
Cohesion: 0.14
Nodes (17): ExtractionJob, ExtractionResult, GraphIndexer, .suggestionsAdded, GraphLinker, Outcome, cancelled, failed (+9 more)

### Community 30 - "GraphView"
Cohesion: 0.11
Nodes (25): Hashable, Connection, .id, GraphView, .asList, .body, .graphScope, MergeReviewView (+17 more)

### Community 31 - "RawItem"
Cohesion: 0.14
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 32 - ".record()"
Cohesion: 0.17
Nodes (15): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+7 more)

### Community 33 - "ExtractedGraph"
Cohesion: 0.15
Nodes (13): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, ExtractionText, Relation, LLMCompleting, LLMProvider (+5 more)

### Community 35 - "BYOKLLMKit"
Cohesion: 0.12
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 36 - "SpeechCommandRecognizer"
Cohesion: 0.14
Nodes (13): NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, RequestBox, SpeechCommandRecognizer, AVAudioNodeTapBlock, AVAudioPCMBuffer, Bool (+5 more)

### Community 37 - "GitHubRepo"
Cohesion: 0.16
Nodes (14): GitHubRepo, .id, Bool, ApplyResult, Document, RepoSnapshot, RepoSync, Date (+6 more)

### Community 38 - "ConversationMode"
Cohesion: 0.13
Nodes (15): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, Item (+7 more)

### Community 39 - "BriefingTests"
Cohesion: 0.16
Nodes (9): .groupPosition, BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext (+1 more)

### Community 40 - ".run()"
Cohesion: 0.16
Nodes (15): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+7 more)

### Community 41 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 42 - "AppLockCoordinator"
Cohesion: 0.15
Nodes (15): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+7 more)

### Community 43 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 44 - "ConversationView.swift"
Cohesion: 0.11
Nodes (12): AVFoundation, AVSpeechSynthesisVoice, MediaPlayer, String, VoiceSettings, .current, VoiceSettingsSection, .body (+4 more)

### Community 45 - ".items()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 46 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 47 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 48 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 49 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 50 - "ActionRequest"
Cohesion: 0.15
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 51 - "VoiceConfirmationGate"
Cohesion: 0.18
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 52 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 53 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 54 - "AnalyzerCommandRecognizer"
Cohesion: 0.17
Nodes (9): AnalyzerCommandRecognizer, Double, Never, NSObjectProtocol, String, Task, Timer, Void (+1 more)

### Community 55 - "AskStrategistIntent"
Cohesion: 0.13
Nodes (19): AppIntent, AppShortcut, AppShortcutsProvider, AudioPlaybackIntent, IntentAuthenticationPolicy, IntentResult, LocalizedStringResource, ParameterSummary (+11 more)

### Community 56 - "VoiceEngine"
Cohesion: 0.12
Nodes (11): AVAudioSession, CommandRecognizing, VoiceEngine, .current, .id, standard, Phase, listening (+3 more)

### Community 57 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 58 - "PerfTrace"
Cohesion: 0.16
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 59 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 60 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 61 - "Source"
Cohesion: 0.16
Nodes (15): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+7 more)

### Community 62 - ".testEachToolDeclaresWhetherItAsksAndMat"
Cohesion: 0.11
Nodes (14): ActionTools, ApprovalDecision, approve, ask, decline, Bool, Set, ApprovalPolicyTests (+6 more)

### Community 63 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (11): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Bool, Float, Int, Set (+3 more)

### Community 64 - "InterestModel"
Cohesion: 0.20
Nodes (11): Interest, InterestModel, .isEmpty, Bool, Double, Float, String, Triage (+3 more)

### Community 65 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 66 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 67 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 68 - "LexicalIndex"
Cohesion: 0.16
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 69 - "IngestError"
Cohesion: 0.11
Nodes (18): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+10 more)

### Community 70 - "ReadoutPlayback"
Cohesion: 0.20
Nodes (7): ReadoutPlayback, .current, .currentGroup, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 71 - "ReadoutSegment"
Cohesion: 0.22
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 72 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (11): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String (+3 more)

### Community 73 - ".retrieve()"
Cohesion: 0.15
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 74 - "OnboardingProposal"
Cohesion: 0.18
Nodes (12): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+4 more)

### Community 75 - ".seal()"
Cohesion: 0.17
Nodes (15): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+7 more)

### Community 76 - "ArticleStage"
Cohesion: 0.13
Nodes (14): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+6 more)

### Community 77 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 78 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 79 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 80 - ".process()"
Cohesion: 0.17
Nodes (15): .body, FoundationModelsRelevanceJudge, PipelineController, .indexesWhileOpen, Bool, Int, ModelContext, Never (+7 more)

### Community 81 - "ArticleSummaryCard"
Cohesion: 0.16
Nodes (12): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, Bool (+4 more)

### Community 82 - "AnalyzerFeed"
Cohesion: 0.19
Nodes (10): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, AnalyzerFeed, Session, AVAudioNodeTapBlock, AVAudioPCMBuffer (+2 more)

### Community 83 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 84 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 85 - "BriefError"
Cohesion: 0.14
Nodes (15): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+7 more)

### Community 86 - ".body"
Cohesion: 0.12
Nodes (15): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, DigestSettingsSection, .body (+7 more)

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

### Community 91 - "AppNavigation"
Cohesion: 0.15
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 92 - "RedirectPolicy"
Cohesion: 0.14
Nodes (11): PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest, URLSession (+3 more)

### Community 93 - "EntityResolver"
Cohesion: 0.26
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 94 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 95 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 96 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 97 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 98 - "RefreshEagerness"
Cohesion: 0.13
Nodes (16): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+8 more)

### Community 99 - "CaseIterable"
Cohesion: 0.13
Nodes (16): CaseIterable, Strength, balanced, off, strict, .threshold, ReadingFilter, all (+8 more)

### Community 100 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 101 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 102 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 103 - "XCTestCase"
Cohesion: 0.21
Nodes (5): String, Int, LinkParsingTests, TriageDisplayTests, XCTestCase

### Community 104 - "Anchor"
Cohesion: 0.12
Nodes (14): Anchor, details, note, paragraph, relevance, summary, themes, title (+6 more)

### Community 105 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 106 - ".fallbackLLM()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 107 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 108 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 109 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 110 - "BackgroundWork"
Cohesion: 0.18
Nodes (8): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, TimeInterval, .body

### Community 111 - "SourceKindOption"
Cohesion: 0.13
Nodes (15): AppEnum, DisplayRepresentation, IntentFailure, .errorDescription, libraryUnavailable, noProvider, SourceKindOption, arxiv (+7 more)

### Community 112 - ".byokSettings()"
Cohesion: 0.19
Nodes (9): Color, ExtractionDeclined, .errorDescription, ExtractionSettings, FoundationModelsEntityExtractor, String, .body, ThemeStyle (+1 more)

### Community 113 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 114 - ".segments()"
Cohesion: 0.30
Nodes (5): Locale, ArticleReadout, Builder, String, TimeZone

### Community 115 - "String"
Cohesion: 0.27
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 116 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 117 - "makeContext()"
Cohesion: 0.19
Nodes (6): ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests, ModelContainer, ModelContext

### Community 118 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 119 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 120 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 121 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 122 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 123 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 124 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 125 - "SearchDocument"
Cohesion: 0.32
Nodes (8): SearchCorpus, SearchDocument, ModelContext, String, UUID, Update, .isEmpty, Sequence

### Community 126 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 127 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 128 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 129 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .shouldListenByVoice, .tabs, Bool, String, String (+4 more)

### Community 130 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 131 - "Observation"
Cohesion: 0.18
Nodes (6): FoundationModels, Observation, ReadingSettingsSection, .body, UniformTypeIdentifiers, UserNotifications

### Community 132 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 133 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 134 - "ArticleSummary"
Cohesion: 0.26
Nodes (3): ArticleSummary, Bool, Date

### Community 135 - "Refusal"
Cohesion: 0.21
Nodes (10): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+2 more)

### Community 136 - ".check()"
Cohesion: 0.24
Nodes (4): StaticString, String, UInt, VoiceHandsFreeCommandTests

### Community 138 - "ArticleReaderView"
Cohesion: 0.21
Nodes (9): ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL, .paragraphs, Bool, String (+1 more)

### Community 139 - "VoiceSpeaker"
Cohesion: 0.18
Nodes (6): AppAudio, Bool, Bool, String, VoiceSpeaker, .isBusy

### Community 140 - ".refresh()"
Cohesion: 0.27
Nodes (10): IngestController, Bool, Int, ModelContext, Set, String, UUID, Void (+2 more)

### Community 141 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 142 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 143 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 144 - "GitHubError"
Cohesion: 0.20
Nodes (10): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+2 more)

### Community 145 - ".user()"
Cohesion: 0.24
Nodes (6): DigestPrompt, ExtractionPrompt, .schema, JSONValue, String, UntrustedText

### Community 146 - ".data()"
Cohesion: 0.27
Nodes (6): Data, Float, VectorCoding, Float, String, VectorCodingTests

### Community 147 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 148 - "CodingKeys"
Cohesion: 0.17
Nodes (11): CodingKeys, action, change, filter, kind, number, on, order (+3 more)

### Community 149 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 150 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 151 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 152 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 153 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 154 - ".start()"
Cohesion: 0.20
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 155 - "AppLock.swift"
Cohesion: 0.27
Nodes (7): AnyObject, BiometricLockKit, BiometricService, BiometricUnlocking, PINService, PINVerifying, PINAttemptResult

### Community 156 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 157 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 158 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 159 - "Failure"
Cohesion: 0.18
Nodes (11): Error, GraphIndexError, extractionFailed, Failure, engineUnavailable, .errorDescription, micNotReady, notResponding (+3 more)

### Community 160 - "LocalizedError"
Cohesion: 0.18
Nodes (11): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+3 more)

### Community 161 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 162 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 163 - "RobotsRules"
Cohesion: 0.40
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 164 - "ArticleSummarizer"
Cohesion: 0.31
Nodes (6): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID

### Community 165 - "EmbeddingModel"
Cohesion: 0.29
Nodes (6): EmbeddingModel, EmbeddingProviding, String, ModelContext, Set, UUID

### Community 166 - "StepProgress"
Cohesion: 0.24
Nodes (6): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests

### Community 167 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 168 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 169 - ".check()"
Cohesion: 0.31
Nodes (3): BriefingGateTests, Bool, TimeInterval

### Community 170 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 171 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 172 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 173 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 174 - "Question"
Cohesion: 0.25
Nodes (8): .isEmpty, Question, about, evidence, matters, remember, says, .title

### Community 175 - ".buildIfDue()"
Cohesion: 0.31
Nodes (6): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval

### Community 176 - "AppLockTests.swift"
Cohesion: 0.29
Nodes (4): AppLock, PINRules, PINRulesTests, PINLockKit

### Community 177 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 178 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 180 - "FakeCompletion"
Cohesion: 0.29
Nodes (6): FakeCompletion, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent

### Community 181 - ".init()"
Cohesion: 0.36
Nodes (4): KeyedExtractor, Bool, ModelContext, String

### Community 182 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 183 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 184 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 185 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 186 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 187 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 188 - ".ask()"
Cohesion: 0.38
Nodes (6): Answer, failed, spoken, ModelContext, String, VoiceAsk

### Community 189 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 190 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 191 - "State"
Cohesion: 0.33
Nodes (5): State, failed, generating, tooShort, unavailable

### Community 192 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 193 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 194 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 195 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 196 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 197 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 198 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 199 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 200 - "Refused"
Cohesion: 0.67
Nodes (3): Refused, device, provider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **500 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+495 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 922 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ThemeNode`, `SharedInbox`, `ArticleReadoutController`, `ArticleSummary`, `VoiceCommandController`, `GraphSnapshot`, `ReferenceLedger`, `.makeContainer()`, `ArticleReaderView`, `String`, `.refresh()`, `PipelineRunner`, `ProjectArticlesTests`, `Digest`, `RetrievedPassage`, `.run()`, `DailyBudget`, `GraphIndexer`, `RawItem`, `ArticleSummarizer`, `GitHubRepo`, `BriefingTests`, `.load()`, `.init()`, `Source`, `InterestModel`, `LexicalIndex`, `ReadoutSegment`, `DigestSummaryRequest`, `.retrieve()`, `ArticleStage`, `Scenario`, `ArticleSummaryCard`, `SearchHit`, `AppNavigation`, `.makeFixture()`, `XCTestCase`, `.save()`, `BackgroundWork`, `.segments()`, `makeContext()`, `SearchDocument`?**
  _High betweenness centrality (0.077) - this node is a cross-community bridge._
- **Why does `Foundation` connect `Foundation` to `ThemeNode`, `VoiceCommand`, `Observation`, `SharedInbox`, `ArticleSummary`, `Refusal`, `KnowledgeStore`, `String`, `.canonicalize()`, `GitHubError`, `GitHubDeviceFlow`, `PipelineRunner`, `.text()`, `.user()`, `Digest`, `AppLock.swift`, `DailyBudget`, `BYOKLLMKit`, `StepProgress`, `TopK`, `ExtractedArticle`, `ConversationView.swift`, `.items()`, `SourceFetcher`, `.outcome()`, `VoiceEngine`, `PerfTrace`, `.score()`, `Dependency`, `IngestError`, `ReadoutSegment`, `.body`, `RedirectPolicy`, `.parse()`, `Anchor`, `.stored()`?**
  _High betweenness centrality (0.063) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `ThemeNode`, `Observation`, `GraphSnapshot`, `String`, `StrategistRunner`, `Article`, `Foundation`, `GraphIndexer`, `Pipeline`, `BYOKLLMKit`, `ConversationView.swift`, `SourceFetcher`, `.score()`, `ReadoutSegment`, `.retrieve()`, `.body`, `Anchor`, `makeContext()`, `SearchDocument`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _500 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ThemeNode` be split into smaller, more focused modules?**
  _Cohesion score 0.07578947368421053 - nodes in this community are weakly interconnected._
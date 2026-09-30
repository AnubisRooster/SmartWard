# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 198 files · ~778,477 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3748 nodes · 9691 edges · 188 communities (184 shown, 4 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1108 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- GraphView
- ThemeNode
- ModelFallback
- String
- StrategyItemKind
- DailyBudget
- View
- IngestError
- HybridSearchIndex
- .outcome()
- VoiceCommand
- Source
- GitHubClient
- String
- Project
- StrategistRunner
- VoiceCommandController
- FetchURLTool
- KnowledgeStore
- .makeContainer()
- ProjectArticlesTests
- GitHubDeviceFlow
- .lines()
- Pipeline
- SpeechCommandRecognizer
- Sendable
- RetrievedPassage
- ExtractionTiers
- Article
- ExtractedArticle
- ReferenceLedger
- String
- ReadoutPlayback
- BYOKLLMKit
- ArticleSummary
- Chunk
- .process()
- SharedInbox
- .testGraphQueriesDoNotScaleWithTheWholeG
- PipelineRunner
- VoiceCommandTests
- ArticleSummaryCard
- .run()
- SwiftUI
- DigestSummaryRequest
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- ExtractedGraph
- InterestModel
- ActionRequest
- VoiceConfirmationGate
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- .items()
- Dependency
- .load()
- Choice
- CodingKeys
- GraphRAG
- SourceFetcher
- ReadoutSegment
- ExtractionTier
- ConversationView.swift
- PerfTrace
- LocalizedError
- SearchHit
- FakeBiometrics
- .score()
- Scenario
- AppLockCoordinator
- VoiceSpeaker
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- BriefingTests
- VoiceCommands.swift
- OnboardingProposal
- RedirectPolicy
- .fetchURL()
- String
- DigestBuilder
- .body
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- .fetch()
- VoiceParse
- .makeFixture()
- .check()
- Approval Before Actions
- RefreshEagerness
- Strategist Layer
- GitHubAccount
- DigestCluster
- ArticleReaderView
- .render()
- .save()
- .decode()
- .plan()
- VoiceTab
- RetrievalFixture
- OnboardingView
- Kind
- SmartWard (iOS Application Target)
- FakeEmbedder
- .segments()
- ShareModel
- .stored()
- Digest
- XCTestCase
- GraphIndexer
- FullTextFetching
- .messages()
- PlaybackLLM
- .refresh()
- BackupView
- RootView
- AskStrategistIntent
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .projects()
- .article()
- NewConversationView
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SourceKind
- Anchor
- StepProgress
- AppLockController
- AppLockTests.swift
- Identifiable
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .text()
- LibraryFixture
- .check()
- OnboardingReviewView
- DeveloperView
- BackgroundWork
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .importItems()
- LibraryArchive
- .fromPastedURL()
- EmbeddingModel
- SourceKindOption
- graphify_pipeline.py
- GraphExtraction.swift
- ArticleStage
- TopK
- .body
- ProjectEntity
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .clusters()
- .perform()
- ArchiveError
- Why
- Graph View
- UntrustedText (body/attribute inside its
- ActivitySheet
- .availability()
- .lines()
- StubTool
- DigestController
- .ask()
- Living Project Brief
- EncryptedBackup.swift
- PINOutcome
- SharedItem
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- Refused
- Apple Intelligence Preflight
- IntentFailure
- Step
- KnowledgeSchema
- ApprovalDecision
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 112 edges
2. `KnowledgeStore` - 111 edges
3. `SwiftData` - 93 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 70 edges
6. `Source` - 63 edges
7. `ThemeNode` - 51 edges
8. `Pipeline` - 51 edges
9. `XCTest` - 48 edges
10. `ArticleReadoutController` - 48 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
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

## Communities (188 total, 4 thin omitted)

### Community 0 - "GraphView"
Cohesion: 0.06
Nodes (52): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+44 more)

### Community 1 - "ThemeNode"
Cohesion: 0.07
Nodes (32): Color, EntityAlias, Mention, MergeSuggestion, ThemeEdge, ThemeNode, EntityResolver, Resolution (+24 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "String"
Cohesion: 0.07
Nodes (38): Set, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Conversation (+30 more)

### Community 4 - "StrategyItemKind"
Cohesion: 0.07
Nodes (32): StrategyItem, .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk (+24 more)

### Community 5 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 6 - "View"
Cohesion: 0.06
Nodes (44): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+36 more)

### Community 7 - "IngestError"
Cohesion: 0.08
Nodes (31): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+23 more)

### Community 8 - "HybridSearchIndex"
Cohesion: 0.11
Nodes (22): Accelerate, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, LexicalIndex, .count, SearchCorpus (+14 more)

### Community 9 - ".outcome()"
Cohesion: 0.11
Nodes (19): MPRemoteCommand, .readoutBar, ArticleReadoutController, .currentAnchor, .currentArticle, .currentText, .isActive, .isBriefing (+11 more)

### Community 10 - "VoiceCommand"
Cohesion: 0.04
Nodes (45): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+37 more)

### Community 11 - "Source"
Cohesion: 0.10
Nodes (23): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+15 more)

### Community 12 - "GitHubClient"
Cohesion: 0.10
Nodes (19): GitHubClient, .isAuthenticated, GitHubRepo, .id, HTTPTransport, Bool, Set, String (+11 more)

### Community 13 - "String"
Cohesion: 0.10
Nodes (13): LibraryVoiceQueries, Bool, Date, Double, Int, ModelContext, String, ThemeDescription (+5 more)

### Community 14 - "Project"
Cohesion: 0.12
Nodes (19): BriefRevision, Project, ProjectBrief, ProjectVoiceQueries, Int, ModelContext, BriefEditing, tooLong (+11 more)

### Community 15 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 16 - "VoiceCommandController"
Cohesion: 0.09
Nodes (19): AVAudioSession, Outcome, Phase, listening, off, starting, unavailable, Bool (+11 more)

### Community 17 - "FetchURLTool"
Cohesion: 0.09
Nodes (21): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+13 more)

### Community 18 - "KnowledgeStore"
Cohesion: 0.13
Nodes (7): Foundation, GraphKit, KnowledgeStore, NaturalLanguage, RetrievalKit, GitHubConfig, SwiftData

### Community 19 - ".makeContainer()"
Cohesion: 0.15
Nodes (13): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage (+5 more)

### Community 20 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 21 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 22 - ".lines()"
Cohesion: 0.08
Nodes (28): BriefDiff, Line, added, removed, same, BriefDiffTests, BriefController, BriefDiffView (+20 more)

### Community 23 - "Pipeline"
Cohesion: 0.09
Nodes (5): BackgroundTasks, IngestKit, Pipeline, ShareInbox, XCTest

### Community 24 - "SpeechCommandRecognizer"
Cohesion: 0.10
Nodes (21): AVAudioNodeTapBlock, AVAudioPCMBuffer, Error, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, Failure, .errorDescription (+13 more)

### Community 25 - "Sendable"
Cohesion: 0.26
Nodes (31): Codable, Equatable, GitHubUser, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord (+23 more)

### Community 26 - "RetrievedPassage"
Cohesion: 0.10
Nodes (23): RetrievedPassage, UUID, ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages (+15 more)

### Community 27 - "ExtractionTiers"
Cohesion: 0.10
Nodes (19): EntityExtracting, ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor (+11 more)

### Community 28 - "Article"
Cohesion: 0.09
Nodes (24): NavigationPath, Article, Int, AppNavigation, Bool, UUID, .sourceLabel, String (+16 more)

### Community 29 - "ExtractedArticle"
Cohesion: 0.13
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 30 - "ReferenceLedger"
Cohesion: 0.14
Nodes (18): Decodable, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition (+10 more)

### Community 31 - "String"
Cohesion: 0.21
Nodes (9): Decoder, Bool, Int, Set, VoiceCommandParser, VoiceContext, VoiceItemMatcher, VoiceText (+1 more)

### Community 32 - "ReadoutPlayback"
Cohesion: 0.17
Nodes (8): ReadoutPlayback, .current, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 33 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 34 - "ArticleSummary"
Cohesion: 0.11
Nodes (15): NSRegularExpression, ArticleSummary, .isEmpty, Question, about, evidence, matters, remember (+7 more)

### Community 35 - "Chunk"
Cohesion: 0.13
Nodes (10): ContextPolicy, Bool, Chunk, Data, ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests (+2 more)

### Community 36 - ".process()"
Cohesion: 0.11
Nodes (17): BGContinuedProcessingTask, Triage, .body, ModelContext, ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph (+9 more)

### Community 37 - "SharedInbox"
Cohesion: 0.14
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedProject, URL, SharedInboxTests (+3 more)

### Community 38 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.13
Nodes (12): GraphRetriever, Float, ModelContext, String, PerformanceTests, SeededRandom, String, TimeInterval (+4 more)

### Community 39 - "PipelineRunner"
Cohesion: 0.20
Nodes (12): PipelineRunner, Report, Bool, Date, Double, Int, ModelContext, Set (+4 more)

### Community 40 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 41 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 42 - ".run()"
Cohesion: 0.18
Nodes (14): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+6 more)

### Community 43 - "SwiftUI"
Cohesion: 0.11
Nodes (6): Observation, ActionApprovalSettingsSection, .body, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 44 - "DigestSummaryRequest"
Cohesion: 0.16
Nodes (13): BYOKDigestSummarizer, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider (+5 more)

### Community 45 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 46 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 47 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 48 - "InterestModel"
Cohesion: 0.17
Nodes (14): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+6 more)

### Community 49 - "ActionRequest"
Cohesion: 0.15
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 50 - "VoiceConfirmationGate"
Cohesion: 0.18
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 51 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 52 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 53 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 54 - ".items()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 55 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 56 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 57 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 58 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 59 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 60 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 61 - "ReadoutSegment"
Cohesion: 0.22
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 62 - "ExtractionTier"
Cohesion: 0.17
Nodes (9): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+1 more)

### Community 63 - "ConversationView.swift"
Cohesion: 0.13
Nodes (11): AVFoundation, AVSpeechSynthesisVoice, MediaPlayer, String, VoiceSettings, .current, VoiceSettingsSection, .body (+3 more)

### Community 64 - "PerfTrace"
Cohesion: 0.19
Nodes (13): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+5 more)

### Community 65 - "LocalizedError"
Cohesion: 0.10
Nodes (20): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, ArticleSummaryError, declined, empty (+12 more)

### Community 66 - "SearchHit"
Cohesion: 0.14
Nodes (15): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body (+7 more)

### Community 67 - "FakeBiometrics"
Cohesion: 0.18
Nodes (10): AppLockCoordinatorTests, FakeBiometrics, FakePIN, BiometricResult, BiometricUnavailable, BiometryType, PINAttemptResult, Result (+2 more)

### Community 68 - ".score()"
Cohesion: 0.14
Nodes (12): Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive, String (+4 more)

### Community 69 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 70 - "AppLockCoordinator"
Cohesion: 0.19
Nodes (11): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService, PINVerifying (+3 more)

### Community 71 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (12): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, ObjectIdentifier, SpeechFinishDelegate, Void, AppAudio, Bool (+4 more)

### Community 72 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 73 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 74 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 75 - "BriefingTests"
Cohesion: 0.20
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 76 - "VoiceCommands.swift"
Cohesion: 0.11
Nodes (17): EchoGuard, VoiceReadingFilter, all, starred, unread, VoiceReadingOrder, mostRelevant, newest (+9 more)

### Community 77 - "OnboardingProposal"
Cohesion: 0.19
Nodes (11): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+3 more)

### Community 78 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 79 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 80 - "String"
Cohesion: 0.20
Nodes (10): ArticleSummaryOutput, ArticleSummaryPrompt, .schema, BYOKArticleSummarizer, JSONValue, LLMCompleting, LLMProvider, LLMRequest (+2 more)

### Community 81 - "DigestBuilder"
Cohesion: 0.19
Nodes (10): DigestBuilder, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date, ModelContainer (+2 more)

### Community 82 - ".body"
Cohesion: 0.11
Nodes (12): ReadingSettingsSection, .body, DigestSettingsSection, .body, ProviderKeyRow, .body, .body, LLMProvider (+4 more)

### Community 83 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 84 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 85 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 86 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 87 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 88 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 89 - "VoiceParse"
Cohesion: 0.16
Nodes (9): VoiceParse, command, ignored, unrecognized, wakeOnly, StaticString, String, UInt (+1 more)

### Community 90 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 91 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 92 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 93 - "RefreshEagerness"
Cohesion: 0.13
Nodes (16): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+8 more)

### Community 94 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 95 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 96 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 97 - "ArticleReaderView"
Cohesion: 0.16
Nodes (12): ReadoutScope, summaryOnly, whole, ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL (+4 more)

### Community 98 - ".render()"
Cohesion: 0.19
Nodes (8): DigestPrompt, ExtractionPrompt, .schema, JSONValue, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 99 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 100 - ".decode()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 101 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 102 - "VoiceTab"
Cohesion: 0.13
Nodes (14): VoiceTab, chat, graph, projects, reading, .title, today, AppTab (+6 more)

### Community 103 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 104 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 105 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 106 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 107 - "FakeEmbedder"
Cohesion: 0.23
Nodes (7): EmbeddingProviding, FakeEmbedder, .dimension, Float, Int, String, HybridSearchTests

### Community 108 - ".segments()"
Cohesion: 0.30
Nodes (5): Locale, ArticleReadout, Builder, String, TimeZone

### Community 109 - "ShareModel"
Cohesion: 0.18
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 110 - ".stored()"
Cohesion: 0.23
Nodes (5): SourceHealth, Error, String, SourceHealthTests, .body

### Community 111 - "Digest"
Cohesion: 0.22
Nodes (11): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body (+3 more)

### Community 112 - "XCTestCase"
Cohesion: 0.18
Nodes (9): Data, Float, VectorCoding, PerfTraceTests, SampleLibraryTests, TriageDisplayTests, VectorCodingTests, LexicalIndexTests (+1 more)

### Community 113 - "GraphIndexer"
Cohesion: 0.25
Nodes (8): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String

### Community 114 - "FullTextFetching"
Cohesion: 0.15
Nodes (11): FullTextFetching, URL, RelevanceJudging, FixedJudge, Bool, FoundationModelsRelevanceJudge, Bool, String (+3 more)

### Community 115 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 116 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 117 - ".refresh()"
Cohesion: 0.23
Nodes (12): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+4 more)

### Community 118 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 119 - "RootView"
Cohesion: 0.13
Nodes (13): ComingSoonView, .body, RootView, .briefingReady, .shouldListenByVoice, .tabs, Bool, String (+5 more)

### Community 120 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (14): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary (+6 more)

### Community 121 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 122 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 123 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 124 - ".article()"
Cohesion: 0.32
Nodes (5): FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 125 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 126 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 127 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 128 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 129 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 130 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 131 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 132 - "AppLockTests.swift"
Cohesion: 0.21
Nodes (7): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit, PrivacyCover, .body

### Community 133 - "Identifiable"
Cohesion: 0.20
Nodes (12): CaseIterable, Identifiable, ReadingFilter, all, .id, starred, unread, ReadingOrder (+4 more)

### Community 134 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 135 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 136 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 137 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 138 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 139 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 140 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 141 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 142 - "BackgroundWork"
Cohesion: 0.25
Nodes (6): App, Scene, SmartWardApp, .body, BackgroundWork, TimeInterval

### Community 143 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 144 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 145 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 146 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 147 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 149 - "EmbeddingModel"
Cohesion: 0.27
Nodes (7): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, ModelContext, Set, UUID

### Community 150 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 151 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 152 - "GraphExtraction.swift"
Cohesion: 0.20
Nodes (6): FoundationModels, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, UserNotifications

### Community 153 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 154 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 155 - ".body"
Cohesion: 0.24
Nodes (7): LockOverlay, .body, LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 156 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 157 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 158 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 159 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 160 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 161 - ".perform()"
Cohesion: 0.32
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 162 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 163 - "Why"
Cohesion: 0.25
Nodes (8): Bool, Why, connected, .description, direct, fetched, .isGraphHop, named

### Community 164 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 165 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 166 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 167 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 169 - "StubTool"
Cohesion: 0.33
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 170 - "DigestController"
Cohesion: 0.33
Nodes (5): DigestController, .notificationsEnabled, Bool, String, TimeInterval

### Community 171 - ".ask()"
Cohesion: 0.38
Nodes (6): Answer, failed, spoken, ModelContext, String, VoiceAsk

### Community 172 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 173 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 174 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 175 - "SharedItem"
Cohesion: 0.60
Nodes (4): SharedItem, Date, String, UUID

### Community 176 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 177 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 178 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 179 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 180 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 181 - "IntentFailure"
Cohesion: 0.40
Nodes (5): IntentFailure, .errorDescription, libraryUnavailable, noProvider, String

### Community 182 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 183 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 184 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 185 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **460 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+455 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 851 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `GraphView`, `ThemeNode`, `String`, `View`, `HybridSearchIndex`, `.outcome()`, `Source`, `String`, `Project`, `VoiceCommandController`, `.importItems()`, `.makeContainer()`, `ProjectArticlesTests`, `ArticleStage`, `RetrievedPassage`, `ExtractionTiers`, `.clusters()`, `Chunk`, `.process()`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `PipelineRunner`, `ArticleSummaryCard`, `DigestSummaryRequest`, `.load()`, `ReadoutSegment`, `ExtractionTier`, `SearchHit`, `Scenario`, `BriefingTests`, `.fetch()`, `.makeFixture()`, `DigestCluster`, `ArticleReaderView`, `.save()`, `RetrievalFixture`, `FakeEmbedder`, `.segments()`, `.refresh()`, `.article()`?**
  _High betweenness centrality (0.049) - this node is a cross-community bridge._
- **Why does `Foundation` connect `KnowledgeStore` to `Anchor`, `StepProgress`, `String`, `AppLockTests.swift`, `DailyBudget`, `.canonicalize()`, `IngestError`, `HybridSearchIndex`, `.text()`, `GitHubClient`, `String`, `GitHubDeviceFlow`, `Pipeline`, `GraphExtraction.swift`, `TopK`, `ExtractionTiers`, `ExtractedArticle`, `BYOKLLMKit`, `ArticleSummary`, `Chunk`, `SharedInbox`, `SwiftUI`, `EncryptedBackup.swift`, `.outcome()`, `.items()`, `Dependency`, `SourceFetcher`, `ReadoutSegment`, `ConversationView.swift`, `PerfTrace`, `.score()`, `AppLockCoordinator`, `VoiceCommands.swift`, `RedirectPolicy`, `.body`, `.render()`, `.stored()`?**
  _High betweenness centrality (0.049) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `GraphView`, `Anchor`, `ThemeNode`, `HybridSearchIndex`, `String`, `StrategistRunner`, `Pipeline`, `GraphExtraction.swift`, `Article`, `BYOKLLMKit`, `Chunk`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `SwiftUI`, `EncryptedBackup.swift`, `SourceFetcher`, `ReadoutSegment`, `ConversationView.swift`, `.body`, `GraphIndexer`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _460 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `GraphView` be split into smaller, more focused modules?**
  _Cohesion score 0.06169772256728778 - nodes in this community are weakly interconnected._
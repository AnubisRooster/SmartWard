# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 203 files · ~797,860 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3834 nodes · 9905 edges · 194 communities (186 shown, 8 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1118 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- IngestError
- AnalyzerCommandRecognizer
- GraphView
- ModelFallback
- ThemeNode
- Project
- String
- SourceKindOption
- ReferenceLedger
- VoiceCommand
- StrategistRunner
- GitHubClient
- GitHubDeviceFlow
- ExtractedGraph
- EmbeddingModel
- VoiceCommandController
- SwiftData
- Sendable
- .makeContainer()
- KnowledgeStore
- Digest
- Conversation
- DailyBudget
- ConversationView
- SwiftUI
- RawItem
- StrategyItemKind
- ExtractionTiers
- .outcome()
- String
- SourceKind
- .record()
- Pipeline
- Message
- ArticleSummarizer
- BriefError
- View
- InterestModel
- .body
- .run()
- ReadoutPlayback
- RecordStrategyItemTool
- ArticleSummaryCard
- .process()
- HybridSearchIndex
- Article
- FetchURLTool
- PipelineRunner
- VoiceContext
- VoiceCommandTests
- SharedInbox
- .items()
- SourceFetcher
- Source
- SearchDocument
- Phase 5: Hardening
- OnboardingView
- Pipeline module (ingestion, graph, searc
- .outcome()
- .extract()
- .fetch()
- .build()
- .matches()
- ActionRequest
- .fetch()
- Invariant D5: Private content never goes
- Dependency
- BriefingTests
- RetrievedPassage
- ModelCatalogController
- CodingKeys
- PerfTrace
- GraphRAG
- LocalizedError
- ApprovalDecision
- ArticleSummary
- DigestSummaryRequest
- .load()
- VoiceConfirmationGate
- ReadoutSegment
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- ArticleReadoutController
- .seal()
- VoiceCommands.swift
- OnboardingProposal
- Scenario
- .fetchURL()
- SearchHit
- AppLockCoordinator
- Identifiable
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- VoiceParse
- .makeFixture()
- .check()
- Approval Before Actions
- GitHubRepoPicker
- Strategist Layer
- .segments()
- .parse()
- .save()
- .init()
- RetrievalFixture
- .refresh()
- Kind
- ConversationView.swift
- SmartWard (iOS Application Target)
- ShareModel
- GitHubAccount
- .messages()
- PlaybackLLM
- BackupView
- RootView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- Observation
- RedirectPolicy
- .projects()
- .decode()
- .article()
- XCTestCase
- Choice
- String
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- Anchor
- .render()
- .data()
- StepProgress
- AppLockController
- RefreshEagerness
- SecuritySettingsSection
- DeveloperView
- VoiceSpeaker
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- FakePIN
- .text()
- LibraryFixture
- .testGraphQueriesDoNotScaleWithTheWholeG
- .check()
- OnboardingReviewView
- ArticleReaderView
- AppLockTests.swift
- VoiceSettings
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .importItems()
- LibraryArchive
- .fromPastedURL()
- .score()
- .installRemoteControls()
- .canonicalize()
- graphify_pipeline.py
- ArticleStage
- TopK
- FakeBiometrics
- .buildIfDue()
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .graphML()
- SharedItem
- Graph View
- .body
- UntrustedText (body/attribute inside its
- ActivitySheet
- .availability()
- .start()
- .lines()
- VoiceTab
- .begin()
- Living Project Brief
- PINOutcome
- StrategyItemStatus
- .configure()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- .makeArticle()
- Refused
- Apple Intelligence Preflight
- Step
- KnowledgeSchema
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 112 edges
2. `KnowledgeStore` - 111 edges
3. `SwiftData` - 93 edges
4. `Project` - 80 edges
5. `VoiceCommand` - 71 edges
6. `Source` - 63 edges
7. `Pipeline` - 54 edges
8. `ThemeNode` - 51 edges
9. `XCTest` - 49 edges
10. `VoiceCommandController` - 49 edges

## Surprising Connections (you probably didn't know these)
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
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

## Communities (194 total, 8 thin omitted)

### Community 0 - "IngestError"
Cohesion: 0.05
Nodes (43): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+35 more)

### Community 1 - "AnalyzerCommandRecognizer"
Cohesion: 0.05
Nodes (41): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, Error, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask (+33 more)

### Community 2 - "GraphView"
Cohesion: 0.06
Nodes (54): CGFloat, Color, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point (+46 more)

### Community 3 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 4 - "ThemeNode"
Cohesion: 0.08
Nodes (25): EntityAlias, InterestProfile, Mention, MergeSuggestion, .kind, ProjectLinkKind, githubRepo, url (+17 more)

### Community 5 - "Project"
Cohesion: 0.10
Nodes (21): Set, BriefRevision, Project, ProjectBrief, ProjectLink, .sendsContentToBYOK, StrategyItem, ProjectVoiceQueries (+13 more)

### Community 6 - "String"
Cohesion: 0.09
Nodes (13): LibraryVoiceQueries, Bool, Date, Double, Int, ModelContext, String, ThemeDescription (+5 more)

### Community 7 - "SourceKindOption"
Cohesion: 0.07
Nodes (39): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery, IntentAuthenticationPolicy (+31 more)

### Community 8 - "ReferenceLedger"
Cohesion: 0.09
Nodes (25): ExtractedArticle, Date, URL, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool (+17 more)

### Community 9 - "VoiceCommand"
Cohesion: 0.04
Nodes (45): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+37 more)

### Community 10 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 11 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 12 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 13 - "ExtractedGraph"
Cohesion: 0.10
Nodes (20): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, ExtractionTier (+12 more)

### Community 14 - "EmbeddingModel"
Cohesion: 0.12
Nodes (18): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+10 more)

### Community 15 - "VoiceCommandController"
Cohesion: 0.11
Nodes (13): AVAudioSession, CommandRecognizing, Bool, Never, NSObjectProtocol, Task, TimeInterval, Void (+5 more)

### Community 16 - "SwiftData"
Cohesion: 0.10
Nodes (9): Accelerate, CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, RetrievalKit, Security (+1 more)

### Community 17 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 18 - ".makeContainer()"
Cohesion: 0.19
Nodes (10): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Int, LLMUsage, TimeInterval (+2 more)

### Community 19 - "KnowledgeStore"
Cohesion: 0.13
Nodes (5): AppIntents, BYOKLLMKit, KnowledgeStore, ModelCatalogKit, StrategistCore

### Community 20 - "Digest"
Cohesion: 0.13
Nodes (22): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+14 more)

### Community 21 - "Conversation"
Cohesion: 0.09
Nodes (27): .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Conversation, .mode (+19 more)

### Community 22 - "DailyBudget"
Cohesion: 0.13
Nodes (16): DailyBudget, DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext (+8 more)

### Community 23 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 24 - "SwiftUI"
Cohesion: 0.09
Nodes (5): BackgroundTasks, IngestKit, ShareInbox, SwiftUI, UniformTypeIdentifiers

### Community 25 - "RawItem"
Cohesion: 0.14
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 26 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 27 - "ExtractionTiers"
Cohesion: 0.11
Nodes (18): ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 28 - ".outcome()"
Cohesion: 0.10
Nodes (17): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+9 more)

### Community 29 - "String"
Cohesion: 0.20
Nodes (8): Decoder, Bool, Int, Set, VoiceCommandParser, VoiceItemMatcher, VoiceText, String

### Community 30 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 31 - ".record()"
Cohesion: 0.17
Nodes (15): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+7 more)

### Community 33 - "Message"
Cohesion: 0.12
Nodes (11): ContextPolicy, Bool, Chunk, Message, Data, ContextPolicyTests, makeContext(), NormalizedKeyTests (+3 more)

### Community 34 - "ArticleSummarizer"
Cohesion: 0.15
Nodes (13): ArticleSummarizer, ArticleSummarizing, ArticleSummaryOutput, BYOKArticleSummarizer, Bool, Date, LLMCompleting, LLMProvider (+5 more)

### Community 35 - "BriefError"
Cohesion: 0.10
Nodes (22): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+14 more)

### Community 36 - "View"
Cohesion: 0.11
Nodes (25): ActionApprovalSettingsSection, .body, GitHubSettingsSection, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen (+17 more)

### Community 37 - "InterestModel"
Cohesion: 0.15
Nodes (17): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+9 more)

### Community 38 - ".body"
Cohesion: 0.10
Nodes (22): BriefController, BriefEditorView, .body, .body, BriefOrigin, BriefSection, .body, ProjectRoute (+14 more)

### Community 39 - ".run()"
Cohesion: 0.16
Nodes (15): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+7 more)

### Community 40 - "ReadoutPlayback"
Cohesion: 0.18
Nodes (7): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 41 - "RecordStrategyItemTool"
Cohesion: 0.14
Nodes (16): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+8 more)

### Community 42 - "ArticleSummaryCard"
Cohesion: 0.11
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 43 - ".process()"
Cohesion: 0.11
Nodes (15): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, Bool (+7 more)

### Community 44 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, LexicalIndex, .count, MatchKind (+4 more)

### Community 45 - "Article"
Cohesion: 0.12
Nodes (21): Article, Int, ThemesRow, .nodes, .sourceLabel, String, ArticleRow, .body (+13 more)

### Community 46 - "FetchURLTool"
Cohesion: 0.14
Nodes (16): AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval, .definition (+8 more)

### Community 47 - "PipelineRunner"
Cohesion: 0.20
Nodes (12): PipelineRunner, Report, Bool, Date, Double, Int, ModelContext, Set (+4 more)

### Community 48 - "VoiceContext"
Cohesion: 0.15
Nodes (9): VoiceContext, String, VoiceRephrase, VoiceRephrasing, VoiceRephraseTests, FoundationModelsVoiceRephraser, .isAvailable, Bool (+1 more)

### Community 49 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 50 - "SharedInbox"
Cohesion: 0.13
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, URL, SharedInboxTests, URL (+3 more)

### Community 51 - ".items()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 52 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 53 - "Source"
Cohesion: 0.14
Nodes (17): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, .failingSourceTitles, .hasFollowedSources (+9 more)

### Community 54 - "SearchDocument"
Cohesion: 0.15
Nodes (12): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty (+4 more)

### Community 55 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 56 - "OnboardingView"
Cohesion: 0.10
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 57 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 58 - ".outcome()"
Cohesion: 0.12
Nodes (12): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+4 more)

### Community 59 - ".extract()"
Cohesion: 0.19
Nodes (8): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, SwiftSoup, Unicode

### Community 60 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 61 - ".build()"
Cohesion: 0.19
Nodes (14): Bool, Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval (+6 more)

### Community 62 - ".matches()"
Cohesion: 0.13
Nodes (20): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+12 more)

### Community 63 - "ActionRequest"
Cohesion: 0.15
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 64 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 65 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 66 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 67 - "BriefingTests"
Cohesion: 0.18
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 68 - "RetrievedPassage"
Cohesion: 0.16
Nodes (14): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+6 more)

### Community 69 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 70 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 71 - "PerfTrace"
Cohesion: 0.18
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 72 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 73 - "LocalizedError"
Cohesion: 0.10
Nodes (19): LocalizedError, ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int, RestoreError (+11 more)

### Community 74 - "ApprovalDecision"
Cohesion: 0.12
Nodes (14): ActionTools, ApprovalDecision, approve, ask, decline, Bool, Set, ApprovalPolicyTests (+6 more)

### Community 75 - "ArticleSummary"
Cohesion: 0.14
Nodes (11): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+3 more)

### Community 76 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (11): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String (+3 more)

### Community 77 - ".load()"
Cohesion: 0.18
Nodes (13): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+5 more)

### Community 78 - "VoiceConfirmationGate"
Cohesion: 0.21
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 79 - "ReadoutSegment"
Cohesion: 0.24
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 80 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 81 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 82 - "ArticleReadoutController"
Cohesion: 0.14
Nodes (13): MPRemoteCommand, ArticleReadoutController, .currentAnchor, .currentArticle, .currentText, .isActive, .isBriefing, .isPaused (+5 more)

### Community 83 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 84 - "VoiceCommands.swift"
Cohesion: 0.11
Nodes (17): EchoGuard, VoiceReadingFilter, all, starred, unread, VoiceReadingOrder, mostRelevant, newest (+9 more)

### Community 85 - "OnboardingProposal"
Cohesion: 0.19
Nodes (11): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+3 more)

### Community 86 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 87 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 88 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 89 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService, PINVerifying (+2 more)

### Community 90 - "Identifiable"
Cohesion: 0.14
Nodes (17): CaseIterable, Identifiable, ReadingFilter, all, .id, starred, unread, ReadingOrder (+9 more)

### Community 91 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 92 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 93 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 94 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 95 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

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

### Community 100 - "GitHubRepoPicker"
Cohesion: 0.14
Nodes (15): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+7 more)

### Community 101 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 102 - ".segments()"
Cohesion: 0.28
Nodes (6): Locale, ArticleReadout, Builder, .current, String, TimeZone

### Community 103 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 104 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 105 - ".init()"
Cohesion: 0.16
Nodes (11): RelevanceJudging, FixedJudge, Bool, Float, String, FoundationModelsRelevanceJudge, Bool, String (+3 more)

### Community 106 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 107 - ".refresh()"
Cohesion: 0.21
Nodes (13): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+5 more)

### Community 108 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 109 - "ConversationView.swift"
Cohesion: 0.18
Nodes (5): AVFoundation, MediaPlayer, Speech, UIKit, VoiceLoopKit

### Community 110 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 111 - "ShareModel"
Cohesion: 0.18
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 112 - "GitHubAccount"
Cohesion: 0.23
Nodes (9): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+1 more)

### Community 113 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 114 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 115 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 116 - "RootView"
Cohesion: 0.13
Nodes (13): ComingSoonView, .body, RootView, .briefingReady, .shouldListenByVoice, .tabs, Bool, String (+5 more)

### Community 117 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 118 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 119 - "Observation"
Cohesion: 0.16
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 120 - "RedirectPolicy"
Cohesion: 0.18
Nodes (10): PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest, URLSession (+2 more)

### Community 121 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 122 - ".decode()"
Cohesion: 0.18
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 123 - ".article()"
Cohesion: 0.32
Nodes (4): ArticleIndexer, PipelineRunnerTests, ModelContainer, ModelContext

### Community 124 - "XCTestCase"
Cohesion: 0.14
Nodes (8): CanonicalURLTests, PublicHostTests, AddSourceToolTests, SampleLibraryTests, GraphExportTests, TopKTests, TriageDisplayTests, XCTestCase

### Community 125 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 126 - "String"
Cohesion: 0.21
Nodes (8): Outcome, Phase, listening, off, starting, unavailable, ModelContext, String

### Community 127 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 128 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 129 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 130 - ".render()"
Cohesion: 0.26
Nodes (5): DigestPrompt, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 131 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 132 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 133 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 134 - "RefreshEagerness"
Cohesion: 0.17
Nodes (13): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+5 more)

### Community 135 - "SecuritySettingsSection"
Cohesion: 0.19
Nodes (12): SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView, .body, Binding, Double (+4 more)

### Community 136 - "DeveloperView"
Cohesion: 0.26
Nodes (8): DeveloperSettings, .isEnabled, DeveloperView, .body, .sampleLoaded, Bool, Double, String

### Community 137 - "VoiceSpeaker"
Cohesion: 0.17
Nodes (9): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, ObjectIdentifier, SpeechFinishDelegate, Void, Bool, VoiceSpeaker (+1 more)

### Community 138 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 139 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 140 - "FakePIN"
Cohesion: 0.27
Nodes (5): BiometricResult, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 141 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 142 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 143 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 144 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 145 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 146 - "ArticleReaderView"
Cohesion: 0.21
Nodes (9): ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL, .paragraphs, Bool, String (+1 more)

### Community 147 - "AppLockTests.swift"
Cohesion: 0.24
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 148 - "VoiceSettings"
Cohesion: 0.22
Nodes (8): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, String, VoiceLoopConfig

### Community 149 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 150 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 151 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 152 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 153 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 154 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 156 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 158 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

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

### Community 163 - ".buildIfDue()"
Cohesion: 0.27
Nodes (7): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, .body

### Community 164 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 165 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 166 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 167 - ".graphML()"
Cohesion: 0.39
Nodes (5): GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 168 - "SharedItem"
Cohesion: 0.50
Nodes (5): SharedItem, SharedProject, Date, String, UUID

### Community 169 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 170 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 171 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 172 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 173 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 174 - ".start()"
Cohesion: 0.38
Nodes (4): ReadoutScope, summaryOnly, whole, String

### Community 176 - "VoiceTab"
Cohesion: 0.29
Nodes (7): VoiceTab, chat, graph, projects, reading, .title, today

### Community 177 - ".begin()"
Cohesion: 0.48
Nodes (4): Briefing, Kind, digest, Bool

### Community 178 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 179 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 180 - "StrategyItemStatus"
Cohesion: 0.33
Nodes (6): .status, StrategyItemStatus, done, invalidated, open, superseded

### Community 182 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 183 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 184 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 185 - ".makeArticle()"
Cohesion: 0.40
Nodes (3): Bool, ModelContext, String

### Community 186 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 187 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 188 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 189 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 190 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **465 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+460 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 869 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **8 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `IngestError`, `ThemeNode`, `Project`, `String`, `EmbeddingModel`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `.makeContainer()`, `ArticleReaderView`, `Digest`, `Conversation`, `DailyBudget`, `ConversationView`, `FakeEmbedder`, `.importItems()`, `RawItem`, `ExtractionTiers`, `ArticleStage`, `Message`, `ArticleSummarizer`, `ArticleSummaryCard`, `.start()`, `PipelineRunner`, `.begin()`, `Source`, `SearchDocument`, `.makeArticle()`, `.outcome()`, `.fetch()`, `.build()`, `.matches()`, `BriefingTests`, `RetrievedPassage`, `DigestSummaryRequest`, `.load()`, `ReadoutSegment`, `ArticleReadoutController`, `Scenario`, `SearchHit`, `.makeFixture()`, `.segments()`, `.save()`, `RetrievalFixture`, `.refresh()`, `.article()`?**
  _High betweenness centrality (0.063) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `IngestError`, `Anchor`, `.render()`, `StepProgress`, `Project`, `String`, `GitHubClient`, `GitHubDeviceFlow`, `ExtractedGraph`, `.text()`, `VoiceCommandController`, `KnowledgeStore`, `Digest`, `Conversation`, `DailyBudget`, `AppLockTests.swift`, `SwiftUI`, `StrategyItemKind`, `.score()`, `.outcome()`, `.canonicalize()`, `Message`, `TopK`, `SharedItem`, `VoiceContext`, `.items()`, `SourceFetcher`, `.extract()`, `Dependency`, `PerfTrace`, `ArticleSummary`, `ReadoutSegment`, `VoiceCommands.swift`, `AppLockCoordinator`, `.parse()`, `ConversationView.swift`, `Observation`, `RedirectPolicy`?**
  _High betweenness centrality (0.049) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Anchor`, `GraphView`, `ThemeNode`, `String`, `StrategistRunner`, `ExtractedGraph`, `EmbeddingModel`, `SwiftData`, `Digest`, `SwiftUI`, `StrategyItemKind`, `Pipeline`, `Message`, `Article`, `SourceFetcher`, `SearchDocument`, `.build()`, `RetrievedPassage`, `ReadoutSegment`, `ConversationView.swift`, `Observation`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _465 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `IngestError` be split into smaller, more focused modules?**
  _Cohesion score 0.050837496326770495 - nodes in this community are weakly interconnected._
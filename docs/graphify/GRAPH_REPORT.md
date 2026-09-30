# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 191 files · ~739,765 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3602 nodes · 9280 edges · 196 communities (191 shown, 5 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1064 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ThemeNode
- Project
- View
- ArticleReadoutController
- Source
- PipelineRunner
- SourceKindOption
- GitHubClient
- KnowledgeStore
- ProjectArticlesTests
- GitHubDeviceFlow
- SwiftData
- .makeContainer()
- VoiceCommandController
- SwiftUI
- ProjectLink
- InterestModel
- Sendable
- StrategyItemKind
- SharedInbox
- DailyBudget
- ReferenceLedger
- GraphIndexer
- ConversationView
- ArticleSummary
- Digest
- FetchURLTool
- VoiceCommand
- SpeechCommandRecognizer
- SourceKind
- .record()
- BYOKLLMKit
- BriefingTests
- RecordStrategyItemTool
- .run()
- ExtractedArticle
- OnboardingProposal
- ArticleSummaryCard
- SourceFetcher
- String
- VoiceCommandTests
- Phase 5: Hardening
- .refresh()
- CaseIterable
- Pipeline module (ingestion, graph, searc
- HybridSearchIndex
- .items()
- .fetch()
- Article
- ConversationMode
- EmbeddingModel
- GraphSnapshot
- .build()
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- PerfTrace
- Dependency
- .testEachToolDeclaresWhetherItAsksAndMat
- ExtractedGraph
- RetrievedPassage
- .load()
- ActionRequest
- StrategistRunner
- Choice
- ModelCatalogController
- CodingKeys
- GraphRAG
- ReadoutPlayback
- DigestSummaryRequest
- FakeExtractor
- String
- .process()
- VoiceParse
- Scenario
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- FlakyLLM
- .outcome()
- .seal()
- VoiceSpeaker
- RedirectPolicy
- .fetchURL()
- SearchHit
- .makeFixture()
- XCTestCase
- AppLock.swift
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- ReadoutSegment
- AppLockCoordinator
- GitHubError
- .segments()
- .check()
- Approval Before Actions
- OnboardingView
- Strategist Layer
- GitHubAccount
- ArticleSummarizer
- .save()
- .body
- Kind
- GraphCanvas
- SmartWard (iOS Application Target)
- ShareModel
- LibraryArchive
- SearchDocument
- .messages()
- PlaybackLLM
- RetrievalFixture
- BackupView
- FallbackLLM
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- ArticleReaderView
- .decode()
- SmartWard XcodeGen Project Spec
- GraphExtraction.swift
- IngestError
- StepProgress
- EchoTool
- AppLockController
- RefreshEagerness
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GraphView
- Anchor
- .render()
- .text()
- FakeClock
- LibraryFixture
- .body
- OnboardingReviewView
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- RobotsRules
- .importItems()
- .fromPastedURL()
- .score()
- ExtractionTier
- String
- ModelFallback
- BackgroundWork
- ThemeDetailView
- .buildIfDue()
- graphify_pipeline.py
- AppLockPolicy
- ArticleStage
- TopK
- BriefError
- FakeBiometrics
- CannedLLM
- FoundationModelsEntityExtractor
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .graphML()
- AppLockTests.swift
- Failure
- .send()
- ArchiveError
- .data()
- Line
- .stream()
- Graph View
- RootView
- UntrustedText (body/attribute inside its
- ActivitySheet
- .availability()
- PolitenessGate
- VoiceTab
- ModelFallbackTests
- Living Project Brief
- PINOutcome
- .lines()
- VoiceCommandBar
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- Apple Intelligence Preflight
- SmartWardApp
- KnowledgeSchema
- AppStore
- graphify_refresh.sh
- .init()
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `Article` - 109 edges
2. `KnowledgeStore` - 106 edges
3. `SwiftData` - 88 edges
4. `Project` - 74 edges
5. `Source` - 62 edges
6. `ThemeNode` - 49 edges
7. `VoiceCommand` - 47 edges
8. `ArticleReadoutController` - 47 edges
9. `Pipeline` - 46 edges
10. `XCTest` - 44 edges

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

## Communities (196 total, 5 thin omitted)

### Community 0 - "ThemeNode"
Cohesion: 0.10
Nodes (25): Chunk, Conversation, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal (+17 more)

### Community 1 - "Project"
Cohesion: 0.08
Nodes (36): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+28 more)

### Community 2 - "View"
Cohesion: 0.06
Nodes (45): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+37 more)

### Community 3 - "ArticleReadoutController"
Cohesion: 0.10
Nodes (20): MPRemoteCommand, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor, .currentArticle, .currentText, .isActive (+12 more)

### Community 4 - "Source"
Cohesion: 0.10
Nodes (23): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+15 more)

### Community 5 - "PipelineRunner"
Cohesion: 0.12
Nodes (20): ArticleIndexer, FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int (+12 more)

### Community 6 - "SourceKindOption"
Cohesion: 0.07
Nodes (37): AppEntity, AppEnum, AppIntent, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery, IntentAuthenticationPolicy (+29 more)

### Community 7 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 8 - "KnowledgeStore"
Cohesion: 0.11
Nodes (5): IngestKit, KnowledgeStore, Pipeline, GitHubConfig, XCTest

### Community 9 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 10 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 11 - "SwiftData"
Cohesion: 0.10
Nodes (9): Accelerate, CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, RetrievalKit, Security (+1 more)

### Community 12 - ".makeContainer()"
Cohesion: 0.17
Nodes (12): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, ModelContext (+4 more)

### Community 13 - "VoiceCommandController"
Cohesion: 0.09
Nodes (18): AVAudioSession, Outcome, Phase, listening, off, starting, unavailable, Bool (+10 more)

### Community 14 - "SwiftUI"
Cohesion: 0.09
Nodes (10): AVFoundation, BackgroundTasks, MediaPlayer, Observation, ShareInbox, Speech, SwiftUI, UIKit (+2 more)

### Community 15 - "ProjectLink"
Cohesion: 0.08
Nodes (16): ContextPolicy, Bool, Set, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo (+8 more)

### Community 16 - "InterestModel"
Cohesion: 0.12
Nodes (20): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+12 more)

### Community 17 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 18 - "StrategyItemKind"
Cohesion: 0.12
Nodes (16): StrategyItem, .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk (+8 more)

### Community 19 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 20 - "DailyBudget"
Cohesion: 0.12
Nodes (17): DailyBudget, DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext (+9 more)

### Community 21 - "ReferenceLedger"
Cohesion: 0.13
Nodes (18): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, ReferenceLedger (+10 more)

### Community 22 - "GraphIndexer"
Cohesion: 0.11
Nodes (16): EntityExtracting, ExtractionPrompt, .schema, ExtractionTiers, JSONValue, GraphIndexer, .suggestionsAdded, GraphLinker (+8 more)

### Community 23 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 24 - "ArticleSummary"
Cohesion: 0.11
Nodes (16): NSRegularExpression, ArticleSummary, .isEmpty, Question, about, evidence, matters, remember (+8 more)

### Community 25 - "Digest"
Cohesion: 0.14
Nodes (21): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+13 more)

### Community 26 - "FetchURLTool"
Cohesion: 0.11
Nodes (18): AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval, .definition (+10 more)

### Community 27 - "VoiceCommand"
Cohesion: 0.07
Nodes (30): VoiceCommand, back, .confirmation, dismiss, help, loadFullArticle, markUnread, nextArticle (+22 more)

### Community 28 - "SpeechCommandRecognizer"
Cohesion: 0.14
Nodes (13): AVAudioNodeTapBlock, AVAudioPCMBuffer, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, RequestBox, SpeechCommandRecognizer, Bool (+5 more)

### Community 29 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 30 - ".record()"
Cohesion: 0.17
Nodes (15): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+7 more)

### Community 31 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 32 - "BriefingTests"
Cohesion: 0.15
Nodes (9): .groupPosition, BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext (+1 more)

### Community 33 - "RecordStrategyItemTool"
Cohesion: 0.13
Nodes (16): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+8 more)

### Community 34 - ".run()"
Cohesion: 0.16
Nodes (15): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+7 more)

### Community 35 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 36 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 37 - "ArticleSummaryCard"
Cohesion: 0.11
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 38 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 39 - "String"
Cohesion: 0.25
Nodes (6): EchoGuard, Bool, VoiceCommandParser, VoiceContext, VoiceText, String

### Community 40 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 41 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 42 - ".refresh()"
Cohesion: 0.13
Nodes (18): BGContinuedProcessingTask, LocalizedError, StrategistError, .errorDescription, incompleteResponse, FullTextError, .errorDescription, nothingMore (+10 more)

### Community 43 - "CaseIterable"
Cohesion: 0.09
Nodes (23): CaseIterable, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, .status (+15 more)

### Community 44 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 45 - "HybridSearchIndex"
Cohesion: 0.17
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+4 more)

### Community 46 - ".items()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 47 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 48 - "Article"
Cohesion: 0.12
Nodes (20): Article, Int, .sourceLabel, String, ArticleRow, .body, .content, .relevancePercent (+12 more)

### Community 49 - "ConversationMode"
Cohesion: 0.10
Nodes (20): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+12 more)

### Community 50 - "EmbeddingModel"
Cohesion: 0.19
Nodes (11): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+3 more)

### Community 51 - "GraphSnapshot"
Cohesion: 0.19
Nodes (16): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+8 more)

### Community 52 - ".build()"
Cohesion: 0.19
Nodes (14): Bool, Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval (+6 more)

### Community 53 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 54 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 55 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 56 - "PerfTrace"
Cohesion: 0.16
Nodes (14): DispatchTime, os, PerfTrace, .samples, Sample, Summary, Date, Double (+6 more)

### Community 57 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 58 - ".testEachToolDeclaresWhetherItAsksAndMat"
Cohesion: 0.11
Nodes (14): ActionTools, ApprovalDecision, approve, ask, decline, Set, .names, ApprovalPolicyTests (+6 more)

### Community 59 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 60 - "RetrievedPassage"
Cohesion: 0.16
Nodes (14): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+6 more)

### Community 61 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 62 - "ActionRequest"
Cohesion: 0.16
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 63 - "StrategistRunner"
Cohesion: 0.26
Nodes (10): StrategistRunner, Int, LLMCompleting, GuardedTool, .asksForApproval, .definition, reply(), ScriptedLLM (+2 more)

### Community 64 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 65 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 66 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 67 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 68 - "ReadoutPlayback"
Cohesion: 0.21
Nodes (7): ReadoutPlayback, .current, .currentGroup, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 69 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (11): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String (+3 more)

### Community 70 - "FakeExtractor"
Cohesion: 0.14
Nodes (14): BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, AsyncThrowingStream, Error (+6 more)

### Community 71 - "String"
Cohesion: 0.18
Nodes (10): ArticleSummaryOutput, ArticleSummaryPrompt, .schema, BYOKArticleSummarizer, JSONValue, LLMCompleting, LLMProvider, LLMRequest (+2 more)

### Community 72 - ".process()"
Cohesion: 0.13
Nodes (16): RelevanceJudging, FixedJudge, Bool, .body, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool (+8 more)

### Community 73 - "VoiceParse"
Cohesion: 0.10
Nodes (18): Set, VoiceItemMatcher, VoiceParse, command, ignored, unrecognized, wakeOnly, VoiceReadingFilter (+10 more)

### Community 74 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 75 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 76 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 77 - "FlakyLLM"
Cohesion: 0.16
Nodes (13): LLMCompletionError, Behavior, fail, failMidStream, ok, FallbackLLMTests, FlakyLLM, AsyncThrowingStream (+5 more)

### Community 78 - ".outcome()"
Cohesion: 0.16
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 79 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 80 - "VoiceSpeaker"
Cohesion: 0.12
Nodes (11): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, SpeechFinishDelegate, Void, AppAudio, Bool, Bool (+3 more)

### Community 81 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 82 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 83 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 84 - ".makeFixture()"
Cohesion: 0.23
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 85 - "XCTestCase"
Cohesion: 0.14
Nodes (12): PerfTraceTests, SampleLibraryTests, PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void (+4 more)

### Community 86 - "AppLock.swift"
Cohesion: 0.19
Nodes (9): AnyObject, BiometricService, BiometricUnlocking, PINRules, PINService, PINVerifying, BiometricResult, PINAttemptResult (+1 more)

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

### Community 91 - "ReadoutSegment"
Cohesion: 0.29
Nodes (6): Locale, ArticleReadout, Builder, ReadoutSegment, String, TimeZone

### Community 92 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 93 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 94 - ".segments()"
Cohesion: 0.26
Nodes (5): ArticleBriefing, DigestReadout, SegmentBuilder, Int, String

### Community 95 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 96 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 97 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 98 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 99 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 100 - "ArticleSummarizer"
Cohesion: 0.23
Nodes (6): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID

### Community 101 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 102 - ".body"
Cohesion: 0.13
Nodes (11): ActionApprovalSettingsSection, .body, ProviderKeyRow, .body, SettingsView, .body, LLMProvider, String (+3 more)

### Community 103 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 104 - "GraphCanvas"
Cohesion: 0.19
Nodes (12): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 105 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 106 - "ShareModel"
Cohesion: 0.18
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 107 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 108 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 109 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 110 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 111 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 112 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 113 - "FallbackLLM"
Cohesion: 0.25
Nodes (9): Alternatives, LLMCompleting, FallbackLLM, AsyncThrowingStream, Error, Int, LLMRequest, LLMResponse (+1 more)

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

### Community 118 - "ArticleReaderView"
Cohesion: 0.15
Nodes (11): ReadoutScope, summaryOnly, whole, ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs (+3 more)

### Community 119 - ".decode()"
Cohesion: 0.18
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 120 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 121 - "GraphExtraction.swift"
Cohesion: 0.15
Nodes (8): FoundationModels, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body, UserNotifications

### Community 122 - "IngestError"
Cohesion: 0.15
Nodes (12): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+4 more)

### Community 123 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 124 - "EchoTool"
Cohesion: 0.21
Nodes (10): EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval, .definition, Bool, JSONValue (+2 more)

### Community 125 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 126 - "RefreshEagerness"
Cohesion: 0.17
Nodes (13): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+5 more)

### Community 127 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 128 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 129 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 130 - "GraphView"
Cohesion: 0.26
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 131 - "Anchor"
Cohesion: 0.17
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 132 - ".render()"
Cohesion: 0.29
Nodes (4): DigestPrompt, ReferenceContext, String, UntrustedText

### Community 133 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 134 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 135 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 136 - ".body"
Cohesion: 0.20
Nodes (9): PrivacyCover, .body, LockOverlay, .body, LockWindow, Bool, .body, UIWindow (+1 more)

### Community 137 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 138 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 139 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 140 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 141 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 142 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 143 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 144 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 146 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 147 - "ExtractionTier"
Cohesion: 0.18
Nodes (8): ExtractionTier, byok, onDevice, Refused, device, provider, Error, LLMUsage

### Community 148 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 149 - "ModelFallback"
Cohesion: 0.40
Nodes (5): ModelFallback, Bool, CatalogEntry, LLMProvider, String

### Community 150 - "BackgroundWork"
Cohesion: 0.25
Nodes (5): BackgroundWork, Bool, Date, String, TimeInterval

### Community 151 - "ThemeDetailView"
Cohesion: 0.27
Nodes (9): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions (+1 more)

### Community 152 - ".buildIfDue()"
Cohesion: 0.24
Nodes (8): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, DigestSettingsSection, .body

### Community 153 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 154 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 155 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 156 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 157 - "BriefError"
Cohesion: 0.20
Nodes (8): BriefError, empty, .errorDescription, notPending, outdated, unchanged, Int, BriefDiffTests

### Community 158 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 159 - "CannedLLM"
Cohesion: 0.27
Nodes (7): CannedLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent, String

### Community 160 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 161 - "VoiceSettings"
Cohesion: 0.28
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 162 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 163 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 164 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 165 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 166 - "AppLockTests.swift"
Cohesion: 0.36
Nodes (4): AppLock, BiometricLockKit, PINRulesTests, PINLockKit

### Community 167 - "Failure"
Cohesion: 0.25
Nodes (8): Error, Failure, .errorDescription, micNotReady, notResponding, onDeviceUnsupported, permissionDenied, unavailable

### Community 168 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 169 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 170 - ".data()"
Cohesion: 0.43
Nodes (4): Data, Float, VectorCoding, VectorCodingTests

### Community 171 - "Line"
Cohesion: 0.36
Nodes (7): BriefDiff, Line, added, removed, same, BriefDiffView, .body

### Community 172 - ".stream()"
Cohesion: 0.25
Nodes (5): AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent

### Community 173 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 174 - "RootView"
Cohesion: 0.25
Nodes (7): ComingSoonView, .body, RootView, .briefingReady, .shouldListenByVoice, Bool, String

### Community 175 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 176 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 177 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 178 - "PolitenessGate"
Cohesion: 0.33
Nodes (6): PolitenessGate, async, Date, Int, TimeInterval, Void

### Community 179 - "VoiceTab"
Cohesion: 0.29
Nodes (7): VoiceTab, chat, graph, projects, reading, .title, today

### Community 180 - "ModelFallbackTests"
Cohesion: 0.38
Nodes (6): ModelFallbackTests, .catalog, Bool, CatalogEntry, Double, Int

### Community 181 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 182 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 184 - "VoiceCommandBar"
Cohesion: 0.33
Nodes (5): .tabs, String, VoiceCommandBar, .body, .icon

### Community 185 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 186 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 187 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 188 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 189 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 190 - "SmartWardApp"
Cohesion: 0.50
Nodes (4): App, Scene, SmartWardApp, .body

### Community 191 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 192 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **436 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+431 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 812 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ThemeNode`, `View`, `ArticleReadoutController`, `Source`, `PipelineRunner`, `ProjectArticlesTests`, `.makeContainer()`, `VoiceCommandController`, `FakeEmbedder`, `ProjectLink`, `.importItems()`, `InterestModel`, `DailyBudget`, `GraphIndexer`, `ConversationView`, `Digest`, `ArticleStage`, `BriefingTests`, `ArticleSummaryCard`, `.refresh()`, `.fetch()`, `.build()`, `RetrievedPassage`, `.load()`, `DigestSummaryRequest`, `FakeExtractor`, `Scenario`, `.outcome()`, `SearchHit`, `.makeFixture()`, `ReadoutSegment`, `.segments()`, `ArticleSummarizer`, `.save()`, `SearchDocument`, `RetrievalFixture`, `ArticleReaderView`?**
  _High betweenness centrality (0.054) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `ThemeNode`, `.render()`, `.text()`, `GitHubClient`, `KnowledgeStore`, `GitHubDeviceFlow`, `SwiftUI`, `RobotsRules`, `ProjectLink`, `.score()`, `SharedInbox`, `DailyBudget`, `StrategyItemKind`, `GraphIndexer`, `ArticleSummary`, `TopK`, `BYOKLLMKit`, `ExtractedArticle`, `SourceFetcher`, `AppLockTests.swift`, `.items()`, `.outcome()`, `PerfTrace`, `Dependency`, `VoiceParse`, `RedirectPolicy`, `AppLock.swift`, `ReadoutSegment`, `.body`, `.stored()`, `GraphExtraction.swift`, `StepProgress`, `.canonicalize()`?**
  _High betweenness centrality (0.053) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `ThemeNode`, `SourceFetcher`, `.body`, `SwiftData`, `SearchDocument`, `SwiftUI`, `ProjectLink`, `Article`, `EmbeddingModel`, `GraphSnapshot`, `StrategyItemKind`, `.build()`, `GraphIndexer`, `GraphExtraction.swift`, `ReadoutSegment`, `RetrievedPassage`, `StrategistRunner`, `BYOKLLMKit`?**
  _High betweenness centrality (0.050) - this node is a cross-community bridge._
- **Are the 33 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 33 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _436 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ThemeNode` be split into smaller, more focused modules?**
  _Cohesion score 0.09624537281861449 - nodes in this community are weakly interconnected._
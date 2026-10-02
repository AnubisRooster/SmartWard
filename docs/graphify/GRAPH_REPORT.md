# Graph Report - SmartWard  (2026-10-02)

## Corpus Check
- Large corpus: 208 files · ~846,168 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 4041 nodes · 10498 edges · 202 communities (199 shown, 3 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1189 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- AnalyzerCommandRecognizer
- DigestBuilder
- GraphIndexer
- DailyBudget
- ModelFallback
- VoiceCommand
- String
- PipelineRunner
- ExtractionTiers
- String
- LocalizedError
- FetchURLTool
- ArticleReadoutController
- SwiftData
- .makeContainer()
- VoiceCommandController
- StrategistRunner
- InterestModel
- ProjectArticlesTests
- VoiceIntent
- GitHubDeviceFlow
- Pipeline
- ArticleSummary
- GitHubClient
- IngestError
- Project
- GraphSnapshot
- ThemeNode
- Sendable
- BriefRevision
- BYOKLLMKit
- ConversationView
- .run()
- SharedInbox
- RawItem
- Article
- ReadoutPlayback
- RetrievedPassage
- KnowledgeStore
- .extract()
- ArticleSummarizer
- Chunk
- EmbeddingModel
- Digest
- ExtractedGraph
- OpenArticleTool
- GitHubRepo
- VoiceAnswersTests
- VoiceCommandTests
- PerfTrace
- AppLockCoordinator
- ProjectLink
- Phase 5: Hardening
- .body
- Pipeline module (ingestion, graph, searc
- Conversation
- .load()
- ThemeStrengthCache
- ActionRequest
- .outcome()
- PipelineController
- Invariant D5: Private content never goes
- String
- .score()
- .items()
- Dependency
- ProjectSnapshot
- Choice
- CodingKeys
- GraphRAG
- HybridSearchIndex
- .check()
- VoiceConfirmationGate
- OnboardingProposal
- ApprovalDecision
- ReadoutSegment
- XCTestCase
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .fetchURL()
- .seal()
- EntityResolver
- Scenario
- .body
- VoiceEngine
- RedirectPolicy
- SourceFetcher
- SearchDocument
- String
- View
- BackgroundWork
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppNavigation
- GitHubError
- SearchHit
- .plan()
- .makeFixture()
- BriefingTests
- .check()
- Approval Before Actions
- Strategist Layer
- .segments()
- ShareModel
- GitHubAccount
- Source
- .save()
- .lines()
- OnboardingView
- Kind
- SpeechFinishDelegate
- SmartWard (iOS Application Target)
- SourceKind
- .decode()
- VoiceIntentTests
- AppLockController
- BackupView
- AppLock.swift
- AskStrategistIntent
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- StrategyItemKind
- ArticleReaderView
- RefreshEagerness
- ArticleSummaryController
- RootView
- SmartWard XcodeGen Project Spec
- Observation
- AppLockPolicy
- Refusal
- .text()
- StepProgress
- SeededRandom
- GitHubRepoPicker
- .start()
- ConversationView.swift
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- CodingKeys
- FakeClock
- LibraryFixture
- .check()
- .check()
- OnboardingReviewView
- .refresh()
- DeveloperView
- VoiceSpeaker
- ProjectEntity
- .extract()
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .importItems()
- .messages()
- ProjectDetailView
- AppLockTests.swift
- graphify_pipeline.py
- TopK
- FakeBiometrics
- .check()
- VoiceSettings
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .fallbackLLM()
- SourceKindOption
- ArchiveError
- Anchor
- .data()
- FakeCompletion
- Graph View
- UntrustedText (body/attribute inside its
- ActivitySheet
- .perform()
- .init()
- .update()
- ArticleSummaryCard
- Living Project Brief
- BriefRevisionStatus
- BriefError
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- VoiceStatus
- Apple Intelligence Preflight
- Step
- Phase
- KnowledgeSchema
- Int
- Entry
- FakePIN
- AppStore
- IntentFailure
- Refused
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
- `SourceIntake (shared validation for adding sources)` --implements--> `add_source Tool`  [INFERRED]
  CLAUDE.md → README.md
- `LibraryArchive (versioned JSON, snapshot/restore/erase)` --implements--> `Versioned Library JSON Export`  [INFERRED]
  CLAUDE.md → README.md
- `iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement` --semantically_similar_to--> `Apple Intelligence-Capable Device Floor (iPhone 15 Pro+)`  [INFERRED] [semantically similar]
  docs/DEVICE_TESTING.md → project.yml
- `com.intelligentdesignsllc.smartward.processing Task Identifier` --shares_data_with--> `Bundle ID Prefix com.intelligentdesignsllc`  [INFERRED]
  docs/DEVICE_TESTING.md → project.yml
- `App Switcher Privacy Cover` --conceptually_related_to--> `Apple Intelligence-Capable Device Floor (iPhone 15 Pro+)`  [INFERRED]
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

## Communities (202 total, 3 thin omitted)

### Community 0 - "AnalyzerCommandRecognizer"
Cohesion: 0.05
Nodes (40): AnalyzerInput, AsyncStream, AVAudioConverter, AVAudioFormat, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, AnalyzerCommandRecognizer (+32 more)

### Community 1 - "DigestBuilder"
Cohesion: 0.05
Nodes (42): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+34 more)

### Community 2 - "GraphIndexer"
Cohesion: 0.07
Nodes (32): Error, ExtractionAttempt, ExtractionJob, ExtractionResult, ExtractionTimedOut, .errorDescription, GraphIndexer, .suggestionsAdded (+24 more)

### Community 3 - "DailyBudget"
Cohesion: 0.07
Nodes (41): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+33 more)

### Community 4 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 5 - "VoiceCommand"
Cohesion: 0.04
Nodes (54): VoiceCommand, aboutTheme, acceptBriefUpdate, ask, back, clearSearch, .confirmation, decline (+46 more)

### Community 6 - "String"
Cohesion: 0.10
Nodes (24): EntityAlias, InterestProfile, MergeSuggestion, Message, ReadingSignal, StrategyItem, .status, StrategyItemStatus (+16 more)

### Community 7 - "PipelineRunner"
Cohesion: 0.09
Nodes (25): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+17 more)

### Community 8 - "ExtractionTiers"
Cohesion: 0.09
Nodes (23): EntityExtracting, ExtractionOutput, ExtractionTier, byok, onDevice, ExtractionTiers, LLMUsage, ExtractionBusy (+15 more)

### Community 9 - "String"
Cohesion: 0.13
Nodes (22): Decoder, EchoGuard, Bool, Int, Set, VoiceCommandParser, VoiceContext, VoiceItemMatcher (+14 more)

### Community 10 - "LocalizedError"
Cohesion: 0.07
Nodes (30): LocalizedError, LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext (+22 more)

### Community 11 - "FetchURLTool"
Cohesion: 0.09
Nodes (23): ExtractedArticle, Date, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool (+15 more)

### Community 12 - "ArticleReadoutController"
Cohesion: 0.12
Nodes (17): MPRemoteCommand, .readoutBar, ArticleReadoutController, .currentAnchor, .currentText, .isActive, .isBriefing, .isPaused (+9 more)

### Community 13 - "SwiftData"
Cohesion: 0.09
Nodes (8): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security, SwiftData

### Community 14 - ".makeContainer()"
Cohesion: 0.14
Nodes (14): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Error, Int (+6 more)

### Community 15 - "VoiceCommandController"
Cohesion: 0.09
Nodes (19): VoiceSpeedChange, faster, normal, slower, Outcome, Bool, ModelContext, Never (+11 more)

### Community 16 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 17 - "InterestModel"
Cohesion: 0.09
Nodes (29): CaseIterable, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+21 more)

### Community 18 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 19 - "VoiceIntent"
Cohesion: 0.10
Nodes (26): Decodable, Action, Answer, Outcome, actions, notUnderstood, Bool, Int (+18 more)

### Community 20 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 21 - "Pipeline"
Cohesion: 0.10
Nodes (5): BackgroundTasks, IngestKit, Pipeline, ShareInbox, XCTest

### Community 22 - "ArticleSummary"
Cohesion: 0.08
Nodes (18): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummary, .isEmpty, Question, about (+10 more)

### Community 23 - "GitHubClient"
Cohesion: 0.12
Nodes (14): GitHubClient, .isAuthenticated, GitHubUser, HTTPTransport, Set, String, T, FakeTransport (+6 more)

### Community 24 - "IngestError"
Cohesion: 0.10
Nodes (26): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+18 more)

### Community 25 - "Project"
Cohesion: 0.10
Nodes (20): Project, ProjectVoiceQueries, Int, ModelContext, Arguments, ProjectStateTool, .asksForApproval, .definition (+12 more)

### Community 26 - "GraphSnapshot"
Cohesion: 0.13
Nodes (22): CGFloat, Edge, ForceLayout, GraphEditing, GraphSnapshot, Node, Point, Scope (+14 more)

### Community 27 - "ThemeNode"
Cohesion: 0.11
Nodes (30): Hashable, Mention, ThemeNode, Connection, .id, GraphView, .asList, .body (+22 more)

### Community 28 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 29 - "BriefRevision"
Cohesion: 0.15
Nodes (13): BriefRevision, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date, LLMCompleting (+5 more)

### Community 30 - "BYOKLLMKit"
Cohesion: 0.10
Nodes (4): AppIntents, BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 31 - "ConversationView"
Cohesion: 0.10
Nodes (21): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 32 - ".run()"
Cohesion: 0.13
Nodes (20): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+12 more)

### Community 33 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 34 - "RawItem"
Cohesion: 0.13
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 35 - "Article"
Cohesion: 0.10
Nodes (25): Article, Int, .body, SetPINView, .body, String, Void, VerifyPINView (+17 more)

### Community 36 - "ReadoutPlayback"
Cohesion: 0.17
Nodes (7): ReadoutPlayback, .currentGroup, .groupPosition, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 37 - "RetrievedPassage"
Cohesion: 0.13
Nodes (18): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+10 more)

### Community 38 - "KnowledgeStore"
Cohesion: 0.12
Nodes (4): KnowledgeStore, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 39 - ".extract()"
Cohesion: 0.15
Nodes (9): ArticleExtractor, Bool, Element, String, URL, Document, ArticleExtractorTests, SwiftSoup (+1 more)

### Community 40 - "ArticleSummarizer"
Cohesion: 0.15
Nodes (14): ArticleSummarizer, ArticleSummarizing, ArticleSummaryOutput, BYOKArticleSummarizer, Bool, Date, LLMCompleting, LLMProvider (+6 more)

### Community 41 - "Chunk"
Cohesion: 0.11
Nodes (11): ContextPolicy, Bool, Chunk, Bool, Data, ContextPolicyTests, makeContext(), NormalizedKeyTests (+3 more)

### Community 42 - "EmbeddingModel"
Cohesion: 0.13
Nodes (13): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, ModelContext, Set, UUID, FixedJudge (+5 more)

### Community 43 - "Digest"
Cohesion: 0.16
Nodes (19): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+11 more)

### Community 44 - "ExtractedGraph"
Cohesion: 0.16
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionText, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 45 - "OpenArticleTool"
Cohesion: 0.14
Nodes (19): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, SearchCorpusTool (+11 more)

### Community 46 - "GitHubRepo"
Cohesion: 0.16
Nodes (13): GitHubRepo, .id, Bool, ApplyResult, RepoSnapshot, RepoSync, Date, Int (+5 more)

### Community 47 - "VoiceAnswersTests"
Cohesion: 0.11
Nodes (8): LibraryVoiceQueries, Bool, Double, ModelContext, ModelContainer, ModelContext, VoiceAnswersTests, World

### Community 48 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, UInt, VoiceCommandTests

### Community 49 - "PerfTrace"
Cohesion: 0.14
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 50 - "AppLockCoordinator"
Cohesion: 0.14
Nodes (13): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+5 more)

### Community 51 - "ProjectLink"
Cohesion: 0.14
Nodes (12): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+4 more)

### Community 52 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 53 - ".body"
Cohesion: 0.09
Nodes (21): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+13 more)

### Community 54 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 55 - "Conversation"
Cohesion: 0.13
Nodes (20): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+12 more)

### Community 56 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 57 - "ThemeStrengthCache"
Cohesion: 0.18
Nodes (14): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+6 more)

### Community 58 - "ActionRequest"
Cohesion: 0.15
Nodes (18): confirm, ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall (+10 more)

### Community 59 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 60 - "PipelineController"
Cohesion: 0.13
Nodes (18): .body, FoundationModelsRelevanceJudge, PipelineController, .indexesWhileOpen, .isIndexingWhileOpen, Bool, Date, Int (+10 more)

### Community 61 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 62 - "String"
Cohesion: 0.17
Nodes (9): EmbeddingProviding, LexicalIndex, .count, String, FakeEmbedder, .dimension, Int, HybridSearchTests (+1 more)

### Community 63 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 64 - ".items()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 65 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 66 - "ProjectSnapshot"
Cohesion: 0.19
Nodes (8): Item, ProjectSnapshot, StrategistPrompt, Bool, Set, String, .system, StrategistPromptTests

### Community 67 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 68 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 69 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 70 - "HybridSearchIndex"
Cohesion: 0.19
Nodes (11): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+3 more)

### Community 71 - ".check()"
Cohesion: 0.14
Nodes (5): VoiceCommandHelp, StaticString, String, UInt, VoiceHandsFreeCommandTests

### Community 72 - "VoiceConfirmationGate"
Cohesion: 0.21
Nodes (11): Pending, Resolution, cancelled, nothingToConfirm, run, Bool, Date, String (+3 more)

### Community 73 - "OnboardingProposal"
Cohesion: 0.18
Nodes (12): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+4 more)

### Community 74 - "ApprovalDecision"
Cohesion: 0.12
Nodes (13): ActionTools, ApprovalDecision, approve, ask, decline, Set, ApprovalPolicyTests, StubTool (+5 more)

### Community 75 - "ReadoutSegment"
Cohesion: 0.23
Nodes (7): ReadoutSegment, ArticleBriefing, DigestReadout, SegmentBuilder, Int, String, SpokenAnswer

### Community 76 - "XCTestCase"
Cohesion: 0.14
Nodes (14): ReferenceContext, AddSourceToolTests, answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest (+6 more)

### Community 77 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 78 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 79 - ".fetchURL()"
Cohesion: 0.25
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 80 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 81 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 82 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 83 - ".body"
Cohesion: 0.14
Nodes (16): BriefController, BriefHistoryView, .body, BriefOrigin, BriefReviewView, .body, BriefSection, .body (+8 more)

### Community 84 - "VoiceEngine"
Cohesion: 0.16
Nodes (7): AVAudioSession, CommandRecognizing, VoiceEngine, .current, .id, newer, standard

### Community 85 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 86 - "SourceFetcher"
Cohesion: 0.28
Nodes (6): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, SourceFetcherTests

### Community 87 - "SearchDocument"
Cohesion: 0.21
Nodes (9): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty (+1 more)

### Community 88 - "String"
Cohesion: 0.25
Nodes (4): Int, String, ThemeDescription, VoiceAnswers

### Community 89 - "View"
Cohesion: 0.17
Nodes (16): LockScreen, PrivacyCover, .body, SecuritySettingsSection, .lockBinding, .toggleTitle, Binding, Bool (+8 more)

### Community 90 - "BackgroundWork"
Cohesion: 0.16
Nodes (10): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Date, String (+2 more)

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

### Community 95 - "AppNavigation"
Cohesion: 0.15
Nodes (11): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+3 more)

### Community 96 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 97 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 98 - ".plan()"
Cohesion: 0.23
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 99 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 100 - "BriefingTests"
Cohesion: 0.23
Nodes (8): BriefingTests, Fixture, Bool, Double, Int, ModelContainer, ModelContext, String

### Community 101 - ".check()"
Cohesion: 0.20
Nodes (4): StaticString, String, UInt, VoiceBriefingCommandTests

### Community 102 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 103 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 104 - ".segments()"
Cohesion: 0.28
Nodes (6): Locale, ArticleReadout, Builder, .current, String, TimeZone

### Community 105 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 106 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 107 - "Source"
Cohesion: 0.21
Nodes (12): Source, .failingSourceTitles, .hasFollowedSources, SourceDetailView, SourceRow, SourcesView, .body, .following (+4 more)

### Community 108 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 109 - ".lines()"
Cohesion: 0.19
Nodes (11): BriefDiff, Line, added, removed, same, Int, BriefDiffTests, BriefDiffView (+3 more)

### Community 110 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 111 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 112 - "SpeechFinishDelegate"
Cohesion: 0.13
Nodes (11): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, ObjectIdentifier, .currentArticle, Kind, articles, digest (+3 more)

### Community 113 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 114 - "SourceKind"
Cohesion: 0.13
Nodes (14): UUID, .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn (+6 more)

### Community 115 - ".decode()"
Cohesion: 0.16
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 117 - "AppLockController"
Cohesion: 0.17
Nodes (10): ScenePhase, AppLockController, .handsFreeWindow, .isEnabled, .policy, Bool, Date, String (+2 more)

### Community 118 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 119 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 120 - "AskStrategistIntent"
Cohesion: 0.23
Nodes (14): AppIntent, AppShortcut, AppShortcutsProvider, AudioPlaybackIntent, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+6 more)

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

### Community 125 - "StrategyItemKind"
Cohesion: 0.19
Nodes (12): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, BriefEditorView (+4 more)

### Community 126 - "ArticleReaderView"
Cohesion: 0.15
Nodes (11): ReadoutScope, summaryOnly, whole, ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs (+3 more)

### Community 127 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 128 - "ArticleSummaryController"
Cohesion: 0.16
Nodes (12): .state, ArticleSummaryController, State, failed, generating, tooShort, unavailable, Bool (+4 more)

### Community 129 - "RootView"
Cohesion: 0.14
Nodes (12): ComingSoonView, .body, RootView, .shouldListenByVoice, .tabs, Bool, String, String (+4 more)

### Community 130 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 131 - "Observation"
Cohesion: 0.18
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 132 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 133 - "Refusal"
Cohesion: 0.21
Nodes (10): BriefingGate, Conditions, Refusal, appLocked, lockScreenOff, .message, needsUnlock, Bool (+2 more)

### Community 134 - ".text()"
Cohesion: 0.23
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 135 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 136 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 137 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 138 - ".start()"
Cohesion: 0.18
Nodes (11): BriefingLauncher, .lockScreenAllowed, Refusal, .errorDescription, gate, libraryUnavailable, nothingUnread, Bool (+3 more)

### Community 139 - "ConversationView.swift"
Cohesion: 0.23
Nodes (4): AVFoundation, MediaPlayer, Speech, VoiceLoopKit

### Community 140 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 141 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 142 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 143 - "CodingKeys"
Cohesion: 0.17
Nodes (11): CodingKeys, action, change, filter, kind, number, on, order (+3 more)

### Community 144 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 145 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 146 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceFindCommandTests

### Community 147 - ".check()"
Cohesion: 0.26
Nodes (4): StaticString, String, UInt, VoiceProjectCommandTests

### Community 148 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 149 - ".refresh()"
Cohesion: 0.29
Nodes (10): IngestController, Bool, Int, ModelContext, Set, String, UUID, Void (+2 more)

### Community 150 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 151 - "VoiceSpeaker"
Cohesion: 0.20
Nodes (6): AppAudio, Bool, Bool, String, VoiceSpeaker, .isBusy

### Community 152 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 153 - ".extract()"
Cohesion: 0.24
Nodes (8): Color, ExtractionDeclined, .errorDescription, Int, String, .body, ThemeStyle, .body

### Community 154 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 155 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 156 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 157 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 158 - ".messages()"
Cohesion: 0.29
Nodes (6): ConversationHistory, Int, LLMChatMessage, ConversationHistoryTests, String, TimeInterval

### Community 159 - "ProjectDetailView"
Cohesion: 0.20
Nodes (9): NewProjectView, .body, ProjectDetailView, .body, .links, ProjectsView, .body, IndexSet (+1 more)

### Community 160 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 161 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 162 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 163 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 164 - ".check()"
Cohesion: 0.31
Nodes (3): BriefingGateTests, Bool, TimeInterval

### Community 165 - "VoiceSettings"
Cohesion: 0.28
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 166 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 167 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 168 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 169 - ".fallbackLLM()"
Cohesion: 0.31
Nodes (3): .providerLine, ExtractionSettings, FoundationModelsEntityExtractor

### Community 170 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 171 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 172 - "Anchor"
Cohesion: 0.25
Nodes (8): Anchor, details, note, paragraph, relevance, summary, themes, title

### Community 173 - ".data()"
Cohesion: 0.43
Nodes (4): Data, Float, VectorCoding, VectorCodingTests

### Community 174 - "FakeCompletion"
Cohesion: 0.29
Nodes (6): FakeCompletion, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent

### Community 175 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 176 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 177 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 178 - ".perform()"
Cohesion: 0.29
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 179 - ".init()"
Cohesion: 0.43
Nodes (4): KeyedExtractor, Bool, ModelContext, String

### Community 180 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 181 - "ArticleSummaryCard"
Cohesion: 0.48
Nodes (4): ArticleSummaryCard, .body, .status, String

### Community 182 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 183 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 184 - "BriefError"
Cohesion: 0.33
Nodes (6): BriefError, empty, .errorDescription, notPending, outdated, unchanged

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

### Community 189 - "VoiceStatus"
Cohesion: 0.40
Nodes (5): VoiceStatus, failingSources, refresh, spendToday, unreadCount

### Community 190 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 191 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 192 - "Phase"
Cohesion: 0.40
Nodes (5): Phase, listening, off, starting, unavailable

### Community 193 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 194 - "Int"
Cohesion: 0.50
Nodes (3): Array, Element, Int

### Community 195 - "Entry"
Cohesion: 0.83
Nodes (3): Entry, Date, String

### Community 196 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 197 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 198 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

### Community 199 - "Refused"
Cohesion: 0.67
Nodes (3): Refused, device, provider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **511 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+506 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 939 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Article` connect `Article` to `ArticleSummaryController`, `DigestBuilder`, `GraphIndexer`, `String`, `PipelineRunner`, `ExtractionTiers`, `ArticleReadoutController`, `.makeContainer()`, `VoiceCommandController`, `ProjectArticlesTests`, `Project`, `GraphSnapshot`, `ThemeNode`, `.importItems()`, `ConversationView`, `RawItem`, `RetrievedPassage`, `ArticleSummarizer`, `Chunk`, `EmbeddingModel`, `Digest`, `GitHubRepo`, `VoiceAnswersTests`, `.init()`, `ArticleSummaryCard`, `.load()`, `ThemeStrengthCache`, `String`, `ReadoutSegment`, `Scenario`, `SearchDocument`, `BackgroundWork`, `AppNavigation`, `SearchHit`, `.makeFixture()`, `BriefingTests`, `.segments()`, `Source`, `.save()`, `SpeechFinishDelegate`, `ArticleReaderView`?**
  _High betweenness centrality (0.065) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `DigestBuilder`, `GraphIndexer`, `Observation`, `Refusal`, `String`, `.text()`, `ExtractionTiers`, `StepProgress`, `String`, `ConversationView.swift`, `.canonicalize()`, `GitHubDeviceFlow`, `Pipeline`, `ArticleSummary`, `GitHubClient`, `IngestError`, `BYOKLLMKit`, `AppLockTests.swift`, `SharedInbox`, `TopK`, `KnowledgeStore`, `.extract()`, `Chunk`, `PerfTrace`, `ProjectLink`, `.outcome()`, `.score()`, `.items()`, `Dependency`, `VoiceEngine`, `RedirectPolicy`, `SourceFetcher`, `AppLock.swift`, `.stored()`?**
  _High betweenness centrality (0.058) - this node is a cross-community bridge._
- **Why does `Project` connect `Project` to `DigestBuilder`, `String`, `GitHubRepoPicker`, `VoiceCommandController`, `LibraryFixture`, `ProjectArticlesTests`, `GraphSnapshot`, `ThemeNode`, `BriefRevision`, `ProjectDetailView`, `Chunk`, `EmbeddingModel`, `GitHubRepo`, `VoiceAnswersTests`, `ProjectLink`, `Conversation`, `ProjectSnapshot`, `OnboardingProposal`, `Scenario`, `.body`, `AppNavigation`, `.lines()`, `.projects()`, `StrategyItemKind`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Are the 34 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 34 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _511 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `AnalyzerCommandRecognizer` be split into smaller, more focused modules?**
  _Cohesion score 0.052289815447710185 - nodes in this community are weakly interconnected._
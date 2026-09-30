# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 188 files · ~705,573 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3495 nodes · 8968 edges · 194 communities (187 shown, 7 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 1015 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- GraphView
- VoiceCommandController
- ModelFallback
- Article
- String
- BriefRevision
- ReferenceLedger
- StrategistRunner
- SharedInbox
- SwiftData
- ProjectArticlesTests
- GitHubDeviceFlow
- Project
- ThemeNode
- Pipeline
- GitHubClient
- Sendable
- String
- FetchURLTool
- .dismiss()
- RetrievedPassage
- DailyBudget
- ExtractedGraph
- HybridSearchIndex
- KnowledgeStore
- ExtractedArticle
- Digest
- ExtractionTiers
- PipelineRunner
- StrategyItemKind
- InterestModel
- .makeArticle()
- ArticleSummary
- VoiceCommand
- BYOKLLMKit
- RecordStrategyItemTool
- RawItem
- .run()
- OnboardingProposal
- ArticleReadoutController
- ActionRequest
- VoiceCommandTests
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- .parse()
- Dependency
- ConversationMode
- .testGraphQueriesDoNotScaleWithTheWholeG
- .load()
- CodingKeys
- GraphRAG
- IngestError
- SourceFetcher
- DigestSummaryRequest
- PerfTrace
- LexicalIndex
- EmbeddingModel
- GraphIndexer
- .article()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .segments()
- .seal()
- .makeContainer()
- PriceBook
- ReadoutPlayback
- Scenario
- .body
- .fetchURL()
- ArticleReaderView
- SearchHit
- .body
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- RedirectPolicy
- ExtractionTier
- .makeFixture()
- Approval Before Actions
- ArticleSummaryController
- Strategist Layer
- .refresh()
- ShareModel
- .parse()
- GitHubAccount
- .record()
- .decode()
- .plan()
- OnboardingView
- Kind
- SmartWard (iOS Application Target)
- .outcome()
- LibraryArchive
- VoiceTab
- .messages()
- FakeTransport
- PlaybackLLM
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .stored()
- .projects()
- RefreshEagerness
- Choice
- .process()
- ModelCatalogController
- AppLock.swift
- .body
- SourceKindOption
- AskStrategistIntent
- SmartWard XcodeGen Project Spec
- AppLockCoordinator
- SourceKind
- String
- StepProgress
- AppLockController
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .text()
- XCTestCase
- FakeClock
- LibraryFixture
- OnboardingReviewView
- DeveloperView
- .buildIfDue()
- VoiceSpeaker
- ProjectEntity
- SmartWardIntents.swift
- LockViews.swift
- BackgroundWork
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .unlockWithBiometrics()
- .apply()
- .fromPastedURL()
- .score()
- Anchor
- SeededRandom
- .speakCurrent()
- FakePIN
- .canonicalize()
- graphify_pipeline.py
- GitHubRepo
- AppLockPolicy
- RobotsRules
- ArticleStage
- .render()
- TopK
- BriefError
- FakeBiometrics
- FoundationModelsEntityExtractor
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .documents()
- GitHubError
- .send()
- ArchiveError
- .graphML()
- .runPipeline()
- Graph View
- AddSourceView
- SpeechFinishDelegate
- UntrustedText (body/attribute inside its
- ActivitySheet
- .perform()
- StubTool
- .init()
- .update()
- Living Project Brief
- AvailableModelsView
- VoiceCommandBar
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- Status
- ArticleSummaryError
- Refused
- Apple Intelligence Preflight
- KnowledgeSchema
- ApprovalDecision
- AppStore
- BudgetSettings
- ComingSoonView
- MatchKind
- Result
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 104 edges
2. `Article` - 99 edges
3. `SwiftData` - 87 edges
4. `Project` - 74 edges
5. `Source` - 60 edges
6. `ThemeNode` - 49 edges
7. `Pipeline` - 44 edges
8. `XCTest` - 42 edges
9. `Conversation` - 40 edges
10. `PipelineRunner` - 39 edges

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

## Communities (194 total, 7 thin omitted)

### Community 0 - "GraphView"
Cohesion: 0.05
Nodes (60): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+52 more)

### Community 1 - "VoiceCommandController"
Cohesion: 0.05
Nodes (39): AVAudioNodeTapBlock, AVAudioPCMBuffer, AVAudioSession, Error, NSError, SFSpeechAudioBufferRecognitionRequest, SFSpeechRecognitionTask, Failure (+31 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "Article"
Cohesion: 0.07
Nodes (43): Color, Article, Source, ThemesRow, .body, .nodes, BriefHistoryView, ProjectRouteView (+35 more)

### Community 4 - "String"
Cohesion: 0.11
Nodes (19): ContextPolicy, Bool, Chunk, Conversation, InterestProfile, Mention, MergeSuggestion, Message (+11 more)

### Community 5 - "BriefRevision"
Cohesion: 0.09
Nodes (30): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, ProjectBrief (+22 more)

### Community 6 - "ReferenceLedger"
Cohesion: 0.09
Nodes (25): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, ReferenceLedger (+17 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 8 - "SharedInbox"
Cohesion: 0.09
Nodes (22): JSONDecoder, JSONEncoder, Result, SharedImport, Date, Int, ModelContext, SharedInbox (+14 more)

### Community 9 - "SwiftData"
Cohesion: 0.09
Nodes (11): BackgroundTasks, CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, RetrievalKit, Security (+3 more)

### Community 10 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 11 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 12 - "Project"
Cohesion: 0.08
Nodes (22): Set, Project, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+14 more)

### Community 13 - "ThemeNode"
Cohesion: 0.13
Nodes (17): EntityAlias, Data, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext (+9 more)

### Community 14 - "Pipeline"
Cohesion: 0.10
Nodes (7): FoundationModels, Observation, Pipeline, SwiftUI, UIKit, UniformTypeIdentifiers, UserNotifications

### Community 15 - "GitHubClient"
Cohesion: 0.13
Nodes (16): GitHubClient, .isAuthenticated, GitHubUser, HTTPTransport, Data, HTTPURLResponse, Int, Set (+8 more)

### Community 16 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 17 - "String"
Cohesion: 0.16
Nodes (15): Decoder, EchoGuard, Bool, Int, Set, VoiceCommandParser, VoiceContext, VoiceItemMatcher (+7 more)

### Community 18 - "FetchURLTool"
Cohesion: 0.11
Nodes (19): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+11 more)

### Community 19 - ".dismiss()"
Cohesion: 0.08
Nodes (29): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+21 more)

### Community 20 - "RetrievedPassage"
Cohesion: 0.11
Nodes (21): RetrievedPassage, ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 21 - "DailyBudget"
Cohesion: 0.13
Nodes (16): DailyBudget, DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext (+8 more)

### Community 22 - "ExtractedGraph"
Cohesion: 0.14
Nodes (15): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation (+7 more)

### Community 23 - "HybridSearchIndex"
Cohesion: 0.17
Nodes (16): Accelerate, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, SearchCorpus, SearchDocument, Bool (+8 more)

### Community 24 - "KnowledgeStore"
Cohesion: 0.14
Nodes (3): IngestKit, KnowledgeStore, XCTest

### Community 25 - "ExtractedArticle"
Cohesion: 0.15
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 26 - "Digest"
Cohesion: 0.14
Nodes (22): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+14 more)

### Community 27 - "ExtractionTiers"
Cohesion: 0.11
Nodes (18): ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 28 - "PipelineRunner"
Cohesion: 0.16
Nodes (15): FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+7 more)

### Community 29 - "StrategyItemKind"
Cohesion: 0.13
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Item (+7 more)

### Community 30 - "InterestModel"
Cohesion: 0.14
Nodes (18): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+10 more)

### Community 31 - ".makeArticle()"
Cohesion: 0.19
Nodes (9): ArticleSummaryTests, StubSummarizer, Bool, Int, LLMUsage, ModelContext, String, TimeInterval (+1 more)

### Community 32 - "ArticleSummary"
Cohesion: 0.11
Nodes (15): ArticleSummary, .isEmpty, Question, about, evidence, matters, remember, says (+7 more)

### Community 33 - "VoiceCommand"
Cohesion: 0.07
Nodes (27): VoiceCommand, back, .confirmation, help, nextSection, openItem, openLastItem, openMatching (+19 more)

### Community 34 - "BYOKLLMKit"
Cohesion: 0.12
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 35 - "RecordStrategyItemTool"
Cohesion: 0.13
Nodes (17): Arguments, ProjectStateTool, .asksForApproval, .definition, invalidArguments, ProposeBriefUpdateTool, .asksForApproval, .definition (+9 more)

### Community 36 - "RawItem"
Cohesion: 0.16
Nodes (11): FeedIngest, Bool, Date, Error, ModelContext, String, TimeInterval, RawItem (+3 more)

### Community 37 - ".run()"
Cohesion: 0.17
Nodes (15): CheckedContinuation, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext, Never (+7 more)

### Community 38 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 39 - "ArticleReadoutController"
Cohesion: 0.15
Nodes (12): MPRemoteCommand, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor, .currentText, .isActive, .isPaused (+4 more)

### Community 40 - "ActionRequest"
Cohesion: 0.13
Nodes (20): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+12 more)

### Community 41 - "VoiceCommandTests"
Cohesion: 0.14
Nodes (4): StaticString, String, VoiceCommandTests, UInt

### Community 42 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 43 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 44 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 45 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 46 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 47 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 48 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 49 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 50 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.15
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 51 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 52 - "CodingKeys"
Cohesion: 0.10
Nodes (21): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+13 more)

### Community 53 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 54 - "IngestError"
Cohesion: 0.11
Nodes (18): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+10 more)

### Community 55 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 56 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (11): BYOKDigestSummarizer, DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage (+3 more)

### Community 57 - "PerfTrace"
Cohesion: 0.19
Nodes (13): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+5 more)

### Community 58 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 59 - "EmbeddingModel"
Cohesion: 0.17
Nodes (11): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ArticleIndexer, ModelContext (+3 more)

### Community 60 - "GraphIndexer"
Cohesion: 0.19
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 61 - ".article()"
Cohesion: 0.18
Nodes (8): Int, FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext, TriageDisplayTests, .relevancePercent

### Community 62 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 63 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 64 - ".segments()"
Cohesion: 0.23
Nodes (8): Locale, Array, ArticleReadout, Builder, .current, ReadoutSegment, String, TimeZone

### Community 65 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 66 - ".makeContainer()"
Cohesion: 0.20
Nodes (9): Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests (+1 more)

### Community 67 - "PriceBook"
Cohesion: 0.20
Nodes (11): Line, .id, Price, PriceBook, Bool, Double, Int, String (+3 more)

### Community 68 - "ReadoutPlayback"
Cohesion: 0.25
Nodes (5): ReadoutPlayback, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 69 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 70 - ".body"
Cohesion: 0.15
Nodes (15): BriefController, BriefEditorView, .body, .body, BriefOrigin, BriefSection, .body, ProjectRoute (+7 more)

### Community 71 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 72 - "ArticleReaderView"
Cohesion: 0.14
Nodes (13): ReadoutScope, summaryOnly, whole, ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL (+5 more)

### Community 73 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 74 - ".body"
Cohesion: 0.11
Nodes (16): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+8 more)

### Community 75 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 76 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 77 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 78 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 79 - "RedirectPolicy"
Cohesion: 0.14
Nodes (11): PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest, URLSession (+3 more)

### Community 80 - "ExtractionTier"
Cohesion: 0.21
Nodes (9): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+1 more)

### Community 81 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 82 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 83 - "ArticleSummaryController"
Cohesion: 0.15
Nodes (12): ArticleSummaryController, FoundationModelsArticleSummarizer, State, failed, generating, tooShort, unavailable, Bool (+4 more)

### Community 84 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 85 - ".refresh()"
Cohesion: 0.21
Nodes (13): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+5 more)

### Community 86 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 87 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 88 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 89 - ".record()"
Cohesion: 0.30
Nodes (7): Calendar, Date, ModelContext, UsageLedger, UsageView, .body, .providersWithKeys

### Community 90 - ".decode()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 91 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 92 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 93 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 94 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 95 - ".outcome()"
Cohesion: 0.23
Nodes (5): NavigationPath, VoiceCommandHelp, AppNavigation, Bool, UUID

### Community 96 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 97 - "VoiceTab"
Cohesion: 0.14
Nodes (14): VoiceTab, chat, graph, projects, reading, .title, today, AppTab (+6 more)

### Community 98 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 99 - "FakeTransport"
Cohesion: 0.22
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 100 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 101 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 102 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 103 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 104 - ".stored()"
Cohesion: 0.25
Nodes (4): SourceHealth, Error, String, SourceHealthTests

### Community 105 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 106 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 107 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 108 - ".process()"
Cohesion: 0.19
Nodes (11): FoundationModelsRelevanceJudge, PipelineController, Bool, Int, ModelContext, String, TimeInterval, Void (+3 more)

### Community 109 - "ModelCatalogController"
Cohesion: 0.23
Nodes (9): FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry, Date, LLMProvider (+1 more)

### Community 110 - "AppLock.swift"
Cohesion: 0.21
Nodes (9): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINVerifying, BiometricUnavailable, BiometryType, Result (+1 more)

### Community 111 - ".body"
Cohesion: 0.17
Nodes (10): App, Scene, SmartWardApp, .body, .state, RootView, .body, .shouldListenByVoice (+2 more)

### Community 112 - "SourceKindOption"
Cohesion: 0.15
Nodes (13): AppEnum, IntentFailure, .errorDescription, libraryUnavailable, noProvider, SourceKindOption, arxiv, feed (+5 more)

### Community 113 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary (+5 more)

### Community 114 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 115 - "AppLockCoordinator"
Cohesion: 0.21
Nodes (9): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+1 more)

### Community 116 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 117 - "String"
Cohesion: 0.31
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 118 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 119 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 120 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 121 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 122 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 123 - "XCTestCase"
Cohesion: 0.17
Nodes (8): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, SampleLibraryTests, GraphExportTests, TopKTests, XCTestCase

### Community 124 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 125 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 126 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 127 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 128 - ".buildIfDue()"
Cohesion: 0.21
Nodes (9): DigestController, .notificationsEnabled, FoundationModelsDigestSummarizer, Bool, ModelContext, String, TimeInterval, DigestSettingsSection (+1 more)

### Community 129 - "VoiceSpeaker"
Cohesion: 0.20
Nodes (6): AppAudio, Bool, Bool, String, VoiceSpeaker, .isBusy

### Community 130 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 131 - "SmartWardIntents.swift"
Cohesion: 0.22
Nodes (5): AppIntents, AVFoundation, MediaPlayer, Speech, VoiceLoopKit

### Community 132 - "LockViews.swift"
Cohesion: 0.22
Nodes (8): AppLock, PINLockKit, LockScreen, PrivacyCover, .body, Bool, LockOverlay, .body

### Community 133 - "BackgroundWork"
Cohesion: 0.27
Nodes (6): BGContinuedProcessingTask, .body, BackgroundWork, Date, String, TimeInterval

### Community 134 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, ReadingFilter, all, .id, starred, unread, ReadingOrder, .id (+3 more)

### Community 135 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 136 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 137 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 138 - ".unlockWithBiometrics()"
Cohesion: 0.22
Nodes (7): BiometricStep, needsPIN, unlocked, PINService, BiometricResult, PINAttemptResult, String

### Community 139 - ".apply()"
Cohesion: 0.36
Nodes (5): ApplyResult, RepoSync, Date, Int, ModelContext

### Community 141 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 142 - "Anchor"
Cohesion: 0.18
Nodes (10): Anchor, details, note, paragraph, relevance, summary, themes, title (+2 more)

### Community 143 - "SeededRandom"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 144 - ".speakCurrent()"
Cohesion: 0.24
Nodes (7): AVSpeechSynthesisVoice, String, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 145 - "FakePIN"
Cohesion: 0.31
Nodes (5): BiometricLockKit, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 146 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 147 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 148 - "GitHubRepo"
Cohesion: 0.33
Nodes (7): Decodable, GitHubRepo, .id, Bool, Document, RepoSnapshot, String

### Community 149 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 150 - "RobotsRules"
Cohesion: 0.40
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 151 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 152 - ".render()"
Cohesion: 0.33
Nodes (3): ReferenceContext, String, UntrustedText

### Community 153 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 154 - "BriefError"
Cohesion: 0.20
Nodes (8): BriefError, empty, .errorDescription, notPending, outdated, unchanged, Int, BriefDiffTests

### Community 155 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 156 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 157 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 158 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 159 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 160 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 161 - "GitHubError"
Cohesion: 0.25
Nodes (8): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date

### Community 162 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 163 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 164 - ".graphML()"
Cohesion: 0.39
Nodes (5): GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 166 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 167 - "AddSourceView"
Cohesion: 0.39
Nodes (5): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput

### Community 168 - "SpeechFinishDelegate"
Cohesion: 0.29
Nodes (6): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, NSObject, SpeechFinishDelegate, Void

### Community 169 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 170 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 171 - ".perform()"
Cohesion: 0.38
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 172 - "StubTool"
Cohesion: 0.33
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 173 - ".init()"
Cohesion: 0.43
Nodes (4): KeyedExtractor, Bool, ModelContext, String

### Community 174 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 175 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 176 - "AvailableModelsView"
Cohesion: 0.60
Nodes (4): AvailableModelsView, .body, .providersWithKeys, LLMProvider

### Community 177 - "VoiceCommandBar"
Cohesion: 0.33
Nodes (5): String, VoiceCommandBar, .body, .icon, .line

### Community 178 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 179 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 181 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 182 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 183 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 184 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 185 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 186 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 187 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 188 - "BudgetSettings"
Cohesion: 0.67
Nodes (3): BudgetSettings, .current, Double

### Community 189 - "ComingSoonView"
Cohesion: 0.50
Nodes (3): ComingSoonView, .body, String

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **419 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+414 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 787 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **7 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `SmartWardIntents.swift`, `String`, `LockViews.swift`, `SharedInbox`, `GitHubDeviceFlow`, `Project`, `.score()`, `Pipeline`, `GitHubClient`, `String`, `.canonicalize()`, `DailyBudget`, `ExtractedGraph`, `HybridSearchIndex`, `KnowledgeStore`, `ExtractedArticle`, `TopK`, `.render()`, `StrategyItemKind`, `ArticleSummary`, `BYOKLLMKit`, `.outcome()`, `.parse()`, `Dependency`, `IngestError`, `SourceFetcher`, `PerfTrace`, `.segments()`, `RedirectPolicy`, `.parse()`, `.stored()`, `AppLock.swift`, `StepProgress`, `.text()`?**
  _High betweenness centrality (0.065) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `.segments()`, `GraphView`, `BYOKLLMKit`, `SmartWardIntents.swift`, `Article`, `StrategistRunner`, `SwiftData`, `ThemeNode`, `Pipeline`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `HybridSearchIndex`, `SourceFetcher`, `GraphIndexer`, `StrategyItemKind`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `GraphView`, `String`, `ReferenceLedger`, `SharedInbox`, `ProjectArticlesTests`, `.apply()`, `Project`, `ThemeNode`, `.dismiss()`, `RetrievedPassage`, `DailyBudget`, `HybridSearchIndex`, `ArticleStage`, `Digest`, `ExtractionTiers`, `PipelineRunner`, `.makeArticle()`, `ArticleSummary`, `.init()`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `.load()`, `LexicalIndex`, `EmbeddingModel`, `GraphIndexer`, `.article()`, `.segments()`, `.makeContainer()`, `Scenario`, `ArticleReaderView`, `SearchHit`, `ExtractionTier`, `.makeFixture()`, `ArticleSummaryController`, `.refresh()`, `.outcome()`?**
  _High betweenness centrality (0.042) - this node is a cross-community bridge._
- **Are the 31 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 31 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _419 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `GraphView` be split into smaller, more focused modules?**
  _Cohesion score 0.05246913580246913 - nodes in this community are weakly interconnected._
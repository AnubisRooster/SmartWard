# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 179 files · ~676,948 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3282 nodes · 8493 edges · 177 communities (172 shown, 5 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 985 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Project
- ModelFallback
- ThemeNode
- StrategyItemKind
- DailyBudget
- RefreshEagerness
- StrategistRunner
- GitHubClient
- .makeContainer()
- KnowledgeStore
- ProjectArticlesTests
- GitHubDeviceFlow
- ReferenceLedger
- SourceFetcher
- IngestError
- XCTestCase
- ExtractedGraph
- Sendable
- SwiftData
- Identifiable
- .messages()
- ConversationView
- ArticleSummary
- Conversation
- ArticleReadoutController
- .apply()
- ProjectLink
- ExtractionTier
- ExtractionTiers
- PipelineRunner
- InterestModel
- Message
- Pipeline
- ActionRequest
- AppLockCoordinator
- GraphSnapshot
- SecuritySettingsSection
- .run()
- PerfTrace
- Phase 5: Hardening
- ArticleSummaryCard
- Pipeline module (ingestion, graph, searc
- .extract()
- .fetch()
- DigestSummaryRequest
- EmbeddingModel
- .load()
- .fetch()
- .outcome()
- GitHubRepoPicker
- Invariant D5: Private content never goes
- Dependency
- .fetchURL()
- RetrievedPassage
- Choice
- GraphRAG
- ThemeStrengthCache
- FakeBiometrics
- Article
- DigestBuilder
- HybridSearchIndex
- OnboardingProposal
- Scenario
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- Digest
- .seal()
- ReadoutPlayback
- View
- SmartWardIntents.swift
- Source
- SearchDocument
- IngestKit
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- .segments()
- GitHubError
- .stored()
- .plan()
- .makeFixture()
- Approval Before Actions
- Strategist Layer
- .parse()
- GitHubAccount
- .save()
- LibraryFixture
- OnboardingView
- Kind
- GraphCanvas
- CodingKeys
- SmartWard (iOS Application Target)
- .refresh()
- RedirectPolicy
- LibraryArchive
- PlaybackLLM
- RetrievalFixture
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- ShareModel
- ArticleReaderView
- .article()
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SourceKind
- Anchor
- .data()
- StepProgress
- FakeClock
- SeededRandom
- AppLockController
- OnboardingReviewView
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GraphView
- SearchController
- RelevanceJudging
- .process()
- DeveloperView
- ProjectEntity
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- ExtractedArticle
- ParsedFeed
- .importItems()
- .fromPastedURL()
- .projects()
- .score()
- String
- ThemeDetailView
- .body
- graphify_pipeline.py
- .parse()
- ArticleStage
- TopK
- BriefError
- AppTab
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- .clusters()
- .graphML()
- SourceKindOption
- Observation
- ArchiveError
- .testEveryPromptFenceHoldsAgainstPoisone
- StubTool
- Graph View
- ShareViewController.swift
- .body
- SynthesizerDelegate
- UntrustedText (body/attribute inside its
- ActivitySheet
- .availability()
- VoiceSettingsSection
- DigestController
- ProviderKeyRow
- Living Project Brief
- .perform()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- Status
- ArticleSummaryError
- .displayPercent()
- Refused
- Apple Intelligence Preflight
- KnowledgeSchema
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 101 edges
2. `Article` - 94 edges
3. `SwiftData` - 86 edges
4. `Project` - 72 edges
5. `Source` - 60 edges
6. `ThemeNode` - 49 edges
7. `Pipeline` - 42 edges
8. `XCTest` - 41 edges
9. `Conversation` - 40 edges
10. `PipelineRunner` - 39 edges

## Surprising Connections (you probably didn't know these)
- `.sourceLabel` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ArticleReaderView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (177 total, 5 thin omitted)

### Community 0 - "Project"
Cohesion: 0.07
Nodes (39): BriefRevision, Project, ProjectBrief, StrategyItem, BriefDiff, BriefEditing, tooLong, BriefReviser (+31 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "ThemeNode"
Cohesion: 0.08
Nodes (26): EntityAlias, InterestProfile, Mention, MergeSuggestion, .status, StrategyItemStatus, done, invalidated (+18 more)

### Community 3 - "StrategyItemKind"
Cohesion: 0.07
Nodes (30): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Arguments (+22 more)

### Community 4 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 5 - "RefreshEagerness"
Cohesion: 0.05
Nodes (34): App, BGContinuedProcessingTask, RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests (+26 more)

### Community 6 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 7 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 8 - ".makeContainer()"
Cohesion: 0.15
Nodes (13): Bool, ModelContainer, ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage (+5 more)

### Community 9 - "KnowledgeStore"
Cohesion: 0.12
Nodes (5): BYOKLLMKit, KnowledgeStore, ModelCatalogKit, StrategistCore, XCTest

### Community 10 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 11 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 12 - "ReferenceLedger"
Cohesion: 0.11
Nodes (22): ReferenceContext, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition (+14 more)

### Community 13 - "SourceFetcher"
Cohesion: 0.12
Nodes (16): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, RawItem, Date, Set, String (+8 more)

### Community 14 - "IngestError"
Cohesion: 0.10
Nodes (27): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+19 more)

### Community 15 - "XCTestCase"
Cohesion: 0.09
Nodes (23): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, ApprovalDecision, approve, ask (+15 more)

### Community 16 - "ExtractedGraph"
Cohesion: 0.11
Nodes (20): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation (+12 more)

### Community 17 - "Sendable"
Cohesion: 0.24
Nodes (31): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+23 more)

### Community 18 - "SwiftData"
Cohesion: 0.10
Nodes (8): CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, RetrievalKit, Security, SwiftData

### Community 19 - "Identifiable"
Cohesion: 0.12
Nodes (17): Identifiable, JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject (+9 more)

### Community 20 - ".messages()"
Cohesion: 0.09
Nodes (16): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+8 more)

### Community 21 - "ConversationView"
Cohesion: 0.10
Nodes (21): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 22 - "ArticleSummary"
Cohesion: 0.11
Nodes (20): Decoder, ArticleSummary, .isEmpty, CodingKeys, about, evidence, matters, remember (+12 more)

### Community 23 - "Conversation"
Cohesion: 0.09
Nodes (26): .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Conversation, .mode (+18 more)

### Community 24 - "ArticleReadoutController"
Cohesion: 0.14
Nodes (12): MPRemoteCommand, NSObjectProtocol, .readoutBar, ArticleReadoutController, .currentAnchor, .isActive, .isPaused, Any (+4 more)

### Community 25 - ".apply()"
Cohesion: 0.12
Nodes (11): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+3 more)

### Community 26 - "ProjectLink"
Cohesion: 0.11
Nodes (18): Set, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url, GraphIndexer (+10 more)

### Community 27 - "ExtractionTier"
Cohesion: 0.15
Nodes (16): ArticleSummarizer, ArticleSummarizing, ArticleSummaryOutput, BYOKArticleSummarizer, Bool, Date, LLMCompleting, LLMProvider (+8 more)

### Community 28 - "ExtractionTiers"
Cohesion: 0.12
Nodes (18): ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 29 - "PipelineRunner"
Cohesion: 0.17
Nodes (14): FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+6 more)

### Community 30 - "InterestModel"
Cohesion: 0.14
Nodes (18): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+10 more)

### Community 31 - "Message"
Cohesion: 0.12
Nodes (11): ContextPolicy, Bool, Chunk, Message, Data, ContextPolicyTests, makeContext(), NormalizedKeyTests (+3 more)

### Community 32 - "Pipeline"
Cohesion: 0.14
Nodes (6): AVFoundation, FoundationModels, MediaPlayer, Pipeline, SwiftUI, VoiceLoopKit

### Community 33 - "ActionRequest"
Cohesion: 0.13
Nodes (20): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+12 more)

### Community 34 - "AppLockCoordinator"
Cohesion: 0.14
Nodes (17): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINOutcome, incorrect (+9 more)

### Community 35 - "GraphSnapshot"
Cohesion: 0.19
Nodes (17): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+9 more)

### Community 36 - "SecuritySettingsSection"
Cohesion: 0.12
Nodes (20): AppLock, BiometricLockKit, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body (+12 more)

### Community 37 - ".run()"
Cohesion: 0.18
Nodes (14): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+6 more)

### Community 38 - "PerfTrace"
Cohesion: 0.14
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 39 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 40 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 41 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 42 - ".extract()"
Cohesion: 0.19
Nodes (8): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, SwiftSoup, Unicode

### Community 43 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 44 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (13): BYOKDigestSummarizer, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider (+5 more)

### Community 45 - "EmbeddingModel"
Cohesion: 0.19
Nodes (11): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+3 more)

### Community 46 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 47 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 48 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 49 - "GitHubRepoPicker"
Cohesion: 0.10
Nodes (19): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+11 more)

### Community 50 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 51 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 52 - ".fetchURL()"
Cohesion: 0.21
Nodes (7): SourceEndpoint, Bool, String, URL, SourceEndpointTests, String, URL

### Community 53 - "RetrievedPassage"
Cohesion: 0.16
Nodes (14): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+6 more)

### Community 54 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 55 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 56 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 57 - "FakeBiometrics"
Cohesion: 0.18
Nodes (10): AppLockCoordinatorTests, FakeBiometrics, FakePIN, BiometricResult, BiometricUnavailable, BiometryType, PINAttemptResult, Result (+2 more)

### Community 58 - "Article"
Cohesion: 0.17
Nodes (16): Article, ReadingSignal, ThemesRow, .body, ArticleRow, .body, .content, ReadingView (+8 more)

### Community 59 - "DigestBuilder"
Cohesion: 0.18
Nodes (11): DigestBuilder, Date, Int, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date (+3 more)

### Community 60 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 61 - "OnboardingProposal"
Cohesion: 0.15
Nodes (14): OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue, String (+6 more)

### Community 62 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 63 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 64 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 65 - "Digest"
Cohesion: 0.25
Nodes (13): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+5 more)

### Community 66 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 67 - "ReadoutPlayback"
Cohesion: 0.25
Nodes (5): ReadoutPlayback, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 68 - "View"
Cohesion: 0.17
Nodes (17): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+9 more)

### Community 69 - "SmartWardIntents.swift"
Cohesion: 0.18
Nodes (17): AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+9 more)

### Community 70 - "Source"
Cohesion: 0.17
Nodes (12): Source, ModelContext, .failingSourceTitles, .hasFollowedSources, SourceDetailView, SourcesView, .body, .following (+4 more)

### Community 71 - "SearchDocument"
Cohesion: 0.21
Nodes (9): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update (+1 more)

### Community 72 - "IngestKit"
Cohesion: 0.12
Nodes (4): BackgroundTasks, IngestKit, PublicHostTests, ShareInbox

### Community 73 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 74 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 75 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 76 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 77 - ".segments()"
Cohesion: 0.27
Nodes (7): Locale, ArticleReadout, Builder, .current, ReadoutSegment, String, TimeZone

### Community 78 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 79 - ".stored()"
Cohesion: 0.19
Nodes (6): SourceHealth, Error, String, SourceHealthTests, SourceRow, .body

### Community 80 - ".plan()"
Cohesion: 0.23
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 81 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 82 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 83 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 84 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 85 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 86 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 87 - "LibraryFixture"
Cohesion: 0.17
Nodes (7): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, MarkdownExportTests, ModelContainer, ModelContext

### Community 88 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 89 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 90 - "GraphCanvas"
Cohesion: 0.19
Nodes (12): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 91 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 92 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 93 - ".refresh()"
Cohesion: 0.22
Nodes (13): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+5 more)

### Community 94 - "RedirectPolicy"
Cohesion: 0.16
Nodes (11): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+3 more)

### Community 95 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 96 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 97 - "RetrievalFixture"
Cohesion: 0.24
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 98 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 99 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 100 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 101 - "ShareModel"
Cohesion: 0.20
Nodes (8): NSExtensionContext, ShareModel, .canSave, ShareView, .body, Bool, String, UUID

### Community 102 - "ArticleReaderView"
Cohesion: 0.15
Nodes (12): ReadoutScope, summaryOnly, whole, ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs (+4 more)

### Community 103 - ".article()"
Cohesion: 0.32
Nodes (4): ArticleIndexer, PipelineRunnerTests, ModelContainer, ModelContext

### Community 104 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 105 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 106 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 107 - "Anchor"
Cohesion: 0.15
Nodes (11): Anchor, details, note, paragraph, relevance, summary, themes, title (+3 more)

### Community 108 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 109 - "StepProgress"
Cohesion: 0.19
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 110 - "FakeClock"
Cohesion: 0.33
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 111 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 112 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 113 - "OnboardingReviewView"
Cohesion: 0.23
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 114 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 115 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 116 - "GraphView"
Cohesion: 0.26
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 117 - "SearchController"
Cohesion: 0.27
Nodes (7): SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID

### Community 118 - "RelevanceJudging"
Cohesion: 0.20
Nodes (9): RelevanceJudging, FixedJudge, Bool, FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label (+1 more)

### Community 119 - ".process()"
Cohesion: 0.24
Nodes (7): .body, ExtractionSettings, PipelineController, Int, ModelContext, TimeInterval, Void

### Community 120 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 121 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 122 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, Filter, all, .id, starred, unread, Order, .id (+3 more)

### Community 123 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 124 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 125 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 126 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 127 - "ExtractedArticle"
Cohesion: 0.24
Nodes (6): ExtractedArticle, Date, FetchURLToolTests, FakeFullText, Set, URL

### Community 128 - "ParsedFeed"
Cohesion: 0.31
Nodes (7): Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 129 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 131 - ".projects()"
Cohesion: 0.38
Nodes (6): MarkdownExport, Bool, Date, Int, ModelContext, String

### Community 132 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 133 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 134 - "ThemeDetailView"
Cohesion: 0.27
Nodes (9): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions (+1 more)

### Community 135 - ".body"
Cohesion: 0.24
Nodes (8): DigestClusterSection, .body, DigestSections, .body, String, UUID, TodayView, .body

### Community 136 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 137 - ".parse()"
Cohesion: 0.29
Nodes (3): FeedParser, Data, FeedParserTests

### Community 138 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 139 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 140 - "BriefError"
Cohesion: 0.20
Nodes (8): BriefError, empty, .errorDescription, notPending, outdated, unchanged, Int, BriefDiffTests

### Community 141 - "AppTab"
Cohesion: 0.24
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 142 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 143 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 144 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 145 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 146 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 147 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 148 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 149 - "Observation"
Cohesion: 0.25
Nodes (3): Observation, GitHubConfig, UserNotifications

### Community 150 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 152 - "StubTool"
Cohesion: 0.29
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 153 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 154 - "ShareViewController.swift"
Cohesion: 0.25
Nodes (5): ShareViewController, LockOverlay, UIKit, UIViewController, UniformTypeIdentifiers

### Community 155 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 156 - "SynthesizerDelegate"
Cohesion: 0.29
Nodes (6): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, ObjectIdentifier, Void, SynthesizerDelegate

### Community 157 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 158 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 159 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 160 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 161 - "DigestController"
Cohesion: 0.33
Nodes (5): DigestController, .notificationsEnabled, Bool, String, TimeInterval

### Community 162 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 163 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 164 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 165 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 166 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 168 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 169 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 170 - ".displayPercent()"
Cohesion: 0.40
Nodes (3): Int, TriageDisplayTests, .relevancePercent

### Community 171 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 172 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 173 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 174 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **364 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+359 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 706 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `ParsedFeed`, `StrategyItemKind`, `.score()`, `DailyBudget`, `RefreshEagerness`, `GitHubClient`, `KnowledgeStore`, `GitHubDeviceFlow`, `TopK`, `SourceFetcher`, `IngestError`, `AppTab`, `ExtractedGraph`, `Identifiable`, `Observation`, `ArticleSummary`, `Conversation`, `.testEveryPromptFenceHoldsAgainstPoisone`, `Pipeline`, `ActionRequest`, `AppLockCoordinator`, `SecuritySettingsSection`, `PerfTrace`, `.extract()`, `.outcome()`, `Dependency`, `Digest`, `SmartWardIntents.swift`, `SearchDocument`, `IngestKit`, `.stored()`, `.parse()`, `RedirectPolicy`, `Anchor`, `StepProgress`?**
  _High betweenness centrality (0.054) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Project`, `ThemeNode`, `StrategyItemKind`, `StrategistRunner`, `.makeContainer()`, `SourceFetcher`, `SwiftData`, `Observation`, `ProjectLink`, `ShareViewController.swift`, `Message`, `Pipeline`, `GraphSnapshot`, `EmbeddingModel`, `RetrievedPassage`, `ThemeStrengthCache`, `SmartWardIntents.swift`, `SearchDocument`, `IngestKit`, `LibraryFixture`, `Anchor`, `FakeClock`?**
  _High betweenness centrality (0.046) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `Project`, `.importItems()`, `ThemeNode`, `.body`, `.makeContainer()`, `ArticleStage`, `ProjectArticlesTests`, `.clusters()`, `ConversationView`, `Conversation`, `ArticleReadoutController`, `.apply()`, `ProjectLink`, `ExtractionTier`, `ExtractionTiers`, `PipelineRunner`, `Message`, `ArticleSummaryCard`, `.displayPercent()`, `.fetch()`, `.load()`, `RetrievedPassage`, `ThemeStrengthCache`, `DigestBuilder`, `Scenario`, `Source`, `SearchDocument`, `.segments()`, `.makeFixture()`, `.save()`, `RetrievalFixture`, `ArticleReaderView`, `.article()`, `SearchController`, `FakeEmbedder`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Are the 31 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 31 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _364 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Project` be split into smaller, more focused modules?**
  _Cohesion score 0.07364185110663984 - nodes in this community are weakly interconnected._
# Graph Report - SmartWard  (2026-09-30)

## Corpus Check
- Large corpus: 179 files · ~695,858 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 3296 nodes · 8524 edges · 175 communities (169 shown, 6 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 987 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- GraphView
- String
- DailyBudget
- IngestError
- ModelFallback
- .process()
- StrategyItemKind
- StrategistRunner
- GitHubClient
- Source
- ProjectArticlesTests
- GitHubDeviceFlow
- SwiftData
- FetchURLTool
- .makeArticle()
- OnboardingProposal
- ExtractedGraph
- Project
- Sendable
- .body
- ArticleSummary
- SharedInbox
- InterestModel
- ConversationView
- .run()
- PipelineRunner
- OpenArticleTool
- ArticleReadoutController
- ExtractedArticle
- ExtractionTiers
- BYOKLLMKit
- .makeContainer()
- .dismiss()
- KnowledgeStore
- ThemeNode
- EmbeddingModel
- ArticleSummaryCard
- SourceFetcher
- BriefError
- Phase 5: Hardening
- CaseIterable
- Pipeline module (ingestion, graph, searc
- .parse()
- .fetch()
- RetrievedPassage
- .fetch()
- .outcome()
- Invariant D5: Private content never goes
- AppLockCoordinator
- Dependency
- ConversationMode
- ReferenceLedger
- .load()
- ActionRequest
- View
- Choice
- GraphRAG
- Article
- .article()
- PerfTrace
- HybridSearchIndex
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .segments()
- .seal()
- ReadoutPlayback
- ExtractionTier
- DigestBuilder
- Pipeline
- .fetchURL()
- SecuritySettingsSection
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- .makeFixture()
- Approval Before Actions
- Strategist Layer
- ShareModel
- .parse()
- GitHubAccount
- DigestCluster
- .plan()
- RetrievalFixture
- OnboardingView
- Kind
- IngestKit
- CodingKeys
- SmartWard (iOS Application Target)
- AppNavigation
- DigestSummaryRequest
- GraphIndexer
- SearchDocument
- PlaybackLLM
- BackupView
- AppLock.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- RedirectPolicy
- .projects()
- String
- AppLockController
- ArticleReaderView
- SourceKindOption
- AskStrategistIntent
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- Digest
- SourceKind
- StepProgress
- XCTestCase
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .render()
- SearchController
- LibraryFixture
- .refresh()
- DeveloperView
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- LocalizedError
- .importItems()
- LibraryArchive
- .fromPastedURL()
- .score()
- Anchor
- .clusters()
- String
- .messages()
- ProposeBriefUpdateTool
- SeededRandom
- AppLockTests.swift
- .canonicalize()
- graphify_pipeline.py
- Observation
- ArticleStage
- TopK
- FakeBiometrics
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- DigestController
- SmartWardIntents.swift
- ArchiveError
- .data()
- .graphML()
- Graph View
- SynthesizerDelegate
- UntrustedText (body/attribute inside its
- ActivitySheet
- StubTool
- VoiceSettingsSection
- FoundationModelsRelevanceJudge
- Living Project Brief
- .perform()
- PINOutcome
- ProviderKeyRow
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Status
- ArticleSummaryError
- Refused
- Apple Intelligence Preflight
- BYOKDigestSummarizer
- .displayPercent()
- Entry
- RobotsRules
- ReadoutScope
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 102 edges
2. `Article` - 95 edges
3. `SwiftData` - 86 edges
4. `Project` - 74 edges
5. `Source` - 60 edges
6. `ThemeNode` - 49 edges
7. `Pipeline` - 42 edges
8. `XCTest` - 41 edges
9. `Conversation` - 40 edges
10. `PipelineRunner` - 39 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.sourceLabel` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ArticleReaderView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (175 total, 6 thin omitted)

### Community 0 - "GraphView"
Cohesion: 0.05
Nodes (57): CGFloat, Color, Hashable, Edge, ForceLayout, GraphEditing, GraphSnapshot, Node (+49 more)

### Community 1 - "String"
Cohesion: 0.07
Nodes (33): ContextPolicy, Bool, Set, Chunk, Conversation, InterestProfile, Mention, MergeSuggestion (+25 more)

### Community 2 - "DailyBudget"
Cohesion: 0.06
Nodes (37): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+29 more)

### Community 3 - "IngestError"
Cohesion: 0.06
Nodes (34): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+26 more)

### Community 4 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 5 - ".process()"
Cohesion: 0.05
Nodes (36): App, BGContinuedProcessingTask, RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests (+28 more)

### Community 6 - "StrategyItemKind"
Cohesion: 0.09
Nodes (22): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Arguments (+14 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.11
Nodes (25): StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition, FailingTool, .asksForApproval (+17 more)

### Community 8 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 9 - "Source"
Cohesion: 0.10
Nodes (22): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+14 more)

### Community 10 - "ProjectArticlesTests"
Cohesion: 0.10
Nodes (26): Candidate, Match, .id, ProjectArticles, Date, Double, Int, ModelContext (+18 more)

### Community 11 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 12 - "SwiftData"
Cohesion: 0.10
Nodes (8): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security, SwiftData

### Community 13 - "FetchURLTool"
Cohesion: 0.10
Nodes (18): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, Arguments, FetchURLTool, .asksForApproval (+10 more)

### Community 14 - ".makeArticle()"
Cohesion: 0.15
Nodes (11): ArticleSummaryTests, IngestionSummaryTests, StubSummarizer, Bool, Int, LLMUsage, ModelContext, String (+3 more)

### Community 15 - "OnboardingProposal"
Cohesion: 0.09
Nodes (26): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+18 more)

### Community 16 - "ExtractedGraph"
Cohesion: 0.12
Nodes (20): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, Relation (+12 more)

### Community 17 - "Project"
Cohesion: 0.16
Nodes (16): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+8 more)

### Community 18 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 19 - ".body"
Cohesion: 0.09
Nodes (26): BriefController, BriefEditorView, .body, BriefHistoryView, .body, BriefOrigin, BriefSection, .body (+18 more)

### Community 20 - "ArticleSummary"
Cohesion: 0.11
Nodes (20): Decoder, ArticleSummary, .isEmpty, CodingKeys, about, evidence, matters, remember (+12 more)

### Community 21 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 22 - "InterestModel"
Cohesion: 0.13
Nodes (20): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+12 more)

### Community 23 - "ConversationView"
Cohesion: 0.10
Nodes (20): ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus, .voiceStatusText (+12 more)

### Community 24 - ".run()"
Cohesion: 0.13
Nodes (19): CheckedContinuation, Never, ApprovalDecision, approve, ask, decline, ChatController, .autoApproveEnabled (+11 more)

### Community 25 - "PipelineRunner"
Cohesion: 0.16
Nodes (15): FullTextFetching, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+7 more)

### Community 26 - "OpenArticleTool"
Cohesion: 0.13
Nodes (19): Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval, .definition, SearchCorpusTool (+11 more)

### Community 27 - "ArticleReadoutController"
Cohesion: 0.14
Nodes (13): MPRemoteCommand, NSObjectProtocol, ObjectIdentifier, .readoutBar, ArticleReadoutController, .currentAnchor, .isActive, .isPaused (+5 more)

### Community 28 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, Bool (+3 more)

### Community 29 - "ExtractionTiers"
Cohesion: 0.12
Nodes (18): ExtractionTiers, BudgetTests, Double, ModelContext, String, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 30 - "BYOKLLMKit"
Cohesion: 0.14
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 31 - ".makeContainer()"
Cohesion: 0.12
Nodes (17): KnowledgeSchema, .schema, Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext (+9 more)

### Community 32 - ".dismiss()"
Cohesion: 0.10
Nodes (22): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+14 more)

### Community 33 - "KnowledgeStore"
Cohesion: 0.14
Nodes (5): GraphKit, KnowledgeStore, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 34 - "ThemeNode"
Cohesion: 0.15
Nodes (14): EntityAlias, Data, ThemeNode, GraphEditingTests, Date, Connection, .id, MergeReviewView (+6 more)

### Community 35 - "EmbeddingModel"
Cohesion: 0.17
Nodes (12): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+4 more)

### Community 36 - "ArticleSummaryCard"
Cohesion: 0.12
Nodes (17): ArticleSummaryCard, .body, .state, .status, String, ArticleSummaryController, FoundationModelsArticleSummarizer, State (+9 more)

### Community 37 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 38 - "BriefError"
Cohesion: 0.12
Nodes (18): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+10 more)

### Community 39 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 40 - "CaseIterable"
Cohesion: 0.09
Nodes (23): CaseIterable, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, .status (+15 more)

### Community 41 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 42 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 43 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 44 - "RetrievedPassage"
Cohesion: 0.16
Nodes (14): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+6 more)

### Community 45 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 46 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 47 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 48 - "AppLockCoordinator"
Cohesion: 0.18
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, PINAttemptResult, String, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 49 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 50 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 51 - "ReferenceLedger"
Cohesion: 0.16
Nodes (14): ReferenceLedger, Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue (+6 more)

### Community 52 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 53 - "ActionRequest"
Cohesion: 0.16
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 54 - "View"
Cohesion: 0.14
Nodes (19): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+11 more)

### Community 55 - "Choice"
Cohesion: 0.11
Nodes (19): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+11 more)

### Community 56 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 57 - "Article"
Cohesion: 0.13
Nodes (19): Article, ThemesRow, .nodes, ArticleRow, .body, .content, .relevancePercent, ReadingView (+11 more)

### Community 58 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 59 - "PerfTrace"
Cohesion: 0.19
Nodes (13): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+5 more)

### Community 60 - "HybridSearchIndex"
Cohesion: 0.20
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, IncrementalIndexTests, Int (+2 more)

### Community 61 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 62 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 63 - ".segments()"
Cohesion: 0.23
Nodes (8): Locale, Array, ArticleReadout, Builder, .current, ReadoutSegment, String, TimeZone

### Community 64 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 65 - "ReadoutPlayback"
Cohesion: 0.25
Nodes (5): ReadoutPlayback, .isActive, .position, Bool, ReadoutPlaybackTests

### Community 66 - "ExtractionTier"
Cohesion: 0.16
Nodes (11): ArticleSummarizer, ArticleSummarizing, Bool, Date, ModelContext, UUID, ExtractionTier, byok (+3 more)

### Community 67 - "DigestBuilder"
Cohesion: 0.18
Nodes (11): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date (+3 more)

### Community 69 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 70 - "SecuritySettingsSection"
Cohesion: 0.12
Nodes (15): LockScreen, PrivacyCover, .body, SecuritySettingsSection, .lockBinding, .toggleTitle, Binding, Bool (+7 more)

### Community 71 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 72 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 73 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 74 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 75 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 76 - ".makeFixture()"
Cohesion: 0.25
Nodes (6): ArticleReadoutTests, Fixture, Bool, Int, ModelContainer, String

### Community 77 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 78 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 79 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 80 - ".parse()"
Cohesion: 0.19
Nodes (7): NSRegularExpression, ArticleSummaryPrompt, .schema, JSONValue, ArticleSummaryText, String, ArticleSummaryTextTests

### Community 81 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 82 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 83 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 84 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 85 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 86 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 87 - "IngestKit"
Cohesion: 0.14
Nodes (4): BackgroundTasks, IngestKit, ShareInbox, GitHubConfig

### Community 88 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 89 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 90 - "AppNavigation"
Cohesion: 0.16
Nodes (10): NavigationPath, AppNavigation, AppTab, chat, graph, projects, reading, today (+2 more)

### Community 91 - "DigestSummaryRequest"
Cohesion: 0.25
Nodes (6): DigestSummary, DigestSummaryRequest, Excerpt, LLMUsage, String, FoundationModelsDigestSummarizer

### Community 92 - "GraphIndexer"
Cohesion: 0.22
Nodes (8): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String

### Community 93 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 94 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 95 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 96 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 97 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 98 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 99 - "RedirectPolicy"
Cohesion: 0.18
Nodes (10): PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest, URLSession (+2 more)

### Community 100 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 101 - "String"
Cohesion: 0.29
Nodes (7): ArticleSummaryOutput, BYOKArticleSummarizer, LLMCompleting, LLMProvider, LLMRequest, LLMUsage, String

### Community 102 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 103 - "ArticleReaderView"
Cohesion: 0.19
Nodes (10): ArticleReaderView, .body, .fullTextBanner, .metadata, .originalURL, .paragraphs, .sourceLabel, Bool (+2 more)

### Community 104 - "SourceKindOption"
Cohesion: 0.15
Nodes (13): AppEnum, IntentFailure, .errorDescription, libraryUnavailable, noProvider, SourceKindOption, arxiv, feed (+5 more)

### Community 105 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary (+5 more)

### Community 106 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 107 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 108 - "Digest"
Cohesion: 0.27
Nodes (10): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body (+2 more)

### Community 109 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 110 - "StepProgress"
Cohesion: 0.19
Nodes (9): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body (+1 more)

### Community 111 - "XCTestCase"
Cohesion: 0.15
Nodes (8): CanonicalURLTests, PublicHostTests, AddSourceToolTests, PerfTraceTests, SampleLibraryTests, GraphExportTests, TopKTests, XCTestCase

### Community 112 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 113 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 114 - ".render()"
Cohesion: 0.29
Nodes (4): DigestPrompt, ReferenceContext, String, UntrustedText

### Community 115 - "SearchController"
Cohesion: 0.27
Nodes (7): SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID

### Community 116 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 117 - ".refresh()"
Cohesion: 0.30
Nodes (9): IngestController, Bool, Int, ModelContext, Set, String, UUID, Void (+1 more)

### Community 118 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 119 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 120 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 121 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 122 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 123 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 124 - "LocalizedError"
Cohesion: 0.18
Nodes (11): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+3 more)

### Community 125 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 126 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 128 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 129 - "Anchor"
Cohesion: 0.18
Nodes (10): Anchor, details, note, paragraph, relevance, summary, themes, title (+2 more)

### Community 130 - ".clusters()"
Cohesion: 0.31
Nodes (6): Group, Bool, Int, UUID, UnionFind, .body

### Community 131 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 132 - ".messages()"
Cohesion: 0.29
Nodes (6): ConversationHistory, Int, LLMChatMessage, ConversationHistoryTests, String, TimeInterval

### Community 133 - "ProposeBriefUpdateTool"
Cohesion: 0.20
Nodes (9): ProjectStateTool, .asksForApproval, .definition, ProposeBriefUpdateTool, .asksForApproval, .definition, Bool, LLMTool (+1 more)

### Community 134 - "SeededRandom"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 135 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 136 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 137 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 138 - "Observation"
Cohesion: 0.24
Nodes (3): FoundationModels, Observation, UserNotifications

### Community 139 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 140 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 141 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

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

### Community 146 - "DigestController"
Cohesion: 0.25
Nodes (7): DigestController, .notificationsEnabled, Bool, String, TimeInterval, DigestSettingsSection, .body

### Community 147 - "SmartWardIntents.swift"
Cohesion: 0.32
Nodes (4): AppIntents, AVFoundation, MediaPlayer, VoiceLoopKit

### Community 148 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 149 - ".data()"
Cohesion: 0.43
Nodes (4): Data, Float, VectorCoding, VectorCodingTests

### Community 150 - ".graphML()"
Cohesion: 0.39
Nodes (5): GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 151 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 152 - "SynthesizerDelegate"
Cohesion: 0.29
Nodes (6): AVSpeechSynthesizer, AVSpeechSynthesizerDelegate, AVSpeechUtterance, NSObject, Void, SynthesizerDelegate

### Community 153 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 154 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Context, ActivitySheet, Any, UIActivityViewController, UIViewControllerRepresentable

### Community 155 - "StubTool"
Cohesion: 0.33
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 156 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 157 - "FoundationModelsRelevanceJudge"
Cohesion: 0.33
Nodes (6): FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 158 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 159 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 160 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 161 - "ProviderKeyRow"
Cohesion: 0.33
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 162 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 163 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 164 - "Status"
Cohesion: 0.40
Nodes (5): Status, finished, idle, paused, playing

### Community 165 - "ArticleSummaryError"
Cohesion: 0.40
Nodes (5): ArticleSummaryError, declined, empty, .errorDescription, tooShort

### Community 166 - "Refused"
Cohesion: 0.40
Nodes (4): Refused, device, provider, Error

### Community 167 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 168 - "BYOKDigestSummarizer"
Cohesion: 0.83
Nodes (3): BYOKDigestSummarizer, LLMCompleting, LLMProvider

### Community 170 - "Entry"
Cohesion: 0.83
Nodes (3): Entry, Date, String

### Community 172 - "ReadoutScope"
Cohesion: 0.67
Nodes (3): ReadoutScope, summaryOnly, whole

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **365 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+360 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 708 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **6 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `GraphView`, `String`, `ThemeNode`, `EmbeddingModel`, `Pipeline`, `SourceFetcher`, `StrategistRunner`, `Observation`, `SwiftData`, `RetrievedPassage`, `SmartWardIntents.swift`, `IngestKit`, `GraphIndexer`, `SearchDocument`, `BYOKLLMKit`, `.segments()`?**
  _High betweenness centrality (0.052) - this node is a cross-community bridge._
- **Why does `Foundation` connect `SwiftData` to `.score()`, `String`, `DailyBudget`, `IngestError`, `.process()`, `AppLockTests.swift`, `GitHubClient`, `.canonicalize()`, `Observation`, `GitHubDeviceFlow`, `TopK`, `ExtractedGraph`, `SmartWardIntents.swift`, `ArticleSummary`, `SharedInbox`, `ExtractedArticle`, `BYOKLLMKit`, `KnowledgeStore`, `SourceFetcher`, `.parse()`, `.outcome()`, `Dependency`, `PerfTrace`, `.segments()`, `.parse()`, `IngestKit`, `AppLock.swift`, `RedirectPolicy`, `StepProgress`, `.render()`?**
  _High betweenness centrality (0.050) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `GraphView`, `String`, `.clusters()`, `Source`, `ProjectArticlesTests`, `ArticleStage`, `.makeArticle()`, `ArticleSummary`, `ConversationView`, `PipelineRunner`, `ArticleReadoutController`, `ExtractedArticle`, `ExtractionTiers`, `.makeContainer()`, `.dismiss()`, `ThemeNode`, `EmbeddingModel`, `ArticleSummaryCard`, `.displayPercent()`, `.fetch()`, `RetrievedPassage`, `ReferenceLedger`, `.load()`, `.article()`, `.segments()`, `ExtractionTier`, `.makeFixture()`, `DigestCluster`, `RetrievalFixture`, `AppNavigation`, `DigestSummaryRequest`, `SearchDocument`, `ArticleReaderView`, `SearchController`, `.refresh()`, `FakeEmbedder`, `.importItems()`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Are the 31 inferred relationships involving `Article` (e.g. with `.apply()` and `.importItems()`) actually correct?**
  _`Article` has 31 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _365 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `GraphView` be split into smaller, more focused modules?**
  _Cohesion score 0.05322947095098994 - nodes in this community are weakly interconnected._
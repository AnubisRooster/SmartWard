# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 167 files · ~624,345 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2950 nodes · 7571 edges · 162 communities (160 shown, 2 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 897 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- HybridSearchIndex
- ActionRequest
- ModelFallback
- DailyBudget
- LibraryFixture
- View
- XCTestCase
- String
- RefreshEagerness
- SharedInbox
- GitHubClient
- Source
- GitHubDeviceFlow
- Project
- ThemeNode
- SwiftData
- ExtractedGraph
- BYOKLLMKit
- Sendable
- ExtractedArticle
- StrategyItemKind
- RetrievalFixture
- SourceKind
- .makeContainer()
- XCTest
- ConversationView
- OnboardingProposal
- GraphSnapshot
- GitHubRepoPicker
- .process()
- .outcome()
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- KnowledgeStore
- .fetch()
- ProjectToolError
- .load()
- InterestModel
- .fetch()
- Invariant D5: Private content never goes
- .parse()
- Dependency
- ReferenceLedger
- GraphRAG
- Article
- SourceFetcher
- ConversationMode
- FakeExtractor
- PipelineRunner
- BriefError
- BriefViews.swift
- PerfTrace
- .fetchURL()
- ProjectLink
- EmbeddingModel
- RecordStrategyItemTool
- Scenario
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- DigestSummaryRequest
- DigestBuilder
- RedirectPolicy
- GraphIndexer
- AppLockCoordinator
- CaseIterable
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- .decode()
- Approval Before Actions
- AskStrategistIntent
- Strategist Layer
- .refresh()
- ShareModel
- GitHubAccount
- DigestCluster
- ThemeStrengthCache
- OnboardingView
- Kind
- GraphCanvas
- CodingKeys
- SmartWard (iOS Application Target)
- .stored()
- LibraryArchive
- .messages()
- PlaybackLLM
- BackupView
- ProviderModelController
- .canonicalize()
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .article()
- Choice
- SmartWardIntents.swift
- .run()
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- AppLockController
- .buildIfDue()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GraphView
- FakePIN
- StepProgress
- FakeClock
- OnboardingReviewView
- DeveloperView
- ProjectEntity
- AppLockTests.swift
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- RobotsRules
- IngestError
- .score()
- .decision()
- .clusters()
- .render()
- Turn
- ThemeDetailView
- graphify_pipeline.py
- Digest
- ArticleStage
- AddSourceTool
- TopK
- FakeBiometrics
- FoundationModelsEntityExtractor
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .graphML()
- AppTab
- AvailableModelsView
- AddSourceView
- SourceKindOption
- .send()
- ArchiveError
- Graph View
- .body
- ArticleReaderView
- ActivitySheet
- UntrustedText (body/attribute inside its
- .availability()
- PolitenessGate
- RetrievedPassage
- .seed()
- .vector()
- Living Project Brief
- EncryptedBackup.swift
- .perform()
- PINOutcome
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .library()
- Apple Intelligence Preflight
- KnowledgeSchema
- ApprovalDecision
- AppStore
- IntentFailure
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 90 edges
2. `SwiftData` - 77 edges
3. `Article` - 69 edges
4. `Project` - 68 edges
5. `Source` - 56 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `XCTest` - 38 edges
9. `BYOKLLMKit` - 35 edges
10. `PipelineRunner` - 35 edges

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

## Communities (162 total, 2 thin omitted)

### Community 0 - "HybridSearchIndex"
Cohesion: 0.05
Nodes (48): EmbeddingProviding, OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, LexicalIndex, .count (+40 more)

### Community 1 - "ActionRequest"
Cohesion: 0.07
Nodes (41): ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished (+33 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 4 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 5 - "View"
Cohesion: 0.06
Nodes (41): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen, PrivacyCover (+33 more)

### Community 6 - "XCTestCase"
Cohesion: 0.08
Nodes (17): ContextPolicy, Bool, Conversation, Message, ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests (+9 more)

### Community 7 - "String"
Cohesion: 0.12
Nodes (25): Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, ReadingSignal, StrategyItem, .status (+17 more)

### Community 8 - "RefreshEagerness"
Cohesion: 0.06
Nodes (29): App, BGContinuedProcessingTask, RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests (+21 more)

### Community 9 - "SharedInbox"
Cohesion: 0.09
Nodes (22): JSONDecoder, JSONEncoder, Result, SharedImport, Date, Int, ModelContext, SharedInbox (+14 more)

### Community 10 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 11 - "Source"
Cohesion: 0.11
Nodes (22): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+14 more)

### Community 12 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 13 - "Project"
Cohesion: 0.15
Nodes (14): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+6 more)

### Community 14 - "ThemeNode"
Cohesion: 0.13
Nodes (13): ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID (+5 more)

### Community 15 - "SwiftData"
Cohesion: 0.11
Nodes (6): Accelerate, Foundation, NaturalLanguage, RetrievalKit, GitHubConfig, SwiftData

### Community 16 - "ExtractedGraph"
Cohesion: 0.12
Nodes (18): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, ExtractionTiers (+10 more)

### Community 17 - "BYOKLLMKit"
Cohesion: 0.11
Nodes (6): BYOKLLMKit, FoundationModels, ModelCatalogKit, Observation, StrategistCore, UserNotifications

### Community 18 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 19 - "ExtractedArticle"
Cohesion: 0.13
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 20 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 21 - "RetrievalFixture"
Cohesion: 0.12
Nodes (17): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+9 more)

### Community 22 - "SourceKind"
Cohesion: 0.11
Nodes (24): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+16 more)

### Community 23 - ".makeContainer()"
Cohesion: 0.13
Nodes (12): Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests (+4 more)

### Community 24 - "XCTest"
Cohesion: 0.13
Nodes (5): BackgroundTasks, IngestKit, Pipeline, ShareInbox, XCTest

### Community 25 - "ConversationView"
Cohesion: 0.11
Nodes (19): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+11 more)

### Community 26 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 27 - "GraphSnapshot"
Cohesion: 0.19
Nodes (17): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+9 more)

### Community 28 - "GitHubRepoPicker"
Cohesion: 0.10
Nodes (20): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+12 more)

### Community 29 - ".process()"
Cohesion: 0.11
Nodes (17): RelevanceJudging, Triage, .body, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, Int (+9 more)

### Community 30 - ".outcome()"
Cohesion: 0.13
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 31 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 32 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 33 - "KnowledgeStore"
Cohesion: 0.15
Nodes (5): GraphKit, KnowledgeStore, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 34 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 35 - "ProjectToolError"
Cohesion: 0.17
Nodes (15): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, SearchCorpusTool, .definition, JSONValue (+7 more)

### Community 36 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 37 - "InterestModel"
Cohesion: 0.17
Nodes (14): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+6 more)

### Community 38 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 39 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 40 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 41 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 42 - "ReferenceLedger"
Cohesion: 0.18
Nodes (8): FetchURLTool, .definition, Bool, URL, FullTextFetching, URL, ReferenceLedger, FetchURLToolTests

### Community 43 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 44 - "Article"
Cohesion: 0.14
Nodes (17): Article, Int, ArticleRow, .body, .content, .relevancePercent, ReadingView, .activity (+9 more)

### Community 45 - "SourceFetcher"
Cohesion: 0.23
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 46 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 47 - "FakeExtractor"
Cohesion: 0.14
Nodes (15): ExtractionTier, byok, onDevice, FakeSummarizer, LLMUsage, FakeCompletion, FakeExtractor, AsyncThrowingStream (+7 more)

### Community 48 - "PipelineRunner"
Cohesion: 0.22
Nodes (11): PipelineRunner, Report, Bool, Date, Double, Int, ModelContext, Set (+3 more)

### Community 49 - "BriefError"
Cohesion: 0.13
Nodes (16): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+8 more)

### Community 50 - "BriefViews.swift"
Cohesion: 0.17
Nodes (15): BriefController, BriefEditorView, .body, BriefHistoryView, .body, BriefOrigin, BriefReviewView, .body (+7 more)

### Community 51 - "PerfTrace"
Cohesion: 0.18
Nodes (12): DispatchTime, os, PerfTrace, .names, .samples, Sample, Date, Double (+4 more)

### Community 52 - ".fetchURL()"
Cohesion: 0.23
Nodes (7): SourceEndpoint, String, URL, SourceEndpointTests, String, URL, AddSourceToolTests

### Community 53 - "ProjectLink"
Cohesion: 0.17
Nodes (9): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+1 more)

### Community 54 - "EmbeddingModel"
Cohesion: 0.17
Nodes (11): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ArticleIndexer, ModelContext (+3 more)

### Community 55 - "RecordStrategyItemTool"
Cohesion: 0.17
Nodes (11): Arguments, ProjectStateTool, .definition, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue, LLMTool (+3 more)

### Community 56 - "Scenario"
Cohesion: 0.18
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 57 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 58 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 59 - "DigestSummaryRequest"
Cohesion: 0.20
Nodes (10): BYOKDigestSummarizer, DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage (+2 more)

### Community 60 - "DigestBuilder"
Cohesion: 0.19
Nodes (10): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date (+2 more)

### Community 61 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 62 - "GraphIndexer"
Cohesion: 0.20
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 63 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AnyObject, AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricService, BiometricUnlocking, PINService, PINVerifying (+2 more)

### Community 64 - "CaseIterable"
Cohesion: 0.12
Nodes (17): CaseIterable, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Filter (+9 more)

### Community 65 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 66 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 67 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 68 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 69 - ".decode()"
Cohesion: 0.15
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 70 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 71 - "AskStrategistIntent"
Cohesion: 0.18
Nodes (16): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, Summary, Int, ParameterSummary (+8 more)

### Community 72 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 73 - ".refresh()"
Cohesion: 0.21
Nodes (13): LocalizedError, FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext (+5 more)

### Community 74 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 75 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 76 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 77 - "ThemeStrengthCache"
Cohesion: 0.28
Nodes (10): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+2 more)

### Community 78 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 79 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 80 - "GraphCanvas"
Cohesion: 0.19
Nodes (12): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 81 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 82 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 83 - ".stored()"
Cohesion: 0.23
Nodes (5): SourceHealth, Error, String, SourceHealthTests, .body

### Community 84 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 85 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 86 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 87 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 88 - "ProviderModelController"
Cohesion: 0.34
Nodes (7): CatalogCache, ProviderModelController, CatalogEntry, Date, LLMProvider, Set, String

### Community 89 - ".canonicalize()"
Cohesion: 0.18
Nodes (9): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL (+1 more)

### Community 90 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 91 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 92 - ".article()"
Cohesion: 0.32
Nodes (5): FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 93 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 94 - "SmartWardIntents.swift"
Cohesion: 0.19
Nodes (9): AppIntents, AVFoundation, AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig (+1 more)

### Community 95 - ".run()"
Cohesion: 0.32
Nodes (7): CheckedContinuation, Never, ChatController, .autoApproveEnabled, LLMCompleting, ModelContext, String

### Community 96 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 97 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 98 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 99 - ".buildIfDue()"
Cohesion: 0.22
Nodes (9): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, TodayView, .body (+1 more)

### Community 100 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 101 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 102 - "GraphView"
Cohesion: 0.26
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 103 - "FakePIN"
Cohesion: 0.27
Nodes (5): BiometricResult, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 104 - "StepProgress"
Cohesion: 0.21
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 105 - "FakeClock"
Cohesion: 0.36
Nodes (4): FakeClock, PolitenessGateTests, Date, TimeInterval

### Community 106 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 107 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 108 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 109 - "AppLockTests.swift"
Cohesion: 0.24
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 110 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 111 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 112 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 113 - "RobotsRules"
Cohesion: 0.35
Nodes (5): RobotsRules, Rule, Bool, String, RobotsRulesTests

### Community 114 - "IngestError"
Cohesion: 0.18
Nodes (11): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+3 more)

### Community 115 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 116 - ".decision()"
Cohesion: 0.29
Nodes (5): ActionTools, Arguments, Set, String, ApprovalPolicyTests

### Community 117 - ".clusters()"
Cohesion: 0.31
Nodes (6): Group, Bool, Int, UUID, UnionFind, .body

### Community 118 - ".render()"
Cohesion: 0.29
Nodes (4): ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 119 - "Turn"
Cohesion: 0.25
Nodes (7): Bool, LLMProvider, Turn, .isHandsFree, spoken, typed, unattended

### Community 120 - "ThemeDetailView"
Cohesion: 0.27
Nodes (9): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions (+1 more)

### Community 121 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 122 - "Digest"
Cohesion: 0.31
Nodes (8): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body

### Community 123 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 124 - "AddSourceTool"
Cohesion: 0.31
Nodes (6): AddSourceTool, .definition, .kinds, JSONValue, LLMTool, ModelContext

### Community 125 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 126 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 127 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 128 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 129 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 130 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 131 - ".graphML()"
Cohesion: 0.33
Nodes (6): GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 132 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 133 - "AvailableModelsView"
Cohesion: 0.33
Nodes (6): .modelField, AvailableModelsView, .body, .providersWithKeys, LLMProvider, Bool

### Community 134 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 135 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 136 - ".send()"
Cohesion: 0.46
Nodes (5): Data, HTTPURLResponse, URL, URLRequest, .now

### Community 137 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 138 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 139 - ".body"
Cohesion: 0.32
Nodes (5): LockWindow, Bool, .body, UIWindow, UIWindowScene

### Community 140 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 141 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 142 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 143 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 144 - "PolitenessGate"
Cohesion: 0.33
Nodes (6): PolitenessGate, async, Date, Int, TimeInterval, Void

### Community 145 - "RetrievedPassage"
Cohesion: 0.62
Nodes (3): RetrievedPassage, SourcesList, .body

### Community 146 - ".seed()"
Cohesion: 0.38
Nodes (4): BudgetTests, Double, ModelContext, String

### Community 147 - ".vector()"
Cohesion: 0.43
Nodes (4): FixedJudge, Bool, Float, String

### Community 148 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 149 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 150 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 151 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 152 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 153 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 154 - ".library()"
Cohesion: 0.50
Nodes (3): ModelContainer, ModelContext, ThemeStrengthCacheTests

### Community 155 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 156 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 157 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 158 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 159 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **311 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+306 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 609 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **2 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `ActionRequest`, `DailyBudget`, `XCTestCase`, `String`, `RefreshEagerness`, `SharedInbox`, `GitHubClient`, `GitHubDeviceFlow`, `Project`, `ExtractedGraph`, `BYOKLLMKit`, `ExtractedArticle`, `StrategyItemKind`, `EncryptedBackup.swift`, `XCTest`, `.outcome()`, `KnowledgeStore`, `.parse()`, `Dependency`, `SourceFetcher`, `PerfTrace`, `ProjectLink`, `RedirectPolicy`, `AppLockCoordinator`, `.stored()`, `.canonicalize()`, `SmartWardIntents.swift`, `StepProgress`, `AppLockTests.swift`, `RobotsRules`, `.score()`, `.render()`, `TopK`?**
  _High betweenness centrality (0.052) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `HybridSearchIndex`, `ActionRequest`, `XCTestCase`, `SourceFetcher`, `ThemeNode`, `SwiftData`, `Project`, `BYOKLLMKit`, `BriefViews.swift`, `StrategyItemKind`, `RetrievalFixture`, `EncryptedBackup.swift`, `XCTest`, `SmartWardIntents.swift`, `.library()`, `GraphSnapshot`, `GraphIndexer`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `HybridSearchIndex`, `View`, `XCTestCase`, `String`, `SharedInbox`, `Source`, `ArticleReaderView`, `ThemeNode`, `RetrievedPassage`, `.seed()`, `RetrievalFixture`, `.makeContainer()`, `.library()`, `.fetch()`, `.load()`, `PipelineRunner`, `EmbeddingModel`, `Scenario`, `DigestBuilder`, `GraphIndexer`, `.refresh()`, `DigestCluster`, `.article()`, `.clusters()`, `ArticleStage`?**
  _High betweenness centrality (0.039) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _311 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `HybridSearchIndex` be split into smaller, more focused modules?**
  _Cohesion score 0.05239240844693932 - nodes in this community are weakly interconnected._
- **Should `ActionRequest` be split into smaller, more focused modules?**
  _Cohesion score 0.06971153846153846 - nodes in this community are weakly interconnected._
# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 161 files · ~613,312 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2885 nodes · 7407 edges · 151 communities (146 shown, 5 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 885 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Sendable
- Digest
- IngestError
- ModelFallback
- DailyBudget
- String
- GitHubClient
- BriefViews.swift
- FetchURLTool
- GitHubDeviceFlow
- StrategistRunner
- KnowledgeStore
- StrategyItemKind
- Project
- ReferenceLedger
- .messages()
- RetrievedPassage
- .makeContainer()
- InterestModel
- ExtractionTiers
- RetrievalFixture
- ExtractedArticle
- .process()
- Source
- PipelineRunner
- GitHubRepoPicker
- .run()
- Foundation
- SwiftData
- RawItem
- Conversation
- ThemeNode
- BYOKLLMKit
- SourceKind
- PerfTrace
- EntityResolver
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- Identifiable
- HybridSearchIndex
- AppLockCoordinator
- .parse()
- .fetch()
- .fetchURL()
- Chunk
- RecordStrategyItemTool
- .fetch()
- .outcome()
- Choice
- Invariant D5: Private content never goes
- .score()
- Dependency
- EmbeddingModel
- ExtractedGraph
- .load()
- ActionRequest
- GraphRAG
- ThemeStrengthCache
- SecuritySettingsSection
- .article()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- Scenario
- SourceFetcher
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- GitHubError
- .plan()
- Approval Before Actions
- View
- Strategist Layer
- ShareModel
- GitHubAccount
- .save()
- SearchHit
- OnboardingView
- Kind
- GraphCanvas
- CodingKeys
- SmartWard (iOS Application Target)
- FakeEmbedder
- LocalizedError
- SearchDocument
- PlaybackLLM
- BackupView
- AppLock.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .projects()
- GraphSnapshot
- .build()
- RefreshEagerness
- SmartWard XcodeGen Project Spec
- AppLockController
- AskStrategistIntent
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GraphView
- LibraryFixture
- DeveloperView
- FakePIN
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- XCTestCase
- .importItems()
- LibraryArchive
- .fromPastedURL()
- String
- SeededRandom
- SourceKindOption
- graphify_pipeline.py
- AppLockPolicy
- ArticleStage
- .testEveryPromptFenceHoldsAgainstPoisone
- TopK
- FakeBiometrics
- FoundationModelsEntityExtractor
- ProjectEntity
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- AppTab
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- RepoSync.swift
- .init()
- .update()
- FoundationModelsRelevanceJudge
- ProviderKeyRow
- SmartWardIntents.swift
- Living Project Brief
- .perform()
- BriefRevisionStatus
- BackgroundWork.swift
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- KnowledgeSchema
- Apple Intelligence Preflight
- AppStore
- .importPending()
- SharedInboxTests
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 90 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 68 edges
5. `Source` - 54 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `BYOKLLMKit` - 35 edges
9. `XCTest` - 35 edges
10. `LibraryArchive` - 34 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (151 total, 5 thin omitted)

### Community 0 - "Sendable"
Cohesion: 0.06
Nodes (75): Codable, Equatable, ArticleRef, DigestCluster, ProjectRef, Double, Int, String (+67 more)

### Community 1 - "Digest"
Cohesion: 0.06
Nodes (45): Digest, .clusters, Bool, Date, BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing (+37 more)

### Community 2 - "IngestError"
Cohesion: 0.06
Nodes (41): NSObject, IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL (+33 more)

### Community 3 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 4 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 5 - "String"
Cohesion: 0.11
Nodes (21): Set, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ProjectLink, .kind (+13 more)

### Community 6 - "GitHubClient"
Cohesion: 0.11
Nodes (18): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool (+10 more)

### Community 7 - "BriefViews.swift"
Cohesion: 0.08
Nodes (30): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+22 more)

### Community 8 - "FetchURLTool"
Cohesion: 0.09
Nodes (21): ActionTools, AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool (+13 more)

### Community 9 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 10 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 11 - "KnowledgeStore"
Cohesion: 0.13
Nodes (6): Accelerate, IngestKit, KnowledgeStore, Pipeline, RetrievalKit, XCTest

### Community 12 - "StrategyItemKind"
Cohesion: 0.10
Nodes (22): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+14 more)

### Community 13 - "Project"
Cohesion: 0.16
Nodes (16): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+8 more)

### Community 14 - "ReferenceLedger"
Cohesion: 0.14
Nodes (15): ReferenceContext, Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool (+7 more)

### Community 15 - ".messages()"
Cohesion: 0.09
Nodes (16): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+8 more)

### Community 16 - "RetrievedPassage"
Cohesion: 0.11
Nodes (21): RetrievedPassage, ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 17 - ".makeContainer()"
Cohesion: 0.12
Nodes (19): Bool, ModelContainer, Article, ThemeEdge, GraphEditingTests, GraphSnapshotTests, Date, ArticleRow (+11 more)

### Community 18 - "InterestModel"
Cohesion: 0.13
Nodes (20): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+12 more)

### Community 19 - "ExtractionTiers"
Cohesion: 0.11
Nodes (19): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, BudgetTests, Double, ModelContext (+11 more)

### Community 20 - "RetrievalFixture"
Cohesion: 0.12
Nodes (17): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+9 more)

### Community 21 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 22 - ".process()"
Cohesion: 0.10
Nodes (16): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, TimeInterval (+8 more)

### Community 23 - "Source"
Cohesion: 0.13
Nodes (19): Bool, Source, IngestController, Bool, ModelContext, Set, String, UUID (+11 more)

### Community 24 - "PipelineRunner"
Cohesion: 0.15
Nodes (14): PipelineRunner, .stages, Report, Bool, Date, Double, ModelContext, Set (+6 more)

### Community 25 - "GitHubRepoPicker"
Cohesion: 0.09
Nodes (22): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+14 more)

### Community 26 - ".run()"
Cohesion: 0.17
Nodes (15): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+7 more)

### Community 27 - "Foundation"
Cohesion: 0.10
Nodes (5): Foundation, NaturalLanguage, Observation, GitHubConfig, UserNotifications

### Community 28 - "SwiftData"
Cohesion: 0.15
Nodes (5): FoundationModels, SwiftData, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 29 - "RawItem"
Cohesion: 0.16
Nodes (12): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+4 more)

### Community 30 - "Conversation"
Cohesion: 0.12
Nodes (20): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+12 more)

### Community 31 - "ThemeNode"
Cohesion: 0.14
Nodes (15): ThemeNode, EntityResolverTests, ThemesRow, .nodes, Connection, .id, MergeReviewView, .body (+7 more)

### Community 32 - "BYOKLLMKit"
Cohesion: 0.13
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 33 - "SourceKind"
Cohesion: 0.09
Nodes (24): CaseIterable, .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn (+16 more)

### Community 34 - "PerfTrace"
Cohesion: 0.14
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 35 - "EntityResolver"
Cohesion: 0.18
Nodes (11): Data, Float, VectorCoding, EntityResolver, Resolution, Bool, Float, ModelContext (+3 more)

### Community 36 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 37 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 38 - "Identifiable"
Cohesion: 0.17
Nodes (12): Identifiable, JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject (+4 more)

### Community 39 - "HybridSearchIndex"
Cohesion: 0.17
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+4 more)

### Community 40 - "AppLockCoordinator"
Cohesion: 0.13
Nodes (15): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, PINOutcome, incorrect (+7 more)

### Community 41 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 42 - ".fetch()"
Cohesion: 0.19
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 43 - ".fetchURL()"
Cohesion: 0.20
Nodes (8): SourceEndpoint, Bool, HTTPURLResponse, String, URL, SourceEndpointTests, String, URL

### Community 44 - "Chunk"
Cohesion: 0.15
Nodes (9): ContextPolicy, Bool, Chunk, Data, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer (+1 more)

### Community 45 - "RecordStrategyItemTool"
Cohesion: 0.15
Nodes (12): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue (+4 more)

### Community 46 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 47 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 48 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 49 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 50 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 51 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 52 - "EmbeddingModel"
Cohesion: 0.16
Nodes (12): EmbeddingModel, EmbeddingProviding, String, GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date (+4 more)

### Community 53 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 54 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 55 - "ActionRequest"
Cohesion: 0.16
Nodes (17): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+9 more)

### Community 56 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 57 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 58 - "SecuritySettingsSection"
Cohesion: 0.13
Nodes (19): PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding, .toggleTitle (+11 more)

### Community 59 - ".article()"
Cohesion: 0.19
Nodes (9): ArticleIndexer, Int, FakeFullText, FixedJudge, PipelineRunnerTests, Bool, ModelContainer, ModelContext (+1 more)

### Community 60 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 61 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 62 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 63 - "Scenario"
Cohesion: 0.19
Nodes (13): Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage (+5 more)

### Community 64 - "SourceFetcher"
Cohesion: 0.25
Nodes (5): SourceDescriptor, SourceFetcher, Data, UUID, SourceFetcherTests

### Community 65 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 66 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 67 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 68 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 69 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 70 - ".plan()"
Cohesion: 0.23
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 71 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 72 - "View"
Cohesion: 0.19
Nodes (15): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+7 more)

### Community 73 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 74 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 75 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 76 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 77 - "SearchHit"
Cohesion: 0.22
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

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

### Community 83 - "FakeEmbedder"
Cohesion: 0.23
Nodes (7): EmbeddingProviding, FakeEmbedder, .dimension, Float, Int, String, HybridSearchTests

### Community 84 - "LocalizedError"
Cohesion: 0.13
Nodes (15): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+7 more)

### Community 85 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 86 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 87 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 88 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 89 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 90 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 91 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 92 - "GraphSnapshot"
Cohesion: 0.34
Nodes (9): Edge, ForceLayout, GraphSnapshot, Node, Point, Double, Int, String (+1 more)

### Community 93 - ".build()"
Cohesion: 0.22
Nodes (9): GraphEditing, Scope, all, recent, source, Bool, Date, ModelContext (+1 more)

### Community 94 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 95 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 96 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 97 - "AskStrategistIntent"
Cohesion: 0.26
Nodes (12): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent (+4 more)

### Community 98 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 99 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 100 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 101 - "GraphView"
Cohesion: 0.26
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 102 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 103 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 104 - "FakePIN"
Cohesion: 0.27
Nodes (6): AppLock, BiometricLockKit, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 105 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 106 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 107 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 108 - "XCTestCase"
Cohesion: 0.18
Nodes (6): PINRules, PINRulesTests, NormalizedKeyTests, SampleLibraryTests, TopKTests, XCTestCase

### Community 109 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 110 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 112 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 113 - "SeededRandom"
Cohesion: 0.24
Nodes (7): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, RandomNumberGenerator

### Community 114 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 115 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 116 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 117 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 118 - ".testEveryPromptFenceHoldsAgainstPoisone"
Cohesion: 0.27
Nodes (5): ExtractionPrompt, .schema, JSONValue, String, UntrustedText

### Community 119 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 120 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 121 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 122 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 123 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 124 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 125 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 126 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 127 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 128 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 129 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 130 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 131 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 132 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 133 - ".init()"
Cohesion: 0.43
Nodes (4): KeyedExtractor, Bool, ModelContext, String

### Community 134 - ".update()"
Cohesion: 0.38
Nodes (4): LockWindow, Bool, UIWindow, UIWindowScene

### Community 135 - "FoundationModelsRelevanceJudge"
Cohesion: 0.33
Nodes (6): FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 136 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 137 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 138 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 139 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 140 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 142 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 143 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 144 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 145 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 146 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 147 - ".importPending()"
Cohesion: 0.60
Nodes (3): ShareIntake, Int, ModelContext

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **307 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+302 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 602 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `Foundation` to `IngestError`, `RepoSync.swift`, `String`, `GitHubClient`, `DailyBudget`, `GitHubDeviceFlow`, `SmartWardIntents.swift`, `KnowledgeStore`, `BackgroundWork.swift`, `KnowledgeSchema`, `AppStore`, `ExtractionTiers`, `ExtractedArticle`, `SwiftData`, `BYOKLLMKit`, `PerfTrace`, `Identifiable`, `.parse()`, `.outcome()`, `.score()`, `Dependency`, `SourceFetcher`, `AppLock.swift`, `.canonicalize()`, `.testEveryPromptFenceHoldsAgainstPoisone`, `TopK`?**
  _High betweenness centrality (0.058) - this node is a cross-community bridge._
- **Why does `Article` connect `.makeContainer()` to `ArticleReaderView`, `Digest`, `Sendable`, `String`, `.init()`, `RetrievedPassage`, `ExtractionTiers`, `RetrievalFixture`, `Source`, `PipelineRunner`, `Conversation`, `ThemeNode`, `.fetch()`, `Chunk`, `EmbeddingModel`, `.load()`, `ThemeStrengthCache`, `.article()`, `.save()`, `SearchHit`, `FakeEmbedder`, `SearchDocument`, `.importItems()`, `ArticleStage`?**
  _High betweenness centrality (0.053) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `SourceFetcher`, `BYOKLLMKit`, `EntityResolver`, `RepoSync.swift`, `BriefViews.swift`, `SmartWardIntents.swift`, `StrategistRunner`, `BackgroundWork.swift`, `.makeContainer()`, `.score()`, `AppStore`, `EmbeddingModel`, `RetrievalFixture`, `SearchDocument`, `ThemeStrengthCache`, `Foundation`, `SwiftData`, `.build()`?**
  _High betweenness centrality (0.043) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _307 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Sendable` be split into smaller, more focused modules?**
  _Cohesion score 0.059922680412371136 - nodes in this community are weakly interconnected._
- **Should `Digest` be split into smaller, more focused modules?**
  _Cohesion score 0.05516475379489078 - nodes in this community are weakly interconnected._
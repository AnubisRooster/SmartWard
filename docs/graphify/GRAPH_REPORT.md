# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 158 files · ~595,390 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2833 nodes · 7260 edges · 155 communities (150 shown, 5 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 866 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ActionRequest
- GraphView
- ThemeNode
- ModelFallback
- SmartWardIntents.swift
- Project
- DailyBudget
- StrategyItemKind
- View
- IngestError
- LibraryFixture
- Sendable
- GitHubDeviceFlow
- ProjectLink
- XCTestCase
- ExtractionTiers
- SwiftData
- GitHubClient
- Conversation
- RetrievedPassage
- ExtractedArticle
- InterestModel
- RawItem
- KnowledgeStore
- XCTest
- OnboardingProposal
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .fetch()
- SourceFetcher
- ExtractedGraph
- .load()
- .fetch()
- Invariant D5: Private content never goes
- .score()
- SharedInbox
- .parse()
- Dependency
- .outcome()
- GraphRAG
- AppLockCoordinator
- makeContext()
- DigestSummaryRequest
- BYOKLLMKit
- .run()
- .retrieve()
- GraphNeighborsTool
- PerfTrace
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .fetchURL()
- .makeContainer()
- BriefError
- DigestBuilder
- .run()
- .body
- .importPending()
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- Identifiable
- EntityResolver
- GraphIndexer
- HybridSearchIndex
- PipelineRunner
- Approval Before Actions
- FoundationModelsEntityExtractor
- .canonicalize()
- Strategist Layer
- ShareModel
- GitHubAccount
- DigestCluster
- SearchController
- .decode()
- OnboardingView
- CodingKeys
- SmartWard (iOS Application Target)
- SearchDocument
- .messages()
- PlaybackLLM
- BackupView
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- Digest
- FakeTransport
- RefreshEagerness
- Choice
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- LibraryArchive
- SourceKind
- .render()
- .data()
- RetrievalFixture
- AppLockController
- GitHubRepoPicker
- IngestController
- .decision()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- OnboardingReviewView
- .process()
- DeveloperView
- CaseIterable
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- GraphExtraction.swift
- .importItems()
- .clusters()
- String
- ThemeDetailView
- AppLock.swift
- AppLockTests.swift
- graphify_pipeline.py
- ArticleStage
- TopK
- FakeBiometrics
- SmartWardApp
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- SearchHit
- GitHubError
- .documents()
- AddSourceView
- Graph View
- ArticleReaderView
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- .availability()
- .seed()
- SeededRandom
- .vector()
- DigestController
- Living Project Brief
- EncryptedBackup.swift
- BriefRevisionStatus
- AvailableModelsView
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- EmbeddingModel
- Apple Intelligence Preflight
- ConversationView.swift
- KnowledgeSchema
- .decode()
- ApprovalDecision
- FakePIN
- SharedInboxTests
- AppStore
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 89 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 66 edges
5. `Source` - 53 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 38 edges
8. `BYOKLLMKit` - 35 edges
9. `LibraryArchive` - 34 edges
10. `ProjectLink` - 34 edges

## Surprising Connections (you probably didn't know these)
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `SourceIntake (shared validation for adding sources)` --implements--> `add_source Tool`  [INFERRED]
  CLAUDE.md → README.md
- `LibraryArchive (versioned JSON, snapshot/restore/erase)` --implements--> `Versioned Library JSON Export`  [INFERRED]
  CLAUDE.md → README.md
- `iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement` --semantically_similar_to--> `Apple Intelligence-Capable Device Floor (iPhone 15 Pro+)`  [INFERRED] [semantically similar]
  docs/DEVICE_TESTING.md → project.yml
- `com.intelligentdesignsllc.smartward.processing Task Identifier` --shares_data_with--> `Bundle ID Prefix com.intelligentdesignsllc`  [INFERRED]
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

## Communities (155 total, 5 thin omitted)

### Community 0 - "ActionRequest"
Cohesion: 0.05
Nodes (55): LocalizedError, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+47 more)

### Community 1 - "GraphView"
Cohesion: 0.05
Nodes (58): CGFloat, Hashable, Edge, ForceLayout, GraphSnapshot, Node, Point, Scope (+50 more)

### Community 2 - "ThemeNode"
Cohesion: 0.08
Nodes (32): Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, ReadingSignal, StrategyItem, .status (+24 more)

### Community 3 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 4 - "SmartWardIntents.swift"
Cohesion: 0.06
Nodes (48): AppEntity, AppEnum, AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery (+40 more)

### Community 5 - "Project"
Cohesion: 0.09
Nodes (31): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+23 more)

### Community 6 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 7 - "StrategyItemKind"
Cohesion: 0.07
Nodes (27): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Arguments (+19 more)

### Community 8 - "View"
Cohesion: 0.07
Nodes (41): Article, Source, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding (+33 more)

### Community 9 - "IngestError"
Cohesion: 0.09
Nodes (29): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+21 more)

### Community 10 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 11 - "Sendable"
Cohesion: 0.22
Nodes (35): Codable, Equatable, GitHubUser, AliasRecord, ArchiveError, .errorDescription, notAnArchive, ArticleRecord (+27 more)

### Community 12 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 13 - "ProjectLink"
Cohesion: 0.08
Nodes (21): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+13 more)

### Community 14 - "XCTestCase"
Cohesion: 0.12
Nodes (16): AddSourceTool, .definition, .kinds, FetchURLTool, .definition, Bool, JSONValue, LLMTool (+8 more)

### Community 15 - "ExtractionTiers"
Cohesion: 0.10
Nodes (21): EntityExtracting, ExtractionPrompt, .schema, ExtractionTier, byok, onDevice, ExtractionTiers, JSONValue (+13 more)

### Community 16 - "SwiftData"
Cohesion: 0.13
Nodes (5): Accelerate, Foundation, NaturalLanguage, RetrievalKit, SwiftData

### Community 17 - "GitHubClient"
Cohesion: 0.15
Nodes (14): GitHubClient, .isAuthenticated, GitHubRepo, .id, HTTPTransport, Bool, Data, HTTPURLResponse (+6 more)

### Community 18 - "Conversation"
Cohesion: 0.10
Nodes (22): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+14 more)

### Community 19 - "RetrievedPassage"
Cohesion: 0.11
Nodes (21): RetrievedPassage, ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 20 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 21 - "InterestModel"
Cohesion: 0.15
Nodes (16): Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+8 more)

### Community 22 - "RawItem"
Cohesion: 0.15
Nodes (12): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+4 more)

### Community 23 - "KnowledgeStore"
Cohesion: 0.15
Nodes (6): BackgroundTasks, KnowledgeStore, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 24 - "XCTest"
Cohesion: 0.14
Nodes (3): IngestKit, Pipeline, XCTest

### Community 25 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 26 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 27 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 28 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 29 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 30 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 31 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 32 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 33 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 34 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 35 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 36 - ".parse()"
Cohesion: 0.16
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 37 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 38 - ".outcome()"
Cohesion: 0.15
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 39 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 40 - "AppLockCoordinator"
Cohesion: 0.16
Nodes (12): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+4 more)

### Community 41 - "makeContext()"
Cohesion: 0.13
Nodes (8): ContextPolicy, Bool, ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests, ModelContainer, ModelContext

### Community 42 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (12): BYOKDigestSummarizer, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage (+4 more)

### Community 43 - "BYOKLLMKit"
Cohesion: 0.19
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 44 - ".run()"
Cohesion: 0.22
Nodes (10): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+2 more)

### Community 45 - ".retrieve()"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 46 - "GraphNeighborsTool"
Cohesion: 0.19
Nodes (12): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, SearchCorpusTool, .definition, JSONValue (+4 more)

### Community 47 - "PerfTrace"
Cohesion: 0.17
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 48 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 49 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 50 - ".fetchURL()"
Cohesion: 0.25
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 51 - ".makeContainer()"
Cohesion: 0.20
Nodes (9): Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests (+1 more)

### Community 52 - "BriefError"
Cohesion: 0.13
Nodes (16): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+8 more)

### Community 53 - "DigestBuilder"
Cohesion: 0.19
Nodes (10): DigestBuilder, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date, ModelContainer (+2 more)

### Community 54 - ".run()"
Cohesion: 0.25
Nodes (7): ArticleIndexer, Int, FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 55 - ".body"
Cohesion: 0.11
Nodes (16): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+8 more)

### Community 56 - ".importPending()"
Cohesion: 0.18
Nodes (8): BGContinuedProcessingTask, .body, BackgroundWork, ShareIntake, Int, ModelContext, TimeInterval, .body

### Community 57 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 58 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 59 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 60 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 61 - "Identifiable"
Cohesion: 0.15
Nodes (16): Identifiable, ExportView, .body, Kind, .detail, .fileExtension, graph, .id (+8 more)

### Community 62 - "EntityResolver"
Cohesion: 0.26
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 63 - "GraphIndexer"
Cohesion: 0.22
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 64 - "HybridSearchIndex"
Cohesion: 0.22
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, PerformanceTests, String (+2 more)

### Community 65 - "PipelineRunner"
Cohesion: 0.21
Nodes (11): FullTextFetching, PipelineRunner, .stages, Date, Double, ModelContext, Set, TimeInterval (+3 more)

### Community 66 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 67 - "FoundationModelsEntityExtractor"
Cohesion: 0.20
Nodes (10): Color, ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String, .body (+2 more)

### Community 68 - ".canonicalize()"
Cohesion: 0.17
Nodes (9): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Date, Set, String, URL (+1 more)

### Community 69 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 70 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 71 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 72 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 73 - "SearchController"
Cohesion: 0.21
Nodes (9): T, SearchController, SearchResultsView, .body, Int, ModelContext, String, UUID (+1 more)

### Community 74 - ".decode()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 75 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 76 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 77 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 78 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 79 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 80 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 81 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 82 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 83 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 84 - "Digest"
Cohesion: 0.24
Nodes (11): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body (+3 more)

### Community 85 - "FakeTransport"
Cohesion: 0.23
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 86 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 87 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 88 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 89 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 90 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 91 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 92 - ".render()"
Cohesion: 0.26
Nodes (5): DigestPrompt, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 93 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 94 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 95 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 96 - "GitHubRepoPicker"
Cohesion: 0.19
Nodes (11): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+3 more)

### Community 97 - "IngestController"
Cohesion: 0.23
Nodes (10): FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set, String (+2 more)

### Community 98 - ".decision()"
Cohesion: 0.26
Nodes (6): Decodable, ActionTools, Arguments, Set, String, ApprovalPolicyTests

### Community 99 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 100 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 101 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 102 - ".process()"
Cohesion: 0.21
Nodes (10): FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, ModelContext, String, TimeInterval, Triage.Strength (+2 more)

### Community 103 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 104 - "CaseIterable"
Cohesion: 0.20
Nodes (11): CaseIterable, Filter, all, .id, starred, unread, Order, .id (+3 more)

### Community 105 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 106 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 107 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 108 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 109 - "GraphExtraction.swift"
Cohesion: 0.20
Nodes (4): FoundationModels, Observation, GitHubConfig, UserNotifications

### Community 110 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 111 - ".clusters()"
Cohesion: 0.31
Nodes (6): Group, Bool, Int, UUID, UnionFind, .body

### Community 112 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 113 - "ThemeDetailView"
Cohesion: 0.25
Nodes (7): String, Void, ThemeDetailView, .body, .recentMentions, ThemePicker, .matches

### Community 114 - "AppLock.swift"
Cohesion: 0.31
Nodes (6): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, PINAttemptResult

### Community 115 - "AppLockTests.swift"
Cohesion: 0.27
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 116 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 117 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 118 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 119 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 120 - "SmartWardApp"
Cohesion: 0.22
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 121 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 122 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 123 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 124 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 125 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 126 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 127 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 128 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 129 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 130 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 131 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 132 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 133 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 134 - ".seed()"
Cohesion: 0.38
Nodes (4): BudgetTests, Double, ModelContext, String

### Community 135 - "SeededRandom"
Cohesion: 0.38
Nodes (4): SeededRandom, UInt64, TopKTests, RandomNumberGenerator

### Community 136 - ".vector()"
Cohesion: 0.43
Nodes (4): FixedJudge, Bool, Float, String

### Community 137 - "DigestController"
Cohesion: 0.33
Nodes (5): DigestController, .notificationsEnabled, Bool, String, TimeInterval

### Community 138 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 139 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 140 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 141 - "AvailableModelsView"
Cohesion: 0.60
Nodes (4): AvailableModelsView, .body, .providersWithKeys, LLMProvider

### Community 142 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 143 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 144 - "EmbeddingModel"
Cohesion: 0.60
Nodes (3): EmbeddingModel, EmbeddingProviding, String

### Community 145 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 147 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 149 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 150 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

### Community 152 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **303 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+298 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 592 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `ActionRequest`, `ThemeNode`, `SmartWardIntents.swift`, `DailyBudget`, `StrategyItemKind`, `IngestError`, `EncryptedBackup.swift`, `GitHubDeviceFlow`, `ProjectLink`, `ExtractionTiers`, `GitHubClient`, `ConversationView.swift`, `ExtractedArticle`, `KnowledgeStore`, `XCTest`, `SourceFetcher`, `.score()`, `SharedInbox`, `.parse()`, `Dependency`, `.outcome()`, `makeContext()`, `BYOKLLMKit`, `PerfTrace`, `.canonicalize()`, `.render()`, `GraphExtraction.swift`, `AppLock.swift`, `AppLockTests.swift`, `TopK`?**
  _High betweenness centrality (0.054) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `ActionRequest`, `GraphView`, `.score()`, `ThemeNode`, `SmartWardIntents.swift`, `StrategyItemKind`, `makeContext()`, `BYOKLLMKit`, `EncryptedBackup.swift`, `.retrieve()`, `SearchDocument`, `GraphExtraction.swift`, `SwiftData`, `ConversationView.swift`, `XCTest`, `SourceFetcher`, `GraphIndexer`?**
  _High betweenness centrality (0.046) - this node is a cross-community bridge._
- **Why does `Article` connect `View` to `GraphView`, `ThemeNode`, `ArticleReaderView`, `.seed()`, `ProjectLink`, `ExtractionTiers`, `Conversation`, `RetrievedPassage`, `InterestModel`, `RawItem`, `.fetch()`, `.load()`, `makeContext()`, `.makeContainer()`, `DigestBuilder`, `.run()`, `GraphIndexer`, `PipelineRunner`, `DigestCluster`, `SearchController`, `SearchDocument`, `RetrievalFixture`, `IngestController`, `FakeEmbedder`, `.importItems()`, `.clusters()`, `ArticleStage`?**
  _High betweenness centrality (0.039) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _303 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ActionRequest` be split into smaller, more focused modules?**
  _Cohesion score 0.05126050420168067 - nodes in this community are weakly interconnected._
- **Should `GraphView` be split into smaller, more focused modules?**
  _Cohesion score 0.052982456140350874 - nodes in this community are weakly interconnected._
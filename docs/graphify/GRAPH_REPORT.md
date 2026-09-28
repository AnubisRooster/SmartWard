# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 150 files · ~574,944 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2711 nodes · 6992 edges · 151 communities (146 shown, 5 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 855 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- KnowledgeStore
- ModelFallback
- DailyBudget
- IngestError
- OnboardingView
- LibraryFixture
- StrategyItemKind
- GitHubDeviceFlow
- StrategistRunner
- ExtractionTiers
- Project
- BriefViews.swift
- String
- Sendable
- GitHubClient
- ActionRequest
- View
- PipelineRunner
- StrategistTool
- InterestModel
- ReferenceLedger
- ExtractedArticle
- ThemeNode
- .parse()
- Digest
- PerfTrace
- .fetch()
- DigestBuilder
- GraphSnapshot
- OnboardingProposal
- Phase 5: Hardening
- ConversationView
- Pipeline module (ingestion, graph, searc
- Conversation
- .load()
- Invariant D5: Private content never goes
- SharedInbox
- AppLockCoordinator
- Dependency
- SourceFetcher
- GraphRAG
- RetrievedPassage
- HybridSearchIndex
- RawItem
- ProjectLink
- ExtractedGraph
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .makeContainer()
- EntityResolver
- Scenario
- .send()
- .fetchURL()
- Article
- SearchHit
- ThemeStrengthCache
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- DigestSummaryRequest
- Approval Before Actions
- .dismiss()
- .importPending()
- Strategist Layer
- ShareModel
- IngestController
- GitHubAccount
- BackupView
- Identifiable
- GraphCanvas
- CodingKeys
- SmartWard (iOS Application Target)
- SearchDocument
- makeContext()
- PlaybackLLM
- GitHubProjectSection
- .buildIfDue()
- AppLock.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- Source
- .render()
- .plan()
- NewConversationView
- Choice
- SmartWard XcodeGen Project Spec
- GraphView
- LocalizedError
- AppLockPolicy
- SourceKind
- EmbeddingModel
- FakeTransport
- RetrievalFixture
- AppLockController
- AskStrategistIntent
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- ParsedFeed
- .data()
- OnboardingReviewView
- DeveloperView
- ProjectEntity
- AppLockTests.swift
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- FakeEmbedder
- .graphML()
- .importItems()
- .score()
- String
- .process()
- Kind
- ArticleStage
- TopK
- FakeBiometrics
- XCTestCase
- FoundationModelsEntityExtractor
- SmartWardApp
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- GitHubError
- LibraryArchive
- .clusters()
- .documents()
- .init()
- AppTab
- ThemeDetailView
- AddSourceView
- ActivitySheet
- SourceKindOption
- graphify_pipeline.py
- ArchiveError
- Graph View
- ArticleReaderView
- UntrustedText (body/attribute inside its
- BriefError
- SeededRandom
- Living Project Brief
- PINOutcome
- .testPrivateRepoContentIsLocalOnly()
- BriefRevisionStatus
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .perform()
- Apple Intelligence Preflight
- SharedInboxTests
- Result
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 89 edges
2. `SwiftData` - 77 edges
3. `Project` - 68 edges
4. `Article` - 66 edges
5. `Source` - 53 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 36 edges
8. `LibraryArchive` - 34 edges
9. `ProjectLink` - 34 edges
10. `HybridSearchIndex` - 33 edges

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

### Community 0 - "KnowledgeStore"
Cohesion: 0.05
Nodes (33): Accelerate, AppIntents, BackgroundTasks, BYOKLLMKit, CommonCrypto, CryptoKit, Foundation, FoundationModels (+25 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "DailyBudget"
Cohesion: 0.09
Nodes (30): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+22 more)

### Community 3 - "IngestError"
Cohesion: 0.08
Nodes (30): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+22 more)

### Community 4 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 5 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 6 - "StrategyItemKind"
Cohesion: 0.10
Nodes (21): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, Arguments (+13 more)

### Community 7 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+18 more)

### Community 8 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 9 - "ExtractionTiers"
Cohesion: 0.09
Nodes (21): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, GraphLinker, String, ExtractionTests (+13 more)

### Community 10 - "Project"
Cohesion: 0.15
Nodes (14): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+6 more)

### Community 11 - "BriefViews.swift"
Cohesion: 0.10
Nodes (24): BriefDiff, Line, added, removed, same, BriefController, BriefDiffView, .body (+16 more)

### Community 12 - "String"
Cohesion: 0.13
Nodes (21): Chunk, InterestProfile, Mention, ReadingSignal, StrategyItem, .status, StrategyItemStatus, done (+13 more)

### Community 13 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 14 - "GitHubClient"
Cohesion: 0.14
Nodes (15): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, Bool, Data (+7 more)

### Community 15 - "ActionRequest"
Cohesion: 0.12
Nodes (17): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool, JSONValue (+9 more)

### Community 16 - "View"
Cohesion: 0.09
Nodes (30): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen, PrivacyCover (+22 more)

### Community 17 - "PipelineRunner"
Cohesion: 0.15
Nodes (16): ArticleIndexer, PipelineRunner, .stages, Report, Date, Double, Int, ModelContext (+8 more)

### Community 18 - "StrategistTool"
Cohesion: 0.10
Nodes (22): ProjectStateTool, .definition, ProposeBriefUpdateTool, .definition, LLMTool, StrategistEvent, awaitingConfirmation, confirmationResolved (+14 more)

### Community 19 - "InterestModel"
Cohesion: 0.15
Nodes (17): Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+9 more)

### Community 20 - "ReferenceLedger"
Cohesion: 0.15
Nodes (16): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+8 more)

### Community 21 - "ExtractedArticle"
Cohesion: 0.16
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 22 - "ThemeNode"
Cohesion: 0.16
Nodes (11): EntityAlias, MergeSuggestion, Data, Double, ThemeNode, GraphEditing, ModelContext, GraphEditingTests (+3 more)

### Community 23 - ".parse()"
Cohesion: 0.12
Nodes (12): DateFormatter, ISO8601DateFormatter, FeedParser, Data, CanonicalURL, FeedDate, Date, Set (+4 more)

### Community 24 - "Digest"
Cohesion: 0.17
Nodes (19): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+11 more)

### Community 25 - "PerfTrace"
Cohesion: 0.14
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 26 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 27 - "DigestBuilder"
Cohesion: 0.14
Nodes (13): DigestBuilder, DigestSummarizing, Date, Int, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture (+5 more)

### Community 28 - "GraphSnapshot"
Cohesion: 0.18
Nodes (17): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+9 more)

### Community 29 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 30 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 31 - "ConversationView"
Cohesion: 0.12
Nodes (19): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, EmptyChatHint (+11 more)

### Community 32 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 33 - "Conversation"
Cohesion: 0.14
Nodes (11): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+3 more)

### Community 34 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 35 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 36 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 37 - "AppLockCoordinator"
Cohesion: 0.18
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, PINAttemptResult, String, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 38 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 39 - "SourceFetcher"
Cohesion: 0.22
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 40 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 41 - "RetrievedPassage"
Cohesion: 0.17
Nodes (14): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+6 more)

### Community 42 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (12): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+4 more)

### Community 43 - "RawItem"
Cohesion: 0.22
Nodes (9): FeedIngest, Date, Error, ModelContext, String, TimeInterval, RawItem, FetchedSource (+1 more)

### Community 44 - "ProjectLink"
Cohesion: 0.18
Nodes (9): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+1 more)

### Community 45 - "ExtractedGraph"
Cohesion: 0.22
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 46 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 47 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 48 - ".makeContainer()"
Cohesion: 0.20
Nodes (9): Bool, ModelContainer, FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests (+1 more)

### Community 49 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 50 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 51 - ".send()"
Cohesion: 0.20
Nodes (10): CheckedContinuation, Never, ActionTools, Set, ChatController, Bool, LLMCompleting, LLMProvider (+2 more)

### Community 52 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 53 - "Article"
Cohesion: 0.16
Nodes (15): Article, ModelContainer, ModelContext, ArticleRow, .body, .content, ReadingView, .emptyState (+7 more)

### Community 54 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 55 - "ThemeStrengthCache"
Cohesion: 0.24
Nodes (11): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+3 more)

### Community 56 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 57 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 58 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 59 - "DigestSummaryRequest"
Cohesion: 0.24
Nodes (9): BYOKDigestSummarizer, DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage (+1 more)

### Community 60 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 61 - ".dismiss()"
Cohesion: 0.15
Nodes (12): ModelContext, syncGitHubLinks(), .body, GitHubRepoPicker, .alreadyLinked, .body, Set, .body (+4 more)

### Community 62 - ".importPending()"
Cohesion: 0.19
Nodes (7): BGContinuedProcessingTask, BackgroundWork, ShareIntake, Int, ModelContext, TimeInterval, .body

### Community 63 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 64 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 65 - "IngestController"
Cohesion: 0.17
Nodes (12): Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set (+4 more)

### Community 66 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 67 - "BackupView"
Cohesion: 0.18
Nodes (11): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+3 more)

### Community 68 - "Identifiable"
Cohesion: 0.15
Nodes (15): CaseIterable, Identifiable, Filter, all, .id, starred, unread, Order (+7 more)

### Community 69 - "GraphCanvas"
Cohesion: 0.19
Nodes (12): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 70 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 71 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 72 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 73 - "makeContext()"
Cohesion: 0.19
Nodes (6): ContextPolicyTests, makeContext(), NormalizedKeyTests, SchemaTests, ModelContainer, ModelContext

### Community 74 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 75 - "GitHubProjectSection"
Cohesion: 0.14
Nodes (13): GitHubProjectSection, .dependencies, .repoLinks, String, .current, NewProjectView, .body, ProjectDetailView (+5 more)

### Community 76 - ".buildIfDue()"
Cohesion: 0.18
Nodes (11): DigestController, .notificationsEnabled, FoundationModelsDigestSummarizer, Bool, ModelContext, String, TimeInterval, DigestSettingsSection (+3 more)

### Community 77 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 78 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 79 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 80 - "Source"
Cohesion: 0.25
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 81 - ".render()"
Cohesion: 0.21
Nodes (7): ExtractionPrompt, .schema, JSONValue, ReferenceContext, String, UntrustedText, ResearchToolTests

### Community 82 - ".plan()"
Cohesion: 0.25
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 83 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 84 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 85 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 86 - "GraphView"
Cohesion: 0.23
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 87 - "LocalizedError"
Cohesion: 0.15
Nodes (13): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+5 more)

### Community 88 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 89 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 90 - "EmbeddingModel"
Cohesion: 0.23
Nodes (8): EmbeddingModel, EmbeddingProviding, String, GraphIndexer, .suggestionsAdded, Date, Int, ModelContext

### Community 91 - "FakeTransport"
Cohesion: 0.23
Nodes (7): FakeTransport, GitHubClientTests, GitHubDeviceCodeFixture, Data, HTTPURLResponse, URLRequest, Reply

### Community 92 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 93 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 94 - "AskStrategistIntent"
Cohesion: 0.24
Nodes (11): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, AskStrategistIntent (+3 more)

### Community 95 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 96 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 97 - "ParsedFeed"
Cohesion: 0.27
Nodes (8): NSObject, Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 98 - ".data()"
Cohesion: 0.27
Nodes (6): Data, Float, VectorCoding, ModelContext, Set, UUID

### Community 99 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 100 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 101 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 102 - "AppLockTests.swift"
Cohesion: 0.24
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 103 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 104 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 105 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 106 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 107 - ".graphML()"
Cohesion: 0.25
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 108 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 109 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 110 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 111 - ".process()"
Cohesion: 0.24
Nodes (9): FoundationModelsRelevanceJudge, PipelineController, Bool, ModelContext, String, TimeInterval, Triage.Strength, .label (+1 more)

### Community 112 - "Kind"
Cohesion: 0.20
Nodes (10): Kind, .detail, .fileExtension, graph, .id, library, projects, .systemImage (+2 more)

### Community 113 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 114 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 115 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 116 - "XCTestCase"
Cohesion: 0.24
Nodes (7): BudgetTests, Double, ModelContext, String, VectorCodingTests, BriefDiffTests, XCTestCase

### Community 117 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 118 - "SmartWardApp"
Cohesion: 0.22
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 119 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 120 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 121 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 122 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 123 - "LibraryArchive"
Cohesion: 0.39
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 124 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 125 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 126 - ".init()"
Cohesion: 0.31
Nodes (5): RelevanceJudging, FixedJudge, Bool, Float, String

### Community 127 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 128 - "ThemeDetailView"
Cohesion: 0.36
Nodes (7): Connection, .id, String, ThemeDetailView, .body, .connections, .recentMentions

### Community 129 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 130 - "ActivitySheet"
Cohesion: 0.32
Nodes (6): Any, Context, ActivitySheet, .body, UIActivityViewController, UIViewControllerRepresentable

### Community 131 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 132 - "graphify_pipeline.py"
Cohesion: 0.29
Nodes (6): json, pathlib, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 133 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 134 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 135 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 136 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 137 - "BriefError"
Cohesion: 0.29
Nodes (7): BriefError, empty, .errorDescription, notPending, outdated, unchanged, Int

### Community 138 - "SeededRandom"
Cohesion: 0.38
Nodes (4): SeededRandom, UInt64, TopKTests, RandomNumberGenerator

### Community 139 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 140 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 142 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 143 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 144 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 145 - ".perform()"
Cohesion: 0.40
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 146 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **279 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+274 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 556 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `KnowledgeStore` to `DailyBudget`, `IngestError`, `GitHubDeviceFlow`, `Project`, `.testPrivateRepoContentIsLocalOnly()`, `GitHubClient`, `ExtractedArticle`, `.parse()`, `PerfTrace`, `Conversation`, `SharedInbox`, `Dependency`, `SourceFetcher`, `ProjectLink`, `AppLock.swift`, `.render()`, `ParsedFeed`, `AppLockTests.swift`, `.graphML()`, `.score()`, `TopK`?**
  _High betweenness centrality (0.066) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `ArticleReaderView`, `ExtractionTiers`, `String`, `PipelineRunner`, `InterestModel`, `ThemeNode`, `Digest`, `.fetch()`, `DigestBuilder`, `ConversationView`, `Conversation`, `.load()`, `.makeContainer()`, `Scenario`, `SearchHit`, `.dismiss()`, `IngestController`, `SearchDocument`, `makeContext()`, `Source`, `RetrievalFixture`, `FakeEmbedder`, `.importItems()`, `ArticleStage`, `XCTestCase`, `.clusters()`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `SourceFetcher`, `SearchDocument`, `ExtractionTiers`, `RetrievedPassage`, `.graphML()`, `Project`, `makeContext()`, `StrategistRunner`, `BriefViews.swift`, `EntityResolver`, `Article`, `ThemeNode`, `EmbeddingModel`?**
  _High betweenness centrality (0.031) - this node is a cross-community bridge._
- **Are the 24 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 24 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _279 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `KnowledgeStore` be split into smaller, more focused modules?**
  _Cohesion score 0.05048518227117755 - nodes in this community are weakly interconnected._
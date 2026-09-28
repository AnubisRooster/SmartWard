# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 154 files · ~583,694 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2779 nodes · 7145 edges · 157 communities (153 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 866 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ActionRequest
- XCTestCase
- Article
- DailyBudget
- Project
- LocalizedError
- IngestError
- GitHubDeviceFlow
- StrategyItemKind
- PipelineRunner
- Choice
- Sendable
- KnowledgeStore
- .makeContainer()
- GitHubClient
- SwiftData
- Identifiable
- GitHubRepoPicker
- ExtractedArticle
- FetchURLTool
- InterestModel
- RawItem
- ReferenceLedger
- .body
- .parse()
- RetrievedPassage
- OnboardingProposal
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .fetchURL()
- ExtractedGraph
- GraphSnapshot
- RecordStrategyItemTool
- BYOKLLMKit
- Invariant D5: Private content never goes
- Dependency
- ConversationMode
- EmbeddingModel
- .load()
- GraphRAG
- ThemeStrengthCache
- PerfTrace
- .plan()
- SourceFetcher
- GraphIndexer
- .send()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- FlakyLLM
- GitHubError
- .process()
- EntityResolver
- .retrieve()
- View
- SecuritySettingsSection
- makeContext()
- DigestSummaryRequest
- SwiftUI
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- .article()
- Approval Before Actions
- AskStrategistIntent
- Strategist Layer
- ShareModel
- GitHubAccount
- DigestCluster
- .seal()
- .save()
- .decode()
- OnboardingView
- Kind
- GraphCanvas
- CodingKeys
- SmartWard (iOS Application Target)
- IngestController
- DigestBuilder
- .messages()
- PlaybackLLM
- BackupView
- FallbackLLM
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- BriefViews.swift
- .projects()
- DigestSummary
- RetrievalFixture
- RefreshEagerness
- AppLock.swift
- SmartWard XcodeGen Project Spec
- AppLockCoordinator
- Digest
- Source
- SourceKind
- AppLockController
- ReadingView
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GraphView
- ParsedFeed
- .lines()
- OnboardingReviewView
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .graphML()
- .unlockWithBiometrics()
- .apply()
- .importItems()
- .score()
- ModelFallback
- FakeCompletion
- ThemeDetailView
- SourceKindOption
- FakePIN
- graphify_pipeline.py
- GitHubRepo
- AppLockPolicy
- ArticleStage
- .clusters()
- TopK
- FakeBiometrics
- CannedLLM
- FoundationModelsEntityExtractor
- ProjectEntity
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- AppTab
- .passages()
- .buildIfDue()
- ArchiveError
- Graph View
- ArticleReaderView
- ActivitySheet
- UntrustedText (body/attribute inside its
- BackupError
- LibraryFixture
- ModelFallbackTests
- Living Project Brief
- EncryptedBackup.swift
- SearchHit
- ProviderKeyRow
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- RepoSyncTests
- Apple Intelligence Preflight
- KnowledgeSchema
- FakeSummarizer
- AppStore
- ExtractionPrompt
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
8. `BYOKLLMKit` - 35 edges
9. `LibraryArchive` - 34 edges
10. `ProjectLink` - 34 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift

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

## Communities (157 total, 4 thin omitted)

### Community 0 - "ActionRequest"
Cohesion: 0.05
Nodes (51): ActionRequest, StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult (+43 more)

### Community 1 - "XCTestCase"
Cohesion: 0.06
Nodes (39): EmbeddingProviding, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, LexicalIndex, .count, SearchCorpus (+31 more)

### Community 2 - "Article"
Cohesion: 0.10
Nodes (29): Article, Chunk, Conversation, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message (+21 more)

### Community 3 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 4 - "Project"
Cohesion: 0.10
Nodes (30): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, Project (+22 more)

### Community 5 - "LocalizedError"
Cohesion: 0.05
Nodes (38): LocalizedError, LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext (+30 more)

### Community 6 - "IngestError"
Cohesion: 0.09
Nodes (29): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+21 more)

### Community 7 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 8 - "StrategyItemKind"
Cohesion: 0.09
Nodes (22): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+14 more)

### Community 9 - "PipelineRunner"
Cohesion: 0.12
Nodes (21): ExtractionTiers, FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext (+13 more)

### Community 10 - "Choice"
Cohesion: 0.07
Nodes (31): CaseIterable, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv (+23 more)

### Community 11 - "Sendable"
Cohesion: 0.27
Nodes (30): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+22 more)

### Community 12 - "KnowledgeStore"
Cohesion: 0.14
Nodes (4): IngestKit, KnowledgeStore, Pipeline, XCTest

### Community 13 - ".makeContainer()"
Cohesion: 0.10
Nodes (15): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+7 more)

### Community 14 - "GitHubClient"
Cohesion: 0.14
Nodes (13): GitHubClient, .isAuthenticated, GitHubUser, Set, String, T, FakeTransport, GitHubClientTests (+5 more)

### Community 15 - "SwiftData"
Cohesion: 0.11
Nodes (6): Accelerate, AppIntents, Foundation, NaturalLanguage, RetrievalKit, SwiftData

### Community 16 - "Identifiable"
Cohesion: 0.12
Nodes (17): Identifiable, JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject (+9 more)

### Community 17 - "GitHubRepoPicker"
Cohesion: 0.08
Nodes (25): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+17 more)

### Community 18 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 19 - "FetchURLTool"
Cohesion: 0.14
Nodes (15): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, Bool, JSONValue (+7 more)

### Community 20 - "InterestModel"
Cohesion: 0.15
Nodes (17): Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off, strict (+9 more)

### Community 21 - "RawItem"
Cohesion: 0.15
Nodes (12): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+4 more)

### Community 22 - "ReferenceLedger"
Cohesion: 0.17
Nodes (14): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+6 more)

### Community 23 - ".body"
Cohesion: 0.11
Nodes (16): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, TimeInterval (+8 more)

### Community 24 - ".parse()"
Cohesion: 0.13
Nodes (11): DateFormatter, ISO8601DateFormatter, FeedParser, Data, CanonicalURL, FeedDate, Set, String (+3 more)

### Community 25 - "RetrievedPassage"
Cohesion: 0.14
Nodes (19): RetrievedPassage, ActionConfirmationCard, .body, ConversationView, .body, .messages, .missingKeyWarning, EmptyChatHint (+11 more)

### Community 26 - "OnboardingProposal"
Cohesion: 0.13
Nodes (16): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+8 more)

### Community 27 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 28 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 29 - ".fetchURL()"
Cohesion: 0.19
Nodes (8): SourceEndpoint, Bool, String, URL, SourceEndpointTests, String, URL, AddSourceToolTests

### Community 30 - "ExtractedGraph"
Cohesion: 0.18
Nodes (12): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+4 more)

### Community 31 - "GraphSnapshot"
Cohesion: 0.20
Nodes (16): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+8 more)

### Community 32 - "RecordStrategyItemTool"
Cohesion: 0.15
Nodes (12): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue (+4 more)

### Community 33 - "BYOKLLMKit"
Cohesion: 0.17
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 34 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 35 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 36 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 37 - "EmbeddingModel"
Cohesion: 0.15
Nodes (12): EmbeddingModel, Data, EmbeddingProviding, Float, String, VectorCoding, ArticleIndexer, Int (+4 more)

### Community 38 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 39 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 40 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 41 - "PerfTrace"
Cohesion: 0.18
Nodes (12): DispatchTime, os, PerfTrace, .names, .samples, Sample, Date, Double (+4 more)

### Community 42 - ".plan()"
Cohesion: 0.16
Nodes (15): IntentResult, Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind (+7 more)

### Community 43 - "SourceFetcher"
Cohesion: 0.23
Nodes (6): SourceDescriptor, SourceFetcher, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 44 - "GraphIndexer"
Cohesion: 0.14
Nodes (11): EntityExtracting, ExtractionTier, byok, onDevice, GraphIndexer, .suggestionsAdded, GraphLinker, Date (+3 more)

### Community 45 - ".send()"
Cohesion: 0.19
Nodes (11): CheckedContinuation, Never, ActionTools, Set, ChatController, Bool, LLMCompleting, LLMProvider (+3 more)

### Community 46 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 47 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 48 - "FlakyLLM"
Cohesion: 0.16
Nodes (13): LLMCompletionError, Behavior, fail, failMidStream, ok, FallbackLLMTests, FlakyLLM, AsyncThrowingStream (+5 more)

### Community 49 - "GitHubError"
Cohesion: 0.15
Nodes (14): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, HTTPTransport (+6 more)

### Community 50 - ".process()"
Cohesion: 0.13
Nodes (14): RelevanceJudging, FixedJudge, Bool, FoundationModelsRelevanceJudge, PipelineController, Bool, ModelContext, String (+6 more)

### Community 51 - "EntityResolver"
Cohesion: 0.23
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 52 - ".retrieve()"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 53 - "View"
Cohesion: 0.17
Nodes (17): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+9 more)

### Community 54 - "SecuritySettingsSection"
Cohesion: 0.15
Nodes (16): AppLock, PINLockKit, LockScreen, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView (+8 more)

### Community 55 - "makeContext()"
Cohesion: 0.15
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 56 - "DigestSummaryRequest"
Cohesion: 0.20
Nodes (6): DigestPrompt, DigestSummaryRequest, Int, ReferenceContext, String, UntrustedText

### Community 57 - "SwiftUI"
Cohesion: 0.14
Nodes (5): BackgroundTasks, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers

### Community 58 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 59 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 60 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 61 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 62 - ".article()"
Cohesion: 0.24
Nodes (7): FakeFullText, PipelineRunnerTests, Float, ModelContainer, ModelContext, Set, String

### Community 63 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 64 - "AskStrategistIntent"
Cohesion: 0.18
Nodes (16): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, Summary, Int, ParameterSummary (+8 more)

### Community 65 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 66 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 67 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 68 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 69 - ".seal()"
Cohesion: 0.23
Nodes (9): EncryptedBackup, Data, LibraryArchive, String, UInt32, BackupTests, UInt32, SymmetricKey (+1 more)

### Community 70 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 71 - ".decode()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 72 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 73 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 74 - "GraphCanvas"
Cohesion: 0.19
Nodes (12): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 75 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 76 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 77 - "IngestController"
Cohesion: 0.19
Nodes (11): Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set (+3 more)

### Community 78 - "DigestBuilder"
Cohesion: 0.23
Nodes (9): DigestBuilder, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date, ModelContainer (+1 more)

### Community 79 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 80 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 81 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 82 - "FallbackLLM"
Cohesion: 0.25
Nodes (9): Alternatives, LLMCompleting, FallbackLLM, AsyncThrowingStream, Error, Int, LLMRequest, LLMResponse (+1 more)

### Community 83 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 84 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 85 - "BriefViews.swift"
Cohesion: 0.15
Nodes (5): FoundationModels, Observation, GitHubConfig, BriefOrigin, UserNotifications

### Community 86 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 87 - "DigestSummary"
Cohesion: 0.23
Nodes (9): BYOKDigestSummarizer, DigestSummarizing, DigestSummary, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String (+1 more)

### Community 88 - "RetrievalFixture"
Cohesion: 0.22
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 89 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 90 - "AppLock.swift"
Cohesion: 0.21
Nodes (9): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINVerifying, BiometricUnavailable, BiometryType, Result (+1 more)

### Community 91 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 92 - "AppLockCoordinator"
Cohesion: 0.21
Nodes (9): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+1 more)

### Community 93 - "Digest"
Cohesion: 0.27
Nodes (10): Digest, .clusters, Bool, Date, DigestRow, .body, DigestSections, .body (+2 more)

### Community 94 - "Source"
Cohesion: 0.28
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 95 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 96 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 97 - "ReadingView"
Cohesion: 0.17
Nodes (12): ArticleRow, .body, .content, ReadingView, .emptyState, .filteredOutCount, .hasFollowedSources, .reading (+4 more)

### Community 98 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 99 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 100 - "GraphView"
Cohesion: 0.26
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 101 - "ParsedFeed"
Cohesion: 0.27
Nodes (8): NSObject, Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 102 - ".lines()"
Cohesion: 0.27
Nodes (7): BriefDiff, Line, added, removed, same, BriefDiffView, .body

### Community 103 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 104 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 105 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 106 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 107 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 108 - ".graphML()"
Cohesion: 0.25
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 109 - ".unlockWithBiometrics()"
Cohesion: 0.22
Nodes (7): BiometricStep, needsPIN, unlocked, PINService, BiometricResult, PINAttemptResult, String

### Community 110 - ".apply()"
Cohesion: 0.36
Nodes (5): ApplyResult, RepoSync, Date, Int, ModelContext

### Community 111 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 112 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 113 - "ModelFallback"
Cohesion: 0.40
Nodes (5): ModelFallback, Bool, CatalogEntry, LLMProvider, String

### Community 114 - "FakeCompletion"
Cohesion: 0.20
Nodes (8): FakeCompletion, AsyncThrowingStream, Error, Int, LLMRequest, LLMResponse, LLMStreamEvent, LLMUsage

### Community 115 - "ThemeDetailView"
Cohesion: 0.27
Nodes (9): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions (+1 more)

### Community 116 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 117 - "FakePIN"
Cohesion: 0.31
Nodes (5): BiometricLockKit, AppLockCoordinatorTests, FakePIN, PINAttemptResult, String

### Community 118 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 119 - "GitHubRepo"
Cohesion: 0.33
Nodes (7): Decodable, GitHubRepo, .id, Bool, Document, RepoSnapshot, String

### Community 120 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 121 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 122 - ".clusters()"
Cohesion: 0.36
Nodes (5): Group, Bool, UUID, UnionFind, .body

### Community 123 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 124 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 125 - "CannedLLM"
Cohesion: 0.27
Nodes (7): CannedLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent, String

### Community 126 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 127 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 128 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 129 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 130 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 131 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 132 - ".passages()"
Cohesion: 0.31
Nodes (7): MatchBadge, .body, SearchResultsView, .body, ModelContext, String, UUID

### Community 133 - ".buildIfDue()"
Cohesion: 0.31
Nodes (6): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval

### Community 134 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 135 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 136 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 137 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 138 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 139 - "BackupError"
Cohesion: 0.29
Nodes (7): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, Int

### Community 140 - "LibraryFixture"
Cohesion: 0.38
Nodes (4): LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 141 - "ModelFallbackTests"
Cohesion: 0.38
Nodes (6): ModelFallbackTests, .catalog, Bool, CatalogEntry, Double, Int

### Community 142 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 143 - "EncryptedBackup.swift"
Cohesion: 0.33
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 144 - "SearchHit"
Cohesion: 0.40
Nodes (6): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double

### Community 145 - "ProviderKeyRow"
Cohesion: 0.33
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 146 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 147 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 149 - "RepoSyncTests"
Cohesion: 0.50
Nodes (3): RepoSyncTests, Bool, String

### Community 150 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 151 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 153 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 154 - "ExtractionPrompt"
Cohesion: 0.67
Nodes (3): ExtractionPrompt, .schema, JSONValue

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **292 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+287 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 581 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `ActionRequest`, `Article`, `DailyBudget`, `IngestError`, `GitHubDeviceFlow`, `StrategyItemKind`, `KnowledgeStore`, `EncryptedBackup.swift`, `Identifiable`, `ExtractedArticle`, `.parse()`, `BYOKLLMKit`, `Dependency`, `PerfTrace`, `SourceFetcher`, `GitHubError`, `DigestSummaryRequest`, `SwiftUI`, `BriefViews.swift`, `AppLock.swift`, `ParsedFeed`, `.graphML()`, `.score()`, `TopK`?**
  _High betweenness centrality (0.064) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `ActionRequest`, `XCTestCase`, `BYOKLLMKit`, `Article`, `StrategyItemKind`, `ThemeStrengthCache`, `SourceFetcher`, `.graphML()`, `GraphIndexer`, `SwiftData`, `EncryptedBackup.swift`, `EntityResolver`, `.retrieve()`, `BriefViews.swift`, `SwiftUI`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `XCTestCase`, `Project`, `.passages()`, `ArticleReaderView`, `PipelineRunner`, `.makeContainer()`, `InterestModel`, `RetrievedPassage`, `EmbeddingModel`, `.load()`, `ThemeStrengthCache`, `makeContext()`, `DigestSummaryRequest`, `.article()`, `DigestCluster`, `.save()`, `IngestController`, `RetrievalFixture`, `Source`, `ReadingView`, `.apply()`, `.importItems()`, `ArticleStage`, `.clusters()`?**
  _High betweenness centrality (0.039) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _292 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ActionRequest` be split into smaller, more focused modules?**
  _Cohesion score 0.05493827160493827 - nodes in this community are weakly interconnected._
- **Should `XCTestCase` be split into smaller, more focused modules?**
  _Cohesion score 0.05878332194121668 - nodes in this community are weakly interconnected._
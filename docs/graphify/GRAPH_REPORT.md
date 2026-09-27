# Graph Report - SmartWard  (2026-09-27)

## Corpus Check
- Large corpus: 146 files · ~565,948 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2662 nodes · 6872 edges · 136 communities (134 shown, 2 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 821 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- AppLockCoordinator
- ModelFallback
- SharedInbox
- DailyBudget
- ThemeNode
- LibraryFixture
- .makeContainer()
- Project
- .score()
- GitHubDeviceFlow
- RetrievedPassage
- StrategistRunner
- .process()
- GitHubClient
- DeveloperView
- IngestError
- StrategyItemKind
- Sendable
- FakeTransport
- XCTestCase
- KnowledgeStore
- ExtractionTiers
- Conversation
- Foundation
- .fetchURL()
- ActionRequest
- PipelineRunner
- InterestModel
- .extract()
- RawItem
- .dismiss()
- HybridSearchIndex
- Digest
- Phase 5: Hardening
- ConversationView
- BYOKLLMKit
- Pipeline module (ingestion, graph, searc
- GraphRAG
- .items()
- ExtractedGraph
- .load()
- View
- Choice
- Invariant D5: Private content never goes
- Dependency
- SwiftData
- ThemeStrengthCache
- ProjectSnapshot
- RecordStrategyItemTool
- LexicalIndex
- OnboardingProposal
- DigestSummaryRequest
- DigestBuilder
- .retrieve()
- .send()
- .article()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- GraphSnapshot
- SearchDocument
- Article
- SearchHit
- .build()
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- .fetch()
- Approval Before Actions
- GitHubRepoPicker
- OnboardingView
- Strategist Layer
- DigestCluster
- Scenario
- Kind
- AskStrategistIntent
- GraphCanvas
- CodingKeys
- SmartWard (iOS Application Target)
- ContextAssembler token budget and fencin
- GitHubAccount
- EntityResolver
- .plan()
- .messages()
- .testToolsOutsideTheModeAreNeverOffered(
- BackupView
- SmartWardIntents.swift
- SmartWardShare (Share Extension Target)
- .request()
- GraphIndexer
- RetrievalFixture
- SmartWard XcodeGen Project Spec
- Inference Layer
- LibraryArchive
- SourceKind
- .data()
- SeededRandom
- .canonicalize()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- ThemeNode (SwiftData model)
- OnboardingReviewView
- What the Simulator Can't Show
- Presentation Layer (SwiftUI)
- FakeSummarizer
- ThemeDetailView
- SmartWardApp
- ChatController
- Prompt-injection defense
- ExtractedArticle
- ArticleStage
- TopK
- AppTab
- FoundationModelsEntityExtractor
- SourceKindOption
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- GitHubError
- EmbeddingModel
- Observation
- ArchiveError
- Graph View
- ArticleReaderView
- ActivitySheet
- UntrustedText (body/attribute inside its
- StrategyItemsSection
- FoundationModelsRelevanceJudge
- Living Project Brief
- RepoSyncTests
- BackgroundWork.swift
- KnowledgeSchema
- Apple Intelligence Preflight
- IntentFailure
- BYOKDigestSummarizer
- graphify_pipeline.py
- ExtractionPrompt
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 87 edges
2. `SwiftData` - 75 edges
3. `Project` - 69 edges
4. `Article` - 60 edges
5. `Source` - 48 edges
6. `ThemeNode` - 48 edges
7. `Conversation` - 36 edges
8. `ProjectLink` - 35 edges
9. `HybridSearchIndex` - 35 edges
10. `LibraryArchive` - 34 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
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

## Communities (136 total, 2 thin omitted)

### Community 0 - "AppLockCoordinator"
Cohesion: 0.05
Nodes (48): AnyObject, AppLock, BiometricLockKit, BiometricResult, BiometricUnavailable, BiometryType, AppLockCoordinator, .biometryName (+40 more)

### Community 1 - "ModelFallback"
Cohesion: 0.05
Nodes (42): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+34 more)

### Community 2 - "SharedInbox"
Cohesion: 0.06
Nodes (34): JSONDecoder, JSONEncoder, NSExtensionContext, Result, SharedImport, Date, Int, ModelContext (+26 more)

### Community 3 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 4 - "ThemeNode"
Cohesion: 0.12
Nodes (23): BriefRevision, EntityAlias, InterestProfile, Mention, MergeSuggestion, ProjectBrief, ReadingSignal, Date (+15 more)

### Community 5 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 6 - ".makeContainer()"
Cohesion: 0.09
Nodes (16): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+8 more)

### Community 7 - "Project"
Cohesion: 0.11
Nodes (20): Project, BriefEditing, tooLong, BriefReviser, Suggestion, Date, LLMCompleting, LLMProvider (+12 more)

### Community 8 - ".score()"
Cohesion: 0.07
Nodes (28): Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive, String (+20 more)

### Community 9 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (27): HTTPTransport, GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed (+19 more)

### Community 10 - "RetrievedPassage"
Cohesion: 0.11
Nodes (19): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, JSONValue, LLMTool (+11 more)

### Community 11 - "StrategistRunner"
Cohesion: 0.14
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 12 - ".process()"
Cohesion: 0.08
Nodes (26): BGContinuedProcessingTask, BackgroundWork, TimeInterval, FullTextError, .errorDescription, nothingMore, IngestController, Bool (+18 more)

### Community 13 - "GitHubClient"
Cohesion: 0.12
Nodes (16): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, Bool, Data (+8 more)

### Community 14 - "DeveloperView"
Cohesion: 0.10
Nodes (23): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+15 more)

### Community 15 - "IngestError"
Cohesion: 0.11
Nodes (25): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+17 more)

### Community 16 - "StrategyItemKind"
Cohesion: 0.07
Nodes (31): CaseIterable, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, StrategyItem (+23 more)

### Community 17 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 18 - "FakeTransport"
Cohesion: 0.15
Nodes (13): SourceDescriptor, SourceFetcher, UUID, FakeTransport, Data, HTTPURLResponse, URLRequest, FakeClock (+5 more)

### Community 19 - "XCTestCase"
Cohesion: 0.10
Nodes (14): ContextPolicy, Bool, Chunk, Bool, Data, Int, ContextPolicyTests, makeContext() (+6 more)

### Community 20 - "KnowledgeStore"
Cohesion: 0.15
Nodes (5): IngestKit, KnowledgeStore, Pipeline, RetrievalKit, XCTest

### Community 21 - "ExtractionTiers"
Cohesion: 0.11
Nodes (18): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 22 - "Conversation"
Cohesion: 0.11
Nodes (21): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+13 more)

### Community 23 - "Foundation"
Cohesion: 0.08
Nodes (10): CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, Security, AppStore, Error (+2 more)

### Community 24 - ".fetchURL()"
Cohesion: 0.17
Nodes (10): SourceEndpoint, Bool, Data, HTTPURLResponse, String, URL, SourceEndpointTests, String (+2 more)

### Community 25 - "ActionRequest"
Cohesion: 0.13
Nodes (21): LocalizedError, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+13 more)

### Community 26 - "PipelineRunner"
Cohesion: 0.16
Nodes (16): FullTextFetching, PipelineRunner, .stages, Report, Bool, Date, Double, ModelContext (+8 more)

### Community 27 - "InterestModel"
Cohesion: 0.15
Nodes (17): Interest, InterestModel, .isEmpty, Strength, balanced, off, strict, .threshold (+9 more)

### Community 28 - ".extract()"
Cohesion: 0.18
Nodes (7): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, Unicode

### Community 29 - "RawItem"
Cohesion: 0.16
Nodes (13): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+5 more)

### Community 30 - ".dismiss()"
Cohesion: 0.12
Nodes (20): LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView (+12 more)

### Community 31 - "HybridSearchIndex"
Cohesion: 0.17
Nodes (11): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+3 more)

### Community 32 - "Digest"
Cohesion: 0.13
Nodes (18): Digest, .clusters, Bool, Date, DigestController, .notificationsEnabled, FoundationModelsDigestSummarizer, Bool (+10 more)

### Community 33 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 34 - "ConversationView"
Cohesion: 0.12
Nodes (19): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, EmptyChatHint (+11 more)

### Community 35 - "BYOKLLMKit"
Cohesion: 0.13
Nodes (5): BYOKLLMKit, ModelCatalogKit, ActionTools, BriefOrigin, StrategistCore

### Community 36 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 37 - "GraphRAG"
Cohesion: 0.17
Nodes (23): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, C5 Store vectors as binary Data, not JSON snapshots, C7 Explicit Mention join entity replaces many-to-many, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-11 GraphRAG every turn with why-retrieved (+15 more)

### Community 38 - ".items()"
Cohesion: 0.16
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 39 - "ExtractedGraph"
Cohesion: 0.19
Nodes (12): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+4 more)

### Community 40 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 41 - "View"
Cohesion: 0.11
Nodes (20): GitHubSettingsSection, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body, DigestSettingsSection (+12 more)

### Community 42 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 43 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 44 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 45 - "SwiftData"
Cohesion: 0.19
Nodes (3): FoundationModels, SwiftData, SwiftUI

### Community 46 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 47 - "ProjectSnapshot"
Cohesion: 0.20
Nodes (7): Item, ProjectSnapshot, StrategistPrompt, Bool, Set, String, StrategistPromptTests

### Community 48 - "RecordStrategyItemTool"
Cohesion: 0.17
Nodes (12): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, .definition (+4 more)

### Community 49 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 50 - "OnboardingProposal"
Cohesion: 0.15
Nodes (15): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+7 more)

### Community 51 - "DigestSummaryRequest"
Cohesion: 0.19
Nodes (8): DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, LLMUsage, String, String, UntrustedText

### Community 52 - "DigestBuilder"
Cohesion: 0.21
Nodes (10): DigestBuilder, DigestSummarizing, Group, Bool, Date, Int, ModelContext, TimeInterval (+2 more)

### Community 53 - ".retrieve()"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 54 - ".send()"
Cohesion: 0.19
Nodes (13): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, SearchCorpusTool, .definition, LLMTool (+5 more)

### Community 55 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 56 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 57 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 58 - "GraphSnapshot"
Cohesion: 0.18
Nodes (16): Hashable, ForceLayout, GraphSnapshot, Point, GraphSnapshotTests, GraphView, .asList, .body (+8 more)

### Community 59 - "SearchDocument"
Cohesion: 0.22
Nodes (11): Accelerate, SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID (+3 more)

### Community 60 - "Article"
Cohesion: 0.15
Nodes (13): Article, ArticleRow, .body, .content, ReadingView, .emptyState, .filteredOutCount, .hasFollowedSources (+5 more)

### Community 61 - "SearchHit"
Cohesion: 0.18
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 62 - ".build()"
Cohesion: 0.22
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 63 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 64 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 65 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 66 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 67 - "GitHubRepoPicker"
Cohesion: 0.14
Nodes (14): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+6 more)

### Community 68 - "OnboardingView"
Cohesion: 0.16
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 69 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 70 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 71 - "Scenario"
Cohesion: 0.23
Nodes (11): Attack, RedTeamTests, Scenario, .system, Bool, JSONValue, LLMChatMessage, LLMToolCall (+3 more)

### Community 72 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 73 - "AskStrategistIntent"
Cohesion: 0.20
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, IntentResult, LocalizedStringResource, ParameterSummary, ProvidesDialog (+5 more)

### Community 74 - "GraphCanvas"
Cohesion: 0.20
Nodes (12): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body, UUID, Void (+4 more)

### Community 75 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 76 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 77 - "ContextAssembler token budget and fencin"
Cohesion: 0.18
Nodes (15): B3 Extraction routing by content class, BYOKExtractor, C2 BYOKLLMKit lacks tool calling and structured output, ContextAssembler token budget and fencing, Conversation indexing pipeline, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol (+7 more)

### Community 78 - "GitHubAccount"
Cohesion: 0.23
Nodes (9): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+1 more)

### Community 79 - "EntityResolver"
Cohesion: 0.30
Nodes (7): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID

### Community 80 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 81 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 82 - ".testToolsOutsideTheModeAreNeverOffered("
Cohesion: 0.24
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 83 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 84 - "SmartWardIntents.swift"
Cohesion: 0.24
Nodes (10): AppEntity, AppIntents, DisplayRepresentation, EntityQuery, libraryContext(), ProjectEntity, .displayRepresentation, ProjectQuery (+2 more)

### Community 85 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 86 - ".request()"
Cohesion: 0.18
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 87 - "GraphIndexer"
Cohesion: 0.25
Nodes (8): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String

### Community 88 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 89 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 90 - "Inference Layer"
Cohesion: 0.21
Nodes (13): AppleFMKit, D3 iPhone 15 Pro minimum device, DecisionKit proposed ODK module, DecisionProviding protocol seam, Inference Layer, Jev typed decision models, LangChain - What Is Jev?, LocalLLMKit dropped from scope (+5 more)

### Community 91 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 92 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 93 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 94 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 95 - ".canonicalize()"
Cohesion: 0.21
Nodes (8): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL, CanonicalURLTests

### Community 96 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 97 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 98 - "ThemeNode (SwiftData model)"
Cohesion: 0.29
Nodes (12): B2 Never auto-merge differing version tokens, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver, FR-13 Theme-clustered digest with notification, FR-17 Usage and cost ledger with daily cap, FR-7 Entity resolution and manual merge/split (+4 more)

### Community 99 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 100 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 101 - "Presentation Layer (SwiftUI)"
Cohesion: 0.22
Nodes (11): C4 ODK core packages are iOS-only, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts, FR-21 Mac companion with CloudKit sync, NFR-3 Data ownership and open formats, NFR-4 Retrieval latency under 500 ms, Phase 5 Hardening, Phase 6 Mac companion and sync (+3 more)

### Community 102 - "FakeSummarizer"
Cohesion: 0.27
Nodes (7): DigestBuilderTests, DigestFixture, FakeSummarizer, Date, LLMUsage, ModelContainer, ModelContext

### Community 103 - "ThemeDetailView"
Cohesion: 0.27
Nodes (9): Connection, .id, Int, String, ThemeDetailView, .body, .connections, .recentMentions (+1 more)

### Community 104 - "SmartWardApp"
Cohesion: 0.20
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 105 - "ChatController"
Cohesion: 0.31
Nodes (6): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, String

### Community 106 - "Prompt-injection defense"
Cohesion: 0.29
Nodes (10): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage, NFR-7 Injection-safe tool execution (+2 more)

### Community 107 - "ExtractedArticle"
Cohesion: 0.27
Nodes (6): ExtractedArticle, Date, URL, RecordingFetcher, URL, SwiftSoup

### Community 108 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 109 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 110 - "AppTab"
Cohesion: 0.24
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 111 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 112 - "SourceKindOption"
Cohesion: 0.22
Nodes (9): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage (+1 more)

### Community 113 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 114 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 115 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 116 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 117 - "EmbeddingModel"
Cohesion: 0.33
Nodes (5): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, Int

### Community 118 - "Observation"
Cohesion: 0.25
Nodes (3): Observation, GitHubConfig, UserNotifications

### Community 119 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 120 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 121 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 122 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 123 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 124 - "StrategyItemsSection"
Cohesion: 0.43
Nodes (5): BriefEditorView, .body, StrategyItemsSection, .body, String

### Community 125 - "FoundationModelsRelevanceJudge"
Cohesion: 0.33
Nodes (6): FoundationModelsRelevanceJudge, Bool, String, Triage.Strength, .label, Verdict

### Community 126 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 127 - "RepoSyncTests"
Cohesion: 0.40
Nodes (3): RepoSyncTests, Bool, String

### Community 129 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 130 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 131 - "IntentFailure"
Cohesion: 0.40
Nodes (5): IntentFailure, .errorDescription, libraryUnavailable, noProvider, String

### Community 132 - "BYOKDigestSummarizer"
Cohesion: 0.83
Nodes (3): BYOKDigestSummarizer, LLMCompleting, LLMProvider

### Community 133 - "graphify_pipeline.py"
Cohesion: 0.67
Nodes (3): keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…

### Community 134 - "ExtractionPrompt"
Cohesion: 0.67
Nodes (3): ExtractionPrompt, .schema, JSONValue

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **275 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+270 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 527 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **2 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `Foundation` to `AppLockCoordinator`, `BackgroundWork.swift`, `KnowledgeSchema`, `DailyBudget`, `ThemeNode`, `SharedInbox`, `.score()`, `GitHubDeviceFlow`, `GitHubClient`, `DeveloperView`, `IngestError`, `FakeTransport`, `XCTestCase`, `KnowledgeStore`, `ExtractionTiers`, `ActionRequest`, `BYOKLLMKit`, `.items()`, `Dependency`, `SwiftData`, `ProjectSnapshot`, `DigestSummaryRequest`, `SearchDocument`, `SmartWardIntents.swift`, `.canonicalize()`, `ExtractedArticle`, `TopK`, `AppTab`, `Observation`?**
  _High betweenness centrality (0.051) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `BackgroundWork.swift`, `BYOKLLMKit`, `ThemeNode`, `StrategistRunner`, `SwiftData`, `ThemeStrengthCache`, `ProjectSnapshot`, `FakeTransport`, `XCTestCase`, `Foundation`, `.retrieve()`, `Observation`, `GraphIndexer`, `SmartWardIntents.swift`, `SearchDocument`?**
  _High betweenness centrality (0.041) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `SharedInbox`, `ThemeNode`, `.makeContainer()`, `XCTestCase`, `ExtractionTiers`, `Conversation`, `PipelineRunner`, `RawItem`, `.dismiss()`, `ConversationView`, `.load()`, `ThemeStrengthCache`, `LexicalIndex`, `DigestBuilder`, `.article()`, `SearchDocument`, `SearchHit`, `.fetch()`, `DigestCluster`, `RetrievalFixture`, `ArticleStage`, `EmbeddingModel`, `ArticleReaderView`?**
  _High betweenness centrality (0.033) - this node is a cross-community bridge._
- **Are the 21 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 21 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _275 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `AppLockCoordinator` be split into smaller, more focused modules?**
  _Cohesion score 0.050580997949419004 - nodes in this community are weakly interconnected._
# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 163 files · ~619,592 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2917 nodes · 7495 edges · 152 communities (149 shown, 3 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 890 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Sendable
- Project
- IngestError
- GitHubDeviceFlow
- String
- ModelFallback
- LocalizedError
- Source
- ThemeNode
- StrategistRunner
- SwiftUI
- PipelineRunner
- SwiftData
- HybridSearchIndex
- RetrievedPassage
- ReferenceLedger
- ConversationView
- .makeContainer()
- .load()
- StrategyItemKind
- KnowledgeStore
- ExtractedArticle
- ActionRequest
- ExtractedGraph
- Conversation
- .run()
- Phase 5: Hardening
- BYOKLLMKit
- Pipeline module (ingestion, graph, searc
- SharedInbox
- .parse()
- .fetch()
- DigestSummaryRequest
- InterestModel
- RecordStrategyItemTool
- .outcome()
- Choice
- ModelCatalogController
- Invariant D5: Private content never goes
- PerfTrace
- .score()
- AppLockCoordinator
- GitHubClient
- Dependency
- GraphIndexer
- StrategistTool
- XCTestCase
- OnboardingView
- GraphRAG
- .fetchURL()
- Article
- ThemeStrengthCache
- .article()
- LexicalIndex
- SourceFetcher
- PriceBook
- DigestBuilder
- .process()
- GraphSnapshot
- FakeExtractor
- GitHubRepoPicker
- SourceKindOption
- AskStrategistIntent
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- Digest
- .seal()
- SecuritySettingsSection
- Scenario
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- Identifiable
- Approval Before Actions
- View
- BackgroundWork
- ArticleStage
- Strategist Layer
- ShareModel
- .save()
- .decode()
- SearchHit
- .body
- ThemeDetailView
- .refresh()
- SmartWard (iOS Application Target)
- .messages()
- FakeTransport
- PlaybackLLM
- RefreshEagerness
- BackupView
- .buildIfDue()
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- .projects()
- AppLock.swift
- SmartWard XcodeGen Project Spec
- AppLockPolicy
- SourceKind
- makeContext()
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- GitHubError
- GitHubRepo
- .text()
- LibraryFixture
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .update()
- .canonicalize()
- graphify_pipeline.py
- .record()
- .decision()
- TopK
- FakeBiometrics
- AppLockController
- Filter
- GraphCanvas
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .clusters()
- AppTab
- FoundationModelsEntityExtractor
- ArticleReaderView
- .importItems()
- SharedItem
- Graph View
- DigestClusterSection
- ActivitySheet
- VoiceSettingsSection
- AppLockTests.swift
- UntrustedText (body/attribute inside its
- .availability()
- SmartWardIntents.swift
- Living Project Brief
- EmbeddingModel
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Apple Intelligence Preflight
- MatchKind
- KnowledgeSchema
- BYOKDigestSummarizer
- .layout()
- AppStore
- ExtractionPrompt
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 90 edges
2. `SwiftData` - 77 edges
3. `Article` - 69 edges
4. `Project` - 68 edges
5. `Source` - 55 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `XCTest` - 36 edges
9. `BYOKLLMKit` - 35 edges
10. `PipelineRunner` - 35 edges

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

## Communities (152 total, 3 thin omitted)

### Community 0 - "Sendable"
Cohesion: 0.05
Nodes (80): Codable, Equatable, Result, Int, GitHubUser, Result, Int, AliasRecord (+72 more)

### Community 1 - "Project"
Cohesion: 0.07
Nodes (40): BriefRevision, Project, ProjectBrief, BriefDiff, BriefEditing, tooLong, BriefReviser, Line (+32 more)

### Community 2 - "IngestError"
Cohesion: 0.05
Nodes (42): NSObject, HTTPTransport, IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse (+34 more)

### Community 3 - "GitHubDeviceFlow"
Cohesion: 0.05
Nodes (43): CodingKey, CodingKeys, deviceCode, expiresIn, interval, userCode, verificationURI, GitHubDeviceCode (+35 more)

### Community 4 - "String"
Cohesion: 0.07
Nodes (33): ContextPolicy, Bool, .status, BriefRevisionStatus, accepted, pending, rejected, superseded (+25 more)

### Community 5 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 6 - "LocalizedError"
Cohesion: 0.06
Nodes (37): LocalizedError, LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext (+29 more)

### Community 7 - "Source"
Cohesion: 0.11
Nodes (21): FeedIngest, Bool, Date, Error, ModelContext, String, TimeInterval, RawItem (+13 more)

### Community 8 - "ThemeNode"
Cohesion: 0.12
Nodes (17): MergeSuggestion, Double, ThemeNode, EntityResolver, Resolution, Bool, Float, ModelContext (+9 more)

### Community 9 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 10 - "SwiftUI"
Cohesion: 0.08
Nodes (9): BackgroundTasks, FoundationModels, Observation, Pipeline, ShareInbox, SwiftUI, UIKit, UniformTypeIdentifiers (+1 more)

### Community 11 - "PipelineRunner"
Cohesion: 0.12
Nodes (20): DailyBudget, ExtractionTiers, FullTextFetching, PipelineRunner, Report, Bool, Date, Double (+12 more)

### Community 12 - "SwiftData"
Cohesion: 0.10
Nodes (8): Accelerate, CommonCrypto, CryptoKit, Foundation, NaturalLanguage, RetrievalKit, Security, SwiftData

### Community 13 - "HybridSearchIndex"
Cohesion: 0.14
Nodes (18): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, SearchCorpus, SearchDocument, Bool, Float (+10 more)

### Community 14 - "RetrievedPassage"
Cohesion: 0.11
Nodes (20): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+12 more)

### Community 15 - "ReferenceLedger"
Cohesion: 0.13
Nodes (18): Decodable, Arguments, ReferenceContext, Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition (+10 more)

### Community 16 - "ConversationView"
Cohesion: 0.10
Nodes (21): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+13 more)

### Community 17 - ".makeContainer()"
Cohesion: 0.12
Nodes (12): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+4 more)

### Community 18 - ".load()"
Cohesion: 0.12
Nodes (18): Data, Float, VectorCoding, SampleLibrary, Size, SplitMix, Bool, Date (+10 more)

### Community 19 - "StrategyItemKind"
Cohesion: 0.13
Nodes (14): StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition, Item (+6 more)

### Community 20 - "KnowledgeStore"
Cohesion: 0.15
Nodes (4): IngestKit, KnowledgeStore, GitHubConfig, XCTest

### Community 21 - "ExtractedArticle"
Cohesion: 0.15
Nodes (11): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+3 more)

### Community 22 - "ActionRequest"
Cohesion: 0.15
Nodes (14): AddSourceTool, .definition, .kinds, FetchURLTool, .definition, Bool, JSONValue, LLMTool (+6 more)

### Community 23 - "ExtractedGraph"
Cohesion: 0.16
Nodes (13): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+5 more)

### Community 24 - "Conversation"
Cohesion: 0.11
Nodes (21): Conversation, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+13 more)

### Community 25 - ".run()"
Cohesion: 0.18
Nodes (14): CheckedContinuation, Never, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider, ModelContext (+6 more)

### Community 26 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 27 - "BYOKLLMKit"
Cohesion: 0.14
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 28 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 29 - "SharedInbox"
Cohesion: 0.14
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, URL, SharedInboxTests, URL (+3 more)

### Community 30 - ".parse()"
Cohesion: 0.16
Nodes (10): Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String, FeedParserTests (+2 more)

### Community 31 - ".fetch()"
Cohesion: 0.18
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 32 - "DigestSummaryRequest"
Cohesion: 0.17
Nodes (9): DigestPrompt, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMUsage, String, String (+1 more)

### Community 33 - "InterestModel"
Cohesion: 0.18
Nodes (12): Interest, InterestModel, .isEmpty, Bool, Double, Float, ModelContext, Set (+4 more)

### Community 34 - "RecordStrategyItemTool"
Cohesion: 0.15
Nodes (12): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue (+4 more)

### Community 35 - ".outcome()"
Cohesion: 0.14
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 36 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 37 - "ModelCatalogController"
Cohesion: 0.17
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 38 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 39 - "PerfTrace"
Cohesion: 0.16
Nodes (15): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+7 more)

### Community 40 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 41 - "AppLockCoordinator"
Cohesion: 0.16
Nodes (13): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, PINOutcome, incorrect, lockedOut, noPIN, unlocked (+5 more)

### Community 42 - "GitHubClient"
Cohesion: 0.22
Nodes (9): GitHubClient, .isAuthenticated, Data, HTTPURLResponse, Set, String, T, URLRequest (+1 more)

### Community 43 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 44 - "GraphIndexer"
Cohesion: 0.14
Nodes (12): EntityExtracting, ExtractionTier, byok, onDevice, GraphIndexer, .suggestionsAdded, GraphLinker, Result (+4 more)

### Community 45 - "StrategistTool"
Cohesion: 0.14
Nodes (16): StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult, StrategistTool (+8 more)

### Community 46 - "XCTestCase"
Cohesion: 0.11
Nodes (14): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, SampleLibraryTests, PerformanceTests, SeededRandom, String (+6 more)

### Community 47 - "OnboardingView"
Cohesion: 0.10
Nodes (19): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+11 more)

### Community 48 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 49 - ".fetchURL()"
Cohesion: 0.22
Nodes (7): SourceEndpoint, Bool, String, URL, SourceEndpointTests, String, URL

### Community 50 - "Article"
Cohesion: 0.15
Nodes (17): Article, Int, TriageDisplayTests, ArticleRow, .body, .content, .relevancePercent, ReadingView (+9 more)

### Community 51 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 52 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 53 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 54 - "SourceFetcher"
Cohesion: 0.23
Nodes (6): SourceDescriptor, SourceFetcher, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 55 - "PriceBook"
Cohesion: 0.19
Nodes (11): Line, .id, Price, PriceBook, Bool, Double, Int, String (+3 more)

### Community 56 - "DigestBuilder"
Cohesion: 0.17
Nodes (12): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, FakeSummarizer (+4 more)

### Community 57 - ".process()"
Cohesion: 0.13
Nodes (14): Triage, .body, FoundationModelsRelevanceJudge, PipelineController, .strength, Bool, Int, ModelContext (+6 more)

### Community 58 - "GraphSnapshot"
Cohesion: 0.23
Nodes (14): Edge, GraphSnapshot, Node, Scope, all, recent, source, Bool (+6 more)

### Community 59 - "FakeExtractor"
Cohesion: 0.16
Nodes (13): FakeCompletion, FakeExtractor, GraphIndexingTests, AsyncThrowingStream, Bool, Error, Int, LLMRequest (+5 more)

### Community 60 - "GitHubRepoPicker"
Cohesion: 0.12
Nodes (16): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+8 more)

### Community 61 - "SourceKindOption"
Cohesion: 0.15
Nodes (16): AppEntity, AppEnum, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, SourceKindOption (+8 more)

### Community 62 - "AskStrategistIntent"
Cohesion: 0.16
Nodes (16): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, IntentResult, LocalizedStringResource, ParameterSummary, ProvidesDialog (+8 more)

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

### Community 67 - "SecuritySettingsSection"
Cohesion: 0.15
Nodes (16): AppLock, PINLockKit, LockScreen, SecuritySettingsSection, .body, .lockBinding, .toggleTitle, SetPINView (+8 more)

### Community 68 - "Scenario"
Cohesion: 0.21
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 69 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 70 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 71 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 72 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 73 - "Identifiable"
Cohesion: 0.15
Nodes (16): Identifiable, ExportView, .body, Kind, .detail, .fileExtension, graph, .id (+8 more)

### Community 74 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 75 - "View"
Cohesion: 0.19
Nodes (15): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+7 more)

### Community 76 - "BackgroundWork"
Cohesion: 0.18
Nodes (8): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, BackgroundWork, Date, TimeInterval

### Community 77 - "ArticleStage"
Cohesion: 0.12
Nodes (16): CaseIterable, .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched (+8 more)

### Community 78 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 79 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 80 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 81 - ".decode()"
Cohesion: 0.16
Nodes (6): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests

### Community 82 - "SearchHit"
Cohesion: 0.22
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 83 - ".body"
Cohesion: 0.12
Nodes (12): ScenePhase, NewProjectView, .body, ProjectDetailView, .links, ProjectsView, .body, ComingSoonView (+4 more)

### Community 84 - "ThemeDetailView"
Cohesion: 0.19
Nodes (14): Connection, .id, String, UUID, Void, ThemeDetailView, .body, .connections (+6 more)

### Community 85 - ".refresh()"
Cohesion: 0.21
Nodes (13): FullTextError, .errorDescription, nothingMore, IngestController, Bool, Int, ModelContext, Set (+5 more)

### Community 86 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 87 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 88 - "FakeTransport"
Cohesion: 0.22
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 89 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 90 - "RefreshEagerness"
Cohesion: 0.14
Nodes (15): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+7 more)

### Community 91 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 92 - ".buildIfDue()"
Cohesion: 0.18
Nodes (11): DigestController, .notificationsEnabled, FoundationModelsDigestSummarizer, Bool, ModelContext, String, TimeInterval, DigestSettingsSection (+3 more)

### Community 93 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 94 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 95 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 96 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 97 - "AppLock.swift"
Cohesion: 0.24
Nodes (8): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricResult, PINAttemptResult, String

### Community 98 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 99 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 100 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 101 - "makeContext()"
Cohesion: 0.22
Nodes (5): ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 102 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 103 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 104 - "GitHubError"
Cohesion: 0.20
Nodes (10): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+2 more)

### Community 105 - "GitHubRepo"
Cohesion: 0.18
Nodes (11): CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt, topics (+3 more)

### Community 106 - ".text()"
Cohesion: 0.24
Nodes (6): RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests

### Community 107 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 108 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 109 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 110 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 111 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 112 - ".update()"
Cohesion: 0.22
Nodes (8): PrivacyCover, .body, LockOverlay, .body, LockWindow, Bool, UIWindow, UIWindowScene

### Community 113 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 114 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 115 - ".record()"
Cohesion: 0.49
Nodes (4): Calendar, Date, ModelContext, UsageLedger

### Community 116 - ".decision()"
Cohesion: 0.33
Nodes (4): ActionTools, Set, String, ApprovalPolicyTests

### Community 117 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 118 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 119 - "AppLockController"
Cohesion: 0.27
Nodes (7): AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 120 - "Filter"
Cohesion: 0.20
Nodes (10): Filter, all, .id, starred, unread, Order, .id, newest (+2 more)

### Community 121 - "GraphCanvas"
Cohesion: 0.31
Nodes (6): CGFloat, Color, .body, ThemeStyle, GraphCanvas, .body

### Community 122 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 123 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 124 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 125 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 126 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 127 - "FoundationModelsEntityExtractor"
Cohesion: 0.39
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 128 - "ArticleReaderView"
Cohesion: 0.25
Nodes (8): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL, .body

### Community 129 - ".importItems()"
Cohesion: 0.43
Nodes (4): SharedImport, Date, ModelContext, SharedImportTests

### Community 130 - "SharedItem"
Cohesion: 0.50
Nodes (5): SharedItem, SharedProject, Date, String, UUID

### Community 131 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 132 - "DigestClusterSection"
Cohesion: 0.32
Nodes (6): DigestClusterSection, .body, DigestSections, .body, String, UUID

### Community 133 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 134 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 135 - "AppLockTests.swift"
Cohesion: 0.29
Nodes (3): BiometricLockKit, PINRules, PINRulesTests

### Community 136 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 137 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 138 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 139 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 140 - "EmbeddingModel"
Cohesion: 0.53
Nodes (4): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer

### Community 141 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 142 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 143 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 144 - "MatchKind"
Cohesion: 0.67
Nodes (3): OptionSet, MatchKind, Int

### Community 145 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 146 - "BYOKDigestSummarizer"
Cohesion: 0.83
Nodes (3): BYOKDigestSummarizer, LLMCompleting, LLMProvider

### Community 148 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 149 - "ExtractionPrompt"
Cohesion: 0.67
Nodes (3): ExtractionPrompt, .schema, JSONValue

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **306 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+301 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 603 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `SwiftData` to `IngestError`, `GitHubDeviceFlow`, `String`, `SharedItem`, `SwiftUI`, `SmartWardIntents.swift`, `StrategyItemKind`, `KnowledgeStore`, `ExtractedArticle`, `BYOKLLMKit`, `.parse()`, `DigestSummaryRequest`, `.outcome()`, `PerfTrace`, `.score()`, `Dependency`, `StrategistTool`, `SourceFetcher`, `Digest`, `AppLock.swift`, `GitHubError`, `.text()`, `.canonicalize()`, `TopK`?**
  _High betweenness centrality (0.060) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Project`, `.score()`, `ThemeNode`, `SwiftUI`, `StrategistRunner`, `SwiftData`, `GraphIndexer`, `RetrievedPassage`, `HybridSearchIndex`, `SmartWardIntents.swift`, `StrategyItemKind`, `ThemeStrengthCache`, `SourceFetcher`, `GraphSnapshot`, `BYOKLLMKit`?**
  _High betweenness centrality (0.043) - this node is a cross-community bridge._
- **Why does `SwiftData` connect `SwiftData` to `Digest`, `Project`, `String`, `SwiftUI`, `SmartWardIntents.swift`, `KnowledgeStore`, `BYOKLLMKit`?**
  _High betweenness centrality (0.040) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _306 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Sendable` be split into smaller, more focused modules?**
  _Cohesion score 0.052464525765496636 - nodes in this community are weakly interconnected._
- **Should `Project` be split into smaller, more focused modules?**
  _Cohesion score 0.07246376811594203 - nodes in this community are weakly interconnected._
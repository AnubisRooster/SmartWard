# Graph Report - SmartWard  (2026-09-29)

## Corpus Check
- Large corpus: 167 files · ~627,565 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2972 nodes · 7616 edges · 163 communities (159 shown, 4 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 906 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Article
- Project
- IngestError
- StrategyItemKind
- ModelFallback
- DailyBudget
- RefreshEagerness
- StrategistRunner
- FetchURLTool
- GitHubClient
- HybridSearchIndex
- GitHubDeviceFlow
- EmbeddingModel
- .makeContainer()
- Sendable
- SharedInbox
- ExtractedGraph
- KnowledgeStore
- .messages()
- Foundation
- RawItem
- .dismiss()
- BYOKLLMKit
- OpenArticleTool
- .process()
- ConversationView
- ExtractedArticle
- .run()
- OnboardingProposal
- XCTest
- RetrievalFixture
- PipelineRunner
- SourceKind
- .parse()
- SourceFetcher
- .outcome()
- Phase 5: Hardening
- Pipeline module (ingestion, graph, searc
- .load()
- InterestModel
- .fetch()
- Choice
- Invariant D5: Private content never goes
- Dependency
- ConversationMode
- RetrievedPassage
- View
- PerfTrace
- GraphRAG
- ReferenceLedger
- ThemeStrengthCache
- StrategistTool
- LexicalIndex
- ReadingView
- FakeExtractor
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- .seal()
- .build()
- SecuritySettingsSection
- RedirectPolicy
- AppLockCoordinator
- .fetchURL()
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- ShareModel
- GitHubError
- .fetch()
- Approval Before Actions
- Strategist Layer
- GitHubAccount
- DigestCluster
- DigestSummaryRequest
- DigestBuilder
- .save()
- SearchHit
- .plan()
- ThemeDetailView
- OnboardingView
- Kind
- CodingKeys
- SmartWard (iOS Application Target)
- Digest
- PlaybackLLM
- BackupView
- AppLock.swift
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- .projects()
- Source
- .article()
- AppLockController
- SourceKindOption
- AskStrategistIntent
- SmartWard XcodeGen Project Spec
- GraphView
- AppLockPolicy
- SeededRandom
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- .render()
- StepProgress
- LibraryFixture
- makeContext()
- OnboardingReviewView
- .refresh()
- DeveloperView
- ProjectEntity
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- .graphML()
- LocalizedError
- ParsedFeed
- .importItems()
- LibraryArchive
- .score()
- .update()
- graphify_pipeline.py
- ArticleStage
- TopK
- FakeBiometrics
- FoundationModelsEntityExtractor
- GraphSnapshot
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- .clusters()
- AppTab
- DigestController
- AppLockTests.swift
- ArchiveError
- .data()
- XCTestCase
- Graph View
- ActivitySheet
- VoiceSettingsSection
- UntrustedText (body/attribute inside its
- RepoSync.swift
- ExtractionTier
- StubTool
- .seed()
- .vector()
- SmartWardIntents.swift
- Living Project Brief
- .color()
- .perform()
- PINOutcome
- BriefRevisionStatus
- ProviderKeyRow
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- Apple Intelligence Preflight
- AppStore
- BackgroundWork.swift
- ApprovalDecision
- BYOKDigestSummarizer
- FakePIN
- MatchKind
- graphify_refresh.sh
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 91 edges
2. `SwiftData` - 78 edges
3. `Article` - 69 edges
4. `Project` - 68 edges
5. `Source` - 56 edges
6. `ThemeNode` - 45 edges
7. `Conversation` - 40 edges
8. `XCTest` - 38 edges
9. `BYOKLLMKit` - 36 edges
10. `PipelineRunner` - 35 edges

## Surprising Connections (you probably didn't know these)
- `.failingSourceTitles` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift

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

## Communities (163 total, 4 thin omitted)

### Community 0 - "Article"
Cohesion: 0.08
Nodes (32): ContextPolicy, Bool, Article, Chunk, Conversation, EntityAlias, InterestProfile, Mention (+24 more)

### Community 1 - "Project"
Cohesion: 0.07
Nodes (44): BriefRevision, Project, ProjectBrief, BriefDiff, BriefEditing, BriefError, empty, .errorDescription (+36 more)

### Community 2 - "IngestError"
Cohesion: 0.06
Nodes (37): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+29 more)

### Community 3 - "StrategyItemKind"
Cohesion: 0.06
Nodes (37): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+29 more)

### Community 4 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 5 - "DailyBudget"
Cohesion: 0.09
Nodes (31): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+23 more)

### Community 6 - "RefreshEagerness"
Cohesion: 0.05
Nodes (37): App, BGContinuedProcessingTask, RunSummary, Bool, Int, String, TimeInterval, RunSummaryTests (+29 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.11
Nodes (27): ProjectToolError, .errorDescription, StrategistRunner, Int, LLMCompleting, EchoTool, .asksForApproval, .definition (+19 more)

### Community 8 - "FetchURLTool"
Cohesion: 0.09
Nodes (20): ActionTools, AddSourceTool, .asksForApproval, .definition, .kinds, FetchURLTool, .asksForApproval, .definition (+12 more)

### Community 9 - "GitHubClient"
Cohesion: 0.12
Nodes (17): GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, HTTPTransport, Bool, Set (+9 more)

### Community 10 - "HybridSearchIndex"
Cohesion: 0.13
Nodes (20): Accelerate, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, SearchCorpus, SearchDocument, Bool (+12 more)

### Community 11 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 12 - "EmbeddingModel"
Cohesion: 0.12
Nodes (19): EmbeddingModel, EmbeddingProviding, String, EntityResolver, Resolution, Bool, Float, ModelContext (+11 more)

### Community 13 - ".makeContainer()"
Cohesion: 0.10
Nodes (16): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+8 more)

### Community 14 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 15 - "SharedInbox"
Cohesion: 0.12
Nodes (16): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+8 more)

### Community 16 - "ExtractedGraph"
Cohesion: 0.13
Nodes (16): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, ExtractionTiers (+8 more)

### Community 17 - "KnowledgeStore"
Cohesion: 0.17
Nodes (5): FoundationModels, KnowledgeStore, RetrievalKit, SwiftData, SwiftUI

### Community 18 - ".messages()"
Cohesion: 0.09
Nodes (15): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+7 more)

### Community 19 - "Foundation"
Cohesion: 0.09
Nodes (9): Foundation, NaturalLanguage, Observation, KnowledgeSchema, .schema, PersistentModel, Schema, GitHubConfig (+1 more)

### Community 20 - "RawItem"
Cohesion: 0.15
Nodes (12): FeedIngest, Result, Bool, Date, Error, Int, ModelContext, String (+4 more)

### Community 21 - ".dismiss()"
Cohesion: 0.09
Nodes (21): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+13 more)

### Community 22 - "BYOKLLMKit"
Cohesion: 0.12
Nodes (3): BYOKLLMKit, ModelCatalogKit, StrategistCore

### Community 23 - "OpenArticleTool"
Cohesion: 0.12
Nodes (19): Decodable, Arguments, Arguments, GraphNeighborsTool, .asksForApproval, .definition, OpenArticleTool, .asksForApproval (+11 more)

### Community 24 - ".process()"
Cohesion: 0.09
Nodes (20): RelevanceJudging, Strength, balanced, off, strict, .threshold, Triage, .body (+12 more)

### Community 25 - "ConversationView"
Cohesion: 0.11
Nodes (19): ActionConfirmationCard, .body, ConversationView, .body, .composer, .messages, .missingKeyWarning, .voiceStatus (+11 more)

### Community 26 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 27 - ".run()"
Cohesion: 0.17
Nodes (15): CheckedContinuation, Never, ActionRequest, ChatController, .autoApproveEnabled, Bool, LLMCompleting, LLMProvider (+7 more)

### Community 28 - "OnboardingProposal"
Cohesion: 0.13
Nodes (17): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+9 more)

### Community 29 - "XCTest"
Cohesion: 0.15
Nodes (3): IngestKit, Pipeline, XCTest

### Community 30 - "RetrievalFixture"
Cohesion: 0.15
Nodes (10): GraphRetriever, GraphRetrieverTests, KeyedExtractor, ResearchToolTests, RetrievalFixture, Bool, ModelContainer, ModelContext (+2 more)

### Community 31 - "PipelineRunner"
Cohesion: 0.18
Nodes (12): ArticleIndexer, PipelineRunner, Report, Bool, Date, Double, Int, ModelContext (+4 more)

### Community 32 - "SourceKind"
Cohesion: 0.09
Nodes (24): CaseIterable, .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn (+16 more)

### Community 33 - ".parse()"
Cohesion: 0.13
Nodes (11): DateFormatter, ISO8601DateFormatter, FeedParser, Data, CanonicalURL, FeedDate, Date, Set (+3 more)

### Community 34 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 35 - ".outcome()"
Cohesion: 0.13
Nodes (11): Outcome, fail, listen, speak, StartBlocker, missingKey, needsAutoApprove, Bool (+3 more)

### Community 36 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 37 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 38 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 39 - "InterestModel"
Cohesion: 0.18
Nodes (12): Interest, InterestModel, .isEmpty, Bool, Double, Float, ModelContext, Set (+4 more)

### Community 40 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 41 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 42 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 43 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 44 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 45 - "RetrievedPassage"
Cohesion: 0.16
Nodes (15): RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why, connected (+7 more)

### Community 46 - "View"
Cohesion: 0.14
Nodes (19): ActionApprovalSettingsSection, .body, KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body (+11 more)

### Community 47 - "PerfTrace"
Cohesion: 0.18
Nodes (14): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+6 more)

### Community 48 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 49 - "ReferenceLedger"
Cohesion: 0.17
Nodes (14): ReferenceLedger, Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue (+6 more)

### Community 50 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 51 - "StrategistTool"
Cohesion: 0.14
Nodes (16): StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult, StrategistTool (+8 more)

### Community 52 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 53 - "ReadingView"
Cohesion: 0.11
Nodes (17): Int, TriageDisplayTests, ArticleRow, .body, .content, .relevancePercent, ReadingView, .activity (+9 more)

### Community 54 - "FakeExtractor"
Cohesion: 0.16
Nodes (13): FakeCompletion, FakeExtractor, GraphIndexingTests, AsyncThrowingStream, Bool, Error, Int, LLMRequest (+5 more)

### Community 55 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 56 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 57 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 58 - ".build()"
Cohesion: 0.22
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 59 - "SecuritySettingsSection"
Cohesion: 0.14
Nodes (17): PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding, .toggleTitle (+9 more)

### Community 60 - "RedirectPolicy"
Cohesion: 0.13
Nodes (12): NSObject, PublicHost, RedirectPolicy, Bool, HTTPURLResponse, String, URL, URLRequest (+4 more)

### Community 61 - "AppLockCoordinator"
Cohesion: 0.20
Nodes (7): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, PINAttemptResult, String, AppLockCoordinatorTests

### Community 62 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 63 - "ProviderModelController"
Cohesion: 0.26
Nodes (9): CatalogCache, .modelField, ProviderModelController, Bool, CatalogEntry, Date, LLMProvider, Set (+1 more)

### Community 64 - "SmartWardKit.KnowledgeStore (SwiftData m"
Cohesion: 0.18
Nodes (17): Invariant: new models and properties go into LibraryArchive in the same change, Invariant: schema stays CloudKit-compatible (PLAN section 4), DailyBudget (background provider spend cap), Invariant: strength and weight are derived, not stored counters, EncryptedBackup (single-file library backup), Invariant: enum-backed fields store raw String with typed fallback property, KnowledgeSchema.models (schema registry), SmartWardKit.KnowledgeStore (SwiftData models and services) (+9 more)

### Community 65 - "Article (SwiftData model)"
Cohesion: 0.15
Nodes (17): Article (SwiftData model), D1 Day-one onboarding interview, FeedFetcher, FR-0 Onboarding interview, FR-23 Dependency radar, FR-4 Triage by relevance to profile and projects, FR-9 Projects with a living Project Brief, GitHubReleases adapter (+9 more)

### Community 66 - "ThemeNode (SwiftData model)"
Cohesion: 0.19
Nodes (17): B2 Never auto-merge differing version tokens, C2 BYOKLLMKit lacks tool calling and structured output, C7 Explicit Mention join entity replaces many-to-many, Conversation indexing pipeline, Digest pipeline, Entity-resolution eval: false-merge rate under 2%, EntityAlias (SwiftData model), EntityResolver (+9 more)

### Community 67 - "ShareModel"
Cohesion: 0.17
Nodes (11): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+3 more)

### Community 68 - "GitHubError"
Cohesion: 0.16
Nodes (13): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Data (+5 more)

### Community 69 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 70 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 71 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 72 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 73 - "DigestCluster"
Cohesion: 0.28
Nodes (11): ArticleRef, DigestCluster, ProjectRef, Double, Int, String, UUID, DigestClusterSection (+3 more)

### Community 74 - "DigestSummaryRequest"
Cohesion: 0.23
Nodes (7): DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMUsage, String, FoundationModelsDigestSummarizer

### Community 75 - "DigestBuilder"
Cohesion: 0.22
Nodes (10): DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture, Date (+2 more)

### Community 76 - ".save()"
Cohesion: 0.23
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 77 - "SearchHit"
Cohesion: 0.22
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 78 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 79 - "ThemeDetailView"
Cohesion: 0.19
Nodes (14): Connection, .id, Int, String, UUID, Void, ThemeDetailView, .body (+6 more)

### Community 80 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 81 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 82 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 83 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 84 - "Digest"
Cohesion: 0.23
Nodes (11): Digest, .clusters, Bool, Date, ModelContext, DigestRow, .body, DigestSections (+3 more)

### Community 85 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 86 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 87 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 88 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 89 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 90 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 91 - "Source"
Cohesion: 0.25
Nodes (10): Source, SourceDetailView, SourceRow, SourcesView, .body, .following, .listed, .paused (+2 more)

### Community 92 - ".article()"
Cohesion: 0.32
Nodes (5): FakeFullText, PipelineRunnerTests, ModelContainer, ModelContext, Set

### Community 93 - "AppLockController"
Cohesion: 0.19
Nodes (9): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body (+1 more)

### Community 94 - "SourceKindOption"
Cohesion: 0.15
Nodes (13): AppEnum, IntentFailure, .errorDescription, libraryUnavailable, noProvider, SourceKindOption, arxiv, feed (+5 more)

### Community 95 - "AskStrategistIntent"
Cohesion: 0.22
Nodes (13): AppIntent, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent, .parameterSummary (+5 more)

### Community 96 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 97 - "GraphView"
Cohesion: 0.24
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 98 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 99 - "SeededRandom"
Cohesion: 0.19
Nodes (8): PerformanceTests, SeededRandom, String, TimeInterval, UInt64, Void, TopKTests, RandomNumberGenerator

### Community 100 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 101 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 102 - ".render()"
Cohesion: 0.29
Nodes (4): DigestPrompt, ReferenceContext, String, UntrustedText

### Community 103 - "StepProgress"
Cohesion: 0.21
Nodes (8): StepProgress, .isDeterminate, .percent, Bool, Int, StepProgressTests, ActivityBar, .body

### Community 104 - "LibraryFixture"
Cohesion: 0.21
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 105 - "makeContext()"
Cohesion: 0.21
Nodes (5): makeContext(), NormalizedKeyTests, SchemaTests, ModelContainer, ModelContext

### Community 106 - "OnboardingReviewView"
Cohesion: 0.26
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 107 - ".refresh()"
Cohesion: 0.30
Nodes (9): IngestController, Bool, Int, ModelContext, Set, String, UUID, Void (+1 more)

### Community 108 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 109 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 110 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 111 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 112 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 113 - ".graphML()"
Cohesion: 0.25
Nodes (7): GraphKit, GraphExport, Date, LibraryArchive, String, GraphExportTests, SessionGraph

### Community 114 - "LocalizedError"
Cohesion: 0.18
Nodes (11): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, StrategistError, .errorDescription, incompleteResponse (+3 more)

### Community 115 - "ParsedFeed"
Cohesion: 0.31
Nodes (7): Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 116 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 117 - "LibraryArchive"
Cohesion: 0.36
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 118 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 119 - ".update()"
Cohesion: 0.24
Nodes (7): LockOverlay, .body, LockWindow, Bool, UIKit, UIWindow, UIWindowScene

### Community 120 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 121 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 122 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 123 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 124 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 125 - "GraphSnapshot"
Cohesion: 0.42
Nodes (6): CGFloat, ForceLayout, GraphSnapshot, Point, GraphCanvas, .body

### Community 126 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 127 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 128 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 129 - ".clusters()"
Cohesion: 0.42
Nodes (4): Group, Bool, UUID, UnionFind

### Community 130 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 131 - "DigestController"
Cohesion: 0.25
Nodes (7): DigestController, .notificationsEnabled, Bool, String, TimeInterval, DigestSettingsSection, .body

### Community 132 - "AppLockTests.swift"
Cohesion: 0.25
Nodes (4): AppLock, BiometricLockKit, PINRules, PINRulesTests

### Community 133 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 134 - ".data()"
Cohesion: 0.43
Nodes (4): Data, Float, VectorCoding, VectorCodingTests

### Community 135 - "XCTestCase"
Cohesion: 0.29
Nodes (5): CanonicalURLTests, RepoSyncTests, Bool, String, XCTestCase

### Community 136 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 137 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 138 - "VoiceSettingsSection"
Cohesion: 0.33
Nodes (6): AVSpeechSynthesisVoice, VoiceSettings, .current, VoiceSettingsSection, .body, VoiceLoopConfig

### Community 139 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 140 - "RepoSync.swift"
Cohesion: 0.29
Nodes (3): CommonCrypto, CryptoKit, Security

### Community 141 - "ExtractionTier"
Cohesion: 0.38
Nodes (5): ExtractionTier, byok, onDevice, FakeSummarizer, LLMUsage

### Community 142 - "StubTool"
Cohesion: 0.33
Nodes (6): StubTool, .definition, Bool, JSONValue, LLMTool, String

### Community 143 - ".seed()"
Cohesion: 0.38
Nodes (4): BudgetTests, Double, ModelContext, String

### Community 144 - ".vector()"
Cohesion: 0.43
Nodes (4): FixedJudge, Bool, Float, String

### Community 145 - "SmartWardIntents.swift"
Cohesion: 0.40
Nodes (3): AppIntents, AVFoundation, VoiceLoopKit

### Community 146 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 147 - ".color()"
Cohesion: 0.40
Nodes (4): Color, .body, ThemeStyle, .body

### Community 148 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 149 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 150 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 151 - "ProviderKeyRow"
Cohesion: 0.33
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 152 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 153 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 154 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 155 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 157 - "ApprovalDecision"
Cohesion: 0.50
Nodes (4): ApprovalDecision, approve, ask, decline

### Community 158 - "BYOKDigestSummarizer"
Cohesion: 0.83
Nodes (3): BYOKDigestSummarizer, LLMCompleting, LLMProvider

### Community 159 - "FakePIN"
Cohesion: 0.83
Nodes (3): FakePIN, PINAttemptResult, String

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **323 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+318 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 625 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `Foundation` to `Article`, `IngestError`, `StrategyItemKind`, `DailyBudget`, `RefreshEagerness`, `GitHubClient`, `HybridSearchIndex`, `GitHubDeviceFlow`, `RepoSync.swift`, `.makeContainer()`, `SharedInbox`, `ExtractedGraph`, `KnowledgeStore`, `SmartWardIntents.swift`, `BYOKLLMKit`, `ExtractedArticle`, `AppStore`, `BackgroundWork.swift`, `.parse()`, `SourceFetcher`, `.outcome()`, `Dependency`, `PerfTrace`, `RedirectPolicy`, `AppLock.swift`, `.render()`, `StepProgress`, `.graphML()`, `ParsedFeed`, `.score()`, `TopK`?**
  _High betweenness centrality (0.058) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `.clusters()`, `RefreshEagerness`, `HybridSearchIndex`, `EmbeddingModel`, `.makeContainer()`, `.seed()`, `RawItem`, `.dismiss()`, `RetrievalFixture`, `PipelineRunner`, `.load()`, `RetrievedPassage`, `ThemeStrengthCache`, `LexicalIndex`, `ReadingView`, `FakeExtractor`, `.fetch()`, `DigestCluster`, `DigestSummaryRequest`, `.save()`, `SearchHit`, `Source`, `.article()`, `makeContext()`, `.refresh()`, `.importItems()`, `ArticleStage`?**
  _High betweenness centrality (0.042) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Article`, `SourceFetcher`, `StrategyItemKind`, `StrategistRunner`, `makeContext()`, `HybridSearchIndex`, `RepoSync.swift`, `EmbeddingModel`, `RetrievedPassage`, `.graphML()`, `ThemeStrengthCache`, `Foundation`, `SmartWardIntents.swift`, `BYOKLLMKit`, `.build()`, `AppStore`, `BackgroundWork.swift`, `XCTest`?**
  _High betweenness centrality (0.037) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _323 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Article` be split into smaller, more focused modules?**
  _Cohesion score 0.07892107892107893 - nodes in this community are weakly interconnected._
- **Should `Project` be split into smaller, more focused modules?**
  _Cohesion score 0.06680080482897384 - nodes in this community are weakly interconnected._
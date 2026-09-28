# Graph Report - SmartWard  (2026-09-28)

## Corpus Check
- Large corpus: 155 files · ~593,857 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2793 nodes · 7168 edges · 145 communities (142 shown, 3 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 868 edges (avg confidence: 0.84)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Project
- XCTestCase
- ModelFallback
- SmartWardIntents.swift
- SharedInbox
- Article
- IngestError
- LibraryFixture
- FetchURLTool
- Conversation
- .dismiss()
- HybridSearchIndex
- .makeContainer()
- KnowledgeStore
- GitHubDeviceFlow
- StrategyItemKind
- StrategistRunner
- Sendable
- DailyBudget
- DigestSummaryRequest
- DigestBuilder
- ExtractionTiers
- GitHubClient
- Source
- Foundation
- ActionRequest
- ExtractedArticle
- RawItem
- PipelineRunner
- BYOKLLMKit
- .body
- .parse()
- Phase 5: Hardening
- View
- .send()
- Pipeline module (ingestion, graph, searc
- PerfTrace
- SourceFetcher
- ExtractedGraph
- InterestModel
- RecordStrategyItemTool
- .fetch()
- Choice
- Invariant D5: Private content never goes
- SearchHit
- .load()
- ThemeStrengthCache
- ModelCatalogController
- SecuritySettingsSection
- GraphRAG
- RetrievedPassage
- SwiftUI
- LexicalIndex
- .article()
- Ingestion pipeline: fetch, clean, triage
- BYOKLLMKit
- GitHubError
- Digest
- .retrieve()
- OnboardingProposal
- .fetchURL()
- .build()
- Scenario
- ProviderModelController
- SmartWardKit.KnowledgeStore (SwiftData m
- Article (SwiftData model)
- ThemeNode (SwiftData model)
- AppLockCoordinator
- .fetch()
- .decode()
- Approval Before Actions
- Strategist Layer
- GitHubAccount
- GraphIndexer
- ThemeDetailView
- OnboardingView
- AppLock.swift
- CodingKeys
- SmartWard (iOS Application Target)
- EntityResolver
- .save()
- .messages()
- SmartWardShare (Share Extension Target)
- Prompt-injection defense
- GraphView
- Identifiable
- LibraryArchive
- AddSourceTool
- PlaybackLLM
- RetrievalFixture
- RefreshEagerness
- SmartWard XcodeGen Project Spec
- SourceKind
- .data()
- FakeTransport
- AppLockController
- OnboardingReviewView
- Kind
- Accessibility Verification Pass
- GraphRAG Latency Budget (NFR-4: p95 unde
- DeveloperView
- What the Simulator Can't Show
- Inference Layer
- ContextAssembler token budget and fencin
- ArticleReaderView
- .process()
- BackupView
- .canonicalize()
- graphify_pipeline.py
- AppLockPolicy
- ArticleStage
- TopK
- FakeBiometrics
- FoundationModelsEntityExtractor
- .buildIfDue()
- GraphSnapshot
- StrategistCore (tool loop, prompts, brie
- Packages/SmartWardKit (local SPM package
- SmartWardKit (Local Swift Package)
- EmbeddingModel
- AppTab
- ArchiveError
- Graph View
- DigestClusterSection
- ActivitySheet
- ConversationView.swift
- UntrustedText (body/attribute inside its
- .availability()
- ProviderKeyRow
- CaseIterable
- Living Project Brief
- PINOutcome
- BriefRevisionStatus
- .color()
- Chunk (SwiftData model)
- DecisionProviding protocol seam
- .isAcceptable()
- KnowledgeSchema
- SeededRandom
- Apple Intelligence Preflight
- AppStore
- .elapsed()
- .load()
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

## Communities (145 total, 3 thin omitted)

### Community 0 - "Project"
Cohesion: 0.07
Nodes (38): BriefRevision, Project, ProjectBrief, BriefDiff, BriefEditing, tooLong, BriefReviser, Line (+30 more)

### Community 1 - "XCTestCase"
Cohesion: 0.06
Nodes (30): Dependency, ManifestParser, String, Date, Double, TimeInterval, ThemeStrength, GraphExport (+22 more)

### Community 2 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 3 - "SmartWardIntents.swift"
Cohesion: 0.06
Nodes (48): AppEntity, AppEnum, AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, DisplayRepresentation, EntityQuery (+40 more)

### Community 4 - "SharedInbox"
Cohesion: 0.07
Nodes (29): JSONDecoder, JSONEncoder, NSExtensionContext, Result, SharedImport, Date, Int, ModelContext (+21 more)

### Community 5 - "Article"
Cohesion: 0.12
Nodes (26): Article, Chunk, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal (+18 more)

### Community 6 - "IngestError"
Cohesion: 0.08
Nodes (30): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+22 more)

### Community 7 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 8 - "FetchURLTool"
Cohesion: 0.10
Nodes (21): FetchURLTool, .definition, Bool, URL, Arguments, GraphNeighborsTool, .definition, OpenArticleTool (+13 more)

### Community 9 - "Conversation"
Cohesion: 0.07
Nodes (27): ContextPolicy, Bool, Conversation, .mode, ConversationMode, brainstorm, critique, onboarding (+19 more)

### Community 10 - ".dismiss()"
Cohesion: 0.06
Nodes (33): ModelContext, syncGitHubLinks(), GitHubProjectSection, .body, .dependencies, .repoLinks, GitHubRepoPicker, .alreadyLinked (+25 more)

### Community 11 - "HybridSearchIndex"
Cohesion: 0.12
Nodes (21): Accelerate, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, SearchCorpus, SearchDocument, Bool (+13 more)

### Community 12 - ".makeContainer()"
Cohesion: 0.08
Nodes (17): Bool, ModelContainer, Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind (+9 more)

### Community 13 - "KnowledgeStore"
Cohesion: 0.16
Nodes (6): IngestKit, KnowledgeStore, Pipeline, RetrievalKit, SwiftData, XCTest

### Community 14 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 15 - "StrategyItemKind"
Cohesion: 0.09
Nodes (22): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+14 more)

### Community 16 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 17 - "Sendable"
Cohesion: 0.28
Nodes (29): Codable, Equatable, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord, ChunkRecord, ConversationRecord (+21 more)

### Community 18 - "DailyBudget"
Cohesion: 0.16
Nodes (16): DailyBudget, Line, .id, Price, PriceBook, Bool, Calendar, Date (+8 more)

### Community 19 - "DigestSummaryRequest"
Cohesion: 0.12
Nodes (15): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, Int, LLMCompleting, LLMProvider, LLMUsage (+7 more)

### Community 20 - "DigestBuilder"
Cohesion: 0.13
Nodes (17): DigestBuilder, DigestPrompt, DigestSummarizing, Group, Bool, Date, ModelContext, TimeInterval (+9 more)

### Community 21 - "ExtractionTiers"
Cohesion: 0.11
Nodes (18): EntityExtracting, ExtractionTier, byok, onDevice, ExtractionTiers, FakeCompletion, FakeExtractor, GraphIndexingTests (+10 more)

### Community 22 - "GitHubClient"
Cohesion: 0.16
Nodes (12): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, Bool, Set (+4 more)

### Community 23 - "Source"
Cohesion: 0.12
Nodes (22): Bool, Source, FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext (+14 more)

### Community 24 - "Foundation"
Cohesion: 0.09
Nodes (9): CommonCrypto, CryptoKit, Foundation, GraphKit, NaturalLanguage, Observation, Security, GitHubConfig (+1 more)

### Community 25 - "ActionRequest"
Cohesion: 0.12
Nodes (21): LocalizedError, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+13 more)

### Community 26 - "ExtractedArticle"
Cohesion: 0.17
Nodes (10): ArticleExtractor, ExtractedArticle, Bool, Date, Element, String, URL, ArticleExtractorTests (+2 more)

### Community 27 - "RawItem"
Cohesion: 0.15
Nodes (12): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+4 more)

### Community 28 - "PipelineRunner"
Cohesion: 0.15
Nodes (16): FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext, Set (+8 more)

### Community 29 - "BYOKLLMKit"
Cohesion: 0.14
Nodes (4): BYOKLLMKit, FoundationModels, ModelCatalogKit, StrategistCore

### Community 30 - ".body"
Cohesion: 0.11
Nodes (16): App, BGContinuedProcessingTask, Scene, SmartWardApp, .body, .body, BackgroundWork, ModelContext (+8 more)

### Community 31 - ".parse()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 32 - "Phase 5: Hardening"
Cohesion: 0.14
Nodes (24): Empty States and Accessibility, App Lock (Face ID/Touch ID with PIN fallback), BM25 Lexical Search (compound tokens kept whole), Bounded-heap Top-K Rankings, Device Measurement (Instruments signposts), docs/DEVICE_TESTING.md, Export (Settings to Export), GraphML Export (Gephi or yEd) (+16 more)

### Community 33 - "View"
Cohesion: 0.13
Nodes (21): AVSpeechSynthesisVoice, ActionApprovalSettingsSection, .body, VoiceSettingsSection, .body, .voices, KnowledgeGraphSettingsSection, .body (+13 more)

### Community 34 - ".send()"
Cohesion: 0.16
Nodes (14): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, LLMProvider, ModelContext, String (+6 more)

### Community 35 - "Pipeline module (ingestion, graph, searc"
Cohesion: 0.14
Nodes (23): ArticleIndexer (search index built and updated in place), DigestBuilder (clustering, ranking, tiered summaries), EmbeddingModel (vectors never compared across models), EntityResolver (names resolve to one node), GraphEditing (merge and split, writes user aliases), GraphExport (GraphML via GraphKit), GraphIndexer (extraction routing tiers, D2/D5), OnDeviceKit GraphKit (+15 more)

### Community 36 - "PerfTrace"
Cohesion: 0.15
Nodes (16): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+8 more)

### Community 37 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 38 - "ExtractedGraph"
Cohesion: 0.19
Nodes (11): BYOKExtractor, Entity, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider, LLMRequest (+3 more)

### Community 39 - "InterestModel"
Cohesion: 0.19
Nodes (12): Bool, Interest, InterestModel, .isEmpty, Bool, Double, Float, String (+4 more)

### Community 40 - "RecordStrategyItemTool"
Cohesion: 0.15
Nodes (13): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, .definition (+5 more)

### Community 41 - ".fetch()"
Cohesion: 0.14
Nodes (14): FetchError, .errorDescription, http, invalidKey, unreadable, ProviderModelFetcher, CatalogEntry, Data (+6 more)

### Community 42 - "Choice"
Cohesion: 0.11
Nodes (20): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, Choice, arxiv, feed (+12 more)

### Community 43 - "Invariant D5: Private content never goes"
Cohesion: 0.12
Nodes (22): ArticleExtractor (SwiftSoup HTML to clean text), ContextPolicy (provider-context filter), Invariant D5: Private content never goes to a BYOK provider, Plan Decision IDs D1-D6 (referenced in code), Invariant: extraction routing lives in GraphIndexer.tiers(for:), GitHubClient (GET-only), GitHubTokenStore (device-only Keychain), IngestKit (source ingestion and GitHub) (+14 more)

### Community 44 - "SearchHit"
Cohesion: 0.14
Nodes (16): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, .body, MatchBadge (+8 more)

### Community 45 - ".load()"
Cohesion: 0.16
Nodes (14): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+6 more)

### Community 46 - "ThemeStrengthCache"
Cohesion: 0.19
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 47 - "ModelCatalogController"
Cohesion: 0.18
Nodes (15): BudgetSettings, .current, FallbackModelsRow, .body, ModelCatalogController, .fallback, Bool, CatalogEntry (+7 more)

### Community 48 - "SecuritySettingsSection"
Cohesion: 0.14
Nodes (17): AppLock, BiometricLockKit, PINLockKit, LockScreen, SecuritySettingsSection, .body, .lockBinding, .toggleTitle (+9 more)

### Community 49 - "GraphRAG"
Cohesion: 0.16
Nodes (21): B1 GraphRAG over the SwiftData graph, B4 Graph view drawn natively in SwiftUI, C3 GraphRetrievalKit needs an injectable entity index, FR-11 GraphRAG every turn with why-retrieved, FR-14 Full-text, semantic and graph-expanded search, FR-15 Interactive offline graph view, FR-18 Encrypted export and import, FR-20 App Intents and Shortcuts (+13 more)

### Community 50 - "RetrievedPassage"
Cohesion: 0.16
Nodes (16): RetrievedPassage, ActionConfirmationCard, .body, .body, EmptyChatHint, .body, .purpose, MessageRow (+8 more)

### Community 51 - "SwiftUI"
Cohesion: 0.12
Nodes (7): BackgroundTasks, ShareViewController, ShareInbox, SwiftUI, UIKit, UIViewController, UniformTypeIdentifiers

### Community 52 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 53 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 54 - "Ingestion pipeline: fetch, clean, triage"
Cohesion: 0.22
Nodes (19): ArticleExtractor, BGTaskScheduler background tasks, FR-1 Add, edit, disable and remove sources, FR-22 GitHub integration and repo sync, FR-2 Fetch new items manually and in background, FR-3 Share extension ingestion, GitHub option A: paste repo links only, GitHubClient (+11 more)

### Community 55 - "BYOKLLMKit"
Cohesion: 0.16
Nodes (19): BiometricLockKit, BYOKLLMKit, C1 Anthropic SSE streaming is missing from BYOKLLMKit, CloudKit-compatible schema rules, Evaluation harness, FR-16 BYOK key management and model picker, FR-19 PIN and biometric app lock, Inference tiers T0-T3 (+11 more)

### Community 56 - "GitHubError"
Cohesion: 0.15
Nodes (14): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, HTTPTransport (+6 more)

### Community 57 - "Digest"
Cohesion: 0.25
Nodes (13): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+5 more)

### Community 58 - ".retrieve()"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 59 - "OnboardingProposal"
Cohesion: 0.15
Nodes (14): ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id, JSONValue (+6 more)

### Community 60 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 61 - ".build()"
Cohesion: 0.22
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 62 - "Scenario"
Cohesion: 0.21
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

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

### Community 67 - "AppLockCoordinator"
Cohesion: 0.22
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricStep, needsPIN, unlocked, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 68 - ".fetch()"
Cohesion: 0.27
Nodes (8): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String

### Community 69 - ".decode()"
Cohesion: 0.15
Nodes (7): project, OnboardingSynthesizer, LLMChatMessage, LLMProvider, LLMRequest, OnboardingSynthesizerTests, .trimmed

### Community 70 - "Approval Before Actions"
Cohesion: 0.18
Nodes (17): add_source Tool, Add to SmartWard (Share Sheet), App Shell (Tabs, Projects, Settings), Approval Before Actions, Background Refresh (hourly polling, charging, system progress), BYOK Key Settings (bring your own keys), Four Strategist Chat Modes, Daily Budget (switches background work to on-device when spent) (+9 more)

### Community 71 - "Strategist Layer"
Cohesion: 0.20
Nodes (16): BriefService living document watermark, C6 One Strategist with a tool-use loop and modes, Conversation (SwiftData model), ConversationCompactor rolling summary, FR-10 Project-scoped conversations with modes, FR-12 Strategist tool set, Message (SwiftData model), ModeSelector (+8 more)

### Community 72 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 73 - "GraphIndexer"
Cohesion: 0.23
Nodes (9): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String (+1 more)

### Community 74 - "ThemeDetailView"
Cohesion: 0.19
Nodes (14): Connection, .id, String, UUID, Void, ThemeDetailView, .body, .connections (+6 more)

### Community 75 - "OnboardingView"
Cohesion: 0.15
Nodes (14): OnboardingLinksSheet, .body, OnboardingView, .appleIntelligenceStatus, .body, .canStart, .hasUserInput, .interview (+6 more)

### Community 76 - "AppLock.swift"
Cohesion: 0.22
Nodes (8): AnyObject, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricResult, PINAttemptResult, String

### Community 77 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 78 - "SmartWard (iOS Application Target)"
Cohesion: 0.23
Nodes (15): App Lock: Face ID with Grace Period, App Lock PIN Fallback, App Switcher Privacy Cover, SmartWard App Icon (product icon image), AppIcon Asset Catalog Name, AppLock (SmartWardKit Library Product), BiometricLockKit (OnDeviceKit Library Product), BYOKLLMKit (OnDeviceKit Library Product) (+7 more)

### Community 79 - "EntityResolver"
Cohesion: 0.30
Nodes (7): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID

### Community 80 - ".save()"
Cohesion: 0.24
Nodes (7): FetchedPageImport, Bool, Date, ModelContext, URL, FetchedPageImportTests, String

### Community 81 - ".messages()"
Cohesion: 0.22
Nodes (9): ConversationHistory, Entry, Date, Int, LLMChatMessage, String, ConversationHistoryTests, String (+1 more)

### Community 82 - "SmartWardShare (Share Extension Target)"
Cohesion: 0.22
Nodes (14): App Group Registration (group.com.intelligentdesignsllc.smartward), Share Extension Safari Capture Path, SmartWard/SmartWard.entitlements, App Group Entitlement (shared container app ↔ extension), com.intelligentdesignsllc.smartward Bundle Identifier, Bundle ID Prefix com.intelligentdesignsllc, PLAN FR-3 (Share Extension Requirement), ShareExtension/SmartWardShare.entitlements (+6 more)

### Community 83 - "Prompt-injection defense"
Cohesion: 0.22
Nodes (14): Confirmation chips for side-effecting tools, D4 One-tap GitHub sign-in, PAT advanced, FR-17 Usage and cost ledger with daily cap, GitHub App rejected: needs a token-exchange backend, GitHub option B: fine-grained PAT, GitHub option C: OAuth device flow, Prompt-injection defense, Keychain storage (+6 more)

### Community 84 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 85 - "Identifiable"
Cohesion: 0.15
Nodes (14): Identifiable, Filter, all, .id, starred, unread, Order, .id (+6 more)

### Community 86 - "LibraryArchive"
Cohesion: 0.21
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 87 - "AddSourceTool"
Cohesion: 0.21
Nodes (10): ActionTools, AddSourceTool, .definition, .kinds, Arguments, JSONValue, LLMTool, ModelContext (+2 more)

### Community 88 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 89 - "RetrievalFixture"
Cohesion: 0.22
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 90 - "RefreshEagerness"
Cohesion: 0.15
Nodes (14): BackgroundRefreshSettingsSection, .eagerness, .isRefreshing, RefreshEagerness, .current, frequent, .id, .interval (+6 more)

### Community 91 - "SmartWard XcodeGen Project Spec"
Cohesion: 0.22
Nodes (13): DEVELOPMENT_TEAM Signing Setup, GitHub OAuth Device Flow Sign-In, iPhone 15 Pro / iOS 26 / Apple Intelligence Device Requirement, One-Time Device Setup, OpenRouter API Key During Onboarding, Apple Intelligence-Capable Device Floor (iPhone 15 Pro+), Automatic Code Sign Style, iOS 26.0 Deployment Target (+5 more)

### Community 92 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 93 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 94 - "FakeTransport"
Cohesion: 0.22
Nodes (8): FakeTransport, Data, HTTPURLResponse, URLRequest, RepoSyncTests, Bool, String, Reply

### Community 95 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 96 - "OnboardingReviewView"
Cohesion: 0.23
Nodes (9): OnboardingReviewView, .body, .confirmed, Binding, Bool, Int, Set, String (+1 more)

### Community 97 - "Kind"
Cohesion: 0.19
Nodes (12): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+4 more)

### Community 98 - "Accessibility Verification Pass"
Cohesion: 0.24
Nodes (12): Accessibility Verification Pass, CI Simulator Test Pipeline, Daily Budget Set to $0.25 Exhaustion Test, Device Testing Strategy, Largest Text Sizes / Dynamic Type Clipping Check, Onboarding Under 5 Minutes (Phase 1 Exit Criterion), Phase 5 Exit Criteria, A Real-Use Pass (+4 more)

### Community 99 - "GraphRAG Latency Budget (NFR-4: p95 unde"
Cohesion: 0.29
Nodes (12): -SmartWardDeveloper YES Launch Argument, Developer Sample Library (100,000 chunks / 3,000 themes / 30,000 connections, ~250 MB), Graph Snapshot Signpost Interval, GraphRAG Latency Budget (NFR-4: p95 under 500 ms at 100k chunks), GraphRAG Signpost Interval, Instruments Points of Interest Profiling, Latency Check (20 chat-style questions, p50/p95 report), Release Build Requirement for Latency Measurement (+4 more)

### Community 100 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 101 - "What the Simulator Can't Show"
Cohesion: 0.31
Nodes (11): Apple Intelligence On-Device Item Triage, Background Work via BGTaskScheduler, On-Device Theme Extraction in Reader, Overnight Processing Digest Notification, com.intelligentdesignsllc.smartward.processing Task Identifier, Shortcuts App Intents (Open digest / Add a source), What the Simulator Can't Show, Siri "Ask SmartWard" Voice Answer (+3 more)

### Community 102 - "Inference Layer"
Cohesion: 0.25
Nodes (11): AppleFMKit, C4 ODK core packages are iOS-only, D3 iPhone 15 Pro minimum device, FR-21 Mac companion with CloudKit sync, Inference Layer, LocalLLMKit dropped from scope, NFR-11 Platform targets and device floor, NFR-1 Offline operation (+3 more)

### Community 103 - "ContextAssembler token budget and fencin"
Cohesion: 0.27
Nodes (11): B3 Extraction routing by content class, BYOKExtractor, ContextAssembler token budget and fencing, D2 Conversations may be extracted by BYOK, D5 Private repos extracted on-device only, EntityExtracting protocol, FoundationModelsExtractor, KnowledgeGraphExtractor not used (therapy vocabulary) (+3 more)

### Community 104 - "ArticleReaderView"
Cohesion: 0.22
Nodes (9): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL, TodayView (+1 more)

### Community 105 - ".process()"
Cohesion: 0.24
Nodes (9): FoundationModelsRelevanceJudge, PipelineController, Bool, ModelContext, String, TimeInterval, Triage.Strength, .label (+1 more)

### Community 106 - "BackupView"
Cohesion: 0.27
Nodes (7): BackupView, .body, .canCreate, Bool, Data, LibraryArchive, String

### Community 107 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 108 - "graphify_pipeline.py"
Cohesion: 0.22
Nodes (8): datetime, json, pathlib, re, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 109 - "AppLockPolicy"
Cohesion: 0.33
Nodes (5): AppLockPolicy, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 110 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 111 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 112 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 113 - "FoundationModelsEntityExtractor"
Cohesion: 0.36
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 114 - ".buildIfDue()"
Cohesion: 0.27
Nodes (7): DigestController, .notificationsEnabled, FoundationModelsDigestSummarizer, Bool, ModelContext, String, TimeInterval

### Community 115 - "GraphSnapshot"
Cohesion: 0.42
Nodes (6): CGFloat, ForceLayout, GraphSnapshot, Point, GraphCanvas, .body

### Community 116 - "StrategistCore (tool loop, prompts, brie"
Cohesion: 0.31
Nodes (9): Invariant: network or durable-state tools must return an ActionRequest, ActionRequest (confirmation(for:) contract), OnDeviceKit BYOKLLMKit, ModelFallback (FallbackLLM over ModelCatalogKit), StrategistCore (tool loop, prompts, brief, fallback), StrategistRunner (tool-calling loop), Invariant: every strategist turn must end (toolChoice none, errors as results), Cost Controls (Settings to Usage and budget) (+1 more)

### Community 117 - "Packages/SmartWardKit (local SPM package"
Cohesion: 0.25
Nodes (9): AppLock module (AppLockPolicy, AppLockCoordinator, PINRules), OnDeviceKit BiometricLockKit, GitNexus code intelligence (impact before edit, detect-changes before commit), Logic-in-Package Convention (swift test without a simulator), OnDeviceKit PINLockKit, ShareExtension/ (never opens the SwiftData store), ShareInbox (App Group JSON inbox, dependency-free), SmartWard/ (SwiftUI iOS app) (+1 more)

### Community 118 - "SmartWardKit (Local Swift Package)"
Cohesion: 0.31
Nodes (9): Background Extraction Stays On-Device Until Midnight, JSON / GraphML / Markdown Export Formats, Private Local Address Rejection (192.168.1.1), Wipe to Restore Backup Test, IngestKit (SmartWardKit Library Product), KnowledgeStore (SmartWardKit Library Product), Pipeline (SmartWardKit Library Product), SmartWardKit (Local Swift Package) (+1 more)

### Community 119 - "EmbeddingModel"
Cohesion: 0.33
Nodes (5): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, Int

### Community 120 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 121 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 122 - "Graph View"
Cohesion: 0.25
Nodes (8): Alias + Embedding Similarity Name Resolution, Chunk-level Citations for Mentions and Edges, Entity and Relation Extraction, Extraction and Entity Resolution, Graph View, Theme Rename/Merge/Split (user corrections win), Theme Scopes (all, two weeks, project, source), Uncertain Merge Review Queue

### Community 123 - "DigestClusterSection"
Cohesion: 0.32
Nodes (6): DigestClusterSection, .body, DigestSections, .body, String, UUID

### Community 124 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 125 - "ConversationView.swift"
Cohesion: 0.29
Nodes (5): AVFoundation, VoiceSettings, .current, VoiceLoopConfig, VoiceLoopKit

### Community 126 - "UntrustedText (body/attribute inside its"
Cohesion: 0.43
Nodes (7): RedTeamTests (zero unapproved side effects), Invariant: untrusted text only through UntrustedText inside its fence, UntrustedText (body/attribute inside its fence), Poisoned Article Corpus, Private-Content Policy (private repos stay on-device), Uniform Prompt Fence Escaping, Red-team Suite

### Community 127 - ".availability()"
Cohesion: 0.29
Nodes (5): .biometryName, BiometricUnavailable, BiometryType, Result, Void

### Community 128 - "ProviderKeyRow"
Cohesion: 0.29
Nodes (5): ProviderKeyRow, .body, LLMProvider, String, Void

### Community 129 - "CaseIterable"
Cohesion: 0.33
Nodes (6): CaseIterable, Strength, balanced, off, strict, .threshold

### Community 130 - "Living Project Brief"
Cohesion: 0.53
Nodes (6): Invariant: brief text changes only through BriefEditing, BriefDiff (line diff of brief changes), BriefEditing (only path that changes brief text), Brief Line Diff (accept or reject), Living Project Brief, Suggest an Update

### Community 131 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 132 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 133 - ".color()"
Cohesion: 0.50
Nodes (3): Color, .body, ThemeStyle

### Community 134 - "Chunk (SwiftData model)"
Cohesion: 0.80
Nodes (5): C5 Store vectors as binary Data, not JSON snapshots, Chunk (SwiftData model), Phase 0 embedding bake-off, FR-5 Chunk and embed on-device with model version, RetrievalKit

### Community 135 - "DecisionProviding protocol seam"
Cohesion: 0.50
Nodes (5): DecisionKit proposed ODK module, DecisionProviding protocol seam, Jev typed decision models, LangChain - What Is Jev?, T0 heuristics and embeddings

### Community 137 - "KnowledgeSchema"
Cohesion: 0.40
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 138 - "SeededRandom"
Cohesion: 0.60
Nodes (3): SeededRandom, UInt64, RandomNumberGenerator

### Community 139 - "Apple Intelligence Preflight"
Cohesion: 0.40
Nodes (5): Apple Intelligence Preflight, Build and Package Test Commands, Onboarding Interview, Requirements (Xcode 26+, iOS 26+, iPhone 15 Pro+), XcodeGen (project.yml, generated xcodeproj)

### Community 140 - "AppStore"
Cohesion: 0.40
Nodes (4): AppStore, Error, ModelContainer, Result

### Community 141 - ".elapsed()"
Cohesion: 0.50
Nodes (3): String, TimeInterval, Void

### Community 142 - ".load()"
Cohesion: 0.50
Nodes (3): Error, Result, URL

## Ambiguous Edges - Review These
- `Scale Performance Tests (100k chunks, 3k themes)` → `Device Measurement (Instruments signposts)`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **298 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+293 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 589 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `Scale Performance Tests (100k chunks, 3k themes)` and `Device Measurement (Instruments signposts)`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `Foundation` connect `Foundation` to `XCTestCase`, `SmartWardIntents.swift`, `SharedInbox`, `Article`, `IngestError`, `LibraryFixture`, `KnowledgeSchema`, `HybridSearchIndex`, `AppStore`, `KnowledgeStore`, `GitHubDeviceFlow`, `StrategyItemKind`, `DailyBudget`, `DigestSummaryRequest`, `DigestBuilder`, `ActionRequest`, `ExtractedArticle`, `BYOKLLMKit`, `.parse()`, `PerfTrace`, `SourceFetcher`, `ThemeStrengthCache`, `SecuritySettingsSection`, `SwiftUI`, `GitHubError`, `Digest`, `AppLock.swift`, `LibraryArchive`, `.canonicalize()`, `TopK`, `ConversationView.swift`?**
  _High betweenness centrality (0.060) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `SharedInbox`, `Conversation`, `.dismiss()`, `HybridSearchIndex`, `.makeContainer()`, `DigestSummaryRequest`, `DigestBuilder`, `ExtractionTiers`, `Source`, `PipelineRunner`, `InterestModel`, `SearchHit`, `.load()`, `ThemeStrengthCache`, `RetrievedPassage`, `LexicalIndex`, `.article()`, `.fetch()`, `GraphIndexer`, `.save()`, `RetrievalFixture`, `ArticleReaderView`, `ArticleStage`, `EmbeddingModel`, `DigestClusterSection`?**
  _High betweenness centrality (0.048) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `Project`, `SmartWardIntents.swift`, `SourceFetcher`, `Article`, `GraphIndexer`, `HybridSearchIndex`, `AppStore`, `ThemeStrengthCache`, `StrategyItemKind`, `StrategistRunner`, `SwiftUI`, `DigestBuilder`, `ConversationView.swift`, `Foundation`, `.retrieve()`, `BYOKLLMKit`?**
  _High betweenness centrality (0.035) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _298 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Project` be split into smaller, more focused modules?**
  _Cohesion score 0.07462686567164178 - nodes in this community are weakly interconnected._
- **Should `XCTestCase` be split into smaller, more focused modules?**
  _Cohesion score 0.058699101004759384 - nodes in this community are weakly interconnected._
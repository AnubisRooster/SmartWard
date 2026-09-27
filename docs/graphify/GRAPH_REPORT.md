# Graph Report - SmartWard  (2026-09-27)

## Corpus Check
- 128 files · ~483,192 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .plist 2, .entitlements 2, (none) 1)

## Summary
- 2294 nodes · 6112 edges · 111 communities (107 shown, 4 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 690 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- KnowledgeStore
- Sendable
- DigestBuilder
- ModelFallback
- Project
- Article
- .record()
- IngestError
- DeveloperView
- OnboardingView
- LibraryFixture
- ProjectLink
- GitHubDeviceFlow
- StrategistRunner
- StrategyItemKind
- InterestModel
- PipelineRunner
- .makeContainer()
- ExtractedGraph
- ActionRequest
- AddSourceTool
- View
- ReferenceLedger
- GitHubClient
- .parse()
- EmbeddingModel
- .article()
- SourceFetcher
- .body
- ExtractedArticle
- Dependency
- ConversationMode
- RecordStrategyItemTool
- AppLockCoordinator
- .extract()
- .testGraphQueriesDoNotScaleWithTheWholeG
- RetrievedPassage
- ThemeStrengthCache
- FakeExtractor
- makeContext()
- Scenario
- .send()
- .fetchURL()
- EntityResolver
- .build()
- .load()
- PlaybackLLM
- HybridSearchIndex
- BriefError
- AppLock.swift
- .importPending()
- GitHubAccount
- ThemeDetailView
- Kind
- CodingKeys
- GitHubError
- GitHubRepo
- XCTestCase
- SearchDocument
- .plan()
- BackupView
- SmartWardIntents.swift
- GraphView
- SharedInbox
- FakeTransport
- .body
- Choice
- ShareModel
- AppLockPolicy
- LibraryArchive
- SourceKind
- RetrievalFixture
- AppLockController
- FakeEmbedder
- .apply()
- .importItems()
- .fromPastedURL()
- .score()
- String
- .process()
- SourceKindOption
- GraphSnapshot
- .canonicalize()
- Identifiable
- ArticleStage
- TopK
- FakeBiometrics
- Filter
- SmartWardApp
- ProjectEntity
- SearchHit
- .documents()
- AppTab
- FoundationModelsEntityExtractor
- AddSourceView
- KnowledgeSchema
- .graphML()
- ArticleReaderView
- ActivitySheet
- graphify_pipeline.py
- .data()
- .perform()
- PINOutcome
- BriefRevisionStatus
- .color()
- .isAcceptable()
- SeededRandom
- .isLoaded()
- SharedInboxTests
- IntentFailure
- PackageDescription

## God Nodes (most connected - your core abstractions)
1. `KnowledgeStore` - 87 edges
2. `SwiftData` - 75 edges
3. `Project` - 67 edges
4. `Article` - 62 edges
5. `Source` - 49 edges
6. `ThemeNode` - 47 edges
7. `Conversation` - 35 edges
8. `LibraryArchive` - 34 edges
9. `ProjectLink` - 34 edges
10. `HybridSearchIndex` - 33 edges

## Surprising Connections (you probably didn't know these)
- `.filteredOutCount` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.reading` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.visible` --references--> `Article`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.matches` --references--> `ThemeNode`  [INFERRED]
  SmartWard/Graph/GraphView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `AppLockController` --calls--> `BiometricService`  [INFERRED]
  SmartWard/Lock/AppLockController.swift → Packages/SmartWardKit/Sources/AppLock/AppLock.swift

## Import Cycles
- None detected.

## Communities (111 total, 4 thin omitted)

### Community 0 - "KnowledgeStore"
Cohesion: 0.05
Nodes (28): Accelerate, BackgroundTasks, BYOKLLMKit, CommonCrypto, CryptoKit, Foundation, FoundationModels, GraphKit (+20 more)

### Community 1 - "Sendable"
Cohesion: 0.05
Nodes (80): Codable, Equatable, ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool (+72 more)

### Community 2 - "DigestBuilder"
Cohesion: 0.05
Nodes (43): BYOKDigestSummarizer, DigestBuilder, DigestPrompt, DigestSummarizing, DigestSummary, DigestSummaryRequest, Excerpt, Group (+35 more)

### Community 3 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 4 - "Project"
Cohesion: 0.09
Nodes (31): BriefRevision, Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date (+23 more)

### Community 5 - "Article"
Cohesion: 0.11
Nodes (26): Article, Chunk, Conversation, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message (+18 more)

### Community 6 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 7 - "IngestError"
Cohesion: 0.08
Nodes (30): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+22 more)

### Community 8 - "DeveloperView"
Cohesion: 0.08
Nodes (30): DispatchTime, os, PerfTrace, .names, .samples, Sample, Summary, Date (+22 more)

### Community 9 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 10 - "LibraryFixture"
Cohesion: 0.08
Nodes (27): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+19 more)

### Community 11 - "ProjectLink"
Cohesion: 0.07
Nodes (31): Set, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url, ModelContext (+23 more)

### Community 12 - "GitHubDeviceFlow"
Cohesion: 0.09
Nodes (26): GitHubDeviceCode, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+18 more)

### Community 13 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 14 - "StrategyItemKind"
Cohesion: 0.10
Nodes (22): StrategyItem, .kind, .status, StrategyItemKind, actionItem, assumption, decision, openQuestion (+14 more)

### Community 15 - "InterestModel"
Cohesion: 0.12
Nodes (21): CaseIterable, Bool, Interest, InterestModel, .isEmpty, Strength, balanced, off (+13 more)

### Community 16 - "PipelineRunner"
Cohesion: 0.14
Nodes (18): DailyBudget, ExtractionTiers, FullTextFetching, PipelineRunner, .stages, Report, Date, Double (+10 more)

### Community 17 - ".makeContainer()"
Cohesion: 0.14
Nodes (14): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+6 more)

### Community 18 - "ExtractedGraph"
Cohesion: 0.14
Nodes (13): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, Relation, LLMCompleting, LLMProvider (+5 more)

### Community 19 - "ActionRequest"
Cohesion: 0.13
Nodes (21): LocalizedError, ActionRequest, StrategistError, .errorDescription, incompleteResponse, StrategistEvent, awaitingConfirmation, confirmationResolved (+13 more)

### Community 20 - "AddSourceTool"
Cohesion: 0.14
Nodes (14): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, JSONValue, LLMTool (+6 more)

### Community 21 - "View"
Cohesion: 0.13
Nodes (23): Source, ArticleRow, .body, .content, ReadingView, .emptyState, .filteredOutCount, .hasFollowedSources (+15 more)

### Community 22 - "ReferenceLedger"
Cohesion: 0.16
Nodes (15): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, ReferenceLedger, SearchCorpusTool, .definition (+7 more)

### Community 23 - "GitHubClient"
Cohesion: 0.20
Nodes (9): GitHubClient, .isAuthenticated, Data, HTTPURLResponse, Set, String, T, URLRequest (+1 more)

### Community 24 - ".parse()"
Cohesion: 0.15
Nodes (11): NSObject, Entry, .url, FeedParser, FeedXMLDelegate, ParsedFeed, Data, String (+3 more)

### Community 25 - "EmbeddingModel"
Cohesion: 0.14
Nodes (14): EmbeddingModel, EmbeddingProviding, String, ExtractionTier, byok, onDevice, GraphIndexer, .suggestionsAdded (+6 more)

### Community 26 - ".article()"
Cohesion: 0.16
Nodes (11): ArticleIndexer, Int, FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer (+3 more)

### Community 27 - "SourceFetcher"
Cohesion: 0.21
Nodes (7): SourceDescriptor, SourceFetcher, Bool, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 28 - ".body"
Cohesion: 0.13
Nodes (19): AppLock, PINLockKit, LockScreen, PrivacyCover, .body, SecuritySettingsSection, .body, .lockBinding (+11 more)

### Community 29 - "ExtractedArticle"
Cohesion: 0.13
Nodes (15): ExtractedArticle, Date, Bool, FullTextError, .errorDescription, nothingMore, IngestController, Bool (+7 more)

### Community 30 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 31 - "ConversationMode"
Cohesion: 0.11
Nodes (19): .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview, ChatListView (+11 more)

### Community 32 - "RecordStrategyItemTool"
Cohesion: 0.16
Nodes (11): Arguments, ProjectStateTool, .definition, invalidArguments, ProposeBriefUpdateTool, .definition, RecordStrategyItemTool, JSONValue (+3 more)

### Community 33 - "AppLockCoordinator"
Cohesion: 0.19
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, PINAttemptResult, String, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 34 - ".extract()"
Cohesion: 0.22
Nodes (7): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, Unicode

### Community 35 - ".testGraphQueriesDoNotScaleWithTheWholeG"
Cohesion: 0.16
Nodes (13): GraphRetriever, Bool, Float, ModelContext, String, UUID, Why, connected (+5 more)

### Community 36 - "RetrievedPassage"
Cohesion: 0.16
Nodes (16): RetrievedPassage, ActionConfirmationCard, .body, .body, EmptyChatHint, .body, .purpose, MessageRow (+8 more)

### Community 37 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 38 - "FakeExtractor"
Cohesion: 0.15
Nodes (13): FakeCompletion, FakeExtractor, GraphIndexingTests, AsyncThrowingStream, Bool, Error, Int, LLMRequest (+5 more)

### Community 39 - "makeContext()"
Cohesion: 0.14
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 40 - "Scenario"
Cohesion: 0.20
Nodes (12): Attack, RecordingFetcher, RedTeamTests, Scenario, Bool, JSONValue, LLMChatMessage, LLMToolCall (+4 more)

### Community 41 - ".send()"
Cohesion: 0.18
Nodes (12): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, LLMProvider, ModelContext, String (+4 more)

### Community 42 - ".fetchURL()"
Cohesion: 0.27
Nodes (6): SourceEndpoint, String, URL, SourceEndpointTests, String, URL

### Community 43 - "EntityResolver"
Cohesion: 0.25
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 44 - ".build()"
Cohesion: 0.22
Nodes (13): Edge, Node, Scope, all, recent, source, Bool, Date (+5 more)

### Community 45 - ".load()"
Cohesion: 0.22
Nodes (11): SampleLibrary, Size, SplitMix, Date, Double, Float, Int, ModelContainer (+3 more)

### Community 46 - "PlaybackLLM"
Cohesion: 0.16
Nodes (11): Set, answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse (+3 more)

### Community 47 - "HybridSearchIndex"
Cohesion: 0.22
Nodes (10): HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, Float, Int, PerformanceTests, String (+2 more)

### Community 48 - "BriefError"
Cohesion: 0.15
Nodes (14): BriefDiff, BriefError, empty, .errorDescription, notPending, outdated, unchanged, Line (+6 more)

### Community 49 - "AppLock.swift"
Cohesion: 0.17
Nodes (11): AnyObject, BiometricLockKit, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable (+3 more)

### Community 50 - ".importPending()"
Cohesion: 0.17
Nodes (7): BGContinuedProcessingTask, BackgroundWork, ShareIntake, Int, ModelContext, TimeInterval, .body

### Community 51 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 52 - "ThemeDetailView"
Cohesion: 0.19
Nodes (14): Connection, .id, String, UUID, Void, ThemeDetailView, .body, .connections (+6 more)

### Community 53 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 54 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 55 - "GitHubError"
Cohesion: 0.14
Nodes (13): Decodable, GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized (+5 more)

### Community 56 - "GitHubRepo"
Cohesion: 0.22
Nodes (9): GitHubRepo, .id, Bool, Document, RepoSnapshot, String, RepoSyncTests, Bool (+1 more)

### Community 57 - "XCTestCase"
Cohesion: 0.13
Nodes (9): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, SampleLibraryTests, GraphExportTests, TopKTests, VectorCodingTests, BriefDiffTests (+1 more)

### Community 58 - "SearchDocument"
Cohesion: 0.25
Nodes (8): SearchCorpus, SearchDocument, Bool, ModelContext, Set, UUID, Update, .isEmpty

### Community 59 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 60 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 61 - "SmartWardIntents.swift"
Cohesion: 0.24
Nodes (13): AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+5 more)

### Community 62 - "GraphView"
Cohesion: 0.22
Nodes (13): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+5 more)

### Community 63 - "SharedInbox"
Cohesion: 0.24
Nodes (7): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedProject, URL

### Community 64 - "FakeTransport"
Cohesion: 0.23
Nodes (6): FakeTransport, GitHubClientTests, Data, HTTPURLResponse, URLRequest, Reply

### Community 65 - ".body"
Cohesion: 0.14
Nodes (12): KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, ReadingSettingsSection, .body, ProviderKeyRow, .body (+4 more)

### Community 66 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 67 - "ShareModel"
Cohesion: 0.22
Nodes (8): NSExtensionContext, ShareModel, .canSave, ShareView, .body, Bool, String, UUID

### Community 68 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 69 - "LibraryArchive"
Cohesion: 0.23
Nodes (9): LibraryArchive, RestoreError, .errorDescription, libraryNotEmpty, Bool, Int, ModelContext, String (+1 more)

### Community 70 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 71 - "RetrievalFixture"
Cohesion: 0.23
Nodes (8): GraphRetrieverTests, KeyedExtractor, RetrievalFixture, Bool, ModelContainer, ModelContext, String, UUID

### Community 72 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 73 - "FakeEmbedder"
Cohesion: 0.29
Nodes (5): EmbeddingProviding, FakeEmbedder, .dimension, Int, HybridSearchTests

### Community 74 - ".apply()"
Cohesion: 0.36
Nodes (5): ApplyResult, RepoSync, Date, Int, ModelContext

### Community 75 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 77 - ".score()"
Cohesion: 0.24
Nodes (6): Date, Double, TimeInterval, ThemeStrength, TimeInterval, ThemeStrengthTests

### Community 78 - "String"
Cohesion: 0.35
Nodes (4): LexicalIndex, .count, String, LexicalIndexTests

### Community 79 - ".process()"
Cohesion: 0.24
Nodes (9): FoundationModelsRelevanceJudge, PipelineController, Bool, ModelContext, String, TimeInterval, Triage.Strength, .label (+1 more)

### Community 80 - "SourceKindOption"
Cohesion: 0.20
Nodes (10): AppEnum, DisplayRepresentation, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind (+2 more)

### Community 81 - "GraphSnapshot"
Cohesion: 0.36
Nodes (7): CGFloat, ForceLayout, GraphSnapshot, Point, GraphSnapshotTests, GraphCanvas, .body

### Community 82 - ".canonicalize()"
Cohesion: 0.27
Nodes (7): DateFormatter, ISO8601DateFormatter, CanonicalURL, FeedDate, Set, String, URL

### Community 83 - "Identifiable"
Cohesion: 0.33
Nodes (5): Identifiable, SharedItem, Date, String, UUID

### Community 84 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 85 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 86 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 87 - "Filter"
Cohesion: 0.20
Nodes (10): Filter, all, .id, starred, unread, Order, .id, newest (+2 more)

### Community 88 - "SmartWardApp"
Cohesion: 0.22
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 89 - "ProjectEntity"
Cohesion: 0.39
Nodes (6): AppEntity, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID

### Community 90 - "SearchHit"
Cohesion: 0.28
Nodes (8): OptionSet, MatchKind, RankedDocument, SearchHit, .id, Double, MatchBadge, .body

### Community 91 - ".documents()"
Cohesion: 0.31
Nodes (4): IncrementalIndexTests, Int, Range, Sequence

### Community 92 - "AppTab"
Cohesion: 0.25
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 93 - "FoundationModelsEntityExtractor"
Cohesion: 0.39
Nodes (6): ExtractionSettings, FoundationModelsEntityExtractor, GeneratedEntity, GeneratedGraph, GeneratedRelation, String

### Community 94 - "AddSourceView"
Cohesion: 0.36
Nodes (6): AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, String

### Community 95 - "KnowledgeSchema"
Cohesion: 0.21
Nodes (8): KnowledgeSchema, .schema, PersistentModel, Schema, AppStore, Error, ModelContainer, Result

### Community 96 - ".graphML()"
Cohesion: 0.39
Nodes (5): GraphExport, Date, LibraryArchive, String, SessionGraph

### Community 97 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 98 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 99 - "graphify_pipeline.py"
Cohesion: 0.33
Nodes (6): json, pathlib, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 100 - ".data()"
Cohesion: 0.52
Nodes (3): Data, Float, VectorCoding

### Community 101 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 102 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 103 - "BriefRevisionStatus"
Cohesion: 0.33
Nodes (6): .status, BriefRevisionStatus, accepted, pending, rejected, superseded

### Community 104 - ".color()"
Cohesion: 0.50
Nodes (3): Color, .body, ThemeStyle

### Community 106 - "SeededRandom"
Cohesion: 0.60
Nodes (3): SeededRandom, UInt64, RandomNumberGenerator

### Community 107 - ".isLoaded()"
Cohesion: 0.50
Nodes (3): Bool, ModelContext, .sampleLoaded

### Community 109 - "IntentFailure"
Cohesion: 0.50
Nodes (4): IntentFailure, .errorDescription, libraryUnavailable, noProvider

## Knowledge Gaps
- **260 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+255 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 521 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Article` connect `Article` to `Sendable`, `DigestBuilder`, `DeveloperView`, `ProjectLink`, `InterestModel`, `PipelineRunner`, `View`, `EmbeddingModel`, `.article()`, `ExtractedArticle`, `.testGraphQueriesDoNotScaleWithTheWholeG`, `RetrievedPassage`, `ThemeStrengthCache`, `FakeExtractor`, `makeContext()`, `Scenario`, `.load()`, `SearchDocument`, `RetrievalFixture`, `FakeEmbedder`, `.apply()`, `.importItems()`, `ArticleStage`, `ArticleReaderView`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Why does `Foundation` connect `KnowledgeStore` to `Sendable`, `DigestBuilder`, `Article`, `IngestError`, `DeveloperView`, `GitHubDeviceFlow`, `ActionRequest`, `.parse()`, `SourceFetcher`, `ExtractedArticle`, `Dependency`, `makeContext()`, `AppLock.swift`, `GitHubError`, `SmartWardIntents.swift`, `SharedInbox`, `.score()`, `.canonicalize()`, `TopK`?**
  _High betweenness centrality (0.058) - this node is a cross-community bridge._
- **Why does `Project` connect `Project` to `RecordStrategyItemTool`, `Sendable`, `DigestBuilder`, `Article`, `makeContext()`, `Scenario`, `.apply()`, `ProjectLink`, `LibraryFixture`, `StrategyItemKind`, `GitHubRepo`, `.article()`, `GraphView`, `ConversationMode`?**
  _High betweenness centrality (0.053) - this node is a cross-community bridge._
- **Are the 23 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 23 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _260 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `KnowledgeStore` be split into smaller, more focused modules?**
  _Cohesion score 0.052521008403361345 - nodes in this community are weakly interconnected._
- **Should `Sendable` be split into smaller, more focused modules?**
  _Cohesion score 0.05476190476190476 - nodes in this community are weakly interconnected._
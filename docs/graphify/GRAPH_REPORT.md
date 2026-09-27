# Graph Report - SmartWard  (2026-09-27)

## Corpus Check
- Large corpus: 145 files · ~541,355 words. Semantic extraction will be expensive (many Claude tokens). Consider running on a subfolder.

## Summary
- 2285 nodes · 6083 edges · 120 communities (115 shown, 5 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 682 edges (avg confidence: 0.83)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ExtractedGraph
- ModelFallback
- RetrievedPassage
- .record()
- String
- OnboardingView
- IngestError
- StrategistRunner
- Sendable
- GitHubClient
- Project
- GitHubDeviceFlow
- View
- KnowledgeStore
- StrategyItemKind
- BriefRevision
- ActionRequest
- SwiftData
- OnboardingProposal
- BYOKLLMKit
- ThemeNode
- .parse()
- ProjectLink
- RawItem
- Source
- GraphSnapshot
- GraphNeighborsTool
- .load()
- .score()
- SharedInbox
- HybridSearchIndex
- AppLockCoordinator
- Dependency
- .makeContainer()
- StrategistTool
- XCTestCase
- .extract()
- .fetchURL()
- .process()
- ReferenceLedger
- ThemeStrengthCache
- SmartWardIntents.swift
- LexicalIndex
- .fetch()
- SourceFetcher
- DailyBudget
- DigestSummaryRequest
- InterestModel
- .article()
- .body
- Digest
- .seal()
- PipelineRunner
- ConversationMode
- PerfTrace
- SearchDocument
- makeContext()
- EntityResolver
- FakeTransport
- .importPending()
- ShareModel
- GitHubAccount
- SearchHit
- .dismiss()
- Kind
- CodingKeys
- .plan()
- XCTest
- PlaybackLLM
- SwiftUI
- BackupView
- AppLock.swift
- .send()
- LocalizedError
- .projects()
- Article
- GraphIndexer
- NewConversationView
- Choice
- GraphView
- AppLockPolicy
- SourceKind
- .data()
- AppLockController
- .buildIfDue()
- ParsedFeed
- IngestController
- DeveloperView
- ProjectEntity
- AppLockTests.swift
- GraphCanvas
- ExtractedArticle
- .importItems()
- .clusters()
- .render()
- RecordStrategyItemTool
- LibraryFixture
- ArticleStage
- TopK
- FakeBiometrics
- AppTab
- SmartWardApp
- GitHubError
- LibraryArchive
- EmbeddingModel
- SourceKindOption
- ArchiveError
- ArticleReaderView
- DigestClusterSection
- ActivitySheet
- graphify_pipeline.py
- .perform()
- PINOutcome
- .merge()
- Step
- KnowledgeSchema
- SharedInboxTests
- AppStore
- RobotsRules
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
9. `HybridSearchIndex` - 33 edges
10. `SourceKind` - 32 edges

## Surprising Connections (you probably didn't know these)
- `.hasFollowedSources` --references--> `Source`  [INFERRED]
  SmartWard/Reading/ReadingView.swift → Packages/SmartWardKit/Sources/KnowledgeStore/Models.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
- `.parameterSummary` --calls--> `Summary`  [INFERRED]
  SmartWard/Intents/SmartWardIntents.swift → Packages/SmartWardKit/Sources/Pipeline/PerfTrace.swift
- `AppLockController` --calls--> `BiometricService`  [INFERRED]
  SmartWard/Lock/AppLockController.swift → Packages/SmartWardKit/Sources/AppLock/AppLock.swift
- `AppLockController` --calls--> `AppLockCoordinator`  [INFERRED]
  SmartWard/Lock/AppLockController.swift → Packages/SmartWardKit/Sources/AppLock/AppLock.swift

## Import Cycles
- None detected.

## Communities (120 total, 5 thin omitted)

### Community 0 - "ExtractedGraph"
Cohesion: 0.05
Nodes (44): BYOKExtractor, Entity, EntityExtracting, ExtractedGraph, ExtractionOutput, ExtractionPrompt, .schema, ExtractionTier (+36 more)

### Community 1 - "ModelFallback"
Cohesion: 0.06
Nodes (40): Alternatives, LLMCompleting, LLMCompletionError, FallbackLLM, ModelFallback, AsyncThrowingStream, Bool, CatalogEntry (+32 more)

### Community 2 - "RetrievedPassage"
Cohesion: 0.06
Nodes (39): GraphRetriever, RetrievedPassage, Bool, Float, ModelContext, String, UUID, Why (+31 more)

### Community 3 - ".record()"
Cohesion: 0.09
Nodes (30): Line, .id, Price, PriceBook, Bool, Calendar, Date, Double (+22 more)

### Community 4 - "String"
Cohesion: 0.11
Nodes (25): Chunk, Conversation, EntityAlias, InterestProfile, Mention, MergeSuggestion, Message, ReadingSignal (+17 more)

### Community 5 - "OnboardingView"
Cohesion: 0.06
Nodes (29): project, ConversationHistory, Entry, Date, Int, LLMChatMessage, String, OnboardingSynthesizer (+21 more)

### Community 6 - "IngestError"
Cohesion: 0.09
Nodes (27): IngestError, backingOff, disallowedByRobots, .errorDescription, http, invalidResponse, invalidURL, notAFeed (+19 more)

### Community 7 - "StrategistRunner"
Cohesion: 0.13
Nodes (21): StrategistRunner, Int, LLMCompleting, EchoTool, .definition, FailingTool, .definition, GuardedTool (+13 more)

### Community 8 - "Sendable"
Cohesion: 0.23
Nodes (33): Codable, Equatable, GitHubDeviceCode, Int, AliasRecord, ArticleRecord, BriefRecord, BriefRevisionRecord (+25 more)

### Community 9 - "GitHubClient"
Cohesion: 0.12
Nodes (16): Decodable, GitHubClient, .isAuthenticated, GitHubRepo, .id, GitHubUser, Bool, Data (+8 more)

### Community 10 - "Project"
Cohesion: 0.13
Nodes (18): Project, ProjectBrief, BriefEditing, tooLong, BriefReviser, Suggestion, Date, LLMCompleting (+10 more)

### Community 11 - "GitHubDeviceFlow"
Cohesion: 0.10
Nodes (23): HTTPTransport, GitHubDeviceFlow, GitHubDeviceFlowError, denied, .errorDescription, expired, failed, notConfigured (+15 more)

### Community 12 - "View"
Cohesion: 0.08
Nodes (28): KnowledgeGraphSettingsSection, .body, .providersWithKeys, LLMProvider, LockScreen, PrivacyCover, .body, SecuritySettingsSection (+20 more)

### Community 13 - "KnowledgeStore"
Cohesion: 0.11
Nodes (8): Accelerate, BackgroundTasks, IngestKit, KnowledgeStore, NaturalLanguage, RetrievalKit, ShareInbox, GitHubConfig

### Community 14 - "StrategyItemKind"
Cohesion: 0.12
Nodes (15): .kind, StrategyItemKind, actionItem, assumption, decision, openQuestion, risk, .definition (+7 more)

### Community 15 - "BriefRevision"
Cohesion: 0.10
Nodes (21): BriefRevision, .status, BriefRevisionStatus, accepted, pending, rejected, superseded, BriefDiff (+13 more)

### Community 16 - "ActionRequest"
Cohesion: 0.14
Nodes (16): AddSourceTool, .definition, .kinds, Arguments, FetchURLTool, .definition, JSONValue, LLMTool (+8 more)

### Community 17 - "SwiftData"
Cohesion: 0.12
Nodes (5): CommonCrypto, CryptoKit, Foundation, Security, SwiftData

### Community 18 - "OnboardingProposal"
Cohesion: 0.13
Nodes (19): Identifiable, ApplyResult, OnboardingProposal, .schema, ProjectProposal, .id, SourceProposal, .id (+11 more)

### Community 19 - "BYOKLLMKit"
Cohesion: 0.14
Nodes (8): BYOKLLMKit, FoundationModels, ModelCatalogKit, Observation, ActionTools, BriefOrigin, StrategistCore, UserNotifications

### Community 20 - "ThemeNode"
Cohesion: 0.15
Nodes (18): Data, ThemeNode, Connection, .id, MergeReviewView, .body, Int, String (+10 more)

### Community 21 - ".parse()"
Cohesion: 0.13
Nodes (11): DateFormatter, ISO8601DateFormatter, FeedParser, Data, CanonicalURL, FeedDate, Date, Set (+3 more)

### Community 22 - "ProjectLink"
Cohesion: 0.12
Nodes (12): Set, String, ProjectLink, .kind, .sendsContentToBYOK, ProjectLinkKind, githubRepo, url (+4 more)

### Community 23 - "RawItem"
Cohesion: 0.18
Nodes (11): FeedIngest, Result, Date, Error, Int, ModelContext, String, TimeInterval (+3 more)

### Community 24 - "Source"
Cohesion: 0.15
Nodes (16): Source, AddSourceView, .body, .defaultName, .storedURL, .trimmedInput, SourceDetailView, SourceRow (+8 more)

### Community 25 - "GraphSnapshot"
Cohesion: 0.20
Nodes (16): Edge, ForceLayout, GraphSnapshot, Node, Point, Scope, all, recent (+8 more)

### Community 26 - "GraphNeighborsTool"
Cohesion: 0.17
Nodes (13): Arguments, GraphNeighborsTool, .definition, OpenArticleTool, .definition, SearchCorpusTool, .definition, JSONValue (+5 more)

### Community 27 - ".load()"
Cohesion: 0.15
Nodes (15): SampleLibrary, Size, SplitMix, Bool, Date, Double, Float, Int (+7 more)

### Community 28 - ".score()"
Cohesion: 0.12
Nodes (13): GraphKit, Date, Double, TimeInterval, ThemeStrength, GraphExport, Date, LibraryArchive (+5 more)

### Community 29 - "SharedInbox"
Cohesion: 0.18
Nodes (11): JSONDecoder, JSONEncoder, SharedInbox, .itemsDirectory, .projectsFile, SharedItem, SharedProject, Date (+3 more)

### Community 30 - "HybridSearchIndex"
Cohesion: 0.18
Nodes (11): OptionSet, HybridSearchIndex, .documentCount, .documentIDs, .needsRebuild, MatchKind, Float, Int (+3 more)

### Community 31 - "AppLockCoordinator"
Cohesion: 0.18
Nodes (10): AppLockCoordinator, .isPINLockedOut, .pinLockoutRemaining, BiometricResult, PINAttemptResult, String, AppLockCoordinatorTests, FakePIN (+2 more)

### Community 32 - "Dependency"
Cohesion: 0.27
Nodes (4): Dependency, ManifestParser, String, ManifestParserTests

### Community 33 - ".makeContainer()"
Cohesion: 0.13
Nodes (7): Bool, ModelContainer, ModelContext, GraphEditingTests, Date, OnboardingApplyTests, ProjectToolTests

### Community 34 - "StrategistTool"
Cohesion: 0.14
Nodes (16): StrategistEvent, awaitingConfirmation, confirmationResolved, roundFinished, textDelta, toolCall, toolResult, StrategistTool (+8 more)

### Community 35 - "XCTestCase"
Cohesion: 0.11
Nodes (14): CanonicalURLTests, NormalizedKeyTests, AddSourceToolTests, PerfTraceTests, GraphSnapshotTests, PerformanceTests, SeededRandom, String (+6 more)

### Community 36 - ".extract()"
Cohesion: 0.22
Nodes (7): ArticleExtractor, Bool, Element, String, URL, ArticleExtractorTests, Unicode

### Community 37 - ".fetchURL()"
Cohesion: 0.22
Nodes (7): SourceEndpoint, Bool, String, URL, SourceEndpointTests, String, URL

### Community 38 - ".process()"
Cohesion: 0.11
Nodes (16): Strength, balanced, off, strict, .threshold, Triage, FoundationModelsRelevanceJudge, PipelineController (+8 more)

### Community 39 - "ReferenceLedger"
Cohesion: 0.17
Nodes (14): ReferenceLedger, Attack, RecordingFetcher, RedTeamTests, Scenario, .system, Bool, JSONValue (+6 more)

### Community 40 - "ThemeStrengthCache"
Cohesion: 0.20
Nodes (13): Entry, Fingerprint, Date, Double, Int, ModelContext, TimeInterval, UUID (+5 more)

### Community 41 - "SmartWardIntents.swift"
Cohesion: 0.15
Nodes (19): AppIntent, AppIntents, AppShortcut, AppShortcutsProvider, IntentAuthenticationPolicy, LocalizedStringResource, ParameterSummary, AddSourceIntent (+11 more)

### Community 42 - "LexicalIndex"
Cohesion: 0.17
Nodes (8): EmbeddingProviding, LexicalIndex, .count, FakeEmbedder, .dimension, Int, HybridSearchTests, LexicalIndexTests

### Community 43 - ".fetch()"
Cohesion: 0.22
Nodes (11): ApplyResult, Document, RepoSnapshot, RepoSync, Date, Int, ModelContext, String (+3 more)

### Community 44 - "SourceFetcher"
Cohesion: 0.23
Nodes (6): SourceDescriptor, SourceFetcher, Data, HTTPURLResponse, UUID, SourceFetcherTests

### Community 45 - "DailyBudget"
Cohesion: 0.18
Nodes (11): DailyBudget, DigestBuilder, DigestSummarizing, Date, ModelContext, TimeInterval, DigestBuilderTests, DigestFixture (+3 more)

### Community 46 - "DigestSummaryRequest"
Cohesion: 0.18
Nodes (11): BYOKDigestSummarizer, DigestSummary, DigestSummaryRequest, Excerpt, LLMCompleting, LLMProvider, LLMUsage, String (+3 more)

### Community 47 - "InterestModel"
Cohesion: 0.22
Nodes (10): Bool, Interest, InterestModel, .isEmpty, Bool, Double, Float, String (+2 more)

### Community 48 - ".article()"
Cohesion: 0.20
Nodes (9): FakeFullText, FixedJudge, PipelineRunnerTests, Bool, Float, ModelContainer, ModelContext, Set (+1 more)

### Community 49 - ".body"
Cohesion: 0.14
Nodes (16): GitHubProjectSection, .dependencies, .repoLinks, String, BriefController, BriefEditorView, .body, BriefHistoryView (+8 more)

### Community 50 - "Digest"
Cohesion: 0.25
Nodes (13): ArticleRef, Digest, .clusters, DigestCluster, ProjectRef, Bool, Date, Double (+5 more)

### Community 51 - ".seal()"
Cohesion: 0.19
Nodes (14): BackupError, .errorDescription, newerVersion, notABackup, passphraseTooShort, wrongPassphraseOrDamaged, EncryptedBackup, Data (+6 more)

### Community 52 - "PipelineRunner"
Cohesion: 0.22
Nodes (12): FullTextFetching, PipelineRunner, .stages, Report, Date, Double, ModelContext, Set (+4 more)

### Community 53 - "ConversationMode"
Cohesion: 0.12
Nodes (18): CaseIterable, .mode, ConversationMode, brainstorm, critique, onboarding, researchPlan, weeklyReview (+10 more)

### Community 54 - "PerfTrace"
Cohesion: 0.21
Nodes (11): DispatchTime, os, PerfTrace, .names, .samples, Sample, Date, Double (+3 more)

### Community 55 - "SearchDocument"
Cohesion: 0.23
Nodes (10): SearchCorpus, SearchDocument, Bool, ModelContext, Set, String, UUID, Update (+2 more)

### Community 56 - "makeContext()"
Cohesion: 0.15
Nodes (7): ContextPolicy, Bool, ContextPolicyTests, makeContext(), SchemaTests, ModelContainer, ModelContext

### Community 57 - "EntityResolver"
Cohesion: 0.26
Nodes (8): EntityResolver, Resolution, Bool, Float, ModelContext, String, UUID, EntityResolverTests

### Community 58 - "FakeTransport"
Cohesion: 0.15
Nodes (10): FakeTransport, GitHubDeviceCodeFixture, Data, HTTPURLResponse, Int, URLRequest, RepoSyncTests, Bool (+2 more)

### Community 59 - ".importPending()"
Cohesion: 0.19
Nodes (7): BGContinuedProcessingTask, BackgroundWork, ShareIntake, Int, ModelContext, TimeInterval, .body

### Community 60 - "ShareModel"
Cohesion: 0.17
Nodes (10): NSExtensionContext, ShareModel, .canSave, ShareView, .body, ShareViewController, Bool, String (+2 more)

### Community 61 - "GitHubAccount"
Cohesion: 0.21
Nodes (10): GitHubTokenStore, Bool, String, GitHubAccount, .client, .hasToken, Bool, String (+2 more)

### Community 62 - "SearchHit"
Cohesion: 0.22
Nodes (13): RankedDocument, SearchHit, .id, Double, MatchBadge, .body, SearchController, SearchResultsView (+5 more)

### Community 63 - ".dismiss()"
Cohesion: 0.18
Nodes (12): GitHubRepoPicker, .alreadyLinked, .body, Set, .body, SetPINView, .body, String (+4 more)

### Community 64 - "Kind"
Cohesion: 0.16
Nodes (15): ExportView, .body, Kind, .detail, .fileExtension, graph, .id, library (+7 more)

### Community 65 - "CodingKeys"
Cohesion: 0.13
Nodes (15): CodingKey, CodingKeys, defaultBranch, description, fullName, htmlURL, isPrivate, pushedAt (+7 more)

### Community 66 - ".plan()"
Cohesion: 0.24
Nodes (11): Plan, Refusal, alreadyFollowed, .errorDescription, invalidAddress, unsafeAddress, unsupportedKind, SourceIntake (+3 more)

### Community 68 - "PlaybackLLM"
Cohesion: 0.20
Nodes (10): answer(), InjectedActionTests, PlaybackLLM, AsyncThrowingStream, Error, LLMRequest, LLMResponse, LLMStreamEvent (+2 more)

### Community 69 - "SwiftUI"
Cohesion: 0.15
Nodes (3): SwiftUI, UIKit, UniformTypeIdentifiers

### Community 70 - "BackupView"
Cohesion: 0.19
Nodes (10): BackupView, .body, .canCreate, Bool, Data, Error, LibraryArchive, Result (+2 more)

### Community 71 - "AppLock.swift"
Cohesion: 0.20
Nodes (10): AnyObject, .biometryName, BiometricService, BiometricUnlocking, PINService, PINVerifying, BiometricUnavailable, BiometryType (+2 more)

### Community 72 - ".send()"
Cohesion: 0.24
Nodes (8): CheckedContinuation, Never, ChatController, Bool, LLMCompleting, LLMProvider, ModelContext, String

### Community 73 - "LocalizedError"
Cohesion: 0.14
Nodes (14): LocalizedError, RestoreError, .errorDescription, libraryNotEmpty, String, BriefError, empty, .errorDescription (+6 more)

### Community 74 - ".projects()"
Cohesion: 0.27
Nodes (7): MarkdownExport, Bool, Date, Int, ModelContext, String, MarkdownExportTests

### Community 75 - "Article"
Cohesion: 0.22
Nodes (13): Article, ArticleRow, .body, .content, ReadingView, .emptyState, .filteredOutCount, .hasFollowedSources (+5 more)

### Community 76 - "GraphIndexer"
Cohesion: 0.25
Nodes (8): GraphIndexer, .suggestionsAdded, GraphLinker, Result, Date, Int, ModelContext, String

### Community 77 - "NewConversationView"
Cohesion: 0.18
Nodes (12): ChatListView, .body, modeLabel(), String, NewConversationView, .body, .canStart, .providersWithKeys (+4 more)

### Community 78 - "Choice"
Cohesion: 0.14
Nodes (14): Choice, arxiv, feed, .footer, githubReleases, hackerNews, hfPapers, .id (+6 more)

### Community 79 - "GraphView"
Cohesion: 0.24
Nodes (12): Hashable, GraphView, .asList, .body, .graphScope, RefreshKey, ScopeChoice, all (+4 more)

### Community 80 - "AppLockPolicy"
Cohesion: 0.23
Nodes (8): AppLockPolicy, BiometricStep, needsPIN, unlocked, Bool, Date, TimeInterval, AppLockPolicyTests

### Community 81 - "SourceKind"
Cohesion: 0.15
Nodes (13): .sourceKind, SourceKind, arxiv, githubReleases, githubRepo, hfPapers, hn, .isPolled (+5 more)

### Community 82 - ".data()"
Cohesion: 0.24
Nodes (7): Data, Float, VectorCoding, ModelContext, Set, UUID, VectorCodingTests

### Community 83 - "AppLockController"
Cohesion: 0.21
Nodes (8): ScenePhase, AppLockController, .isEnabled, .policy, Bool, Date, String, .body

### Community 84 - ".buildIfDue()"
Cohesion: 0.22
Nodes (9): DigestController, .notificationsEnabled, Bool, ModelContext, String, TimeInterval, TodayView, .body (+1 more)

### Community 85 - "ParsedFeed"
Cohesion: 0.27
Nodes (8): NSObject, Entry, .url, FeedXMLDelegate, ParsedFeed, String, XMLParser, XMLParserDelegate

### Community 86 - "IngestController"
Cohesion: 0.24
Nodes (10): FullTextError, .errorDescription, nothingMore, IngestController, Bool, ModelContext, Set, String (+2 more)

### Community 87 - "DeveloperView"
Cohesion: 0.29
Nodes (7): DeveloperSettings, .isEnabled, DeveloperView, .body, Bool, Double, String

### Community 88 - "ProjectEntity"
Cohesion: 0.29
Nodes (8): AppEntity, DisplayRepresentation, EntityQuery, ProjectEntity, .displayRepresentation, ProjectQuery, UUID, TypeDisplayRepresentation

### Community 89 - "AppLockTests.swift"
Cohesion: 0.24
Nodes (5): AppLock, BiometricLockKit, PINRules, PINRulesTests, PINLockKit

### Community 90 - "GraphCanvas"
Cohesion: 0.24
Nodes (8): CGFloat, Color, ThemesRow, .body, ThemeStyle, GraphCanvas, .body, .body

### Community 91 - "ExtractedArticle"
Cohesion: 0.22
Nodes (5): ExtractedArticle, Date, Bool, URL, SwiftSoup

### Community 92 - ".importItems()"
Cohesion: 0.29
Nodes (6): Result, SharedImport, Date, Int, ModelContext, SharedImportTests

### Community 93 - ".clusters()"
Cohesion: 0.31
Nodes (6): Group, Bool, Int, UUID, UnionFind, .body

### Community 94 - ".render()"
Cohesion: 0.31
Nodes (4): DigestPrompt, ReferenceContext, String, UntrustedText

### Community 95 - "RecordStrategyItemTool"
Cohesion: 0.35
Nodes (5): Arguments, invalidArguments, RecordStrategyItemTool, JSONValue, String

### Community 96 - "LibraryFixture"
Cohesion: 0.22
Nodes (6): BackupTests, UInt32, LibraryArchiveTests, LibraryFixture, ModelContainer, ModelContext

### Community 97 - "ArticleStage"
Cohesion: 0.20
Nodes (10): .stage, ArticleStage, cleaned, embedded, extracted, failed, fetched, linked (+2 more)

### Community 98 - "TopK"
Cohesion: 0.40
Nodes (4): Bool, Element, Int, TopK

### Community 99 - "FakeBiometrics"
Cohesion: 0.31
Nodes (6): FakeBiometrics, BiometricResult, BiometricUnavailable, BiometryType, Result, Void

### Community 100 - "AppTab"
Cohesion: 0.24
Nodes (8): AppNavigation, AppTab, chat, graph, projects, reading, today, UUID

### Community 101 - "SmartWardApp"
Cohesion: 0.22
Nodes (8): App, Scene, SmartWardApp, .body, ComingSoonView, .body, RootView, String

### Community 102 - "GitHubError"
Cohesion: 0.22
Nodes (9): GitHubError, .errorDescription, http, invalidResponse, notFound, rateLimited, unauthorized, Date (+1 more)

### Community 103 - "LibraryArchive"
Cohesion: 0.39
Nodes (5): LibraryArchive, Bool, Int, ModelContext, T

### Community 104 - "EmbeddingModel"
Cohesion: 0.33
Nodes (5): EmbeddingModel, EmbeddingProviding, String, ArticleIndexer, Int

### Community 105 - "SourceKindOption"
Cohesion: 0.25
Nodes (8): AppEnum, SourceKindOption, arxiv, feed, githubReleases, hackerNews, .kind, webPage

### Community 106 - "ArchiveError"
Cohesion: 0.25
Nodes (6): ArchiveError, .errorDescription, newerVersion, notAnArchive, Data, Int

### Community 107 - "ArticleReaderView"
Cohesion: 0.29
Nodes (7): ArticleReaderView, .fullTextBanner, .metadata, .originalURL, .paragraphs, String, URL

### Community 108 - "DigestClusterSection"
Cohesion: 0.32
Nodes (6): DigestClusterSection, .body, DigestSections, .body, String, UUID

### Community 109 - "ActivitySheet"
Cohesion: 0.38
Nodes (5): Any, Context, ActivitySheet, UIActivityViewController, UIViewControllerRepresentable

### Community 110 - "graphify_pipeline.py"
Cohesion: 0.33
Nodes (6): json, pathlib, keep(), main(), Self-contained graphify pipeline for CI and for headless local runs. Builds a…, sys

### Community 111 - ".perform()"
Cohesion: 0.33
Nodes (4): IntentResult, ProvidesDialog, libraryContext(), ModelContext

### Community 112 - "PINOutcome"
Cohesion: 0.33
Nodes (6): PINOutcome, incorrect, lockedOut, noPIN, unlocked, Int

### Community 114 - "Step"
Cohesion: 0.40
Nodes (5): Step, building, interview, review, welcome

### Community 115 - "KnowledgeSchema"
Cohesion: 0.50
Nodes (4): KnowledgeSchema, .schema, PersistentModel, Schema

### Community 117 - "AppStore"
Cohesion: 0.50
Nodes (4): AppStore, Error, ModelContainer, Result

## Knowledge Gaps
- **260 isolated node(s):** `PackageDescription`, `unlocked`, `needsPIN`, `unlocked`, `incorrect` (+255 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 520 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **5 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `Foundation` connect `SwiftData` to `ExtractedGraph`, `String`, `IngestError`, `GitHubClient`, `GitHubDeviceFlow`, `KnowledgeStore`, `StrategyItemKind`, `BYOKLLMKit`, `.parse()`, `.score()`, `SharedInbox`, `Dependency`, `StrategistTool`, `SmartWardIntents.swift`, `SourceFetcher`, `Digest`, `PerfTrace`, `AppLock.swift`, `ParsedFeed`, `AppLockTests.swift`, `ExtractedArticle`, `.render()`, `TopK`, `AppTab`?**
  _High betweenness centrality (0.061) - this node is a cross-community bridge._
- **Why does `KnowledgeStore` connect `KnowledgeStore` to `.makeContainer()`, `RetrievedPassage`, `XCTest`, `SwiftUI`, `StrategistRunner`, `ThemeStrengthCache`, `SmartWardIntents.swift`, `SourceFetcher`, `GraphIndexer`, `StrategyItemKind`, `SwiftData`, `BYOKLLMKit`, `ThemeNode`, `SearchDocument`, `.score()`?**
  _High betweenness centrality (0.056) - this node is a cross-community bridge._
- **Why does `Article` connect `Article` to `ExtractedGraph`, `RetrievedPassage`, `String`, `ProjectLink`, `Source`, `.load()`, `.makeContainer()`, `ThemeStrengthCache`, `LexicalIndex`, `.fetch()`, `DailyBudget`, `InterestModel`, `.article()`, `PipelineRunner`, `SearchDocument`, `makeContext()`, `SearchHit`, `.dismiss()`, `GraphCanvas`, `ExtractedArticle`, `.importItems()`, `.clusters()`, `ArticleStage`, `EmbeddingModel`, `ArticleReaderView`, `DigestClusterSection`?**
  _High betweenness centrality (0.054) - this node is a cross-community bridge._
- **Are the 23 inferred relationships involving `Project` (e.g. with `.restore()` and `.apply()`) actually correct?**
  _`Project` has 23 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `unlocked`, `needsPIN` to the rest of the system?**
  _260 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ExtractedGraph` be split into smaller, more focused modules?**
  _Cohesion score 0.053998632946001365 - nodes in this community are weakly interconnected._
- **Should `ModelFallback` be split into smaller, more focused modules?**
  _Cohesion score 0.05737704918032787 - nodes in this community are weakly interconnected._
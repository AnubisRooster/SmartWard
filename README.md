<img src="docs/images/app-icon.png" alt="SmartWard icon" width="96" height="96">

# SmartWard

A local-first iPhone research strategist. SmartWard reads the AI and software-development world for you, keeps an on-device knowledge graph that links what you read with what you've discussed, and brainstorms your projects with the LLMs you bring your own keys for.

- **Plan & design:** [docs/PLAN.md](docs/PLAN.md) covers requirements, the HLD, the data model, and phased delivery.
- **Shared components:** [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), including BYOK LLM access, retrieval, the graph, and app lock.

## Screenshots

_Coming with the first on-device pass (see [docs/DEVICE_TESTING.md](docs/DEVICE_TESTING.md)) — CI only runs on the Simulator, so there are no real screens to show yet. Once captured, they'll go in `docs/images/` and get linked here._

## Status

Phase 1 foundation, done:

- [x] `SmartWardKit/KnowledgeStore`: the full SwiftData model (CloudKit-compatible), the private-content policy, and derived theme strength
- [x] App shell: tabs, SwiftData-backed Projects with repo/URL links, and BYOK key settings
- [x] Strategist chat: streaming BYOK chat with four modes, scoped to a project, where the strategist can read project state and record decisions and open questions
- [x] Onboarding interview: key and Apple Intelligence preflight, a strategist-led interview with pasted links, and a structured setup proposal you edit before anything is created
- [x] GitHub sign-in and repo sync: one-tap device flow (with a token as the advanced option), a repo picker, and read-only sync of docs and manifests; private repos stay on-device, and dependencies feed the dependency radar
- [x] App lock: Face ID/Touch ID with a PIN fallback, a lock on launch and after a background grace period, and a privacy cover in the app switcher

Phase 2 ingestion and search, done:

- [x] Sources and reading: RSS/Atom feeds (with feed discovery from a blog's home page), arXiv categories or searches, Hugging Face daily papers, Hacker News searches, GitHub releases, and watched web pages. Every request is rate-limited per host, backs off on 429/503, uses conditional GET, and checks robots.txt for web pages. Articles are deduped across sources and cleaned of hidden text. The Reading tab has a reader view, and dependency-radar suggestions can be followed with one tap
- [x] Ingestion pipeline: a resumable stage machine that triages new items on-device against your interests, projects, dependencies and reading history (Apple Foundation Models decides borderline items), fetches full text for relevant teasers, then chunks and embeds them on-device. Off-topic items stay searchable but are hidden from Unread
- [x] Hybrid search: keyword (BM25, with compound tokens like "SWE-bench" kept whole) and semantic search fused per article, on-device, from the Reading tab's search field. Off-topic items are included
- [x] Background refresh and the share extension: hourly background polling, backlog processing while charging, a Refresh that keeps going with system progress after you leave the app, and "Add to SmartWard" from any app's share sheet (optionally tagged to a project)

Phase 3 knowledge graph and GraphRAG, done:

- [x] Extraction and entity resolution: entities and relations from articles (on-device with Apple Intelligence), and from conversation turns and public repo docs (your provider, per D2; private repos and off-the-record chats stay on-device). Names resolve to one node through aliases and embedding similarity, with uncertain merges queued for review. Mentions and edges cite the chunk they came from, and the reader shows each article's themes
- [x] GraphRAG in chat: each turn gets passages from your library, found by words, by meaning, or by one hop through the graph, fenced as untrusted and cited as [R1]. The strategist can also search the library, explore a theme's connections, and open an item. Each reply lists its sources and why each was retrieved
- [x] Graph view: the strongest themes by scope (all, last two weeks, a project, a source), with dormant themes hidden unless you ask. Theme detail shows strength, names, connections and where each theme came up, with rename, merge and split (your corrections always win). A review queue handles the resolver's uncertain merges

Phase 4 strategist, done:

- [x] Approval before actions: the strategist can read a public web page (`fetch_url`) or follow a new source (`add_source`), but each one pauses on a card showing exactly what it will do, and runs only if you tap Approve. Each mode gets its own tools: critique can read pages but not add sources, weekly review sticks to your library and projects, and onboarding uses none
- [x] Living project brief: the strategist can propose a revised brief mid-chat, and "Suggest an update" drafts one from what's been decided since the last revision. Each suggestion is a line diff you accept or reject, your own edits apply at once, and every accepted change is kept in a history you can restore from. Open decisions, questions and action items are listed on the project, and you can swipe to close them
- [x] Cost controls: Settings → Usage & budget shows what your provider cost today and over 7 or 30 days, by feature and by model. When a provider doesn't report cost, it's estimated from OpenRouter catalog prices, or high on purpose for unknown models. A daily budget ($1 by default) switches background work to on-device once it's spent. When a model is rate-limited or down, requests retry on your fallback models, then on OpenRouter catalog models that support the same features and cost no more
- [x] Daily digest: the Today tab gathers articles linked since the last digest into theme clusters. Themes that show up in most new articles don't glue everything together. Clusters are ranked by how much they touch your active projects, how new their themes are, and how many articles they cover. The top three are summarized by your provider while the budget allows and without private content; the rest on-device. An optional notification says when a digest is ready. Settings moved behind the gear on Today
- [x] Red-team suite: a corpus of poisoned articles is fed to a model that obeys every injected instruction. The attacks cover direct orders, fence breaks in any case or spacing, fake system turns, exfiltration through URLs, requests to cloud metadata and local hosts, credentials in URLs, planted decisions, brief rewrites, guessed private document ids, poisoned titles and theme names, and floods of tool calls. None of them adds, fetches or records anything without your approval, changes the brief, or gets private content to the provider. Saving a decision or other strategy item now asks for approval too, and every prompt fence escapes untrusted text the same way

Phase 5 hardening, in progress:

- [x] Export: Settings → Export shares your library as versioned JSON (every table, relationships as ids, deterministic), the knowledge graph as GraphML (through OnDeviceKit's GraphKit) for Gephi or yEd, and projects as Markdown (goal, brief, decisions, open questions, action items and the brief's history). Private-repo content, links to private repos and themes found only there are left out unless you include them
- [x] Encrypted backup and restore: Settings → Backup & restore writes the whole library, including private-repo content and embeddings, as one file. It's compressed and encrypted with AES-GCM, using a key derived from your passphrase with PBKDF2-SHA256 (600,000 rounds). Restoring erases the library and recreates every row, field and relationship exactly. A wrong passphrase or a damaged file never restores anything. API keys, your GitHub sign-in and settings stay out of the file
- [x] Siri and Shortcuts: "Ask SmartWard" answers from your library and saves the chat. Actions that would need your approval are declined, and with the app lock on, Siri says where the answer is instead of reading it out. "Open my SmartWard digest" opens Today, and "Add a source to SmartWard" follows a feed, arXiv search, Hacker News search, GitHub releases or a web page, validated like the strategist's add_source
- [x] Empty states and accessibility:
  - The graph can be shown as a list, and switches to it automatically with VoiceOver. An empty scope explains itself and offers to show every theme.
  - Chat messages are announced by speaker. A new chat says what its mode is for, and warns before you type if the provider has no key.
  - The reading list announces unread and starred items, and strategy items announce their kind.
  - The budget bar reads as an amount of the cap, the lock screen icons scale with text size, and the reader explains when only a headline was saved
- [x] Performance:
  - Semantic search is one matrix-vector product over unit-length vectors, and BM25 no longer re-sums document lengths. Both keep their top results in a bounded heap instead of sorting every candidate.
  - Building the search index fetches chunks with their articles in one go.
  - GraphRAG, `graph_neighbors` and the graph view fetch only the themes and edges they need, through the stored theme keys, instead of the whole graph.
  - A 100,000-chunk search test and a 3,000-theme, 30,000-edge graph test print their timings to CI
- [x] Device measurement:
  - A developer screen can load a marked, removable 100,000-chunk sample library and run the GraphRAG latency check against the 500 ms target. Timings are signposts you can see in Instruments. See [docs/DEVICE_TESTING.md](docs/DEVICE_TESTING.md).
  - Theme strengths are cached between graph views and rescaled for decay rather than recomputed.
  - The search index takes new and removed articles in place instead of rebuilding

## Requirements

- Xcode 26+ and iOS 26+, on an iPhone 15 Pro or newer (Apple Intelligence-capable)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen)

## Build

```sh
brew install xcodegen
xcodegen generate          # SmartWard.xcodeproj is generated, not committed
open SmartWard.xcodeproj
```

Package tests run without the app, on the iOS Simulator:

```sh
cd Packages/SmartWardKit
xcodebuild test -scheme SmartWardKit-Package -destination 'platform=iOS Simulator,name=iPhone 17 Pro'
```

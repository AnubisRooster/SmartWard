<img src="docs/images/app-icon.png" alt="SmartWard icon" width="96" height="96">

# SmartWard

A local-first iPhone research strategist. SmartWard reads the AI and software-development world for you, keeps an on-device knowledge graph that links what you read with what you've discussed, and brainstorms your projects with the LLMs you bring your own keys for.

- **Plan & design:** [docs/PLAN.md](docs/PLAN.md) covers requirements, the architecture and the data model.
- **Shared components:** [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), including BYOK LLM access, retrieval, the graph, and app lock.

## Screenshots

_Coming with the first on-device pass (see [docs/DEVICE_TESTING.md](docs/DEVICE_TESTING.md)) — CI only runs on the Simulator, so there are no real screens to show yet. Once captured, they'll go in `docs/images/` and get linked here._

## Features

### Sources and reading

RSS/Atom feeds (with feed discovery from a blog's home page), arXiv categories or searches, Hugging Face daily papers, Hacker News searches, GitHub releases, and watched web pages. Every request is rate-limited per host, backs off on 429/503, uses conditional GET, and checks robots.txt for web pages. Articles are deduped across sources and cleaned of hidden text. The Reading tab has a reader view, sorts newest by actual publish date so several blogs interleave correctly, and dependency-radar suggestions can be followed with one tap. "Add to SmartWard" works from any app's share sheet, optionally tagged to a project. Hourly background polling and backlog processing while charging keep the library current; a manual Refresh keeps going with system progress after you leave the app.

New items go through a resumable stage machine that triages them on-device against your interests, projects, dependencies and reading history (Apple Foundation Models decides borderline items), fetches full text for relevant teasers, then chunks and embeds them on-device. Off-topic items stay searchable but are hidden from Unread.

### Search

Keyword (BM25, with compound tokens like "SWE-bench" kept whole) and semantic search fused per article, on-device, from the Reading tab's search field. Off-topic items are included. Semantic search is one matrix-vector product over unit-length vectors, and BM25 keeps a running document-length total rather than re-summing it; both keep their top results in a bounded heap instead of sorting every candidate. The index updates in place as articles are added or removed, rebuilding from scratch only when too much has changed at once.

### Knowledge graph

Entities and relations are extracted from articles (on-device with Apple Intelligence), and from conversation turns and public repo docs (your provider, unless the content is private or the chat is off the record, in which case it stays on-device). Names resolve to one node through aliases and embedding similarity, with uncertain merges queued for review. Mentions and edges cite the chunk they came from, and the reader shows each article's themes.

The Graph tab shows the strongest themes by scope — all, the last two weeks, a project, or a source — with dormant themes hidden unless you ask; it switches to a list automatically with VoiceOver. Theme detail shows strength, names, connections and where each theme came up, with rename, merge and split (your corrections always win). Theme strengths are cached between visits and rescaled for decay rather than recomputed.

GraphRAG gives each chat turn passages from your library, found by words, by meaning, or by one hop through the graph, fenced as untrusted and cited as [R1]. The strategist can also search the library, explore a theme's connections, and open an item; each reply lists its sources and why each was retrieved.

### Strategist chat and projects

Streaming BYOK chat with four modes — brainstorm, critique, research plan, and weekly review — scoped to a project, where the strategist can read project state and record decisions and open questions. Onboarding runs the same chat as a guided interview: a key and Apple Intelligence preflight, pasted links, and a structured setup proposal you edit before anything is created.

The strategist can propose a revised project brief mid-chat, and "Suggest an update" drafts one from what's been decided since the last revision. Each suggestion is a line diff you accept or reject, your own edits apply at once, and every accepted change is kept in a history you can restore from. Open decisions, questions and action items are listed on the project, and you can swipe to close them.

A project can link to plain URLs and GitHub repos (each editable after the fact — tap a link to fix a typo or repoint it), pulled in through one-tap GitHub device-flow sign-in or a token as the advanced option. Repo links sync their docs and manifests read-only, and their dependencies feed the dependency radar.

### Actions and approval

The strategist can read a public web page (`fetch_url`) or follow a new source (`add_source`), but each one pauses on a card showing exactly what it will do, and runs only if you tap Approve. Each mode gets its own tools: critique can read pages but not add sources, weekly review sticks to your library and projects, and onboarding uses none. Settings → "Approve fetches and new sources automatically" lets those two tools run without a card every time, still logged as auto-approved — saving a decision or open item to a project always asks regardless, since that changes what a project remembers rather than just what gets read. A page the strategist reads with your approval is saved as a real article too, under its own "Read in chat" source, so it's chunked, embedded and linked into the graph like anything else you read, not just used for that one reply.

Untrusted text (article content, titles, theme names, fetched pages) only ever reaches a prompt inside a fence it can't close. A red-team suite of poisoned articles checks this against a model that obeys every injected instruction: direct orders, fence breaks in any case or spacing, fake system turns, exfiltration through URLs, requests to cloud metadata and local hosts, credentials in URLs, planted decisions, brief rewrites, guessed private document ids, poisoned titles and theme names, and floods of tool calls. None of them adds, fetches or records anything without your approval, changes the brief, or gets private content to the provider.

### Cost controls

Settings → Usage & budget shows what your provider cost today and over 7 or 30 days, by feature and by model. When a provider doesn't report cost, it's estimated from OpenRouter catalog prices, or high on purpose for unknown models. A daily budget ($1 by default) switches background work to on-device once it's spent. When a model is rate-limited or down, requests retry on your fallback models, then on OpenRouter catalog models that support the same features and cost no more.

### Daily digest

The Today tab gathers articles linked since the last digest into theme clusters. Themes that show up in most new articles don't glue everything together. Clusters are ranked by how much they touch your active projects, how new their themes are, and how many articles they cover. The top three are summarized by your provider while the budget allows and without private content; the rest on-device. An optional notification says when a digest is ready.

### Privacy and security

Private-repo content and off-the-record chats never leave the device, whichever provider you've pointed the strategist at, and SmartWard never writes back to GitHub — repo links are read-only. App lock covers the whole app with Face ID/Touch ID and a PIN fallback, locking on launch and after a background grace period, with a privacy cover in the app switcher.

### Export and backup

Settings → Export shares your library as versioned JSON (every table, relationships as ids, deterministic), the knowledge graph as GraphML (through OnDeviceKit's GraphKit) for Gephi or yEd, and projects as Markdown (goal, brief, decisions, open questions, action items and the brief's history). Private-repo content, links to private repos and themes found only there are left out unless you include them.

Settings → Backup & restore writes the whole library, including private-repo content and embeddings, as one file. It's compressed and encrypted with AES-GCM, using a key derived from your passphrase with PBKDF2-SHA256 (600,000 rounds). Restoring erases the library and recreates every row, field and relationship exactly. A wrong passphrase or a damaged file never restores anything. API keys, your GitHub sign-in and settings stay out of the file.

### Siri and Shortcuts

"Ask SmartWard" answers from your library and saves the chat. Actions that would need your approval are declined, and with the app lock on, Siri says where the answer is instead of reading it out. "Open my SmartWard digest" opens Today, and "Add a source to SmartWard" follows a feed, arXiv search, Hacker News search, GitHub releases or a web page, validated like the strategist's `add_source`.

### Accessibility

The graph can be shown as a list, and switches to it automatically with VoiceOver. An empty scope explains itself and offers to show every theme. Chat messages are announced by speaker; a new chat says what its mode is for, and warns before you type if the provider has no key. The reading list announces unread and starred items, and strategy items announce their kind. The budget bar reads as an amount of the cap, the lock screen icons scale with text size, and the reader explains when only a headline was saved.

### Performance

GraphRAG, `graph_neighbors` and the graph view fetch only the themes and edges they need, through stored theme keys, instead of the whole graph. Building the search index fetches chunks with their articles in one go. A 100,000-chunk search test and a 3,000-theme, 30,000-edge graph test print their timings to CI.

A developer screen (Settings → Developer, Debug builds or a Release build with a launch flag) can load a marked, removable 100,000-chunk sample library and run a GraphRAG latency check against a 500 ms target, with timings visible as signposts in Instruments — see [docs/DEVICE_TESTING.md](docs/DEVICE_TESTING.md).

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

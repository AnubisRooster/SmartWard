# SmartWard

A local-first iPhone research strategist. SmartWard reads the AI and software-development world for you, keeps an on-device knowledge graph that links what you read with what you've discussed, and brainstorms your projects with the LLMs you bring your own keys for.

- **Plan & design:** [docs/PLAN.md](docs/PLAN.md) covers requirements, the HLD, the data model, and phased delivery.
- **Shared components:** [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), including BYOK LLM access, retrieval, the graph, and app lock.

## Status

Phase 1 foundation, done:

- [x] `SmartWardKit/KnowledgeStore`: the full SwiftData model (CloudKit-compatible), the private-content policy, and derived theme strength
- [x] App shell: tabs, SwiftData-backed Projects with repo/URL links, and BYOK key settings
- [x] Strategist chat: streaming BYOK chat with four modes, scoped to a project, where the strategist can read project state and record decisions and open questions
- [x] Onboarding interview: key and Apple Intelligence preflight, a strategist-led interview with pasted links, and a structured setup proposal you edit before anything is created
- [x] GitHub sign-in and repo sync: one-tap device flow (with a token as the advanced option), a repo picker, and read-only sync of docs and manifests; private repos stay on-device, and dependencies feed the dependency radar
- [x] App lock: Face ID/Touch ID with a PIN fallback, a lock on launch and after a background grace period, and a privacy cover in the app switcher

Phase 2 ingestion and search, in progress:

- [x] Sources and reading: RSS/Atom feeds (with feed discovery from a blog's home page), arXiv categories or searches, Hugging Face daily papers, Hacker News searches, GitHub releases, and watched web pages. Every request is rate-limited per host, backs off on 429/503, uses conditional GET, and checks robots.txt for web pages. Articles are deduped across sources and cleaned of hidden text. The Reading tab has a reader view, and dependency-radar suggestions can be followed with one tap
- [ ] Ingestion pipeline: full-text fetching, chunking and on-device embedding, and triage against your interests and projects
- [ ] Hybrid search (keyword and semantic)
- [ ] Background refresh and the share extension

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

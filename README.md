# SmartWard

A local-first iPhone research strategist. SmartWard reads the AI and software-development world for you, keeps an on-device knowledge graph that links what you read with what you've discussed, and brainstorms your projects with the LLMs you bring your own keys for.

- **Plan & design:** [docs/PLAN.md](docs/PLAN.md) covers requirements, the HLD, the data model, and phased delivery.
- **Shared components:** [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), including BYOK LLM access, retrieval, the graph, and app lock.

## Status

Phase 1 foundation, in progress:

- [x] `SmartWardKit/KnowledgeStore`: the full SwiftData model (CloudKit-compatible), the private-content policy, and derived theme strength
- [x] App shell: tabs, SwiftData-backed Projects with repo/URL links, and BYOK key settings
- [ ] Strategist chat. This needs the tool-calling and streaming API from [OnDeviceKit#6](https://github.com/AnubisRooster/OnDeviceKit/pull/6)
- [ ] Onboarding interview, and app lock

## Requirements

- Xcode 26+ and iOS 26+, on an iPhone 15 Pro or newer (Apple Intelligence-capable)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen)

## Build

```sh
brew install xcodegen
xcodegen generate          # SmartWard.xcodeproj is generated, not committed
open SmartWard.xcodeproj
```

Package tests run without the app:

```sh
cd Packages/SmartWardKit && swift test
```

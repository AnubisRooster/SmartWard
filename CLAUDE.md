# SmartWard

Local-first iOS research strategist. The source of truth for requirements, design and phasing is `docs/PLAN.md`. Its decision IDs (D1–D6) are referenced in code.

## Layout

- `SmartWard/`: the iOS app (SwiftUI). The Xcode project is generated from `project.yml` by XcodeGen and is not committed.
- `Packages/SmartWardKit/`: local SPM package. Keep logic here, not in views, so `swift test` covers it without a simulator.
  - `KnowledgeStore`: the SwiftData models, `KnowledgeSchema`, `ContextPolicy` and `ThemeStrength`.
  - `IngestKit`: the GET-only `GitHubClient`, `GitHubDeviceFlow`, `GitHubTokenStore` (device-only Keychain), `ManifestParser`, and `RepoSync` (repo docs → articles, dependency radar).
  - `StrategistCore`: the tool-calling loop (`StrategistRunner`), mode prompts, history budgeting, and project tools. It depends on OnDeviceKit's `BYOKLLMKit`.
- Shared, domain-agnostic code belongs in [OnDeviceKit](https://github.com/AnubisRooster/OnDeviceKit), not here.

## Invariants — do not break

- **Private content never goes to a BYOK provider (D5).** Anything that assembles provider context or runs BYOK extraction must filter through `ContextPolicy`. Private-repo articles and chunks carry `localOnly = true`, and there is no user override.
- **The schema stays CloudKit-compatible** (PLAN §4). No `@Attribute(.unique)`. Every stored property has a default or is optional. Every relationship is optional, with its inverse declared on exactly one side. Every new `@Model` must be added to `KnowledgeSchema.models`.
- **Graph strength and weight are derived**, not stored counters: `Mention` and `ThemeEdge` rows are append-only, and `ThemeStrength` computes strength from them.
- API keys and tokens live only in the Keychain, never in `UserDefaults`, SwiftData or backups.
- SmartWard never writes to GitHub. `GitHubClient` issues GET requests only; the two device-flow auth calls to github.com are the only exceptions. Only docs and manifests are synced, never source code. A private repo's articles are always `localOnly`.
- Every strategist turn must end: the runner's last round forces `toolChoice = .none`, and tool failures go back to the model as error results instead of aborting the turn.
- Enum-backed model fields store a raw `String` with a literal default and expose a typed computed property that falls back on unknown values.

## Checks

- Package tests run on the iOS Simulator, because OnDeviceKit declares iOS only: `cd Packages/SmartWardKit && xcodebuild test -scheme SmartWardKit-Package -destination 'platform=iOS Simulator,OS=<latest>,name=<iPhone NN Pro>'`
- `xcodegen generate && xcodebuild build -project SmartWard.xcodeproj -scheme SmartWard -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO`
- CI (`.github/workflows/ci.yml`) runs both on `macos-latest` with the latest stable Xcode.

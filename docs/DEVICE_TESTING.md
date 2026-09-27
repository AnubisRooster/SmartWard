# Device testing

CI builds the app and runs the package tests on the iOS Simulator. This page covers what only a real iPhone can confirm.

## One-time setup

1. **Signing.** Set `DEVELOPMENT_TEAM` in `project.yml` to your team ID, then run `xcodegen generate`.
2. **App Group.** Register `group.com.intelligentdesignsllc.smartward` in your developer account and turn it on for both the app and the share extension. Without it, shared items never reach the app.
3. **GitHub sign-in.** Create a GitHub OAuth App with device flow enabled. Put its client ID in `GitHubConfig.oauthClientID` (`SmartWard/GitHub/GitHubAccount.swift`). While it's empty, only the token path shows.
4. **Device.** You need an iPhone 15 Pro or newer on iOS 26, with Apple Intelligence on. Add an OpenRouter key during onboarding.

### Signing without a paid team (App Group unavailable)

App Groups is a paid-only capability, so a free Personal Team cannot grant
`group.com.intelligentdesignsllc.smartward` and step 2 is not available. The app
still builds and runs; the share extension stays in the share sheet with its
Save button disabled, because `SharedInbox.appGroup()` returns `nil` when the
container is missing. Everything else is unaffected — the SwiftData store lives
in the app's own container.

To build that way without editing the tracked spec, keep the signing settings in
a local overlay and generate from it:

```sh
xcodegen generate --spec project.device.yml
xcodebuild -project SmartWard.xcodeproj -scheme SmartWard \
  -destination 'id=<device-udid>' -allowProvisioningUpdates build
```

`project.device.yml` sets `DEVELOPMENT_TEAM` and points both targets at
app-group-free entitlement copies. It is excluded from git via
`.git/info/exclude`, so `project.yml` stays identical to upstream and future
pulls merge cleanly. Free provisioning profiles expire after 7 days, so
re-run the build and reinstall when that happens.


## Phase 5 exit criteria

### GraphRAG latency (NFR-4: under 500 ms at 100k chunks)

Use a Release build. Debug builds are several times slower.

1. In Xcode, open **Product → Scheme → Edit Scheme → Run**. Set **Build Configuration** to **Release**, and under **Arguments** add `-SmartWardDeveloper YES`. Debug builds show the Developer screen without this.
2. Run on the device, then go to **Today → gear → Developer → Load sample library**. This adds 100,000 chunks, 3,000 themes and 30,000 connections. It takes a few minutes and about 250 MB.
3. Tap **Run latency check**. It asks 20 questions the way chat does (embedding plus GraphRAG) and reports the p50 and p95. **Pass: p95 under 500 ms.** The first call may build the search index; its time is shown separately.
4. For a trace, profile with **Instruments → Points of Interest**. Every `GraphRAG`, `Search`, `Graph snapshot` and `Search index` interval is a signpost.
5. When you're done, tap **Remove sample library**. Only the sample data is deleted.

### Wipe → restore

1. Settings → Backup & restore → **Create backup**, and save it to Files.
2. Delete the app, reinstall it, finish onboarding without creating projects, and restore.
3. Check that projects, briefs, decisions, chats, sources, the graph and the article counts all match what you had. Restoring only works into an empty library, so reinstalling is the real test.

## What the simulator can't show

- **Apple Intelligence:**
  - Borderline items are triaged on-device.
  - Articles show themes in the reader (on-device extraction).
  - Digest entries say "Summarized on-device".
  - With Apple Intelligence off, background work falls back to your provider or waits.
- **Background work:**
  - Tap Refresh, then leave the app: the system progress indicator should continue.
  - Overnight while charging, processing runs and the digest notification arrives.
  - To trigger it now, pause in the debugger and run:
    `e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"com.intelligentdesignsllc.smartward.processing"]`
- **Share extension:** Safari → Share → Add to SmartWard (optionally choose a project). The item appears in Reading.
- **App lock:**
  - Face ID, then the PIN fallback.
  - Locking again after the grace period.
  - The app switcher shows the privacy cover.
- **Siri and Shortcuts:**
  - "Ask SmartWard" speaks the answer with the lock off. With the lock on, it says where the answer is instead.
  - "Open my SmartWard digest" opens Today.
  - "Add a source to SmartWard" follows a feed and refuses a local address such as `192.168.1.1`.

## Accessibility

- **VoiceOver:**
  - The Graph tab switches to the list.
  - Chat messages are announced as "You" or "SmartWard".
  - Reading rows say "Unread" or "Starred".
  - Approval cards are reachable, with Approve and Decline.
- **Largest text sizes** (Settings → Accessibility → Larger Text): nothing clipped on Today, chat, Usage & budget, or the lock screen.

## A real-use pass

1. Onboarding takes under 5 minutes (the Phase 1 exit criterion).
2. Add a source and chat. Approve one action and decline one.
3. Ask for a brief suggestion and accept it.
4. Set the daily budget to $0.25, then chat until it's spent. Background extraction should stay on-device until midnight.
5. Export JSON, GraphML and Markdown, and open each file from Files.
# hooks verification 1790550941

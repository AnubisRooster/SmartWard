# GitNexus local hooks

Activates a background knowledge-graph refresh on every `git commit` and
`git pull`/`merge`.

One-time activation per clone:

```sh
git config core.hooksPath githooks
```

Requires the GitNexus CLI (`npm install -g gitnexus`). If the CLI is absent the
hooks silently no-op, so cloning on a machine without GitNexus never breaks.
Re-index runs are logged to `.gitnexus/hook.log`.

To refresh by hand instead:

```sh
gitnexus analyze .
```

`--skip-agents-md --skip-skills` in the hooks keeps `AGENTS.md` and
`.claude/skills/` out of the index, so a tooling upgrade does not show up as a
code change. The one-time full index in this repo *did* write them, which is
why `AGENTS.md` and `.claude/skills/gitnexus-*` are committed.

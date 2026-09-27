# Git hooks: GitNexus + Graphify

Local hooks that keep the two knowledge graphs in step with the code. Inert
until activated once per clone:

```sh
git config core.hooksPath githooks
```

Both tools are optional: every hook no-ops when its CLI is absent, so a clone
on a machine without them still commits and merges normally.

## What runs where

| Hook | Tool | Why there |
| --- | --- | --- |
| `pre-commit` | graphify | `docs/graphify/` is tracked, so the graph has to be rebuilt *before* the commit. Rebuilding afterwards would leave the tree dirty and the graph would only land in some later unrelated commit. |
| `post-commit` | GitNexus | The index is not a tracked artifact, so it can be refreshed after the fact without dirtying anything. |
| `post-merge` | GitNexus, then graphify | A pull or merge can introduce code the index has never seen. |

## Why not background the GitNexus re-index

An earlier version backgrounded it and returned immediately, so a query issued
right after the commit could read a stale graph. The incremental pass takes
about ten seconds and now runs in the foreground, which means the index is
correct when the commit finishes.

## Merge leaves the graph dirty, on purpose

A merge is already committed by the time `post-merge` runs, so refreshed
`docs/graphify/` files cannot be folded back into it. The hook says so instead
of leaving you to wonder. Commit them in a follow-up; `pre-commit` will keep
them consistent from then on.

## Cost

Graphify is roughly two seconds warm, GitNexus roughly ten. Both log to
`.gitnexus/hook.log` and echo a one-line summary so you can see they ran.

## Refreshing by hand

```sh
gitnexus analyze .
scripts/graphify_refresh.sh
```

`--skip-agents-md --skip-skills` in the hooks keeps `AGENTS.md` and
`.claude/skills/` out of the index, so a tooling upgrade does not register as a
code change. The one-time full index *did* write them, which is why `AGENTS.md`
and `.claude/skills/gitnexus-*` are committed.

`scripts/graphify_refresh.sh` is shared with
`.github/workflows/graphify.yml` on purpose. When CI and the hooks each carried
their own copy of the rebuild-and-copy-back steps they drifted, and the graph
churned on every push for no reason.

#!/bin/sh
# Rebuild the knowledge graph and refresh the committed artifacts in
# docs/graphify/.
#
# Shared by the git hooks and by .github/workflows/graphify.yml so a local
# commit and a CI run produce byte-identical output. Keep the single copy of
# the copy-back step here: when CI and the hooks each had their own version
# they drifted, and the graph silently churned on every push.
#
# Runs in about two seconds on a warm AST cache. The cache lives in
# graphify-out/cache and is deliberately not cleared: a cold pass over the
# Swift sources is far slower and produces the same graph.
set -eu

cd "$(git rev-parse --show-toplevel)"

# Resolve the interpreter that actually has graphifyy installed. The graphify
# launcher is a console script whose shebang names the right virtualenv, which
# is more reliable than guessing at a path under ~/.local.
find_python() {
    if command -v graphify >/dev/null 2>&1; then
        _shebang=$(head -1 "$(command -v graphify)" | sed 's/^#!//' | awk '{print $1}')
        if [ -x "$_shebang" ]; then
            printf '%s\n' "$_shebang"
            return 0
        fi
    fi
    if command -v python3 >/dev/null 2>&1; then
        printf '%s\n' "$(command -v python3)"
        return 0
    fi
    return 1
}

PY=$(find_python) || {
    echo "graphify: no python3 found, skipping graph refresh" >&2
    exit 0
}

"$PY" scripts/graphify_pipeline.py

# The HTML view is a separate export step from the pipeline.
if command -v graphify >/dev/null 2>&1; then
    graphify export html
elif [ -x "$HOME/.local/bin/graphify" ]; then
    "$HOME/.local/bin/graphify" export html
else
    echo "graphify: launcher not found, keeping the previous graph.html" >&2
fi

mkdir -p docs/graphify
cp graphify-out/GRAPH_REPORT.md docs/graphify/GRAPH_REPORT.md
cp graphify-out/graph.json docs/graphify/graph.json
if [ -f graphify-out/graph.html ]; then
    cp graphify-out/graph.html docs/graphify/graph.html
fi

echo "graphify: refreshed docs/graphify/"

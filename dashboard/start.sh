#!/usr/bin/env bash
#
# Start the course dashboard.
#
#     ./start.sh
#
# Uses an isolated virtualenv at ~/.venvs/cse589-dashboard so the system
# Python is never touched. The venv lives outside Dropbox on purpose --
# thousands of tiny files would otherwise be synced forever.

set -euo pipefail

DASHBOARD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV="$HOME/.venvs/cse589-dashboard"
PY="$VENV/bin/python"
PORT=8080
URL="http://localhost:$PORT"

cd "$DASHBOARD_DIR"

# --- Make sure the virtualenv exists ----------------------------------------
if [ ! -x "$PY" ]; then
    echo "→ First run: creating virtualenv at $VENV"
    BASE_PYTHON="$(command -v python3 || true)"
    if [ -z "$BASE_PYTHON" ]; then
        echo "✗ python3 not found. Install it with:  brew install python" >&2
        exit 1
    fi
    mkdir -p "$(dirname "$VENV")"
    "$BASE_PYTHON" -m venv "$VENV"
    "$PY" -m pip install --upgrade pip --quiet
fi

# --- Make sure dependencies are installed -----------------------------------
if ! "$PY" -c "import flask, yaml" >/dev/null 2>&1; then
    echo "→ Installing dependencies..."
    "$PY" -m pip install -r requirements.txt --quiet
fi

# --- Refuse to double-start --------------------------------------------------
if lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
    echo "⚠️  Port $PORT is already in use -- the dashboard may already be running." >&2
    echo "   Check with:  lsof -nP -iTCP:$PORT -sTCP:LISTEN" >&2
    echo "   Stop it with: kill <PID>" >&2
    exit 1
fi

# --- Warn about uncommitted changes ------------------------------------------
# The dashboard rewrites _data/*.yml and _config.yml in place, so a clean tree
# means a bad edit can be undone with `git checkout`.
if git -C "$DASHBOARD_DIR" rev-parse --git-dir >/dev/null 2>&1 \
   && ! git -C "$DASHBOARD_DIR" diff --quiet 2>/dev/null; then
    echo "⚠️  You have uncommitted git changes. The dashboard edits YAML files"
    echo "   directly -- committing first makes mistakes easy to roll back."
    echo ""
fi

echo "🚀 Starting dashboard on $URL  (password: admin123)"
echo "   Ctrl+C to stop."
echo ""

exec "$PY" run.py

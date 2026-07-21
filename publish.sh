#!/usr/bin/env bash
# Rebuild the Next.js site and (re)start the production server on port 3000.
# Frees port 3000 across user boundaries before starting, so it's safe to
# re-run no matter who started the current server.
set -euo pipefail
cd "$(dirname "$0")"

# Group-writable so any team member can publish over another member's build.
umask 002
mkdir -p .run

# Install deps (no-op once node_modules is current)
npm install --legacy-peer-deps --silent

# Build the Next.js production bundle
npm run build

# Free port 3000 regardless of which user owns the current listener.
sudo sh -c 'for _ in $(seq 1 25); do
  pids=$(lsof -t -iTCP:3000 -sTCP:LISTEN 2>/dev/null || true);
  if [ -z "$pids" ]; then exit 0; fi;
  kill $pids 2>/dev/null || true; sleep 0.2;
done'

# Start the production server in a new session so it survives shell exit.
setsid nohup npm run start > .run/server.log 2>&1 < /dev/null &

# Wait for the new server to actually answer before reporting success.
for _ in $(seq 1 50); do
  if curl -sf -o /dev/null http://localhost:3000; then
    echo "site published; serving on port 3000"
    exit 0
  fi
  sleep 0.2
done
echo "warning: published, but the server isn't responding — check .run/server.log" >&2
exit 1

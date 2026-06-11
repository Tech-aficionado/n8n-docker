#!/bin/sh
set -e

# Render injects the PORT env var. n8n listens on N8N_PORT.
export N8N_PORT="${PORT:-5678}"

echo "Starting n8n on port ${N8N_PORT}"
exec n8n start

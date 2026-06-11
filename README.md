# n8n on Render (Docker)

Deploy [n8n](https://n8n.io/) — a fair-code workflow automation tool — to [Render](https://render.com/) using Docker with persistent storage.

## Quick Deploy

1. Push this repo to GitHub/GitLab.
2. Go to [Render Dashboard](https://dashboard.render.com/) → **New** → **Blueprint**.
3. Connect your repository and select the branch.
4. Render will read `render.yaml` and configure everything automatically.
5. Set the required environment variables (marked `sync: false` in the blueprint):
   - `N8N_HOST` — your Render service URL (e.g., `n8n-xxxx.onrender.com`)
   - `WEBHOOK_URL` — full URL with protocol (e.g., `https://n8n-xxxx.onrender.com/`)
   - `N8N_BASIC_AUTH_USER` — admin username
   - `N8N_BASIC_AUTH_PASSWORD` — admin password

## What's Included

| File | Purpose |
|------|---------|
| `Dockerfile` | Builds the n8n container from the official image |
| `render.yaml` | Render Blueprint for one-click infrastructure setup |
| `.dockerignore` | Keeps the build context small |

## Persistent Storage

A 1 GB Render Disk is mounted at `/home/node/.n8n` to persist workflows, credentials, and execution history across deploys and restarts. Increase the size in `render.yaml` if needed.

## Environment Variables

| Variable | Description |
|----------|-------------|
| `N8N_HOST` | Your Render service hostname |
| `N8N_PROTOCOL` | `https` (default) |
| `WEBHOOK_URL` | Full webhook base URL |
| `N8N_ENCRYPTION_KEY` | Auto-generated; encrypts credentials at rest |
| `N8N_BASIC_AUTH_ACTIVE` | Enables basic auth (`true`) |
| `N8N_BASIC_AUTH_USER` | Admin username |
| `N8N_BASIC_AUTH_PASSWORD` | Admin password |
| `GENERIC_TIMEZONE` | Timezone for cron triggers (default: `UTC`) |

## Notes

- The **Starter** plan is fine for testing. For production workloads with many workflows, upgrade to **Standard** or above.
- n8n uses SQLite by default. For high-availability setups, consider adding a PostgreSQL database and setting `DB_TYPE=postgresdb` with the connection variables.
- Render's free tier spins down after inactivity; webhooks won't fire while the service is sleeping. Use a paid plan for reliable webhook reception.

## License

MIT

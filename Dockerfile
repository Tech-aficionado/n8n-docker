FROM n8nio/n8n:latest

# Render assigns PORT dynamically
ENV N8N_PORT=${PORT:-5678}
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_DIAGNOSTICS_ENABLED=false

# Data directory for SQLite (use Render Disk for persistence)
ENV N8N_USER_FOLDER=/home/node/.n8n

# Expose the port
EXPOSE ${N8N_PORT}

# Start n8n
CMD ["n8n", "start"]

FROM n8nio/n8n:latest

ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_USER_FOLDER=/home/node/.n8n

# Render requires the app to listen on the PORT env var it provides.
# n8n reads N8N_PORT at runtime, so we wire them together in the entrypoint.
EXPOSE 5678

# Use shell form so ENV variables expand at runtime
CMD /bin/sh -c "export N8N_PORT=\${PORT:-5678} && n8n start"

FROM n8nio/n8n:latest

ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_USER_FOLDER=/home/node/.n8n

# Copy our entrypoint that wires Render's $PORT to n8n's N8N_PORT
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Switch to root to set permissions, then back to node
USER root
RUN chmod +x /docker-entrypoint.sh
USER node

EXPOSE 5678

# Reset the inherited ENTRYPOINT so our script runs directly
ENTRYPOINT []
CMD ["/bin/sh", "/docker-entrypoint.sh"]

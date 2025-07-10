FROM n8nio/n8n

# Switch to root to install dependencies
USER root

# Install Python and Node dependencies
RUN apk update && \
    apk add --no-cache python3 py3-pip && \
    pip3 install --break-system-packages --no-cache-dir -r /data/requirements.txt && \
    cd /data && npm install

# Copy your files
COPY requirements.txt /data/requirements.txt
COPY package.json /data/package.json

# Set environment variables
ENV N8N_HOST=0.0.0.0 \
    N8N_PORT=8080 \
    N8N_PROTOCOL=http \
    GENERIC_TIMEZONE=Asia/Kolkata \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=forsys@123

# Revert back to safe user
USER node

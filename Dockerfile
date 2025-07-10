FROM n8nio/n8n

# Install Python and Node dependencies (Alpine-based)
RUN apk update && \
    apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir -r /data/requirements.txt && \
    cd /data && npm install

# Set environment variables
ENV N8N_HOST=0.0.0.0 \
    N8N_PORT=8080 \
    N8N_PROTOCOL=http \
    GENERIC_TIMEZONE=Asia/Kolkata \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=forsys@123

# Copy requirements and package.json
COPY requirements.txt /data/requirements.txt
COPY package.json /data/package.json

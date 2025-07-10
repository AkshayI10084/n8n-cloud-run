FROM n8nio/n8n

# Install Python and Node dependencies
RUN apt update && \
    apt install -y python3 python3-pip && \
    pip3 install -r /data/requirements.txt && \
    cd /data && npm install

# Set required environment variables
ENV N8N_HOST=0.0.0.0 \
    N8N_PORT=8080 \
    N8N_PROTOCOL=http \
    GENERIC_TIMEZONE=Asia/Kolkata \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=forsys@123

# Set working directory for npm/pip dependencies
COPY requirements.txt /data/requirements.txt
COPY package.json /data/package.json

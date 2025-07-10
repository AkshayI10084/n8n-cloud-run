FROM n8nio/n8n

# Switch to root to install dependencies
USER root

# Copy requirements and package.json first
COPY requirements.txt /data/requirements.txt
COPY package.json /data/package.json

# Set working directory
WORKDIR /data

# Install Python & Node dependencies
RUN apk update && \
    apk add --no-cache python3 py3-pip

RUN pip3 install --break-system-packages --no-cache-dir -r requirements.txt

RUN npm install

# Set environment variables
ENV N8N_HOST=0.0.0.0 \
    N8N_PORT=8080 \
    N8N_PROTOCOL=http \
    GENERIC_TIMEZONE=Asia/Kolkata \
    N8N_BASIC_AUTH_ACTIVE=true \
    N8N_BASIC_AUTH_USER=admin \
    N8N_BASIC_AUTH_PASSWORD=forsys@123

# Switch back to non-root user
USER node

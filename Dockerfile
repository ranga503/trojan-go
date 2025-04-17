FROM alpine:latest

# Install dependencies
RUN apk update && apk add --no-cache wget curl unzip

# Set working directory
WORKDIR /app

# Download and extract Trojan-Go
RUN wget -O trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip && \
    unzip trojan-go.zip && \
    mv trojan-go /usr/local/bin/trojan-go && \
    chmod +x /usr/local/bin/trojan-go && \
    rm -rf trojan-go.zip example* LICENSE README.md

# Copy configuration and cert files
COPY config.json .
COPY cert.pem .
COPY key.pem .

EXPOSE 443

# Run Trojan-Go
CMD ["trojan-go", "-config", "config.json"]

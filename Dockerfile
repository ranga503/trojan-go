FROM alpine:latest

RUN apk update && apk add --no-cache openssl trojan-go

WORKDIR /app

COPY config.json .
COPY cert.pem .
COPY key.pem .

EXPOSE 443

CMD ["trojan-go", "-config", "config.json"]

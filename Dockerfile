FROM alpine:latest

RUN apk add --no-cache curl unzip

RUN curl -L -o /trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip && \
    unzip /trojan-go.zip -d /trojan-go && \
    rm /trojan-go.zip

WORKDIR /trojan-go

COPY config.json /trojan-go/config.json

CMD ["./trojan-go", "-config", "config.json"]

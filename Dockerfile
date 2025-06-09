FROM ubuntu:24.04

RUN mkdir -p /opt/winbox/ \
    && apt-get update \
    && apt-get install -y wget wine64 \
    && rm -rf /var/lib/apt/lists/*

COPY winbox64.exe /opt/winbox/

ENTRYPOINT ["wine", "/opt/winbox/winbox64.exe"]

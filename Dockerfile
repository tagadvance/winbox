FROM debian:trixie

ARG HOST_UID
ARG HOST_GID
ARG VERSION

ENV VERSION=$VERSION

LABEL org.opencontainers.image.title="WinBox"
LABEL org.opencontainers.image.description="Unofficial WinBox"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.source="https://github.com/tagadvance/winbox"
LABEL org.opencontainers.image.vendor="https://github.com/tagadvance"
LABEL org.opencontainers.image.licenses="https://mikrotik.com/software/legal"

RUN groupadd --gid ${HOST_GID} winbox \
    && useradd --uid ${HOST_UID} --gid ${HOST_GID} --create-home winbox \
    && mkdir -p /home/winbox/downloads /opt/winbox \
    && chown winbox:winbox /opt/winbox


RUN apt update \
    && apt install -y libxcb-image0 libgl1 libegl1 libfreetype6 libfontconfig1 libxkbcommon0 \
                      libxkbcommon-x11-0 libxcb-icccm4 libxcb-keysyms1 libxcb-render-util0 \
                      libxcb-shape0 libdbus-1-3 wget unzip \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

USER winbox

COPY ./run.sh /opt/winbox/run.sh

ENTRYPOINT ["/opt/winbox/run.sh"]

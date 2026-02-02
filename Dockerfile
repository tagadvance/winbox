FROM debian:trixie

ARG HOST_UID
ARG HOST_GID
ARG VERSION

RUN groupadd --gid ${HOST_GID:-1000} nonroot \
    && useradd --uid ${HOST_UID:-1000} --gid ${HOST_GID:-1000} --create-home nonroot \
    && apt update \
    && apt install -y libxcb-image0 libgl1 libegl1 libfreetype6 libfontconfig1 libxkbcommon0 \
                      libxkbcommon-x11-0 libxcb-icccm4 libxcb-keysyms1 libxcb-render-util0 \
                      libxcb-shape0 wget unzip \
    && mkdir -p /opt/winbox/ \
    && wget -O /tmp/winbox.zip https://download.mikrotik.com/routeros/winbox/${VERSION}/WinBox_Linux.zip \
    && unzip -d /opt/winbox/ /tmp/winbox.zip \
    && rm /tmp/winbox.zip \
    && apt purge -y --auto-remove wget unzip  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER nonroot

ENTRYPOINT ["/opt/winbox/WinBox"]

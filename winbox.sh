#!/bin/bash

# curl -s https://mikrotik.com/download/winbox | grep WinBox_Linux.zip | tail -n1
version=${1:-"4.0beta47"}
here=$(dirname "$(realpath $0)")

docker buildx build --platform linux/amd64 \
             --build-arg HOST_UID=$(id -u) \
             --build-arg HOST_GID=$(id -g) \
             --build-arg VERSION=$version \
             --tag "winbox:$version" \
             --tag 'winbox:latest' \
             $here

# preserve settings between runs
mkdir -p "$HOME/.local/share/MikroTik/WinBox"

docker run --rm -it \
           --user $UID:$UID \
           --network host \
           --env DISPLAY=$DISPLAY \
           --volume $HOME/.local/share/MikroTik/WinBox:/home/nonroot/.local/share/MikroTik/WinBox \
           winbox:latest

#!/bin/bash

registry='ghcr.io/tagadvance'
image_name='winbox'

# preserve settings between runs
mkdir -p "$HOME/.local/share/MikroTik/WinBox"

docker run --rm -it \
           --user $UID:$UID \
           --network host \
           --env DISPLAY=$DISPLAY \
           --volume $HOME/.local/share/MikroTik/WinBox:/home/nonroot/.local/share/MikroTik/WinBox \
           "$registry/$image_name:latest"

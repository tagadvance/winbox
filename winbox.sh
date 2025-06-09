#!/bin/bash

export QT_GRAPHICSSYSTEM=native
export QT_X11_NO_MITSHM=1

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

HERE=$(dirname "$(realpath $0)")
$HERE/build.sh
# preserve settings between runs
mkdir -p "$HERE/.wine"

xhost +local:docker

xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm -it \
           --user $UID:$UID \
           --network host \
           --env DISPLAY=$DISPLAY \
           --env XAUTHORITY=$XAUTH \
           --volume $XSOCK:$XSOCK \
           --volume $XAUTH:$XAUTH \
           --volume $HERE/.wine:/home/ubuntu/.wine \
           winbox:latest

xhost -local:docker

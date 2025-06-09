#!/bin/bash

version=${1:-"3.42"}

# avoid redistribution by downloading on the fly
HERE=$(dirname "$(realpath $0)")
WINBOX="$HERE/winbox64.exe"
if [ ! -f $WINBOX ]; then
    wget -O $WINBOX "https://download.mikrotik.com/routeros/winbox/$version/winbox64.exe"
    chmod 0755 $WINBOX
fi

docker build --tag "winbox:$version" --tag 'winbox:latest' $HERE

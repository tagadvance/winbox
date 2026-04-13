#!/bin/bash

##
## Honor the license by having the end-user install the binary
## thus avoiding copying the software ourselves
##
## https://mikrotik.com/software/legal
##

DOWNLOADS=/home/winbox/downloads

if [ ! -f "$DOWNLOADS/winbox.zip" ]; then
  wget -O "$DOWNLOADS/winbox.zip" "https://download.mikrotik.com/routeros/winbox/${VERSION}/WinBox_Linux.zip"
fi

if [ ! -f "/opt/winbox/WinBox" ]; then
  unzip -d /opt/winbox/ $DOWNLOADS/winbox.zip
fi

/opt/winbox/WinBox

# WinBox on Linux

WinBox is one of the last hold out applications in my transition to 100% Linux. This repository was established to create a Docker image to run WinBox in a container using Wine.

## Update 2026-02-01

Switched from WinBox v3.43 to v4.0beta47. This removes the need for wine.

# Example Usage:
```
git clone git@github.com:tagadvance/winbox.git
cd winbox
echo "alias winbox=$(pwd)/winbox.sh" >> ~/.bashrc
winbox
```

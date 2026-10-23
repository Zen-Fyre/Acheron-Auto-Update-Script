#!/usr/bin/env bash

# Source - https://stackoverflow.com/a/17744637
# Posted by kenorb, modified by community. See post 'Timeline' for change history
# Retrieved 2026-10-21, License - CC BY-SA 4.0
dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd $dir

curl -o Acheron.zip -L "https://nightly.link/ouwou/acheron/workflows/build/master/acheron-appimage.zip"
7z -y x Acheron.zip

./Acheron-x86_64.AppImage &
exit

#!/usr/bin/env bash

if ! command -v wl-paste &> /dev/null; then
  echo "Erro: wl-clipboard não está instalado."
  exit 1
fi

YOUTUBE_LINK=$(cliphist list | grep -E "^[0-9]+\s+https://www\.youtube\.com/" | head -n 1 | cliphist decode)

if [ -z "$YOUTUBE_LINK" ]; then
  notify-send "Nenhum link válido na área de transferência." -n avatar-default -a youtube-mpv.sh -u low
  exit 1
else
  /usr/bin/mpv $YOUTUBE_LINK
fi

#!/usr/bin/env bash

# 1. Verifica dependências
if ! command -v cliphist &> /dev/null || ! command -v rofi &> /dev/null; then
  notify-send "Erro" "cliphist ou rofi não estão instalados."
  exit 1
fi

# 2. Obtém a lista de links (Removendo duplicatas com uniq)
LINKS=$(cliphist list | awk '$2 ~ /youtube\.com|youtu\.be/ {print $2}' | uniq)

# 3. Verifica se a lista está vazia
if [ -z "$LINKS" ]; then
  notify-send "YouTube-MPV" "Nenhum link encontrado no histórico." -u low
  exit 1
fi

# 4. Abre o Rofi para seleção
ESCOLHA=$(echo "$LINKS" | rofi -dmenu -i -config-name "youtube-selector")

# 5. Se o usuário não cancelou (Esc), executa o MPV
if [ -n "$ESCOLHA" ]; then
  notify-send "MPV" "Abrindo: $ESCOLHA" -u low
  /usr/bin/mpv "$ESCOLHA"
fi


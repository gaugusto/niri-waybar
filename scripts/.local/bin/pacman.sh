#!/usr/bin/env bash

CONFIGS=(
  "Atualizar tudo - yay"
  "Atualizar AUR - yay -Sua"
  "Estatísticas - yay -Ps"
  "Limpar cache - yay -Sc"
  "Explict Installed - pacman -Qet"
  "Clean pacman cache - sudo pacman -Scc"
  "Remove pacman orphans - sudo pacman -Rs \$(pacman -Qdtq)"
)

CHOICE=$(printf '%s\n' "${CONFIGS[@]}" | rofi -dmenu -i)

# Se o usuário cancelar, sai do script
[ -z "$CHOICE" ] && exit 1

# 1. Pega apenas o caminho (último campo)
COMMAND=$(printf '%s\n' "${CHOICE}" | awk -F ' - ' '{print $NF}')

alacritty -e bash -c "$COMMAND; echo; read -p 'Pressione Enter para sair...' -n1 -s"

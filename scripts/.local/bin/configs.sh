#!/usr/bin/env bash

EDITOR="alacritty -e nvim"

CONFIGS=(
  "Alacritty ~/.config/alacritty/."
  "Niri ~/.config/niri/."
  "Nvim  ~/.config/nvim/."
  "Rofi ~/.config/rofi/."
  "Rofi Themes ~/.local/share/rofi/."
  "Scripts ~/.local/bin/."
)

CHOICE=$(printf '%s\n' "${CONFIGS[@]}" | rofi -dmenu -i)

# Se o usuário cancelar, sai do script
[ -z "$CHOICE" ] && exit 1

# 1. Pega apenas o caminho (último campo)
RAW_PATH=$(printf '%s\n' "${CHOICE}" | awk '{print $NF}')

# 2. Troca o ~ pelo caminho real da sua home
FINAL_PATH="${RAW_PATH/#\~/$HOME}"

$EDITOR "$FINAL_PATH"

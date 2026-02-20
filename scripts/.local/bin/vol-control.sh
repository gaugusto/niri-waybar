#!/usr/bin/env bash

COMPOSER="hyprland"
ACTION=""
TARGET="output"

# Processa os argumentos
while [[ $# -gt 0 ]]; do
  case $1 in
  --composer)
    COMPOSER="$2"
    shift 2
    ;;
  raise | lower | mute-toggle)
    ACTION="$1"
    shift
    ;;
  input | output)
    TARGET="$1"
    shift
    ;;
  *)
    shift
    ;;
  esac
done

# Validação básica
if [[ -z "$ACTION" ]]; then
  echo "Uso: $0 [--composer hyprland|niri] {raise|lower|mute-toggle} [output|input]"
  exit 1
fi

# 1. Detecção Automática do Monitor Baseado no Compositor
case "$COMPOSER" in
niri)
  FOCUSED_MONITOR=$(niri msg -j outputs | jq -r '.[] | select(.focused == true) | .name' 2>/dev/null)
  ;;
hyprland | *)
  FOCUSED_MONITOR=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true) | .name' 2>/dev/null)
  ;;
esac

# Fallback caso o comando falhe
FOCUSED_MONITOR=${FOCUSED_MONITOR:-"eDP-1"}

# 2. Execução do SwayOSD
swayosd-client --monitor "$FOCUSED_MONITOR" --"${TARGET}-volume" "$ACTION"

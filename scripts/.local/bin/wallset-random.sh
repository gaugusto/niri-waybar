#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/backgrounds/"

# Get a random wallpaper that is not the current one
SELECTED_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Apply the selected wallpaper
if [ -n "$SELECTED_WALL" ]; then
  ${HOME}/.local/bin/wallset-backend.sh "$SELECTED_WALL"
fi

#!/usr/bin/env bash

primary="7aa2f7"
primaryText="1a1b26"
primaryContainer="7dcfff"
secondary="bb9af7"
surface="1a1b26"
surfaceText="c0caf5"
surfaceVariant="24283b"
surfaceVariantText="a9b1d6"
surfaceTint="7aa2f7"
background="16161e"
backgroundText="c0caf5"
outline="3b4261"
surfaceContainer="1f2335"
surfaceContainerHigh="292e42"
error="f7768e"
warning="ff9e64"
info="7dcfff"

swaylock \
  --ring-color "$outline" \
  --key-hl-color "$secondary" \
  --text-color "$surfaceText" \
  --line-color "$secondary" \
  --inside-color "$surface" \
  --separator-color "$background" \
  --ring-ver-color "$surface" \
  --inside-ver-color "$surface" \
  --ring-wrong-color "$error" \
  --inside-wrong-color "$error" \
  --ring-clear-color "$surfaceText" \
  --inside-clear-color "$surfaceText" \
  --color "$surface" -f

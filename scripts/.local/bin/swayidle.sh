#!/usr/bin/env bash

/usr/bin/swayidle -w \
    timeout 500 '~/.local/bin/swaylock.sh' \
    timeout 600 'niri msg action power-off-monitors' \
    resume 'niri msg action power-on-monitors' \
    before-sleep '~/.local/bin/swaylock.sh'

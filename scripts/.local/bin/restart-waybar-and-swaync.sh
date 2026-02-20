#!/usr/bin/env bash

pkill -SIGUSR2 waybar

swaync-client --reload-config
swaync-client --reload-css

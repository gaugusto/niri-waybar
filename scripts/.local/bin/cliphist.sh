#!/usr/bin/env bash

cliphist list | rofi -dmenu -i | cliphist decode | wl-copy


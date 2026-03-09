#!/usr/bin/env bash

cliphist list | walker -d | cliphist decode | wl-copy


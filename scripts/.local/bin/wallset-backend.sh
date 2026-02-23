#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <path_to_image>"
  exit 1
fi

IMAGE="$1"

swww img "$IMAGE" --transition-type="center" --transition-step=1 --transition-fps="60"

#matugen image "$IMAGE"

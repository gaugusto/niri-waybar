#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <email>"
  exit 1
fi

ssh-keygen -t ed25519 -C "$1" 

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub

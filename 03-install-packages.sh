#!/bin/bash

# Aborta o script em caso de erro
set -e

PACKAGES=(
  adw-gtk-theme
  amd-ucode
  archlinux-wallpaper
  base
  bluez-hid2hci
  bluez-utils
  bob
  calc
  cantarell-fonts
  catppuccin-cursors-mocha
  cava
  chromium
  clang
  cliphist
  edk2-shell
  efibootmgr
  eza
  fd
  figlet
  firefox
  flatpak
  fzf
  gamemode
  gamescope
  gnome-calculator
  go
  helvum
  htop
  hunspell-pt-br
  i2c-tools
  jq
  labwc
  lazygit
  libva-nvidia-driver
  libva-utils
  linux-zen
  loupe
  lua-jsregexp
  luarocks
  matugen
  mesa-utils
  mpv
  mupdf
  networkmanager-dmenu
  nim
  nvidia-open-dkms
  nvtop
  nwg-look
  papers
  paru
  pass
  pavucontrol
  plymouth
  pnpm
  polkit-gnome
  power-profiles-daemon
  proton-ge-custom-bin
  python-pynvim
  ripgrep
  rofi
  rustup
  sbctl
  spotify-launcher
  stow
  swayidle
  swaync
  swayosd
  swww
  system-config-printer
  timeshift
  ttf-jetbrains-mono-nerd
  ufw
  vdpauinfo
  vscodium-bin
  vulkan-headers
  vulkan-tools
  wget
  wlsunset
  wtype
  yay
  yay-debug
  zram-generator
)

sudo pacman -Syy

for package in "${PACKAGES[@]}"; do
  yay -S --noconfirm --needed "$package"
done

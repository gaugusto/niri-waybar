#!/usr/bin/env bash

# Define as opções (Texto exibido no menu)
lock=" Lock"
logout=" Log Out"
reboot=" Restart"
shutdown=" Power Off"
suspend=" Suspend"
hibernate="󰒄 Hibernate"

# Concatena as opções separadas por nova linha
options="$lock\n$logout\n$reboot\n$shutdown\n$suspend\n$hibernate"

# Exibe o menu usando Rofi e captura a escolha do usuário
#chosen="$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -lines 6)"
chosen="$(echo -e "$options" | rofi -dmenu)"

# Executa a ação baseada na escolha
case $chosen in
$lock)
  hyprlock
  ;;
$logout)
  systemctl --user exit
  ;;
$suspend)
  systemctl suspend
  ;;
$hibernate)
  systemctl hibernate
  ;;
$reboot)
  systemctl reboot
  ;;
$shutdown)
  systemctl -i poweroff
  ;;
esac

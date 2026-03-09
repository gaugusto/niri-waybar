#!/usr/bin/env bash

# 1. Obtém os dados via pactl e formata para o Rofi (Descrição | Nome Técnico)
# Usamos o "|" como separador para facilitar o 'cut' depois
#escolha=$(pactl --format=json list sinks | jq -r '.[] | "\(.description) | \(.name)"' | rofi -dmenu -p "Saída de Áudio:" -i)
escolha=$(pactl --format=json list sinks | jq -r '.[] | "\(.description) | \(.name)"' | walker -d)

# 2. Se o usuário cancelar (ESC), encerra o script
if [ -z "$escolha" ]; then
  exit 1
fi

# 3. Extrai apenas o nome técnico (o que vem depois do "|")
sink_nome=$(echo "$escolha" | awk -F " | " '{print $NF}')

# 4. Define o dispositivo escolhido como padrão (Default)
pactl set-default-sink "$sink_nome"

# 5. (Opcional) Move todos os streams de áudio ativos para a nova saída
# Isso garante que a música que já está tocando mude de dispositivo na hora
inputs=$(pactl list sink-inputs short | cut -f1)
for i in $inputs; do
  pactl move-sink-input "$i" "$sink_nome"
done

# Notificação visual
notify-send "Áudio" "Saída alterada para: $sink_nome" --icon=audio-speakers -n avatar-default

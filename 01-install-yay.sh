#!/bin/bash

# Aborta o script em caso de erro
set -e

echo "--- Iniciando a instalação do yay ---"

# 1. Verificar se o usuário tem privilégios sudo
if ! command -v sudo &>/dev/null; then
  echo "Erro: O comando 'sudo' não foi encontrado. Instale-o primeiro."
  exit 1
fi

# 2. Atualizar a base de dados do sistema e instalar dependências básicas
echo "Verificando dependências (git e base-devel)..."
sudo pacman -Sy --needed --noconfirm git base-devel

# 3. Criar um diretório temporário para a compilação
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# 4. Clonar o repositório do yay
echo "Clonando o repositório do yay..."
git clone https://aur.archlinux.org/yay.git

# 5. Entrar na pasta e realizar a instalação (makepkg)
cd yay
echo "Iniciando a compilação e instalação..."
makepkg -si --noconfirm

# 6. Limpeza
echo "Limpando arquivos temporários..."
cd ~
rm -rf "$TEMP_DIR"

echo "--- Instalação concluída com sucesso! ---"
yay --version

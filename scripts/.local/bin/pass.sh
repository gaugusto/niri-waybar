#!/usr/bin/env bash

# Define o diretório padrão do pass
PASSWORD_STORE_DIR="${PASSWORD_STORE_DIR:-$HOME/.password-store}"

# Verifica se o diretório existe
if [ ! -d "$PASSWORD_STORE_DIR" ]; then
    echo "Erro: Diretório $PASSWORD_STORE_DIR não encontrado."
    exit 1
fi

# Busca arquivos .gpg e limpa o caminho usando awk
selection=$(find "$PASSWORD_STORE_DIR" -name "*.gpg" -type f | \
    awk -v store="$PASSWORD_STORE_DIR/" '{
        # Remove o caminho inicial (store)
        sub(store, ""); 
        # Remove a extensão .gpg no final da linha
        sub(/\.gpg$/, ""); 
        print 
    }' | \
    walker --dmenu)

# Executa o pass se houver uma seleção
if [ -n "$selection" ]; then
    pass -c "$selection"
fi


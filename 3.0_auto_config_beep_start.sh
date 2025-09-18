#!/bin/bash
set -e  # Para parar se houver erro

TAR_FILE="INSTALL_BEEP_START.tar.gz"
EXTRACT_DIR="INSTALL_BEEP_START"

echo "=== [1/2] Extraindo $TAR_FILE... ==="
if [ -f "$TAR_FILE" ]; then
    # Extrai sempre que rodar, sobrescrevendo arquivos
    rm -rf "$EXTRACT_DIR"
    tar -xvzf "$TAR_FILE"
else
    echo "Arquivo $TAR_FILE não encontrado!"
    exit 1
fi

cd "$EXTRACT_DIR"

echo "=== [2/2] Executando scripts internos... ==="

# Script de instalação
INSTALL_SCRIPT="SCRIPT_INSTALL/AUTO_INSTALL_BEEP/auto_install_beep_start.sh"
if [ -f "$INSTALL_SCRIPT" ]; then
    chmod +x "$INSTALL_SCRIPT"
    "$INSTALL_SCRIPT"
else
    echo "Script de instalação não encontrado!"
    exit 1
fi

# Script de ativação automática
AUTO_START_SCRIPT=$(find ATIVAR_INICIO_AUTO -type f -name "auto_start_beep_start.sh" | head -n 1)
if [ -n "$AUTO_START_SCRIPT" ]; then
    chmod +x "$AUTO_START_SCRIPT"
    "$AUTO_START_SCRIPT"
else
    echo "Script de inicialização automática não encontrado!"
    exit 1
fi

echo "=== Concluído! O Beep Start foi instalado e configurado para iniciar automaticamente. ==="


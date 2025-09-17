#!/bin/bash

# Definindo variáveis
GITHUB_URL="https://github.com/thehardsbrazil/install_beep_start/archive/refs/heads/main.tar.gz"
DOWNLOAD_DIR="/home/agrovendas/Público/INSTALL_BEEP_START"
TAR_FILE="main.tar.gz"
INSTALL_SCRIPT_DIR="$DOWNLOAD_DIR/SCRIPT_INSTALL/AUTO_INSTALL_BEEP"
SETUP_SCRIPT_DIR="$DOWNLOAD_DIR/ATIVAR_INICIO_AUTO/ATIVAR_AUTO_SCRIPT"

# Baixar o arquivo do GitHub
echo "Baixando o arquivo do GitHub..."
wget -O "$DOWNLOAD_DIR/$TAR_FILE" "$GITHUB_URL"

# Descompactar o arquivo
echo "Descompactando o arquivo..."
tar -xzf "$DOWNLOAD_DIR/$TAR_FILE" -C "$DOWNLOAD_DIR"

# Navegar até o diretório do script de instalação e executar
echo "Executando o script de instalação..."
cd "$INSTALL_SCRIPT_DIR" || { echo "Diretório de instalação não encontrado!"; exit 1; }
chmod +x auto_install_beep_start.sh
./auto_install_beep_start.sh

# Navegar até o diretório do script de configuração automática e executar
echo "Executando o script de configuração automática..."
cd "$SETUP_SCRIPT_DIR" || { echo "Diretório de configuração não encontrado!"; exit 1; }
chmod +x auto_setup_beep_start.sh
./auto_setup_beep_start.sh

echo "Processo concluído!"

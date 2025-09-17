#!/bin/bash

# Definindo variáveis
GITHUB_REPO="https://github.com/thehardsbrazil/install_beep_start"
TAR_FILE="INSTALL_BEEP_START.tar.gz"
INSTALL_DIR="INSTALL_BEEP_START"
DEB_FILE="beepstart_linux_amd64.deb"
SCRIPT_INSTALL_DIR="SCRIPT_INSTALL/AUTO_INSTALL_BEEP"
AUTO_START_DIR="ATIVAR_INICIO_AUTO/ATIVAR_AUTO_SCRIPT"
AUTO_INSTALL_SCRIPT="auto_install_beep_start.sh"
AUTO_START_SCRIPT="auto_setup_beep_start.sh"

# Clonar o repositório
echo "Clonando o repositório..."
git clone $GITHUB_REPO

# Descompactar o arquivo .tar.gz
echo "Descompactando o arquivo ${TAR_FILE}..."
tar -xzf $TAR_FILE

# Acessar o diretório descompactado
cd $INSTALL_DIR || { echo "Falha ao acessar o diretório ${INSTALL_DIR}"; exit 1; }

# Obter o caminho absoluto do diretório atual
BASE_DIR=$(pwd)

# Definindo caminhos absolutos
DEB_FILE_PATH="$BASE_DIR/$DEB_FILE"
AUTO_INSTALL_SCRIPT_PATH="$BASE_DIR/$SCRIPT_INSTALL_DIR/$AUTO_INSTALL_SCRIPT"
AUTO_START_SCRIPT_PATH="$BASE_DIR/$AUTO_START_DIR/$AUTO_START_SCRIPT"

# Verificar se os arquivos e diretórios existem antes de conceder permissões
if [ -f "$DEB_FILE_PATH" ]; then
    echo "Concedendo permissões de execução para o pacote .deb..."
    chmod +x "$DEB_FILE_PATH"
else
    echo "Arquivo ${DEB_FILE} não encontrado."
fi

if [ -f "$AUTO_INSTALL_SCRIPT_PATH" ]; then
    echo "Concedendo permissões de execução para o script de instalação..."
    chmod +x "$AUTO_INSTALL_SCRIPT_PATH"
else
    echo "Script de instalação ${AUTO_INSTALL_SCRIPT} não encontrado."
fi

if [ -f "$AUTO_START_SCRIPT_PATH" ]; then
    echo "Concedendo permissões de execução para o script de ativação automática..."
    chmod +x "$AUTO_START_SCRIPT_PATH"
else
    echo "Script de ativação automática ${AUTO_START_SCRIPT} não encontrado."
fi

# Instalar o pacote .deb
echo "Instalando o pacote ${DEB_FILE}..."
sudo dpkg -i "$DEB_FILE_PATH"

# Executar o script de instalação
echo "Executando o script de instalação ${AUTO_INSTALL_SCRIPT}..."
bash "$AUTO_INSTALL_SCRIPT_PATH"

# Executar o script de ativação automática
if [ -f "$AUTO_START_SCRIPT_PATH" ]; then
    echo "Executando o script de ativação automática ${AUTO_START_SCRIPT}..."
    bash "$AUTO_START_SCRIPT_PATH"
else
    echo "Script de ativação automática ${AUTO_START_SCRIPT} não encontrado."
fi

echo "Instalação e configuração concluídas."

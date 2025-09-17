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
cd $INSTALL_DIR

# Dar permissão de execução para os scripts
echo "Concedendo permissões de execução para os scripts..."
chmod +x $DEB_FILE
chmod +x $SCRIPT_INSTALL_DIR/$AUTO_INSTALL_SCRIPT
chmod +x $AUTO_START_DIR/$AUTO_START_SCRIPT

# Instalar o pacote .deb
echo "Instalando o pacote ${DEB_FILE}..."
sudo dpkg -i $DEB_FILE

# Executar o script de instalação
echo "Executando o script de instalação ${AUTO_INSTALL_SCRIPT}..."
bash $SCRIPT_INSTALL_DIR/$AUTO_INSTALL_SCRIPT

# Executar o script de ativação automática
echo "Executando o script de ativação automática ${AUTO_START_SCRIPT}..."
bash $AUTO_START_DIR/$AUTO_START_SCRIPT

echo "Instalação e configuração concluídas."

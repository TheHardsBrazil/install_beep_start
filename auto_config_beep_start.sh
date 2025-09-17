#!/bin/bash
set -e  # Se der erro em qualquer etapa, interrompe a execução

# Nome do arquivo compactado dentro do repositório
TAR_FILE="INSTALL_BEEP_START.tar.gz"
EXTRACT_DIR="INSTALL_BEEP_START"

echo "=== [1/4] Baixando repositório do GitHub... ==="
if [ ! -d "install_beep_start" ]; then
    git clone https://github.com/thehardsbrazil/install_beep_start.git
else
    echo "Repositório já existe, atualizando..."
    cd install_beep_start
    git pull
    cd ..
fi

cd install_beep_start

echo "=== [2/4] Extraindo $TAR_FILE... ==="
if [ -f "$TAR_FILE" ]; then
    tar -xvzf "$TAR_FILE"
else
    echo "Arquivo $TAR_FILE não encontrado!"
    exit 1
fi

cd "$EXTRACT_DIR"

echo "=== [3/4] Instalando o pacote .deb usando script interno... ==="
INSTALL_SCRIPT="SCRIPT_INSTALL/AUTO_INSTALL_BEEP/auto_install_beep_start.sh"
if [ -f "$INSTALL_SCRIPT" ]; then
    chmod +x "$INSTALL_SCRIPT"
    "$INSTALL_SCRIPT"
else
    echo "Script de instalação não encontrado!"
    exit 1
fi

echo "=== [4/4] Ativando início automático... ==="
AUTO_START_SCRIPT="ATIVAR_INICIO_AUTO/ATIVIAR_AUTO_ SCRIPT/auto_start_beep_start.sh"
if [ -f "$AUTO_START_SCRIPT" ]; then
    chmod +x "$AUTO_START_SCRIPT"
    "$AUTO_START_SCRIPT"
else
    echo "Script de inicialização automática não encontrado!"
    exit 1
fi

echo "=== Concluído! O Beep Start foi instalado e configurado para iniciar automaticamente. ==="


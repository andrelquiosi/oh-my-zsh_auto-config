#!/bin/bash

# Encerra o script caso algum comando falhe
set -e

echo "=========================================="
echo " Iniciando a instalação do Zsh e Oh My Zsh "
echo "=========================================="

# 1. Atualiza os pacotes e instala dependências (Zsh, Git e Curl)
echo "[1/6] Instalando dependências..."
sudo apt update
sudo apt install -y zsh git curl

# 2. Instala o Oh My Zsh (modo unattended para não interromper o script)
echo "[2/6] Instalando o Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "O Oh My Zsh já está instalado. Pulando esta etapa."
else
    # RUNZSH=no e CHSH=no impedem que o instalador mude de shell no meio do processo
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3. Baixa os plugins na pasta customizada do Oh My Zsh
echo "[3/6] Baixando plugins essenciais..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Clone do zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

# Clone do zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# 4. Configura o .zshrc para ativar os plugins
echo "[4/6] Configurando o arquivo .zshrc..."
# O sed vai procurar a linha padrão de plugins e substituir pela nova lista
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# 5. Altera o shell padrão do usuário atual para o Zsh
echo "[5/6] Definindo o Zsh como shell padrão..."
sudo chsh -s $(which zsh) $USER

# 6. Copiando histórico do Bash para o Zsh
echo "[6/6]Copiando histórico do Bash para Zsh..."
cat .bash_history >> .zsh_history 

echo "=========================================="
echo " Instalação concluída com sucesso!        "
echo "=========================================="
echo "Para aplicar as alterações, por favor:"
echo "1. Feche este terminal e abra novamente."
echo "2. Ou faça logout e login na sua sessão."
echo "3. Você também pode digitar 'zsh' agora para testar."

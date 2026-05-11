# Zsh + Oh My Zsh Config

Este repositório contém um script de instalação automatizada que configura o **Zsh** com **Oh My Zsh** e plugins essenciais para melhorar a produtividade no terminal Linux.

## O que o script instala e configura

| Passo | Descrição |
|-------|-----------|
| 1 | Instala as dependências: `zsh`, `git` e `curl` |
| 2 | Instala o **Oh My Zsh** (gerenciador de configuração Zsh) |
| 3 | Baixa os plugins **zsh-autosuggestions** e **zsh-syntax-highlighting** |
| 4 | Ativa os plugins no arquivo `~/.zshrc` |
| 5 | Define o Zsh como shell padrão do usuário |
| 6 | Copia o histórico do Bash (`~/.bash_history`) para o Zsh (`~/.zsh_history`) |

## Plugins incluídos

- **zsh-autosuggestions** — sugere comandos conforme você digita, baseado no histórico
- **zsh-syntax-highlighting** — realça comandos válidos em verde e inválidos em vermelho durante a digitação

## Pré-requisitos

- Sistema operacional **Linux** (distribuição baseada em Debian/Ubuntu)
- Acesso **sudo** para instalar pacotes e alterar o shell padrão
- `curl` instalado (caso não esteja, o script tentará instalá-lo)

## Como usar

### 1. Clone o repositório

```bash
git clone https://github.com/andrelquiosi/zsh_plus_oh-my-zsh_config.git
cd zsh_plus_oh-my-zsh_config
```

### 2. Execute o script de instalação

```bash
chmod +x install.sh
./install.sh
```

### 3. Após a execução

O script exibirá uma mensagem de conclusão. Para que as alterações tenham efeito, escolha uma das opções abaixo:

1. Feche o terminal e abra um novo.
2. Faça logout e login na sua sessão.
3. Digite `zsh` no terminal atual para testar o novo shell imediatamente.

## Estrutura do repositório

```
zsh_plus_oh-my-zsh_config/
├── install.sh    # Script principal de instalação
└── README.md     # Este arquivo
```

## Personalização

Após a instalação, você pode personalizar o Zsh editando o arquivo `~/.zshrc`:

```bash
nano ~/.zshrc
```

Algumas personalizações comuns:

- **Tema**: altere a variável `ZSH_THEME` (o padrão é `"robbyrussell"`). Veja temas disponíveis em [Oh My Zsh Themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).
- **Plugins**: adicione ou remova plugins na linha `plugins=(...)`.
- **Aliases**: crie aliases personalizados no final do arquivo.

## Desinstalação

Caso queira remover o Oh My Zsh e voltar ao Bash:

```bash
uninstall_oh_my_zsh
```

Em seguida, altere manualmente o shell padrão de volta para o Bash:

```bash
sudo chsh -s $(which bash) $USER
```

## Suporte

Este script foi testado em distribuições baseadas em Debian/Ubuntu. Para outras distribuições, pode ser necessário ajustar o gerenciador de pacotes (ex.: `dnf` no Fedora, `pacman` no Arch Linux).

---  

**Nota:** O script foi projetado para ser executado uma única vez. Execuções repetidas não causam danos, pois cada etapa verifica se o recurso já existe antes de prosseguir.

#!/bin/bash

# Função para instalar o Docker e o GitHub CLI
install_docker() {
    # Atualiza a lista de pacotes disponíveis e instala as dependências necessárias
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg

    # Adiciona a chave GPG oficial do Docker
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Adiciona o repositório Docker ao APT
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Atualiza a lista de pacotes com o novo repositório Docker
    sudo apt update

    # Instalar GitHub CLI
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh

    # Instala o Docker
    sudo apt install -y docker-ce docker-ce-cli containerd.io

    # Verifica se o Docker está funcionando corretamente
    sudo systemctl status docker

    # Exibe a versão do Docker instalada para confirmação
    docker --version

    echo "Instalação do Docker concluída com sucesso."
}

# Verifica se o Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado."

    # Pergunta ao usuário se ele deseja instalar o Docker e continuar
    read -p "Você deseja instalar o Docker e continuar com o script? (s/n): " resposta

    if [[ "$resposta" =~ ^[Ss]$ ]]; then
        install_docker
    else
        echo "Dando continuidade a configuração do container..."
        exit 1
    fi
fi

# Para construir a imagem Docker, use o comando:
sudo docker build -t my-mongodb-image .
echo "Construindo a imagem do MongoDB..."

# Configura e inicia um container do MongoDB
echo "Criando e iniciando um container do MongoDB..."
sudo docker run -d --name mongodb-container -p 27017:27017 my-mongodb-image

# Exibe a lista de containers em execução para verificar se o MongoDB está rodando
sudo docker ps

echo "Container do MongoDB iniciado com sucesso."
echo "Você pode acessar o MongoDB no endereço mongodb://localhost:27017"

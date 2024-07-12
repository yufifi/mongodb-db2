#!/bin/bash

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

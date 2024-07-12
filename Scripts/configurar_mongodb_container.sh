#!/bin/bash

# Verifica se o Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado. Por favor, instale o Docker primeiro."
    exit 1
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

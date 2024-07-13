# Docker MongoDB

Este repositório contém um Dockerfile para criar uma imagem Docker do MongoDB.

## Como usar

Para construir a imagem Docker, use o comando:

\`\`\`bash
docker build -t my-mongodb-image .
\`\`\`

Para rodar um container com a imagem Docker, use o comando:

\`\`\`bash
docker run -d --name mongodb-container -p 27017:27017 my-mongodb-image
\`\`\`

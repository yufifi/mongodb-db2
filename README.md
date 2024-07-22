# TRABALHO DE BANCO DE DADOS II

--- 

## INTRODUÇÃO
Este repositório foi criado para contar como a terceira nota da disciplina de Banco de Dados II, ele visa ensinar como baixar o MongoDB em um container e manipular os dados dentro dele, com foco no sistema operacional Debian 12.

<div align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Docker_%28container_engine%29_logo_%28cropped%29.png" alt="logo do docker">
</div>

--- 

## INSTALAÇÃO DO DOCKER E DEPENDÊNCIAS
Execute o script "configurar_mongo_docker.sh" utilizando o comando a seguir para instalar o docker e outras dependências necessárias juntamente com a criação e configuração do container:

```bash
./configurar_mongo_docker.sh
```

---

## CRIANDO CONTAINER COM IMAGEM DO MONGODB
Primeiro é necessário baixar a imagem oficial do MongoDB, presente no seguinte [link](https://hub.docker.com/_/mongo), para em seguida criar o container. Basta executar o seguinte comando no terminal:

```bash
docker pull mongo
```

Em seguida, poderemos criar um container com essa imagem que acabamos de baixar:

```bash
docker run -d --name nome_do_container -p 27017:27017 mongo
```

Esse comando exibe a lista de containers em execução para verificar se o container com a imagem do MongoDB está rodando:

```bash
sudo docker ps
```

Para iniciar o container utilize o comando abaixo:

```bash
sudo docker start nome_do_container 
```

Dentro do container, poderemos inicializar o MongoDB ao digitar:

```bash
mongosh
```

Em seguida, já podemos criar e usar nosso primeiro banco de dados com o comando:
```bash
use meu_banco_de_dados 
```

Nesse seu banco de dados, podemos criar uma collection para ele e já inserir dados nela:

```bash
db.createCollection("minhaCollection")
```

```bash
db.pessoas.insertOne({nome: "João Victor", idade: 21})
```

Para visualizar todos os banco de dados basta você digitar o comando abaixo:
```bash
show dbs
```

Os que irão aparecer muito provavelmente serão:
```bash
admin
local
config
meu_banco_de_dados
```

---

## VISUALIZAÇÃO E MANIPULAÇÃO DE DADOS COM O COMPASS
É possível fazer muitas coisas pelo `mongosh`, mas se quisermos ter uma melhor visualização dos dados, podemos baixar o [MongoDB Compass](https://www.mongodb.com/products/tools/compass), uma aplicação que irá se conectar com nosso banco de dados rodando no container e nos permitirá visualizar os dados inseridos e fazer queries mais facilmente.

### INSTALAÇÃO DO MONGODB COMPASS
- Comandos ou imagens de você instalando 
- Imagem da tela inicial 
- Imagem de você realizando a conexão com a porta certa
- imagem do mongo com os banco de dados mostrados anteriormente + o que criamos dentro do container, no caso (admin, local, config, meu_banco_de_dados)

### IMPORTANDO DADOS NO MONGODB COMPASS
Caso queira realizar testes com muitos dados, você pode utilizar os que estão presentes na pasta "dados de exemplo" nesse repositório, basta importá-los da seguinte forma:

![imagem de você importando os dados]()

![imagem após a importação]()

Você pode fazer queries nesses dados pelo próprio mongosh ou na barra no canto superior da tela do MongoDB Compass.

---

## COMANDOS DO MONGODB
Para inserir documentos em uma coleção, você pode usar o comando insertOne ou insertMany.

```javascript
db.pessoas.insertOne({
  nome: "João Silva",
  telefone: "123-456-7890",
  endereco: "Rua das Flores, 123",
  data_nascimento: "1990-01-01"
})
```

```javascript
db.pessoas.insertMany([
  {
    nome: "Maria Oliveira",
    telefone: "987-654-3210",
    endereco: "Avenida Brasil, 456",
    data_nascimento: "1985-05-15"
  },
  {
    nome: "Carlos Pereira",
    telefone: "555-666-7777",
    endereco: "Praça da Liberdade, 789",
    data_nascimento: "1978-11-20"
  }
])
```

Para ler documentos de uma coleção, você pode usar os comandos findOne ou find.

```javascript
db.pessoas.findOne({ nome: "João Silva" })
```


```javascript
db.pessoas.find({})  // Retorna todos os documentos
```

```javascript
db.pessoas.find({ endereco: /Rua/ })  // Retorna documentos onde o campo 'endereco' contém 'Rua'
```

Para atualizar documentos, você pode usar os comandos updateOne, updateMany ou replaceOne.

```javascript
db.pessoas.updateOne(
  { nome: "João Silva" },
  { $set: { telefone: "111-222-3333" } }
)
```

```javascript
db.pessoas.updateMany(
  { endereco: /Avenida/ },
  { $set: { cidade: "São Paulo" } }
)
```

```javascript
db.pessoas.replaceOne(
  { nome: "Maria Oliveira" },
  {
    nome: "Maria Oliveira",
    telefone: "444-555-6666",
    endereco: "Avenida Brasil, 456",
    data_nascimento: "1985-05-15",
    cidade: "Rio de Janeiro"
  }
)
```

Para deletar documentos, você pode usar os comandos deleteOne ou deleteMany.

```javascript
db.pessoas.deleteOne({ nome: "João Silva" })
```

```javascript
db.pessoas.deleteMany({ endereco: /Praça/ })  //Deleta todos os documentos onde o campo 'endereco' contém 'Praça'
```

---

## OUTROS COMANDOS IMPORTANTES DO DOCKER
Para interromper o container utilize o comando abaixo:
```bash
sudo docker stop mongodb-container
```

Para remover o container utilize o comando abaixo:
```bash
sudo docker rm mongodb-container
```

Para visualizar os containers utilize o comando abaixo:
```bash
sudo docker ps
```

Para acessar o terminal do container utilize o comando abaixo:
```bash
sudo docker exec -it mongodb-container /bin/bash
```

---

## DEPENDÊNCIAS
> [!IMPORTANT]
> **As dependências que foram utilizadas no projeto são:**
> - Mongo
> - GitHub CLI
> - apt-transport-https
> - ca-certificates
> - curl
> - software-properties-common
> - gnupg
> - gh
> - docker-ce
> - docker-ce-cli
> - containerd.io
> - Bash
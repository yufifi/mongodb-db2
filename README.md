# Docker MongoDB

- Este repositório contém um Dockerfile para criar uma imagem Docker do MongoDB para o Debian 12.

![PNG da logo do docker.](https://upload.wikimedia.org/wikipedia/commons/e/ea/Docker_%28container_engine%29_logo_%28cropped%29.png)

> [!IMPORTANT]
> As dependências que foram utilizadas no projeto são:
> - Mongo
> - Python 3.11
> - Pip 23.3.2
> - PyMongo 4.8.0
> - GitHub CLI
> - apt-transport-https software-properties-common
> - ca-certificates
> - curl
> - gnupg
> - gh
> - docker-ce
> - docker-ce-cli
> - containerd.io

## Instalação do container e dependências

- Execute o script "instalar_docker.sh" utilizando o comando a seguir para instalar o docker e outras dependências necessárias:
```bash
$ ./instalar_docker.sh
```

- Execute o script "configurar_mongodb_container.sh" utilizando o comando a seguir para criar e configura o container do MongoDB:
```bash
$ ./configurar_mongodb_container.sh
```

### Como utilizar

- Para iniciar o container utilize o comando abaixo:
```bash
$ sudo docker start mongodb-container
```

- Para interromper o container utilize o comando abaixo:
```bash
$ sudo docker stop mongodb-container
```

- Para remover o container utilize o comando abaixo:
```bash
$ sudo docker rm mongodb-container
```

- Para visualizar os containers utilize o comando abaixo:
```bash
$ sudo docker ps
```

- Para acessar o terminal do container utilize o comando abaixo:
```bash
$ sudo docker exec -it mongodb-container /bin/bash
```

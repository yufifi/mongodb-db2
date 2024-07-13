from pymongo import MongoClient, errors
import json
import time

def ler_dados(parametros):
    try:
        # Cria uma conexão com o servidor MongoDB
        client = MongoClient(host=parametros["host"], port=parametros["port"])

        # Seleciona o banco de dados 'teste'
        db = client['teste']

        # Seleciona a coleção 'pessoas'
        collection = db['pessoas']

        inicio = time.time()

        # Obtém todos os documentos da coleção 
        pessoas = collection.find()

        fim = time.time()
        tempo_total = fim - inicio

        # Imprimir os dados
        for pessoa in pessoas:
            print(pessoa)

        print(f'Tempo de execução: {tempo_total:.5f} segundos.')

    except errors.ServerSelectionTimeoutError as err:
        print(f"Erro de conexão com o servidor MongoDB: {err}")
    except errors.PyMongoError as err:
        print(f"Ocorreu um erro ao acessar o MongoDB: {err}")
    except Exception as err:
        print(f"Ocorreu um erro inesperado: {err}")
        
    finally:
        # Fechar a conexão, se a conexão foi estabelecida
        if 'client' in locals():
            client.close()

parametros = {
    "host": "localhost",
    "port" : 27017
}

ler_dados(parametros)

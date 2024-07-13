from pymongo import MongoClient, errors
import json
import time

def inserir_dados(parametros, arquivo):
    try:
        # Cria uma conexão com o servidor MongoDB
        client = MongoClient(host=parametros["host"], port=parametros["port"])

        # Seleciona o banco de dados 'teste'
        db = client['teste']

        # Seleciona a coleção 'pessoas'
        collection = db['pessoas']

        # Ler o arquivo JSON
        with open(arquivo, 'r', encoding='utf-8') as f:
            dados = json.load(f)

        inicio = time.time()

        # Inserir cada documento na coleção
        for documento in dados:
            collection.insert_one(documento)

        fim = time.time()
        tempo_total = fim - inicio

        print(f'Tempo de execução: {tempo_total:.2f} segundos.')
        print(f'Inseridos {len(dados)} documentos no MongoDB.')

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

arquivo = "dados.json"

inserir_dados(parametros, arquivo)

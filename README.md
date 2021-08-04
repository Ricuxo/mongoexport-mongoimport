# Mongoexport-Mongoimport
Shell script para realizar loop para exportar collection por collection do mongodb , e importar as collections.

# Detalhes da utilização

Na importação eu não estou utilizando usuário/senha devido a eu ter usado essa estratégia dentro de uma imagem Docker, não havia necessidade de autenticação.

Quando estou fazendo a exportação das collections, o parâmetro --limit diz quantos documentos você quer trazer de cada collection (fica a gosto do fregues)

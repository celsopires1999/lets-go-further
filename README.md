# Notas do livro

## definir a variável de ambiente
export GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@db/greenlight?sslmode=disable'

## criar arquivo de migrations
migrate create -seq -ext=.sql -dir=./migrations create_movies_table

## executar migrations
migrate -path ./migrations -database "$GREENLIGHT_DB_DSN" -verbose up
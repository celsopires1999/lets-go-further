# Notas do livro

## definir a variável de ambiente
export GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@db/greenlight?sslmode=disable'

## Migrations

### criar arquivo de migrations
migrate create -seq -ext=.sql -dir=./migrations create_movies_table

### executar migrations
migrate -path ./migrations -database "$GREENLIGHT_DB_DSN" -verbose up

### ver a versão atual
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" version

### voltar para versão 1
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" goto 1

### remover migrations
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" down 1

### remover todas as migrations
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" down

### force migrations when database is not up to date (after correcting and SQL error)
$ migrate -path=./migrations -database=$EXAMPLE_DSN force 1

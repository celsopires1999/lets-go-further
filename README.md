# Notas do livro

## definir a variável de ambiente
```bash
export GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@db/greenlight?sslmode=disable'
```
## Migrations

### criar arquivo de migrations
```bash
migrate create -seq -ext=.sql -dir=./migrations create_movies_table
```	
### executar migrations
```bash
migrate -path ./migrations -database "$GREENLIGHT_DB_DSN" -verbose up
```	
### ver a versão atual
```bash
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" version
```	
### voltar para versão 1
```bash
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" goto 1
```	
### remover migrations
```bash
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" down 1
```	
### remover todas as migrations
```bash
migrate -path=./migrations -database "$GREENLIGHT_DB_DSN" down
```	
### force migrations when database is not up to date (after correcting and SQL error)
```bash
$ migrate -path=./migrations -database=$EXAMPLE_DSN force 1
```	
### executar air com parâmetros
```bash
air -- -cors-trusted-origins="http://localhost:9000"
air -- -limiter-enabled=false -port=4000
```	
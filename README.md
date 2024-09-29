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
migrate -path=./migrations -database="$GREENLIGHT_DB_DSN" force 6
```	
### executar air com parâmetros
```bash
air -- -cors-trusted-origins="http://localhost:9000"
air -- -limiter-enabled=false -port=4000
```	
### Criar usuário
```bash
BODY='{"name": "Alice Smith", "email": "alice@example.com", "password": "pa55word"}'
curl -w '\nTime: %{time_total}\n' -d "$BODY" localhost:4000/v1/users
```	
### Pegar o e-mail de ativação
```bash
https://mailtrap.io/inboxes
```	

### Ativar usuário
```bash
curl -X PUT -d '{"token": "6F6QWBMUVNMYT6Z4OI2R5OPCOI"}' localhost:4000/v1/users/activated
```	
### executar hey para testar
```bash
BODY='{"email": "alice@example.com", "password": "pa55word"}'
hey -d "$BODY" -m "POST" http://localhost:4000/v1/tokens/authentication
```	
### executar o servidor com parametrizaação do banco de dados
```bash
go run ./cmd/api -limiter-enabled=false -db-max-open-conns=50 -db-max-idle-conns=50 -db-max-idle-time=20s -port=4000 
```	
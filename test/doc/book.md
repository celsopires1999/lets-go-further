Migrations
```bash
migrate create -seq -ext .sql -dir ./migrations create_tokens_table

migrate -path=./migrations -database=$GREENLIGHT_DB_DSN up
```

Start the server
```bash
go run ./cmd/api

```

Authentication
```bash	
curl -d '{"email": "alice@example.com", "password": "pa55word"}' localhost:4000/v1/tokens/authentication

curl -H "Authorization: Bearer DOF536ZM5U46E443ZSWYORFQLY" localhost:4000/v1/healthcheck

curl -i -H "Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXX" localhost:4000/v1/healthcheck
```

Commands for testing the application
```bash
curl localhost:4000/v1/healthcheck

BODY='{"name": "Bob Jones", "email": "bob@example.com", "password": "pa55word"}'
curl -w '\nTime: %{time_total}\n' -d "$BODY" localhost:4000/v1/users


BODY='{"name": "Carol Smith", "email": "carol@example.com", "password": "pa55word"}'
curl -w '\nTime: %{time_total}\n' -d "$BODY" localhost:4000/v1/users

```

Command with kill
```bash
BODY='{"name": "Edith Smith", "email": "edith@example.com", "password": "pa55word"}'
curl -d "$BODY" localhost:4000/v1/users & pkill -SIGTERM api
```

Activating a user
```bash
curl -X PUT -d '{"token": "UXBAJOEVBD3W5NBHL325IPOHSI"}' localhost:4000/v1/users/activated
```

Hash Calculator
```bash
https://xorbin.com/tools/sha256-hash-calculator
```

SQL Joins
```bash
https://www.dataquest.io/blog/sql-joins/
```

Authentication
```bash
BODY='{"email": "alice@example.com", "password": "pa55word"}'
curl -i -d "$BODY" localhost:4000/v1/tokens/authentication

```	

Access a movie with actived user
```bash
BODY='{"email": "faith@example.com", "password": "pa55word"}'
curl -i -d "$BODY" localhost:4000/v1/tokens/authentication
curl -i -H "Authorization: Bearer KXEIYPSZBRVEXHAEGT2IDFFOZ4" localhost:4000/v1/movies/1
```	
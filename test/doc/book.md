Migrations
```bash
migrate create -seq -ext .sql -dir ./migrations create_tokens_table

migrate -path=./migrations -database=$GREENLIGHT_DB_DSN up
migrate -path=./migrations -database=$GREENLIGHT_DB_DSN down 1
migrate -path=./migrations -database=$GREENLIGHT_DB_DSN goto 1

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
curl -X PUT -d '{"token": "KUJTN57UYUVBJ52CXR7ODPZJDA"}' localhost:4000/v1/users/activated
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
curl -X DELETE -H "Authorization: Bearer KXEIYPSZBRVEXHAEGT2IDFFOZ4" localhost:4000/v1/movies/1

BODY='{"title":"Moana","year":2016,"runtime":"107 mins", "genres":["animation","adventure"]}' 
curl -i -d "$BODY" -H "Authorization: Bearer KXEIYPSZBRVEXHAEGT2IDFFOZ4" localhost:4000/v1/movies

BODY='{"email": "alice@example.com", "password": "pa55word"}'
curl -d "$BODY" localhost:4000/v1/tokens/authentication
curl -X DELETE -H "Authorization: Bearer UTMBIBEXKI7M36PR6L5POB4PNM" localhost:4000/v1/movies/5
```	

Updating the registration handler
```bash
BODY='{"name": "Grace Smith", "email": "grace@example.com", "password": "pa55word"}'
curl -d "$BODY" localhost:4000/v1/users
curl -X PUT -d '{"token": "KUJTN57UYUVBJ52CXR7ODPZJDA"}' localhost:4000/v1/users/activated
```	
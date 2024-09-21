Start the server
```bash
go run ./cmd/api

```

Commands for testing the application
```bash
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

DB_URL=postgresql://root:postgres_password@localhost:5432/postgres?sslmode=disable

migratecreate:
	migrate create -ext sql -dir db/migration -seq $(name)

# make migratecreate name=init_schema

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

sqlc:
	sqlc generate

.PHONY: migrateup migratedown migratecreate sqlc
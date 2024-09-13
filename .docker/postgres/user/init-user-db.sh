#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE greenlight;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "greenlight" <<-EOSQL
	CREATE ROLE greenlight WITH LOGIN PASSWORD 'pa55word';
	CREATE EXTENSION IF NOT EXISTS citext;
	ALTER ROLE greenlight SUPERUSER;
EOSQL

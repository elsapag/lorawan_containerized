#!/bin/bash
set -e 

psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    create role chirpstack_ns with login password 'chirpstack_ns';
    create database chirpstack_ns with owner chirpstack_ns;
EOSQL

psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    create role chirpstack_as with login password 'chirpstack_as';
    create database chirpstack_as with owner chirpstack_as;
EOSQL

psql -v ON_ERROR_STOP=1 --username postgres --dbname="chirpstack_as" <<-EOSQL
    create extension pg_trgm;
    create extension hstore;
EOSQL

psql -v ON_ERROR_STOP=1 --username postgres --dbname="chirpstack_ns" <<-EOSQL
    create extension pg_trgm;
    create extension hstore;
EOSQL

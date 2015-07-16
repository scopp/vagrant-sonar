#!/usr/bin/env bash

psql -c "CREATE USER sonar WITH PASSWORD 'sonar'"
psql -c "CREATE DATABASE sonar WITH OWNER sonar ENCODING 'UTF8'"
psql -c "GRANT ALL PRIVILEGES ON DATABASE sonar to sonar"

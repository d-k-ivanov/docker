#!/usr/bin/env bash
docker exec -i dev_mysql_db sh -c "exec mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e \"DROP DATABASE IF EXISTS ${1}\""
docker exec -i dev_mysql_db sh -c "exec mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e \"CREATE DATABASE IF NOT EXISTS ${1}\""
docker exec -i dev_mysql_db sh -c "zcat /tmp/backup/${1}.sql.gz | exec mysql -uroot -p${MYSQL_ROOT_PASSWORD} --database=${1}"

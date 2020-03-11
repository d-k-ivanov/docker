#!/usr/bin/env posh

docker exec -i dev_mysql_db sh -c 'exec mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DROP DATABASE IF EXISTS dbname"'
docker exec -i dev_mysql_db sh -c 'exec mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS dbname"'
docker exec -i dev_mysql_db sh -c 'zcat /tmp/backup/dbname.sql.gz | exec mysql -uroot -p${MYSQL_ROOT_PASSWORD} --database=dbname'

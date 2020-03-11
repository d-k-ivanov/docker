#!/usr/bin/env bash
docker exec -i dev_mysql_db sh -c "exec mysqldump --single-transaction -u root -p${MYSQL_ROOT_PASSWORD} ${1} | gzip > /tmp/backup/${1}.sql.gz"

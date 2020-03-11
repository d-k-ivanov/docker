#!/usr/bin/env posh
docker exec -i dev_mysql_db sh -c "exec mysqldump --single-transaction -u root -p${MYSQL_ROOT_PASSWORD} dbname | gzip > /tmp/backup/dbname.sql.gz"

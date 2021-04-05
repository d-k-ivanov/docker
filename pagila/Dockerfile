FROM postgres:13.2

LABEL maintainer="Dmitry Ivanov <d.k.ivanov@live.com>"

ENV POSTGRES_PASSWORD secret

COPY pagila-data.sql pagila-data.sql
COPY pagila-insert-data.sql pagila-insert-data.sql
COPY pagila-schema.sql pagila-schema.sql

RUN set -x                                                          \
    && psql -U postgres -c "CREATE DATABASE pagila"                 \
    && cat pagila-schema.sql | psql -U postgres -d pagila           \
    && cat pagila-data.sql   | psql -U postgres -d pagila

function fks() {
  if [ -z "$1" ]; then
    echo "Syntax: fks dbname [schemaname.][tablename]"
    return 0
  fi

  local DIGRAPH_TEMPLATE='
    digraph {
      graph [
        bgcolor="transparent"
      ];

      node [
        color="#9c6b80"
        fontcolor="#f5eff3"
        fontname="Inconsolata LGC"
      ];

      edge [
        color="#9ccbdd"
        dir="forward"
        arrowhead="normal"
      ];

      concentrate=true;

      %s
    }
  '

  local SCHEMA=public

  if [ -n "$2" ]; then
    local OBJPATH=(${(@s/./)2}) # split arg2 on .

    if [ "${#OBJPATH[@]}" -gt 1 ]; then
      local SCHEMA="${OBJPATH[1]}"
      local TABLE="${OBJPATH[2]}"
    else
      local TABLE="$2"
    fi

    QUERY="WITH RECURSIVE keys_dn AS (
      SELECT
        1 AS level,
        '$TABLE' COLLATE \"C\" AS origin,
        '$SCHEMA' COLLATE \"C\" AS origin_schema,
        '$TABLE' COLLATE \"C\" AS dependent,
        '$SCHEMA' COLLATE \"C\" AS dependent_schema
      UNION ALL
      SELECT 2, originrel.relname::text, originns.nspname::text, dependentrel.relname::text, dependentns.nspname::text
      FROM pg_catalog.pg_constraint AS foreign_keys
      JOIN pg_catalog.pg_class AS originrel ON originrel.oid = foreign_keys.confrelid
      JOIN pg_catalog.pg_namespace AS originns ON originns.oid = originrel.relnamespace
      JOIN pg_catalog.pg_class AS dependentrel ON dependentrel.oid = foreign_keys.conrelid
      JOIN pg_catalog.pg_namespace AS dependentns ON dependentns.oid = dependentrel.relnamespace
      JOIN keys_dn ON keys_dn.origin_schema = dependentns.nspname AND keys_dn.origin = dependentrel.relname
      WHERE foreign_keys.contype = 'f'
    ), keys_up AS (
      SELECT
        1 AS level,
        '$TABLE' COLLATE \"C\" AS origin,
        '$SCHEMA' COLLATE \"C\" AS origin_schema,
        '$TABLE' COLLATE \"C\" AS dependent,
        '$SCHEMA' COLLATE \"C\" AS dependent_schema
      UNION ALL
      SELECT 2, originrel.relname::text, originns.nspname::text, dependentrel.relname::text, dependentns.nspname::text
      FROM pg_catalog.pg_constraint AS foreign_keys
      JOIN pg_catalog.pg_class AS originrel ON originrel.oid = foreign_keys.confrelid
      JOIN pg_catalog.pg_namespace AS originns ON originns.oid = originrel.relnamespace
      JOIN pg_catalog.pg_class AS dependentrel ON dependentrel.oid = foreign_keys.conrelid
      JOIN pg_catalog.pg_namespace AS dependentns ON dependentns.oid = dependentrel.relnamespace
      JOIN keys_up ON keys_up.dependent_schema = originns.nspname AND keys_up.dependent = originrel.relname
      WHERE foreign_keys.contype = 'f'
    ), all_keys AS (
      SELECT origin, nullif(origin_schema, '$SCHEMA') AS origin_schema, dependent, nullif(dependent_schema, '$SCHEMA') AS dependent_schema
      FROM keys_dn WHERE level > 1
      UNION
      SELECT origin, nullif(origin_schema, '$SCHEMA'), dependent, nullif(dependent_schema, '$SCHEMA')
      FROM keys_up WHERE level > 1
    )
    SELECT '\"' || coalesce(origin_schema || '.', '') || origin || '\" -> \"' || coalesce(dependent_schema || '.', '') || dependent || '\"'
    FROM all_keys"
  else
    QUERY="SELECT originrel.relname || ' -> ' || dependentrel.relname
      FROM pg_catalog.pg_constraint AS foreign_keys
      JOIN pg_catalog.pg_class AS originrel ON originrel.oid = foreign_keys.confrelid
      JOIN pg_catalog.pg_class AS dependentrel ON dependentrel.oid = foreign_keys.conrelid
      WHERE foreign_keys.contype = 'f'"
  fi

  local DOT_DEFN=$(psql $1 --no-psqlrc --tuples-only -c "$QUERY")

  if [ -z "$DOT_DEFN" ]; then
    if [ -z "$TABLE" ]; then
      echo "no foreign keys found"
    else
      echo "$SCHEMA.$TABLE not found"
    fi

    return 1
  fi

  # echo "$DOT_DEFN"
  printf "$DIGRAPH_TEMPLATE" "$DOT_DEFN" | dot -Tpng
}

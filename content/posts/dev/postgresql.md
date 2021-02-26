+++
title = "PostgreSQL"
tags = [ "sql", "postgresql" ]
categories = [ "development" ]
+++

[PostgreSQL](https://www.postgresql.org): The World's Most Advanced Open Source Relational Database.

* [Installation](#installation)
* [Commands](#commands)
* [Useful scripts](#useful-scripts)
    - [Schema](#schema)
    - [Security](#security)
* [Links](#links)

# Installation

> TODO

# Commands

| Command                 | Description                   |
| ----------------------- | ----------------------------- |
| \l | Display database |
| \c | Connect to database |
| \dn | List schemas |
| \dt | List tables |
| \dt | List tables with sizes |
| SHOW search_path;       | Show the current search puth (schema)         |
| SET search_path TO myschema; | Change a defauls search path             |


# Useful scripts

## Schema

### Show size of all schemas
```sql
SELECT schema_name, 
    pg_size_pretty(SUM(table_size)::BIGINT) AS size,
    CONCAT(CAST(TRUNC((SUM(table_size) / pg_database_size(CURRENT_DATABASE())) * 100, 2) AS TEXT), '%') AS percent
FROM (SELECT pg_catalog.pg_namespace.nspname as schema_name, pg_relation_size(pg_catalog.pg_class.oid) as table_size
    FROM pg_catalog.pg_class JOIN pg_catalog.pg_namespace ON relnamespace = pg_catalog.pg_namespace.oid) t
GROUP BY schema_name
ORDER BY schema_name;
```

## Security

> TODO
 
# Links

* [PostgreSQL: Downloads](https://www.postgresql.org/download/)
* [PostgreSQL: Documentation](https://www.postgresql.org/docs/)

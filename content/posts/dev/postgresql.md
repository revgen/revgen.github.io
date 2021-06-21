+++
title = "PostgreSQL"
tags = [ "sql", "database" ]
categories = [ "development" ]
+++

[PostgreSQL](https://www.postgresql.org): The World's Most Advanced Open Source Relational Database.
<!--more-->

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

## Queries

### Show running queries (9.2+)
```sql
SELECT pid, age(clock_timestamp(), query_start), usename, query 
FROM pg_stat_activity 
WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%' 
ORDER BY query_start desc;
```

### Kill running query
```sql
SELECT pg_cancel_backend(procpid);
```

### Kill idle query
```sql
SELECT pg_terminate_backend(procpid);
```

### Vacuum command
```sql
VACUUM (VERBOSE, ANALYZE);
```

### Show long running queries
```sql
-- Example: show long queries more than 2 minutes
SELECT now() - query_start as "runtime", usename, datname, waiting, state, query
  FROM  pg_stat_activity
  WHERE now() - query_start > '2 minutes'::interval
 ORDER BY runtime DESC;
```

## Import/Export CSV

### Export to CSV file
```sql
COPY persons(first_name,last_name,email) TO './persons_partial_db.csv' DELIMITER ',' CSV HEADER;
```
```sql
\COPY (SELECT * FROM persons) TO './persons_partial_db.csv' CSV HEADER;
```

### Import from CSV file
```sql
COPY persons(first_name, last_name, dob, email) FROM './persons.csv' DELIMITER ',' CSV HEADER;
```
```sql
\COPY <table name> FROM './persons.csv' DELIMITER ',' CSV HEADER;
```
## Backup/Restore

### Dump database on remote host to file
```bash
pg_dump -U username -h hostname databasename > dump.sql
```

### Import dump into existing database
```bash
psql -d newdb -f dump.sql
```
    
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

### Show all databases and their sizes
```sql
SELECT * FROM pg_user;
```

### Show all tables and their size, with/without indexes
```sql
SELECT datname, pg_size_pretty(pg_database_size(datname))
FROM pg_database
ORDER BY pg_database_size(datname) DESC;
```

### Show all database users
```sql
SELECT * FROM pg_stat_activity WHERE current_query NOT LIKE '<%';
```


## Security

> TODO
 
# Links

* [PostgreSQL: Downloads](https://www.postgresql.org/download/)
* [PostgreSQL: Documentation](https://www.postgresql.org/docs/)
* [Usefull queries from **rgreenjr**](https://gist.github.com/rgreenjr/3637525)

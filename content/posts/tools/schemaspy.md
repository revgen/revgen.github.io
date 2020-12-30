+++
title = "SchemaSpy"
tags = ["tools", "apps"]
categories = ["development"]
+++

[SchemaSpy](http://schemaspy.org/) is a tool to document your database simply and easily.

* [Requirements](#Requirements)
* [Setup](#Setup)
* [Usage](#Usage)
* [Notes](#Notes)

![SchemaSpy screenshot](http://schemaspy.org/img/example_page.png "SchemaSpy screenshot")

## Requirements:
* [Java 8+](https://www.oracle.com/technetwork/java/javase/overview/java8-2100321.html)
* JDBC driver for your database
* [Graphviz](https://graphviz.gitlab.io)


## Setup

* Download jar file from the official [schemaspy site](https://github.com/schemaspy/schemaspy/releases) ([direct link](https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar))
* Download postgres jdbc driver from the official [postgresql site](https://jdbc.postgresql.org/download.html) ([direct link](https://jdbc.postgresql.org/download/postgresql-9.4.1208.jre6.jar))
* Download and setup Graphviz tool
    - Windows
        * Download a zip file from the [link](https://graphviz.gitlab.io/_pages/Download/Download_windows.html)
        * Unpack it in the same directory where you store your jar files
    - Ubuntu/Debian
        * ```sudo apt install graphviz```
        * Check installation: ```dot -V```
    - CentOS 7
        * Download source code from [here](https://graphviz.gitlab.io/_pages/Download/Download_source.html)
        * Unpack it: ```tar xzf graphviz*.tar.gz```
        * Go into the new directory with source code: ```cd graphviz*```
        * Fix a problem with PNG (details [here](https://gitlab.com/graphviz/graphviz/issues/1414)):
            - Install graphic driver: ```sudo yum install gd-devel```
            - Enable HAVE_GD_PNG flag inside the config.h.im file: ```sed -i 's/#undef HAVE_GD_PNG/#define HAVE_GD_PNG/g' config.h.im```
        * Pre-build configuration: ```./configure```
        * Build the source code: ```make```
        * Install into the system: ```sudo make install```
        * Check installation: ```dot -V```
        * You should see no problem and see a version of the tool.


## Usage
```bash
java -jar schemaspy-6.1.0.jar -dp postgresql-9.4.1208.jre6.jar \
    -t pgsql -host localhost -port 5432 \
    -db devdb -u devuser -p devpa66 \
    -o ~/db-schema-dir
```
Inside the ~/db-schema-dir a static site will be generated which you can open in your browser or upload it to the web server.

If you need more detailed output for the SchemaSpy, then you can specify a java environment variables **root.log.level** in the command line:
```bash
java -jar schemaspy-6.1.0.jar
-Droot.log.level=TRACE
-dp ...
```

Useful usage script for Postgresql database:
```bash
#!/usr/bin/env bash
# script: create-db-schema-documentation.sh

# Load all system environments
. ./.env
# Create output directory
output=${OUTPUT:-"./build/db-schema"}
rm -rf "${output}"; mkdir -p "${output}" 2>/dev/null

schema=
if [ -n "${PGSCHEMA}" ]; then
    schema="-s ${PGSCHEMA}"
fi
echo "Create database schema: postgres://${PGUSER}:*****@${PGHOST}:${PGPORT}/${PGDATABASE}"
echo "Output directory ${output}"
java -jar ./schemaspy-6.1.0.jar \
    -dp ./postgresql-9.4.1208.jre6.jar \
    -t pgsql -host "${PGHOST}" -port ${PGPORT} \
    -db "${PGDATABASE}" -u "${PGUSER}" -p "${PGPASSWORD}" ${schema} \
    -o "${output}" || exit 1
echo "Success. Try to open ${output}/index.html in your default browser."
open "${output}/index.html"
```

## Notes

Tested and work good with the versions:
* **schemaspy-6.1.0.jar**
* **postgresql-9.4.1208.jre6.jar**
* **graphviz-2.38.win.zip** - for Windows
* **graphviz-2.40.1.src.tar.gz** - for CentOS 7

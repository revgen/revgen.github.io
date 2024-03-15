#!/bin/sh
cd "$(dirname "${0}")/.."
echo "Working directory '$(pwd)'"
. repo.conf
rm -rvf ./${SITE_PATH} 2>/dev/null
rm -rvf ./${SITE_SRC}/public 2>/dev/null

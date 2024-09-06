#!/bin/sh
PORT=8080

cd "$(dirname "${0}")/.."
echo "Working directory '$(pwd)'"
. ./repo.conf
if [ ! -d "${SITE_SRC}" ]; then echo "Error: ${SITE_SRC} not exists"; exit 1; fi
mkdir -p "${SITE_SRC}/public"
export SITE_PATH="${SITE_SRC}/public"
./scripts/create-site-config.sh

echo "Start server in ${SITE_SRC} directory"
echo "Web server: http://localhost:${PORT}"

docker run -it --rm \
        -v "$(pwd):/work" \
        -w /work \
        -p ${PORT}:${PORT} \
        hugomods/hugo:base-0.120.3 \
        hugo server -D --source "${SITE_SRC}"  --bind 0.0.0.0 --port ${PORT}



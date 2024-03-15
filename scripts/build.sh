#!/bin/sh
cd "$(dirname "${0}")/.."
echo "Working directory '$(pwd)'"
. repo.conf

build_site() {
    if [ ! -d "${SITE_SRC}" ]; then echo "Error: ${SITE_SRC} not exists"; exit 1; fi
    hugo --config ./hugo.toml --source ./${SITE_SRC} --destination ../${SITE_PATH} --minify
}

build_site
./scripts/create-site-config.sh

echo "Done" && echo ""
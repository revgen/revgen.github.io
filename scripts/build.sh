#!/bin/sh
cd "$(dirname "${0}")/.."
echo "Working directory '$(pwd)'"
. ./repo.conf

build_site() {
    if [ ! -d "${SITE_SRC}" ]; then echo "Error: ${SITE_SRC} not exists"; exit 1; fi
    if [ -n "${GITHUB_ACTION}" ]; then
        hugo --config ./hugo.toml --source ./${SITE_SRC} --destination ../${SITE_PATH} --minify --verbose
    else
        docker run -it --rm \
            -v "$(pwd):/work" \
            -w /work \
            hugomods/hugo:base-0.120.3 \
            hugo --config ./hugo.toml --source ./${SITE_SRC} --destination ../${SITE_PATH} --minify --verbose
    fi
}

build_site
./scripts/create-site-config.sh

# fix browseconfig.yml file
(
    cd "${SITE_PATH}"
    echo "Fix browserconfig.xml..."
    mv browserconfig.xml browserconfig.xml.orig
    sed 's/\&lt;/\</g' browserconfig.xml.orig > browserconfig.xml
    rm -f browserconfig.xml.orig
)

echo "Done" && echo ""
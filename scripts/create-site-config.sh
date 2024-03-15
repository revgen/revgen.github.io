#!/bin/sh
cd "$(dirname "${0}")/.."
echo "Working directory '$(pwd)'"
if [ -z "${SITE_PATH}" ]; then . repo.conf; fi

create_site_config_file() {
    if [ ! -d "${SITE_PATH}" ]; then echo "Error: ${SITE_PATH} not exists"; exit 1; fi
    # We expect to be inside the _site directory
    GITHUB_SERVER_URL="${GITHUB_SERVER_URL:-"local"}"
    GITHUB_REPOSITORY="${GITHUB_REPOSITORY:-"site"}"
    GITHUB_SHA="${GITHUB_SHA:-"$(echo "${GITHUB_SERVER_URL}" | sha1sum  | awk '{print $1}')"}"
    HUGO_THEME="$(grep theme "${SITE_SRC}/hugo.toml" | cut -d'"' -f2)"
    CONFIG_FILE="${SITE_PATH}/config.json"
    echo "Create ${CONFIG_FILE} file"
    (
        echo "{"
        echo "   \"id\": \"${GITHUB_SHA}\","
        echo "   \"source\": \"${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}\","
        echo "   \"updated\": \"$(date -u +'%FT%T%z')\","
        echo "   \"engine\": \"hugo+${HUGO_THEME}\""
        echo "}"
    ) > "${CONFIG_FILE}"
}
create_site_config_file

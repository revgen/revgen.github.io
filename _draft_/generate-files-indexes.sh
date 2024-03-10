#!/usr/bin/env bash
cd "$(dirname "${0}")"
output="${PWD}/content/files/wallpapers.md"
cd ./static/images/wallpapers/

echo "Create file header into the ${output}"
mkdir -p "$(dirname "${output}")" >/dev/null

echo '+++' > "${output}"
echo 'title = "Wallpapers"' >> "${output}"
echo 'categories = ["files"]' >> "${output}"
echo 'tags = ["images"]' >> "${output}"
echo '+++' >> "${output}"

find . -iname "*.jpg" -or -iname "*.sh" | while read f; do
    name="$(basename "${f}")"
    echo "Write ${name} into the ${output}"
    echo "[![${name}](/images/wallpapers/${name})](/images/wallpapers/${name})" >> "${output}"

done

echo "Done"

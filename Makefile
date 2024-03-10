site_name := revgen

_build:
	docker compose run build && mv -v ./src/$(site_name)/public ./public && echo "Done\n"

info:
	echo "Site '$(site_name)' content:" && tree  ./public

clean:
	rm -rvf ./public 2>/dev/null

build: clean _build info

serve:
	cd ./public && python3 -m http.server 8080

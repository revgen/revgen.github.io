site_name := revgen
site_path := docs

_build:
	docker compose run build && mv -v ./src/$(site_name)/public ./docs && echo "Done\n"

info:
	echo "Site '$(site_name)' content:" && tree  ./$(site_path)

clean:
	rm -rvf ./$(site_path) 2>/dev/null

build: clean _build info

serve:
	cd ./$(site_path) && python3 -m http.server 8080

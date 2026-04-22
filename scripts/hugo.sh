#!/bin/sh
docker run --rm -it -v $(pwd):/src klakegg/hugo:0.101.0 "${@}"


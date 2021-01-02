#!/usr/bin/env bash
show_help() { echo "Usage: $(basename "${0}") <build/serve/clean>"; exit 1; }

case "${1:-"dev"}" in
    help|--help) show_help ;;
    dev) "${0}" clean && "${0}" build && "${0}" serve ;;
    build) hugo ;;
    serve) hugo serve -D ;;
    clean) rm -rvf ./public ./resources ;;
    *) echo "Error: unknown '${1}' command."; exit 1;;
esac


#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

fail () {
  echo "Usage: error_handling.sh <person>"
  exit 1
}

print_greeting () {
  local -r name="${1}"
  echo "Hello, ${name}"
}

main () {
  if [[ "$#" = 1 ]]; then
    print_greeting "${1}"
  else
    fail
  fi
}

main "$@"

#!/usr/bin/env bash

main () {
  local -r text="${1}"
  rev <<<"${text}"
}

main "$@"

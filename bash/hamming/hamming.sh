#!/usr/bin/env bash

fail() {
  local -r msg="${1}"
  echo "${msg}"
  exit 1
}

main() {
  local -r strand_a="${1}"
  local -r strand_b="${2}"

  [[ "$#" -lt 2 ]] && \
    fail "Usage: hamming.sh <string1> <string2>"

  [[ "${#strand_a}" -ne "${#strand_b}" ]] && \
    fail "strands must be of equal length"
  
  cmp -l <(echo "${strand_a}") <(echo "${strand_b}") | wc -l
}

main "$@"

#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

divisible_by() {
  local -r divisor="${1}"
  local -r dividend="${2}"
  ((dividend % divisor == 0))
}

main() {
  local -r n="${1}"
  divisible_by 3 "${n}" && result+="Pling"
  divisible_by 5 "${n}" && result+="Plang"
  divisible_by 7 "${n}" && result+="Plong"
  echo "${result:-${n}}"
}

main "$@"

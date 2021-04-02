#!/usr/bin/env bash

set -o nounset
set -o pipefail
set -o errexit

is_int () {
  local -r candidate="${1}"
  # [ is a portable way of checking if numbers are integers
  [ "${candidate}" -eq "${candidate}" ] 2>/dev/null
}

fail () {
  echo "Usage: leap.sh <year>"
  exit 1
}

divisible_by () {
  local -r divisor="${1}"
  local -r dividend="${2}"
  [[ $(("${dividend}" % "${divisor}")) -eq 0 ]]
}

is_leap_year () {
  local -r year="${1}"
  divisible_by 400 "${year}" || (divisible_by 4 "${year}" && ! divisible_by 100 "${year}")
}

main () {
  if [ "$#" -eq 1 ] && is_int "${1}"; then
    local -r year="${1}"
  else
    fail
  fi

  if is_leap_year "${year}"; then
    echo true
  else
    echo false
  fi
}

main "$@"

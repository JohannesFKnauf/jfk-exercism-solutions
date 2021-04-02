#!/usr/bin/env bash

color_code () {
  local -r color="${1}"
  case "${color}" in    
    black) echo -n 0;;
    brown) echo -n 1;;
    red) echo -n 2;;
    orange) echo -n 3;;
    yellow) echo -n 4;;
    green) echo -n 5;;
    blue) echo -n 6;;
    violet) echo -n 7;;
    grey) echo -n 8;;
    white) echo -n 9;;
    *) echo "invalid color: '${color}'"; exit 1;;
  esac
}

main () {
  local -r first_color="${1}"
  local -r second_color="${2}"
  
  color_code "${first_color}"
  color_code "${second_color}"
}

main "$@"

#!/usr/bin/env bash
# shellcheck disable=SC2155
# set -x
# set -eou pipefail
#
# Program: CarWatch
# Description: Send alerts via SMS when the temperature gets too hot and we need
# to open our car's windows. If night or rain is coming, it will alert you to
# close the windows..
#
# Author: Maxime Daraiche <maxiscoding@gmail.com>
#
#/ Usage: SCRIPTNAME [OPTIONS]... [ARGUMENTS]...
#/
#/ 
#/ OPTIONS
#/   -h, --help
#/                Print this help message
#/
#/ EXAMPLES
#/

# Boy, what a very useful wizardry, jolly good !
usage() { grep '^#/' "$0" | cut -c4-; exit 0; }

weather_endpoint="https://api.open-meteo.com/v1/"
weather_query="forecast?latitude=45.42&longitude=-73.48&current_weather=true"

parse_args() {
  for i in "$@"; do
    case "$i" in
      help)
	usage
	;;
    esac
  done
}

main() {
  parse_args "$@"

  curl "${weather_endpoint}${weather_query}"
}

main "$@"

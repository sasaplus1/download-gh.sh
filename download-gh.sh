#!/bin/bash

# set -x

set -euo pipefail

__main() {
  unset -f __main

  local dir=

  if [ -z "${1-}" ]
  then
    dir="$PWD"
  else
    dir="$1"
  fi

  if [ ! -d "$dir" ]
  then
    echo "$dir is not a directory" >&2
    return 1
  fi

  local arch=

  case "$(uname -m)" in
    *386)   arch=386   ;;
    arm64)  arch=arm64 ;;
    armv*)  arch=armv6 ;;
    x86_64) arch=amd64 ;;
  esac

  local os=
  local ext=

  case "$(uname -s)" in
    Darwin)
      os=macOS
      ext=zip
      ;;
    Linux)
      os=linux
      ext=tar.gz
      ;;
  esac

  local -r version=2.69.0
  local -r url="https://github.com/cli/cli/releases/download/v${version}/gh_${version}_${os}_${arch}.${ext}"
  local -r archive="${dir}/gh.${ext}"

  curl -fsSL -o "$archive" "$url"
}
__main "$@"

# vim:list:ts=2

#!/bin/bash

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

  local kernel=

  case "$(uname -s)" in
    Darwin) kernel=macOS ;;
    Linux)  kernel=linux ;;
  esac

  # NOTE: gh for Apple Silicon is not found currently
  if [ "$arch" == 'arm64' ] && [ "$kernel" == 'macOS' ]
  then
    arch=amd64
  fi

  local -r version=2.6.0
  local -r url="https://github.com/cli/cli/releases/download/v${version}/gh_${version}_${kernel}_${arch}.tar.gz"
  local -r tgz="${dir}/gh.tar.gz"

  curl -fsSL -o "$tgz" "$url"
}
__main "$@"

# vim:list:ts=2

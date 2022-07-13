#!/usr/bin/env bash

# Utility for cloning github repos
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

set -euo pipefail

function usage()
{
    echo "usage ${0} [--dry-run] [--debug] [--fork] <path>"
    echo "where <path> is the repository path, i.e. github.com/weaveworks/weave-gitops"
    echo " will also extract this from https or git repository urls"
    echo "This script will create the appropriate directory sub tree under $HOME/go/src"
    echo "then clones the repository if the final element of the path does not exist"
    echo "if the repository directory already exists, it does a pull"
    echo "defaults to using github.com if <path> is no a full url"
}

function args() {
  dry_run=""
  fork=""
  server="github.com"
  unset path

  arg_list=( "$@" )
  arg_count=${#arg_list[@]}
  arg_index=0
  while (( arg_index < arg_count )); do
    case "${arg_list[${arg_index}]}" in
          "--debug") set -x;;
        "--dry-run") dry_run="echo ";;
          "--fork") fork=1;;
               "-h") usage; exit;;
           "--help") usage; exit;;
               "-?") usage; exit;;
        *) if [ "${arg_list[${arg_index}]:0:2}" == "--" ];then
               echo "invalid argument: ${arg_list[${arg_index}]}"
               usage; exit
           fi;
           break;;
    esac
    (( arg_index+=1 ))
  done
  path="${arg_list[*]:$arg_index:$(( arg_count - arg_index + 1))}"
  if [ -z "${path:-}" ] ; then
      usage; exit 1
  fi
  if [[ "${path:0:4}" == "git@" ]] ;then
    path="${path:(4)}"
    server=$(echo $path | cut -f1 -d:)
  fi
  if [[ "${path:0:8}" == "https://" ]] ;then
    path="${path:(8)}"
    server=$(echo $path | cut -f1 -d/)
  fi
  if [[ "${path:(-4)}" == ".git" ]] ;then
    echo "path=$path"
    path="${path::-4}"
    echo "path=$path"
  fi
  path="$(echo "${path}" | sed 's#\:#/#')"
}

args "$@"

repo=$(basename "${HOME}/go/src/${path}")
dir=$(dirname "${HOME}/go/src/${path}")
org=$(basename "${dir}")
dir=$(dirname "${dir}")
server=${server:-$(basename "${dir}")}
if [ -n "${fork}" ] ; then
  org=paulcarlton-ww
fi

if [ ! -e "${HOME}/go/src/${path}/.git" ] ; then
    $dry_run mkdir -p "${HOME}/go/src/${path}"
    $dry_run git clone git@${server}:"${org}"/"${repo}".git "${HOME}/go/src/${path}"
fi

echo "${HOME}/go/src/${path}"

$dry_run git -C "${HOME}/go/src/${path}" pull







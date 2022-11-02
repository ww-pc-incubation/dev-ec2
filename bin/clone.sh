#!/usr/bin/env bash

# Utility for cloning github repos
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

set -euo pipefail

function usage()
{
    echo "usage ${0} [--dry-run] [--debug] [--fork] <path>" >&2
    echo "where <path> is the repository path, i.e. github.com/weaveworks/weave-gitops" >&2
    echo " will also extract this from https or git repository urls" >&2
    echo "This script will create the appropriate directory sub tree under $HOME/go/src" >&2
    echo "The base directory can be set to something different by setting BASE_DIR environmental variable" >&2
    echo "then clones the repository if the final element of the path does not exist" >&2
    echo "if the repository directory already exists, it does a pull" >&2
    echo "defaults to using github.com if <path> is no a full url" >&2
}

function args() {
  dry_run=""
  fork=""
  server="github.com"
  base_dir=${BASE_DIR:-$HOME/go/src}
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
               echo "invalid argument: ${arg_list[${arg_index}]}" >&2
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
    path="${path::-4}"
  fi
  path="$(echo "${path}" | sed 's#\:#/#')"
}

args "$@"

repo=$(basename "$base_dir/${path}")
dir=$(dirname "$base_dir/${path}")
org=$(basename "${dir}")
dir=$(dirname "${dir}")
server=${server:-$(basename "${dir}")}
if [ -n "${fork}" ] ; then
  org=paulcarlton-ww
fi

if [ ! -e "$base_dir/${path}/.git" ] ; then
    $dry_run mkdir -p "$base_dir/${path}" >&2
    $dry_run git clone git@${server}:"${org}"/"${repo}".git "$base_dir/${path}" >&2
fi

echo "$base_dir/${path}"
pushd "$base_dir/${path}" >/dev/null
default_branch="$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')"
current_branch="$(git rev-parse --abbrev-ref HEAD)"
popd >/dev/null
if [ "$current_branch" == "$default_branch" ]; then
  $dry_run git -C "$base_dir/${path}" pull 1>&2
else
  echo "Warning existing clone of repo, not on default branch, not pulling" >&2
  exit 1
fi

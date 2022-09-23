#!/usr/bin/env bash

# Utility for applying terraform plan
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

set -euo pipefail

function usage()
{
    echo "usage ${0} [--dry-run] [--debug] " >&2
    echo "This script will apply the terraform plan to create an instance and deploy a kind cluster" >&2
    echo "specify '--dry-run' option to just display plan and skip apply" >&2
}

function args() {
  dry_run=""

  arg_list=( "$@" )
  arg_count=${#arg_list[@]}
  arg_index=0
  while (( arg_index < arg_count )); do
    case "${arg_list[${arg_index}]}" in
          "--debug") set -x;;
        "--dry-run") dry_run="1";;
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
}

args "$@"

bucket_name=$(terraform -chdir=remote-state output -json outs | jq -r '.bucket_id')
terraform -chdir=instance  init -backend-config="bucket=$bucket_name" -backend-config="key=instance"
terraform -chdir=instance validate
my_ip=$(curl -s ifconfig.me)
export TF_VAR_github_token=$GITHUB_TOKEN
terraform -chdir=instance plan -out /tmp/instance-plan-$$ -var "source_ip=$my_ip"
if [ -z "$dry_run" ]; then
  terraform -chdir=instance apply -auto-approve /tmp/instance-plan-$$
else
  echo "dry run, repeat without --dry-run option to apply" >&2
fi

#!/usr/bin/env bash

# Utility for connecting to instance via SSH
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

set -euo pipefail

function usage()
{
    echo "usage ${0} [--debug] [--setup] " >&2
    echo "This script will connect to the instance using ssh" >&2
    echo "specify '--setup' option on first connect to update known hosts and copy files to instance"
}

function args() {
  setup=""

  arg_list=( "$@" )
  arg_count=${#arg_list[@]}
  arg_index=0
  while (( arg_index < arg_count )); do
    case "${arg_list[${arg_index}]}" in
          "--debug") set -x;;
          "--setup") setup="1";;
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

ec2_ip=$(terraform -chdir=instance output -json outs | jq -r '.public_ip')
if [ -z "$PRIV_KEY" ]; then
  echo "please export PRIV_KEY environmental variable containing path to ssh private key file" >&2
  exit 1
fi
if [ -n "$setup" ]; then
  ssh-keyscan -H $ec2_ip >> ~/.ssh/known_hosts
  scp -i $PRIV_KEY ~/.gitconfig ec2-user@${ec2_ip}:
  [ -n "$WGE_ENTITLEMENT_FILE" ] && scp -i $PRIV_KEY $WGE_ENTITLEMENT_FILE ec2-user@${ec2_ip}:
fi
ssh -i $PRIV_KEY ec2-user@$ec2_ip

#!/usr/bin/env bash

# Utility for setting up client to access instance and k8s cluster
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

set -euo pipefail

function usage()
{
    echo "usage ${0} [--debug] " >&2
    echo "This script will configure the /etc/hosts file to map the instance name to the instance public IP address and" >&2
    echo "copy the kind cluster kube config to the local machine, updating it to replace the private ip with the public IP" >&2
}

function args() {

  arg_list=( "$@" )
  arg_count=${#arg_list[@]}
  arg_index=0
  while (( arg_index < arg_count )); do
    case "${arg_list[${arg_index}]}" in
          "--debug") set -x;;
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
instance_id=$(terraform -chdir=instance output -json outs | jq -r '.instance_id')
region=${AWS_REGION:-$(aws configure get region)}
instance_name=$(aws ec2 describe-tags --filters "Name=resource-id,Values=${instance_id}" --region $region | jq -r '.Tags[] | select (."Key" == "Name")| .Value')
ec2_ip=$(terraform -chdir=instance output -json outs | jq -r '.public_ip')
sudo sed -i "" "/${instance_name}$/d" /etc/hosts
cp -f /etc/hosts /tmp/hosts
echo "$ec2_ip $instance_name" >> /tmp/hosts
sudo bash -c 'cat /tmp/hosts >>/etc/hosts'
ssh-keygen -R  $instance_name

scp ec2-user@$instance_name:/etc/ec2-dev/kind-bootstrap.kubeconfig ~/info/$instance_name-config.yaml 
local_ip=$(ssh ec2-user@$instance_name curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
sed -i "" "sGserver\:\ https\://$local_ip\:6443Gserver\:\ https\://$ec2_ip\:6443G" ~/info/$instance_name-config.yaml
echo "export KUBECONFIG=~/info/$instance_name-config.yaml"
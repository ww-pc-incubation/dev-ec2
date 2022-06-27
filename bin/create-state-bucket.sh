#!/usr/bin/env bash

# Utility for creating s3 bucket and object to store terraform plan
# Version: 1.0
# Author: Paul Carlton (mailto:paul.carlton@weave.works)

set -euo pipefail

export repo_dir=$(git rev-parse --show-toplevel)

function usage()
{
    echo "usage ${0} [--debug] [--region <aws-region>  --bucket <bucket-name> --prefix <prefix>] "
    echo "use '--region' to optionally specify an AWS region, defaults to AWS_REGION environmental variable name"
    echo "use '--bucket' to optionally specify a bucket name, defaults to 'terraform-state'"
    echo "use '--object' <prefix> is the object name"
    echo "Creates s3 bucket with empty object"
}

function args() {
  aws_region=${AWS_REGION:-}
  bucket_name=terraform-state
  debug=""
  arg_list=( "$@" )
  arg_count=${#arg_list[@]}
  arg_index=0
  while (( arg_index < arg_count )); do
    case "${arg_list[${arg_index}]}" in
          "--region") (( arg_index+=1 ));aws_region="${arg_list[${arg_index}]}";;
          "--debug") set -x; debug="--debug";;
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

  if [ -z "$aws_region" ]; then
    echo "AWS region must be specified, either using the '--region' option or setting AWS_REGION environmental variable"
    usage; exit 1
  fi
}

args "$@"

# Create s3 bucket if it does not exist
if [ ! -z "$(aws s3 ls s3://$BUCKET_NAME 2>/dev/null)" ]; then
    echo "Bucket already exists"
else
    # Create s3 bucket
    echo "Creating bucket: $bucket_name"
    # ToDo: set encryption and access
    aws s3 mb s3://$bucket_name --region $aws_region
fi

# Create prefix if it does not exist
if [ ! -z "$(aws s3 ls s3://$BUCKET_NAME/$PREFIX 2>/dev/null)" ]; then
    echo "Prefix already exists"
else
    # Create s3 prefix for region
    echo "Creating prefix: $PREFIX"
    mkdir -p $PREFIX
    aws s3 cp --recursive $PREFIX s3://$BUCKET_NAME --region $REGION
    rm -rf $PREFIX
fi


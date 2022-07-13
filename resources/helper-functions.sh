#!/usr/bin/env bash

export host_id=`hostname`

function set-title(){
  if [[ $OSTYPE == darwin* ]] ; then
    echo -n -e "\033]0;$1\007"
    return
  fi
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  sep=""
  if [[ -n "$*" ]] ; then
    sep="-"
  fi
  TITLE="\[\e]2;$host_id$sep$*\a\]"
  PS1=${ORIG}${TITLE}
}

function add_to_path() {
    new_path="${1:-}"
    if [ -z "${new_path}" ]; then
        echo "no path provided"
        return 1
    fi

    if { show-path.sh | grep -q "^${new_path}$"; }; then
        echo "path already contains: $new_path"
        return
    fi
    PATH="$PATH:${new_path}"
}

function SetAWSCreds () {
    INSTANCE_ROLE=$(aws sts get-caller-identity | jq -r '."Arn"' | cut -f 2 -d/)
    TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    iam=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/$INSTANCE_ROLE)
    export AWS_REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '."region"')
    export AWS_ACCESS_KEY_ID=$(echo $iam | jq -r '."AccessKeyId"')
    export AWS_SECRET_ACCESS_KEY=$(echo $iam | jq -r '."SecretAccessKey"')
    export AWS_SESSION_TOKEN=$(echo $iam | jq -r '."Token"')
}

function GetParamValue() {
    local key=${1:-}
    if [ -z "$key" ]; then
        echo "ssm parameter key not provided"
        exit 1
    fi
    local value="$(aws ssm get-parameter --name  ${key} --region $AWS_REGION --with-decryption | jq -r '."Parameter"["Value"]')"
    echo ${value}
}

function PutParamValue() {
    local key=${1:-}
    if [ -z "$key" ]; then
        echo "ssm parameter key not provided"
        exit 1
    fi
    local value=${2:-}
    if [ -z "$value" ]; then
        echo "ssm parameter value not provided"
        exit 1
    fi
    local type=${3:-"String"}
    if [ -z "$type" ]; then
        echo "ssm parameter type not provided"
        exit 1
    fi
    if [ "$type" == "SecureString" ]; then
        local kms_key=${4:-}
        if [ -z "$kms_key" ]; then
            echo "ssm parameter kms key not provided"
            exit 1
        fi
    fi
    aws ssm put-parameter --name  ${key} --region $AWS_REGION --value "$value" --type $type --key-id $kms_key --overwrite
    echo ${value}
}


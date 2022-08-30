#!/usr/bin/env bash
set -x

source /etc/ec2-dev/aws-config.sh
source /etc/ec2-dev/helper-functions.sh

#eksctl anywhere create cluster -f /etc/ec2-dev/eksa-bootstrap.yaml
#chmod 644 ${PWD}/eksa-bootstrap/eksa-bootstrap.kubeconfig
#mv ${PWD}/eksa-bootstrap/eksa-bootstrap.kubeconfig /etc/ec2-dev/eksa-bootstrap.kubeconfig
#export KUBECONFIG=/etc/ec2-dev/eksa-bootstrap.kubeconfig

export KUBECONFIG=/etc/ec2-dev/kind-bootstrap.kubeconfig
kind create cluster --config /etc/ec2-dev/kind.yaml
chmod 644 /etc/ec2-dev/kind-bootstrap.kubeconfig

export GITHUB_TOKEN="$(GetParamValue ${GITHUB_TOKEN_SSM_PARAM})"

ssh-keyscan -t rsa github.com | tee github-key-temp | ssh-keygen -lf -
cat github-key-temp >> /home/ec2-user/.ssh/known_hosts
chown ec2-user:ec2-user /home/ec2-user/.ssh/known_hosts

gh repo create $MGMT_ORG/$MGMT_REPO --public

flux bootstrap github --owner=$MGMT_ORG --repository=$MGMT_REPO --private=false --personal=false --path clusters/management

clusterawsadm bootstrap iam create-cloudformation-stack
export AWS_B64ENCODED_CREDENTIALS=$(clusterawsadm bootstrap credentials encode-as-profile)
export EXP_EKS=true
export EXP_MACHINE_POOL=true
export CAPA_EKS_IAM=true
export EXP_CLUSTER_RESOURCE_SET=true
clusterctl init --core=cluster-api:v1.1.3 --infrastructure aws,azure -v 99



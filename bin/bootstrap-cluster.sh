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
cat github-key-temp >> ~/.ssh/known_hosts

gh repo create $MGMT_ORG/$MGMT_REPO --public > /tmp/repo-create.txt 2>&1 
if [ "$?" != "0" ]; then
  grep "Name already exists on this account" /tmp/repo-create.txt
  if [ "$?" == "0" ]; then
    clone.sh github.com/$MGMT_ORG/$MGMT_REPO
  fi
else
  cat /tmp/repo-create.txt
fi
mkdir  -p /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO
chown -R ec2-user:ec2-user /home/ec2-user
pushd /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO
git config --global init.defaultBranch main
git init
echo "# Management cluster" > README.md
mkdir -p clusters/bootstrap
touch clusters/bootstrap/.keep
mkdir -p clusters/mgmt
touch clusters/mgmt/.keep
chown -R ec2-user:ec2-user /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO
git config --global --add safe.directory /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO
git add -A
git commit --all --message "init commit"
git branch -M main
git push --set-upstream https://$GITHUB_TOKEN@github.com/$MGMT_ORG/$MGMT_REPO.git main
flux bootstrap github --owner=$MGMT_ORG --repository=$MGMT_REPO --private=false --personal=false --path clusters/bootstrap
git pull
popd

clusterawsadm bootstrap iam create-cloudformation-stack
export AWS_B64ENCODED_CREDENTIALS=$(clusterawsadm bootstrap credentials encode-as-profile)
export EXP_EKS=true
export EXP_MACHINE_POOL=true
export CAPA_EKS_IAM=true
export EXP_CLUSTER_RESOURCE_SET=true
clusterctl init --core=cluster-api:v1.1.3 --infrastructure aws,azure -v 99

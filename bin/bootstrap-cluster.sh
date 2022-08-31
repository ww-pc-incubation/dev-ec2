#!/usr/bin/env bash
set -x

source /etc/ec2-dev/aws-config.sh
source /etc/ec2-dev/helper-functions.sh

export KUBECONFIG=/etc/ec2-dev/kind-bootstrap.kubeconfig

kind get clusters 2>&1 | grep "^kind$" >/dev/null
if [ "$?" == "0" ]; then
  kind delete cluster --name kind
fi

export INSTANCE_IP="$(curl http://169.254.169.254/latest/meta-data/local-ipv4)"
export INSTANCE_PUB="$(curl http://169.254.169.254/latest/meta-data/public-ipv4)"
cat /etc/ec2-dev/kind-template.yaml | envsubst > /etc/ec2-dev/kind.yaml
kind create cluster --config /etc/ec2-dev/kind.yaml
chown ec2-user:ec2-user /etc/ec2-dev/kind-bootstrap.kubeconfig

export GITHUB_TOKEN="$(GetParamValue ${GITHUB_TOKEN_SSM_PARAM})"

ssh-keyscan -t rsa github.com | tee github-key-temp | ssh-keygen -lf -
cat github-key-temp >> /home/ec2-user/.ssh/known_hosts
chown ec2-user:ec2-user /home/ec2-user/.ssh/known_hosts

git ls-remote https://github.com/$MGMT_ORG/$MGMT_REPO >/dev/null
if [ "$?" == "0" ]; then
  gh repo delete $MGMT_ORG/$MGMT_REPO --confirm
fi

gh repo create $MGMT_ORG/$MGMT_REPO --public

if [ -d /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO ]; then
  echo "existing /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO directory, moving to /tmp/$MGMT_REPO-$$"
  mv /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO /tmp/$MGMT_REPO-$$
fi 

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/tigera-operator.yaml

echo "Waiting for Calico tigera-operator to be ready"
sleep 5
kubectl wait deployment -n tigera-operator tigera-operator --for condition=Available=True

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/custom-resources.yaml

flux bootstrap github --owner=$MGMT_ORG --repository=$MGMT_REPO --private=false --personal=false --path clusters/management


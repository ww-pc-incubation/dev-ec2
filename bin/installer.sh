#!/usr/bin/env bash
set -x

export PATH=$PATH:/usr/local/bin

install-awscli.sh

s3-download.sh

curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

curl -LO "https://dl.k8s.io/release/v1.22.9/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

sudo yum install -y docker
sudo usermod -a -G docker ec2-user
id ec2-user
sudo systemctl enable docker.service
sudo systemctl start docker.service
curl -s https://fluxcd.io/install.sh | sudo bash

curl -LO https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# download kubebuilder and install locally.
curl -s -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
chmod +x kubebuilder && mv kubebuilder /usr/local/bin/
sudo yum install golang -y

curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin v1.46.2

curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh v4.5.5 /usr/local/bin"  | bash /usr/local/bin

curl "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
    --silent --location \
    | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin/

export EKSA_RELEASE="0.10.1" OS="$(uname -s | tr A-Z a-z)" RELEASE_NUMBER=15
curl "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/${RELEASE_NUMBER}/artifacts/eks-a/v${EKSA_RELEASE}/${OS}/amd64/eksctl-anywhere-v${EKSA_RELEASE}-${OS}-amd64.tar.gz" \
    --silent --location \
    | tar xz ./eksctl-anywhere
sudo mv ./eksctl-anywhere /usr/local/bin/

wget https://github.com/cli/cli/releases/download/v2.14.1/gh_2.14.1_linux_386.rpm
sudo rpm -i gh_2.14.1_linux_386.rpm

if [ -f /etc/ec2-dev/bashrc.sh ]; then
  cat /etc/ec2-dev/bashrc.sh >> /home/ec2-user/.bashrc
fi


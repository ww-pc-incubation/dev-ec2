#!/usr/bin/env bash
set -x

export PATH=$PATH:/usr/local/bin

amazon-linux-extras install epel -y

echo "Updating system packages & installing required utilities"
yum-config-manager --enable epel
yum update -y
yum install -y jq curl unzip git
curl $curl_proxy_opt "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
sudo yum install -y session-manager-plugin.rpm

echo "Installing AWS CLI"
TMPDIR=$(mktemp -d)
cd $TMPDIR
echo "Downloading AWS CLI"
curl $curl_proxy_opt "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip >/dev/null
./aws/install >/dev/null

echo "Installing SSM Agent"
yum install -y https://s3.$AWS_REGION.amazonaws.com/amazon-ssm-$AWS_REGION/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
systemctl status amazon-ssm-agent

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

if [ -f /etc/bashrc.sh ]; then
  cat /etc/bashrc.sh >> /home/ec2-user/.bashrc
fi

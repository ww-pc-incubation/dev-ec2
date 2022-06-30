#!/usr/bin/env bash

set -x

export HOME=/home/ec2-user

Install () {
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
    mkdir -p //bin && mv ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH
    echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
    curl -LO "https://dl.k8s.io/release/v1.22.9/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm kubectl
    sudo yum install -y docker
    sudo usermod -a -G docker ec2-user
    id ec2-user
    sudo systemctl enable docker.service
    sudo systemctl start docker.service
    curl -s https://fluxcd.io/install.sh | sudo bash
}

Install


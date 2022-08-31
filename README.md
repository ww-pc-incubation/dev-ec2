# Create AWS resources

This repository contains Terraform files for creating and ec2 instance.

## Setup

Install [AWS CLI version 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
Install [Terraform client](https://learn.hashicorp.com/tutorials/terraform/install-cli)

Clone this repository, e.g.

```bash
cd <path to clone of directory>
export PATH=$PATH:$PWD/bin
```

To deploy an ec2 instance you need AWS credentials for and Admin user in the target AWS account.

Create an S3 bucket to use for the Terraform state:

```bash
terrafrom -chdir remote-state init
terraform -chdir=remote-state plan -out /tmp/plan-$$
terraform -chdir=remote-state apply "/tmp/plan-$$"
```

To deploy the instance:

```bash
bucket_name=$(terraform -chdir=remote-state output -json outs | jq -r '.bucket_id')
terraform -chdir=instance  init -backend-config="bucket=$bucket_name" -backend-config="key=instance"
terraform -chdir=instance validate
my_ip=$(curl -s ifconfig.me)
export TF_VAR_github_token=$GITHUB_TOKEN
terraform -chdir=instance plan -out /tmp/instance-plan-$$ -var "source_ip=$my_ip"
terraform -chdir=instance apply -auto-approve /tmp/instance-plan-$$
```

To access the instance:

```bash
instance_id=$(terraform -chdir=instance output -json outs | jq -r '.instance_id')
region=${AWS_REGION:-$(aws configure get region)}
aws ssm start-session --region $region --target $instance_id
```

or

```bash
PRIV_KEY=<path to private key file>
WGE_ENTITLEMENT_FILE=<path to WGE entitlement file>
ec2_ip=$(terraform -chdir=instance output -json outs | jq -r '.public_ip')
ssh-keyscan -H $ec2_ip >> ~/.ssh/known_hosts
scp  ~/.gitconfig ec2-user@${ec2_ip}:
[ -n "$WGE_ENTITLEMENT_FILE" ] && scp -i $PRIV_KEY -o "StrictHostKeyChecking no" $WGE_ENTITLEMENT_FILE ec2-user@${ec2_ip}:
ssh -i $PRIV_KEY -o "StrictHostKeyChecking no" ec2-user@$ec2_ip
```

Wait for the cloud init script to run `bootstrap-cluster.sh` and then `run wge-setup.sh` to configure WGE management cluster.

To check for cluster configuration...

```bash
sudo grep "Your management cluster has been initialized" /var/log/cloud-init-output.log
```

Verify cluster using...

```bash
kubectl get pods -A
```

Then run WGE setup...

```bash
wge-setup.sh
```

To remove the resources:

```bash
my_ip=$(curl -s ifconfig.me)
terraform -chdir=instance destroy -auto-approve -var "source_ip=$my_ip"
```

## Client Configuration

To configure your local machine to use this instance add an entry to /etc/hosts for the instance, then add the Host to your `.ssh/config` file

```bash
Host <host name>
  HostName <host name>
  User ec2-user
  IdentityFile <path to private key file>
```

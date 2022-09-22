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

Wait for the cloud init script to run `bootstrap-cluster.sh` and then run `wge-setup.sh` to configure WGE management cluster.

To check for cluster configuration...

```bash
sudo grep "all components are healthy" /var/log/cloud-init-output.log
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

Alternatively add an entry to your /etc/hosts file for the instance name.

```bash
instance_id=$(terraform -chdir=instance output -json outs | jq -r '.instance_id')
region=${AWS_REGION:-$(aws configure get region)}
instance_name=$(aws ec2 describe-tags --filters "Name=resource-id,Values=${instance_id}" --region $region | jq -r '.Tags[] | select (."Key" == "Name")| .Value')
ec2_ip=$(terraform -chdir=instance output -json outs | jq -r '.public_ip')
echo "$ec2_ip $instance_name" >> /tmp/hosts
sudo sed -i "" "/${instance_name}$/d" /etc/hosts
sudo bash -c 'cat /tmp/hosts >>/etc/hosts'
ssh-keygen -R  $instance_name
```
Then you can access the host using

```bash
ssh -i $PRIV_KEY ec2-user@$instance_name
```

To setup client access to Kubernetes cluster

```bash
scp -i $PRIV_KEY ec2-user@$instance_name:/etc/ec2-dev/kind-bootstrap.kubeconfig ~/info/$instance_name-config.yaml 
local_ip=$(ssh -i $PRIV_KEY ec2-user@$instance_name curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
sed -i "" "sGserver\:\ https\://$local_ip\:6443Gserver\:\ https\://$ec2_ip\:6443G" ~/info/$instance_name-config.yaml
export KUBECONFIG=~/info/$instance_name-config.yaml
```

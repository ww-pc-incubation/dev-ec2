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
tf-setup.sh
```

To deploy the instance, use `--dry-run` option to display plan and not perform apply:

```bash
tf-apply.sh
```

To access the instance use the `ssh-connect.sh` utility, specifying the `--setup` option on first use.
Note that this will need to be repeated after the cloud init script has completed because the bashrc is updated by cloud init.

```bash
PRIV_KEY=<path to private key file>
WGE_ENTITLEMENT_FILE=<path to WGE entitlement file>
ssh-connect.sh --setup
```

If you need to use SSM to connect to the instance:

```bash
instance_id=$(terraform -chdir=instance output -json outs | jq -r '.instance_id')
region=${AWS_REGION:-$(aws configure get region)}
aws ssm start-session --region $region --target $instance_id
```

Wait for the cloud init script to run `bootstrap-cluster.sh` and then run `wge-setup.sh` to configure WGE management cluster.

To check for cluster configuration, ssh to instance and grep cloud init log...

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

To configure your local machine to use this instance add it to your `.ssh/config` file:

```bash
Host <instance name>
  HostName <instance name>
  User ec2-user
  IdentityFile <path to private key file>
```

To add an entry to your /etc/hosts file for the instance name and setup client access to Kubernetes cluster

```bash
client-setup.sh
```

Then you can access the host using

```bash
ssh <instance name>
```

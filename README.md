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
terraform -chdir=remote-state apply "/tmp/plan-69027"
bucket_name=$(terraform -chdir=remote-state output -json outs | jq -r '.bucket_id')
```

To deploy the instance:

```bash
terraform -chdir=instance  init -backend-config="bucket=$bucket_name" -backend-config="key=instance"
terraform -chdir=instance validate
my_ip=$(curl -s ifconfig.me)
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
ec2_ip=$(terraform -chdir=instance output -json outs | jq -r '.public_ip')
ssh -i <ssh private key file> ec2-user@$ec2_ip
```

To remove the resources:

```bash
terraform -chdir=instance destroy -auto-approve -var "source_ip=$my_ip"
```

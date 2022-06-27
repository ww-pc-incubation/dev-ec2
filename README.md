# Create AWS resources

This repository contains Terraform files for creating and ec2 instance.

## Setup

Install [AWS CLI version 2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html).
Install [Terraform client](https://learn.hashicorp.com/tutorials/terraform/install-cli)

Clone this repository, e.g.

    cd <path to clone of directory>
    export PATH=$PATH:$PWD/bin

To deploy an ec2 instance you need AWS credentials for and Admin user in the target AWS account.

Create an S3 bucket to use for the Terraform state:

    create-state-bucket.sh --bucket <bucket name> [--region <AWS region>]

e.g.

    create-state-bucket.sh --bucket tf-state --region $AWS_REGION

To deploy the resources:

    terraform-init.sh
    terraform-plan.sh
    terraform-apply.sh

To remove the resources:

    terraform-destroy.sh

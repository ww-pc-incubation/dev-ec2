terrafrom -chdir remote-state init
terraform -chdir=remote-state plan -out /tmp/plan-$$
terraform -chdir=remote-state apply "/tmp/plan-69027"
bucket_name=$(terraform -chdir=remote-state output -json outs | jq -r '.bucket_id')
terraform -chdir=vpc  init -backend-config="bucket=$bucket_name" -backend-config="key=vpc"
terraform -chdir=vpc validate
terraform -chdir=vpc plan -out /tmp/vpc-plan-$$ 
terraform -chdir=vpc apply -auto-approve /tmp/vpc-plan-$$ 
vpc_id=$(terraform -chdir=vpc output -json vpc | jq -r '.vpc_id')
az=a
public_subnet_id=$(terraform -chdir=vpc output -json public_subnets | jq -r --arg z "$az" '.[$z]')
private_subnet_id=$(terraform -chdir=vpc output -json private_subnets | jq -r --arg z "$az" '.[$z]')
terraform -chdir=instance  init -backend-config="bucket=$bucket_name" -backend-config="key=instance"
terraform -chdir=instance validate
terraform -chdir=instance plan -out /tmp/instance-plan-$$ -var "public_subnet_id=$public_subnet_id"
terraform -chdir=instance apply -auto-approve /tmp/instance-plan-$$ 

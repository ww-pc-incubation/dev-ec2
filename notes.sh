terrafrom -chdir remote-state init
terraform -chdir=remote-state plan -out /tmp/plan-$$
terraform -chdir=remote-state apply "/tmp/plan-69027"
bucket_name=$(terraform -chdir=remote-state output -json outs | jq -r '.bucket_id')
terraform -chdir=vpc  init -backend-config="bucket=$bucket_name"
terraform -chdir=vpc validate
terraform -chdir=vpc plan -out /tmp/vpc-plan-$$ 
terraform -chdir=vpc apply /tmp/vpc-plan-$$ 

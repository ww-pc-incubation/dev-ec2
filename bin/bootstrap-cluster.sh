#!/usr/bin/env bash

source /etc/ec2-dev/aws-config.sh
source /etc/ec2-dev/helper-functions.sh


pushd /etc

# export ISSUER_HOSTPATH=s3-$AWS_REGION.amazonaws.com/$CONFIG_BUCKET

# cat <<EOF > discovery.json
# {
#     "issuer": "https://$ISSUER_HOSTPATH",
#     "jwks_uri": "https://$ISSUER_HOSTPATH/keys.json",
#     "authorization_endpoint": "urn:kubernetes:programmatic_authorization",
#     "response_types_supported": [
#         "id_token"
#     ],
#     "subject_types_supported": [
#         "public"
#     ],
#     "id_token_signing_alg_values_supported": [
#         "RS256"
#     ],
#     "claims_supported": [
#         "sub",
#         "iss"
#     ]
# }
# EOF

# aws s3 cp --acl public-read ./discovery.json s3://$CONFIG_BUCKET/.well-known/openid-configuration

eksctl anywhere create cluster -f /etc/ec2-dev/eksa-bootstrap.yaml
export KUBECONFIG=${PWD}/eksa-bootstrap/eksa-bootstrap-eks-a-cluster.kubeconfig
chmod 644 ${PWD}/eksa-bootstrap/eksa-bootstrap-eks-a-cluster.kubeconfig
mv ${PWD}/eksa-bootstrap/eksa-bootstrap-eks-a-cluster.kubeconfig /etc/eksa-bootstrap/eksa-bootstrap.kubeconfig
export GITHUB_TOKEN="$(GetParamValue ${GITHUB_TOKEN_SSM_PARAM})"

gh repo create $MGMT_ORG/$MGMT_REPO --public
mkdir  -p /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO
chown -R ec2-user /home/ec2-user/go/github.com
cd /home/ec2-user/go/src/github.com/$MGMT_ORG/$MGMT_REPO
git init
echo "# Management cluster" > README.md
touch clusters/bootstrap/.keep
touch clusters/mgmt/.keep
git add -A
git commit --all --message "init commit"
git branch -M main
git remote add origin git@github.com:$MGMT_ORG/$MGMT_REPO.git
git push -u origin main
chown -R ec2-user /home/ec2-user/go/github.com/$MGMT_ORG/$MGMT_REPO
flux bootstrap github --owner=$MGMT_ORG --repository=$MGMT_REPO --private=false --personal=false --path clusters/bootstrap
popd
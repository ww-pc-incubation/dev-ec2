#!/usr/bin/env bash
set -x

template_dir="$(clone.sh github.com/ww-pc-incubation/wge-gitops-template)"
cd `clone.sh github.com/$MGMT_ORG/$MGMT_REPO`

cp -rf ${template_dir}/addons clusters/management
git add -A;git commit -a -m "deploy standard addons"; git push
flux reconcile source git flux-system -n flux-system 
flux reconcile kustomization flux-system -n flux-system 

echo " Waiting for Sealed Secret Controller to be ready"
sleep 5
kubectl wait deployment -n kube-system sealed-secrets-controller --for condition=Available=True

kubeseal --fetch-cert > clusters/management/pub-cert.pem
kubeseal --format=yaml --cert=clusters/management/pub-cert.pem < ~/entitlement.yaml > clusters/management/addons/wge-entitlement.yaml
git add -A;git commit -a -m "add WGE entitlement sealed secret"; git push
flux reconcile source git flux-system -n flux-system
flux reconcile kustomization flux-system -n flux-system

ADMIN_PASSWORD="$(date +%s | sha256sum | base64 | head -c 10)"
BCRYPT_PASSWD=$(echo -n $ADMIN_PASSWORD | gitops get bcrypt-hash)

kubectl create secret generic cluster-user-auth \
  --namespace flux-system \
  --from-literal=username=wego-admin \
  --from-literal=password="$BCRYPT_PASSWD" \
  --dry-run=client -o yaml > ~/cluster-user-auth.yaml

kubeseal --format=yaml --cert=clusters/management/pub-cert.pem < ~/cluster-user-auth.yaml > clusters/management/addons/wge-password.yaml
git add -A;git commit -a -m "add WGE password sealed secret"; git push
flux reconcile source git flux-system -n flux-system
flux reconcile kustomization flux-system -n flux-system

for file_name in `ls -C1 ${template_dir}/templates`
do 
  cat ${template_dir}/templates/${file_name} | envsubst > clusters/management/addons/${file_name}
done

git add -A;git commit -a -m "add templated addons"; git push
flux reconcile source git flux-system -n flux-system
flux reconcile kustomization flux-system -n flux-system

aws iam get-role --role-name eks-controlplane.cluster-api-provider-aws.sigs.k8s.io >/dev/null 2>&1
if [ "$?" != "0" ]; then
  clusterawsadm bootstrap iam create-cloudformation-stack
fi

export AWS_B64ENCODED_CREDENTIALS=$(clusterawsadm bootstrap credentials encode-as-profile)
export EXP_EKS=true
export EXP_MACHINE_POOL=true
export CAPA_EKS_IAM=true
export EXP_CLUSTER_RESOURCE_SET=true

kubectl get deployments.apps  -n capi-system capi-controller-manager >/dev/null
if [ "$?" != "0" ]; then
  clusterctl init --core=cluster-api:v1.1.3 --infrastructure aws,azure -v 99
fi

echo "WGE Admin Password: $ADMIN_PASSWORD"

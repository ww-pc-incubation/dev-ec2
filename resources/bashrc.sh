export AWS_PAGER=
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/bin:$(go env GOPATH)/bin:$PATH
command -v mockgen >/dev/null || go install github.com/golang/mock/mockgen@v1.6.0
command -v kubectl >/dev/null &&  source <(kubectl completion bash)
command -v flux >/dev/null && . <(flux completion bash)
command -v kubebuilder >/dev/null && . <(kubebuilder completion bash)

export KUBECONFIG=/etc/ec2-dev/kind-bootstrap.kubeconfig

mkdir -p info # Create directory for secrets

source /etc/ec2-dev/aws-config.sh
source /etc/ec2-dev/helper-functions.sh
sudo /usr/local/bin/s3-download.sh

export GITHUB_TOKEN="$(GetParamValue ${GITHUB_TOKEN_SSM_PARAM})"


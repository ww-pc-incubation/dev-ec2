export AWS_PAGER=
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/bin:$(go env GOPATH)/bin:$PATH
command -v mockgen >/dev/null || go install github.com/golang/mock/mockgen@v1.6.0 >/dev/null 2>&1 &
command -v kubectl >/dev/null &&  source <(kubectl completion bash)
command -v flux >/dev/null && . <(flux completion bash)
command -v kubebuilder >/dev/null && . <(kubebuilder completion bash)


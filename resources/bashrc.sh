export PATH=\$HOME/bin:$PATH

command -v kubectl >/dev/null &  source <(kubectl completion bash)
command -v flux >/dev/null && . <(flux completion bash)
export AWS_PAGER=
export PATH=\$HOME/bin:$PATH
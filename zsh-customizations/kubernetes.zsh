export KUBECONFIG=$HOME/.kube/config:$HOME/.kube-config/config.yml

function k8s_get_all_node_ips () {
  kubectl get nodes -l node-role.kubernetes.io/node= -o json | jq '.items[].status.addresses[] | select(.type == "InternalIP") | .address' -r
}



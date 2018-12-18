#export KUBECONFIG=$HOME/.kube/config:$HOME/.kube-config/config.yml
export KUBECONFIG=$HOME/.kube/config; for i in $(ls $HOME/.kube/config.d/*); do export KUBECONFIG=$KUBECONFIG:$i; done


function k8s_get_nodes_with_taints () {
  kubectl get nodes -o go-template='{{- range .items}}{{- if $taint := (index .spec "taints") }}{{- .metadata.name }}{{ "\t" }}{{- range $taint }}{{- .key }}={{ .value }}:{{ .effect }}{{ "\t" }}{{- end }}{{- "\n" }}{{- end}}{{- end}}'
}

function k8s_get_master_ips () {
  kubectl get nodes -l kubernetes.io/role=master -o custom-columns=NAME:.metadata.name,IP:".status.addresses[0].address"
}

function k8s_get_all_node_ips() {
  kubectl get nodes -o custom-columns=NAME:.metadata.name,IP:".status.addresses[0].address",ROLE:".metadata.labels['kubernetes\.io/role']"
}



data "kubectl_path_documents" "docs1" {
  pattern = "./grafana/*.yaml"
}

data "kubectl_path_documents" "docs2" {
  pattern = "./prometheus/*.yaml"
}

resource "kubectl_manifest" "prometheus" {
  for_each  = toset(data.kubectl_path_documents.docs1.documents)
  yaml_body = each.value
}

resource "kubectl_manifest" "grafana" {
  for_each  = toset(data.kubectl_path_documents.docs2.documents)
  yaml_body = each.value
}

data "kubectl_path_documents" "docs3" {
  pattern = "./kube-state-metrics/*.yaml"
}

resource "kubectl_manifest" "kube-state-metrics" {
  for_each  = toset(data.kubectl_path_documents.docs3.documents)
  yaml_body = each.value
}
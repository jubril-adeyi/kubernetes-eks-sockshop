// Creating a aata for the sock-shop manifest

data "kubectl_file_documents" "docs" {
  content = file("sock-shop.yaml")
}

//create sock-shop namespace

# resource "kubernetes_namespace" "kube-namespace-socks" {
#   metadata {
#     name = "sock-shop"
#   }
# }


// Creating a kubectl manifest resource for sock-shop manifest 

resource "kubectl_manifest" "kube-deployment-socks" {
  for_each  = data.kubectl_file_documents.docs.manifests
  yaml_body = each.value
}
# for_each picks every individual manifest in the whole pile of manifests
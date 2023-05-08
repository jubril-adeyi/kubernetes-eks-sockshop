// Creating Kubernetes secret for login credentials for postgres 

resource "kubernetes_secret" "postgres-credentials" {
  metadata {
    name = "postgres-credentials"
    namespace = kubernetes_namespace.web-app.metadata[0].name
  }

  data = {
    user     = var.postgres-username
    password = base64encode(var.postgres-password)
  }

  type = "Opaque"
}
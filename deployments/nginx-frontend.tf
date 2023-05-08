// crreating namespace for argocd 

resource "kubernetes_namespace" "web-app" {
  metadata {
    name = "web-app"
  }
}

//nginx web-app deployment

resource "kubernetes_deployment" "web-app" {
  metadata {
    name      = "web-app"
    namespace = kubernetes_namespace.web-app.metadata[0].name
    labels = {
      app = "web-app"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "web-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-app"
        }
      }

      spec {
        container {
          name  = "web-app"
          image = var.docker-image

          env {
            name  = "POSTGRES_HOST"
            value = var.postgres-host
          }

          env {
            name  = "POSTGRES_DB"
            value = var.postgres-db
          }

          env {
            name  = "POSTGRES_PORT"
            value = var.postgres-port
          }

          # env {
          #   name  = "POSTGRES_USER"
          #   value = var.postgres-username
          # }

          env {
            name = "POSTGRES_USER"

            value_from {
              secret_key_ref {
                name = kubernetes_secret.postgres-credentials.metadata.0.name
                key  = "user"
              }
            }
          }

          env {
            name = "POSTGRES_PASSWORD"

            value_from {
              secret_key_ref {
                name = kubernetes_secret.postgres-credentials.metadata.0.name
                key  = "password"
              }
            }
          }
          port {
            container_port = 80
          }
        }
      }
    }
  }
  # depends_on = [
  #   aws_eks_node_group.eks-node-grp
  # ]
}

//nginx web-app service (loadBalancer)

resource "kubernetes_service" "web-app-service" {
  metadata {
    name      = "web-app-service"
    namespace = kubernetes_namespace.web-app.metadata[0].name
  }

  spec {
    selector = {
      app = "web-app"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
  depends_on = [
    kubernetes_deployment.web-app
  ]
}

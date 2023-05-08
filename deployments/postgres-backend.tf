
// Creating postgres deployment 

resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres-deployment"
    namespace = kubernetes_namespace.web-app.metadata[0].name
  }
  spec {
    selector {
      match_labels = {
        app = "postgres"
      }
    }

    replicas = 1
    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:latest"

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
            container_port = 5432
          }

          volume_mount {
            name       = "postgres-storage"
            mount_path = "/var/lib/postgresql/data"
          }
        }

        volume {
          name = "postgres-storage"
          empty_dir {}
        }
      }
    }
  }
}
// Creation of Postgres service (ClusterIP)

resource "kubernetes_service" "postgres" {
  metadata {
    name = "postgres-service"
    namespace = kubernetes_namespace.web-app.metadata[0].name
  }
  spec {
    selector = {
      app = "postgres"
    }
    port {
      name        = "postgres"
      protocol    = "TCP"
      port        = 5432
      target_port = 5432
    }
    type = "ClusterIP"
  }
}

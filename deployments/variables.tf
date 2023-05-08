variable "docker-image" {
  type    = string
  default = "slickboy/jb-web:latest"
}
variable "postgres-username" {
  type    = string
  default = "postgres"
}
variable "postgres-password" {
  type    = string
  default = "postgres"
}
variable "postgres-db" {
  type    = string
  default = "postgres"
}

variable "postgres-host" {
  type    = string
  default = "postgres"
}
variable "postgres-port" {
  type    = string
  default = "5432"
}

variable "cluster-name" {
  type    = string
  default = "Cluster-01"
}


variable "k8s_api_version" {
  type    = string
  default = "client.authentication.k8s.io/v1beta1"
}



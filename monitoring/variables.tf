variable "access_key" {
  type    = string
  default = ""
}
variable "secret_key" {
  type    = string
  default = ""
}

variable "cluster-name" {
  type    = string
  default = "Cluster-01"
}


variable "k8s_api_version" {
  type    = string
  default = "client.authentication.k8s.io/v1beta1"
}

variable "bucket_name" {
  type    = string
  default = "terra-tfstate-2229"
}
variable "dynamo-db-name" {
  type    = string
  default = "terra-tfstate-2229"
}



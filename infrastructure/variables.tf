# // vpc variables 


variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "sets the region"
}

variable "cidr_blocks" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc CIDR blocks"
}


# // sg variables 
variable "inbound_ports" {
  type        = list(number)
  default     = [0]
  description = "ports for the inbound rules"
}

///eks-cluster variables

variable "cluster-name" {
  type    = string
  default = "Cluster-01"
}

variable "ssh_key_name" {
  type    = string
  default = "key"
}

variable "k8s_api_version" {
  type    = string
  default = "client.authentication.k8s.io/v1beta1"
}

variable "node-instance-type" {
  type    = string
  default = "t3.medium"
}

// backend crdentials

variable "bucket_name" {
  type    = string
  default = "terra-tfstate-2228"
}
variable "dynamo-db-name" {
  type    = string
  default = "terra-statelock-2228"
}


#### deployment variables 

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



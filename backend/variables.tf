
variable "access_key" {
  type    = string
  default = ""
}
variable "secret_key" {
  type    = string
  default = ""
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "bucket_name" {
  type    = string
  default = "terra-tfstate-2228"
}
variable "dynamo-db-name" {
  type    = string
  default = "terra-tfstate-2228"
}

// invoking the backend 

# terraform {
#   backend "s3" {
#     bucket         = "terra-tfstate-2228"
#     key            = "global/infrastructure/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terra-statelock-2228"
#     encrypt        = true
#   }
# }

terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = var.key
    region         = var.region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }
}

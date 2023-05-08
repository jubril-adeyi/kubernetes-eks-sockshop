// invoking the backend 

terraform {
  backend "s3" {
    bucket         = "terra-tfstate-2228"
    key            = "global/infrastructure/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terra-statelock-2228"
    encrypt        = true
  }
}
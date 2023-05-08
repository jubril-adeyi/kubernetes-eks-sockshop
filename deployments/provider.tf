 // invoke backend for  providers 

terraform {
  backend "s3" {
    bucket         = "terra-tfstate-2228"
    key            = "global/deployment/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terra-statelock-2228"
    encrypt        = true
  }
}

// kubenetes provider block to define provider

data "aws_eks_cluster" "my-eks-cluster" {
  name       = var.cluster-name
}

data "aws_eks_cluster_auth" "my-eks-cluster" {
  name       = var.cluster-name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.my-eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.my-eks-cluster.certificate_authority.0.data)
  exec {
    api_version = var.k8s_api_version
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      var.cluster-name
    ]
  }
}


// kubectl command-line tool provider 


terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

// kubectl config 


provider "kubectl" {
  host                   = data.aws_eks_cluster.my-eks-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.my-eks-cluster.certificate_authority[0].data)
  exec {
    api_version = var.k8s_api_version
    command     = "aws"
    args = ["eks",
      "get-token",
      "--cluster-name",
    var.cluster-name]
  }
}

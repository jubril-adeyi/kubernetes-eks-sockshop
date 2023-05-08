# declaring the provider aws 

provider "aws" {
  region = var.aws_region
}



// kubenetes provider block to define provider

data "aws_eks_cluster" "my-eks-cluster" {
  name       = var.cluster-name
  depends_on = [aws_eks_cluster.eks-cluster]
}

data "aws_eks_cluster_auth" "my-eks-cluster" {
  name       = var.cluster-name
  depends_on = [aws_eks_cluster.eks-cluster]
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

# terraform {
#   required_providers {
#     kubectl = {
#       source  = "gavinbunney/kubectl"
#       version = "1.14.0"
#     }
#   }
# }

# // kubectl config 


# provider "kubectl" {
#   host                   = data.aws_eks_cluster.my-eks-cluster.endpoint
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority[0].data)
#   exec {
#     api_version = var.k8s_api_version
#     command     = "aws"
#     args = ["eks",
#       "get-token",
#       "--cluster-name",
#     var.cluster-name]
#   }
# }

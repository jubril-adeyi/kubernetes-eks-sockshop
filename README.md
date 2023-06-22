# Deployment of sock-shop application on AWS EKS  Using Terraform. 

This repositiory contains terraform code to deploy the sock-shop application on an AWS EKS using terraform. This deployment architecture  wil consist of: 
* A VPC network with 4 subnets (2 private subnets and two public subnets)  in multiple availability zones 
* A Security group for the EKS Cluster 
* An IAM role with necessary permissions/policies for Cluster creation 
* An S3 bucket and Dynamodb table to back up terraform state files 

The deployments made on the provisioned Infrastructure will consist of: 
* Kubernetes deployment and service for an nginx web application frontend 
* Kubernetes deployment, service, and secrets for a postgresql backend application, designed to be integrated with the nginx frontend application 
* The sock-shop Kubernetes application 
* Kubernetes monitoring stack which includes; Prometheus, Grafana and kube-state-metrics.
   
## Prerequisites 
* AWS account IAM credentials with necessary permisions for provision resources
* AWS CLI Installed on your machine 
* Terraform Installed on your machine 

## Getting started 

Follow these steps to get started with provisioning infrastructure using Terraform. 

* Clone this repository to your local machine : 
``
git clone  ..
 ``

* Cd into cloned the directory 
cd terraform-eks-sockshop 

* Cd into the /project directory 
cd /backend 

* Initialize terraform by running the  command : terraform Init 
* Run the terraform plan command to see Preview the changes that will be applied : terraform plan 
* Now Run the Terraform apply command to apply these changes and provision s3 bucket and Dynamodb table that will serve as backup for terraform state files 
* Cd back into main directory and cd into the  /infrastructure directory 
* Re-initialize terraform by running the command: terraform init 
* Run the terraform plan command to see Preview the changes that will be applied : Terraform plan
* Now Run the Terraform apply command to apply these changes and provision infrastructure on AWS: terraform apply 
* 

# Deployment of sock-shop application on AWS EKS  Using Terraform. 

This repository contains terraform code to deploy the sock-shop application on an AWS EKS using terraform. This deployment architecture  wil consist of: 
* VPC network with 4 subnets (2 private subnets and two public subnets)  in multiple availability zones 
* Security group for the EKS Cluster 
* IAM role with necessary permissions/policies for Cluster creation 
* S3 bucket and Dynamodb table to back up terraform state files 

The deployments made on the provisioned Infrastructure will consist of: 
* Kubernetes deployment and service for an nginx web application frontend 
* Kubernetes deployment, service, and secrets for a postgresql backend application, designed to be integrated with the nginx frontend application 
* The sock-shop Kubernetes application 
* Kubernetes monitoring stack which includes; Prometheus, Grafana and kube-state-metrics.
   
## Prerequisites 
* AWS account IAM credentials with necessary permissions for provision resources
* AWS CLI Installed on your machine 
* Terraform Installed on your machine 

## Getting started 

Follow these steps to get started with provisioning infrastructure using Terraform. 

* Clone this repository to your local machine : 
``
git clone https://github.com/jubril-adeyi/terraform-kubernetes-eks-sockshop.git
 ``

* Cd into cloned the directory 
`cd terraform-kubernetes-eks-sockshop`

* Cd into the /backend directory 
`cd /backend`

* Initialize terraform by running the  command : 
`terraform Init `
* Run the terraform plan command to see a Preview of the changes that will be applied : 
`terraform plan`
* Now Run the Terraform apply command to apply these changes and provision s3 bucket and Dynamodb table that will serve as backup for terraform state files
`terraform apply` 
* Cd back into the main directory and cd into the  /infrastructure directory
`cd ../infrastructure `
* Re-initialize terraform by running the command: 
`terraform init`
* Run the terraform plan command to see a Preview of the changes that will be applied : 
`terraform plan`
* Now Run the terraform apply command to apply these changes and provision infrastructure on AWS: 
`terraform apply`
* Cd back into the main directory and cd into the  /deployment  directory 
`cd ../deployment`
* Run the terraform plan command to see a Preview of the changes that will be applied : 
`terraform plan`
* Now Run the Terraform apply command to apply these changes and provision applications Into EKS cluster: 
`terraform apply`
* Finally Cd back into the main directory and cd into the  /monitoring directory 
`cd ../monitoring`
* Run the terraform plan command to see a Preview of the changes that will be applied : 
`terraform plan`
* Now Run the Terraform apply command to apply these changes and provision monitoring applications into EKS Cluster: 
`terraform apply`

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
## Repository Structure:

This repository is structured into four main directories: "/backend", "/infrastructure", "/deployment", and "/monitoring".

1.  <b>Backend directory</b>: The backend directory consists of Terraform scripts that provision an S3 bucket and DynamoDB table to serve as the remote backend.

2. <b>Infrastructure directory</b>: The infrastructure directory contains Terraform code for provisioning the foundational infrastructure for this deployment. It includes invoking the remote backend, setting up the VPC network, creating necessary roles for EKS cluster provisioning, configuring security groups, and deploying the EKS cluster along with its nodes.

3. <b>Deployment directory</b>: The deployment directory contains Terraform code to deploy Kubernetes API objects for the sock shop application. This includes defining deployments, services, and secrets required for running these applications.

4. <b>Monitoring directory</b>: The monitoring directory contains Terraform code responsible for deploying and configuring monitoring applications within the EKS cluster. This directory contains subdirectories that hold Kubernetes manifests for these monitoring applications. The Terraform code utilizes these manifests for the deployment process.

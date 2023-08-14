pipeline {
    agent {
        label "agent01"
    }

    tools {
        terraform 'terraform'
    }
    stages {
        stage('create terraform backend') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'aws-access-key', passwordVariable: 'aws-secret-key', usernameVariable: 'aws-access-key')]) {
                        // Load AWS credentials
                        def awsAccessKeyId = env.'aws-access-key'
                        def awsSecretAccessKey = env.'aws-secret-key'
                        
                        //set AWS credentials 
                        sh 'aws --version'
                        sh "aws configure set aws_access_key_id ${awsAccessKeyId}"
                        sh "aws configure set aws_secret_access_key ${awsSecretAccessKey}"
                        sh "aws configure set region 'us-east-1'"

                        // Retrieve other required environment variables
                        // def awsRegion = sh(returnStdout: true, script: 'aws configure get region').trim()
                        // def bucketName = 'terraformbucket'

                        // // Generate a unique S3 bucket name based on the current timestamp
                        // def uniqueBucketName = "${bucketName}-${System.currentTimeMillis()}"
                        
                        // Create remote backend on AWS using Terraform
                        dir('backend'){sh " terraform init \
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        sh " terraform plan\
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        sh " terraform apply --auto-approve \
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        }
                        // sh "terraform init -backend-config='bucket=${uniqueBucketName}' -backend-config='region=${awsRegion}'"
                        // sh "terraform apply -var 'bucket_name=${uniqueBucketName}'"
                    }
                }
            }
        }
        stage(' deploy infrastructure (including EKS CLuster)'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'aws-access-key', passwordVariable: 'aws-secret-key', usernameVariable: 'aws-access-key')]) {
                        // Load AWS credentials
                        def awsAccessKeyId = env.'aws-access-key'
                        def awsSecretAccessKey = env.'aws-secret-key'
                        
                        //set AWS credentials 
                        sh 'aws --version'
                        sh "aws configure set aws_access_key_id ${awsAccessKeyId}"
                        sh "aws configure set aws_secret_access_key ${awsSecretAccessKey}"
                        sh "aws configure set region 'us-east-1'"
                        
                        // Create EKS infra using Terraform
                        dir('infrastructure'){sh " terraform init \
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        sh " terraform plan\
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        sh " terraform apply --auto-approve \
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        }
                    }
                }
                }
            }
        stage('deploy application on EKS CLuster'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'aws-access-key', passwordVariable: 'aws-secret-key', usernameVariable: 'aws-access-key')]) {
                        // Load AWS credentials
                        def awsAccessKeyId = env.'aws-access-key'
                        def awsSecretAccessKey = env.'aws-secret-key'
                        
                        //set AWS credentials 
                        sh 'aws --version'
                        sh "aws configure set aws_access_key_id ${awsAccessKeyId}"
                        sh "aws configure set aws_secret_access_key ${awsSecretAccessKey}"
                        sh "aws configure set region 'us-east-1'"
                        
                        // Deploy app using Terraform
                        dir('deployments'){sh " terraform init \
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        sh " terraform plan\
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        sh " terraform apply --auto-approve \
                            -var 'access_key=${awsAccessKeyId}' \
                            -var 'secret_key=${awsSecretAccessKey}' "
                        }
                    }
                }
            }
        }
    }
}
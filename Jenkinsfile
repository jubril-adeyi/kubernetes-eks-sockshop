pipeline {
    agent {
        label "agent01"
    }

    tools {
        terraform 'terraform'
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage(terraform-check){
            steps{
                sh "terraform version"
            }
        }

        // stage('Deploy') {
        //     steps {
        //         script {
        //             withCredentials([usernamePassword(credentialsId: 'aws-access-key', passwordVariable: 'aws-secret-key', usernameVariable: 'aws-access-key')]) {
        //                 // Load AWS credentials
        //                 def awsAccessKeyId = env.'aws-access-key'
        //                 def awsSecretAccessKey = env.'aws-secret-key'

        //                 // Install and configure AWS CLI
        //                 sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
        //                 sh 'unzip awscliv2.zip'
        //                 sh './aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update'
        //                 sh "aws configure set aws_access_key_id ${awsAccessKeyId}"
        //                 sh "aws configure set aws_secret_access_key ${awsSecretAccessKey}"

        //                 // Retrieve other required environment variables
        //                 def awsRegion = sh(returnStdout: true, script: 'aws configure get region').trim()
        //                 def bucketName = 'buckioo2227'

        //                 // Generate a unique S3 bucket name based on the current timestamp
        //                 def uniqueBucketName = "${bucketName}-${System.currentTimeMillis()}"

        //                 // Create the S3 bucket using Terraform
        //                 sh "terraform init -backend-config='bucket=${uniqueBucketName}' -backend-config='region=${awsRegion}'"
        //                 sh "terraform apply -var 'bucket_name=${uniqueBucketName}'"
        //             }
        //         }
        //     }
        // }
    }
}

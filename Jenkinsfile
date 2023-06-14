pipeline{ 
    agent{
        label "agent01"
    }
    stages{
        stage('buildt'){
            steps{ 
                sh "echo build"
            }
    }
    }
}

// pipeline {
//     agent {
//         label "agent01"
//     }
    
//     stages {
//         stage('Example') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: 'aws-access-key', passwordVariable: 'aws-secret-key', usernameVariable: 'aws-access-key')]) {
//                     // Your code that requires AWS access credentials
//                     sh 'echo $aws-access-key'  // Access the AWS access key value as an environment variable
//                     sh 'echo $aws-secret-key'  // Access the AWS secret key value as an environment variable
//                     // Add your AWS-related commands or actions here
//                 }
//             }
//         }
//     }
// }


// // pipeline {
// //     agent any

// //     stages {
// //         stage('Checkout') {
// //             steps {
// //                 // Checkout your repository
// //                 checkout scm
// //             }
// //         }

// //         stage('Deploy') {
// //             environment {
// //                 // Load AWS credentials from Jenkins credentials
// //                 AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
// //                 AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
// //             }
// //             steps {
// //                 script {
// //                     // Install and configure AWS CLI
// //                     sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
// //                     sh 'unzip awscliv2.zip'
// //                     sh './aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update'
// //                     sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'
// //                     sh 'aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'
                    
// //                     // Retrieve other required environment variables
// //                     def awsRegion = sh(returnStdout: true, script: 'aws configure get region').trim()
// //                     def bucketName = 'your-bucket-name'

// //                     // Generate a unique S3 bucket name based on the current timestamp
// //                     def uniqueBucketName = "${bucketName}-${System.currentTimeMillis()}"

// //                     // Create the S3 bucket using Terraform
// //                     sh "terraform init -backend-config='bucket=${uniqueBucketName}' -backend-config='region=${awsRegion}'"
// //                     sh "terraform apply -var 'bucket_name=${uniqueBucketName}'"
// //                 }
// //             }
// //         }
// //     }
// // }

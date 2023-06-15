pipeline {
    agent {
        label "agent01"
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('terraform-check'){
            steps{
                sh 'terraform version'
            }
        }

       
    }
}

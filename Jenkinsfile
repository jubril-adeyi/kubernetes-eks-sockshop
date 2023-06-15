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
        stage('terraform'){
            steps{
                sh 'terraform version'
            }
        }

       
    }
}

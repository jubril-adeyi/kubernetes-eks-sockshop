pipeline {
    agent {
        label "agent01"
    }
    tools {
        terraform 'terraform'
        nodejs 'node'
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('terraform'){
            steps{
                sh 'npm version'
                sh 'terraform version'
            }
        }
       
    }
}

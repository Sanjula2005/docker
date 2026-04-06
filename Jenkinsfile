pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sanjula252525/myapp2"
        // This creates variables: DOCKER_HUB_CREDS_USR and DOCKER_HUB_CREDS_PSW
        DOCKER_HUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:latest ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Quotes around the password handle special characters in Windows
                bat "echo \"%DOCKER_HUB_CREDS_PSW%\" | docker login -u %DOCKER_HUB_CREDS_USR% --password-stdin"
            }
        }

        stage('Push Image') {
            steps {
                bat "docker push %DOCKER_IMAGE%:latest"
            }
        }
    }

    post {
        success { echo 'Success!' }
        failure { echo 'Failed - Check credentials or Token permissions.' }
    }
}

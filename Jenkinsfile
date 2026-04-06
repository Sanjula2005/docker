pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sanjula252525/myapp2"
        DOCKER_HUB_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Sanjula2005/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Use bat for Windows environments
                bat "docker build -t ${DOCKER_IMAGE}:latest ."
            }
        }

        stage('Login and Push') {
            steps {
                // Use the credentials directly in a login command
                bat "echo %DOCKER_HUB_CREDS_PSW% | docker login -u %DOCKER_HUB_CREDS_USR% --password-stdin"
                bat "docker push ${DOCKER_IMAGE}:latest"
            }
        }
    }

    post {
        success {
            echo 'Image successfully built and pushed to Docker Hub'
        }
        failure {
            echo 'Pipeline failed'
        }
    }
}

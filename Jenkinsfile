pipeline {
    agent any

    environment {
        // Define the image
        DOCKER_IMAGE = "dwall17/webapp"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the docker image
                    dockerImage = docker.build("$DOCKER_IMAGE",  "-f docker/Dockerfile .")
                }
            }
        }
        
        stage('Push') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts', 'docker') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
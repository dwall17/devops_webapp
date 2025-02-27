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
                    dockerImage = docker.build("$DOCKER_IMAGE",  "-f docker/Dockerfile docker/")
                }
            }
        }
        
        stage('Push') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'docker') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
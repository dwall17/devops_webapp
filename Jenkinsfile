pipeline {
    agent any

    environment {
        // Define the image
        DOCKER_IMAGE = "dwall17/webapp"
        REMOTE_HOST = "98.81.161.18"
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

        stage('Deploy') {
            steps {
               sshagent(['ec2']) {
                sh '''
                    ssh -o StrictHostKeyChecking=no ubuntu@${REMOTE_HOST} "\
                    sudo docker pull ${DOCKER_IMAGE} && \
                    sudo docker stop my_container || true && \
                    sudo docker rm my_container || true && \
                    sudo docker run -d --name my_container -p 80:8000 ${DOCKER_IMAGE}"
                   '''
               }
            }
        }
    }
}
pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the specified branch from GitHub
                git branch: 'main', url: 'https://github.com/Viswaraje/rest-api.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    def image = docker.build("viswaraje/rest-api:latest")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-viswaraje') {
                        image.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Run Docker container in detached mode
                    bat 'docker run -d -p 3001:3000 viswaraje/rest-api:latest'
                }
            }
        }
    }
    post {
        // Cleanup actions
        always {
            script {
                // Optionally, remove the local Docker image to save space
                sh 'docker rmi viswaraje/rest-api:latest || true'
            }
        }
    }
}

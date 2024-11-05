pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Viswaraje/rest-api.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build("viswaraje/rest-api:latest")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-viswaraje') {
                        docker.image("viswaraje/rest-api:latest").push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Remove existing container if it exists
                    sh 'docker rm -f nodejs-api || true'
                    // Run Docker container
                    sh 'docker run -d --name nodejs-api -p 3001:3000 viswaraje/rest-api:latest'
                }
            }
        }
    }
}

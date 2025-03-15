pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDS = credentials('docker-hub-credentials')
        DOCKER_IMAGE = "misturaraheem/mavenwebapp:${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                checkout scm
            }
        }
        
        stage('Build Maven Project') {
            steps {
                // Build the Maven project
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Login') {
            steps {
                // Login to Docker Hub
                sh 'echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin'
            }
        }
        
        stage('Docker Build') {
            steps {
                // Build Docker image
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        
        stage('Docker Push') {
            steps {
                // Push Docker image to Docker Hub
                sh "docker push ${DOCKER_IMAGE}"
            }
        }
    }
    
    post {
        always {
            // Logout from Docker Hub
            sh 'docker logout'
        }
    }
}
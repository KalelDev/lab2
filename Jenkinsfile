pipeline {
    agent any
    tools {
        maven "M3"
    }
    environment {
        DOCKER_CREDENTIALS_ID = 'akhalee1_dockerhub'
        IMAGE_NAME = 'akhalee1/comp367lab3'
    }
    stages {
        stage('Check out') {
            steps {
                checkout scm
            }
        }
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build(IMAGE_NAME)
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                    }
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    docker.image(IMAGE_NAME).push()
                }
            }
        }
    }
}

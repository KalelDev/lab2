pipeline {
    agent any
    tools {
        maven 'M3'
    }
    environment {
        DOCKER_CREDENTIAL_ID = 'akhalee1_dockerhub'
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
                    sh "/opt/homebrew/bin/docker build -t ${env.IMAGE_NAME} ."
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIAL_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin"
                    }
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    sh "docker push ${env.IMAGE_NAME}"
                }
            }
        }
    }
}

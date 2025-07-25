pipeline {
    agent any

    tools {
        maven 'maven3' // Ensure Maven is configured in Jenkins Global Tools Configuration
    }

    environment {
        MAVEN_OPTS = "-Dmaven.repo.local=.m2/repository"
    }

    stages {
        stage('Checkout') {
            steps {
                // This checks out the main branch explicitly
                git branch: 'main', url: 'https://github.com/kingakwa/simple-maven-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        
    post {
always {
    echo 'Pipeline finished.'

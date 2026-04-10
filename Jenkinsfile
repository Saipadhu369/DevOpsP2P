pipeline {
    agent any

    stages {
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mydockerhubuser/myapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push mydockerhubuser/myapp:latest'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8080:8080 mydockerhubuser/myapp:latest'
            }
        }
    }
}

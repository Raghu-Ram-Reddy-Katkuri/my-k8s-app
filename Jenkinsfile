pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Raghu-Ram-Reddy-Katkuri/my-k8s-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t raghuramreddykatkuri/my-k8s-app:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                docker push raghuramreddykatkuri/my-k8s-app:${BUILD_NUMBER}
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                sed -i "s/IMAGE_TAG/${BUILD_NUMBER}/g" k8s/deployment.yaml
                minikube kubectl -- apply -f k8s/deployment.yaml
                minikube kubectl -- apply -f k8s/service.yaml
                '''
            }
        }
    }
}
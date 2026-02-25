pipeline {
agent any
stages {
stage('Checkout from GitHub') {
steps {
git branch: 'master', url: 'https://github.com/laxmi916/node-k8s-app.git'
}
}
stage('Install Dependencies') {
steps { sh 'npm install' }
}
stage('Build Docker Image') {
steps {
sh '''
docker build -t my-k8s-app:${BUILD_NUMBER} .
docker tag my-k8s-app:${BUILD_NUMBER} laxmi916/my-k8s-app:${BUILD_NUMBER}
'''
}
}
stage('Push Docker Image') {
steps {
sh 'docker push laxmi916/my-k8s-app:${BUILD_NUMBER}'
}
}
stage('Deploy to Kubernetes') {
steps {
sh '''
sed -i "s/IMAGE_TAG/${BUILD_NUMBER}/g" k8s/deployment.yaml
minikube image load laxmi916/my-k8s-app:${BUILD_NUMBER}
minikube kubectl -- apply -f k8s/deployment.yaml
minikube kubectl -- apply -f k8s/service.yaml
'''
}
}
}
}
pipeline {
agent any
stages {
stage('Checkout from GitHub') {
steps {
git branch: 'main', url: 'https://github.com/Raghu-Ram-Reddy-Katkuri/my-k8s-app.git'
}
}
stage('Install Dependencies') {
steps { sh 'npm install' }
}
stage('Build Docker Image') {
steps {
sh '''https://github.com/Raghu-Ram-Reddy-Katkuri/my-k8s-app.git
docker build -t my-k8s-app:${BUILD_NUMBER} .
docker tag my-k8s-app:${BUILD_NUMBER} raghuramreddykatkuri/my-k8s-app:${BUILD_NUMBER}
'''
}
}
stage('Push Docker Image') {
steps {
sh 'docker push raghuramreddykatkuri/my-k8s-app:${BUILD_NUMBER}'
}
}
stage('Deploy to Kubernetes') {
steps {
sh '''
sed -i "s/IMAGE_TAG/${BUILD_NUMBER}/g" k8s/deployment.yaml
minikube image load raghuramreddykatkuri/my-k8s-app:${BUILD_NUMBER}
minikube kubectl -- apply -f k8s/deployment.yaml
minikube kubectl -- apply -f k8s/service.yaml
'''
}
}
}
}
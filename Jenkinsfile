pipeline {
   environment {
        KUBECONFIG = '/home/ubuntu/.kube/config'
    }
  agent any
  stages {
     stage('Checkout'){
         steps{
            git 'https://github.com/harshamullapudi/my-website.git'
        }
      }
    stage('Docker Build') {
      steps {
        sh "ls -a"
        sh "docker build -t my-website:${env.BUILD_NUMBER} ."
      }
    }
    stage('Docker Tag and Push') {
      steps {
        sh "docker tag my-website:${env.BUILD_NUMBER} localhost:5000/my-website:${env.BUILD_NUMBER}"
        sh "docker push localhost:5000/my-website:${env.BUILD_NUMBER}"
      }
    }
    stage('Docker Remove Image') {
      steps {
        sh "docker rmi my-website:${env.BUILD_NUMBER}"  
      }
    }
    stage('Apply Kubernetes Files') {
      steps {
         sh 'export KUBECONFIG=/home/ubuntu/.kube/config'
        sh 'cat deployment.yaml | sed "s/{{BUILD_NUMBER}}/$BUILD_NUMBER/g" | kubectl apply -f -' 
      }
    }
  }
}   

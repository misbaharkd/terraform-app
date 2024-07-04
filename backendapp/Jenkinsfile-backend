pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "testbackendduo.azurecr.io/backend"
        ACR_NAME = "testbackendduo"
        AKS_CLUSTER = "your-aks-cluster"
        RESOURCE_GROUP = "your-resource-group"
        NAMESPACE = "default"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/misbaharkd/backendapp'
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry("https://${ACR_NAME}.azurecr.io", 'acr-creds') {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").push()
                    }
                }
            }
        }
        stage('Scan') {
            steps {
                // Use any Docker image scanning tool here
                echo 'Scanning Docker image...'
            }
        }
        stage('Deploy') {
            steps {
                script {
                    kubernetesDeploy(
                        configs: 'k8s-deployment.yml',
                        kubeconfigId: 'kubeconfig',
                        enableConfigSubstitution: true
                    )
                }
            }
        }
    }
}


pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "YOUR_DOCKERHUB_USERNAME/devsecops-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh '''
                    python3 -m venv .venv
                    . .venv/bin/activate
                    pip install --no-cache-dir -r app/requirements.txt
                    pytest -v app/tests
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                      -f docker/Dockerfile \
                      -t ${DOCKER_IMAGE}:${IMAGE_TAG} \
                      -t ${DOCKER_IMAGE}:latest \
                      .
                '''
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh '''
                    trivy image \
                      --severity HIGH,CRITICAL \
                      --exit-code 1 \
                      ${DOCKER_IMAGE}:${IMAGE_TAG}
                '''
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "${DOCKER_PASSWORD}" | docker login \
                          --username "${DOCKER_USERNAME}" \
                          --password-stdin

                        docker push ${DOCKER_IMAGE}:${IMAGE_TAG}
                        docker push ${DOCKER_IMAGE}:latest

                        docker logout
                    '''
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'aws-region',
                        variable: 'AWS_REGION'
                    )
                ]) {
                    sh '''
                        aws eks update-kubeconfig \
                          --region "${AWS_REGION}" \
                          --name "devsecops-cicd-cluster"

                        kubectl apply -f k8s/namespace.yaml
                        kubectl apply -f k8s/configmap.yaml

                        sed "s|YOUR_DOCKERHUB_USERNAME/devsecops-app:1.0.0|${DOCKER_IMAGE}:${IMAGE_TAG}|g" \
                          k8s/deployment.yaml | kubectl apply -f -

                        kubectl apply -f k8s/service.yaml
                        kubectl apply -f k8s/hpa.yaml
                        kubectl apply -f k8s/ingress.yaml

                        kubectl rollout status \
                          deployment/devsecops-app \
                          --namespace devsecops \
                          --timeout=180s
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    kubectl get pods \
                      --namespace devsecops

                    kubectl get service \
                      --namespace devsecops

                    kubectl get ingress \
                      --namespace devsecops
                '''
            }
        }
    }

    post {

        success {
            echo 'DevSecOps pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed. Check the stage logs for details.'
        }

        always {
            sh '''
                docker image prune -f || true
            '''
        }
    }
}

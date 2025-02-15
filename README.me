

# **Microservices Deployment on AWS EKS with CI/CD using GitHub Actions**

This project demonstrates the automated deployment of **10 microservices** on **AWS EKS (Elastic Kubernetes Service)** using **CI/CD pipelines** powered by **GitHub Actions**. The infrastructure is provisioned using **Terraform**, and Kubernetes is used for deploying and managing the microservices. Docker is employed for containerization, ensuring scalable and efficient management of the services.

---

## **Table of Contents**

- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Repository Structure](#repository-structure)
- [Infrastructure Setup](#infrastructure-setup)
  - [Provisioning the AWS EKS Cluster](#provisioning-the-aws-eks-cluster)
- [Kubernetes Configuration](#kubernetes-configuration)
  - [Manifests](#manifests)
  - [Scaling and Frontend Exposure](#scaling-and-frontend-exposure)
- [CI/CD Pipeline Setup](#cicd-pipeline-setup)
- [Automated Deployment Process](#automated-deployment-process)
- [Secrets Management](#secrets-management)
- [Conclusion](#conclusion)

---

## **Overview**

This project involves setting up a fully automated CI/CD pipeline for deploying **10 microservices** on **AWS EKS**. It uses **GitHub Actions** for automation, **Terraform** for infrastructure provisioning, and **Kubernetes** for managing the services. The microservices are containerized using **Docker**, and the deployment is fully automated to ensure scalability, availability, and performance.

---

## **Technologies Used**

- **AWS EKS** (Elastic Kubernetes Service) for running and managing Kubernetes clusters
- **Terraform** for provisioning AWS infrastructure, including VPC, subnets, EKS cluster, and IAM roles
- **Kubernetes** for orchestrating microservices, including Pods, Deployments, Services, ConfigMaps, and Horizontal Pod Autoscalers
- **GitHub Actions** for continuous integration and continuous deployment (CI/CD) automation
- **Docker** for containerizing microservices and managing Docker images
- **AWS CLI** for interacting with AWS resources

---

## **Repository Structure**

The repository is organized into the following directories:

- **`Microservices-deployment/`**: Contains the application code for each of the 10 microservices. Each microservice is in a separate branch.
    - Branches:
      - `frontend`
      - `checkoutservice`
      - `currencyservice`
      - `productcatalogservice`
      - `cartservice`
      - `shippingservice`
      - `paymentservice`
      - `emailservice`
      - `adservice`
      - `recommendationservice`

- **`kubernetes-manifest/`**: Contains Kubernetes manifests for deploying and managing microservices in the EKS cluster.
    - `deployments/`
    - `services/`
    - `configmaps/`
    - `hpa/`
    - Find the files [here](https://github.com/janisadhi/Microservices-deployment/tree/main/kubernetes-manifest)

- **`.github/workflows/`**: Contains GitHub Actions workflow files for each microservice, automating the CI/CD process.

---

## **Infrastructure Setup**

### **Provisioning the AWS EKS Cluster**

1. **Terraform Configuration**:
    - The infrastructure is provisioned using Terraform, which sets up the AWS resources, including the EKS cluster, VPC, subnets, and IAM roles.
    - Follow the guide [Learn Terraform Provision EKS Cluster](https://github.com/hashicorp-education/learn-terraform-provision-eks-cluster) to provision the AWS resources.

2. **Resources**:
    - **EKS Cluster**: Managed Kubernetes service to deploy and run the microservices.
    - **Worker Nodes**: EC2 instances running the application containers.

---

## **Kubernetes Configuration**

### **Manifests**

The Kubernetes configuration defines the deployment and management of the microservices. Key resources include:

1. **Deployment**: Specifies how the application pods should be run.
2. **Service**: Exposes the application internally within the Kubernetes cluster.
3. **ConfigMap**: Stores configuration values for the microservices.
4. **Horizontal Pod Autoscaler (HPA)**: Autoscaling based on CPU utilization (set to 80%).

### **Scaling and Frontend Exposure**

- **Horizontal Pod Autoscaling (HPA)** is used to automatically scale pods based on CPU utilization.
- The **frontend service** is exposed externally using an **Nginx reverse proxy**. The reverse proxy routes traffic through a load balancer to the frontend, which runs on port 8080 and is mapped to port 80 for public access.

---

## **CI/CD Pipeline Setup**

### **GitHub Actions Workflows**

Each branch has a corresponding GitHub Actions workflow that automates the build and deployment process for its respective microservice. 

Here’s an example for the `frontend` service:

```yaml
name: frontend CI/CD

on:
  push:
    branches:
      - frontend
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_PASSWORD }}

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Build and push Docker image
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ${{ secrets.DOCKERHUB_USERNAME }}/frontend:latest

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Kubernetes
        uses: azure/setup-kubectl@v3
        with:
          version: 'v1.29.13'

      - name: Configure kubectl
        run: |
          mkdir -p ~/.kube
          echo "${{ secrets.KUBE_CONFIG }}" > ~/.kube/config

      - name: Set up kubectl context
        run: |
          kubectl config use-context ${{ secrets.KUBE_CONTEXT }}

      - name: Set up AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ secrets.AWS_REGION }}

      - name: Deploy application to Kubernetes
        run: |
          kubectl config set-context --current --namespace=microservices
          kubectl set image deployment/frontend frontend-container=${{ secrets.DOCKERHUB_USERNAME }}/frontend:latest
          kubectl rollout status deployment/frontend

      - name: Verify the deployment
        run: |
          kubectl get pods
```

---

## **Automated Deployment Process**

Once the CI/CD pipeline is set up, the following process is automated:

1. **Code Change**: When a code change is pushed to a branch (e.g., `frontend`), the CI/CD pipeline is triggered.
2. **Build**: The Docker image for the microservice is built and pushed to Docker Hub.
3. **Deploy**: The microservice is deployed to the Kubernetes cluster.
4. **Scaling**: The Horizontal Pod Autoscaler adjusts the number of replicas based on resource usage.
5. **Verification**: The deployment is verified by checking the status of the pods.

---

## **Secrets Management**

The following secrets need to be configured in the repository’s **Settings > Secrets** section:

- `DOCKERHUB_USERNAME`: Docker Hub username
- `DOCKERHUB_PASSWORD`: Docker Hub password
- `KUBE_CONFIG`: The kubeconfig file required to authenticate to your EKS cluster
- `KUBE_CONTEXT`: The context for your EKS cluster
- `AWS_ACCESS_KEY_ID`: AWS access key ID
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key
- `AWS_REGION`: AWS region where your EKS cluster is located

---

## **Conclusion**

This project automates the deployment of microservices to **AWS EKS** using **GitHub Actions** for CI/CD, ensuring efficient and scalable management of the services. It’s a hands-on learning project for mastering key DevOps tools and practices such as **Terraform**, **Kubernetes**, **Docker**, and **CI/CD automation**.

Feel free to check out the code and explore the setup: [GitHub Repo](https://github.com/janisadhi/Microservices-deployment)

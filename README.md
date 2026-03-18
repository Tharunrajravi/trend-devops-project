## Project: Trendify App Deployment using DevOps

This project demonstrates the end-to-end deployment of a web application using modern DevOps tools and practices. It covers infrastructure provisioning, containerization, CI/CD automation, Kubernetes deployment, and monitoring.

---

## Tech Stack

- AWS (EC2, EKS)
- Terraform
- Docker
- DockerHub
- Kubernetes
- Jenkins
- Git & GitHub
- Prometheus
- Grafana

---

## Project Workflow

### 1. Infrastructure Provisioning using Terraform

Provisioned AWS resources including EC2 instance and VPC using Terraform.

<img src="https://github.com/user-attachments/assets/3ffba8be-7290-40c7-8b33-47499d9d801d" />
<img src="https://github.com/user-attachments/assets/e41b7e7c-664f-4e9d-92d9-8b6c23c4987b" />
<img src="https://github.com/user-attachments/assets/f07ad9d2-d5bd-457e-9924-974c457fda65" />
<img src="https://github.com/user-attachments/assets/c531a675-b7b9-404d-834f-9772251c9279" />
<img src="https://github.com/user-attachments/assets/a3ca260c-8b55-4917-a596-c3d4a2a71699" />

---

### 2. Clone Repository to EC2

Connected to EC2 instance via SSH and cloned the application source code from GitHub.

<img src="https://github.com/user-attachments/assets/9f46cdd8-d203-4491-831e-40e9ed9025ed" />

---

### 3. Build Docker Image

Application is containerized using Docker by building an image from the Dockerfile.

---

### 4. Push Image to DockerHub

Docker image is pushed to DockerHub for centralized storage and reuse.

<img src="https://github.com/user-attachments/assets/1fa2cbba-9c52-41d3-a05e-059fa03ec379" />

---

### 5. Create EKS Cluster

Amazon EKS cluster is created using `eksctl` to manage containerized workloads.

<img src="https://github.com/user-attachments/assets/6d446a4a-a564-4853-993b-13d49511bbee" />

---

### 6. Deploy Application using Kubernetes

Application is deployed using Kubernetes Deployment and exposed via LoadBalancer service.

<img src="https://github.com/user-attachments/assets/79a8466b-82fb-4c93-91b2-a5908c00fe79" />

#### Application Output

Application is successfully accessible through the external LoadBalancer endpoint, confirming complete end-to-end functionality.

<img src="https://github.com/user-attachments/assets/77f9c8db-a274-4603-9e99-ef5f8ba2a3e4" />
<img src="https://github.com/user-attachments/assets/e60a11ce-e5ba-49f8-87ed-4461d84e1f97" />
<img src="https://github.com/user-attachments/assets/03e3d1a4-9fd4-4d80-af83-9c0ba6e9390d" />
<img src="https://github.com/user-attachments/assets/7a57508d-3c97-4aeb-a950-5d0495191c1c" />

---

### 7. Jenkins CI/CD Pipeline

Jenkins pipeline automates build, push, and deployment processes.

<img src="https://github.com/user-attachments/assets/25a8aa98-f8f1-40c1-a715-2b2c07901342" />

---

### 8. GitHub Webhook Integration

Webhook triggers Jenkins pipeline automatically on code push.

<img src="https://github.com/user-attachments/assets/5ee2e1d6-b141-4e70-9b0f-c8486cb0cdb2" />

---

### 9. Monitoring using Prometheus & Grafana

Prometheus collects real-time metrics and Grafana visualizes them through dashboards.

<img src="https://github.com/user-attachments/assets/bc61a3b6-e0ca-4cfb-9d55-daad4820f0e3" />
<img src="https://github.com/user-attachments/assets/f51f1713-f9d7-431f-9ccc-ebea88f25a49" />
<img src="https://github.com/user-attachments/assets/04c4715c-83dc-43ee-8d86-13b5ce7584d8" />
<img src="https://github.com/user-attachments/assets/30471997-07a5-4129-8dc1-c831cc61bb98" />
<img src="https://github.com/user-attachments/assets/0ba4bebe-7cd3-4f93-b9fc-9039f1f3df68" />
<img src="https://github.com/user-attachments/assets/44aa0921-8376-4121-acbf-94e7a7d033dd" />
<img src="https://github.com/user-attachments/assets/f682abcd-ae43-42ff-9339-5defaee2f6e1" />

---

## Features

- Automated infrastructure provisioning  
- Containerized deployment  
- CI/CD pipeline automation  
- Kubernetes orchestration  
- Real-time monitoring  

---

## Deployment Output

Application is accessible via LoadBalancer:  
`af647df2cb252471eadaa649faf8bcc1-1409045207.ap-south-1.elb.amazonaws.com`

---

## Monitoring

- Prometheus for metrics collection  
- Grafana for visualization  

---

## Outcome

Complete end-to-end DevOps pipeline with scalable and automated deployment.

---

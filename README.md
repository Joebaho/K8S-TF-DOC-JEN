### 🚀 Kubernetes CI/CD Deployment on AWS (Jenkins + Docker + Kops + Terraform)

## 📌 Project Overview

This project demonstrates a complete DevOps automation pipeline for deploying a Python FastAPI application to a Kubernetes cluster running on AWS.

It integrates:

GitHub (Source Control)

Jenkins (CI/CD Automation)

Docker (Containerization)

DockerHub (Image Registry)

Kubernetes (Container Orchestration)

Kops (Kubernetes Cluster Provisioning)

Terraform (Infrastructure as Code)

AWS EC2 + S3

## 🎯 Key Features

Fully automated CI/CD

Infrastructure as Code

Containerized microservice architecture

Kubernetes LoadBalancer exposure

Scalable and production-ready foundation


## 🧠 What This Project Demonstrates

This project showcases real-world DevOps skills:

CI/CD design

Infrastructure provisioning

Kubernetes operations

Container lifecycle management

Cloud architecture automation

## 📂 Repository Structure

```bash

K8S-TF-DOC-JEN/
├── app/
│   ├── Dockerfile
│   ├── form.html
│   ├── requirements.txt 
│   └── main.py
│      
├── K8S/
│   ├── deployment.yaml
│   └── service.yaml
│ 
├── scripts/
│   ├── deploy.sh
|   └── destroy.sh 
│           
├── terraform/
|       |-- main.tf 
│       ├── outputs.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── variables.tf
│
│--- .gitignore
|
└── README.md
```

## Flow:

Code pushed to GitHub

Jenkins pipeline triggered via webhook

Docker image built and pushed to DockerHub

Kubernetes deployment updated automatically

Application exposed via AWS LoadBalancer

## 🛠 Technologies Used

Python FastAPI

Docker

Kubernetes

Kops

Terraform

Jenkins

AWS EC2

DockerHub

GitHub Webhooks

## ⚙️ Infrastructure Setup

I - Make sure you install Required Tools on the local machine 

AWS CLI

kubectl

terraform

Docker

II - CLone the repository 

```bash 
git clone https://github.com/Joebaho/K8S-TF-DOC-JEN.git
cd K8S-TF-DOC-JEN
```

III - Build Infranstructure ( VPC and EKS cluster)

```bash
cd scripts
chmod +x deploy.sh
./deploy.sh
```

IV - 🐳 Manual Docker Image Build & push (Until Jenkins is automated)

```bash
docker build -t yourdockerhubusername/fastapi-app .
docker push yourdockerhubusername/fastapi-app:latest
```

V - ☸️ Kubernetes Deployment(Manual):

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

VI - Get Application Access:

```bash
kubectl get svc -w
```

Wait for the LoadBalancer EXTERNAL-IP to appear and note it. Access via LoadBalancer external IP.

## 🔁 Jenkins Pipeline

Pipeline stages:

1.Clone GitHub repo

2.Build Docker image

3.Push to DockerHub

4.Deploy to Kubernetes

5.Rollout restart

Webhook triggers automatic deployment on every commit.

## Destruction

To get ride of all the entire infrastructure and mostly to avoid being charged we can destroy the project with the bashscript command.

```bash
cd scripts
chmod +x destroy.sh
./destroy.sh
```

## 🏁 Conclusion

This project is a simple and practical way to understand how Terraform manages **infrastructures deployments**. Then we can build an image with **Docker** and finally ensure the automation with CI/CD pipeline. 

---

## 👨‍💻 Author

**Joseph Mbatchou**
• DevOps / Cloud / Platform  Engineer   • Content Creator

## 🔗 Connect With Me

🌐 Website: [https://platform.joebahocloud.com](https://platform.joebahocloud.com)

💼 LinkedIn: [https://www.linkedin.com/in/josephmbatchou/](https://www.linkedin.com/in/josephmbatchou/)

🐦 X/Twitter: [https://www.twitter.com/Joebaho237](https://www.twitter.com/Joebaho237)

▶️ YouTube: [https://www.youtube.com/@josephmbatchou5596](https://www.youtube.com/@josephmbatchou5596)

🔗 Github: [https://github.com/Joebaho](https://github.com/Joebaho)

📦 Dockerhub: [https://hub.docker.com/u/joebaho2](https://hub.docker.com/u/joebaho2)

---

## 📄 License

This project is open-source and available under the **MIT License**.
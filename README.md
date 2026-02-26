### 🚀 Kubernetes CI/CD Deployment on AWS (GithubAction + Docker + Terraform)

## 📌 Project Overview

This project demonstrates a complete DevOps automation pipeline for deploying a Python FastAPI application to a Kubernetes cluster running on AWS.

It integrates:

GitHub (Source Control)

Docker (Containerization)

DockerHub (Image Registry)

Kubernetes (Container Orchestration)

Terraform (Infrastructure as Code)

Github Action 

## 🎯 Key Features

Fully automated CI/CD with Github Actionn

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

## 📐 Architecture

![Architecture Diagram](images/architecture.png)

## 📂 Repository Structure

```bash

K8S-TF-DOC-JEN/
├── app/
│   ├── Dockerfile
│   ├── form.html
│   ├── requirements.txt 
│   └── main.py
│ 
├── images/
│   └── architecture.png
│
├── .github/workflows/
│   ├── app.yml
│   └── infra.yml
│ 
├── K8S/
│   ├── deployment.yaml
│   └── service.yaml
│ 
│           
├── terraform/
|       |-- main.tf 
│       ├── outputs.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── variables.tf
│
│--- .gitignore
│
|
└── README.md
```

## Flow:

Terraform provision infrastructure

Github Actions deploys the App

Docker image built and pushed to DockerHub

Kubernetes deployment updated automatically

Application exposed via AWS LoadBalancer

## 🛠 Technologies Used

Python FastAPI

Docker

Kubernetes

Terraform

DockerHub

GitHub Actions

## Clone Your Project Repository on the Server

```bash
git clone https://github.com/Joebaho/K8S-TF-DOC-JEN.git
cd K8S-TF-DOC-JEN
```

## 🔐 PREPARE SECRETS (ONCE)

In GitHub → Repo → Settings → Secrets → Actions, add:

**Secret**	                      **Purpose**

AWS_ACCESS_KEY_ID	          Terraform + AWS

AWS_SECRET_ACCESS_KEY	      Terraform + AWS

AWS_REGION	                  e.g. us-west-2

DOCKERHUB_USERNAME	          Push images

DOCKERHUB_TOKEN	              Push images

KUBE_CONFIG_DATA	          Deploy to cluster

⚠️ KUBE_CONFIG_DATA is added after Terraform creates the cluster

## ⚙️ Infrastructure Setup

▶️ How to run it

Go to GitHub → Actions

Select Infrastructure (Terraform)

Click Run workflow

Wait for completion

✅ This creates:

VPC

EKS cluster

Worker nodes

## 🔑GENERATE KUBECONFIG (CRITICAL STEP)

On your local machine:

```bash
aws eks update-kubeconfig \
  --region us-west-2 \
  --name <your-cluster-name>
```

Verify access:

```bash
kubectl get nodes
```

Now encode kubeconfig:

```bash
cat ~/.kube/config | base64
```


Copy the output and save it in GitHub as:

KUBE_CONFIG_DATA

✅ Now GitHub Actions can access your cluster

## 🚢CONFIGURE KUBERNETES MANIFESTS

k8s/deployment.yaml

Make sure names match workflow:

```bash
metadata:
  name: fastapi-deployment
spec:
  template:
    spec:
      containers:
        - name: fastapi-container
          image: yourdockerhubusername/fastapi-app:latest
```

## 🔁APP CI/CD PIPELINE

Set up the File and safe: .github/workflows/app.yml

## ▶️DEPLOY THE APP

Now simply:

```bash
git add .
git commit -m "deploy app"
git push origin main
```

GitHub Actions will:

Build Docker image

Push to Docker Hub

Deploy to EKS

Roll out the update


## 🌐ACCESS YOUR APPLICATION

```bash
kubectl get svc
```

Look for:

```bash
EXTERNAL-IP
```

Open in browser:

```bash
http://<external-ip>
```

🎉 Your app is running

## UPDATES & CLEANUP

Update app

```bash
git push origin main
```

Destroy infrastructure (manual & safe)

```bash
terraform destroy
```

## 🏁 Conclusion

This project is a simple and practical way to understand how Terraform manages **infrastructures deployments**. Then we can build an image with **Docker** and finally ensure the automation with CI/CD pipeline using GithubAction. 

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
Docker
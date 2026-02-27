variable "region" {
  description = "AWS region"
  type        = string
  default = "us-west-2"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default = "automated-demo-cluster"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default = "production"
}

variable "dockerhub_username" {
  description = "Your Docker Hub username"
  type        = string
  sensitive   = true
  default = "joebaho2"
}
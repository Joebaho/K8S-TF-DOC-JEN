#!/bin/bash
set -e

echo "========================================"
echo "🧨 Destroying entire infrastructure"
echo "========================================"

read -p "Are you sure? Type 'yes' to continue: " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "❌ Cancelled."
    exit 0
fi

cd ../terraform
terraform init
terraform destroy -auto-approve

echo "🚪 Logging out from Docker Hub..."
docker logout

echo "🧹 Removing kubeconfig context..."
kubectl config delete-context arn:aws:eks:us-west-2:$(aws sts get-caller-identity --query Account --output text):cluster/automated-demo-cluster 2>/dev/null || true

echo "✅ All resources destroyed."
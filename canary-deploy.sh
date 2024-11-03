#!/bin/bash

# Script to manage canary deployment

# Apply base deployment
echo "Creating base deployment..."
kubectl apply -f base-deployment.yaml

# Apply service
echo "Creating service..."
kubectl apply -f service.yaml

# Wait for base deployment to be ready
echo "Waiting for base deployment to be ready..."
kubectl rollout status deployment/nginx-base

# Deploy canary
echo "Deploying canary..."
kubectl apply -f canary-deployment.yaml

# Monitor canary deployment
echo "Monitoring canary deployment..."
kubectl rollout status deployment/nginx-canary

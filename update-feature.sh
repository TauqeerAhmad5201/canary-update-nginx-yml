#!/bin/bash

# Script to manage canary deployment

# Apply the changes
kubectl apply -f base-deployment.yaml
kubectl apply -f canary-deployment.yaml

# Check rollout status
kubectl rollout status deployment/nginx-base
kubectl rollout status deployment/nginx-canary

# View revision history
kubectl rollout history deployment/nginx-base
kubectl rollout history deployment/nginx-canary

# Get detailed info about a specific revision
kubectl rollout history deployment/nginx-base --revision=1
kubectl rollout history deployment/nginx-canary --revision=1
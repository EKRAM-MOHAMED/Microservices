#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=ekram321/microservices

# Step 2
# Run the Docker Hub container with kubernetes

kubectl create deployment udacity2 --image=$dockerpath --port=8000

kubectl expose deployment udacity2 --type=NodePort
# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
#kubectl expose deployment udacity2 --type=NodePort
kubectl port-forward deployment/udacity2 8000:2000
#!/bin/bash
# Initialize Docker environment
eval $(minikube docker-env)

# Delete services
kubectl delete service hello-svc
kubectl delete deployment hello-svc

# Delete deployments
kubectl delete service mongo-db
kubectl delete deployment mongo-db

# Cleanup Docker
docker kill $(docker ps -q)
docker rmi -f $(docker images -a -q)

# Cleanup minikube
minikube stop
eval $(minikube docker-env -u)
minikube delete
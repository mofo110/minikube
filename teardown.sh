#!/bin/bash
kubectl delete service hello-svc
kubectl delete deployment hello-svc

kubectl delete service mongo-db
kubectl delete deployment mongo-db

eval $(minikube docker-env)
docker kill $(docker ps -q)
docker rmi -f $(docker images -a -q)

minikube stop
eval $(minikube docker-env -u)
minikube delete
#!/bin/bash
eval $(minikube docker-env)

kubectl delete service hello-svc
kubectl delete deployment hello-svc

kubectl delete service mongo-db
kubectl delete deployment mongo-db

docker kill $(docker ps -q)
docker rmi -f $(docker images -a -q)

minikube stop
eval $(minikube docker-env -u)
minikube delete

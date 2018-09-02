#!/bin/bash
minikube start
eval $(minikube docker-env)

docker build -t hello-svc:blue ./hello_svc/
docker build -t mongo-db:v1 ./mongo_db/

kubectl run hello-svc --image=hello-svc:blue --port=8080 --image-pull-policy=Never --env="MONGO_DB_HOST=mongo-db.default.svc.cluster.local" --env="MONGO_DB_PORT=27017"
kubectl run mongo-db --image=mongo-db:v1 --port=27017 --image-pull-policy=Never
kubectl get deployments

kubectl expose deployment hello-svc --type=LoadBalancer
kubectl expose deployment mongo-db --type=LoadBalancer
kubectl get services

minikube service hello-svc --url
minikube service mongo-db --url

mongo_db_pod=$(kubectl get pods | grep mongo-db | awk '{print $1}')
echo ${mongo_db_pod}
kubectl exec ${mongo_db_pod} /usr/local/lib/load.sh
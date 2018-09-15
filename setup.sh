#!/bin/bash
# Start minikube
minikube start
eval $(minikube docker-env)

# Buil Docker images
docker build -t hello-svc:blue ./hello_svc/
docker build -t mongo-db:v1 ./mongo_db/

# Deploy
kubectl run hello-svc --image=hello-svc:blue --port=8080 --image-pull-policy=Never --env="MONGO_DB_HOST=mongo-db.default.svc.cluster.local" --env="MONGO_DB_PORT=27017"
kubectl run mongo-db --image=mongo-db:v1 --port=27017 --image-pull-policy=Never
kubectl get deployments

# Expose
kubectl expose deployment hello-svc --type=LoadBalancer
kubectl expose deployment mongo-db --type=LoadBalancer
kubectl get services

# Display service URL's
minikube service hello-svc --url
minikube service mongo-db --url

# Get mongodb pod and execute load script
mongo_db_pod=$(kubectl get pods | grep mongo-db | awk '{print $1}')
echo ${mongo_db_pod}
kubectl exec ${mongo_db_pod} /usr/local/lib/load.sh

# Launch dashboard in browser
google-chrome $(minikube dashboard --url)
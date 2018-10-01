#!/bin/bash
eval $(minikube docker-env)
docker build -t hello-svc:blue ./hello-svc/
kubectl set image deployment/hello-svc hello-svc=hello-svc:blue

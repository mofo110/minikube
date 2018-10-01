#!/bin/bash
eval $(minikube docker-env)
docker build -t hello-svc:green ./hello-svc/
kubectl set image deployment/hello-svc hello-svc=hello-svc:green

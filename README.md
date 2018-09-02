# Hello Minikube

This is my sample for minikube.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Node.js
* Docker
* Kubectl
* Minikube

### Setup
Execute the `setup.sh` script.
```
./setup.sh
```
### Validate
Validate your pods.
```
kubectl get pods
NAME                         READY     STATUS    RESTARTS   AGE
hello-svc-6cf9ccdf78-pwmff   1/1       Running   0          28s
mongo-db-6df8bc778d-zxkws    1/1       Running   0          28s
```
### Get your URL
Get your URL for the service.  This will be unique every time (at least the port will).
```
minikube service hello-svc --url
http://192.168.99.100:32516
```
### Test the API's
Test the API.
```
curl http://192.168.99.100:32516/customers/1234
Hello john smith!
```
### Activate Green/Blue
Activate the green version.
```
./green.sh
```

### Teardown
Execute the `teardown.sh` script.
```
./teardown.sh
```
## Built With
* [Kubernetes](https://kubernetes.io/docs/tutorials/hello-minikube/) - Hello Minikube by Kubernetes

## Authors

* **mofo110** - *Initial work* - [mofo110](https://github.com/mofo110)

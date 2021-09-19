#!/bin/bash
minikube start --extra-config=apiserver.service-node-port-range=1-65535
eval $(minikube docker-env)
docker build -t hello .
kubectl apply -f manifest.yaml
kubectl apply -f service.yaml
echo #########################
echo running curl command 
curl $(minikube ip)
echo <--if this says Hello Naima we are golden if not :(  
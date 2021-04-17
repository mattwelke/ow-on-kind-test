#!/bin/bash

kind create cluster --config kind-cluster.yaml

kubectl label node kind-worker openwhisk-role=core
kubectl label node kind-worker2 openwhisk-role=invoker

# determine the internalIP of a kind worker node
WORKER_INTERNAL_IP=$(kubectl describe node kind-worker | grep InternalIP: | awk '{print $2}')

echo $WORKER_INTERNAL_IP

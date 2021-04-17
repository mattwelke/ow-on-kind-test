#!/bin/bash

echo "Starting OpenWhisk install into kind cluster..."

WORKER_INTERNAL_IP=$1

OW_YAML=templated/mycluster.yaml

cat ow-cluster.template.yaml \
  | sed "s/<INTERNAL_IP>/$WORKER_INTERNAL_IP/g" \
  > $OW_YAML

# Install from Helm
helm repo add openwhisk https://openwhisk.apache.org/charts
helm repo update
helm install owdev openwhisk/openwhisk -n openwhisk --create-namespace -f $OW_YAML

echo "OpenWhisk install into kind cluster started. Waiting 2 minutes for all pods to be Completed or Running..."
sleep 120
echo "Finished waiting."

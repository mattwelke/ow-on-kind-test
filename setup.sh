#!/bin/bash

WORKER_INTERNAL_IP=$(./create_kind_cluster.sh)

./install_ow_onto_cluster.sh $WORKER_INTERNAL_IP

OW_INGRESS_API_HOST_PORT="31001"
OW_AUTH="23bc46b1-71f6-4ed5-8c54-816aa4f8c502:123zO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP"

./config_wsk_cli.sh $OW_INGRESS_API_HOST_PORT $OW_AUTH

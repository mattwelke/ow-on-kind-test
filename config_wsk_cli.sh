#!/bin/bash

OW_INGRESS_API_HOST_PORT=$1
OW_AUTH=$2

wsk property set --apihost "localhost:$OW_INGRESS_API_HOST_PORT"
wsk property set --auth $OW_AUTH

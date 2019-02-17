#!/bin/bash
# insecurely connect and forward redis to the following port
export REDIS_PASSWORD=$(kubectl get secret --namespace default redis-store -o jsonpath="{.data.redis-password}" | base64 --decode)
kubectl port-forward --namespace default svc/redis-store 6379:6379 &
redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD

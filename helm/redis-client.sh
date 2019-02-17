#!/bin/bash
# This is an sh file meant to allow the user to access a running redis-master
# When developing an application
# Get the password into an env var
export REDIS_PASSWORD=$(kubectl get secret --namespace default redis-store -o jsonpath="{.data.redis-password}" | base64 --decode)
# Go into redis using the password and start it
kubectl run --namespace default redis-store-client --rm --tty -i --restart='Never' \
   --env REDIS_PASSWORD=$REDIS_PASSWORD \
  --image docker.io/bitnami/redis:4.0.12 -- bash
# Now in the pod get the cli
redis-cli -h redis-store-master -a $REDIS_PASSWORD

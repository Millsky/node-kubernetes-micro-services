#!/bin/bash
# Install keycloak for authentication
helm install --name keycloak -f key-cloak-values.yaml stable/keycloak
# Install redis to store the tokens over a session
helm install --name redis-store stable/redis -f redis-values-production.yaml
# Add bitnami repo to get node
# helm repo add bitnami https://charts.bitnami.com/bitnami
# Install node for all the micro-service goodness
# helm install --name node-server -f node-values.yaml bitnami/node

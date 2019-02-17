#!/bin/bash
kubectl port-forward pods/keycloak-0 8080:8080
echo "Go to http://localhost:8080 !"

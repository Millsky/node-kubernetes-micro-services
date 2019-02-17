# Node Kubernetes Micro-Services example

A node [kubernetes](https://github.com/kubernetes/kubernetes) micro-service example with [helm](https://github.com/helm/helm), [node](https://github.com/nodejs/node) and [keycloak](https://github.com/keycloak/keycloak) for authentication.

## Introduction

The purpose of this project is to show a sample setup of a node micro-service with authentication.

## Architecture

The below represents the high-level architecture of this sample application.


![alt text](/img/microservice.png "Example Architecture of this application")

## Setup

### Installing Dependencies
 
#### Docker + Kubernetes:

1. [Download Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
2. [Enable Kubernetes](https://docs.docker.com/docker-for-mac/#kubernetes)

#### Install Helm

1. [Install Helm](https://docs.helm.sh/using_helm/#install-helm)

#### Install NodeJS

1. [Install node](https://nodejs.org/en/download/)

### Setting Up and Running the Project

The following should be done within this project.

1. ``cd helm && ./setup.sh``
2. Verify that the pods have successfully come up via the kubernetes dashboard.
3. Expose the keycloak UI for local development. ``./keycloak-access.sh``
4. Login with the base user. `admin, admin`
4. [Setup a keycloak realm](https://www.keycloak.org/docs/latest/getting_started/index.html#creating-a-realm-and-user).
5. Expose the redis cluster for local development: ``./redis-insecure-connect.sh``
6. Run the node server. `node index`.
7. Navigate to `http://localhost:8060` in the browser to see the api
8. Navigate to `http://localhost:8060/auth/pets` in the browser to see the api redirect.
9. Create a new user via the admin console.
10. Login and see the result of the above request.

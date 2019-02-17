#!/bin/bash
helm delete --purge keycloak
helm delete --purge node-server
helm delete --purge redis-store

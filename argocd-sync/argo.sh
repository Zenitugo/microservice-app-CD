#!/bin/bash

kubectl apply -f sock-shop-sync.yml
kubectl apply -f sockshop-db.yml
kubectl apply -f routing-policy-sync.yml
kubectl apply -f monitoring-sync.yml
kubectl apply -f logging-sync.yml
kubectl apply -f nginx-ingress-sync.yml
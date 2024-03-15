#!/bin/bash

echo "Installing nginx ingress controller"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install nginx ingress-nginx/ingress-nginx --namespace ingress-nginx 

echo "Installing cert manager in eks cluster"
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install my-release --namespace cert-manager --version v1.14.4 jetstack/cert-manager  
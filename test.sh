#!/bin/bash
kubectl create namespace lagom-k8s &&\
kubectl config set-context --current --namespace=lagom-k8s &&\
sh ./setup-k8s.sh &&\
sh ./deploy-hello-impl.sh &&\
echo "Waiting for services to start" &&\
sleep 15 &&\
curl "http://hello.local.afawfaaw.com/api/hello/lagomer"

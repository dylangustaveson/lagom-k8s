#!/bin/bash
helm upgrade -f ./k8s-dependencies/ingress-nginx.yaml --install --wait --atomic ingress-nginx ingress-nginx/ingress-nginx &&\
helm upgrade -f ./k8s-dependencies/cassandra.yaml --install --wait --atomic  cassandra bitnami/cassandra &&\
helm upgrade -f ./k8s-dependencies/kafka.yaml --install --wait --atomic  kafka bitnami/kafka

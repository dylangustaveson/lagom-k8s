#!/bin/bash
set CI=true &&\
echo "Building Project" &&\
sbt "project hello-impl" "dist" &&\

echo "Building Docker Image" &&\
docker build -f hello-impl.dockerfile . -t hello-impl:latest --quiet &&\

echo "Deploying to Kubernetes" &&\
(helm uninstall hello-impl || exit 0) &&\
helm upgrade hello-impl ./hello-chart --install --wait --atomic
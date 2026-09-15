#!/usr/bin/env bash

set -euo pipefail

NAMESPACE="devsecops"

echo "Starting Kubernetes cleanup..."

if ! command -v kubectl >/dev/null 2>&1; then
  echo "Error: kubectl is not installed or not available in PATH."
  exit 1
fi

if ! kubectl get namespace "${NAMESPACE}" >/dev/null 2>&1; then
  echo "Namespace '${NAMESPACE}' does not exist."
  exit 0
fi

echo "Deleting application resources from namespace '${NAMESPACE}'..."

kubectl delete -f k8s/ingress.yaml --ignore-not-found
kubectl delete -f k8s/hpa.yaml --ignore-not-found
kubectl delete -f k8s/service.yaml --ignore-not-found
kubectl delete -f k8s/deployment.yaml --ignore-not-found
kubectl delete -f k8s/configmap.yaml --ignore-not-found

echo "Deleting namespace '${NAMESPACE}'..."

kubectl delete namespace "${NAMESPACE}" --ignore-not-found

echo "Kubernetes cleanup completed."

#!/usr/bin/env zsh

# Kubernetes helpers
kr() {
  kubectl delete pod "$@" && kubectl get pods -w
}


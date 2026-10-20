#!/usr/bin/env bash
# Read-only Kubernetes cluster and workload status snapshot.
# Description: Summarize Kubernetes workload status and show unhealthy pods.
# Author: Adedoyin Ogunsola
 
set -euo pipefail
command -v kubectl >/dev/null 2>&1 || { echo 'kubectl is required.' >&2; exit 2; }
kubectl cluster-info >/dev/null || { echo 'Cannot reach the Kubernetes cluster using the current context.' >&2; exit 1; }
printf 'Current context: '; kubectl config current-context
printf '\n=== Nodes ===\n'; kubectl get nodes -o wide
printf '\n=== Pods not Running or Completed ===\n'
kubectl get pods --all-namespaces --field-selector=status.phase!=Running,status.phase!=Succeeded -o wide || true
printf '\n=== Deployments ===\n'; kubectl get deployments --all-namespaces
printf '\nNote: this script only reads cluster state; it does not modify workloads.\n'

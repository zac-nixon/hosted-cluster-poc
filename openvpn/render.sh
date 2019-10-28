#!/bin/bash

set -eu

source ../config-defaults.sh
source ../lib/common.sh

cat > ../manifests/managed/openvpn-operator-secret.yaml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: openvpn-operator-secret
  namespace: ${NAMESPACE}
data:
  admin-kubeconfig: $(encode ../pki/admin.kubeconfig)
EOF

cp *.yaml ../manifests/managed
envsubst < openvpn-spec.yaml > ../manifests/managed/openvpn-spec.yaml
envsubst < openvpn-clusterrole.yaml > ../manifests/managed/openvpn-clusterrole.yaml
envsubst < openvpn-rb.yaml > ../manifests/managed/openvpn-rb.yaml
envsubst < openvpn-sa.yaml > ../manifests/managed/openvpn-sa.yaml
envsubst < openvpn-operator.yaml > ../manifests/managed/openvpn-operator.yaml
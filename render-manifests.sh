#!/bin/bash

set -eux

rm -rf manifests
mkdir -p manifests/managed manifests/user

for component in etcd kube-apiserver kube-controller-manager kube-scheduler; do
    pushd ${component}
    ./render.sh
    popd
done
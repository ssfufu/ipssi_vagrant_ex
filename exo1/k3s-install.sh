#!/bin/bash

curl -sfL https://get.k3s.io/ | sh -s - server --write-kubeconfig-mode 644 --node-ip="192.168.122.110"
for i in $(seq 1 10); do
  if [ -f /var/lib/rancher/k3s/server/node-token ]; then break; fi
  sleep 1
done

cp /var/lib/rancher/k3s/server/node-token /mnt/k3s_token
cp /etc/rancher/k3s/k3s.yaml /mnt/kubeconfig
sed -i 's/127.0.0.1/192.168.122.110/g' /mnt/kubeconfig || true

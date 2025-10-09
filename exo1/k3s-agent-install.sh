#!/bin/bash

for i in $(seq 1 30); do
  if [ -f /mnt/k3s_token ] && nc -z 192.168.122.110 6443; then break; fi
  sleep 2
done

K3S_URL="https://192.168.122.110:6443/"
K3S_TOKEN=$(cat /mnt/k3s_token)

curl -sfL https://get.k3s.io/ | K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -

mkdir -p /home/vagrant/.kube
cp /mnt/kubeconfig /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube
echo "alias k=kubectl" >> /home/vagrant/.bashrc
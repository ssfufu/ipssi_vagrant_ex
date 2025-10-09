#!/bin/bash

curl -sfL https://get.k3s.io/ | sh -s - server --write-kubeconfig-mode 644 --node-ip="192.168.122.110"
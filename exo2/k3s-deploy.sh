#!/bin/bash

mkdir -p /opt/manifests

cp -r /mnt/* /opt/manifests

kubectl apply -f /opt/manifests --recursive
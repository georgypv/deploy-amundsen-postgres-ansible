#!/bin/bash
cd ./ansible || (echo "No ./ansible directory!" && exit 1)

echo "Waiting for 60 seconds..."
for (( s = 1; s < 60; s++ ))
do
echo "$s seconds..."
sleep 1
done

echo "Setting up hosts with Ansible..."
ansible-playbook playbook.yaml
cd ..
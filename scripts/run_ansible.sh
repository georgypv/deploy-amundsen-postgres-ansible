#!/bin/bash
cd ./ansible || (echo "No ./ansible directory!" && exit 1)

echo "Waiting for 60 seconds..."
for (( s = 1; s < 60; s++ ))
do
echo "$s seconds..."
sleep 1
done

echo "Setting up hosts with Ansible..."
if [[ $# -gt 0 ]]
then
  echo "Found parameter(s) for run_ansible.sh!"
  if [[ "$1" = "-v" ]]
  then
    echo "Setting logging level to verbose!"
    ansible-playbook -v playbook.yaml
  else
    ansible-playbook playbook.yaml
  fi
  else
    ansible-playbook playbook.yaml
fi
cd ..
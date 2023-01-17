#!/bin/bash
cd terraform || exit 1
node1=$(terraform output -raw external_ip_node1)
node2=$(terraform output -raw external_ip_node2)

cd ..
cat << EOF > ansible/inventory.ini
[all]
$node1
$node2

[db]
$node1

[amundsen]
$node2
EOF
echo "Got hosts for Ansible inventory"

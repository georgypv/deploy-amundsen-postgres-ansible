#!/bin/bash
cd terraform || exit 1
terraform destroy --var-file=secret.tfvars --auto-approve
echo "Destroyed cloud infrastructure!"
cd ..
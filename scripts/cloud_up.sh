cd terraform || exit 1

terraform init

terraform validate || (echo "Terraform config is invalid!" && exit 1)
echo "Validated terraform configuration"

terraform fmt

terraform apply --var-file=secret.tfvars --auto-approve
echo "Created cloud infrastructure"

cd ..
#!/bin/bash

if [ -d ./terraform ]
then
  echo " ./terraform directory exists"
else mkdir ./terrafrom &&
echo "Created ./terraform directory"
fi

if (yc --version)
then
cat << EOF > ./terraform/secret.tfvars
yc_token = "$(yc iam create-token)"
yc_cloud_id = "$(yc config get cloud-id)"
yc_folder_id = "$(yc config get folder-id)"
EOF
echo "Acquired YC token, cloud and folder ids!"
else
echo "Yandex Cloud CLI is not installed!"
fi
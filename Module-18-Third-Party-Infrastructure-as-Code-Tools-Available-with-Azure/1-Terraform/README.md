# Setup Storage account

1. Download Terraform
```
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
sudo apt-get install zip -y
unzip terraform*.zip
sudo mv terraform /usr/local/bin
terraform version
```
1. Visit Azure Portal
  1. Get Subscription ID from the resource
  1. Get Tenant ID from Azure AD


## Setup Storage Account via Terraform
1. run terraform commands as specified below:
```
mkdir storage-account
cd storage-account
wget https://raw.githubusercontent.com/atingupta2005/Azure-Devops-AZ-400/master/Module-18-Third-Party-Infrastructure-as-Code-Tools-Available-with-Azure/1-Terraform/1-StorageAcc.tf
// Update Subscription ID and tanent id
nano 1-StorageAcc.tf
terraform init
terraform apply
cd ..
```
1. Inspect if storage account is created on Azure Portal

## Setup VM via Terraform
```
mkdir vm
cd vm
wget https://raw.githubusercontent.com/atingupta2005/Azure-Devops-AZ-400/master/Module-18-Third-Party-Infrastructure-as-Code-Tools-Available-with-Azure/1-Terraform/2-machine.tf
// Update Subscription ID and tanent id
nano 2-machine.tf
terraform init
terraform apply
cd ..
```

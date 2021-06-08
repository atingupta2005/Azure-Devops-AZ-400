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
  1. Update Subscription ID and Tenant ID in the .tf files
1. run terraform commands as specified below:
```
mkdir storage-account
cd storage-account
wget <url-of-tf-file-on-git>
terraform init
terraform plan -out storage.tfplan
terraform apply "storage.tfplan"
cd ..
```
1. Inspect if storage account is created on Azure Portal

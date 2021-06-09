# Setup Storage account (Optional)

1. Download Terraform
```
wget https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip
sudo apt-get install zip -y
unzip terraform*.zip
sudo mv terraform /usr/local/bin
terraform version
```

## Setup Azure CLI (Optional)
```
sudo apt install azure-cli
az login
```

1. Visit Azure Portal
  1. Get Subscription ID
  1. Get Tenant ID from Azure AD
  1. Copy these from Notepad. We will need later


## Setup Storage Account via Terraform (Optional)
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

## Setup VM via Terraform (Optional)
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

## Terraform in Pipeline
- Refer Terraform Code and Import in Github Repo
  - https://github.com/atingupta2005/azure-devops-terraform

- Create a new Build Pipeline for this Repo - Starter Pipeline
  - Replace code with [pipeline.txt](pipeline.txt)
- Run pipeline

- Create Release Pipeline
  - Empty Job
  - Stage Name - Terraform
  - Chose Artifact
  - Add task
    - Azure CLI
      - Name: Create Storage account
      - Powershell
      - Inline Script
```
az storage account create -g rgdevops -n atinterraform10001 -l centralus --sku Standard_LRS
az storage container create --name terraform --acount-name atinterraform10001
az storage account keys list -g rgdevops --account-name atinterraform10001 --query "[0].value" --output tsv > temp.txt
$content = Get-Content temp.txt -First 1
$key = '"{0}"' -f $content
```
- Note: Make sure to change the resource group name at 2 places, storage account name at 2 places
  - Add another task
    - Terraform - It will install extension in organization but no task will be added
  - Add another task
    - Terraform tool installer
  - Add another task
    - Terraform
    - Command: init
    - Browse configuration directory and specify the path to the directory which has terraform file. No need to select terraform file. Just select directory in which terraform file exists (s folder)
    ```
    $(System.DefaultWorkingDirectory)/_azure-devops-terraform/drop/s
    ```
    - Specify storage account name as we specified in Azure CLI task
    - Specify container name - terraform
    - Key: 2-machine.tfstate
  - Add another task
    - Terraform
    - Command: plan
    - Browse configuration directory and specify the path to the directory which has terraform file. No need to select terraform file. Just select directory in which terraform file exists (s folder)
  - Add another task
    - Terraform
    - Command: validate and apply
    - Browse configuration directory and specify the path to the directory which has terraform file. No need to select terraform file. Just select directory in which terraform file exists (s folder)
    - Additional command arguments: -auto-approve
- Run the release pipeline
- Verify if VM is created or not
-  

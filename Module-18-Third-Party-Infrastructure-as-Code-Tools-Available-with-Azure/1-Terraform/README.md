# Terraform in Pipeline
- Refer Terraform Code and Import in Github Repo
  - https://github.com/atingupta2005/azure-devops-terraform

- Create a new Build Pipeline for this Repo - Starter Pipeline
  - Replace code with [pipeline.txt](pipeline.txt)
  - Agent Specification: ubuntu-18.04
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
az storage account create -g rgdevops -n saatinjune6729021345 -l centralus --sku Standard_LRS
az storage container create --name terraform --account-name saatinjune6729021345
az storage account keys list -g rgdevops --account-name saatinjune6729021345 --query "[0].value" --output tsv > temp.txt
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
    - Key: terraform.tfstate
  - Add another task
    - Terraform
    - Command: validate and apply
    - Browse configuration directory and specify the path to the directory which has terraform file. No need to select terraform file. Just select directory in which terraform file exists (s folder)
    - Additional command arguments: -auto-approve
- Run the release pipeline
- Verify if VM is created or not


### Set subscription
az account set --subscription "4c282a3d-8f83-4096-aae5-46c923fb54ea"

# Managing-Application-Configuration-and-Secrets

## Lab: Azure Pipelines-Key Vaults

- Create new release pipeline named - "vm-key-vault"
- Add new Kay Vault task in the job
- Create Azure Keyvault and add a secret named vmpassword and store vm password in it - Azure@123456
- Configure the Key Vault task. Secret filter- vmpassword
- Add another task - Azure CLI
- Configure task - Script Type - Shell, Use Inline Script, Paste command:
   - az vm create --resource-group az400 --name demovm1 --image win2016datacenter --admin-username atingupta2005 --admin-password $(vmpassword)
- Add access policy in Key Vault -> Left Menu -> Access Policies
   - Open Devops Project Settings\Service Connections
   - Choose + New service connection and select Azure Resource Manager
   - Open the service connection created and Click Manage Service Principle \ Copy APP ID
   - Add access policy in key vault
   - Select Service principle\Paste id
   - Select Get and List permission
   - Click Save
- Save Azure Pipleine and Create Release
- Inspect if VM is created

## Lab - Source Code Analysis Tool in Visual Studio
- Create New Asp Dot Net Web Project
- Open project in Visual Studio
- Click Analysis -> Run Code Analysis
- Open View -> Error List\Messages
- Add more analysis tools
  - Add NuGet package - FxCopAnalyzer
- Build Solution
- Notice Warnings in Build Logs
- Notice Solution Explorer -> Dependencies -> Anayzers


## Lab - Source Code Analysis Tool in Azure Pipelines
- Create New Azure Repo - static-code
- Add Source code of previous project to Azure Repo
- Create a new pipeline
- Manually run pipeline
- Inspect warnings in the job

# Azure Deployment Slots (Optional)

1. Create New Resource - Azure Web App named - slotapp1000<yourname>
1. Ensure to chose Standard App Service plan or higher
1. Create Asp Dot Net Core Web App
  - https://github.com/atingupta2005/devops-asp-dot-net-core-app-starter
1. Publish to Azure App Service
1. Take URL and open in Browser to confirm
1. Change index page - "Welcome to Production app v2"
1. Open Web App\Deployment slots\Add Slot - staging
1. Open the new slot and notice that it has new URL
1. Open Visual Studio and Publish\New Profile
1. Chose existing Web App and expand the web app to chose slot - staging
1. Open the new slot and grab URL and open in web browser
1. To promote v2 to main URL perform swap of slots
1. Open the production slot
1. Click button -Swap
1. Inspect the Production URL on browser


# Steps - with Azure Pipelines
1. Create New Resource - Azure Web App named - slotapp1000<yourname>
  - ASP.Net Core 3.1 LTS
  - Ensure to chose Standard App Service plan or higher

1. In Azure Repo, import from GitHub
  - https://github.com/atingupta2005/devops-asp-dot-net-core-app-starter
1. Create a new build pipeline and replace content from [pipeline.txt](pipeline.txt)
1. Save and Run
1. Create Release pipeline and chose empty job
1. Add the artifact
1. Give a name to pipeline - web-app slot
1. Enable Continuous Deployment trigger
1. Give a name to Stage - Pre-Production
1. Add tasks to the stage
  1. Add task - Azure CLI
    1. Configure task - Azure CLI - Powershell Script, inline script
```
az webapp deployment slot create --name slotapp1000<yourname> --resource-group az400 --slot staging
```
  1. Add task - Azure App Service Deploy
    1. Configure task - Azure App Service Deploy
      1. Type slot name - staging
1. Save
1. Add new stage with Empty Job and name it Production
1. Add Post-Deployment condition to stage - "Pre-Production"
    - Post Deployment Approval\Select approver
1. Open Production stage and add a task
  - Azure App Service manage
    - Chose Action - Swap Slots
    - Source slot - staging
    - Enable - Swap with Production
1. Save and Create Release
1. Do code changes - will be published to staging slot
1. Do approval in pipeline and it will then be released to Prod

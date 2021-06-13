# Azure Deployment Slots

## With Azure Pipelines
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

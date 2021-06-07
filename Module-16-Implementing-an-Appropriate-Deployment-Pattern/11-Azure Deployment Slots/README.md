# Azure Deployment Slots

1. Create New Resource - Azure Web App named - slotapp1000
1. Ensure to chose Standard App Service plan or higher.
1. Staging slot is available in Standard and higher
1. Open Web App
1. Take URL and open in Browser to confirm
1. Create Asp Dot Net Core Web App
1. Change index page - "Welcome to Production app v1"
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
1. Open Azure Web App and delete staging slot
1. Create a new build pipeline and remove the last test step
1. Add new task in last - Publish Build Artifacts
1. Save and Run
1. Create Release pipeline and chose empty job
1. Add the artifact
1. Give a name to pipeline - web-app slot
1. Enable Continuous Deployment trigger
1. Give a name to Stage - Pre-Production
1. Add task to the stage
1. Set Agent specification to vs2017-win2016
1. Add task - Azure CLI
1. Add task - Azure App Service Deploy
1. Configure task - Azure CLI - Powershell Script, inline script
    - az webapp deployment slot create --name slotapp1000 --resource-group az400 --slot staging
1. Configure task - Azure App Service Deploy
1. Type slot name - staging
1. Save
1. Add new stage with Empty Job and name it Production
1. Add Post-Deployment condition to "Pre-Production"\Post Deployment Approval\Select approver
1. Open Production stage and add a task - Azure App Service manage
1. Chose Action - Swap Slots
1. Source slot - staging
1. Enable - Swap with Production
1. Save and Create Release
1. Do code changes - Will be published to staging slot
1. Do approval in pipeline and it will then be released to Prod

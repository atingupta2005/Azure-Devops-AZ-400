# Setup Azure Traffic Manager (Optional)
1. Create two web Apps - productionwebapp1000, stagingwebapp1000
  - Dot Net Core 3.1 LTS
  - Standard
  - Note: Make this web app in a different Region so that both the web apps are in different regions
1. Create Traffic Manager
1. Routing method - Priority
1. Open Traffic Manager Resource\Configuration
  1. Protocol - HTTPS, Port -443
1. Open Traffic Manager Resource\Endpoints
  1. Add the end point - production priority is 1
1. Save
1. Check Overview and wait till Monitoring Status is complete
1. Take DNS name of Traffic Manger Resource and open on browser


# Automate the Azure Traffic Manager with Azure Pipelines
1. Import Git Repo as Azure Repo
  - https://github.com/atingupta2005/devops-asp-dot-net-core-app-starter
1. Create a build pipeline and replace pipeline code from [pipeline.txt](pipeline.txt)
1. Save and run
1. Create release pipeline with empty job
1. Add artifact
1. Pipeline Name - Traffic Manager
1. Add stage - Pre-Production
1. Add task to the stage - Pre-Production
    1. Add Task - Azure App Service Deploy - staging web app
    1. Add Task - Azure CLI - Powershell, Inline Script
```
$webid=az resource list --name 'stagingwebapp1000atin' --query [].id --output tsv
echo $webid
$id = '"{0}"' -f $webid
echo $id
az network traffic-manager endpoint create -g rgdevops --profile-name trafficmanageratin -n endpoint-version2 --type azureEndpoints --target-resource-id $id --endpoint-status enabled --priority 2
```
  - Note: Make sure to change the web app name, resource group name, traffic manager profile name in above script
  - Note: If above commands throwing error, then first debug using Azure Cloud Shell
1. Save and Create Release
1. Inspect the Traffic manager URL. It should have the staging deployment shown
1. Add another stage in serial with empty job - Production
  - Add Task - Azure App Service Manage - Stop Web Service, productionwebapp1000
    - This will prevent Traffic Manager to send traffic to web app having older version web site
1. Save
1. Add Post Deployment Approval at Pre-Production stage
1. Change the code in index page - v?"
1. Wait for pipelines to complete.
1. Open Traffic Manager Profile and notice that second end point is in place
1. Once Pipeline executed check traffic manager URL and notice nothing changed
1. Open the URL of Staging Web App and notice the changes are in place.
1. If senior manager has give approval then open pipeline and approve
1. After some time traffic manager url will also show latest changes

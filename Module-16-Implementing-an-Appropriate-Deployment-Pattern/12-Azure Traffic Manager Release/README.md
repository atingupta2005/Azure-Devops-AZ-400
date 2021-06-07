# Setup Azure Traffic Manager
1. Create two web Apps - productionwebapp1000, stagingwebapp1000
1. Create ASP Dot Net Core Wep App in Visual Studio
1. Change index file - "This the the production version1"
1. Publish to Azure Web App - productionwebapp1000
1. Inspect the URL
1. Create Another ASP Dot Net Core Wep App in Visual Studio
1. Change index file - "This the the production version2"
1. Publish and create new profile
1. Publish to stagingwebapp1000
1. Inspect the URL
1. Create Traffic Manager
1. Routing method - Priority
1. Open Traffic Manager Resource\Endpoints
1. Add both the end points - production priority is 1 and staging with priority - 2
1. Open Traffic Manager Resource\Configuration
1. Protocol - HTTPS, Port -443
1. Save
1. Check Overview and wait till Monitoring Status is complete
1. Take DNS name of Traffic Manger Resource and open on browser
1. Stop Production Web App
1. Take DNS name of Traffic Manger Resource and open on browser
1. It would show from staging web app


# Automate the Azure Traffic Manager with Azure Pipelines
1. Start Production Web App
1. Open Traffic Manager Profile\Endpoint-Version 2
1. Delete endpoint
1. Create new Git Repo - trafficmanager
1. Push Code to this Repo
1. Create a build pipeline
1. Delete the test task from pipeline code
1. Add task - Publish build artifacts
1. Save and run
1. Create release pipeline with empty job - Traffic Manager
1. Add stage - Pre-Production
1. Add artifact
1. Add task to the stage - Pre-Production
1. Add Task - Azure App Service Deploy - staging web app
1. Add Task - Azure CLI - Powershell, Inline Script
    - $webid=az resource list --name 'stagingweb1000' --query [].id --output tsv
      $id = '"{0}"' -f $webid
      az network traffic-manager endpoint create -g newgrp1 --profile-name app-profile1000 -n endpoint-version2 --type azureEndpoints --target-resource-id $id --endpoint-status enabled --priority 2
1. Save and Create Release
1. Add another stage in serial with empty job - Production
1. Add Task - Azure App Service Manage - Stop Web Service, productionwebapp1000
1. Save
1. Add Continuous Deployment trigger
1. Add Prost Deployment Approval at Pre-Production stage
1. Change the code in index page - v3"
1. Wait for pipelines to complete.
1. Open Traffic Manager Profile and notice that second end point is in place
1. Once Pipeline executed check traffic manager URL and notice nothing changed
1. Open the URL of Staging Web App and notice the changes are in place.
1. If senior manager has give approval then open pipeline and approve
1. After some time traffic manager url will also show latest changes

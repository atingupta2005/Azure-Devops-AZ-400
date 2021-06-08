# Azure Pipelines Using ACR

## Understand how ACR and ACI works
### Create  ACR Manually
1. Create Azure Container Registry using Azure Portal named - appregistry1000atin

### Create Docker Image and upload image to ACR
1. Run the commands on Linux Machine Docker
```
sudo az login

// Login into your Azure container registry
// Change the registry name
sudo az acr login --name appregistry1000atin

// Tag your image
// Change the registry name
sudo docker tag dotnetapp appregistry1000atin.azurecr.io/dotnetapp

// Then push the image onto Azure container registry
// Change the registry name
sudo docker push appregistry1000atin.azurecr.io/dotnetapp
```

### Create ACI using the Image uploaded to ACR
1. Open Azure Portal\Container Registry\My ACR\Registries and Refresh
1. Open ACR\Access Keys and enable Admin user option
1. Create Azure Resource - Azure Container Instance. Chose Image Source -> ACR
1. Chose ACR, Image and tag
1. Networking Tab -> Public, Port 80
1. Grab Public IP of ACI and open on browser
1. Open ACI\Containers. Inspect Events, Properties, Logs
1. To connect to container, click on Connect
1. All files are there in /app inside container
```
ls /app
```

## Create Azure Pipeline to use Docker container to build the project and publish artifacts

### Note: Details of System Defined variables
- Used in pipelines
- Build folder - $(build.artifactStagingDirectory)
- Default Working Directory - $(System.DefaultWorkigDirectory)

### Build Pipelines - Build using Container
- To use Containers to have different build/release environment

1. Create a build pipeline
1. Modify it - code from [pipeline-container.txt](pipeline-container.txt)
1. Save and run
1. Inspect Job logs


### Build Pipelines - Publish Artifacts
1. Create build pipeline - [pipeline-container-azure-web-app.txt](pipeline-container-azure-web-app.txt)
1. Modify pipeline code as needed
1. Save and build

### Release Pipeline to Release to Azure Web App
1. Create Azure Web app to release to
1. Create release pipeline
1. Configure Pipeline to release to the Azure Web App
1. Save and create release
1. Check Azure Web app URL on browser

## Create Azure Build Pipeline to build project and package artifacts in Docker Image and Publish web site using ACI
### Understand how to manually publish Docker Image to ACR
- In previous steps we used Docker commands in the Build Pipeline to Build artifacts
- Now let's use ACR tasks to package our build artifacts to Docker Image
1. Login to Linux VM having Docker installed
2. Run below commands
```
az login
az acr login --name appregistry1000atin
docker images
```

1. Move to the directory which contains Dockerfile
1. Run below commands
```
az acr build --image appnew:latest --registry appregistry1000atin --file Dockerfile .
```

1. Refere ACR Registry on Azure Portal to make sure that image is pushed

## 7-Azure Pipelines - Publish to ACR
- We need to build Docker image using pipeline
- Then deploy that docker image to ACR using pipeline
- We need to build multistage Dockerfile so that the DotNet code can be built first from the source code

1. For the Dockerfile, put the content (from [ACR_Dockerfile.txt](ACR_Dockerfile.txt)) in a file - Dockerfile
1. Place Dockerfile as part of your code or upload it to your Azure Repos - Git repository
1. Create a new Azure Repo - docker-repo
1. Create a new ASP.Net Core Web App and place Docker file in root folder
1. Change Index page - Welcome to Azure Pipelines - Docker
1. Push code from VSCode to Azure Repo
1. Open ACR and remove Repositories from it if any
1. Also stop the ACI if any in Azure Portal
1. Create a new build pipeline
1. Chose task - Docker (Build and Push an image to ACR), Image name: dotnetapp
1. In pipeline code change the tag to latest
1. Save and Run
1. Visit ACR\Repositories and refresh to view the newly pushed docker image
1. Open ACI and start it. It will now take the latest image
1. Grab public ip of ACI and open in browser

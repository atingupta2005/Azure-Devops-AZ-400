# Azure Pipelines Using ACR

## Create  ACR Manually
1. Create Azure Container Registry using Azure Portal named - appregistry1000atin

## Create Azure Pipeline to use Docker container to build the project and publish artifacts

### Note: Details of System Defined variables
- These variables are used in build pipelines
  - Build folder - $(build.artifactStagingDirectory)
  - Default Working Directory - $(System.DefaultWorkigDirectory)

### Azure Pipelines with ACR
#### Publish to ACR
- We need to build Docker image using pipeline
- Then deploy that docker image to ACR using pipeline
- We need to build multistage [Dockerfile](Dockerfile) so that the DotNet code can be built first from the source code
- Note: We need to create a service connection to Docker (ACR) as well before we can build the pipeline

- Steps
  1. Create a new Azure Repo by importing from GitHub - core-web-app-docker
    - https://github.com/atingupta2005/core-web-app-docker.git
  1. This git repo has a Dockerfile to build docker image
  1. Open ACR and remove Repositories from it if any
  1. Create a new build pipeline using azure repo - core-web-app-docker. Replace pipeline code from - [pipeline.txt](pipeline.txt)
  1. Now we need to modify the value of variables
    - containerRegistry
    - dockerRegistryServiceConnection
  1. Save and Run
  1. Visit ACR\Repositories and refresh to view the newly pushed docker image

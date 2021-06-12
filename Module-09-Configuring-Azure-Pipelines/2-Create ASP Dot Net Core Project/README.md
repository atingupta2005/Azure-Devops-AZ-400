# Create Pipeline
1. Create a ASP Dot Net Core App
1. Create a Repo in Azure named - app-code
1. Push Project to Azure Repo
1. Create a pipeline

## Tasks References:
 - https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/?view=azure-devops

## Build and test ASP.NET Core projects targeting the full .NET Framework
  - Add steps that publish symbols, save build artifacts, and more:
 - Refer
   - https://docs.microsoft.com/azure/devops/pipelines/languages/dotnet-core

### Pipeline Code
 ```
 trigger:
 - master

 pool:
   vmImage: 'windows-latest'

 variables:
   solution: '**/*.sln'
   buildPlatform: 'Any CPU'
   buildConfiguration: 'Release'

 steps:
 - task: NuGetToolInstaller@1

 - task: NuGetCommand@2
   inputs:
     restoreSolution: '$(solution)'

 - task: VSBuild@1
   inputs:
     solution: '$(solution)'
     msbuildArgs: '/p:DeployOnBuild=true /p:WebPublishMethod=Package /p:PackageAsSingleFile=true /p:SkipInvalidConfigurations=true /p:DesktopBuildPackageLocation="$(build.artifactStagingDirectory)\WebApp.zip" /p:DeployIisAppPath="Default Web Site"'
     platform: '$(buildPlatform)'
     configuration: '$(buildConfiguration)'
 ```

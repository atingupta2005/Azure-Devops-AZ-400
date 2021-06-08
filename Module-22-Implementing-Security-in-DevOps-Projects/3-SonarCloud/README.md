# SonarCloud

## Setup SonarCloud
- Create an account on sonarcloud.io
- Create an organization
- Chose Free Plan
- Create project
- Generate token
  - Open "My Account" from top right
  - Open Security Tab and Generate token
  - Copy this token in notepad. We will need it later

### Important Notes
- We need to make sure that the Devops Project which we need to analyze in SonarCloud should be public
- Free version of SonarCloud clooud has restriction to only work with public projects
- At the other hand in Azure Devops, there is a restriction in terms of agent pools if the project type is public
- To workaround with this, we will first create a public project in Azure  Devops
- Then setup in SonarCloud.io
- After all settings are done, we can again make the Devops project as private and then run the Build Pipeline

## Azure Devops
- Create new repository
- If required, Import a ASP.net core application in Azure Repo
  - https://github.com/atingupta2005/devops-dotnet-testing-project-code-coverage
- Install Extension in organization - SonarCloud
- Open Project Settings and add a service connection to sonarcloud
  - Create service connection named - sonar-connection
  - Chose SonarCloud
  - Specify token we retrieved previously
  - Verify
  - Give connection name and save
- Create Build Pipeline
- Chose azure repo - devops-dotnet-testing-project-code-coverage
- Replace the code from [pipeline-code.txt](pipeline-code.txt)
- Configure the pipeline tasks of SonarCloud settings as needed
  - SonarCloudPrepare
    - Update organization
      - SonarCloud organization name
    - projectKey
      - Its the key which is generated when we create project in sonarcloud
    - projectName
      - Its generated when we create project in sonarcloud
- Run Pipeline
- Open SonarCloud results and review

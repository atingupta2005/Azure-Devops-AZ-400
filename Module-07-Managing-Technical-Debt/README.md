# Lab: Managing technical debt with SonarCloud and Azure DevOps
## Lab overview

- Technical debt affects productivity by making code hard to understand, prone to failures, time-consuming to change, and difficult to validate.
- Without proper oversight and management, technical debt can accumulate over time and significantly impact the overall quality of the software and the productivity of development teams in the longer term.

[SonarCloud](https://sonarcloud.io/) is a cloud-based code quality and security service

In this lab, you will learn how to integrate Azure DevOps Services with SonarCloud.

## Instructions

### Before you start

#### Set up an Azure DevOps organization.

#### Task 1: Create the team project

1.  Navigate to the [**Azure DevOps portal**](https://dev.azure.com)
1.  Click **+ New project**.
1.  **Project name** - **SonarExamples**, in the **Visibility** section, click **Private**, and then click **Create**.
1.  Click **Repos**, in the **Import a repository** section, click **Import** - https://github.com/SonarSource/sonar-scanning-examples.git

#### Task 2: Generate an Azure DevOps personal access token
#### Note: Please copy token in a notepad as well
1.   In the upper right corner of the Azure DevOps page, click the **User settings** icon, click **Personal access tokens**, click **+ New Token**.
1.   Click the **Show all scopes** link and, specify the following settings:

     | Setting | Value |
     | --- | --- |
     | Name | **Managing technical debt with SonarCloud and Azure DevOps lab** |
     | Scopes | **Custom defined** |
     | Scope | **Code** |
     | Permissions | **Read & write** |

1.   Copy the value of the personal access token
#### Note: Please copy token in a notepad as well

#### Task 3: Install and configure the SonarCloud Azure DevOps extension

1.  Navigate to the [SonarCloud extension page](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarcloud), click **Get it free**, ensure that the name of your Azure DevOps organization appears in the **Select an Azure Devops organization** dropdown list, and click **Install**.
1.  Once the installation completes, click **Proceed to organization**.
1.  Navigate to the **SonarCloud home page** [https://sonarcloud.io/](https://sonarcloud.io/).
1.  Click **Log in**.
1.  Click **With Azure DevOps**.
1.  When prompted whether to **Let this app access your info?**, click **Yes**.

1.  On the **Welcome to SonarCloud** page, click **Import project from Azure**.
1.  On the **Create an organization** page, in the **Azure DevOps organization name** textbox, type the name of your Azure DevOps organization, in the **Personal Access Token** textbox, paste the value of the token you recorded in the previous exercise, and click **Continue**.
1.  In the **Import organization settings** section, in the **Key** textbox, type a string of characters that will designate your organization and click **Continue**.
1.  On the **Analyze projects - Select repositories** page, in the list of Azure DevOps projects, select the checkbox next to the **SonarExamples / SonarExamples** entry and click **Set up**.
1.  On the **Analyze your project** page, click **With Azure DevOps Pipeline** tile.
1.  On the **Analyze with Azure Pipelines** page, in the **Install our extension** section, click **Continue**.

1.  On the **Analyze with Azure Pipelines** page, in the **Configure Azure Pipelines** section, click **.NET**. This will display a sequence of steps required to **Prepare Analysis Configuration**, **Run Code Analysis**, and **Publish Quality Gate Result**.

### Exercise 1: Set up an Azure DevOps pipeline that integrates with SonarCloud

#### Task 1: Initiate creation of the project build pipeline

In this task, you will begin creating the build pipeline for our project.

1.  Open Devops project **SonarExamples** and then click **Create Pipeline**.
1.  On the **Where is your code?** pane, review the available options.

#### Task 2: Create a pipeline by using the YAML editor

1.  Open another browser tab, open Devops Project **SonarExamples**
1.  Click **Project settings**.
1.  Click **Service connections** and click **Create service connection**.
1.  Select the **SonarCloud** option and click **Next**.
1.  Paste the value of the token
1.  Switch back to the web browser tab displaying the **Where is your code?** pane.
1.  On the **Where is your code?** pane, click **Azure Repos Git**.
1.  On the **Select a repository** pane, click **SonarExamples**.
1.  On the **Configure your pipeline** pane, click **.NET Desktop** YAML template.

    > **Note**: This will automatically display the YAML editor with the template YAML file open. In order to configure it correctly you will need to adjust it (or replace it) so that matches the following file:

```
trigger:
- master

pool:
  vmImage: 'windows-latest'

variables:
  buildConfiguration: 'Release'
  buildPlatform: 'any cpu'

steps:
- task: NuGetToolInstaller@0
  displayName: 'Use NuGet 4.4.1'
  inputs:
    versionSpec: 4.4.1

- task: NuGetCommand@2
  displayName: 'NuGet restore'
  inputs:
    restoreSolution: '**\SomeConsoleApplication.sln'

- task: SonarCloudPrepare@1
  displayName: 'Prepare analysis configuration'
  inputs:
    SonarCloud: 'sonarcloud-connection'
    organization: 'myorga'
    scannerMode: 'MSBuild'
    projectKey: 'dotnet-framework-on-azdo'
    projectName: 'SonarExamples'


- task: VSBuild@1
  displayName: 'Build solution **\*.sln'
  inputs:
    solution: '**\SomeConsoleApplication.sln'
    platform: '$(BuildPlatform)'
    configuration: '$(BuildConfiguration)'

- task: VSTest@2
  displayName: 'VsTest - testAssemblies'
  inputs:
    testAssemblyVer2: |
      **\$(BuildConfiguration)\*Test*.dll
      !**\obj\**
    codeCoverageEnabled: true
    platform: '$(BuildPlatform)'
    configuration: '$(BuildConfiguration)'

- task: SonarCloudAnalyze@1
  displayName: 'Run SonarCloud analysis'

- task: SonarCloudPublish@1
  displayName: 'Publish results on build summary'
```

    > **Note**: The YAML pipeline needs to be modified by following the remaining steps in this task.

1.  In the **SonarCloudPrepare@1** task, replace the value of the `myorga` placeholder in the `organization: 'myorga'` entry with the name of your SonarCloud organization.
1.  In the **SonarCloudPrepare@1** task, replace the value of the `dotnet-framework-on-azdo` placeholder in the `projectKey: 'dotnet-framework-on-azdo'` entry with the name of your SonarCloud project key.
1.  On the **Review your pipeline YAML** pane, click **Save and Run** and, on the **Save and run** pane, click **Save and run**.
1. Change name of service connection if required in task - SonarCloudPrepare@1

#### Task 3: Check pipeline results
1.  On the build run pane, review the content of the **Summary** tab and then click the **Extensions** tab header.

1.  On the **Extensions** tab, click the **Detailed SonarCloud report**. This will automatically open a new browser tab displaying the report on your SonarCloud project page.

1.  Verify that the report does not include the Quality Gate results and note the reason for its absence.

    > **Note**: To be able to see the Quality gate result, after running he first report we need to set **New Code Definition**. This way, subsequent pipeline runs will include Quality Gate results.

1.  On the **Overview** tab of the SonarCloud project, click **Set New Code definition**.
1.  On the **Administration** tab of the SonarCloud project, click **Previous version**.
1.  Switch to the web browser window displaying the **SonarExamples** project pane in the Azure DevOps portal with the most recent build run, click **Run new** and, on the **Run pipeline** pane, click **Run**.
1.  On the build run pane, review the content of the **Summary** tab and then click the **Extensions** tab header.
1.  On the **Extensions** tab, click the **Detailed SonarCloud report**. This will automatically open a new browser tab displaying the report on your SonarCloud project page.
1.  Verify that the report now includes the Quality Gate result.

### Exercise 3: Implement Azure DevOps pull request integration with SonarCloud

In this exercise, you will set up pull request integration between Azure DevOps and SonarCloud.

> **Note**: In order to configure SonarCloud analysis to perform analysis of code included in an Azure DevOps pull request, you need to perform the following tasks:

- Add an Azure DevOps personal access token to a SonarCloud project, which authorizes its access to pull requests.
- Configure an Azure DevOps branch policy that controls a pull request-triggered build

#### Task 1: Create an Azure DevOps personal access token for pull request integration with SonarCloud

In this task, you will review the personal access token requirements for implementing Azure DevOps pull request integration with a SonarCloud project.

1.  Copy PAT we created earlier or create a new one

#### Task 2: Configure pull request integration in SonarCloud

1.  Open SonarCloud project - **SonarExamples**
1.  On the project's dashboard page, click the header of the **Administration** tab and, in the dropdown menu, click **General Settings**.
1.  On the **General Settings** page, click **Pull Requests**.
1.  In the **General** section of the **Pull Requests** settings, in the **Provider** dropdown list, select **Azure DevOps Services** and click **Save**.
1.  In the **Integration with Azure DevOps Services** section of the **Pull Requests** settings, in the **Personal access token** textbox, paste the previously generated Azure DevOps personal access token and click **Save**

#### Task 3: Configure a branch policy for integration with SonarCloud

In this task, you will configure an Azure DevOps branch policy for integration with SonarCloud.

1.  Switch to the web browser window displaying the **SonarExamples** project in the Azure DevOps portal.
1.  In the **Repos** section, click **Branches**.
1.  In **master** click **Branch policies**.
1.  On the **master** pane, to the right of the **Build Validation** section, click **+**.
1.  Select the pipeline you created earlier in this task, in the **Display name** textbox, type **SonarCloud analysis** and click **Save**.

    > **Note**: Azure DevOps is now configured to trigger a SonarCloud analysis when any pull request targeting the **master** branch is created.

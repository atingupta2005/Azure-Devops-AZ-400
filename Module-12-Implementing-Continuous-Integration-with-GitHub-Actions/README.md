# Lab: Implementing GitHub Actions by using DevOps Starter
## Lab overview

In this lab, you will learn how to implement a GitHub Action workflow that deploys an Azure web app by using DevOps Starter.

## Instructions

### Exercise 1 : Create a DevOps Starter project

#### Task 1: Create DevOps Starter project

In this task, you will create an Azure DevOps Starter project that automatically sets up a GitHub repository, as well as creates and triggers a GitHub workflow that deploys an Azure web app, based on the content of the GitHub repository.

1.  In the Azure portal, search for and select the **DevOps Starter** resource type and add new resource
1.  Click the **here** link in the **Setting up DevOps starter with GitHub, click here** text.
1.  On the **DevOps starter settings** blade, ensure that the **GitHub** tile is selected and click **Done**.
1.  Click **Next: Framework >**.
1.  On the **Choose an application framework** page of the **DevOps Starter** blade, select the **ASP.NET Core** tile and click **Next: Service >**.
1.  On the **Select an Azure service to deploy the application** page of the **DevOps Starter** blade, ensure that the **Windows Web App** tile is selected and click **Next: Create >**.
1.  On the **Select Repository and Subscription** page of the **DevOps Starter** blade, click **Authorize**.
1.  When prompted, in the pop-up web browser window, click **Continue**.
1.  Back on the **Select Repository and Subscription** page of the **DevOps Starter** blade, specify the following settings and click **Review + Create**:

    | Setting | Value |
    | ------- | ----- |
    | Organization | the name of GitHub account |
    | Repository | **az400m08l01** |
    | Subscription | the name of the Azure subscription you are using for this lab |
    | Web app name | any valid, globally unique host name in the **azurewebsites.net** DNS namespace |
    | Location | the name of any Azure region in which you can provision an Azure web app |

    > **Note**: Wait for the provisioning to complete. This should take about 1 minute.

1.  **Go to Resource**.
1.  On the **GitHub Workflow** tile, click **Authorize**.
1.  Click **Authorize** again.
1.  Back on the **az400m08l01** blade, monitor the progress of actions on the **GitHub Workflow** tile.

    > **Note**: Wait for the build, deployment, and functional tests jobs of the GitHub workflow to complete. This should take about 5 minutes.

#### Task 2: Review the results of creating the DevOps Starter project

In this task, you will review the results of creating the DevOps Starter project.

1.  In the web browser window displaying the Azure portal, on the **az400m08l01** blade, review the **GitHub Workflow** section and verify that the **build**, **deploy**, and **Functional tests** jobs completed successfully.
1.  On the **az400m08l01** blade, review the **Azure resources** section and verify that they include an App Service web app instance and the corresponding Application Insights resource.
1.  At the top of the **az400m08l01** blade, note the link to the **Workflow file** and the GitHub repository you created in the previous task.
1.  At the top of the **az400m08l01** blade, click the link to the GitHub repository.
1.  On the GitHub repository page, note the three folders labeled:

    - **.github\workflows** - containing the YAML-formatted workflow file
    - **Application** - containing the code of the sample web site
    - **ArmTemplates** - containing the Azure Resource Manager templates that the workflow uses to provision Azure resources

1.  On the GitHub repository page, click **.github/workflows** and then, click the **devops-starter-workflow.yml** entry.
1.  On the GitHub repository page displaying the content of the **devops-starter-workflow.yml**, review its content and note that it contains the **build**, **deploy**, and **Functional tests** job definitions.
1.  On the GitHub repository page, in the toolbar, click **Actions**.
1.  On the GitHub repository page, on the **Actions** tab, in the **All workflows** section, click the entry representing the most recent workflow run.
1.  On the workflow run page, review the workflow status, as well as the listing of **Annotations** and **Artifacts**.
1.  On the GitHub repository page, in the toolbar, click **Settings** and, on the **Settings** tab, click **Secrets**.
1.  On the **Action secrets** pane, note the **AZURE_CREDENTIALS** entry, representing the credentials necessary to access the target Azure subscription.
1.  Navigate to the **az400m08l01/Application/aspnet-core-dotnet-core/Pages/Index.cshtml** GitHub repository page and, in the upper right corner, click the pencil icon to switch to the edit mode.
1.  Change the line 20 to `<div class="description line-1"> GitHub Workflow has been successfully updated</div>`.
1.  Scroll down to the bottom of the page and click **Commit changes**.
1.  On the GitHub repository page, in the toolbar, click **Actions**.
1.  In the **All workflows** section, click the **Update Index.cshtml** entry.
1.  In the **devops-starter-workflow.yml** section, monitor the progress of deployment and verify that it completed successfully.
1.  Switch to the browser window displaying the DevOps Starter blade in the Azure portal and click the **Browse** link next to the **Application endpoint** entry.
1.  In the newly opened web browser window, verify that the updated text representing the change you committed in the GitHub repo is displayed on the web app home page.

### Exercise 2: Remove the Azure lab resources

In this exercise, you will remove the Azure resources provisioned in this lab to eliminate unexpected charges.

>**Note**: Remember to remove any newly created Azure resources that you no longer use. Removing unused resources ensures you will not see unexpected charges.

#### Task 1: Remove the Azure lab resources

In this task, you will use Azure Cloud Shell to remove the Azure resources provisioned in this lab to eliminate unnecessary charges.

1.  In the Azure portal, open the **Bash** shell session within the **Cloud Shell** pane.
1.  List all resource groups created throughout the labs of this module by running the following command:

    ```sh
    az group list --query "[?starts_with(name,'az400m08l01')].name" --output tsv
    ```

1.  Delete all resource groups you created throughout the labs of this module by running the following command:

    ```sh
    az group list --query "[?starts_with(name,'az400m08l01')].[name]" --output tsv | xargs -L1 bash -c 'az group delete --name $0 --no-wait --yes'
    ```

    >**Note**: The command executes asynchronously (as determined by the --nowait parameter), so while you will be able to run another Azure CLI command immediately afterwards within the same Bash session, it will take a few minutes before the resource groups are actually removed.

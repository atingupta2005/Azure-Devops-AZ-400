# Triggering Pipeline from GitHub

- Steps for integration with GitHub
  - Create a new GitHub repo - pipeline
  - Create a simple ASP dot net core app in Visual Studio
  - Push code to GitHub
  - Create a new pipeline
  - Pickup code from GitHub
  - Chose GitHub Repo - pipeline
  - Approve and Install Azure pipelines in GitHub
  - Remove the Test related steps from pipeline code
  - Also change the trigger branch  in pipeline code if required
  - Run the pipeline

- Steps for auto trigger
  - Specify the master branch name in the pipeline trigger section
  - Do changes in Source code and commit to azure repo
  - Notice that pipeline has been triggered automatically

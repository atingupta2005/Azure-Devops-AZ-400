# Code Coverage

1. Import GitHub repo to Azure repo
  - https://github.com/atingupta2005/devops-dotnet-testing-project-code-coverage
  - This project has a nuget package - coverlet.msbuild installed in UnitTest project
1. Create new pipeline using azure git repo we Imported
  - Project type: # ASP.NET Core (.NET Framework)
  - replace code with the code from - [pipeline-code.txt](pipeline-code.txt)
1. Run the pipeline
1. Once job is complete, open Code Coverage report

# Azure Artifacts
## Create a new package
- Create New Project - Class Library Dot Net Core
	- https://github.com/atingupta2005/democonsoleatin
- Name: applibraryjulyeyatin
- Target Framework: .Net Core 3.1
- Rename class - app.cs

- Added simple method in class
```
public void Display()
{
	Console.WriteLine("This is the app class");
}
```
- Right click project\ Click Properties and specify details of the package
- Build Solution - STRL+SHIFT+B
- Right click on project and click Pack


## (Important to be done) Connect Visual Studio to the Azure Artifacts
- Open Artifacts in Devops Project
- Click **+ Create feed** - atinapplibrary.shared.ey.june21 and disable upstream sources
- Click **Connect to feed**
- Select **Visual Studio** and, copy the **Source** url
- In the Visual Studio window, Open NuGet Package Manager, Package Manager Settings
- Add package source named - atinapplibrary.shared.ey.june21
- URL which we taken in last step
- Click **Update** and then click **OK**
1.  Close and reopen Visual Studio

## Publish Package to Azure Artifacts
- Download https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
- Copy nuget.exe to C:\Windows
- Open applibraryjulyeyatin\bin\Debug folder of project in Powershell
- Run below command
```
nuget.exe push -Source "atinapplibrary.shared.ey.june21" -ApiKey az applibraryjulyeyatin.1.0.0.nupkg
```


## Create new Project
- Clone from - https://github.com/atingupta2005/applibraryjulyeyatin.git
- Project type: Console App (.Net Core)
- Name: democonsoleatin
- Open Manage NuGet packages
- Specify package source - atinapplibrary.shared.ey.june21
- Install the package we build in last step

## Use package in our project
- using applibraryjulyeyatin
- app obj = new app();
- obj.Display();
- Run the project

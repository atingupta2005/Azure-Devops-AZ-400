# Dockerize Dot Net app

## Optional Steps:
1. Create Dot Net Core Web App in Visual Studio
1. Edit content of index page - "Welcome to docker"
1. Open project folder in command prompt
```
cd "C:\Users\atingupta2005\source\repos\core-web-app-docker\core-web-app-docker"
```
1. run - dotnet publish
```
dotnet publish
```
1. cd <project dir>\bin\debug\netcoreapp3.1\publish
```
cd "C:\Users\atingupta2005\source\repos\core-web-app-docker\core-web-app-docker\bin\debug\netcoreapp3.1\publish"
dir
```
1. Copy the published folder to linux vm

- Note: We have zipped the published folder and copied to GitHub. We will directly downoad it on Linux VM. Follow below steps for the same

## Mandatory Steps
```
mkdir core-web-app-docker
cd core-web-app-docker
wget https://github.com/atingupta2005/Azure-Devops-AZ-400/raw/master/Module-19-Managing-Containers-using-Docker/1-Dockerize-Dot-Net-app/core-web-app-docker.zip
unzip core-web-app-docker.zip
rm core-web-app-docker.zip
```
1. Create/Download our Docker file in the directory copied to linux vm - refer [Dockerfile](Dockerfile)
```
wget https://raw.githubusercontent.com/atingupta2005/Azure-Devops-AZ-400/master/Module-19-Managing-Containers-using-Docker/1-Docker%20Basics/Dockerfile
```
1. Build image
```
sudo docker build -t dotnetapp .
```
1. Create container
```
sudo docker run -d -p 80:80 dotnetapp
```
1. Check the browser for your app
```
curl localhost
```

# Dockerize Dot Net app

Note: We have build a simple Dot Not Project and zipped the published folder and copied to GitHub. We will directly download it on Linux VM

## Steps
```
mkdir core-web-app-docker
cd core-web-app-docker
wget https://github.com/atingupta2005/Azure-Devops-AZ-400/raw/master/Module-19-Managing-Containers-using-Docker/1-Dockerize-Dot-Net-app/core-web-app-docker.zip
unzip core-web-app-docker.zip
rm core-web-app-docker.zip
#Create/Download our Docker file in the directory copied to linux vm - refer [Dockerfile](Dockerfile)
wget https://raw.githubusercontent.com/atingupta2005/Azure-Devops-AZ-400/master/Module-19-Managing-Containers-using-Docker/1-Dockerize-Dot-Net-app/Dockerfile
#Build image
sudo docker build -t dotnetapp .
#Create container
sudo docker run -d -p 80:80 dotnetapp
```

- Check the browser for your app
```
curl localhost
```

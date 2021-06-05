# Docker
## Remove Docker
```
sudo rm -rf /usr/local/bin/docker-compose
sudo apt-get remove -y docker docker-ce-cli docker-ce docker-engine docker.io containerd runc
```

## Install Docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER

sudo docker version

docker version
```

## Creating and Using Containers
### Starting a Nginx Web Server
```
docker container run --publish 80:80 --detach nginx
docker container ls
docker container stop 690
docker container ls -a
docker container rm -f 63f
docker container ls -a
```

### What's Going On In Containers: CLI Process Monitoring
```
docker container top nginx
```

### Getting a Shell Inside Containers
```
docker container run -it --name ubuntu ubuntu
docker container exec -it ubuntu bash
```

### Container Images
```
docker pull nginx
docker image ls
docker image tag nginx atingupta2005/nginx
docker image ls
docker login
docker image push atingupta2005/nginx
```

### Building Images: The Dockerfile Basics
```
mkdir dockerfile-sample-1
cd dockerfile-sample-1
vim Dockerfile

```

  - Docker file content:
```
#This is a sample Image
FROM ubuntu
MAINTAINER demousr@gmail.com

RUN apt-get update
RUN apt-get install –y nginx
CMD [“echo”,”Image created”]
```

### Building Images: Running Docker Builds
```
docker image build -t customnginx .
docker image ls
docker image build -t customnginx .
```

# Ansible
## Installation:
 - sudo apt update
 - git clone https://github.com/atingupta2005/ansible-30-min.git
 - cd ansible-30-min
 - sudo apt -y install software-properties-common
 - sudo apt-add-repository ppa:ansible/ansible
 - sudo apt -y update
 - sudo apt install -y ansible

## ssh-keygen
 - ssh-keygen -f ~/.ssh/demo_id_rsa
 - chmod 0600 ~/.ssh/demo_id_rsa

## Create Docker Containers
```
docker run --publish 8032:80 -itd --name ubuntu_atin_1 atingupta2005/ubunu_ssh_enabled ubuntu bash
docker run --publish 8132:80 -itd --name ubuntu_atin_2 atingupta2005/ubunu_ssh_enabled ubuntu bash
docker run --publish 8232:80 -itd --name ubuntu_atin_3 atingupta2005/ubunu_ssh_enabled ubuntu bash

docker inspect ubuntu_atin_1 | grep IPAddress
docker inspect ubuntu_atin_2 | grep IPAddress
docker inspect ubuntu_atin_3 | grep IPAddress
```

## Update Hosts and SSH Key File Path:
 - vim hosts

## Validate and obtain information about your Ansible inventory
 - ansible-inventory -i hosts --list

## Login to containers to start ssh
```
docker exec -it ubuntu_atin_1 bash
service ssh start
service ssh status
docker exec -it ubuntu_atin_2 bash
service ssh start
service ssh status
docker exec -it ubuntu_atin_3 bash
service ssh start
service ssh status
```

## Deploy Public Key to host
 - ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ip_of_container
 - ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ip_of_container
 - ssh-copy-id -i ~/.ssh/demo_id_rsa.pub demouser@ip_of_container
 - Note: Password: 2313634

## Test the key
 - ssh -i ~/.ssh/demo_id_rsa demouser@ip_of_container
   - exit
 - ssh -i ~/.ssh/demo_id_rsa demouser@ip_of_container
   - exit
 - ssh -i ~/.ssh/demo_id_rsa demouser@ip_of_container
   - exit


## Test Ansible is able to conenct to all hosts
 - ansible all -i hosts -m ping

## Running ad hoc commands
- ansible all -i hosts -a uptime
- ansible all -i hosts -a "free -m"
- ansible all -i hosts -a "df -h"

## Running Playbook
- vim first_playbook.yml
- ansible-playbook -i hosts first_playbook.yml -K

## Confirm content of the file in all hosts
- ansible all -i hosts -a "cat /tmp/testfile.txt"
- curl container_ip_address

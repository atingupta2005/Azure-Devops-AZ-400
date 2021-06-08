# Setup Ansible with Azure
- Create VM from image OpenLogic:CentOS:7.7:latest
	- Create using private key only


- SSH to the machine using putty
```
# Install Python 3 and pip.
sudo yum install -y python3-pip

# Install Ansible.
sudo pip3 install ansible[azure]

# Install Ansible modules and plugins for interacting with Azure.
ansible-galaxy collection install azure.azcollection

# Install required modules for Ansible on Azure
wget https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt

# Install Ansible modules
sudo pip3 install -r requirements-azure.txt
------------------------------------------------------------
```

- Create SP from Azure CLI Cloud Shell
```
az ad sp create-for-rbac --name vmAnsibleSP
```

- Note the output. Below is the sample output
```
{
  "appId": "2b42552b-f95e-4f1d-acdb-9eb9d4c03977",
  "displayName": "vmAnsibleSP",
  "name": "http://vmAnsibleSP",
  "password": "zXf.bqh~x0SeAIgARtVG._7TC7id7gyGpN",
  "tenant": "6bb2f9af-a0af-4c32-a5ec-5f7011d37551"
}
```

- Using Cloud shell Test if able to login to centos vm using private key
```
ssh -i /home/atin/.ssh/ansible_rsa azureuser@<IP of CentOS VM>

mkdir ~/.azure
```

- On CentOS VM, modify the details as required in below and store in the file - ~/.azure/credentials
```
nano ~/.azure/credentials
```

```
[default]
subscription_id=f536ca6e-c029-40e8-855e-81d14333f205
client_id=2b42552b-f95e-4f1d-acdb-9eb9d4c03977
secret=zXf.bqh~x0SeAIgARtVG._7TC7id7gyGpN
tenant=6bb2f9af-a0af-4c32-a5ec-5f7011d37551
```

- We can either export the environment variables
```
export AZURE_SUBSCRIPTION_ID=f59f28f7-7564-45a5-afab-ee85b854d725
export AZURE_CLIENT_ID=2b42552b-f95e-4f1d-acdb-9eb9d4c03977
export AZURE_SECRET=R0kHP3Zcn5l4~KFCoAqCKYyXLhZ1iD~PFm
export AZURE_TENANT=6bb2f9af-a0af-4c32-a5ec-5f7011d37551
```

- Inspect/Create ansible playbook which creates resource group
```
nano create_rg.yml
```
```
---
- hosts: localhost
  connection: local
  tasks:
    - name: Creating resource group - "{{ name }}"
      azure_rm_resourcegroup:
        name: "{{ name }}"
        location: "{{ location }}"
      register: rg
    - debug:
        var: rg
```

- Run ansible playbook
```
ansible-playbook create_rg.yml --extra-vars "name=atintestrgansible location=eastus"
```

- Create ansible playbook to delete the resource group
```
nano delete_rg.yml
```

```
---
- hosts: localhost
  tasks:
    - name: Deleting resource group - "{{ name }}"
      azure_rm_resourcegroup:
        name: "{{ name }}"
        state: absent
      register: rg
    - debug:
        var: rg
```

- Run playbook to delete resource
```
ansible-playbook delete_rg.yml --extra-vars "name=atintestrgansible"
```

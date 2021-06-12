# Writing Simple Playbooks for basic understanding

vim install_nginx_wget.yaml
```
---
 - name: This is a play to install wget and nginx packages on the web servers group
   hosts: all
   gather_facts: no
   become: yes
   tasks:
   - name: Installing nginx pkg
     apt: name=nginx state=present update_cache=yes
     become: yes
   - name: Installing wget pkg
     apt: name=wget state=present update_cache=yes
     become: yes
```

ansible-playbook install_nginx_wget.yaml

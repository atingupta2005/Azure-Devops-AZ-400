# YAML - Basics
- YAML is the abbreviated form of “YAML Ain’t markup language”
- Designed to be human -friendly and works well with other programming languages for everyday tasks.

## Rules for Creating YAML file
- YAML is case sensitive
- The files should have .yaml as the extension
- YAML does not allow the use of tabs while creating YAML files; spaces are allowed instead

## Basic Components of YAML File
### Conventional Block Format
- Uses hyphen+space to begin a new item
```
--- # Favorite movies
 - Casablanca
 - North by Northwest
 - The Man Who Wasn't There
```

### Inline Format
- Delimited with comma and space and the items are enclosed in JSON
```
--- # Shopping list
   [milk, groceries, eggs, juice, fruits]
```

### Folded Text
- Converts newlines to spaces and removes the leading whitespace
```
- {name: John Smith, age: 33}
- name: Mary Smith
  age: 27
```

### Synopsis of YAML Basic Elements
- Comments in YAML begins with the (#) character.
- Indentation of whitespace is used to denote structure.
- List members are denoted by a leading hyphen (-).
- List members are enclosed in square brackets and separated by commas.
- Associative arrays are represented using colon ( : ) in the format of key value pair. They are enclosed in curly braces {}.
- Multiple documents with single streams are separated with 3 hyphens (---).

## Indentation of YAML
- YAML does not include any mandatory spaces. Further, there is no need to be consistent. The valid YAML indentation is shown below −
```
a:
   b:
      - c
      -  d
      - e
f:
      "ghi"
```

## YAML Comments
- YAML supports single line comments
```
# this is single line comment.
```

- YAML does not support multi line comments

## Features of Comments
- Comments help to add description for specified code block.


## YAML - Full Length Example
```
---
# A list of tasty fruits
- Apple
- Orange
- Strawberry
- Mango
...
```

```
# An employee record
martin:
  name: Martin D'vloper
  job: Developer
  skill: Elite
```

```
# Employee records
- martin:
    name: Martin D'vloper
    job: Developer
    skills:
      - python
      - perl
      - pascal
- tabitha:
    name: Tabitha Bitumen
    job: Developer
    skills:
      - lisp
      - fortran
      - erlang
```

```
---
# An employee record
name: Martin D'vloper
job: Developer
skill: Elite
employed: True
foods:
  - Apple
  - Orange
  - Strawberry
  - Mango
languages:
  perl: Elite
  python: Elite
  pascal: Lame
education: |
  4 GCSEs
  3 A-Levels
  BSc in the Internet of Things
```

```
---
- hosts: webservers

  vars:
    http_port: 80
    max_clients: 200

  remote_user: root

  tasks:
  - name: ensure apache is at the latest version
    yum:
      name: httpd
      state: latest

  - name: write the apache config file
    template:
      src: /srv/httpd.j2
      dest: /etc/httpd.conf
    notify:
    - restart apache

  - name: ensure apache is running
    service:
      name: httpd
      state: started

  handlers:
    - name: restart apache
      service:
        name: httpd
        state: restarted
```

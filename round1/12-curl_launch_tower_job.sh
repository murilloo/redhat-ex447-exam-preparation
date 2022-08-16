#!/bin/bash

# Vars
user=admin
pass=password
url="https://tower.example.com"
api="/api/v2/job_templates/"
job="vaulted"
action="/launch/"
 
echo "Calling Ansible Tower API \n"

curl -X POST --user $user:$pass $url$api$job$action -ks

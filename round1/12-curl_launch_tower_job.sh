#!/bin/bash

# Credentials 
user=admin
pass=password

# Get Job ID based on the name
id=`curl -X GET --user admin:password https://tower.example.com/api/v2/workflow_job_templates/ -ks | jq '.results | .[] | select(.name=="your-workflow") | .id'`

# Calling API
curl -X POST --user $user:$pass https://tower.example.com/api/v2/workflow_job_templates/$id/launch/ -ks 2&> /dev/null

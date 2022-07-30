#!/bin/bash

# Generate encrypted password
# ansible all -i localhost, -m debug -a "msg={{ 'password' | password_hash('sha512', 'mysecretsalt') }}"

# Create user ansible
ansible all -m user -u root --ask-pass  -a 'name=ansible state=present password="$6$mysecretsalt$MIJffjeQyfrKKrGkprGrDL/g2mCJa53koLmYQuuLmY9y37pDvGKPXU1Ov3RbMi.tpQ9cWvxAzUVtBLe7KrZoU."'

# Add to sudoers
ansible all -m copy -u root --ask-pass -a 'content="ansible ALL=(ALL) NOPASSWD: ALL" dest=/etc/sudoers.d/ansible'

# Generate ssh key
ssh-keygen

# Create ssh keys
ssh-copy-id control.example.com
ssh-copy-id node1.example.com
ssh-copy-id node2.example.com

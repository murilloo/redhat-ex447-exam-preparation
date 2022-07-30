#!/bin/bash

# Create Ansible user
adduser ansible

# Set password for Ansible
echo password | passwd ansible --stdin

# Intall vim
sudo yum install -y vim

# Config Vim
echo "autocmd FileType yaml setlocal ai ts=2 sw=2 et" > /home/ansible/.vimrc
chown ansible:ansible /home/ansible/.vimrc

# Suscription RHEL 8.5
subscription-manager register --auto-attach

# Install Ansible 2.8
subscription-manager repos --enable=ansible-2.8-for-rhel-8-x86_64-rpms

# Install Ansible
yum install ansible -y

# Setup /etc/hosts
cat << EOF >> /etc/hosts
192.168.122.139 control control.example.com
192.168.122.247 node1 node1.example.com
192.168.122.59 node2 node2.example.com
EOF

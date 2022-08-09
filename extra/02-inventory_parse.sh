#!/bin/bash
ansible-inventory --yaml -i 02-inventory.ini --list --output 02-inventory.yml

# Make sure to edit and leave like:

#all:
#  children:
#    backend_server_pool:
#      hosts:
#        server[b:f].lab.example.com:
#    lb_servers:
#      hosts:
#        servera.lab.example.com: {}
#    ungrouped: {}
#    web_servers:
#      hosts:
#        serverb.lab.example.com: {}
#        serverc.lab.example.com: {}
#      vars:
#        alternate_server: serverd.lab.example.com



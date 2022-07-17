#!/bin/bash

ansible-galaxy collection install -f git@github.com:ucsb/library-ansible-collections-jira.git 
ansible-galaxy collection install -f git@github.com:ucsb/library-ansible-collections-core.git
ansible-galaxy collection install -f git@github.com:ucsb/library-ansible-collections-legacy.git

exit 0

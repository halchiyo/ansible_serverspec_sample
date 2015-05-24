#!/bin/bash

# Add Jenkins Shell as below.
# export WORKSPACE
# sh -x ${WORKSPACE}/jenkins-shell/02_build.sh

export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_FORCE_COLOR=true

ansible-playbook playbook/site.yml -i "playbook/stage" --syntax-check --list-tasks
ansible-playbook playbook/site.yml -i "playbook/stage" -vv
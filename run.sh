#!/usr/bin/env bash

sudo dnf install ansible

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ansible-galaxy collection install -r $SCRIPT_DIR/requirements.yml

if [ $# -ne 1 ]; then
    ansible-playbook $SCRIPT_DIR/setup.yml -K
else
    ansible-playbook $SCRIPT_DIR/setup.yml -K --extra-vars hostname=$1
fi

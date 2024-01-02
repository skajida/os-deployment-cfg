#!/usr/bin/env bash

SCRIPT_DIR=$(realpath $(dirname $BASH_SOURCE))

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "fedora" ]; then
        sudo dnf install -y ansible
    elif [ "$ID" = "rocky" ] || ["$ID" = "almalinux"]; then
        sudo dnf install -y ansible-core
    fi

    ansible-galaxy collection install -r $SCRIPT_DIR/requirements.yml

    if [ $# -ne 1 ]; then
        ansible-playbook $SCRIPT_DIR/setup.yml -K
    else
        ansible-playbook $SCRIPT_DIR/setup.yml -K --extra-vars hostname=$1
    fi  
fi

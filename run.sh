#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "fedora" ]; then
        sudo dnf install -y ansible
    elif [ "$ID" = "centos" ]; then
        sudo dnf install -y ansible-core
    fi
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ansible-galaxy collection install -r $SCRIPT_DIR/requirements.yml

cd $SCRIPT_DIR
if [ $# -ne 1 ]; then
    ansible-playbook setup.yml -K
else
    ansible-playbook setup.yml -K --extra-vars hostname=$1
fi

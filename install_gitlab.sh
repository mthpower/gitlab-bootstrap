#!/usr/bin/env bash
set -e

if [ ! -e ./install_salt.sh ]; then
    curl -L https://bootstrap.saltstack.com -o install_salt.sh
    chmod +x install_salt.sh
    ./install_salt.sh -X;
    ln -s $(pwd) /srv/salt
fi;

# ENV vars:
# EXTERNAL_URL

salt-call --local state.apply

#!/bin/bash

# if [ ! -f ~/.ssh/id_rsa.pub ]; then
#    ssh-keygen
#fi

mkdir -p /home/codespace/.ssh
chown codespace:codespace -R /home/codespace/.ssh
chmod 755 -R /home/codespace/.ssh

cp .devcontainer/.ssh/* /home/codespace/.ssh/
chmod 600 /home/codespace/.ssh/authorized_keys
chmod 600 /home/codespace/.ssh/id_rsa
chmod 644 /home/codespace/.ssh/id_rsa.pub
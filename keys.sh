#!/bin/bash

if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen
fi

echo "################"
echo ""

cat ~/.ssh/id_rsa.pub

echo ""
echo "################"

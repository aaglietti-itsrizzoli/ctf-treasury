#!/bin/bash

set -e

CC_HOST="oldmtl2sglxikhgtenomsgkrvkm5hgnvhhrqpnkryq7c4tunjpcw6tqd"

hidden_service=$1
echo "#####"
echo "Checking... ${hidden_service}"
treasure_count=$(ssh codespace@${hidden_service} 'tree /start | grep treasure.txt | wc -l')
echo "Treasure still alive: ${treasure_count}"
curl -d "count=${treasure_count}&hs=${hidden_service}" "http://${CC_HOST}.onion/cc/"
echo ""
echo "--"

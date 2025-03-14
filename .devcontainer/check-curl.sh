#!/bin/bash

set -e

hidden_service=$1
echo "#####"
echo "Checking... ${hidden_service}"
treasure_count=$(ssh codespace@${hidden_service} 'tree /start | grep treasure.txt | wc -l')
echo "Treasure still alive: ${treasure_count}"
curl -d "count=${treasure_count}&hs=${hidden_service}" "http://127.0.0.1/cc/"
echo ""
echo "--"

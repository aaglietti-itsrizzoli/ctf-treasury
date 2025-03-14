#!/bin/bash


echo "" > .devcontainer/ALL_MAZES.txt

curl --silent http://127.0.0.1/cc/ | jq -r '.hidden_services[] | @tsv' |
  while IFS=$'\t' read -r id team hidden_service count; do
    echo "$team $hidden_service" >> .devcontainer/ALL_MAZES.txt
  done

echo "DONE"
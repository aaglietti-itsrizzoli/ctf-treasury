#!/bin/bash

echo "" > .devcontainer/check-curls.sh

curl --silent http://127.0.0.1/cc/ | jq -r '.hidden_services[] | .[2]' |
  while IFS=$'\n' read -r hidden_service; do
    echo ".devcontainer/check-curl.sh $hidden_service" >> .devcontainer/check-curls.sh
  done

torify bash .devcontainer/check-curls.sh

echo "DONE"
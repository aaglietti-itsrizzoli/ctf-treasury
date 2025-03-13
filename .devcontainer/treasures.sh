#!/bin/bash

HOW_MANY=30

sudo rm -rf /start
sudo mkdir -p /start
sudo chmod 777 -R /start
ruby .devcontainer/maze.rb ${HOW_MANY} /start

touch /start/ENTRATA_${CODESPACE_NAME}

dst=`find /start -name 29`
echo "Tesoro #1 @ $CODESPACE_NAME" > treasure.txt
echo $dst >> treasure.txt
printf ${dst}${CODESPACE_NAME} | sha1sum - | awk '{print $1}' >> treasure.txt
cp treasure.txt ${dst}

dst=`find /start -name 09`
echo "Tesoro #2 @ $CODESPACE_NAME" > treasure.txt
echo $dst >> treasure.txt
printf ${dst}${CODESPACE_NAME} | sha1sum - | awk '{print $1}' >> treasure.txt
cp treasure.txt ${dst}

dst=`find /start -name 02`
echo "Tesoro #3 @ $CODESPACE_NAME" > treasure.txt
echo $dst >> treasure.txt
printf ${dst}${CODESPACE_NAME} | sha1sum - | awk '{print $1}' >> treasure.txt
cp treasure.txt ${dst}

dst=`find /start -name 07`
echo "Tesoro #4 @ $CODESPACE_NAME" > treasure.txt
echo $dst >> treasure.txt
printf ${dst}${CODESPACE_NAME} | sha1sum - | awk '{print $1}' >> treasure.txt
cp treasure.txt ${dst}

dst=`find /start -name 10`
echo "Tesoro #5 @ $CODESPACE_NAME" > treasure.txt
echo $dst >> treasure.txt
printf ${dst}${CODESPACE_NAME} | sha1sum - | awk '{print $1}' >> treasure.txt
cp treasure.txt ${dst}

rm treasure.txt

#!/bin/bash
# capture an interrupt # 0
# Shelley got this from Yijie Sun
trap 'echo "Control-C interrupt and kill all Three servers"'

# display something
export FLASK_APP=minitwit
flask initdb
export MINITWIT_SETTINGS=/config/server1.cfg
flask run --port 5000 &
server1=$!
export MINITWIT_SETTINGS=/config/server2.cfg
flask run --port 5001 &
server2=$(echo $!)
export MINITWIT_SETTINGS=/config/server3.cfg
flask run --port 5002 &
server3=$(echo $!)
echo $server1 $server2 $server3

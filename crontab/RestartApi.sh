#!/bin/bash
screen -S Web3NodeApi -X quit
screen -dmS Web3NodeApi
screen -x -S Web3NodeApi -p 0 -X stuff $"node /opt/build/api.js >> /opt/build/api.md 2>&1"
screen -x -S Web3NodeApi -p 0 -X stuff $"\n"
echo "～服务已启动～"

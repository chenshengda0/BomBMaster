#!/bin/bash
screen -S NodeApi -X quit
screen -dmS NodeApi
screen -x -S NodeApi -p 0 -X stuff $"/usr/local/bin/node /opt/build/crontab.js >> /opt/build/crontab.md 2>&1"
screen -x -S NodeApi -p 0 -X stuff $"\n"
echo "～服务已启动～"
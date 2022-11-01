#!/usr/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo -e "Y\n" | unminimize
#设置环境变量
for item in $(cat /proc/1/environ | tr '\0' '\n');do echo "export ${item}" >>  /etc/environment;done
sed -i "$ a source /etc/environment" ~/.bashrc

#执行screen
screen -dmS haproxyServer
screen -x -S haproxyServer -p 0 -X stuff $'haproxy -f /opt/haproxy.cnf'
screen -x -S haproxyServer -p 0 -X stuff $'\n'

date >> /opt/test.md

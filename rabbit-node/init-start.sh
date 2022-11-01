#!/usr/bin/bash

sudo -s
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo -e "Y\n" | unminimize
#设置环境变量
for item in $(cat /proc/1/environ | tr '\0' '\n');do echo "export ${item}" >>  /etc/environment;done
sed -i "$ a source /etc/environment" ~/.bashrc

sleep 1m
echo "sleep 300s" >> /opt/test.md
#启动服务,启动插件
rabbitmq-server -detached

echo 0
rabbitmq-plugins --offline enable rabbitmq_web_stomp

echo 1
rabbitmq-plugins --offline enable rabbitmq_web_stomp_examples
#rabbitmq-plugins --offline enable rabbitmq_management

rabbitmqctl stop_app
echo 2

rabbitmqctl reset
echo 3

rabbitmqctl join_cluster rabbit@rabbit-master --ram

echo 4
rabbitmqctl start_app



echo "init-start end"
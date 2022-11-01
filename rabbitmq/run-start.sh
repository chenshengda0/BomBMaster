#!/bin/bash

echo 1
/page/rabbitmq_server-3.6.13/sbin/rabbitmq-server -detached

echo 2
/page/rabbitmq_server-3.6.13/sbin/rabbitmq-plugins enable rabbitmq_management

echo 3
/page/rabbitmq_server-3.6.13/sbin/rabbitmq-plugins enable rabbitmq_web_stomp

echo 4
/page/rabbitmq_server-3.6.13/sbin/rabbitmq-plugins enable rabbitmq_web_stomp_examples

echo 5
/page/rabbitmq_server-3.6.13/sbin/rabbitmqctl add_user dream 231510622abc

echo 5
/page/rabbitmq_server-3.6.13/sbin/rabbitmqctl add_user information information

echo 6
/page/rabbitmq_server-3.6.13/sbin/rabbitmqctl set_user_tags dream administrator

echo 6
/page/rabbitmq_server-3.6.13/sbin/rabbitmqctl set_user_tags information management

echo 7
/page/rabbitmq_server-3.6.13/sbin/rabbitmqctl  set_permissions -p / dream ".*" ".*" ".*"

echo 7
/page/rabbitmq_server-3.6.13/sbin/rabbitmqctl  set_permissions -p / information ".*" ".*" ".*"


echo 8
setsid /page/haproxy-1.7.2/haproxy -f /page/haproxy-1.7.2/haproxy.cnf &
echo 9
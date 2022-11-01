#!/bin/bash
sudo -s
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo -e "Y\n" | unminimize
#设置密码
sed -i "s/^#Port.*$/Port 9122/" /etc/ssh/sshd_config
sed -i "s/^#PermitRootLogin.*/PermitRootLogin yes/" /etc/ssh/sshd_config
echo -e "123456\n123456" | passwd
#修改nginx配置
sed -i  's/octet-stream/json/' /etc/nginx/nginx.conf
sed -i 's/^\(.*sites-enabled.*\)$/#\1/g' /etc/nginx/nginx.conf
for item in $(cat /proc/1/environ | tr '\0' '\n');do echo "export ${item}" >>  /etc/environment;done
sed -i "$ a source /etc/environment" ~/.bashrc
#for item in $(cat /proc/1/environ | tr '\0' '\n');do sed -i "/^#PATH/ a export ${item}" /etc/crontab;done
#等待服务启动完成
#sleep 100
echo "* * * * * echo 'hello world\n' >> /opt/test.md 2>&1" >> ~/init-crontab
crontab ~/init-crontab
rm -rf ~/init-crontab
service ssh restart
service nginx restart
service cron restart
#执行screen
screen -dmS HttpServer
screen -x -S HttpServer -p 0 -X stuff $'/usr/local/bin/python /home/Api/index.py'
screen -x -S HttpServer -p 0 -X stuff $'\n'

echo "init-start end" >> /opt/test.md



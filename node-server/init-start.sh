#!/bin/bash
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo -e "Y\n" | unminimize
#设置环境变量
for item in $(cat /proc/1/environ | tr '\0' '\n');do echo "export ${item}" >>  /etc/environment;done
sed -i "$ a source /etc/environment" ~/.bashrc
#定时任务
echo "* * * * * date >> /opt/build/test.md 2>&1" >> ~/init-crontab
echo "* * * * * /opt/one_consumer.sh >> /opt/build/test.md 2>&1" >> ~/init-crontab
echo "* * * * * /opt/three_publish.sh >> /opt/build/test.md 2>&1" >> ~/init-crontab
echo "0 0 * * * /opt/RestartApi.sh >> /opt/build/test.md 2>&1" >> ~/init-crontab
echo "* * * * * /opt/RestartCrontab.sh >> /opt/build/test.md 2>&1" >> ~/init-crontab
crontab ~/init-crontab
rm -rf ~/init-crontab
service cron restart

/opt/RestartApi.sh
/opt/RestartCrontab.sh

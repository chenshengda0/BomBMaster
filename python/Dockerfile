FROM python:3.10
WORKDIR /opt
RUN apt -y update && apt -y upgrade && apt install -y man vim iproute2 xz-utils wget gcc git g++ sudo  inetutils-ping net-tools curl screen cron
RUN apt install -y nginx
RUN apt install -y --no-install-recommends openssh-server
RUN pip install numpy scipy matplotlib pandas flask mysql-connector ipython pymongo redis watchdog pika web3
COPY python/hiredis.tar.gz /opt/hiredis.tar.gz
COPY python/init-start.sh /opt/init-start.sh
COPY python/server.conf /etc/nginx/conf.d/server.conf
COPY python/config.pth /usr/local/lib/python3.10/site-packages/config.pth
RUN chmod -R 777 /opt/init-start.sh
RUN tar -xvf hiredis.tar.gz
WORKDIR /opt/hiredis
RUN make && make install && ldconfig && rm -rf /opt/hiredis.tar.gz
WORKDIR /home/Api
RUN sed -i -e "s/\r//" /opt/init-start.sh
EXPOSE 9090

CMD date > /home/test.md && python -m site >> /home/test.md && pip freeze >> /home/test.md && /opt/init-start.sh && echo "init-start end" >> /opt/test.md && while true;do sleep 3000;done
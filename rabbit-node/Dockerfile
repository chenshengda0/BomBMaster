FROM --platform=amd64 rabbitmq:3-management

RUN apt -y update && apt -y upgrade && apt install -y man vim iproute2 xz-utils wget gcc git g++ sudo  inetutils-ping net-tools curl screen cron
COPY ./rabbit-node/init-start.sh /opt/init-start.sh
COPY ./rabbit-node/.erlang.cookie /root/.erlang.cookie
RUN chmod -R 400 /root/.erlang.cookie
RUN sed -i -e "s/\r//" /opt/init-start.sh
RUN chmod -R 777 /opt/init-start.sh


CMD date >> /opt/test.md && /opt/init-start.sh >> /opt/test.md 2>&1 && while true; do sleep 3000;done

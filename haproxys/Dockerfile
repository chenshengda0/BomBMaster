FROM --platform=amd64 ubuntu

RUN apt -y update && apt -y upgrade && apt install -y man vim iproute2 xz-utils wget gcc git g++ sudo  inetutils-ping net-tools curl screen cron haproxy
COPY ./haproxys/haproxy.cnf /opt/haproxy.cnf
COPY ./haproxys/init-start.sh /opt/init-start.sh
WORKDIR /opt
RUN sed -i -e "s/\r//" /opt/init-start.sh
RUN sed -i -e "s/\r//" /opt/haproxy.cnf
RUN chmod -R 777 /opt/init-start.sh
RUN chmod -R 777 /opt/haproxy.cnf
EXPOSE 35672
EXPOSE 35674
EXPOSE 5670
EXPOSE 9999

CMD echo date >> /opt/test.md && /opt/init-start.sh && while true;do sleep 3000;done
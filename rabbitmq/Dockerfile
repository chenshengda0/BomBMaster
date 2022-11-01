FROM --platform=amd64 chenshengda/rabbitmq:v2

COPY ${PWD}/rabbitmq/haproxy.cnf /page/haproxy-1.7.2/
COPY ${PWD}/rabbitmq/run-start.sh /page/rabbitmq_server-3.6.13/sbin/
RUN chmod -R 777 /page/rabbitmq_server-3.6.13/sbin/run-start.sh
RUN sed -i -e "s/\r//" /page/rabbitmq_server-3.6.13/sbin/run-start.sh
WORKDIR /page/rabbitmq_server-3.6.13/sbin/
EXPOSE 5670

#RUN /page/rabbitmq_server-3.6.13/sbin/rabbitmq-plugins enable rabbitmq_management


CMD echo "hello world\n" >> test.md && /page/rabbitmq_server-3.6.13/sbin/run-start.sh && while true;do sleep 3000;done
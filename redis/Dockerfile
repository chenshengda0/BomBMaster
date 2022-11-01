FROM --platform=amd64 redis
COPY ./redis/redis.conf /usr/local/etc/redis/redis.conf
CMD echo "hello" > /opt/test.md && redis-server /usr/local/etc/redis/redis.conf && while true;do sleep 3000;done
FROM --platform=amd64 golang
WORKDIR /opt
RUN apt -y update && apt -y upgrade
RUN apt install -y man vim iproute2 xz-utils wget gcc git g++ sudo  inetutils-ping net-tools curl screen cron unzip liblz4-tool
RUN git clone https://github.com/bnb-chain/bsc
WORKDIR /opt/bsc
RUN make geth
WORKDIR /opt/bsc/build/bin
RUN wget   $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4)
RUN unzip mainnet.zip
#上传文件
COPY ./bsc/init-server.sh /opt/init-server.sh
RUN sed -i -e "s/\r//" /opt/init-server.sh
RUN chmod -R 777 /opt/init-server.sh
#上传文件
CMD date >> /opt/test.md && /opt/init-server.sh && while true;do sleep 3000;done
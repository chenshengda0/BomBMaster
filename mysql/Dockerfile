FROM --platform=amd64 mysql:8.0.29-debian

WORKDIR /opt
RUN apt -y update && apt -y upgrade 
RUN apt install -y vim sudo unzip
COPY mysql/test_db-master.zip /opt/test_db-master.zip
RUN unzip test_db-master.zip && rm -rf /opt/test_db-master.zip
WORKDIR /opt/test_db-master
COPY mysql/fileManage.sql /opt/test_db-master/fileManage.sql
COPY mysql/split_db.sql /opt/test_db-master/split_db.sql
COPY mysql/import-data.sh /opt/test_db-master/import-data.sh
RUN chmod -R 777 /opt/test_db-master/import-data.sh
RUN sed -i -e "s/\r//" /opt/test_db-master/import-data.sh

EXPOSE 3306
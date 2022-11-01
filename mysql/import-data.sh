#!/bin/bash
USER=root
PASSWORD=231510622abc
mysql -u$USER -p$PASSWORD < employees.sql
mysql -u$USER -p$PASSWORD < split_db.sql
echo "init test data to mysql" >> /opt/test.md
echo "delete test data" >> /opt/test.md

#!/bin/bash
#设置环境变量
for item in $(cat /proc/1/environ | tr '\0' '\n');do echo "export ${item}" >>  /etc/environment;done
sed -i "$ a source /etc/environment" ~/.bashrc
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#编辑文件
sed -i 's/^TrieTimeout.*$/TrieTimeout = 200000000000/' /opt/bsc/build/bin/config.toml
sed -i 's/^HTTPHost.*$/HTTPHost = "0.0.0.0"/' /opt/bsc/build/bin/config.toml
sed -i 's/^HTTPVirtualHosts.*$/HTTPVirtualHosts = ["*"]/' /opt/bsc/build/bin/config.toml
#设置软连接
ln -s /opt/bsc/build/bin/geth /usr/local/bin/geth
#启动节点
geth --datadir node init genesis.json >> /opt/test.md 2>&1
#设置screen
screen -dmS DexNode
screen -x -S DexNode -p 0 -X stuff $'geth --config ./config.toml --datadir ./node  --cache 8000 --rpc.allow-unprotected-txs --txlookuplimit 0'
screen -x -S DexNode -p 0 -X stuff $'\n'
#geth --config /data/bsc/config/config.toml --datadir /data/bsc/config/node  --cache 8000 --rpc.allow-unprotected-txs --txlookuplimit 0
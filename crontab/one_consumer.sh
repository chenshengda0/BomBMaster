#!/bin/bash
step=1 #间隔的秒数，不能大于60
for (( i = 0; i < 60; i=(i+step) )); do
{
    #获取交易对最新区块高度
    curl http://127.0.0.1:9090/consumer/set_height
    curl http://127.0.0.1:9090/consumer/set_height

    #消费获取交易对事件
    curl http://127.0.0.1:9090/consumer/set_pairs_by_id
    curl http://127.0.0.1:9090/consumer/set_pairs_by_id
    curl http://127.0.0.1:9090/consumer/set_pairs_by_id

    #消费获取V2交易对事件
    curl http://127.0.0.1:9090/consumer/set_v2_pairs_by_id
    curl http://127.0.0.1:9090/consumer/set_v2_pairs_by_id
    curl http://127.0.0.1:9090/consumer/set_v2_pairs_by_id

    #设置SWAP交易
    curl http://127.0.0.1:9090/consumer/set_transaction_swap_event
    curl http://127.0.0.1:9090/consumer/set_transaction_swap_event
    curl http://127.0.0.1:9090/consumer/set_transaction_swap_event

    #设置添加流动池
    curl http://127.0.0.1:9090/consumer/set_transaction_add_liquidity_event
    curl http://127.0.0.1:9090/consumer/set_transaction_add_liquidity_event
    curl http://127.0.0.1:9090/consumer/set_transaction_add_liquidity_event

    #设置移除流动池
    curl http://127.0.0.1:9090/consumer/set_transaction_remove_liquidity_event
    curl http://127.0.0.1:9090/consumer/set_transaction_remove_liquidity_event
    curl http://127.0.0.1:9090/consumer/set_transaction_remove_liquidity_event
} &
    sleep $step

done
exit
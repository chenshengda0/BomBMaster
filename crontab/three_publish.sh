#!/bin/bash
step=3 #间隔的秒数，不能大于60
for (( i = 0; i < 60; i=(i+step) )); do
{
    #发送获取交易对最新区块高度消息
    #curl http://127.0.0.1:9090/publish/send_trans_height
    
    #curl http://127.0.0.1:9090/publish/send_new_trans_height

    #发送PancakeV1交易对消息
    #curl http://127.0.0.1:9090/publish/push_pairs_by_id

    #发送PancakeV2交易对消息
    #curl http://127.0.0.1:9090/publish/push_v2_pairs_by_id

    #发送获取交易数据消息
    #curl http://127.0.0.1:9090/publish/send_trans_events

    #curl http://127.0.0.1:9090/publish/send_new_trans_events
} &
    sleep $step
done
exit
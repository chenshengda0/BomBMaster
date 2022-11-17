#!/bin/bash
for i in {0..999}
do
    #echo "ALTER TABLE sp_liquidity_transaction_${i} CHANGE token0_count token0_count DECIMAL(65,18) NOT NULL COMMENT 'token0数量';"
    #echo "ALTER TABLE sp_liquidity_transaction_${i} CHANGE token1_count token1_count DECIMAL(65,18) NOT NULL COMMENT 'token1数量';"
    echo "ALTER TABLE sp_transaction_${i} CHANGE from_number from_number DECIMAL(65,18) NOT NULL COMMENT '输入数量';"
    echo "ALTER TABLE sp_transaction_${i} CHANGE to_number to_number DECIMAL(65,18) NOT NULL COMMENT '输出数量';"
done
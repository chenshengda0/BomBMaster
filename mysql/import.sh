#!/bin/bash
USERNAME='replicater'
PASSWORD='XL@gDih!k&J$P7&*'
DBNAME="split_db"
for i in {0..999}
do

    drop_table_sql="DROP TABLE IF EXISTS sp_transaction_${i};"
    create_table_sql="
        CREATE TABLE IF NOT EXISTS sp_transaction_${i} (
            id bigint NOT NULL COMMENT '交易id',
            token_pair int NOT NULL COMMENT '交易对',
            trade_type tinyint NOT NULL DEFAULT '0' COMMENT '交易类型: fromToken0->toToken1    \r\nfromToken1 -> toToken0',
            transaction_hash char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易hash',
            log_index int NOT NULL DEFAULT '0' COMMENT '日志索引',
            transaction_height int NOT NULL COMMENT '交易区块',
            sender char(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送地址',
            spender char(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '转出地址',
            from_number decimal(50,18) NOT NULL COMMENT '输入数量',
            to_number decimal(50,18) NOT NULL COMMENT '输出数量',
            trade_time int NOT NULL COMMENT '交易时间',
            paltform char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'PancakeV2' COMMENT '版本'
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易id';
    "
    create_key_sql="
        ALTER TABLE sp_transaction_${i}
            ADD PRIMARY KEY (id),
            ADD UNIQUE KEY transaction_hash (transaction_hash,log_index),
            ADD KEY trade_type (trade_type),
            ADD KEY token_pair (token_pair);
    "
    create_auto_increement_sql="
        ALTER TABLE sp_transaction_${i}
        MODIFY id bigint NOT NULL AUTO_INCREMENT COMMENT '交易id';
    "
    echo ${drop_table_sql}
    echo ${create_table_sql}
    echo ${create_key_sql}
    echo ${create_auto_increement_sql}
done

#mysql -u${USERNAME} -p{PASSWORD} -e "${create_table_sql}"
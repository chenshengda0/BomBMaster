-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： dex-mysql
-- 生成日期： 2022-08-06 10:09:14
-- 服务器版本： 8.0.29
-- PHP 版本： 8.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `split_db`
--
CREATE DATABASE IF NOT EXISTS `split_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `split_db`;

-- --------------------------------------------------------

--
-- 表的结构 `sp_coins`
--

DROP TABLE IF EXISTS `sp_coins`;
CREATE TABLE `sp_coins` (
  `id` int NOT NULL COMMENT 'id',
  `coinAddress` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合约地址',
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '币种名称',
  `symbol` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '币种简称',
  `total_supply` decimal(60,18) NOT NULL COMMENT '发型量',
  `decimals` tinyint NOT NULL DEFAULT '0' COMMENT '币种精度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='币种简介';

-- --------------------------------------------------------

--
-- 表的结构 `sp_heights`
--

DROP TABLE IF EXISTS `sp_heights`;
CREATE TABLE `sp_heights` (
  `id` int NOT NULL COMMENT '区块高度',
  `platform` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PancakeV1' COMMENT '平台',
  `types` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `last_height` int NOT NULL DEFAULT '0' COMMENT '高度',
  `current_height` int NOT NULL DEFAULT '0' COMMENT '当前高度',
  `limits` int NOT NULL DEFAULT '0' COMMENT '遍历区块数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='记录区块高度';

-- --------------------------------------------------------

--
-- 表的结构 `sp_pairs`
--

DROP TABLE IF EXISTS `sp_pairs`;
CREATE TABLE `sp_pairs` (
  `id` int NOT NULL COMMENT 'id',
  `token_one` int NOT NULL COMMENT 'token0地址',
  `token_two` int NOT NULL COMMENT 'token1地址',
  `token_pair` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易对地址',
  `transaction` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易对HASH',
  `height` int NOT NULL DEFAULT '0' COMMENT '区块高度',
  `types` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台 PancakeV1  PancakeV2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易对详情';

-- --------------------------------------------------------

--
-- 表的结构 `sp_test`
--

DROP TABLE IF EXISTS `sp_test`;
CREATE TABLE `sp_test` (
  `id` int NOT NULL COMMENT '测试ID',
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `sex` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `age` tinyint NOT NULL COMMENT '年龄'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='测试表';

-- --------------------------------------------------------

--
-- 表的结构 `sp_transaction`
--

DROP TABLE IF EXISTS `sp_transaction`;
CREATE TABLE `sp_transaction` (
  `id` bigint NOT NULL COMMENT '交易id',
  `token_pair` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易对',
  `sender` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易人',
  `platform` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '平台',
  `trade_type` tinyint NOT NULL DEFAULT '0' COMMENT '交易类型: fromToken0->toToken1    \r\nfromToken1 -> toToken0',
  `transaction_hash` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '交易hash',
  `transaction_height` int NOT NULL COMMENT '交易区块',
  `from_symbol` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '输入币种',
  `to_symbol` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '输出币种',
  `from_number` decimal(36,18) NOT NULL COMMENT '输入数量',
  `to_number` decimal(36,18) NOT NULL COMMENT '输出数量',
  `trade_time` int NOT NULL COMMENT '交易时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易id';

--
-- 转储表的索引
--

--
-- 表的索引 `sp_coins`
--
ALTER TABLE `sp_coins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coinAddress` (`coinAddress`);

--
-- 表的索引 `sp_heights`
--
ALTER TABLE `sp_heights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types` (`types`),
  ADD KEY `platform` (`platform`);

--
-- 表的索引 `sp_pairs`
--
ALTER TABLE `sp_pairs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_pair` (`token_pair`);

--
-- 表的索引 `sp_test`
--
ALTER TABLE `sp_test`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `sp_transaction`
--
ALTER TABLE `sp_transaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_hash` (`transaction_hash`),
  ADD KEY `platform` (`platform`),
  ADD KEY `trade_type` (`trade_type`),
  ADD KEY `token_pair` (`token_pair`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sp_coins`
--
ALTER TABLE `sp_coins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `sp_heights`
--
ALTER TABLE `sp_heights`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '区块高度';

--
-- 使用表AUTO_INCREMENT `sp_pairs`
--
ALTER TABLE `sp_pairs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- 使用表AUTO_INCREMENT `sp_test`
--
ALTER TABLE `sp_test`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '测试ID';

--
-- 使用表AUTO_INCREMENT `sp_transaction`
--
ALTER TABLE `sp_transaction`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT COMMENT '交易id';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

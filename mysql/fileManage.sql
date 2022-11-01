-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： local-mysql
-- 生成日期： 2022-06-23 06:42:02
-- 服务器版本： 8.0.29
-- PHP 版本： 8.0.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- 数据库： `fileManage`
--
CREATE DATABASE IF NOT EXISTS `fileManage` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `fileManage`;

-- --------------------------------------------------------

--
-- 表的结构 `fm_files`
--
-- 创建时间： 2022-06-17 13:16:59
-- 最后更新： 2022-06-21 06:48:54
--

DROP TABLE IF EXISTS `fm_files`;
CREATE TABLE IF NOT EXISTS `fm_files` (
  `inode` bigint NOT NULL COMMENT '文件inode',
  `pinode` bigint NOT NULL COMMENT '上级inode',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0文件夹 1文件',
  `filename` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推荐路径',
  `filepath` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件绝对路径',
  `download` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下载地址',
  `file_size` bigint NOT NULL DEFAULT '0',
  `file_md5` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commend` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件描叙',
  `create_time` int NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`inode`),
  KEY `pinode` (`pinode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 插入之前先把表清空（truncate） `fm_files`
--

TRUNCATE TABLE `fm_files`;

-- --------------------------------------------------------

--
-- 表的结构 `fm_test`
--
-- 创建时间： 2022-06-17 08:09:52
--

DROP TABLE IF EXISTS `fm_test`;
CREATE TABLE IF NOT EXISTS `fm_test` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` int NOT NULL DEFAULT '0' COMMENT '性别',
  `age` int NOT NULL DEFAULT '0' COMMENT '年龄',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';

--
-- 插入之前先把表清空（truncate） `fm_test`
--

TRUNCATE TABLE `fm_test`;
--
-- 转存表中的数据 `fm_test`
--

INSERT INTO `fm_test` (`id`, `name`, `sex`, `age`) VALUES
(1, '张三', 0, 18),
(2, '李四', 0, 19),
(3, '王武', 0, 20),
(4, '赵六', 0, 21),
(5, '小七', 1, 22),
(6, 'lili', 1, 23),
(7, 'lucy', 1, 24),
(8, 'luck', 1, 25);
COMMIT;
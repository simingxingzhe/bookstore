/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : book_manage_db

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2019-01-19 16:19:36
*/	
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '书名',
  `type` varchar(50) NOT NULL COMMENT '书籍类型',
  `isbn` varchar(50) DEFAULT NULL COMMENT '书号',
  `short_desc` varchar(200) NOT NULL COMMENT '简述',
  `long_desc` varchar(500) DEFAULT NULL COMMENT '详述',
  `price` DECIMAL(8,2) NOT NULL COMMENT '价格',
  `discount` DECIMAL(8,2) NOT NULL COMMENT '折扣',
  `inventory` DECIMAL(8,2) NOT NULL COMMENT '库存',
  `create_datetime` TIMESTAMP NOT NULL COMMENT '创建时间',
  `last_modify_datetime` TIMESTAMP NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='书籍表';

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', 'Java语言程序设计案例教程', '计算机-编程语言-java', 'ISBN-123456', 'Java语言程序设计案例教程', 'Java语言程序设计案例教程', '36.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('2', 'dubbo-用户指南', '计算机-微服务-dubbo', 'ISBN-323456', 'dubbo-用户指南', 'dubbo-用户指南', '46.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('3', 'Head First Java中文版(深入浅出Java)', '计算机-编程语言-java', 'ISBN-223456', 'Head First Java中文版(深入浅出Java)', 'Head First Java中文版(深入浅出Java)', '66.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('4', 'java虚拟机规范', '计算机-虚拟机-java', 'ISBN-123456', 'java虚拟机规范', 'java虚拟机规范', '52.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('5', 'DevOps实践指南', '计算机-DevOps', 'ISBN-001542', 'DevOps实践指南', 'DevOps实践指南', '86.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('6', 'Spring Cloud与Docker微服务架构实战（第2版）', '计算机-编程开发-微服务', 'ISBN-4001542', 'Spring Cloud与Docker微服务架构实战（第2版）', 'Spring Cloud与Docker微服务架构实战（第2版）', '86.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
-- ----------------------------
-- Table structure for `t_book_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_book_order`;
CREATE TABLE `t_book_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_no` varchar(100) NOT NULL COMMENT '订单号',
  `total_price` DECIMAL(12,2) NOT NULL COMMENT '订单总价',
  `buyer_address` varchar(300) NOT NULL COMMENT '买家地址',
  `buyer_phone_no` varchar(20) NOT NULL COMMENT '买家电话',
  `seller_address` varchar(300) NOT NULL COMMENT '卖家地址',
  `seller_phone_no` varchar(20) NOT NULL COMMENT '卖家电话',
  `out-of-pocket` DECIMAL(12,2) NOT NULL COMMENT '实付',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='书籍订单表';
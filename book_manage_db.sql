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
  `sales` int(10) NOT NULL COMMENT '销量',
  `image` varchar(500) NOT NULL COMMENT '图片路径',
  `create_datetime` TIMESTAMP NOT NULL COMMENT '创建时间',
  `last_modify_datetime` TIMESTAMP NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='书籍表';

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', 'Java语言程序设计案例教程', '计算机', 'ISBN-123456', 'Java语言程序设计案例教程', 'Java语言程序设计案例教程', '36.30', '0.00', '100.00', '100','/static/image/1.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('2', 'UML用户指南(第2版·修订版)', '计算机', 'ISBN-323456', 'UML用户指南(第2版·修订版)', 'UML用户指南(第2版·修订版)', '46.30', '0.00', '100.00', '201','/static/image/2.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('3', 'Head First Java中文版(深入浅出Java)', '计算机', 'ISBN-223456', 'Head First Java中文版(深入浅出Java)', 'Head First Java中文版(深入浅出Java)', '66.30', '0.00', '100.00', '301','/static/image/3.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('4', 'java虚拟机规范', '计算机', 'ISBN-123456', 'java虚拟机规范', 'java虚拟机规范', '52.30', '0.00', '100.00', '80','/static/image/4.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('5', 'DevOps实践指南', '计算机', 'ISBN-001542', 'DevOps实践指南', 'DevOps实践指南', '86.30', '0.00', '100.00', '1010','/static/image/5.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('6', 'Spring Cloud与Docker微服务架构实战（第2版）', '计算机', 'ISBN-4001542', 'Spring Cloud与Docker微服务架构实战（第2版）', 'Spring Cloud与Docker微服务架构实战（第2版）', '86.30', '0.00', '100.00', '2001','/static/image/6.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('7', '林清玄散文精选', '文学', '9787506392907', '林清玄散文精选（套装两册）', '林清玄散文精选（套装两册）', '28.00', '0.00', '100.00', '700','/static/image/7.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('8', '莎士比亚戏剧全集', '文学', '24030523', '莎士比亚戏剧全集（朱生豪经典全译本，收入莎翁所有10部悲剧和13部喜剧）', '莎士比亚戏剧全集（朱生豪经典全译本，收入莎翁所有10部悲剧和13部喜剧）', '72.00', '0.00', '100.00', '10100','/static/image/8.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('9', '飞花令里读诗词', '文学', '25198100', '飞花令里读诗词 邂逅古今文学 套装共6册 中国诗词大会通关宝典', '飞花令里读诗词 邂逅古今文学 套装共6册 中国诗词大会通关宝典', '58.76', '0.00', '100.00', '1202','/static/image/9.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('10', '人类简史三部曲', '历史', '9787508696362', '人类简史三部曲： 人类简史+今日简史+未来简史', '人类简史三部曲： 人类简史+今日简史+未来简史', '140.70', '0.00', '100.00', '5101','/static/image/10.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('11', '国史讲话全本', '历史', '23743938', '国史讲话全本（三册）', '国史讲话全本（三册）', '55.50', '0.00', '100.00', '501','/static/image/11.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('12', '中国通史 ', '历史', '9787544755023', ' 中国通史', '中国通史', '19.70', '0.00', '100.00', '410','/static/image/12.jpg', '2019-01-19 16:18:25', '2019-01-19 16:18:19');

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
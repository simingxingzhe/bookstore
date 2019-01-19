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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '���',
  `name` varchar(100) NOT NULL COMMENT '����',
  `type` varchar(50) NOT NULL COMMENT '�鼮����',
  `isbn` varchar(50) DEFAULT NULL COMMENT '���',
  `short_desc` varchar(200) NOT NULL COMMENT '����',
  `long_desc` varchar(500) DEFAULT NULL COMMENT '����',
  `price` DECIMAL(8,2) NOT NULL COMMENT '�۸�',
  `discount` DECIMAL(8,2) NOT NULL COMMENT '�ۿ�',
  `inventory` DECIMAL(8,2) NOT NULL COMMENT '���',
  `create_datetime` TIMESTAMP NOT NULL COMMENT '����ʱ��',
  `last_modify_datetime` TIMESTAMP NOT NULL COMMENT '����޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='�鼮��';

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', 'Java���Գ�����ư����̳�', '�����-�������-java', 'ISBN-123456', 'Java���Գ�����ư����̳�', 'Java���Գ�����ư����̳�', '36.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('2', 'dubbo-�û�ָ��', '�����-΢����-dubbo', 'ISBN-323456', 'dubbo-�û�ָ��', 'dubbo-�û�ָ��', '46.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('3', 'Head First Java���İ�(����ǳ��Java)', '�����-�������-java', 'ISBN-223456', 'Head First Java���İ�(����ǳ��Java)', 'Head First Java���İ�(����ǳ��Java)', '66.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('4', 'java������淶', '�����-�����-java', 'ISBN-123456', 'java������淶', 'java������淶', '52.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('5', 'DevOpsʵ��ָ��', '�����-DevOps', 'ISBN-001542', 'DevOpsʵ��ָ��', 'DevOpsʵ��ָ��', '86.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
INSERT INTO `t_book` VALUES ('6', 'Spring Cloud��Docker΢����ܹ�ʵս����2�棩', '�����-��̿���-΢����', 'ISBN-4001542', 'Spring Cloud��Docker΢����ܹ�ʵս����2�棩', 'Spring Cloud��Docker΢����ܹ�ʵս����2�棩', '86.30', '0.00', '100.00', '2019-01-19 16:18:25', '2019-01-19 16:18:19');
-- ----------------------------
-- Table structure for `t_book_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_book_order`;
CREATE TABLE `t_book_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '���',
  `order_no` varchar(100) NOT NULL COMMENT '������',
  `total_price` DECIMAL(12,2) NOT NULL COMMENT '�����ܼ�',
  `buyer_address` varchar(300) NOT NULL COMMENT '��ҵ�ַ',
  `buyer_phone_no` varchar(20) NOT NULL COMMENT '��ҵ绰',
  `seller_address` varchar(300) NOT NULL COMMENT '���ҵ�ַ',
  `seller_phone_no` varchar(20) NOT NULL COMMENT '���ҵ绰',
  `out-of-pocket` DECIMAL(12,2) NOT NULL COMMENT 'ʵ��',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='�鼮������';
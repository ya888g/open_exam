/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : open_exam

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-01-14 10:00:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `password` varchar(50) default NULL,
  `userName` varchar(50) default NULL,
  `realName` varchar(50) default NULL,
  `sex` int(11) default NULL,
  `birthday` datetime default NULL,
  `email` varchar(30) default NULL,
  `mobile` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('47cf8e77f347440bbd4018a31cf0b6c2', '123456', 'ya888g', '时光倒流', '1', '2014-01-13 15:17:05', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('8733fc737e0b45a499bbade5e5c36d96', '123456', 'ya888g', '时光倒流', '1', '2014-01-13 15:19:04', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('9873d4d52c914ef7bfcd8449fac5db25', '123456', 'ya888g', '时光倒流', '1', '2014-01-13 15:14:30', 'ya888g@163.com', '13816960246');

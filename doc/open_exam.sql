/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : open_exam

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-01-30 15:00:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `questiontype`
-- ----------------------------
DROP TABLE IF EXISTS `questiontype`;
CREATE TABLE `questiontype` (
  `id` varchar(32) NOT NULL,
  `no` varchar(32) default NULL,
  `name` varchar(32) default NULL,
  `typeStr` varchar(320) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questiontype
-- ----------------------------
INSERT INTO `questiontype` VALUES ('1', '1', 'test1', '1.');
INSERT INTO `questiontype` VALUES ('2', '2', 'test2', '1.2.');
INSERT INTO `questiontype` VALUES ('2e8281cb36454889a9ef46778ba875dd', '5', 'test33', '1.3.2e8281cb36454889a9ef46778ba875dd.');
INSERT INTO `questiontype` VALUES ('3', '3', 'test3', '1.3.');
INSERT INTO `questiontype` VALUES ('4', '4', 'test4', '1.2.4.');

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
INSERT INTO `user` VALUES ('47cf8e77f347440bbd4018a31cf0b6c2', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:17:05', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('8733fc737e0b45a499bbade5e5c36d96', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:19:04', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('9873d4d52c914ef7bfcd8449fac5db25', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:14:30', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('eba5d7053e02412fb5be72fcd9459cb8', 'e10adc3949ba59abbe56e057f20f883e', 'ya888g', '时光倒流', '1', '2014-01-15 15:15:35', 'ya888g@163.com', '13816960246');

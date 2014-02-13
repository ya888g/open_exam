/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : open_exam

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-02-13 16:20:39
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
INSERT INTO `questiontype` VALUES ('1', '1', '题库', '1.');
INSERT INTO `questiontype` VALUES ('3e8759a4144740ce9c79fa63966e2518', '140213161850', '客车', '1.fe58b82658d94b7f8847c4d4f9bfab4f.3e8759a4144740ce9c79fa63966e2518.');
INSERT INTO `questiontype` VALUES ('5a6d231246d04b848b07a837c3cfeef3', '140213161930', '客车', '1.dd2939c84782495d8f33718b16caf1d8.5a6d231246d04b848b07a837c3cfeef3.');
INSERT INTO `questiontype` VALUES ('80b695e147e84a3cb57a9ea44c8f2d86', '140213161822', '小车', '1.fe58b82658d94b7f8847c4d4f9bfab4f.80b695e147e84a3cb57a9ea44c8f2d86.');
INSERT INTO `questiontype` VALUES ('96a8325cbcfa4d01aa9d70b5762a1bfc', '140213161905', '小车', '1.dd2939c84782495d8f33718b16caf1d8.96a8325cbcfa4d01aa9d70b5762a1bfc.');
INSERT INTO `questiontype` VALUES ('b99f25525255425fbb71a1e591d4b734', '140213161913', '货车', '1.dd2939c84782495d8f33718b16caf1d8.b99f25525255425fbb71a1e591d4b734.');
INSERT INTO `questiontype` VALUES ('c6a05117cc5146e9b15edf3fd6baa0cf', '140213161836', '货车', '1.fe58b82658d94b7f8847c4d4f9bfab4f.c6a05117cc5146e9b15edf3fd6baa0cf.');
INSERT INTO `questiontype` VALUES ('dd2939c84782495d8f33718b16caf1d8', '140213160145', '科目四', '1.dd2939c84782495d8f33718b16caf1d8.');
INSERT INTO `questiontype` VALUES ('fe58b82658d94b7f8847c4d4f9bfab4f', '140213160129', '科目一', '1.fe58b82658d94b7f8847c4d4f9bfab4f.');

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

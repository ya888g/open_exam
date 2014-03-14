/*
Navicat MySQL Data Transfer

Source Server         : 10.15.107.100-33061
Source Server Version : 50521
Source Host           : 10.15.107.100:33061
Source Database       : open_exam

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2014-03-14 17:22:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `questionBank`
-- ----------------------------
DROP TABLE IF EXISTS `questionBank`;
CREATE TABLE `questionBank` (
  `id` varchar(32) NOT NULL,
  `no` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL COMMENT '题库',
  `typeId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionBank
-- ----------------------------
INSERT INTO `questionBank` VALUES ('1', '1', '1', '1', '3e8759a4144740ce9c79fa63966e2518');
INSERT INTO `questionBank` VALUES ('2', '2', '2', '2', '3e8759a4144740ce9c79fa63966e2518');
INSERT INTO `questionBank` VALUES ('97cef1b917124050a8c8fc34da755ed3', '3', '3', '3', null);

-- ----------------------------
-- Table structure for `questionItem`
-- ----------------------------
DROP TABLE IF EXISTS `questionItem`;
CREATE TABLE `questionItem` (
  `id` varchar(32) NOT NULL,
  `type` int(11) NOT NULL COMMENT '试题类型',
  `count` int(11) NOT NULL COMMENT '选项个数',
  `questionBank` varchar(32) NOT NULL COMMENT '题库',
  `score` double(10,3) NOT NULL COMMENT '分数',
  `difficulty` int(11) NOT NULL COMMENT '难度',
  `content` text NOT NULL COMMENT '题干',
  `status` int(11) NOT NULL COMMENT '状态',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionItem
-- ----------------------------
INSERT INTO `questionItem` VALUES ('1', '1', '1', '1', '1.000', '1', '1', '1', '2014-03-14 14:45:32', '2014-03-14 14:45:36');

-- ----------------------------
-- Table structure for `questionItemOptions`
-- ----------------------------
DROP TABLE IF EXISTS `questionItemOptions`;
CREATE TABLE `questionItemOptions` (
  `id` varchar(32) NOT NULL,
  `options` varchar(50) DEFAULT NULL COMMENT '选项',
  `optionsContent` text NOT NULL COMMENT '选项内容',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionItemOptions
-- ----------------------------

-- ----------------------------
-- Table structure for `questiontype`
-- ----------------------------
DROP TABLE IF EXISTS `questiontype`;
CREATE TABLE `questiontype` (
  `id` varchar(32) NOT NULL,
  `no` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `typeStr` varchar(320) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questiontype
-- ----------------------------
INSERT INTO `questiontype` VALUES ('1', '1', '题库', '1.');
INSERT INTO `questiontype` VALUES ('3e8759a4144740ce9c79fa63966e2518', '140213161850', '客车', '1.fe58b82658d94b7f8847c4d4f9bfab4f.3e8759a4144740ce9c79fa63966e2518.');
INSERT INTO `questiontype` VALUES ('5a6d231246d04b848b07a837c3cfeef3', '140213161930', '客车', '1.dd2939c84782495d8f33718b16caf1d8.5a6d231246d04b848b07a837c3cfeef3.');
INSERT INTO `questiontype` VALUES ('80b695e147e84a3cb57a9ea44c8f2d86', '140213161822', '小车', '1.fe58b82658d94b7f8847c4d4f9bfab4f.80b695e147e84a3cb57a9ea44c8f2d86.');
INSERT INTO `questiontype` VALUES ('96a8325cbcfa4d01aa9d70b5762a1bfc', '140213161905', '小车', '1.dd2939c84782495d8f33718b16caf1d8.96a8325cbcfa4d01aa9d70b5762a1bfc.');
INSERT INTO `questiontype` VALUES ('b99f25525255425fbb71a1e591d4b734', '140213161913', '货车', '1.dd2939c84782495d8f33718b16caf1d8.b99f25525255425fbb71a1e591d4b734.');
INSERT INTO `questiontype` VALUES ('dd2939c84782495d8f33718b16caf1d8', '140213160145', '科目四', '1.dd2939c84782495d8f33718b16caf1d8.');
INSERT INTO `questiontype` VALUES ('fe58b82658d94b7f8847c4d4f9bfab4f', '140213160129', '科目一', '1.fe58b82658d94b7f8847c4d4f9bfab4f.');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('47cf8e77f347440bbd4018a31cf0b6c2', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:17:05', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('8733fc737e0b45a499bbade5e5c36d96', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:19:04', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('9873d4d52c914ef7bfcd8449fac5db25', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:14:30', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('eba5d7053e02412fb5be72fcd9459cb8', 'e10adc3949ba59abbe56e057f20f883e', 'ya888g', '时光倒流', '1', '2014-01-15 15:15:35', 'ya888g@163.com', '13816960246');

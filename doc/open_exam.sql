/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : open_exam

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-03-16 19:40:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `questionbank`
-- ----------------------------
DROP TABLE IF EXISTS `questionbank`;
CREATE TABLE `questionbank` (
  `id` varchar(32) NOT NULL,
  `no` varchar(20) NOT NULL,
  `name` varchar(50) default NULL,
  `description` varchar(500) default NULL COMMENT '题库',
  `typeId` varchar(32) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionbank
-- ----------------------------
INSERT INTO `questionbank` VALUES ('1', '1', '1', '1', '3e8759a4144740ce9c79fa63966e2518');
INSERT INTO `questionbank` VALUES ('2', '2', '2', '2', '3e8759a4144740ce9c79fa63966e2518');
INSERT INTO `questionbank` VALUES ('97cef1b917124050a8c8fc34da755ed3', '3', '3', '3', null);

-- ----------------------------
-- Table structure for `questionitem`
-- ----------------------------
DROP TABLE IF EXISTS `questionitem`;
CREATE TABLE `questionitem` (
  `id` varchar(32) NOT NULL,
  `type` int(11) NOT NULL COMMENT '试题类型',
  `count` int(11) NOT NULL COMMENT '选项个数',
  `questionBank` varchar(32) NOT NULL COMMENT '题库',
  `score` double(10,3) NOT NULL COMMENT '分数',
  `difficulty` int(11) NOT NULL COMMENT '难度',
  `content` text NOT NULL COMMENT '题干',
  `answer` varchar(500) default NULL,
  `status` int(11) NOT NULL COMMENT '状态',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionitem
-- ----------------------------
INSERT INTO `questionitem` VALUES ('4ddf719360a840718e8ba73f6b1e06ff', '1', '4', '1', '1.000', '1', '12', 'A', '1', '2014-03-16 15:37:13', '2014-03-16 15:37:13');
INSERT INTO `questionitem` VALUES ('5235f795b3864622a877c405fb596161', '2', '4', '2', '5.000', '1', '11', 'A,D', '1', '2014-03-16 18:00:59', '2014-03-16 18:00:59');

-- ----------------------------
-- Table structure for `questionitemoptions`
-- ----------------------------
DROP TABLE IF EXISTS `questionitemoptions`;
CREATE TABLE `questionitemoptions` (
  `id` varchar(32) NOT NULL,
  `options` varchar(50) default NULL COMMENT '选项',
  `optionsContent` text NOT NULL COMMENT '选项内容',
  `itemId` varchar(32) default NULL,
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionitemoptions
-- ----------------------------
INSERT INTO `questionitemoptions` VALUES ('559f215e2e9a4d3e8e0bd0d1e6de4f5d', 'A', '1', '4ddf719360a840718e8ba73f6b1e06ff', '2014-03-16 15:37:13', '2014-03-16 15:37:13');
INSERT INTO `questionitemoptions` VALUES ('fb09809a65c14d568a6542cd8a6504b1', 'B', '1', '4ddf719360a840718e8ba73f6b1e06ff', '2014-03-16 15:37:13', '2014-03-16 15:37:13');
INSERT INTO `questionitemoptions` VALUES ('d527cc46cedf4c94be0e425f968c1f67', 'C', '2', '4ddf719360a840718e8ba73f6b1e06ff', '2014-03-16 15:37:13', '2014-03-16 15:37:13');
INSERT INTO `questionitemoptions` VALUES ('3027689d81f14ab9aea741142bc1d81c', 'D', '4', '4ddf719360a840718e8ba73f6b1e06ff', '2014-03-16 15:37:13', '2014-03-16 15:37:13');
INSERT INTO `questionitemoptions` VALUES ('34e08325ea384546a394ab2cb5e5d6d5', 'A', '4', '5235f795b3864622a877c405fb596161', '2014-03-16 18:00:59', '2014-03-16 18:00:59');
INSERT INTO `questionitemoptions` VALUES ('97cf40aa247248aa826301ccc7a040cb', 'B', '5', '5235f795b3864622a877c405fb596161', '2014-03-16 18:00:59', '2014-03-16 18:00:59');
INSERT INTO `questionitemoptions` VALUES ('a5512fb990734d9fa30ec9036b68a1f0', 'C', '6', '5235f795b3864622a877c405fb596161', '2014-03-16 18:00:59', '2014-03-16 18:00:59');
INSERT INTO `questionitemoptions` VALUES ('0ddd5bd4596a4a2bb115efc112eaa08d', 'D', '7', '5235f795b3864622a877c405fb596161', '2014-03-16 18:00:59', '2014-03-16 18:00:59');

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
  `password` varchar(50) default NULL,
  `userName` varchar(50) default NULL,
  `realName` varchar(50) default NULL,
  `sex` int(11) default NULL,
  `birthday` datetime default NULL,
  `email` varchar(30) default NULL,
  `mobile` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('47cf8e77f347440bbd4018a31cf0b6c2', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:17:05', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('8733fc737e0b45a499bbade5e5c36d96', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:19:04', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('9873d4d52c914ef7bfcd8449fac5db25', '123456', 'ya888g', '杨庆雷', '1', '2014-01-13 15:14:30', 'ya888g@163.com', '13816960246');
INSERT INTO `user` VALUES ('eba5d7053e02412fb5be72fcd9459cb8', 'e10adc3949ba59abbe56e057f20f883e', 'ya888g', '时光倒流', '1', '2014-01-15 15:15:35', 'ya888g@163.com', '13816960246');

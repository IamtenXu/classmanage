/*
Navicat MySQL Data Transfer

Source Server         : Tencent5.5
Source Server Version : 50562
Source Host           : 111.230.241.48:3307
Source Database       : classmanage

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-01-24 14:26:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classinfo`
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo` (
  `classid` char(8) NOT NULL,
  `ccollege` varchar(50) NOT NULL,
  `major` varchar(20) NOT NULL,
  `cgrade` char(4) NOT NULL,
  `instructor` char(5) DEFAULT NULL,
  `headmaster` char(5) DEFAULT NULL,
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('15052316', '计算机学院', '计算机科学与技术', '2015', '10002', '10003');
INSERT INTO `classinfo` VALUES ('15058913', '计算机学院', '物联网工程', '2015', '10004', '10005');

-- ----------------------------
-- Table structure for `loginuser`
-- ----------------------------
DROP TABLE IF EXISTS `loginuser`;
CREATE TABLE `loginuser` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `role` int(4) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loginuser
-- ----------------------------
INSERT INTO `loginuser` VALUES ('10001', '123456', '1');
INSERT INTO `loginuser` VALUES ('10002', '123456', '2');
INSERT INTO `loginuser` VALUES ('10003', '123456', '3');
INSERT INTO `loginuser` VALUES ('10004', '123456', '2');
INSERT INTO `loginuser` VALUES ('1005', '123456', '3');
INSERT INTO `loginuser` VALUES ('15051738', '123456', '13');
INSERT INTO `loginuser` VALUES ('15051740', '8441521', '4');

-- ----------------------------
-- Table structure for `roleinfo`
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `rcode` int(4) NOT NULL,
  `rname` varchar(10) NOT NULL,
  PRIMARY KEY (`rcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleinfo
-- ----------------------------
INSERT INTO `roleinfo` VALUES ('1', '教务处');
INSERT INTO `roleinfo` VALUES ('2', '辅导员');
INSERT INTO `roleinfo` VALUES ('3', '班主任');
INSERT INTO `roleinfo` VALUES ('4', '班长');
INSERT INTO `roleinfo` VALUES ('5', '团支书');
INSERT INTO `roleinfo` VALUES ('6', '学习委员');
INSERT INTO `roleinfo` VALUES ('7', '组织委员');
INSERT INTO `roleinfo` VALUES ('8', '宣传委员');
INSERT INTO `roleinfo` VALUES ('9', '文艺委员');
INSERT INTO `roleinfo` VALUES ('10', '体育委员');
INSERT INTO `roleinfo` VALUES ('11', '生活委员');
INSERT INTO `roleinfo` VALUES ('12', '心理委员');
INSERT INTO `roleinfo` VALUES ('13', '同学');

-- ----------------------------
-- Table structure for `stuinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stuinfo`;
CREATE TABLE `stuinfo` (
  `stuid` char(8) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `ssex` char(1) NOT NULL,
  `sbirthday` varchar(20) NOT NULL,
  `students` varchar(20) NOT NULL,
  `spolitical` varchar(20) NOT NULL,
  `sphone` char(11) NOT NULL,
  `semail` varchar(50) NOT NULL,
  `srole` int(4) NOT NULL,
  `sphoto` varchar(200) NOT NULL,
  `sadress` varchar(50) NOT NULL,
  `sclass` char(8) NOT NULL,
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------
INSERT INTO `stuinfo` VALUES ('15051740', '许豪', '男', '1997-02-08', '浙江省德清县', '预备党员', '18100172270', '15051740@hdu.edu.cn', '4', '/iamten.jpg', '12号楼513', '15052316');

-- ----------------------------
-- Table structure for `teainfo`
-- ----------------------------
DROP TABLE IF EXISTS `teainfo`;
CREATE TABLE `teainfo` (
  `teaid` char(5) NOT NULL,
  `tname` varchar(20) NOT NULL,
  `tsex` char(1) NOT NULL,
  `tbirthday` varchar(20) NOT NULL,
  `tpolitical` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `tphone` char(11) NOT NULL,
  `temail` varchar(50) NOT NULL,
  `trole` int(4) NOT NULL,
  `tphoto` varchar(200) NOT NULL,
  `taddress` varchar(50) NOT NULL,
  `tcollege` varchar(50) NOT NULL,
  PRIMARY KEY (`teaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teainfo
-- ----------------------------
INSERT INTO `teainfo` VALUES ('10001', '张一', '男', '1988-01-01', '党员', '教授', '12345678901', 'zs123@hdu.edu.cn', '1', '/1.jpg', '综合楼109', '教务处');
INSERT INTO `teainfo` VALUES ('10002', '李二', '女', '1993-01-02', '预备党员', '讲师', '12345678902', 'ls456@hdu.edu.cn', '2', '/2.jpg', '1教202', '计算机学院');
INSERT INTO `teainfo` VALUES ('10003', '丁三', '男', '1970-09-09', '群众', '副教授', '12345678902', 'ds123@hdu.edu.cn', '3', '/3.jpg', '1教305', '计算机学院');
INSERT INTO `teainfo` VALUES ('10004', '许四', '男', '1994-01-01', '预备党员', '讲师', '12345678904', 'xs123@hdu.edu.cn', '2', '/4.jpg', '1教101', '计算机学院');
INSERT INTO `teainfo` VALUES ('10005', '陈五', '女', '1996-01-01', '共青团员', '讲师', '12345678905', 'cw123@hdu.edu.cn', '3', '/5.jpg', '1教201', '计算机学院');

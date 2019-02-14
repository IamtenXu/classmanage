/*
Navicat MySQL Data Transfer

Source Server         : Tencent5.5
Source Server Version : 50562
Source Host           : 111.230.241.48:3307
Source Database       : classmanage

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-02-15 00:48:21
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
  PRIMARY KEY (`classid`),
  KEY `ins` (`instructor`),
  KEY `hea` (`headmaster`),
  CONSTRAINT `hea` FOREIGN KEY (`headmaster`) REFERENCES `teainfo` (`teaid`) ON UPDATE CASCADE,
  CONSTRAINT `ins` FOREIGN KEY (`instructor`) REFERENCES `teainfo` (`teaid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('15042111', '通信学院', '通讯工程', '2015', '10006', '10006');
INSERT INTO `classinfo` VALUES ('15052311', '计算机学院', '计算机科学与技术', '2015', '10002', '10006');
INSERT INTO `classinfo` VALUES ('15052316', '计算机学院', '计算机科学与技术', '2015', '10002', '10003');
INSERT INTO `classinfo` VALUES ('15058913', '计算机学院', '物联网工程', '2015', '10004', '10005');
INSERT INTO `classinfo` VALUES ('16052311', '计算机学院', '计算机科学与技术', '2016', '10004', '10005');

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
INSERT INTO `loginuser` VALUES ('10005', '123456', '3');
INSERT INTO `loginuser` VALUES ('10006', '123456', '3');
INSERT INTO `loginuser` VALUES ('15051738', '123456', '13');
INSERT INTO `loginuser` VALUES ('15051740', '123456', '4');

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
  `sphoto` varchar(255) NOT NULL,
  `sadress` varchar(50) NOT NULL,
  `sclass` char(8) NOT NULL,
  PRIMARY KEY (`stuid`),
  KEY `srole` (`srole`),
  KEY `sclass` (`sclass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------
INSERT INTO `stuinfo` VALUES ('15041702', '李师师', '女', '1997-01-08', '上海市徐汇区', '党员', '15998761234', '15041702@hdu.edu.cn', '4', '123', '13号楼213', '15042111');
INSERT INTO `stuinfo` VALUES ('15041722', '胡凯', '男', '1997-02-08', '江苏省玄武区', '群众', '18101234567', '15041722@hdu.edu.cn', '13', '/15041722.jpg', '11号楼123', '15042111');
INSERT INTO `stuinfo` VALUES ('15051101', '傅晚晴', '女', '1997-02-06', '北京市朝阳区', '预备党员', '15959134618', '15051101@hdu.edu.cn', '5', '123', '13号楼505', '15052311');
INSERT INTO `stuinfo` VALUES ('15051141', '顾惜朝', '男', '1996-07-08', '河南省郑州市', '共青团员', '18808231513', '15051141@hdu.edu.cn', '4', '123', '12号楼218', '15052311');
INSERT INTO `stuinfo` VALUES ('15051738', '谢喆人', '男', '1997-01-01', '浙江省德清县', '共青团员', '18100170000', '15051738@hdu.edu.cn', '13', '/15051738.jpg', '12号楼513', '15052316');
INSERT INTO `stuinfo` VALUES ('15051739', '熊光祥', '男', '1997-05-04', '甘肃省兰州市', '共青团员', '19100112345', '15051739@', '13', '/15051739.jpg', '12号楼513', '15058913');
INSERT INTO `stuinfo` VALUES ('15051740', '许豪', '男', '1997-02-08', '浙江省德清县', '预备党员', '18100172270', '15051740@hdu.edu.cn', '4', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/7171549869972017.jpg', '12号楼513', '15052316');
INSERT INTO `stuinfo` VALUES ('15052112', '温柔', '女', '1997-06-01', '云南省昆明市', '党员', '15945131314', '15052112@hdu.edu.cn', '4', '123', '13号楼213', '15058913');
INSERT INTO `stuinfo` VALUES ('16051101', '徐若瑄', '女', '1998-02-02', '浙江省江干区', '党员', '18100115555', '16051101@hdu.edu.cn', '5', '/16051101', '13号楼218', '16052311');
INSERT INTO `stuinfo` VALUES ('16051130', '叶弄舟', '男', '1998-05-05', '浙江省桐乡市', '共青团员', '18100121234', '16051130@hdu.edu.cn', '4', '123', '11号楼111', '16052311');

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
  PRIMARY KEY (`teaid`),
  KEY `trole` (`trole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teainfo
-- ----------------------------
INSERT INTO `teainfo` VALUES ('10001', '张一', '男', '1988-01-02', '党员', '教授', '12345678901', 'zs123@hdu.edu.cn', '1', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/18341549870924607.jpg', '综合楼209', '教务处');
INSERT INTO `teainfo` VALUES ('10002', '李二', '女', '1993-01-02', '预备党员', '讲师', '12345678902', 'ls456@hdu.edu.cn', '2', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/21801549863218950.jpg', '1教202', '计算机学院');
INSERT INTO `teainfo` VALUES ('10003', '丁三', '男', '1970-09-09', '群众', '副教授', '12345678902', 'ds123@hdu.edu.cn', '3', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/classmanage/42491549818118978.jpg', '1教305', '计算机学院');
INSERT INTO `teainfo` VALUES ('10004', '许四', '男', '1994-01-01', '预备党员', '讲师', '12345678904', 'xs123@hdu.edu.cn', '2', '/4.jpg', '1教101', '计算机学院');
INSERT INTO `teainfo` VALUES ('10005', '陈五', '女', '1996-01-01', '共青团员', '讲师', '12345678905', 'cw123@hdu.edu.cn', '3', '/5.jpg', '1教201', '计算机学院');
INSERT INTO `teainfo` VALUES ('10006', '谢六', '男', '1990-01-03', '预备党员', '讲师', '12345678906', 'xl123@hdu.edu.cn', '3', '/5.jpg', '1教333', '计算机学院');

-- ----------------------------
-- View structure for `classer`
-- ----------------------------
DROP VIEW IF EXISTS `classer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `classer` AS select `stuinfo`.`sname` AS `sname`,`stuinfo`.`sphone` AS `sphone`,`stuinfo`.`sadress` AS `sadress`,`stuinfo`.`sclass` AS `sclass`,`roleinfo`.`rcode` AS `rcode`,`roleinfo`.`rname` AS `rname` from (`stuinfo` join `roleinfo`) where (`stuinfo`.`srole` = `roleinfo`.`rcode`) ;

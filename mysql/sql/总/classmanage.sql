/*
Navicat MySQL Data Transfer

Source Server         : M1
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : Classmanage

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-02-18 18:15:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `text` varchar(200) NOT NULL,
  `atime` varchar(20) NOT NULL,
  `publisher` varchar(8) NOT NULL,
  `atype` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('1', '期末成绩', '1、本学期挂科的同学，请寒假在家认真准备补考，补考的科目下学期不一定开，如果不开且补考不过只能结业或者延期毕业，请各位把握住最后一次机会。2、如果所挂的科目没有补考，但下学期还可以选修（如毕业设计或者毕业实习），请尽快选修。3、如果所挂科目没有补考，且下学期不开放，请咨询下你的任课老师，能不能有其他同类课程能替代，如果可以，请下学期选修同类课程。', '2019-01-22 15:25:38', '15051740', '2');
INSERT INTO `announcement` VALUES ('2', '开学通知', '123123123123', '2019-02-17 15:45:33', '15051740', '2');
INSERT INTO `announcement` VALUES ('4', '123', '123', '2019-02-03 13:11:11', '10004', '1');
INSERT INTO `announcement` VALUES ('5', '班主任通知', '测试', '2019-02-18 17:13:26', '10003', '1');
INSERT INTO `announcement` VALUES ('11', '测试', '测试回车回车', '2019-02-18 17:12:51', '15051740', '2');
INSERT INTO `announcement` VALUES ('15', '辅导员通知', '辅导员通知测试', '2019-02-18 17:15:53', '10002', '1');

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
-- Table structure for `homeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `homeinfo`;
CREATE TABLE `homeinfo` (
  `stuid` char(8) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `fphone` char(11) DEFAULT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `mphone` char(11) DEFAULT NULL,
  `emergencyname` varchar(20) NOT NULL,
  `emergencyphone` char(11) NOT NULL,
  `hadress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homeinfo
-- ----------------------------
INSERT INTO `homeinfo` VALUES ('15051738', '123', '12111111111', '321', '12222222222', '213', '12312312312', '123');
INSERT INTO `homeinfo` VALUES ('15051739', '321', '12312312312', '123', '12312312312', '123', '12312312312', '123');
INSERT INTO `homeinfo` VALUES ('15051740', '许建法', '13957260000', '张兴男', '13587240000', '许萍', '15924101111', '浙江省湖州市德清县新市镇万安广场');

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
INSERT INTO `loginuser` VALUES ('15041722', '123456', '13');
INSERT INTO `loginuser` VALUES ('15051738', '123456', '13');
INSERT INTO `loginuser` VALUES ('15051739', '123456', '13');
INSERT INTO `loginuser` VALUES ('15051740', '123456', '4');
INSERT INTO `loginuser` VALUES ('15052112', '123456', '4');

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
INSERT INTO `roleinfo` VALUES ('14', '副班长');

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
INSERT INTO `stuinfo` VALUES ('15051405', '郭静', '男', '1997-01-01', '浙江省江干区', '群众', '13067735865', '15051405@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051407', '鞠畅', '男', '1997-01-01', '浙江省江干区', '群众', '15869025194', '15051407@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051408', '康自勤', '女', '1996-09-10', '浙江省江干区', '共青团员', '15968191316', '15051408@hdu.edu.cn', '13', 'img/example.jpg', '13号楼214', '15052316');
INSERT INTO `stuinfo` VALUES ('15051409', '杨毅', '女', '1997-04-07', '浙江省江干区', '共青团员', '15968142855', '15051409@hdu.edu.cn', '13', 'img/example.jpg', '13号楼214', '15052316');
INSERT INTO `stuinfo` VALUES ('15051437', '王鹏潇', '男', '1997-01-01', '浙江省江干区', '群众', '15968821457', '15051437@hdu.edu.cn', '13', 'img/example.jpg', 'null', '15052316');
INSERT INTO `stuinfo` VALUES ('15051439', '王腾构', '男', '1997-01-01', '浙江省江干区', '共青团员', '15968801994', '15051439@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼418', '15052316');
INSERT INTO `stuinfo` VALUES ('15051440', '王志昊', '男', '1996-11-16', '浙江省江干区', '共青团员', '15968811742', '15051440@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼415', '15052316');
INSERT INTO `stuinfo` VALUES ('15051441', '谢昌伟', '男', '1997-06-17', '浙江省江干区', '共青团员', '15968812212', '15051441@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼415', '15052316');
INSERT INTO `stuinfo` VALUES ('15051442', '邢杭健', '男', '1996-10-01', '浙江省江干区', '共青团员', '15968858514', '15051442@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051445', '张涛', '男', '1997-01-01', '浙江省江干区', '群众', '13750850539', '15051445@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051447', '张旭', '男', '1997-01-01', '浙江省江干区', '群众', '18100171515', '15051447@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051448', '赵逸文', '男', '1997-01-01', '浙江省江干区', '共青团员', '15968190686', '15051448@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼421', '15052316');
INSERT INTO `stuinfo` VALUES ('15051701', '范秦', '男', '1997-01-01', '浙江省江干区', '群众', '15968191106', '15051701@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051703', '侯雅筝', '男', '1997-01-01', '浙江省江干区', '群众', '15968190565', '15051703@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051704', '李小艳', '女', '1997-04-10', '浙江省江干区', '共青团员', '15968802203', '15051704@hdu.edu.cn', '13', 'img/example.jpg', '13号西楼218', '15052316');
INSERT INTO `stuinfo` VALUES ('15051705', '沈蓉蓉', '女', '1996-10-07', '浙江省江干区', '共青团员', '15088746059', '15051705@hdu.edu.cn', '13', 'img/example.jpg', '13号楼218', '15052316');
INSERT INTO `stuinfo` VALUES ('15051706', '温昊然', '女', '1997-01-10', '浙江省江干区', '共青团员', '15958117764', '15051706@hdu.edu.cn', '13', 'img/example.jpg', '13#213', '15052316');
INSERT INTO `stuinfo` VALUES ('15051708', '赵曲红', '男', '1997-01-01', '浙江省江干区', '群众', '18100171013', '15051708@hdu.edu.cn', '11', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051709', '赵阳', '男', '1997-01-01', '浙江省江干区', '群众', '18268876442', '15051709@hdu.edu.cn', '14', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051710', '陈尘庭', '男', '1996-09-01', '浙江省江干区', '共青团员', '15968812320', '15051710@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼517', '15052316');
INSERT INTO `stuinfo` VALUES ('15051711', '陈奎宏', '男', '1997-01-01', '浙江省江干区', '群众', '18100173810', '15051711@hdu.edu.cn', '10', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051713', '方周杰', '男', '1997-01-24', '浙江省江干区', '群众', '15068889616', '15051713@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼518', '15052316');
INSERT INTO `stuinfo` VALUES ('15051714', '傅懋钟', '男', '1997-01-01', '浙江省江干区', '群众', '15968191069', '15051714@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051715', '富焘', '男', '1997-01-01', '浙江省江干区', '群众', '18757167322', '15051715@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051716', '胡世乐', '男', '1998-09-16', '浙江省江干区', '群众', '15057738637', '15051716@hdu.edu.cn', '12', 'img/example.jpg', '12号南楼1518', '15052316');
INSERT INTO `stuinfo` VALUES ('15051718', '金希文', '男', '1997-01-01', '浙江省江干区', '群众', '18257308900', '15051718@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051719', '雷乾坤', '男', '1997-01-01', '浙江省江干区', '群众', '18100172080', '15051719@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051720', '李希萌', '男', '1997-01-01', '浙江省江干区', '群众', '18100170574', '15051720@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051721', '李玮', '男', '1997-05-29', '浙江省江干区', '预备党员', '18100171677', '15051721@hdu.edu.cn', '6', 'img/example.jpg', '12号南楼516', '15052316');
INSERT INTO `stuinfo` VALUES ('15051722', '刘昊轩', '男', '1997-01-01', '浙江省江干区', '群众', '18100172416', '15051722@hdu.edu.cn', '5', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051723', '吕昂群', '男', '1996-12-17', '浙江省江干区', '共青团员', '15968812417', '15051723@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼314', '15052316');
INSERT INTO `stuinfo` VALUES ('15051725', '彭杨', '男', '1997-01-01', '浙江省江干区', '群众', '18100172447', '15051725@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051726', '孙海波', '男', '1997-07-03', '浙江省江干区', '共青团员', '18100177432', '15051726@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼515', '15052316');
INSERT INTO `stuinfo` VALUES ('15051727', '陶武骏', '男', '1997-01-01', '浙江省江干区', '共青团员', '13777830221', '15051727@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼501', '15052316');
INSERT INTO `stuinfo` VALUES ('15051728', '汪鼎辉', '男', '1996-10-09', '浙江省江干区', '群众', '18100173204', '15051728@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼515', '15052316');
INSERT INTO `stuinfo` VALUES ('15051729', '汪一峰', '男', '1997-01-01', '浙江省江干区', '群众', '18100174652', '15051729@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼517', '15052316');
INSERT INTO `stuinfo` VALUES ('15051731', '王礼锋', '男', '1997-01-01', '浙江省江干区', '群众', '18770988115', '15051731@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051736', '吴元超', '男', '1996-10-31', '浙江省江干区', '共青团员', '18100174601', '15051736@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼520', '15052316');
INSERT INTO `stuinfo` VALUES ('15051737', '夏添', '男', '1997-01-01', '浙江省江干区', '群众', '18100174524', '15051737@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051738', '谢喆人', '男', '1997-01-01', '浙江省德清县', '共青团员', '18100173557', '15051738@hdu.edu.cn', '13', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/Classmanage/39381550249916547.jpg', '12号南楼513', '15052316');
INSERT INTO `stuinfo` VALUES ('15051739', '熊光祥', '男', '1997-05-04', '甘肃省兰州市', '共青团员', '19100112345', '15051739@', '13', '/15051739.jpg', '12号楼513', '15058913');
INSERT INTO `stuinfo` VALUES ('15051740', '许豪', '男', '1997-02-08', '浙江省德清县', '预备党员', '18100172270', '15051740@hdu.edu.cn', '4', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/Classmanage/7171549869972017.jpg', '12号楼513', '15052316');
INSERT INTO `stuinfo` VALUES ('15051746', '周俶易', '男', '1997-01-01', '浙江省江干区', '群众', '18367383887', '15051746@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15051747', '周先睿', '男', '1997-01-01', '浙江省江干区', '共青团员', '15968802259', '15051747@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼514', '15052316');
INSERT INTO `stuinfo` VALUES ('15051749', '栾海鹏', '男', '1997-01-01', '浙江省江干区', '群众', '18100173100', '15051749@hdu.edu.cn', '13', 'img/example.jpg', '12号南楼101', '15052316');
INSERT INTO `stuinfo` VALUES ('15052112', '温柔', '女', '1997-06-01', '云南省昆明市', '党员', '15945131314', '15052112@hdu.edu.cn', '4', '123', '13号楼213', '15058913');
INSERT INTO `stuinfo` VALUES ('15062117', '王汉民', '男', '1997-06-06', '浙江省江干区', '群众', '18100177275', '15062117@hdu.edu.cn', '13', 'img/example.jpg', '18号楼228', '15052316');
INSERT INTO `stuinfo` VALUES ('15062118', '王康乐', '男', '1997-05-02', '浙江省江干区', '共青团员', '18100176614', '15062118@hdu.edu.cn', '13', 'img/example.jpg', '18号楼228', '15052316');
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
INSERT INTO `teainfo` VALUES ('10001', '张一', '男', '1988-01-02', '党员', '教授', '12345678901', 'zs123@hdu.edu.cn', '1', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/Classmanage/18341549870924607.jpg', '综合楼209', '教务处');
INSERT INTO `teainfo` VALUES ('10002', '李二', '女', '1993-01-02', '预备党员', '讲师', '12345678902', 'ls456@hdu.edu.cn', '2', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/Classmanage/21801549863218950.jpg', '1教202', '计算机学院');
INSERT INTO `teainfo` VALUES ('10003', '丁三', '男', '1970-09-09', '党员', '副教授', '12345678902', 'ds123@hdu.edu.cn', '3', 'http://iamten-1253464268.cos.ap-shanghai.myqcloud.com/Classmanage/42491549818118978.jpg', '1教305', '计算机学院');
INSERT INTO `teainfo` VALUES ('10004', '许四', '男', '1994-01-01', '预备党员', '讲师', '12345678904', 'xs123@hdu.edu.cn', '2', '/4.jpg', '1教101', '计算机学院');
INSERT INTO `teainfo` VALUES ('10005', '陈五', '女', '1996-01-01', '共青团员', '讲师', '12345678905', 'cw123@hdu.edu.cn', '3', '/5.jpg', '1教201', '计算机学院');
INSERT INTO `teainfo` VALUES ('10006', '谢六', '男', '1990-01-03', '预备党员', '讲师', '12345678906', 'xl123@hdu.edu.cn', '3', '/5.jpg', '1教333', '计算机学院');

-- ----------------------------
-- View structure for `classer`
-- ----------------------------
DROP VIEW IF EXISTS `classer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `classer` AS select `classmanage`.`stuinfo`.`sname` AS `sname`,`classmanage`.`stuinfo`.`sphone` AS `sphone`,`classmanage`.`stuinfo`.`sadress` AS `sadress`,`classmanage`.`stuinfo`.`sclass` AS `sclass`,`classmanage`.`roleinfo`.`rcode` AS `rcode`,`classmanage`.`roleinfo`.`rname` AS `rname` from (`stuinfo` join `roleinfo`) where (`classmanage`.`stuinfo`.`srole` = `classmanage`.`roleinfo`.`rcode`) ;

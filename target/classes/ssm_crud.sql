/*
Navicat MySQL Data Transfer

Source Server         : mysql5
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : ssm_crud

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2019-07-25 15:51:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(10) NOT NULL auto_increment,
  `dept_name` varchar(20) default NULL,
  PRIMARY KEY  (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '研发部');
INSERT INTO `tbl_dept` VALUES ('2', '人力部');
INSERT INTO `tbl_dept` VALUES ('3', '财务部');
INSERT INTO `tbl_dept` VALUES ('4', '保密部');
INSERT INTO `tbl_dept` VALUES ('5', '营销部');
INSERT INTO `tbl_dept` VALUES ('6', '服务部');
INSERT INTO `tbl_dept` VALUES ('7', '管理部');

-- ----------------------------
-- Table structure for `tbl_emp`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(10) NOT NULL auto_increment,
  `emp_name` varchar(20) default NULL,
  `gender` varchar(2) default NULL,
  `email` varchar(20) default NULL,
  `d_id` int(10) default NULL,
  PRIMARY KEY  (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1', '关小夏', 'M', '1325000000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('2', '王思馨', 'M', '1325000000@163.com', '2');
INSERT INTO `tbl_emp` VALUES ('3', '王诗议', 'M', '7872220000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('4', '王梦菲', 'M', '2741820000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('5', '王雨辰', 'M', '7872220000@qq.com', '7');
INSERT INTO `tbl_emp` VALUES ('6', '王沐晴', 'M', '2741820000@qq.com', '6');
INSERT INTO `tbl_emp` VALUES ('7', '李雨桐', 'M', '7872220000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('8', '李逸仙', 'M', '3252220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('9', '李舒飞', 'F', '1325000000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('10', '李锦泽', 'F', '2741820000@qq.com', '7');
INSERT INTO `tbl_emp` VALUES ('11', '李婉儿', 'M', '7872220000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('12', '李俊之', 'F', '1325000000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('13', '苏皓文', 'F', '2741820000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('14', '苏怜烟', 'M', '7872220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('15', '苏燕颖', 'M', '1325000000@qq.com', '7');
INSERT INTO `tbl_emp` VALUES ('16', '苏忆枫', 'M', '3252220000@qq.com', '6');
INSERT INTO `tbl_emp` VALUES ('17', '沈子晴', 'F', '7872220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('18', '沈慕凡', 'M', '2741820000@qq.com', '6');
INSERT INTO `tbl_emp` VALUES ('19', '吕奕妍', 'M', '7872220000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('20', '吕健媛', 'M', '7872220000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('21', '吕生瑶', 'F', '1325000000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('22', '吕君淑', 'M', '7872220000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('23', '叶秀兰', 'M', '3252220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('24', '叶兰婷', 'M', '7872220000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('25', '叶辰逸', 'M', '1325000000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('26', '关爱懿', 'M', '7872220000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('27', '关诗伊', 'F', '7872220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('28', '关依可', 'M', '3252220000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('29', '关欣爱', 'M', '2741820000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('30', '武金兴', 'F', '7872220000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('31', '武剑豪', 'F', '1325000000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('32', '张雨荨', 'F', '3252220000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('33', '张雨泽', 'M', '7872220000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('34', '张海宇', 'F', '2741820000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('35', '张子伦', 'F', '7872220000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('36', '张书仪', 'F', '7872220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('37', '张君羽', 'F', '1325000000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('38', '孙安彤', 'M', '1325000000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('39', '孙宁苏', 'F', '7872220000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('40', '黄昊然', 'F', '2741820000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('41', '黄灵皓', 'F', '3252220000@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('42', '黄润根', 'F', '7872220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('43', '肖嘉瑶', 'F', '1325000000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('44', '肖玥瑶', 'M', '7872220000@qq.com', '5');
INSERT INTO `tbl_emp` VALUES ('45', '肖遥岁', 'M', '7872220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('46', '舒玉兰', 'M', '1325000000@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('47', '舒雨雪', 'M', '3252220000@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('48', '裴思琪', 'M', '2741820000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('49', '裴清雅', 'M', '7872220000@qq.com', '3');
INSERT INTO `tbl_emp` VALUES ('50', '赵学轩', 'F', '1325000000@qq.com', '4');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` int(10) NOT NULL auto_increment,
  `user_name` varchar(20) default NULL,
  `user_pwd` varchar(20) default NULL,
  `age` int(10) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'root', 'root', '13');

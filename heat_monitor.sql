/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : heat_monitor

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 29/11/2020 16:24:41
*/

use heatsource;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for heat_record
-- ----------------------------
DROP TABLE IF EXISTS `heat_record`;
CREATE TABLE `heat_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `time` timestamp(0) NULL DEFAULT NULL COMMENT '时间',
  `one_supply_temperature` float NULL DEFAULT NULL COMMENT '一供温度',
  `once_temperature` float NULL DEFAULT NULL COMMENT '一回温度',
  `one_supply_pressure` float NULL DEFAULT NULL COMMENT '一供压力',
  `pressure_once` float NULL DEFAULT NULL COMMENT '一回压力',
  `two_supply_temperature` float NULL DEFAULT NULL COMMENT '二供温度',
  `twice_temperature` float NULL DEFAULT NULL COMMENT '二回温度',
  `two_supply_pressure` float NULL DEFAULT NULL COMMENT '二供压力',
  `pressure_twice` float NULL DEFAULT NULL COMMENT '二回压力',
  `instantaneous_traffic` float NULL DEFAULT NULL COMMENT '一网瞬时流量',
  `instantaneous_heat` float NULL DEFAULT NULL COMMENT '一网瞬时热量',
  `electric_valve_opening` float NULL DEFAULT NULL COMMENT '电动阀开度',
  `circulating_pump_frequency` float NULL DEFAULT NULL COMMENT '循环泵频率',
  `makeup_pump_frequency` float NULL DEFAULT NULL COMMENT '补水泵频率',
  `heat_exchange_station` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '换热站',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3676 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for station_info
-- ----------------------------
DROP TABLE IF EXISTS `station_info`;
CREATE TABLE `station_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '站名',
  `station_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '供热站状态',
  `station_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '供热站地址',
  `station_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '供热站联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '0fdd67ef56064f24d4b53d41150d35ab');
INSERT INTO `user` VALUES (2, 'admin2', '0fdd67ef56064f24d4b53d41150d35ab');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `belong` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

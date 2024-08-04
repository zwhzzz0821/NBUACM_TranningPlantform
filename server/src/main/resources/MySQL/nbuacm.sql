/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : nbuacm

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 04/08/2024 21:08:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for allusersubmissionstatus
-- ----------------------------
DROP TABLE IF EXISTS `allusersubmissionstatus`;
CREATE TABLE `allusersubmissionstatus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxWeekAC` int NULL DEFAULT 0 COMMENT '最大的周AC数',
  `maxMonthAC` int NULL DEFAULT 0 COMMENT '最大的月AC数',
  `maxWeekAverageACRating` double NULL DEFAULT 0 COMMENT '最大的周平均AC题目的rating值',
  `maxMonthAverageACRating` double NULL DEFAULT 0 COMMENT '最大的月平均AC题目的rating值',
  `maxTotalAverageACRating` double NULL DEFAULT 0 COMMENT '最大的所有平均AC题目的rating值',
  `avgWeekAC` double NULL DEFAULT 0 COMMENT '周平均AC数',
  `avgMonthAC` double NULL DEFAULT 0 COMMENT '月平均AC数',
  `avgWeekAverageACRating` double NULL DEFAULT 0,
  `avgMonthAverageACRating` double NULL DEFAULT 0,
  `avgTotalAverageACRating` double NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '根据所有用户的数据，统计出一些平均数和最大值。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `BlogContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ProblemId` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for honors
-- ----------------------------
DROP TABLE IF EXISTS `honors`;
CREATE TABLE `honors`  (
  `hid` int NOT NULL AUTO_INCREMENT,
  `award` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `acquiredTime` bigint NULL DEFAULT NULL,
  `player1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `player2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `player3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `coach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `codeforceshandle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` bigint UNSIGNED NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `ProblemId` int NOT NULL AUTO_INCREMENT,
  `contestId` int NULL DEFAULT NULL,
  `ProblemIndex` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `points` decimal(10, 1) NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProblemId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problemlist
-- ----------------------------
DROP TABLE IF EXISTS `problemlist`;
CREATE TABLE `problemlist`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `begin` bigint UNSIGNED NULL DEFAULT 0,
  `end` bigint UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problemlistwithproblems
-- ----------------------------
DROP TABLE IF EXISTS `problemlistwithproblems`;
CREATE TABLE `problemlistwithproblems`  (
  `problemListId` int NULL DEFAULT NULL,
  `problemId` int NULL DEFAULT NULL,
  `contestId` int NULL DEFAULT NULL,
  `problemIndex` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `acNumber` int NULL DEFAULT 0,
  INDEX `problemlistwithproblems_problem_FK`(`problemId` ASC) USING BTREE,
  INDEX `problemlistwithproblems_problemlist_FK`(`problemListId` ASC) USING BTREE,
  CONSTRAINT `problemlistwithproblems_problem_FK` FOREIGN KEY (`problemId`) REFERENCES `problem` (`ProblemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `problemlistwithproblems_problemlist_FK` FOREIGN KEY (`problemListId`) REFERENCES `problemlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problemlistwithusers
-- ----------------------------
DROP TABLE IF EXISTS `problemlistwithusers`;
CREATE TABLE `problemlistwithusers`  (
  `problemListId` int NULL DEFAULT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `problemlistwithusers_problemlist_FK`(`problemListId` ASC) USING BTREE,
  INDEX `problemlistwithusers_user_FK`(`uid` ASC) USING BTREE,
  CONSTRAINT `problemlistwithusers_problemlist_FK` FOREIGN KEY (`problemListId`) REFERENCES `problemlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `problemlistwithusers_user_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for submission
-- ----------------------------
DROP TABLE IF EXISTS `submission`;
CREATE TABLE `submission`  (
  `acsubmissionid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `contestId` bigint UNSIGNED NULL DEFAULT NULL,
  `ProblemIndex` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `actime` bigint UNSIGNED NULL DEFAULT NULL,
  `handle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ProblemId` int NULL DEFAULT NULL,
  `submissionIdFromCF` bigint UNSIGNED NULL DEFAULT NULL,
  `ProblemRating` int NULL DEFAULT 0,
  `verdict` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`acsubmissionid`) USING BTREE,
  INDEX `fk_problem_id`(`ProblemId` ASC) USING BTREE,
  INDEX `fk_submission_userUuid`(`uid` ASC) USING BTREE,
  CONSTRAINT `fk_problem_id` FOREIGN KEY (`ProblemId`) REFERENCES `problem` (`ProblemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_submission_userUuid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '123456',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `codeforceshandle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '这是codeforces上的用户名',
  `codeforcesrating` int NULL DEFAULT 0,
  `weekAC` int NULL DEFAULT 0,
  `monthAC` int NOT NULL DEFAULT 0,
  `weekSubmits` int NULL DEFAULT 0,
  `monthSubmits` int NULL DEFAULT 0,
  `totalSubmits` int NULL DEFAULT 0,
  `totalACSubmits` int NULL DEFAULT 0,
  `Difficulty1` int UNSIGNED NULL DEFAULT 0 COMMENT 'Difficulty是各种题目难度的刷题数',
  `Difficulty2` int NULL DEFAULT 0,
  `Difficulty3` int NULL DEFAULT 0,
  `Difficulty4` int NULL DEFAULT 0,
  `Difficulty5` int NULL DEFAULT 0,
  `Difficulty6` int NULL DEFAULT 0,
  `Difficulty7` int NULL DEFAULT 0,
  `ratingRank` int NULL DEFAULT 0,
  `monthACRank` int NULL DEFAULT 0,
  `weekAverageACRating` double NULL DEFAULT 0,
  `monthAverageACRating` double NULL DEFAULT 0,
  `totalAverageACRating` double NULL DEFAULT 0,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '请完善电话号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  PRIMARY KEY (`uid`, `codeforceshandle`) USING BTREE,
  INDEX `codeforceshandle`(`codeforceshandle` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userandratinglist
-- ----------------------------
DROP TABLE IF EXISTS `userandratinglist`;
CREATE TABLE `userandratinglist`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `handle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contestid` int NULL DEFAULT NULL,
  `contestname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `oldrating` int NULL DEFAULT NULL,
  `newrating` int NULL DEFAULT NULL,
  `ratingupdatetimeseconds` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_handle`(`handle` ASC) USING BTREE,
  CONSTRAINT `fk_handle` FOREIGN KEY (`handle`) REFERENCES `user` (`codeforceshandle`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;



CREATE DATABASE /*!32312 IF NOT EXISTS*/`nbuacmmanagedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `nbuacmmanagedb`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE user (
    url VARCHAR(255),
    uid VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    username VARCHAR(255),
    codeforcesid VARCHAR(255),
    rating INT,
    tag VARCHAR(255), -- 假设牌子信息可以用字符串表示
    type INT,
    PRIMARY KEY (uid)
);
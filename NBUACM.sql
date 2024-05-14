CREATE DATABASE /*!32312 IF NOT EXISTS*/`NBUACM` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `NBUACM`;

DROP TABLE IF EXISTS `problem`;

CREATE TABLE `problem` (
    `ProblemId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `contestId` INT,
    `Index` CHAR(1),
    `name` VARCHAR(255),
    `Type` VARCHAR(50),
    `points` DECIMAL(10, 1),
    `rating` INT,
    `tags` VARCHAR(255)
)
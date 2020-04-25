-- 用户表
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(40) NOT NULL,
  `username` varchar(20) NOT NULL,
  `cellphone` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `user` VALUES ('1', 'zhongfucheng', '13719193845', 'guangzhou', '403686131@11.fom', '123');

-- 权限表
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `privilege` VALUES ('1', '查找分类');
INSERT INTO `privilege` VALUES ('2', '添加分类');

-- 用户与权限表
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `user_privilege`;
CREATE TABLE `user_privilege` (
  `privilege_id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  PRIMARY KEY (`privilege_id`,`user_id`),
  KEY `user_id_FK1` (`user_id`),
  CONSTRAINT `privilege_id_FK` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`),
  CONSTRAINT `user_id_FK1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `user_privilege` VALUES ('1', '1');
INSERT INTO `user_privilege` VALUES ('2', '1');

-- 分类表

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(40) NOT NULL,
  `name` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `category` VALUES ('c5614ed3-7dc1-475a-8797-b5deaeadea1d', 'Java', null);

-- 书籍表
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` varchar(40) NOT NULL,
  `name` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id_FK` (`category_id`),
  CONSTRAINT `category_id_FK` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `book` VALUES ('65bd8596-ae02-49de-b0f4-d4ae753e8c75', 'Java3y', '', '3y', '123', 'qrcode_for_gh_085b56c42174_258.jpg', 'c5614ed3-7dc1-475a-8797-b5deaeadea1d');

-- 订单表
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(40) NOT NULL,
  `date` date NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_FK` (`user_id`),
  CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `orders` VALUES ('e316071a-da03-4a19-8f6e-7704462d7bb2', '2018-05-06', '1', '1', '123');

-- 订单详情表

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` varchar(40) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `book_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_FK` (`order_id`),
  KEY `book_id_FK` (`book_id`),
  CONSTRAINT `book_id_FK` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `orderitem` VALUES ('be21f54b-99bf-48a6-ad6b-0ad8d3864e9b', '123', '1', 'e316071a-da03-4a19-8f6e-7704462d7bb2', '65bd8596-ae02-49de-b0f4-d4ae753e8c75');

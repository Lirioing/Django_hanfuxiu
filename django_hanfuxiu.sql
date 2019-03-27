/*
 Navicat Premium Data Transfer

 Source Server         : mysql_python
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : django_hanfuxiu

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 27/03/2019 10:04:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add address', 7, 'add_address');
INSERT INTO `auth_permission` VALUES (26, 'Can change address', 7, 'change_address');
INSERT INTO `auth_permission` VALUES (27, 'Can delete address', 7, 'delete_address');
INSERT INTO `auth_permission` VALUES (28, 'Can view address', 7, 'view_address');
INSERT INTO `auth_permission` VALUES (29, 'Can add gender', 8, 'add_gender');
INSERT INTO `auth_permission` VALUES (30, 'Can change gender', 8, 'change_gender');
INSERT INTO `auth_permission` VALUES (31, 'Can delete gender', 8, 'delete_gender');
INSERT INTO `auth_permission` VALUES (32, 'Can view gender', 8, 'view_gender');
INSERT INTO `auth_permission` VALUES (33, 'Can add shop', 9, 'add_shop');
INSERT INTO `auth_permission` VALUES (34, 'Can change shop', 9, 'change_shop');
INSERT INTO `auth_permission` VALUES (35, 'Can delete shop', 9, 'delete_shop');
INSERT INTO `auth_permission` VALUES (36, 'Can view shop', 9, 'view_shop');
INSERT INTO `auth_permission` VALUES (37, 'Can add user', 10, 'add_user');
INSERT INTO `auth_permission` VALUES (38, 'Can change user', 10, 'change_user');
INSERT INTO `auth_permission` VALUES (39, 'Can delete user', 10, 'delete_user');
INSERT INTO `auth_permission` VALUES (40, 'Can view user', 10, 'view_user');
INSERT INTO `auth_permission` VALUES (41, 'Can add usericon', 11, 'add_usericon');
INSERT INTO `auth_permission` VALUES (42, 'Can change usericon', 11, 'change_usericon');
INSERT INTO `auth_permission` VALUES (43, 'Can delete usericon', 11, 'delete_usericon');
INSERT INTO `auth_permission` VALUES (44, 'Can view usericon', 11, 'view_usericon');
INSERT INTO `auth_permission` VALUES (45, 'Can add collection', 12, 'add_collection');
INSERT INTO `auth_permission` VALUES (46, 'Can change collection', 12, 'change_collection');
INSERT INTO `auth_permission` VALUES (47, 'Can delete collection', 12, 'delete_collection');
INSERT INTO `auth_permission` VALUES (48, 'Can view collection', 12, 'view_collection');
INSERT INTO `auth_permission` VALUES (49, 'Can add goods', 13, 'add_goods');
INSERT INTO `auth_permission` VALUES (50, 'Can change goods', 13, 'change_goods');
INSERT INTO `auth_permission` VALUES (51, 'Can delete goods', 13, 'delete_goods');
INSERT INTO `auth_permission` VALUES (52, 'Can view goods', 13, 'view_goods');
INSERT INTO `auth_permission` VALUES (53, 'Can add images', 14, 'add_images');
INSERT INTO `auth_permission` VALUES (54, 'Can change images', 14, 'change_images');
INSERT INTO `auth_permission` VALUES (55, 'Can delete images', 14, 'delete_images');
INSERT INTO `auth_permission` VALUES (56, 'Can view images', 14, 'view_images');
INSERT INTO `auth_permission` VALUES (57, 'Can add size', 15, 'add_size');
INSERT INTO `auth_permission` VALUES (58, 'Can change size', 15, 'change_size');
INSERT INTO `auth_permission` VALUES (59, 'Can delete size', 15, 'delete_size');
INSERT INTO `auth_permission` VALUES (60, 'Can view size', 15, 'view_size');
INSERT INTO `auth_permission` VALUES (61, 'Can add status', 16, 'add_status');
INSERT INTO `auth_permission` VALUES (62, 'Can change status', 16, 'change_status');
INSERT INTO `auth_permission` VALUES (63, 'Can delete status', 16, 'delete_status');
INSERT INTO `auth_permission` VALUES (64, 'Can view status', 16, 'view_status');
INSERT INTO `auth_permission` VALUES (65, 'Can add style', 17, 'add_style');
INSERT INTO `auth_permission` VALUES (66, 'Can change style', 17, 'change_style');
INSERT INTO `auth_permission` VALUES (67, 'Can delete style', 17, 'delete_style');
INSERT INTO `auth_permission` VALUES (68, 'Can view style', 17, 'view_style');
INSERT INTO `auth_permission` VALUES (69, 'Can add shopping_cart', 18, 'add_shopping_cart');
INSERT INTO `auth_permission` VALUES (70, 'Can change shopping_cart', 18, 'change_shopping_cart');
INSERT INTO `auth_permission` VALUES (71, 'Can delete shopping_cart', 18, 'delete_shopping_cart');
INSERT INTO `auth_permission` VALUES (72, 'Can view shopping_cart', 18, 'view_shopping_cart');
INSERT INTO `auth_permission` VALUES (73, 'Can add order', 19, 'add_order');
INSERT INTO `auth_permission` VALUES (74, 'Can change order', 19, 'change_order');
INSERT INTO `auth_permission` VALUES (75, 'Can delete order', 19, 'delete_order');
INSERT INTO `auth_permission` VALUES (76, 'Can view order', 19, 'view_order');
INSERT INTO `auth_permission` VALUES (77, 'Can add order_status', 20, 'add_order_status');
INSERT INTO `auth_permission` VALUES (78, 'Can change order_status', 20, 'change_order_status');
INSERT INTO `auth_permission` VALUES (79, 'Can delete order_status', 20, 'delete_order_status');
INSERT INTO `auth_permission` VALUES (80, 'Can view order_status', 20, 'view_order_status');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cart_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `cart_shopping_cart`;
CREATE TABLE `cart_shopping_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checked` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `goods_size` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_shopping_cart_goods_id_fb45cc7b_fk_goods_goods_id`(`goods_id`) USING BTREE,
  INDEX `cart_shopping_cart_user_id_cdcf25b7_fk_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `cart_shopping_cart_goods_id_fb45cc7b_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_shopping_cart_user_id_cdcf25b7_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_shopping_cart
-- ----------------------------
INSERT INTO `cart_shopping_cart` VALUES (1, NULL, 11, 'M', '2019-01-25 00:00:00.000000', 2, 15);
INSERT INTO `cart_shopping_cart` VALUES (2, NULL, 2, 'M', '2019-01-25 00:00:00.000000', 4, 15);
INSERT INTO `cart_shopping_cart` VALUES (3, NULL, 4, 'M', '2019-01-25 00:00:00.000000', 5, 15);
INSERT INTO `cart_shopping_cart` VALUES (4, NULL, 1, 'M', '2019-03-14 00:00:00.000000', 3, 16);
INSERT INTO `cart_shopping_cart` VALUES (5, NULL, 8, 'M', '2019-03-21 00:00:00.000000', 2, 16);
INSERT INTO `cart_shopping_cart` VALUES (6, NULL, 1, 'M', '2019-03-21 00:00:00.000000', 5, 16);
INSERT INTO `cart_shopping_cart` VALUES (7, NULL, 2, 'M', '2019-03-21 00:00:00.000000', 6, 16);
INSERT INTO `cart_shopping_cart` VALUES (8, NULL, 2, 'M', '2019-03-21 00:00:00.000000', 3, 17);
INSERT INTO `cart_shopping_cart` VALUES (9, NULL, 3, 'M', '2019-03-21 00:00:00.000000', 8, 17);
INSERT INTO `cart_shopping_cart` VALUES (10, NULL, 6, 'M', '2019-03-21 00:00:00.000000', 7, 17);
INSERT INTO `cart_shopping_cart` VALUES (11, NULL, 3, 'M', '2019-03-21 00:00:00.000000', 4, 17);
INSERT INTO `cart_shopping_cart` VALUES (12, NULL, 6, 'M', '2019-03-21 00:00:00.000000', 11, 17);
INSERT INTO `cart_shopping_cart` VALUES (13, 'true', 8, 'M', '2019-03-21 00:00:00.000000', 5, 17);
INSERT INTO `cart_shopping_cart` VALUES (16, 'true', 2, 'M', '2019-03-26 01:39:37.874566', 5, 18);
INSERT INTO `cart_shopping_cart` VALUES (18, 'true', 4, 'S', '2019-03-26 03:27:37.284116', 5, 18);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (18, 'cart', 'shopping_cart');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'goods', 'collection');
INSERT INTO `django_content_type` VALUES (13, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (14, 'goods', 'images');
INSERT INTO `django_content_type` VALUES (15, 'goods', 'size');
INSERT INTO `django_content_type` VALUES (16, 'goods', 'status');
INSERT INTO `django_content_type` VALUES (17, 'goods', 'style');
INSERT INTO `django_content_type` VALUES (19, 'order', 'order');
INSERT INTO `django_content_type` VALUES (20, 'order', 'order_status');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'user', 'address');
INSERT INTO `django_content_type` VALUES (8, 'user', 'gender');
INSERT INTO `django_content_type` VALUES (9, 'user', 'shop');
INSERT INTO `django_content_type` VALUES (10, 'user', 'user');
INSERT INTO `django_content_type` VALUES (11, 'user', 'usericon');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-03-27 01:47:24.701306');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-03-27 01:47:46.274506');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-03-27 01:47:50.793605');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-03-27 01:47:50.867410');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-03-27 01:47:51.008033');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-03-27 01:47:57.991364');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-03-27 01:48:01.805056');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-03-27 01:48:04.528267');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-03-27 01:48:04.659915');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-03-27 01:48:06.527921');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-03-27 01:48:06.590750');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-27 01:48:06.663556');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-03-27 01:48:11.075714');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-27 01:48:14.402620');
INSERT INTO `django_migrations` VALUES (15, 'user', '0001_initial', '2019-03-27 01:48:32.872731');
INSERT INTO `django_migrations` VALUES (16, 'goods', '0001_initial', '2019-03-27 01:49:07.181325');
INSERT INTO `django_migrations` VALUES (17, 'cart', '0001_initial', '2019-03-27 01:49:16.020902');
INSERT INTO `django_migrations` VALUES (18, 'order', '0001_initial', '2019-03-27 01:49:27.769422');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2019-03-27 01:49:29.163245');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_collection
-- ----------------------------
DROP TABLE IF EXISTS `goods_collection`;
CREATE TABLE `goods_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `create_date` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_collection_goods_id_57878d43_fk_goods_goods_id`(`goods_id`) USING BTREE,
  INDEX `goods_collection_shop_id_65d9ec4c_fk_user_shop_id`(`shop_id`) USING BTREE,
  INDEX `goods_collection_user_id_9d2269a5_fk_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `goods_collection_goods_id_57878d43_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_collection_shop_id_65d9ec4c_fk_user_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `user_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_collection_user_id_9d2269a5_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_collection
-- ----------------------------
INSERT INTO `goods_collection` VALUES (1, 0, '2019-02-19 00:00:00.000000', 5, 1, 17);
INSERT INTO `goods_collection` VALUES (2, 1, '2019-02-21 00:00:00.000000', 1, 1, 18);
INSERT INTO `goods_collection` VALUES (3, 1, '2019-02-21 00:00:00.000000', 1, 2, 18);
INSERT INTO `goods_collection` VALUES (4, 1, '2019-02-21 00:00:00.000000', 1, 4, 18);
INSERT INTO `goods_collection` VALUES (5, 1, '2019-02-21 00:00:00.000000', 1, 3, 18);
INSERT INTO `goods_collection` VALUES (6, 1, '2019-02-23 00:00:00.000000', 1, 3, 17);
INSERT INTO `goods_collection` VALUES (7, 1, '2019-02-23 00:00:00.000000', 1, 1, 17);
INSERT INTO `goods_collection` VALUES (8, 1, '2019-02-23 00:00:00.000000', 1, 2, 17);
INSERT INTO `goods_collection` VALUES (9, 0, '2019-02-23 00:00:00.000000', 3, 1, 17);
INSERT INTO `goods_collection` VALUES (10, 0, '2019-02-23 00:00:00.000000', 4, 1, 17);
INSERT INTO `goods_collection` VALUES (11, 0, '2019-02-23 00:00:00.000000', 5, 1, 17);
INSERT INTO `goods_collection` VALUES (12, 0, '2019-02-23 00:00:00.000000', 7, 1, 17);
INSERT INTO `goods_collection` VALUES (13, 0, '2019-02-23 00:00:00.000000', 6, 1, 17);
INSERT INTO `goods_collection` VALUES (49, 0, '2019-03-23 08:35:49.123664', 16, 2, 17);
INSERT INTO `goods_collection` VALUES (50, 0, '2019-03-23 08:35:58.873040', 24, 4, 17);
INSERT INTO `goods_collection` VALUES (51, 0, '2019-03-23 08:36:06.117183', 20, 3, 17);

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `goods_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `goods_style` int(11) NOT NULL,
  `classbig` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `recommend` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime(6) NULL,
  `goods_status_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_goods_goods_status_id_2ef658bc_fk_goods_status_id`(`goods_status_id`) USING BTREE,
  INDEX `goods_goods_shop_id_043b2953_fk_user_shop_id`(`shop_id`) USING BTREE,
  INDEX `goods_goods_size_id_ba359201_fk_goods_size_id`(`size_id`) USING BTREE,
  CONSTRAINT `goods_goods_goods_status_id_2ef658bc_fk_goods_status_id` FOREIGN KEY (`goods_status_id`) REFERENCES `goods_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_goods_shop_id_043b2953_fk_user_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `user_shop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_goods_size_id_ba359201_fk_goods_size_id` FOREIGN KEY (`size_id`) REFERENCES `goods_size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES (1, '【流烟昔泠-念念】原创国风日常汉服女装汉元素时装春款短裙绣花', '对襟襦裙', 58, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (2, '【流烟昔泠-长相思】传统汉服女装刺绣大袖衫齐腰襦裙春款', '对襟襦裙', 58, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (3, '【流烟昔泠-溪山涧】原创冬款汉服女装衫裙日常绣花襦裙', '对襟襦裙', 78, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (4, '【流烟昔泠-南浔衫裙】原创秋冬款女绣花交领琵琶袖汉服', '对襟襦裙', 147, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (5, '流烟昔泠 韶华 传统原创立领对襟六片半身裙汉元素裙子 女装 ', '对襟襦裙', 99, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (6, '流烟昔泠 浮光 传统原创立领对襟六片半身裙汉元素裙子 女装 ', '对襟襦裙', 99, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (7, '流烟昔泠 翦秋水 秋款原创传统汉服女装绣花褙子吊带下裙', '对襟襦裙', 58, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (8, '流烟昔泠 未央 原创秋冬传统汉服男女款鹤氅衣裳绣花刺绣', '对襟襦裙', 98, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (9, '流烟昔泠 霜笙 袄裙 传统原创设计冬款绣花袄裙女装 ', '袄裙', 150, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (10, '流烟昔泠 霜笙 袄裙 传统原创设计冬款绣花袄裙女装 ', '袄裙', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (11, '流烟昔泠 秋日宴 曲裾 传统原创汉服女绣花曲裾日常汉服', '对襟襦裙', 288, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (12, '流烟昔泠 轻云蕊 传统原创汉服立领纱衫 立领斜襟长衫绣花', '对襟襦裙', 118, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (13, '流烟昔泠 芊泽 夏款原创传统汉服女装刺绣花褙子宋裤套装', '对襟襦裙', 49, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 1, 2);
INSERT INTO `goods_goods` VALUES (14, '重回汉唐 汉服女装襦裙行香子日常中国风交领齐腰衫裙春秋', '对襟襦裙', 136, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 2, 2);
INSERT INTO `goods_goods` VALUES (15, '重回汉唐汉服女秋装瑶铃魏晋风交领齐腰襦裙套装淡雅中国风', '对襟襦裙', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 2, 2);
INSERT INTO `goods_goods` VALUES (16, '重回汉唐 岫岚 晋制汉服女冬装交领襦裙女中国风广袖齐腰襦裙套装', '对襟襦裙', 148, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 2, 2);
INSERT INTO `goods_goods` VALUES (17, '重回汉唐 汉服男装铭乐日常中国风绣花半臂交领衣裳春秋装', '男装', 128, 5000, 2, '男款套装', '1', '2019-01-22 00:00:00.000000', 100, 3, 2);
INSERT INTO `goods_goods` VALUES (18, '重回汉唐汉服配饰女士鞋子熙颜千层底手工刺绣弓鞋平底绣花布鞋', '布鞋', 98, 5000, 2, '鞋', '1', '2019-01-22 00:00:00.000000', 100, 3, 2);
INSERT INTO `goods_goods` VALUES (19, '重回汉唐精工汉服女装袄裙惊蛰年明制传统日常交领绣花套装秋冬款', '对襟襦裙', 398, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 3, 2);
INSERT INTO `goods_goods` VALUES (20, '重回汉唐虞美人原创设计日常汉服女绣花长褙子吊带齐腰裙套装春秋', '对襟襦裙', 218, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 3, 2);
INSERT INTO `goods_goods` VALUES (21, '重回汉唐轻梦原创设计汉服女日常绣花对襟齐腰襦裙搭吊带褙子春秋', '对襟襦裙', 248, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 3, 2);
INSERT INTO `goods_goods` VALUES (22, '重回汉唐五谷丰灯汉服女直领半袖明制中长袄女冬季中国风毛呢外套', '长衫', 268, 5000, 2, '男款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (23, '重回汉唐 极乐 原创传统日常汉服女绣花对襟齐腰上襦下裙吊带春秋', '对襟襦裙', 78, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (24, '重回汉唐汉服女装尺素传统日常中国民族风对襟半臂上衣夏秋', '上衣', 88, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (25, '重回汉唐 隐香 原创日常汉服女绣花短褙子改良宋裤单品传统春秋装', '宋裤', 198, 5000, 2, '男款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (26, '重回汉唐 白薇 原创设计日常汉服女绣花长褙子传统改良宋裤春秋装', '宋裤', 126, 5000, 2, '男款裤子', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (27, '重回汉唐汉服女装摇曳原创日常传统绣花长褙子吊带齐腰裙套装春秋', '套装', 128, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (28, '流烟昔泠 翦秋水 秋款原创传统汉服女装绣花褙子吊带下裙 ', '裙子', 58, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 3, 2);
INSERT INTO `goods_goods` VALUES (29, '流烟昔泠 未央 原创秋冬传统汉服男女款鹤氅衣裳绣花刺绣', '上衣', 98, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (30, '流烟昔泠 未央 原创秋冬传统汉服男女款鹤氅衣裳绣花刺绣', '上衣', 98, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (31, '流烟昔泠 未央 原创秋冬传统汉服男女款鹤氅衣裳绣花刺绣', '上衣', 98, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (32, '流烟昔泠 未央 原创秋冬传统汉服男女款鹤氅衣裳绣花刺绣', '上衣', 98, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (33, '流烟昔泠 霜笙 袄裙 传统原创设计冬款绣花袄裙女装 ', '袄裙', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (34, '流烟昔泠 霜笙 袄裙 传统原创设计冬款绣花袄裙女装', '袄裙', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (35, '流烟昔泠 霜笙 袄裙 传统原创设计冬款绣花袄裙女装 ', '袄裙', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (36, '流烟昔泠 霜笙 袄裙 传统原创设计冬款绣花袄裙女装', '袄裙', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (37, '流烟昔泠 长乐 传统原创汉服圆领袍秋冬刺绣绣花圆领袍 ', '上衣', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (38, 'c', '上衣', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (39, '流烟昔泠 长乐 传统原创汉服圆领袍秋冬刺绣绣花圆领袍', '上衣', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (40, '流烟昔泠 长乐 传统原创汉服圆领袍秋冬刺绣绣花圆领袍', '上衣', 139, 5000, 2, '女款套装', '1', '2019-01-22 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (41, '【碧落】国色芳华传统汉服女齐胸对襟襦裙春夏款绣花', '套装', 235, 5000, 2, '男款套装', 'carousel', '2019-01-22 00:00:00.000000', 100, 4, 2);
INSERT INTO `goods_goods` VALUES (42, '流烟昔泠 长乐 传统原创汉服圆领袍秋冬刺绣绣花圆领袍', '套装', 156, 5000, 2, '男款套装', 'carousel', '2019-01-25 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (43, '丹墨 观其赋原创传统汉服', '套装', 123, 5000, 2, '男款套装', 'carousel', '2019-01-25 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (44, '流烟昔泠 未央 原创秋冬传统汉服男女款鹤氅衣裳绣花刺绣', '套装', 256, 5000, 2, '男款套装', 'carousel', '2019-01-25 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (45, '都城南庄汉服女豆蔻秋季原创新品齐腰袄裙绣花浅日常两件套', '套装', 254, 500, 2, '女款套装', 'recommend_goods', '2019-01-25 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (46, '【鹤迎】纨素黑色仙鹤印花单层衫一片式双层洒金褶裙套汉服', '套装', 674, 5000, 2, '男款套装', 'recommend_goods', '2019-01-25 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (47, '同生轩汉服新款网纱撒金齐胸六米摆齐胸攒月原创正版汉服', '上衣', 278, 5000, 2, '男款套装', 'recommend_goods', '2019-01-25 00:00:00.000000', 100, 4, 1);
INSERT INTO `goods_goods` VALUES (48, '汉尚华莲x楚留香合作款春盈袖刺绣立领对襟长袄汉服日常春装', '套装', 438, 500, 2, '男款套装', 'recommend_goods', '2019-01-25 00:00:00.000000', 100, 4, 1);

-- ----------------------------
-- Table structure for goods_images
-- ----------------------------
DROP TABLE IF EXISTS `goods_images`;
CREATE TABLE `goods_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images_ads` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_images_goods_id_d09a40fd_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `goods_images_goods_id_d09a40fd_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_images
-- ----------------------------
INSERT INTO `goods_images` VALUES (1, 'https://pic.hanfugou.com/pc/2019/1/19/0/d0f76e9f73034b45844501a0bac3d813.jpg', 1);
INSERT INTO `goods_images` VALUES (2, 'https://pic.hanfugou.com/pc/2019/1/4/14/c3a37645ce66404cbc4eb75563a9aa05.png', 2);
INSERT INTO `goods_images` VALUES (3, 'https://pic.hanfugou.com/pc/2018/12/28/18/75a9e6ba115341c5888bf19a46ac9e89.png\r\nhttps://pic.hanfugou.com/pc/2018/12/28/18/75a9e6ba115341c5888bf19a46ac9e89.png\r\n\r\nhttps://pic.hanfugou.com/pc/2018/12/28/18/75a9e6ba115341c5888bf19a46ac9e89.png', 3);
INSERT INTO `goods_images` VALUES (4, 'https://pic.hanfugou.com/pc/2019/1/11/23/8dbe5a479c774922afb191903360e118.JPG', 4);
INSERT INTO `goods_images` VALUES (5, 'https://pic.hanfugou.com/web/2019/1/17/12/080627706e51437f938357c17a4de66e.jpg_250x250.jpg/format/webp', 5);
INSERT INTO `goods_images` VALUES (6, 'https://pic.hanfugou.com/web/2018/11/9/17/03d9b69069474616ba433fe477af94c7.jpg_250x250.jpg/format/webp', 6);
INSERT INTO `goods_images` VALUES (7, 'https://pic.hanfugou.com/web/2019/1/18/17/bf8e538dbbc24c79a84b8fb841fb3f3f.jpg_lo450.jpg', 7);
INSERT INTO `goods_images` VALUES (8, 'https://pic.hanfugou.com/web/2019/1/22/14/9a812e36d93d4dc0a1fa1294e72ee487.jpg_lo450.jpg', 8);

-- ----------------------------
-- Table structure for goods_size
-- ----------------------------
DROP TABLE IF EXISTS `goods_size`;
CREATE TABLE `goods_size`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_size
-- ----------------------------
INSERT INTO `goods_size` VALUES (1, 'S');
INSERT INTO `goods_size` VALUES (2, 'M');
INSERT INTO `goods_size` VALUES (3, 'L');
INSERT INTO `goods_size` VALUES (4, 'XL');

-- ----------------------------
-- Table structure for goods_status
-- ----------------------------
DROP TABLE IF EXISTS `goods_status`;
CREATE TABLE `goods_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_status
-- ----------------------------
INSERT INTO `goods_status` VALUES (100, '上架');
INSERT INTO `goods_status` VALUES (101, '下架');

-- ----------------------------
-- Table structure for goods_style
-- ----------------------------
DROP TABLE IF EXISTS `goods_style`;
CREATE TABLE `goods_style`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `style_img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `style_img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `style_img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info_img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info_img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info_img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info_img4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info_img5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info_img6` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `recommend_img1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `recommend_img2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `recommend_img3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `recommend_img4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_style_goods_id_6f29291d_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `goods_style_goods_id_6f29291d_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_style
-- ----------------------------
INSERT INTO `goods_style` VALUES (1, 'https://pic.hanfugou.com/web/2019/1/17/12/f4db2b966cb34f31a144104817b3f871.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/b4973d30b5b5481e973448f5f211a675.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/cc845151ac3e494eba32f35bda6cbe55.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/4265367dbcd143c682a9788bd0e8f8fa.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/802673fad01746c6a362237957be297b.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/f54d78c4577d432eb4e546e3a418a3a8.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/05005db5778f42de8d3e0f70c0f233c8.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/2311c7cf6d1743b4af8b75b8401283ed.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/94648c2163434690853726e860eaba49.jpg_820.jpg/format/webp', 'pic.hanfugou.com/web/2019/1/17/12/a8c8070403bd4f39af622f5322feb1bb.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/f4db2b966cb34f31a144104817b3f871.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/d839f81fbee84b5bb99c113770b5110a.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/f4db2b966cb34f31a144104817b3f871.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/f31ef438fdd845af8d861db92836e947.jpg_250x250.jpg/format/webp', 1);
INSERT INTO `goods_style` VALUES (2, 'https://pic.hanfugou.com/web/2019/1/17/12/3d75ad8daa80461893929f36e29f6223.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/d73ddfcee9ac42cfa620312b2dadabc5.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/76aded7199dc4293aec73efb1ffa9276.jpg_50x50.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/76aded7199dc4293aec73efb1ffa9276.jpg_50x50.jpg', 'https://pic.hanfugou.com/web/2019/1/17/12/dd015d4480264d898abfa9cb753719a8.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/d2a8200ae07940fca8cf9ac246be499f.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/96a264ea9e544f9c8ad5f8bd1205580a.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/45e8b1d1c4014f9bbccd6ac44488ce47.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/9590e36ef39e4afd9f7c21dd58acdfbe.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/12/9f3054561e8445159ff3b3f3fc058493.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/d839f81fbee84b5bb99c113770b5110a.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/a3547de66d7b47a4bf9337d0c2d081d0.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/f31ef438fdd845af8d861db92836e947.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/64edc4fed88149d5a255c47a62ebd08b.jpg_250x250.jpg/format/webp', 2);
INSERT INTO `goods_style` VALUES (3, 'https://pic.hanfugou.com/web/2018/12/14/16/a3547de66d7b47a4bf9337d0c2d081d0.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2019/1/17/15/81d06ec8b3374c9eaabc160196f15239.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2019/1/17/15/547d9bf6fed44bbdac3c14ad38394d9b.jpg_lo450.jpg', 'https://pic.hanfugou.com/web/2018/12/14/16/a3547de66d7b47a4bf9337d0c2d081d0.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/c07ca271e3b44c5981c4b01ca237d9c8.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/7cb0aabb20f1459b9093572a738d9aa0.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/31/3/82d41360c4c44cb59ff31f9fb5f47524.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/31/3/ef3a6aa8bc174142ae3e46bd71eaab10.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/31/3/d4bc7b10d3ae4d29abe730fdd33546d2.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/31/3/c22b640438ed44c2880f7b9bfae8d9e9.jpg_820.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/d839f81fbee84b5bb99c113770b5110a.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/a3547de66d7b47a4bf9337d0c2d081d0.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/f31ef438fdd845af8d861db92836e947.jpg_250x250.jpg/format/webp', 'https://pic.hanfugou.com/web/2018/12/14/16/64edc4fed88149d5a255c47a62ebd08b.jpg_250x250.jpg/format/webp', 3);
INSERT INTO `goods_style` VALUES (4, 'https://pic.hanfugou.com/web/2018/11/14/7/11ed5a696a44426589e9c37313b25e52.jpg_250x250.jpg/format/webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `goods_style` VALUES (5, 'https://pic.hanfugou.com/web/2018/11/14/9/4e77463c6bd44de8a2ce9182316b42c3.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `goods_style` VALUES (6, 'https://pic.hanfugou.com/web/2018/11/14/9/94727338b4174eef8781cf4fc26a941d.jpg_250x250.jpg/format/webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `goods_style` VALUES (7, 'https://pic.hanfugou.com/web/2018/11/14/9/79208c8cdb134d59877581d906503b91.jpg_250x250.jpg/format/webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `goods_style` VALUES (8, 'https://pic.hanfugou.com/web/2018/11/14/9/b5646977eeac46c9810c956f1af3979b.jpg_250x250.jpg/format/webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO `goods_style` VALUES (9, 'https://pic.hanfugou.com/web/2018/11/14/10/d520d2a147444f3ab72c2eff63b6c2ce.jpg_250x250.jpg/format/webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `goods_style` VALUES (10, 'https://pic.hanfugou.com/web/2018/11/14/9/811140d96de745d1a41a7b845fd99da7.jpg_250x250.jpg/format/webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO `goods_style` VALUES (11, 'https://pic.hanfugou.com/web/2018/11/14/10/1691ff53344b4e56bc4b044d0ff58cee.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `goods_style` VALUES (12, 'https://pic.hanfugou.com/web/2018/11/14/10/41aa1107f5fb40c7be662785edaaa3b8.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO `goods_style` VALUES (13, 'https://pic.hanfugou.com/web/2018/11/14/14/3d783d705b3646c3a785acf11d19305e.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `goods_style` VALUES (14, 'https://pic.hanfugou.com/web/2018/11/15/8/cb6d0b895efa4513b59909f95fa50f07.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO `goods_style` VALUES (15, 'https://pic.hanfugou.com/web/2018/11/14/12/7ff22e3a40ef49bca1c45e0dd40b409d.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO `goods_style` VALUES (16, 'https://pic.hanfugou.com/web/2019/1/12/19/b5787d3454a74e54b5f83302818457e6.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16);
INSERT INTO `goods_style` VALUES (17, 'https://pic.hanfugou.com/web/2018/11/15/5/8ffce38bf9f8477fae1781f5d130ea3a.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17);
INSERT INTO `goods_style` VALUES (18, 'https://pic.hanfugou.com/web/2018/11/14/14/37e7aa11053f4ed789c671121f1c25a1.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18);
INSERT INTO `goods_style` VALUES (19, 'https://pic.hanfugou.com/web/2018/11/15/7/ff803e5c356447099c6115dc03fcf6ab.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19);
INSERT INTO `goods_style` VALUES (20, 'https://pic.hanfugou.com/web/2018/11/15/12/063dc5871d0e4bfe92307a5bfe4238e7.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20);
INSERT INTO `goods_style` VALUES (21, 'https://pic.hanfugou.com/web/2018/11/15/13/08d8215d07b244e594ec581ded0eedfb.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `goods_style` VALUES (22, 'https://pic.hanfugou.com/web/2019/1/16/23/39ef9934ea9c44289f6338270e19835b.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22);
INSERT INTO `goods_style` VALUES (23, 'https://pic.hanfugou.com/web/2018/11/15/14/ee4dff1da99142648778445fb1d5cd85.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23);
INSERT INTO `goods_style` VALUES (24, 'https://pic.hanfugou.com/web/2018/11/15/5/d5e7aa549e484433a65b152d89194829.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24);
INSERT INTO `goods_style` VALUES (25, 'https://pic.hanfugou.com/web/2018/11/15/15/06cc9be66da4410f893d2fd64ae03a0a.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25);
INSERT INTO `goods_style` VALUES (26, 'https://pic.hanfugou.com/web/2018/11/15/15/b4dbafcd4d7d463796258e73ea78fabf.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26);
INSERT INTO `goods_style` VALUES (27, 'https://pic.hanfugou.com/web/2018/11/15/6/eba44d574016498798d10de684becf8c.jpg_lo450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27);

-- ----------------------------
-- Table structure for order_order
-- ----------------------------
DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `goods_size` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `quantity` int(11) NOT NULL,
  `create_date` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_order_goods_id_b8ae2ba1_fk_goods_goods_id`(`goods_id`) USING BTREE,
  INDEX `order_order_order_status_id_12616e9a_fk_order_order_status_id`(`order_status_id`) USING BTREE,
  INDEX `order_order_user_id_7cf9bc2b_fk_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `order_order_goods_id_b8ae2ba1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_order_order_status_id_12616e9a_fk_order_order_status_id` FOREIGN KEY (`order_status_id`) REFERENCES `order_order_status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_order_user_id_7cf9bc2b_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_order
-- ----------------------------
INSERT INTO `order_order` VALUES (2, '2345678001', 'M', 2, '2019-02-06 00:00:00.000000', 2, 1, 17);
INSERT INTO `order_order` VALUES (3, '2345678002', 'M', 4, '2019-02-07 00:00:00.000000', 3, 3, 17);
INSERT INTO `order_order` VALUES (4, '2345678003', 'M', 3, '2019-01-15 00:00:00.000000', 4, 4, 17);
INSERT INTO `order_order` VALUES (5, '2345678004', 'M', 2, '2019-02-13 00:00:00.000000', 25, 1, 17);
INSERT INTO `order_order` VALUES (6, '2345678005', 'M', 1, '2019-02-12 00:00:00.000000', 26, 3, 17);
INSERT INTO `order_order` VALUES (7, '2345678006', 'M', 2, '2019-02-18 00:00:00.000000', 2, 1, 15);
INSERT INTO `order_order` VALUES (8, '2345678007', 'M', 4, '2019-02-13 00:00:00.000000', 3, 3, 15);
INSERT INTO `order_order` VALUES (9, '2345678008', 'M', 1, '2019-01-10 00:00:00.000000', 28, 4, 15);
INSERT INTO `order_order` VALUES (10, '2345678009', 'M', 2, '2019-02-13 00:00:00.000000', 4, 1, 15);
INSERT INTO `order_order` VALUES (11, '23456780010', 'M', 2, '2019-02-06 00:00:00.000000', 2, 1, 16);
INSERT INTO `order_order` VALUES (12, '23456780011', 'M', 1, '2019-02-07 00:00:00.000000', 3, 3, 16);
INSERT INTO `order_order` VALUES (13, '23456780012', 'M', 2, '2019-02-18 00:00:00.000000', 4, 4, 16);
INSERT INTO `order_order` VALUES (15, '21553503144942636926', 'S', 2, '2019-03-26 08:19:56.717488', 5, 1, 18);

-- ----------------------------
-- Table structure for order_order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_order_status`;
CREATE TABLE `order_order_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_text` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_order_status
-- ----------------------------
INSERT INTO `order_order_status` VALUES (1, '待付款');
INSERT INTO `order_order_status` VALUES (2, '已付款');
INSERT INTO `order_order_status` VALUES (3, '待发货');
INSERT INTO `order_order_status` VALUES (4, '待收货');
INSERT INTO `order_order_status` VALUES (5, '待评价');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `distinct` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_address_user_id_64deb2c7_fk_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_address_user_id_64deb2c7_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (1, 'zxc', '安徽省', '合肥市', '瑶海区', '111', '2019-01-16 00:00:00.000000', 15);
INSERT INTO `user_address` VALUES (2, 'zxn', '安徽省', '合肥市', '瑶海区', '2222', '2019-09-08 00:00:00.000000', 21);
INSERT INTO `user_address` VALUES (6, '汉服秀用户', '安徽省', '合肥市', '蜀山区', '222222', '2019-03-25 08:41:48.322680', 41);

-- ----------------------------
-- Table structure for user_gender
-- ----------------------------
DROP TABLE IF EXISTS `user_gender`;
CREATE TABLE `user_gender`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_gender
-- ----------------------------
INSERT INTO `user_gender` VALUES (1, '女');
INSERT INTO `user_gender` VALUES (2, '男');

-- ----------------------------
-- Table structure for user_shop
-- ----------------------------
DROP TABLE IF EXISTS `user_shop`;
CREATE TABLE `user_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `shop_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_shop_user_id_4d88c4b5_fk_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_shop_user_id_4d88c4b5_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_shop
-- ----------------------------
INSERT INTO `user_shop` VALUES (1, '流烟昔泠', 'XXXXXXXXXXXX', 15);
INSERT INTO `user_shop` VALUES (2, '重回汉唐汉服店', 'XXXXXXXXXXX', 16);
INSERT INTO `user_shop` VALUES (3, '汉尚华莲汉服', 'XXXXXXXX', 17);
INSERT INTO `user_shop` VALUES (4, '黎落阁汉服', 'XXXXXXXXXXXXX', 18);

-- ----------------------------
-- Table structure for user_user
-- ----------------------------
DROP TABLE IF EXISTS `user_user`;
CREATE TABLE `user_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `shop_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime(6) NULL,
  `gender_id` int(11) NOT NULL,
  `usericon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_user_gender_id_9df86fff_fk_user_gender_id`(`gender_id`) USING BTREE,
  INDEX `user_user_usericon_id_f80438f5_fk_user_usericon_id`(`usericon_id`) USING BTREE,
  CONSTRAINT `user_user_gender_id_9df86fff_fk_user_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `user_gender` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_user_usericon_id_f80438f5_fk_user_usericon_id` FOREIGN KEY (`usericon_id`) REFERENCES `user_usericon` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_user
-- ----------------------------
INSERT INTO `user_user` VALUES (15, '13812790499', 'pbkdf2:sha1:1001$gJIHqjnG$3e3221346291f38f32ec5b7dbc83a08567ee62b6', '若木若木', '1', '10', '2019-01-21 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (16, '13812790498', 'pbkdf2:sha1:1001$gJIHqjnG$3e3221346291f38f32ec5b7dbc83a08567ee62b6', '重回汉唐汉服店', '1', '10', '2019-01-21 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (17, '13812790488', 'pbkdf2:sha1:1001$gJIHqjnG$3e3221346291f38f32ec5b7dbc83a08567ee62b6', '汉尚华莲汉服', '1', '11', '2019-01-21 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (18, '13812790468', 'pbkdf2:sha1:1001$gJIHqjnG$3e3221346291f38f32ec5b7dbc83a08567ee62b6', '黎落阁汉服', '1', '11', '2019-01-21 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (21, '13812790455', 'pbkdf2:sha1:1001$YDg8bcnn$537cddbcdf5eff808f50f776d7a641dce948faf3', '汉服秀用户', '0', '10', '2019-02-17 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (22, '13812799990', 'pbkdf2:sha1:1001$3n2M1TiY$bd3ede963e598154007d009a5176a9da6b949cee', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (23, '13824253567', 'pbkdf2:sha1:1001$FwRUnYEw$cc86ec3057036df26dd9321d784c77aaad716fe4', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (24, '13812798989', 'pbkdf2:sha1:1001$5BnjKxw3$41975a8c8061606d2cee603bf2f43ae306f54c1c', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (25, '13812792524', 'pbkdf2:sha1:1001$01j5U8vF$1188affe9916e8f8b859d5c1a547278670d17721', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (26, '13812797897', 'pbkdf2:sha1:1001$BJADZL1I$476376aa51fef2854e95ff878bbd482157df7a6c', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (27, '13812790456', 'pbkdf2:sha1:1001$7WYmMgSK$02084fd291e267b08b30873f8adeec85d71449f0', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (28, '13812790990', 'pbkdf2:sha1:1001$S1gOoKVK$dea788efad8939420c8dac0e5a348069d33fa28b', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (29, '13812798789', 'pbkdf2:sha1:1001$vonSa2ZF$3dd8fc3bbc1d6afcc8742d1bee033acfa05eceb1', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (30, '13812756789', 'pbkdf2:sha1:1001$bqhHy0BO$378026566e2d07893d95f39c15b0a344a277edfc', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (31, '13812111111', 'pbkdf2:sha1:1001$6N4RjZZe$6652f9941f3c076c7b4286ecaab6cadc9c6b6bf4', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (32, '13812791234', 'pbkdf2:sha1:1001$qYgJluJk$65f647c831ff8b3ddd0ca21fe20d52095f2ff0f6', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (33, '13812793456', 'pbkdf2:sha1:1001$uUOL4Qj1$660be847590333ca3c677f2cdef3c57e27a794ee', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (34, '13812795674', 'pbkdf2:sha1:1001$x0nZUPGc$541320cb8b5834f8dadfbd52394d4a116fea19e6', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (35, '13812792534', 'pbkdf2:sha1:1001$mpgBf4l6$c63ef2545a90e11c2e8cecebbc90d6b94a79cc58', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (36, '13812721234', 'pbkdf2:sha1:1001$eUAWVnSF$8dc1d5757750f264f915b4e0e7bc3b4c0cf715ea', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (37, '13812794569', 'pbkdf2:sha1:1001$w6Pcf6tF$e0009df1d388602507b51a832b4a34da80b49c05', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (38, '13812797368', 'pbkdf2:sha1:1001$J8Rt7tJG$194d86501888ddfcb881312d21bccd2415a6c4ab', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 1);
INSERT INTO `user_user` VALUES (39, '13812797666', 'pbkdf2:sha1:1001$qyi1rNY7$1e26c10f6bb9de0544e34c37d0b1bc692a2e859e', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (40, '18856889999', 'pbkdf2:sha1:1001$Fum2RZfF$f63b511da036f13c9284bbc4b9d6a7e4a3bd8c4c', '汉服秀用户', '0', '10', '2019-02-18 00:00:00.000000', 2, 3);
INSERT INTO `user_user` VALUES (41, '18214567890', 'pbkdf2:sha1:1001$vhBzZWSC$940bd868804ee912287b8d39b8a0dcd917d0049f', '汉服秀用户', '0', '10', '2019-02-19 00:00:00.000000', 1, 1);
INSERT INTO `user_user` VALUES (42, '18056889767', 'pbkdf2:sha1:1001$syOBH1le$603da2a3d647619348c86ec37038b0f252e36a2a', '测试', '0', '10', '2019-03-23 06:54:10.616511', 1, 1);
INSERT INTO `user_user` VALUES (43, '18056889766', 'pbkdf2:sha1:1001$hfVTZ5Wx$8255aaf5281c043d93b75a3d67a6c44eff3262b7', '汉服秀用户', '0', '10', '2019-03-27 01:24:19.944850', 2, 1);

-- ----------------------------
-- Table structure for user_usericon
-- ----------------------------
DROP TABLE IF EXISTS `user_usericon`;
CREATE TABLE `user_usericon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usericon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_date` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_usericon
-- ----------------------------
INSERT INTO `user_usericon` VALUES (1, 'http://www.baidu.com', '2019-03-25 16:53:36.000000');
INSERT INTO `user_usericon` VALUES (2, 'http://www.baidu.com', '2019-03-26 00:51:52.102317');
INSERT INTO `user_usericon` VALUES (3, 'http://www.baidu.com', '2019-03-26 00:52:04.898884');

SET FOREIGN_KEY_CHECKS = 1;

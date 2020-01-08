/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2020-01-08 13:33:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) NOT NULL DEFAULT '山东省青岛市青岛大学hongyuan',
  `phone` varchar(64) NOT NULL DEFAULT '1886886868',
  `zip` varchar(64) DEFAULT '000000',
  `uid` int(11) NOT NULL DEFAULT '1',
  `create_time` timestamp NULL DEFAULT NULL,
  `uodate_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `remark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('3', '山东省青岛市青岛大学', '15681183558', '000000', '3', '2019-12-24 14:34:39', '2019-12-24 14:34:39', null, null, '小明', null);

-- ----------------------------
-- Table structure for `business`
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '上海农家菜' COMMENT '商家名称',
  `area` varchar(64) NOT NULL DEFAULT 'shanghai' COMMENT '商家定位',
  `address` varchar(255) NOT NULL DEFAULT '北京安丘建安路青云花园西门对面' COMMENT '详细地址',
  `image` varchar(255) NOT NULL DEFAULT '/static/images/s4.jpg' COMMENT '商家图片地址',
  `num` int(11) DEFAULT '20' COMMENT '销量',
  `introduce` varchar(2000) NOT NULL DEFAULT '我们用心做每一道菜！！！' COMMENT '详细介绍',
  `phone` varchar(64) DEFAULT '18868866886' COMMENT '电话',
  `open_time` varchar(64) DEFAULT '24小时' COMMENT '营业时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(555) NOT NULL COMMENT '商品名称',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `image` varchar(555) NOT NULL COMMENT '图片地址',
  `price` double NOT NULL COMMENT '单价',
  `num` int(11) NOT NULL COMMENT '数量',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `bid` int(11) NOT NULL DEFAULT '0' COMMENT '商户ID',
  `pid` int(11) NOT NULL COMMENT '产品ID',
  `sale_state` int(11) NOT NULL DEFAULT '0' COMMENT '0 为下单 1 以下单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('3', '华为手机', '2020-01-06 22:39:09', '/images/huaweisj.jpg', '6499', '1', '2', '0', '6', '0');
INSERT INTO `cart` VALUES ('4', '苹果笔记本', '2020-01-08 12:50:11', '/images/20200106230203.jpg', '6999', '1', '3', '0', '14', '0');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `orderBy` int(11) NOT NULL COMMENT '目录级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '', '笔记本', '0');
INSERT INTO `category` VALUES ('2', '1', '', '苹果', '0');
INSERT INTO `category` VALUES ('3', '1', '', '小米', '0');
INSERT INTO `category` VALUES ('5', '1', '', '华为', '0');
INSERT INTO `category` VALUES ('6', '0', '', '手机', '0');
INSERT INTO `category` VALUES ('7', '6', '', '苹果', '0');
INSERT INTO `category` VALUES ('8', '6', '', '小米', '0');
INSERT INTO `category` VALUES ('9', '6', '', '华为', '0');

-- ----------------------------
-- Table structure for `evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '2' COMMENT '评价人',
  `bid` int(11) DEFAULT '1' COMMENT '被评价商家',
  `time` timestamp NOT NULL DEFAULT '2018-03-18 19:52:02' ON UPDATE CURRENT_TIMESTAMP COMMENT '评价时间',
  `type` double DEFAULT '3' COMMENT '评价类型（分数）',
  `content` varchar(2000) NOT NULL DEFAULT '我是来蹭积分的！我是来蹭积分的！我是来蹭积分的！我是来蹭积分的！我是来蹭积分的！我是来蹭积分的！我是来蹭积分的！我是来蹭积分的！' COMMENT '内容',
  `pid` int(11) NOT NULL DEFAULT '4' COMMENT '被评价商品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '3', '0', '2020-01-06 16:19:37', null, '宝贝24小时内收到，顺风超暖心。包装完美，全新正品。超喜欢。', '5');
INSERT INTO `evaluate` VALUES ('2', '3', '0', '2020-01-06 16:20:01', null, '物流很快，包装特别结实，抢券买的，价格实惠，国行正版，好评！', '6');
INSERT INTO `evaluate` VALUES ('3', '3', '0', '2020-01-07 10:03:33', null, '很好！！！', '14');

-- ----------------------------
-- Table structure for `hot_product`
-- ----------------------------
DROP TABLE IF EXISTS `hot_product`;
CREATE TABLE `hot_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '红烧肉盖饭' COMMENT '姓名',
  `image` varchar(255) NOT NULL DEFAULT '/static/images/g1.jpg' COMMENT '产品地址',
  `price` double NOT NULL DEFAULT '19.9' COMMENT '价格',
  `bid` int(11) NOT NULL DEFAULT '10' COMMENT '归属商家',
  `label` varchar(64) NOT NULL DEFAULT '盖饭' COMMENT '标签',
  `num` int(11) NOT NULL DEFAULT '20' COMMENT '销量',
  `introduce` varchar(2000) NOT NULL DEFAULT '主要材料是用煮好的米饭、一些菜肴、鸡蛋爆炒而成。' COMMENT '介绍',
  `category` varchar(64) NOT NULL COMMENT '类别',
  `categorys` varchar(64) NOT NULL COMMENT '父类别',
  `createTime` timestamp NOT NULL DEFAULT '2018-03-20 12:46:23' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot_product
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '个人资料', '<li class=\"per-li2\"><a href=\"/user/info\">个人资料<span>></span></a><');
INSERT INTO `menu` VALUES ('2', '购物车', '<li class=\"per-li5\"><a href=\"#\">购物车<span>></span></a></li>');
INSERT INTO `menu` VALUES ('3', '添加商品', '<li class=\"per-li6\"><a href=\"#\">添加商品<span>></span></a></li>');
INSERT INTO `menu` VALUES ('4', '我的订单', '<li class=\"current-li per-li3\"><a href=\"#\">我的订单<span>></span></a');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL COMMENT '下单人',
  `total` double NOT NULL COMMENT '总价',
  `address` varchar(255) DEFAULT NULL COMMENT '售货地址',
  `ship_status` int(11) DEFAULT '0' COMMENT '0 未发货 1 已发货',
  `pay_status` int(11) DEFAULT '0' COMMENT '付款状态',
  `aid` int(11) DEFAULT '0',
  `eva_status` int(11) DEFAULT '0' COMMENT '评价',
  `receive_status` int(11) DEFAULT '0' COMMENT '收货',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('160122900', '2020-01-06 23:22:09', '3', '6999', null, '1', '1', '3', '0', '1');
INSERT INTO `orders` VALUES ('270117716', '2020-01-06 16:17:58', '3', '11998', null, '1', '1', '3', '0', '1');
INSERT INTO `orders` VALUES ('39013488', '2020-01-06 14:34:48', '22', '4999', null, '1', '1', '90', '0', '0');
INSERT INTO `orders` VALUES ('980150902', '2020-01-08 12:50:15', '3', '6999', null, '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `order_product`
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL COMMENT '订单ID',
  `name` varchar(64) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `pimage` varchar(64) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `eva_status` int(11) DEFAULT '0' COMMENT '0 未评价 1 已评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('457', '76013290', '华为笔记本', '4999', '273', '/images/20200106131918.jpg', '1', '0');
INSERT INTO `order_product` VALUES ('458', '93013372', '华为笔记本', '4999', '273', '/images/20200106131918.jpg', '1', '0');
INSERT INTO `order_product` VALUES ('459', '39013488', '华为笔记本', '4999', '273', '/images/20200106131918.jpg', '1', '0');
INSERT INTO `order_product` VALUES ('460', '270117716', '苹果手机', '5499', '5', '/images/20200106153156.jpg', '1', '0');
INSERT INTO `order_product` VALUES ('461', '270117716', '华为手机', '6499', '6', '/images/20200106153250.jpg', '1', '0');
INSERT INTO `order_product` VALUES ('462', '160122900', '苹果笔记本', '6999', '14', '/images/20200106230203.jpg', '1', '0');
INSERT INTO `order_product` VALUES ('463', '980150902', '苹果笔记本', '6999', '14', '/images/20200106230203.jpg', '1', '0');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '商品名字' COMMENT '商品名字',
  `image` varchar(255) DEFAULT '/static/images/g1.jpg' COMMENT '产品图片',
  `price` double NOT NULL DEFAULT '19.9' COMMENT '价格',
  `bid` int(11) NOT NULL DEFAULT '10' COMMENT '归属商家',
  `label` varchar(64) NOT NULL DEFAULT '0' COMMENT '标签',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `introduce` varchar(2000) NOT NULL DEFAULT '介绍' COMMENT '介绍',
  `category` varchar(64) NOT NULL DEFAULT '0' COMMENT '类别',
  `categorys` varchar(64) NOT NULL DEFAULT '0' COMMENT '父类别',
  `createTime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('13', '华为笔记本', '/images/20200106230138.jpg', '4999', '10', '1', '0', '强劲性能 卓越流畅', '5', '0', '2020-01-06 23:01:39');
INSERT INTO `product` VALUES ('14', '苹果笔记本', '/images/20200106230203.jpg', '6999', '10', '1', '0', 'i9处理器16G内存1TB轻薄笔记本电脑学生商务通用', '2', '0', '2020-01-06 23:02:04');
INSERT INTO `product` VALUES ('15', '小米笔记本', '/images/20200106230225.jpg', '3999', '10', '1', '0', '金属机身 指纹解锁', '3', '0', '2020-01-06 23:02:26');
INSERT INTO `product` VALUES ('16', '华为手机', '/images/20200106230257.jpg', '4999', '10', '0', '0', 'Mate30 5G', '9', '0', '2020-01-06 23:02:58');
INSERT INTO `product` VALUES ('17', '小米笔记本', '/images/20200106230323.jpg', '2999', '10', '0', '0', '小米CC9/1亿像素手机/五摄四闪/双光学防抖', '8', '0', '2020-01-06 23:03:24');
INSERT INTO `product` VALUES ('18', '苹果手机', '/images/20200106230351.jpg', '7999', '10', '0', '0', 'iPhone11', '7', '0', '2020-01-06 23:03:51');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `role` varchar(32) DEFAULT 's' COMMENT 'admin guest',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(64) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '管理员', 'a', null, '15681183558', null);
INSERT INTO `user` VALUES ('2', 'sj', 'admin', '商家', 'b', '', '15681183558', null);
INSERT INTO `user` VALUES ('3', 'xiaoming', '123456', '小明', 's', null, '15681183558', null);

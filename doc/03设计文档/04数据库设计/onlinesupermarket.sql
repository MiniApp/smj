/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : onlinesupermarket

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2013-12-06 21:17:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `affiche`
-- ----------------------------
DROP TABLE IF EXISTS `affiche`;
CREATE TABLE `affiche` (
  `affi_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  `bclass` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `enter_id` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`affi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商铺公告表';

-- ----------------------------
-- Records of affiche
-- ----------------------------
INSERT INTO `affiche` VALUES ('0', '公告1', null, '2013-09-16 10:18:42', '1', '测试发布公告!!!!');
INSERT INTO `affiche` VALUES ('2', '公告2', null, '2013-09-16 11:13:25', '1', '测试发布公告');
INSERT INTO `affiche` VALUES ('4', '公告3', null, '2013-09-16 14:22:54', '1', '测试');
INSERT INTO `affiche` VALUES ('5', '测试公告65', null, '2013-09-22 17:26:51', '1', '测试公告');

-- ----------------------------
-- Table structure for `appriase`
-- ----------------------------
DROP TABLE IF EXISTS `appriase`;
CREATE TABLE `appriase` (
  `appri_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `appri_content` varchar(200) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `integrity` int(11) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `is_validate` varchar(5) DEFAULT NULL,
  `is_ask` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`appri_id`),
  KEY `Index_1` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺评价信息表';

-- ----------------------------
-- Records of appriase
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_detail`
-- ----------------------------
DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE `bill_detail` (
  `bill_date` date DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `commd_id` int(11) DEFAULT NULL,
  `commd_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`store_id`,`bill_id`),
  KEY `Idx_billid` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of bill_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `bill_info`
-- ----------------------------
DROP TABLE IF EXISTS `bill_info`;
CREATE TABLE `bill_info` (
  `bill_id` varchar(50) NOT NULL,
  `bill_date` datetime DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `bill_type` int(11) DEFAULT NULL,
  `cust_name` varchar(50) DEFAULT NULL,
  `cust_tel` varchar(30) DEFAULT NULL,
  `cust_addr` varchar(50) DEFAULT NULL,
  `accu` int(11) DEFAULT NULL,
  `is_invoice` varchar(5) DEFAULT NULL,
  `is_vintegral` varchar(5) DEFAULT NULL,
  `amt` double(8,2) DEFAULT NULL,
  `bill_state` varchar(5) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `reject_flg` varchar(5) DEFAULT NULL,
  `reject_cause` varchar(100) DEFAULT NULL,
  `reject_time` datetime DEFAULT NULL,
  `deliver_fee` double(8,2) DEFAULT NULL,
  `bill_appr` varchar(200) DEFAULT NULL,
  `user_appr` varchar(20) DEFAULT NULL,
  `appr_time` datetime DEFAULT NULL,
  `deliver_time` datetime DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `Index_1` (`bill_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
-- Records of bill_info
-- ----------------------------

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` varchar(50) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('3', '1,111', 'Nestle/雀巢', null);
INSERT INTO `brand` VALUES ('4', '1,112,113', '蒙牛', '1');
INSERT INTO `brand` VALUES ('5', '1,112,113', '光明', '1');
INSERT INTO `brand` VALUES ('6', '1,112,113', '统一', null);
INSERT INTO `brand` VALUES ('7', '1,112,113', '上好佳', '1');
INSERT INTO `brand` VALUES ('8', '1,112,113', '乐事', '1');
INSERT INTO `brand` VALUES ('9', '1,112,113', '汇源', null);
INSERT INTO `brand` VALUES ('10', '1,112,113', 'Evian/依云', null);
INSERT INTO `brand` VALUES ('11', '1,112,113', '伊利', '1');
INSERT INTO `brand` VALUES ('12', '1,112,113', '张裕', null);
INSERT INTO `brand` VALUES ('13', '1,112,113', '长城', null);
INSERT INTO `brand` VALUES ('14', '1', '娃哈哈', '1');

-- ----------------------------
-- Table structure for `cateory`
-- ----------------------------
DROP TABLE IF EXISTS `cateory`;
CREATE TABLE `cateory` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`cate_id`),
  KEY `Index_1` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100102 DEFAULT CHARSET=utf8 COMMENT='商品类别表';

-- ----------------------------
-- Records of cateory
-- ----------------------------
INSERT INTO `cateory` VALUES ('100000', '食品饮料、酒水', '0', '1', '1');
INSERT INTO `cateory` VALUES ('100001', '饮料饮品', '1', '111', '1');
INSERT INTO `cateory` VALUES ('100002', '水', '111', '1111', '1');
INSERT INTO `cateory` VALUES ('100003', '果汁', '111', '1112', '1');
INSERT INTO `cateory` VALUES ('100004', '茶饮料', '111', '1113', '1');
INSERT INTO `cateory` VALUES ('100005', '咖啡饮料', '111', '1114', '1');
INSERT INTO `cateory` VALUES ('100006', '碳酸饮料', '111', '1115', '1');
INSERT INTO `cateory` VALUES ('100007', '功能饮料', '111', '1116', '1');
INSERT INTO `cateory` VALUES ('100008', '乳品', '111', '1117', '1');
INSERT INTO `cateory` VALUES ('100009', '牛奶乳品', '1', '112', '1');
INSERT INTO `cateory` VALUES ('100010', '纯牛奶', '112', '1121', '1');
INSERT INTO `cateory` VALUES ('100011', '儿童奶', '112', '1122', '1');
INSERT INTO `cateory` VALUES ('100012', '酸奶', '112', '1123', '1');
INSERT INTO `cateory` VALUES ('100013', '豆奶', '112', '1124', '1');
INSERT INTO `cateory` VALUES ('100014', '风味奶', '112', '1125', '1');
INSERT INTO `cateory` VALUES ('100015', '休闲零食', '1', '113', '1');
INSERT INTO `cateory` VALUES ('100016', '枣类', '113', '1131', '1');
INSERT INTO `cateory` VALUES ('100017', '坚果', '113', '1132', '1');
INSERT INTO `cateory` VALUES ('100018', '薯片', '113', '1133', '1');
INSERT INTO `cateory` VALUES ('100019', '蜜饯', '113', '1134', '1');
INSERT INTO `cateory` VALUES ('100020', '禽类', '113', '1135', '1');
INSERT INTO `cateory` VALUES ('100021', '肉干|肉松', '113', '1136', '1');
INSERT INTO `cateory` VALUES ('100022', '膨化', '113', '1137', '1');
INSERT INTO `cateory` VALUES ('100023', '小食', '113', '1138', '1');
INSERT INTO `cateory` VALUES ('100024', '果冻', '113', '1139', '1');
INSERT INTO `cateory` VALUES ('100025', '海苔', '113', '11310', '1');
INSERT INTO `cateory` VALUES ('100026', '鱼干', '113', '11311', '1');
INSERT INTO `cateory` VALUES ('100027', '饼干|糕点', '1', '114', '1');
INSERT INTO `cateory` VALUES ('100028', '蛋糕|派', '114', '1141', '1');
INSERT INTO `cateory` VALUES ('100029', '威化', '114', '1142', '1');
INSERT INTO `cateory` VALUES ('100030', '饼干', '114', '1143', '1');
INSERT INTO `cateory` VALUES ('100031', '曲奇', '114', '1144', '1');
INSERT INTO `cateory` VALUES ('100032', '传统糕饼', '114', '1145', '1');
INSERT INTO `cateory` VALUES ('100033', '蛋卷', '114', '1146', '1');
INSERT INTO `cateory` VALUES ('100034', '面包|面包干', '114', '1147', '1');
INSERT INTO `cateory` VALUES ('100035', '粮油', '1', '115', '1');
INSERT INTO `cateory` VALUES ('100036', '食用油', '115', '1151', '1');
INSERT INTO `cateory` VALUES ('100037', '大米', '115', '1152', '1');
INSERT INTO `cateory` VALUES ('100038', '精品粮油', '115', '1153', '1');
INSERT INTO `cateory` VALUES ('100039', '杂粮', '115', '1154', '1');
INSERT INTO `cateory` VALUES ('100040', '粉丝', '115', '1155', '1');
INSERT INTO `cateory` VALUES ('100041', '挂面', '115', '1156', '1');
INSERT INTO `cateory` VALUES ('100042', '面粉', '115', '1157', '1');
INSERT INTO `cateory` VALUES ('100043', '酒类', '1', '116', '1');
INSERT INTO `cateory` VALUES ('100044', '白酒', '116', '1161', '1');
INSERT INTO `cateory` VALUES ('100045', '啤酒', '116', '1162', '1');
INSERT INTO `cateory` VALUES ('100046', '黄酒', '116', '1163', '1');
INSERT INTO `cateory` VALUES ('100047', '葡萄酒', '116', '1164', '1');
INSERT INTO `cateory` VALUES ('100048', '滋补酒', '116', '1165', '1');
INSERT INTO `cateory` VALUES ('100049', '冲饮谷物', '1', '117', '1');
INSERT INTO `cateory` VALUES ('100050', '蜂蜜', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100051', '麦片谷物', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100052', '奶粉', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100053', '柚子茶', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100054', '果味冲饮', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100055', '豆奶粉', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100056', '芝麻糊', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100057', '奶茶', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100058', '蜂蜜', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100059', '其他冲调饮品', '117', '1171', '1');
INSERT INTO `cateory` VALUES ('100060', '咖啡/茶叶', '1', '118', '1');
INSERT INTO `cateory` VALUES ('100061', '速溶咖啡', '118', '1181', '1');
INSERT INTO `cateory` VALUES ('100062', '咖啡豆粉', '118', '1182', '1');
INSERT INTO `cateory` VALUES ('100063', '咖啡伴侣', '118', '1183', '1');
INSERT INTO `cateory` VALUES ('100064', '袋泡茶', '118', '1184', '1');
INSERT INTO `cateory` VALUES ('100065', '乌龙茶', '118', '1185', '1');
INSERT INTO `cateory` VALUES ('100066', '花草茶', '118', '1186', '1');
INSERT INTO `cateory` VALUES ('100067', '绿茶', '118', '1187', '1');
INSERT INTO `cateory` VALUES ('100068', '普洱茶', '118', '1188', '1');
INSERT INTO `cateory` VALUES ('100069', '红茶', '118', '1189', '1');
INSERT INTO `cateory` VALUES ('100070', '糖果/巧克力', '1', '119', '1');
INSERT INTO `cateory` VALUES ('100071', '巧克力', '119', '1191', '1');
INSERT INTO `cateory` VALUES ('100072', '奶糖', '119', '1192', '1');
INSERT INTO `cateory` VALUES ('100073', '软糖', '119', '1193', '1');
INSERT INTO `cateory` VALUES ('100074', '硬糖', '119', '1194', '1');
INSERT INTO `cateory` VALUES ('100075', '口香糖', '119', '1195', '1');
INSERT INTO `cateory` VALUES ('100076', '棒棒糖', '119', '1196', '1');
INSERT INTO `cateory` VALUES ('100077', '润喉糖', '118', '1197', '1');
INSERT INTO `cateory` VALUES ('100078', '方便速食', '1', '1110', '1');
INSERT INTO `cateory` VALUES ('100079', '方便面', '1110', '11101', '1');
INSERT INTO `cateory` VALUES ('100080', '速食品', '1110', '11101', '1');
INSERT INTO `cateory` VALUES ('100081', '火腿肠', '11101', '111011', '1');
INSERT INTO `cateory` VALUES ('100082', '方便饭', '11101', '111011', '1');
INSERT INTO `cateory` VALUES ('100083', '方便粉丝', '11101', '111011', '1');
INSERT INTO `cateory` VALUES ('100084', '罐头', '1110', '11102', '1');
INSERT INTO `cateory` VALUES ('100085', '肉罐头', '11102', '111021', '1');
INSERT INTO `cateory` VALUES ('100086', '水产罐头', '11102', '111022', '1');
INSERT INTO `cateory` VALUES ('100087', '蔬菜罐头', '11102', '111023', '1');
INSERT INTO `cateory` VALUES ('100088', '水果罐头', '11102', '111024', '1');
INSERT INTO `cateory` VALUES ('100089', '厨房调料', '1', '1112', '1');
INSERT INTO `cateory` VALUES ('100090', '火锅料', '1112', '11121', '1');
INSERT INTO `cateory` VALUES ('100091', '调味料', '1112', '11122', '1');
INSERT INTO `cateory` VALUES ('100092', '调味酱', '1112', '11122', '1');
INSERT INTO `cateory` VALUES ('100093', '酱油', '1112', '11123', '1');
INSERT INTO `cateory` VALUES ('100094', '盐', '1112', '11124', '1');
INSERT INTO `cateory` VALUES ('100095', '糖', '1112', '11125', '1');
INSERT INTO `cateory` VALUES ('100096', '醋', '1112', '11126', '1');
INSERT INTO `cateory` VALUES ('100097', '蛋制品', '1112', '11127', '1');
INSERT INTO `cateory` VALUES ('100098', '汤料', '1112', '11128', '1');
INSERT INTO `cateory` VALUES ('100099', '地方特产', '1', '1113', '1');
INSERT INTO `cateory` VALUES ('100100', '西南', '1113', '11131', '1');
INSERT INTO `cateory` VALUES ('100101', 'ROOT', '-1', '0', '1');

-- ----------------------------
-- Table structure for `commd_appr`
-- ----------------------------
DROP TABLE IF EXISTS `commd_appr`;
CREATE TABLE `commd_appr` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `commd_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `taste` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `idx_commd` (`commd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品评价表';

-- ----------------------------
-- Records of commd_appr
-- ----------------------------
INSERT INTO `commd_appr` VALUES ('1', '408473333', '1', '5', '1', '产品很好,非常喜欢', '2013-11-13 16:21:41');

-- ----------------------------
-- Table structure for `commd_sale_total`
-- ----------------------------
DROP TABLE IF EXISTS `commd_sale_total`;
CREATE TABLE `commd_sale_total` (
  `store_id` int(11) NOT NULL,
  `commd_id` int(11) DEFAULT NULL,
  `commd_sale_num` int(11) DEFAULT NULL,
  `commd_sale_amt` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品销售统计表';

-- ----------------------------
-- Records of commd_sale_total
-- ----------------------------

-- ----------------------------
-- Table structure for `comm_archives`
-- ----------------------------
DROP TABLE IF EXISTS `comm_archives`;
CREATE TABLE `comm_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commd_id` int(11) DEFAULT NULL,
  `commd_name` varchar(50) DEFAULT NULL,
  `new_dimension` varchar(19) DEFAULT NULL,
  `old_dimension` varchar(19) DEFAULT NULL,
  `smallImg` varchar(50) DEFAULT NULL,
  `mediumImg` varchar(50) DEFAULT NULL,
  `largeImg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_archives
-- ----------------------------
INSERT INTO `comm_archives` VALUES ('1', '408470547', '', '6924084705475', '6924084705475', '1.jpg', '1m.jpg', '1b.jpg');
INSERT INTO `comm_archives` VALUES ('2', '408470547', '', '6924084705475', '6924084705475', '2.jpg', '2m.jpg', '2b.jpg');
INSERT INTO `comm_archives` VALUES ('3', '408470547', null, '6924084705475', '6924084705475', '3.jpg', '3m.jpg', '3b.jpg');

-- ----------------------------
-- Table structure for `comm_info`
-- ----------------------------
DROP TABLE IF EXISTS `comm_info`;
CREATE TABLE `comm_info` (
  `commd_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `commd_name` varchar(50) DEFAULT NULL,
  `commd_fullname` varchar(100) DEFAULT NULL,
  `commd_logo` varchar(50) DEFAULT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `img3` varchar(100) DEFAULT NULL,
  `one_dimension` varchar(19) DEFAULT NULL,
  `two_dimension` varchar(19) DEFAULT NULL,
  `styleId` varchar(20) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `commd_weight` varchar(10) DEFAULT NULL,
  `prodstatcode` varchar(50) DEFAULT NULL,
  `commd_license` varchar(18) DEFAULT NULL,
  `manufactenterpric` varchar(50) DEFAULT NULL,
  `commd_crea_date` varchar(10) DEFAULT NULL,
  `commd_produce_place` varchar(5) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `netcontent` varchar(50) DEFAULT NULL,
  `commd_size` varchar(200) DEFAULT NULL,
  `commd_description` varchar(200) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `agora_price` double(8,2) DEFAULT NULL,
  `user_price` double(8,2) DEFAULT NULL,
  `sale_price` float(8,2) DEFAULT NULL,
  `prom_price` float(8,2) DEFAULT NULL,
  `taste` varchar(20) DEFAULT NULL,
  `equip` varchar(20) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `mix_num` int(11) DEFAULT NULL,
  `have_num` int(11) DEFAULT NULL,
  `qualified` varchar(5) DEFAULT NULL,
  `uses` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `memo` int(11) DEFAULT NULL,
  `remark1` varchar(200) DEFAULT NULL,
  `remark2` varchar(200) DEFAULT NULL,
  `remark3` varchar(200) DEFAULT NULL,
  `remark4` varchar(200) DEFAULT NULL,
  `remark5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`commd_id`,`store_id`),
  KEY `Idx_commd` (`commd_id`),
  KEY `Idx_dimension` (`one_dimension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of comm_info
-- ----------------------------
INSERT INTO `comm_info` VALUES ('40847333', '1', '茅台镇老坛', null, 'lt_s1.jpg', null, null, null, '6924084733333', null, null, '1', null, '1', null, null, null, null, null, null, null, null, null, null, null, '10.00', '10.00', '10.00', '10.00', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `comm_info` VALUES ('408370593', '1', '茅台镇镇酒酱香型125ml53度', null, '125ml_s1.jpg', null, null, null, '6924083705932', null, null, '2', null, '1', null, null, null, null, null, null, null, null, null, null, null, '10.00', '10.00', '10.00', '10.00', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `comm_info` VALUES ('408370753', '1', '茅台镇镇酒酱香型108ml53度', null, '108ml_s1.jpg', null, null, null, '6924083707533', null, null, '3', null, '1', null, null, null, null, null, null, null, null, null, null, null, '10.00', '10.00', '10.00', '10.00', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `comm_info` VALUES ('408470547', '1', '茅台镇镇酒酱香型100ml53度', null, '100ml_s1.jpg', '100ml 1.jpg', '100ml 2.jpg', '', '6924084705475', null, null, '4', null, '1', null, null, null, null, null, null, null, null, null, null, null, '10.00', '10.00', '10.00', '10.00', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);
INSERT INTO `comm_info` VALUES ('408473333', '1', '茅台镇老坛', null, 'lt_s1.jpg', null, null, null, '6924084733333', null, null, '5', null, '1', null, null, null, null, null, null, null, null, null, null, null, '10.00', '10.00', '10.00', '10.00', null, null, null, null, null, null, '1', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `cust_info`
-- ----------------------------
DROP TABLE IF EXISTS `cust_info`;
CREATE TABLE `cust_info` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `is_cert` varchar(5) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `accu` int(11) DEFAULT NULL,
  `is_validate` int(11) DEFAULT NULL,
  `user_rank` int(11) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `radom_str1` varchar(20) DEFAULT NULL,
  `radom_str2` varchar(20) DEFAULT NULL,
  `user_state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `Idx_userid` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户信息表\r\n';

-- ----------------------------
-- Records of cust_info
-- ----------------------------
INSERT INTO `cust_info` VALUES ('1', 'cwl', '94596583', null, '1588247832', '', 'cwl@qq.com', '', 'a5f4cbaa48cebeb42a1dc4556fa94426', '0', null, '100', '2013-09-23 15:19:29', 'px4N', '1235', 'Y');
INSERT INTO `cust_info` VALUES ('2', 'cwl', '9999999', null, '28538493432', '', 'cwl@qq.com', '', 'fd36891f9e912d57c5500555b0560576', '0', null, '100', '2013-09-23 15:21:20', 'bzmB', '7778', 'Y');
INSERT INTO `cust_info` VALUES ('3', 'cwl', '777777', null, '14890530453', '', 'cwl@qq.com', '', 'db7e3547526501d112fbebc4796b6182', '0', null, '100', '2013-09-23 15:23:44', 'z9RI', '8820', 'Y');
INSERT INTO `cust_info` VALUES ('4', 'cwl', '94548394', null, '15894389342', '', 'cwl@qq.com', '', 'bf90802034472078c41678cb56c9e635', '0', null, '100', '2013-09-23 15:25:24', 'DzTe', '7051', 'Y');
INSERT INTO `cust_info` VALUES ('5', 'cwl', '94548394', null, '15894389342', '', 'cwl@qq.com', '', '0348e8a62c1b751b1042e9f6a5744c46', '0', null, '100', '2013-09-23 15:28:37', 'BgHQ', '2807', 'Y');
INSERT INTO `cust_info` VALUES ('6', 'cwl', '11111111', null, '15882477832', '', 'cwl@qq.com', '', 'c2dbf8b0868f326ba72c15615a950756', '0', null, '100', '2013-09-23 15:29:13', 'sGgT', '6905', 'Y');
INSERT INTO `cust_info` VALUES ('7', 'cwl', '222222', null, '15479322', '', 'cwl@qq.com', '', '7d2c33703db45118a45d64a1fbabdec5', '0', null, '100', '2013-09-23 15:31:59', 'cpMK', '1710', 'Y');
INSERT INTO `cust_info` VALUES ('8', 'cwl', '222222', null, '15479322', '', 'cwl@qq.com', '', '222c1e184ceb1f8638a3a3e6e168c561', '0', null, '100', '2013-09-23 15:33:35', 'nbW4', '0740', 'Y');
INSERT INTO `cust_info` VALUES ('9', 'cwl', '222222', null, '15479322', '', 'cwl@qq.com', '', '635c29274aa1eb15bc76339212d258d9', '0', null, '100', '2013-09-23 15:34:00', 'iUxL', '3075', 'Y');
INSERT INTO `cust_info` VALUES ('10', 'cwl', '222222', null, '15479322', '', 'cwl@qq.com', '', '1e7c85839b352252708ff1d1dd6d145c', '0', null, '100', '2013-09-23 15:34:19', 'z0oa', '0860', 'Y');
INSERT INTO `cust_info` VALUES ('11', 'cwl', '222222', null, '15479322', '', 'cwl@qq.com', '', '281819580b202b5f95e0d771c1a45c2d', '0', null, '100', '2013-09-23 15:35:00', 'aBul', '7511', 'Y');
INSERT INTO `cust_info` VALUES ('12', '陈文磊', '94596538', null, '15823905822', '1', 'chengwenleiyxy@163.com', '123', '747ba11e2976147756bd2da8071709cd', '0', '1', '100', '2013-09-23 23:22:35', 'tV05', '5566', 'Y');

-- ----------------------------
-- Table structure for `enter_info`
-- ----------------------------
DROP TABLE IF EXISTS `enter_info`;
CREATE TABLE `enter_info` (
  `enter_id` int(11) NOT NULL AUTO_INCREMENT,
  `enter_name` varchar(80) DEFAULT NULL,
  `legal_repr_id` varchar(32) DEFAULT NULL,
  `legal_repr_name` varchar(50) DEFAULT NULL,
  `cert_type` varchar(10) DEFAULT NULL,
  `cert_id` varchar(32) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `enter_addr` varchar(100) DEFAULT NULL,
  `respb_person` varchar(50) DEFAULT NULL,
  `tel_no` varchar(30) DEFAULT NULL,
  `enter_state` int(11) DEFAULT NULL,
  `enter_buss_licen` varchar(15) DEFAULT NULL,
  `enter_buss_licen_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enter_id`),
  KEY `Index_1` (`enter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商户信息表\r\n';

-- ----------------------------
-- Records of enter_info
-- ----------------------------
INSERT INTO `enter_info` VALUES ('1', '超市1', null, 'cwl', 'Y', '1111111111', '2013-09-03 21:58:00', '建设北路1段11号', 'cwl1', '1599289342', '1', null, null);
INSERT INTO `enter_info` VALUES ('2', '塔塔1', 'A123456', '陈文磊', '身份证', '510823198008071234', '2013-09-09 11:11:51', '', '陈文磊', '02812345678', '0', '', '');
INSERT INTO `enter_info` VALUES ('3', '舞东风', null, '再三', 'Y', 'A12345678', '2013-09-09 19:04:06', '青羊区18号', '张三', '02801234567', '1', null, null);

-- ----------------------------
-- Table structure for `e_admininfo`
-- ----------------------------
DROP TABLE IF EXISTS `e_admininfo`;
CREATE TABLE `e_admininfo` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(40) DEFAULT NULL,
  `admin_type` int(11) DEFAULT NULL,
  `admin_state` varchar(5) DEFAULT NULL,
  `error_count` int(11) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `Index_1` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商铺管理员信息表';

-- ----------------------------
-- Records of e_admininfo
-- ----------------------------
INSERT INTO `e_admininfo` VALUES ('1', '1', 'chenwenlei', '/C/TruFwSfMNWBXf+yzodA==\r\n', '1', 'S', null, '2013-09-03 21:58:31');
INSERT INTO `e_admininfo` VALUES ('2', '0', 'admin_smj', '4669de6320b932ed9724207537f02481', '1', 'X', null, null);
INSERT INTO `e_admininfo` VALUES ('3', '3', 'zzz', '/C/TruFwSfP524NcVqF8Hg==', '1', 'S', null, '2013-09-09 19:04:06');

-- ----------------------------
-- Table structure for `leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `leav_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `cust_name` varchar(50) DEFAULT NULL,
  `leav_content` longtext,
  `leav_time` datetime DEFAULT NULL,
  `ans_content` longtext,
  `ans_time` datetime DEFAULT NULL,
  `ans_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`leav_id`),
  KEY `Index_1` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='留言信息表';

-- ----------------------------
-- Records of leaveword
-- ----------------------------
INSERT INTO `leaveword` VALUES ('1', '0', '12', '94596538', 'testtestestset', '2013-11-07 15:17:21', 'cccccccccccccccccccccccccccccccccc', '2013-11-08 11:06:00', '0');
INSERT INTO `leaveword` VALUES ('2', '0', '12', '陈文磊', 'testtestestset', '2013-11-07 15:19:50', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2013-11-08 11:05:37', '0');
INSERT INTO `leaveword` VALUES ('3', '0', '12', '陈文磊', 'testtestestset', '2013-11-07 15:23:31', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2013-11-08 11:04:06', '0');
INSERT INTO `leaveword` VALUES ('4', '0', '12', '陈文磊', '初次测试功能是否陈公', '2013-11-07 16:39:22', null, null, null);

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` varchar(60) DEFAULT NULL,
  `parent_id` varchar(54) DEFAULT NULL,
  `child_num` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103518 DEFAULT CHARSET=utf8 COMMENT='区域信息表';

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('100000', '0002', '0001', '1', '北京', '1');
INSERT INTO `region` VALUES ('100001', '0003', '0001', '2', '天津', '1');
INSERT INTO `region` VALUES ('100002', '0004', '0001', '3', '河北', '1');
INSERT INTO `region` VALUES ('100003', '0005', '0001', '4', '山西', '1');
INSERT INTO `region` VALUES ('100004', '0006', '0001', '5', '内蒙古', '1');
INSERT INTO `region` VALUES ('100005', '0007', '0001', '6', '辽宁', '1');
INSERT INTO `region` VALUES ('100006', '0008', '0001', '7', '吉林', '1');
INSERT INTO `region` VALUES ('100007', '0009', '0001', '8', '黑龙江', '1');
INSERT INTO `region` VALUES ('100008', '0010', '0001', '9', '上海', '1');
INSERT INTO `region` VALUES ('100009', '0011', '0001', '10', '江苏', '1');
INSERT INTO `region` VALUES ('100010', '0012', '0001', '11', '浙江', '1');
INSERT INTO `region` VALUES ('100011', '0013', '0001', '12', '安徽', '1');
INSERT INTO `region` VALUES ('100012', '0014', '0001', '13', '福建', '1');
INSERT INTO `region` VALUES ('100013', '0015', '0001', '14', '江西', '1');
INSERT INTO `region` VALUES ('100014', '0016', '0001', '15', '山东', '1');
INSERT INTO `region` VALUES ('100015', '0017', '0001', '16', '河南', '1');
INSERT INTO `region` VALUES ('100016', '0018', '0001', '17', '湖北', '1');
INSERT INTO `region` VALUES ('100017', '0019', '0001', '18', '湖南', '1');
INSERT INTO `region` VALUES ('100018', '0020', '0001', '19', '广东', '1');
INSERT INTO `region` VALUES ('100019', '0021', '0001', '20', '广西', '1');
INSERT INTO `region` VALUES ('100020', '0022', '0001', '21', '海南', '1');
INSERT INTO `region` VALUES ('100021', '0023', '0001', '22', '重庆', '1');
INSERT INTO `region` VALUES ('100022', '0024', '0001', '23', '四川', '1');
INSERT INTO `region` VALUES ('100023', '0025', '0001', '24', '贵州', '1');
INSERT INTO `region` VALUES ('100024', '0026', '0001', '25', '云南', '1');
INSERT INTO `region` VALUES ('100025', '0027', '0001', '26', '西藏', '1');
INSERT INTO `region` VALUES ('100026', '0028', '0001', '27', '陕西', '1');
INSERT INTO `region` VALUES ('100027', '0029', '0001', '28', '甘肃', '1');
INSERT INTO `region` VALUES ('100028', '0030', '0001', '29', '青海', '1');
INSERT INTO `region` VALUES ('100029', '0031', '0001', '30', '宁夏', '1');
INSERT INTO `region` VALUES ('100030', '0032', '0001', '31', '新疆', '1');
INSERT INTO `region` VALUES ('100034', '00020001', '0002 ', '35', '市辖区', '1');
INSERT INTO `region` VALUES ('100035', '00020002', '0002', '36', '县', '1');
INSERT INTO `region` VALUES ('100036', '00030001', '0003 ', '37', '市辖区', '1');
INSERT INTO `region` VALUES ('100037', '00030002', '0003 ', '38', '县', '1');
INSERT INTO `region` VALUES ('100038', '00040001', '0004', '39', '石家庄市', '1');
INSERT INTO `region` VALUES ('100039', '00040002', '0004', '40', '唐山市', '1');
INSERT INTO `region` VALUES ('100040', '00040003', '0004', '41', '秦皇岛市', '1');
INSERT INTO `region` VALUES ('100041', '00040004', '0004', '42', '邯郸市', '1');
INSERT INTO `region` VALUES ('100042', '00040005', '0004', '43', '邢台市', '1');
INSERT INTO `region` VALUES ('100043', '00040006', '0004', '44', '保定市', '1');
INSERT INTO `region` VALUES ('100044', '00040007', '0004', '45', '张家口市', '1');
INSERT INTO `region` VALUES ('100045', '00040008', '0004', '46', '承德市', '1');
INSERT INTO `region` VALUES ('100046', '00040009', '0004', '47', '沧州市', '1');
INSERT INTO `region` VALUES ('100047', '00040010', '0004', '48', '廊坊市', '1');
INSERT INTO `region` VALUES ('100048', '00040011', '0004', '49', '衡水市', '1');
INSERT INTO `region` VALUES ('100049', '00050001', '0005', '50', '太原市', '1');
INSERT INTO `region` VALUES ('100050', '00050002', '0005', '51', '大同市', '1');
INSERT INTO `region` VALUES ('100051', '00050003', '0005', '52', '阳泉市', '1');
INSERT INTO `region` VALUES ('100052', '00050004', '0005', '53', '长治市', '1');
INSERT INTO `region` VALUES ('100053', '00050005', '0005', '54', '晋城市', '1');
INSERT INTO `region` VALUES ('100054', '00050006', '0005', '55', '朔州市', '1');
INSERT INTO `region` VALUES ('100055', '00050007', '0005', '56', '晋中市', '1');
INSERT INTO `region` VALUES ('100056', '00050008', '0005', '57', '运城市', '1');
INSERT INTO `region` VALUES ('100057', '00050009', '0005', '58', '忻州市', '1');
INSERT INTO `region` VALUES ('100058', '00050010', '0005', '59', '临汾市', '1');
INSERT INTO `region` VALUES ('100059', '00050011', '0005', '60', '吕梁市', '1');
INSERT INTO `region` VALUES ('100060', '00060001', '0006', '61', '呼和浩特市', '1');
INSERT INTO `region` VALUES ('100061', '00060002', '0006', '62', '包头市', '1');
INSERT INTO `region` VALUES ('100062', '00060003', '0006', '63', '乌海市', '1');
INSERT INTO `region` VALUES ('100063', '00060004', '0006', '64', '赤峰市', '1');
INSERT INTO `region` VALUES ('100064', '00060005', '0006', '65', '通辽市', '1');
INSERT INTO `region` VALUES ('100065', '00060006', '0006', '66', '鄂尔多斯市', '1');
INSERT INTO `region` VALUES ('100066', '00060007', '0006', '67', '呼伦贝尔市', '1');
INSERT INTO `region` VALUES ('100067', '00060008', '0006', '68', '巴彦淖尔市', '1');
INSERT INTO `region` VALUES ('100068', '00060009', '0006', '69', '乌兰察布市', '1');
INSERT INTO `region` VALUES ('100069', '00060010', '0006', '70', '兴安盟', '1');
INSERT INTO `region` VALUES ('100070', '00060011', '0006', '71', '锡林郭勒盟', '1');
INSERT INTO `region` VALUES ('100071', '00060012', '0006', '72', '阿拉善盟', '1');
INSERT INTO `region` VALUES ('100072', '00070001', '0007', '73', '沈阳市', '1');
INSERT INTO `region` VALUES ('100073', '00070002', '0007', '74', '大连市', '1');
INSERT INTO `region` VALUES ('100074', '00070003', '0007', '75', '鞍山市', '1');
INSERT INTO `region` VALUES ('100075', '00070004', '0007', '76', '抚顺市', '1');
INSERT INTO `region` VALUES ('100076', '00070005', '0007', '77', '本溪市', '1');
INSERT INTO `region` VALUES ('100077', '00070006', '0007', '78', '丹东市', '1');
INSERT INTO `region` VALUES ('100078', '00070007', '0007', '79', '锦州市', '1');
INSERT INTO `region` VALUES ('100079', '00070008', '0007', '80', '营口市', '1');
INSERT INTO `region` VALUES ('100080', '00070009', '0007', '81', '阜新市', '1');
INSERT INTO `region` VALUES ('100081', '00070010', '0007', '82', '辽阳市', '1');
INSERT INTO `region` VALUES ('100082', '00070011', '0007', '83', '盘锦市', '1');
INSERT INTO `region` VALUES ('100083', '00070012', '0007', '84', '铁岭市', '1');
INSERT INTO `region` VALUES ('100084', '00070013', '0007', '85', '朝阳市', '1');
INSERT INTO `region` VALUES ('100085', '00070014', '0007', '86', '葫芦岛市', '1');
INSERT INTO `region` VALUES ('100086', '00080001', '0008', '87', '长春市', '1');
INSERT INTO `region` VALUES ('100087', '00080002', '0008', '88', '吉林市', '1');
INSERT INTO `region` VALUES ('100088', '00080003', '0008', '89', '四平市', '1');
INSERT INTO `region` VALUES ('100089', '00080004', '0008', '90', '辽源市', '1');
INSERT INTO `region` VALUES ('100090', '00080005', '0008', '91', '通化市', '1');
INSERT INTO `region` VALUES ('100091', '00080006', '0008', '92', '白山市', '1');
INSERT INTO `region` VALUES ('100092', '00080007', '0008', '93', '松原市', '1');
INSERT INTO `region` VALUES ('100093', '00080008', '0008', '94', '白城市', '1');
INSERT INTO `region` VALUES ('100094', '00080009', '0008', '95', '延边朝鲜族自治州', '1');
INSERT INTO `region` VALUES ('100095', '00090001', '0009', '96', '哈尔滨市', '1');
INSERT INTO `region` VALUES ('100096', '00090002', '0009', '97', '齐齐哈尔市', '1');
INSERT INTO `region` VALUES ('100097', '00090003', '0009', '98', '鸡西市', '1');
INSERT INTO `region` VALUES ('100098', '00090004', '0009', '99', '鹤岗市', '1');
INSERT INTO `region` VALUES ('100099', '00090005', '0009', '100', '双鸭山市', '1');
INSERT INTO `region` VALUES ('100100', '00090006', '0009', '101', '大庆市', '1');
INSERT INTO `region` VALUES ('100101', '00090007', '0009', '102', '伊春市', '1');
INSERT INTO `region` VALUES ('100102', '00090008', '0009', '103', '佳木斯市', '1');
INSERT INTO `region` VALUES ('100103', '00090009', '0009', '104', '七台河市', '1');
INSERT INTO `region` VALUES ('100104', '00090010', '0009', '105', '牡丹江市', '1');
INSERT INTO `region` VALUES ('100105', '00090011', '0009', '106', '黑河市', '1');
INSERT INTO `region` VALUES ('100106', '00090012', '0009', '107', '绥化市', '1');
INSERT INTO `region` VALUES ('100107', '00090013', '0009', '108', '大兴安岭地区', '1');
INSERT INTO `region` VALUES ('100108', '00100001', '0010 ', '109', '市辖区', '1');
INSERT INTO `region` VALUES ('100109', '00100002', '0010 ', '110', '县', '1');
INSERT INTO `region` VALUES ('100110', '00110001', '0011 ', '111', '南京市', '1');
INSERT INTO `region` VALUES ('100111', '00110002', '0011 ', '112', '无锡市', '1');
INSERT INTO `region` VALUES ('100112', '00110003', '0011 ', '113', '徐州市', '1');
INSERT INTO `region` VALUES ('100113', '00110004', '0011 ', '114', '常州市', '1');
INSERT INTO `region` VALUES ('100114', '00110005', '0011 ', '115', '苏州市', '1');
INSERT INTO `region` VALUES ('100115', '00110006', '0011 ', '116', '南通市', '1');
INSERT INTO `region` VALUES ('100116', '00110007', '0011 ', '117', '连云港市', '1');
INSERT INTO `region` VALUES ('100117', '00110008', '0011 ', '118', '淮安市', '1');
INSERT INTO `region` VALUES ('100118', '00110009', '0011 ', '119', '盐城市', '1');
INSERT INTO `region` VALUES ('100119', '00110010', '0011 ', '120', '扬州市', '1');
INSERT INTO `region` VALUES ('100120', '00110011', '0011 ', '121', '镇江市', '1');
INSERT INTO `region` VALUES ('100121', '00110012', '0011 ', '122', '泰州市', '1');
INSERT INTO `region` VALUES ('100122', '00110013', '0011 ', '123', '宿迁市', '1');
INSERT INTO `region` VALUES ('100123', '00120001', '0012', '124', '杭州市', '1');
INSERT INTO `region` VALUES ('100124', '00120002', '0012', '125', '宁波市', '1');
INSERT INTO `region` VALUES ('100125', '00120003', '0012', '126', '温州市', '1');
INSERT INTO `region` VALUES ('100126', '00120004', '0012', '127', '嘉兴市', '1');
INSERT INTO `region` VALUES ('100127', '00120005', '0012', '128', '湖州市', '1');
INSERT INTO `region` VALUES ('100128', '00120006', '0012', '129', '绍兴市', '1');
INSERT INTO `region` VALUES ('100129', '00120007', '0012', '130', '金华市', '1');
INSERT INTO `region` VALUES ('100130', '00120008', '0012', '131', '衢州市', '1');
INSERT INTO `region` VALUES ('100131', '00120009', '0012', '132', '舟山市', '1');
INSERT INTO `region` VALUES ('100132', '00120010', '0012', '133', '台州市', '1');
INSERT INTO `region` VALUES ('100133', '00120011', '0012', '134', '丽水市', '1');
INSERT INTO `region` VALUES ('100134', '00130001', '0013', '135', '合肥市', '1');
INSERT INTO `region` VALUES ('100135', '00130002', '0013', '136', '芜湖市', '1');
INSERT INTO `region` VALUES ('100136', '00130003', '0013', '137', '蚌埠市', '1');
INSERT INTO `region` VALUES ('100137', '00130004', '0013', '138', '淮南市', '1');
INSERT INTO `region` VALUES ('100138', '00130005', '0013', '139', '马鞍山市', '1');
INSERT INTO `region` VALUES ('100139', '00130006', '0013', '140', '淮北市', '1');
INSERT INTO `region` VALUES ('100140', '00130007', '0013', '141', '铜陵市', '1');
INSERT INTO `region` VALUES ('100141', '00130008', '0013', '142', '安庆市', '1');
INSERT INTO `region` VALUES ('100142', '00130009', '0013', '143', '黄山市', '1');
INSERT INTO `region` VALUES ('100143', '00130010', '0013', '144', '滁州市', '1');
INSERT INTO `region` VALUES ('100144', '00130011', '0013', '145', '阜阳市', '1');
INSERT INTO `region` VALUES ('100145', '00130012', '0013', '146', '宿州市', '1');
INSERT INTO `region` VALUES ('100146', '00130013', '0013', '147', '巢湖市', '1');
INSERT INTO `region` VALUES ('100147', '00130014', '0013', '148', '六安市', '1');
INSERT INTO `region` VALUES ('100148', '00130015', '0013', '149', '亳州市', '1');
INSERT INTO `region` VALUES ('100149', '00130016', '0013', '150', '池州市', '1');
INSERT INTO `region` VALUES ('100150', '00130017', '0013', '151', '宣城市', '1');
INSERT INTO `region` VALUES ('100151', '00140001', '0014', '152', '福州市', '1');
INSERT INTO `region` VALUES ('100152', '00140002', '0014', '153', '厦门市', '1');
INSERT INTO `region` VALUES ('100153', '00140003', '0014', '154', '莆田市', '1');
INSERT INTO `region` VALUES ('100154', '00140004', '0014', '155', '三明市', '1');
INSERT INTO `region` VALUES ('100155', '00140005', '0014', '156', '泉州市', '1');
INSERT INTO `region` VALUES ('100156', '00140006', '0014', '157', '漳州市', '1');
INSERT INTO `region` VALUES ('100157', '00140007', '0014', '158', '南平市', '1');
INSERT INTO `region` VALUES ('100158', '00140008', '0014', '159', '龙岩市', '1');
INSERT INTO `region` VALUES ('100159', '00140009', '0014', '160', '宁德市', '1');
INSERT INTO `region` VALUES ('100160', '00150001', '0015', '161', '南昌市', '1');
INSERT INTO `region` VALUES ('100161', '00150002', '0015', '162', '景德镇市', '1');
INSERT INTO `region` VALUES ('100162', '00150003', '0015', '163', '萍乡市', '1');
INSERT INTO `region` VALUES ('100163', '00150004', '0015', '164', '九江市', '1');
INSERT INTO `region` VALUES ('100164', '00150005', '0015', '165', '新余市', '1');
INSERT INTO `region` VALUES ('100165', '00150006', '0015', '166', '鹰潭市', '1');
INSERT INTO `region` VALUES ('100166', '00150007', '0015', '167', '赣州市', '1');
INSERT INTO `region` VALUES ('100167', '00150008', '0015', '168', '吉安市', '1');
INSERT INTO `region` VALUES ('100168', '00150009', '0015', '169', '宜春市', '1');
INSERT INTO `region` VALUES ('100169', '00150010', '0015', '170', '抚州市', '1');
INSERT INTO `region` VALUES ('100170', '00150011', '0015', '171', '上饶市', '1');
INSERT INTO `region` VALUES ('100171', '00160001', '0016 ', '172', '济南市', '1');
INSERT INTO `region` VALUES ('100172', '00160002', '0016 ', '173', '青岛市', '1');
INSERT INTO `region` VALUES ('100173', '00160003', '0016 ', '174', '淄博市', '1');
INSERT INTO `region` VALUES ('100174', '00160004', '0016 ', '175', '枣庄市', '1');
INSERT INTO `region` VALUES ('100175', '00160005', '0016 ', '176', '东营市', '1');
INSERT INTO `region` VALUES ('100176', '00160006', '0016 ', '177', '烟台市', '1');
INSERT INTO `region` VALUES ('100177', '00160007', '0016 ', '178', '潍坊市', '1');
INSERT INTO `region` VALUES ('100178', '00160008', '0016 ', '179', '济宁市', '1');
INSERT INTO `region` VALUES ('100179', '00160009', '0016 ', '180', '泰安市', '1');
INSERT INTO `region` VALUES ('100180', '00160010', '0016 ', '181', '威海市', '1');
INSERT INTO `region` VALUES ('100181', '00160011', '0016 ', '182', '日照市', '1');
INSERT INTO `region` VALUES ('100182', '00160012', '0016 ', '183', '莱芜市', '1');
INSERT INTO `region` VALUES ('100183', '00160013', '0016 ', '184', '临沂市', '1');
INSERT INTO `region` VALUES ('100184', '00160014', '0016 ', '185', '德州市', '1');
INSERT INTO `region` VALUES ('100185', '00160015', '0016 ', '186', '聊城市', '1');
INSERT INTO `region` VALUES ('100186', '00160016', '0016 ', '187', '滨州市', '1');
INSERT INTO `region` VALUES ('100187', '00160017', '0016 ', '188', '荷泽市', '1');
INSERT INTO `region` VALUES ('100188', '00170001', '0017', '189', '郑州市', '1');
INSERT INTO `region` VALUES ('100189', '00170002', '0017', '190', '开封市', '1');
INSERT INTO `region` VALUES ('100190', '00170003', '0017', '191', '洛阳市', '1');
INSERT INTO `region` VALUES ('100191', '00170004', '0017', '192', '平顶山市', '1');
INSERT INTO `region` VALUES ('100192', '00170005', '0017', '193', '安阳市', '1');
INSERT INTO `region` VALUES ('100193', '00170006', '0017', '194', '鹤壁市', '1');
INSERT INTO `region` VALUES ('100194', '00170007', '0017', '195', '新乡市', '1');
INSERT INTO `region` VALUES ('100195', '00170008', '0017', '196', '焦作市', '1');
INSERT INTO `region` VALUES ('100196', '00170009', '0017', '197', '濮阳市', '1');
INSERT INTO `region` VALUES ('100197', '00170010', '0017', '198', '许昌市', '1');
INSERT INTO `region` VALUES ('100198', '00170011', '0017', '199', '漯河市', '1');
INSERT INTO `region` VALUES ('100199', '00170012', '0017', '200', '三门峡市', '1');
INSERT INTO `region` VALUES ('100200', '00170013', '0017', '201', '南阳市', '1');
INSERT INTO `region` VALUES ('100201', '00170014', '0017', '202', '商丘市', '1');
INSERT INTO `region` VALUES ('100202', '00170015', '0017', '203', '信阳市', '1');
INSERT INTO `region` VALUES ('100203', '00170016', '0017', '204', '周口市', '1');
INSERT INTO `region` VALUES ('100204', '00170017', '0017', '205', '驻马店市', '1');
INSERT INTO `region` VALUES ('100205', '00180001', '0018 ', '206', '武汉市', '1');
INSERT INTO `region` VALUES ('100206', '00180002', '0018 ', '207', '黄石市', '1');
INSERT INTO `region` VALUES ('100207', '00180003', '0018 ', '208', '十堰市', '1');
INSERT INTO `region` VALUES ('100208', '00180004', '0018 ', '209', '宜昌市', '1');
INSERT INTO `region` VALUES ('100209', '00180005', '0018 ', '210', '襄樊市', '1');
INSERT INTO `region` VALUES ('100210', '00180006', '0018 ', '211', '鄂州市', '1');
INSERT INTO `region` VALUES ('100211', '00180007', '0018 ', '212', '荆门市', '1');
INSERT INTO `region` VALUES ('100212', '00180008', '0018 ', '213', '孝感市', '1');
INSERT INTO `region` VALUES ('100213', '00180009', '0018 ', '214', '荆州市', '1');
INSERT INTO `region` VALUES ('100214', '00180010', '0018 ', '215', '黄冈市', '1');
INSERT INTO `region` VALUES ('100215', '00180011', '0018 ', '216', '咸宁市', '1');
INSERT INTO `region` VALUES ('100216', '00180012', '0018 ', '217', '随州市', '1');
INSERT INTO `region` VALUES ('100217', '00180013', '0018 ', '218', '恩施土家族苗族自治州', '1');
INSERT INTO `region` VALUES ('100218', '00180014', '0018 ', '219', '省直辖行政单位', '1');
INSERT INTO `region` VALUES ('100219', '00190001', '0019 ', '220', '长沙市', '1');
INSERT INTO `region` VALUES ('100220', '00190002', '0019 ', '221', '株洲市', '1');
INSERT INTO `region` VALUES ('100221', '00190003', '0019 ', '222', '湘潭市', '1');
INSERT INTO `region` VALUES ('100222', '00190004', '0019 ', '223', '衡阳市', '1');
INSERT INTO `region` VALUES ('100223', '00190005', '0019 ', '224', '邵阳市', '1');
INSERT INTO `region` VALUES ('100224', '00190006', '0019 ', '225', '岳阳市', '1');
INSERT INTO `region` VALUES ('100225', '00190007', '0019 ', '226', '常德市', '1');
INSERT INTO `region` VALUES ('100226', '00190008', '0019 ', '227', '张家界市', '1');
INSERT INTO `region` VALUES ('100227', '00190009', '0019 ', '228', '益阳市', '1');
INSERT INTO `region` VALUES ('100228', '00190010', '0019 ', '229', '郴州市', '1');
INSERT INTO `region` VALUES ('100229', '00190011', '0019 ', '230', '永州市', '1');
INSERT INTO `region` VALUES ('100230', '00190012', '0019 ', '231', '怀化市', '1');
INSERT INTO `region` VALUES ('100231', '00190013', '0019 ', '232', '娄底市', '1');
INSERT INTO `region` VALUES ('100232', '00190014', '0019 ', '233', '湘西土家族苗族自治州', '1');
INSERT INTO `region` VALUES ('100233', '00200001', '0020 ', '234', '广州市', '1');
INSERT INTO `region` VALUES ('100234', '00200002', '0020 ', '235', '韶关市', '1');
INSERT INTO `region` VALUES ('100235', '00200003', '0020 ', '236', '深圳市', '1');
INSERT INTO `region` VALUES ('100236', '00200004', '0020 ', '237', '珠海市', '1');
INSERT INTO `region` VALUES ('100237', '00200005', '0020 ', '238', '汕头市', '1');
INSERT INTO `region` VALUES ('100238', '00200006', '0020 ', '239', '佛山市', '1');
INSERT INTO `region` VALUES ('100239', '00200007', '0020 ', '240', '江门市', '1');
INSERT INTO `region` VALUES ('100240', '00200008', '0020 ', '241', '湛江市', '1');
INSERT INTO `region` VALUES ('100241', '00200009', '0020 ', '242', '茂名市', '1');
INSERT INTO `region` VALUES ('100242', '00200010', '0020 ', '243', '肇庆市', '1');
INSERT INTO `region` VALUES ('100243', '00200011', '0020 ', '244', '惠州市', '1');
INSERT INTO `region` VALUES ('100244', '00200012', '0020 ', '245', '梅州市', '1');
INSERT INTO `region` VALUES ('100245', '00200013', '0020 ', '246', '汕尾市', '1');
INSERT INTO `region` VALUES ('100246', '00200014', '0020 ', '247', '河源市', '1');
INSERT INTO `region` VALUES ('100247', '00200015', '0020 ', '248', '阳江市', '1');
INSERT INTO `region` VALUES ('100248', '00200016', '0020 ', '249', '清远市', '1');
INSERT INTO `region` VALUES ('100249', '00200017', '0020 ', '250', '东莞市', '1');
INSERT INTO `region` VALUES ('100250', '00200018', '0020 ', '251', '中山市', '1');
INSERT INTO `region` VALUES ('100251', '00200019', '0020 ', '252', '潮州市', '1');
INSERT INTO `region` VALUES ('100252', '00200020', '0020 ', '253', '揭阳市', '1');
INSERT INTO `region` VALUES ('100253', '00200021', '0020 ', '254', '云浮市', '1');
INSERT INTO `region` VALUES ('100254', '00210001', '0021', '255', '南宁市', '1');
INSERT INTO `region` VALUES ('100255', '00210002', '0021', '256', '柳州市', '1');
INSERT INTO `region` VALUES ('100256', '00210003', '0021', '257', '桂林市', '1');
INSERT INTO `region` VALUES ('100257', '00210004', '0021', '258', '梧州市', '1');
INSERT INTO `region` VALUES ('100258', '00210005', '0021', '259', '北海市', '1');
INSERT INTO `region` VALUES ('100259', '00210006', '0021', '260', '防城港市', '1');
INSERT INTO `region` VALUES ('100260', '00210007', '0021', '261', '钦州市', '1');
INSERT INTO `region` VALUES ('100261', '00210008', '0021', '262', '贵港市', '1');
INSERT INTO `region` VALUES ('100262', '00210009', '0021', '263', '玉林市', '1');
INSERT INTO `region` VALUES ('100263', '00210010', '0021', '264', '百色市', '1');
INSERT INTO `region` VALUES ('100264', '00210011', '0021', '265', '贺州市', '1');
INSERT INTO `region` VALUES ('100265', '00210012', '0021', '266', '河池市', '1');
INSERT INTO `region` VALUES ('100266', '00210013', '0021', '267', '来宾市', '1');
INSERT INTO `region` VALUES ('100267', '00210014', '0021', '268', '崇左市', '1');
INSERT INTO `region` VALUES ('100268', '00220001', '0022 ', '269', '海口市', '1');
INSERT INTO `region` VALUES ('100269', '00220002', '0022 ', '270', '三亚市', '1');
INSERT INTO `region` VALUES ('100270', '00220003', '0022 ', '271', '省直辖县级行政单位', '1');
INSERT INTO `region` VALUES ('100271', '00230001', '0023', '272', '市辖区', '1');
INSERT INTO `region` VALUES ('100272', '00230002', '0023', '273', '县', '1');
INSERT INTO `region` VALUES ('100273', '00230003', '0023', '274', '市', '1');
INSERT INTO `region` VALUES ('100274', '00240001', '0024', '275', '成都市', '1');
INSERT INTO `region` VALUES ('100275', '00240002', '0024', '276', '自贡市', '1');
INSERT INTO `region` VALUES ('100276', '00240003', '0024', '277', '攀枝花市', '1');
INSERT INTO `region` VALUES ('100277', '00240004', '0024', '278', '泸州市', '1');
INSERT INTO `region` VALUES ('100278', '00240005', '0024', '279', '德阳市', '1');
INSERT INTO `region` VALUES ('100279', '00240006', '0024', '280', '绵阳市', '1');
INSERT INTO `region` VALUES ('100280', '00240007', '0024', '281', '广元市', '1');
INSERT INTO `region` VALUES ('100281', '00240008', '0024', '282', '遂宁市', '1');
INSERT INTO `region` VALUES ('100282', '00240009', '0024', '283', '内江市', '1');
INSERT INTO `region` VALUES ('100283', '00240010', '0024', '284', '乐山市', '1');
INSERT INTO `region` VALUES ('100284', '00240011', '0024', '285', '南充市', '1');
INSERT INTO `region` VALUES ('100285', '00240012', '0024', '286', '眉山市', '1');
INSERT INTO `region` VALUES ('100286', '00240013', '0024', '287', '宜宾市', '1');
INSERT INTO `region` VALUES ('100287', '00240014', '0024', '288', '广安市', '1');
INSERT INTO `region` VALUES ('100288', '00240015', '0024', '289', '达州市', '1');
INSERT INTO `region` VALUES ('100289', '00240016', '0024', '290', '雅安市', '1');
INSERT INTO `region` VALUES ('100290', '00240017', '0024', '291', '巴中市', '1');
INSERT INTO `region` VALUES ('100291', '00240018', '0024', '292', '资阳市', '1');
INSERT INTO `region` VALUES ('100292', '00240019', '0024', '293', '阿坝藏族羌族自治州', '1');
INSERT INTO `region` VALUES ('100293', '00240020', '0024', '294', '甘孜藏族自治州', '1');
INSERT INTO `region` VALUES ('100294', '00240021', '0024', '295', '凉山彝族自治州', '1');
INSERT INTO `region` VALUES ('100295', '00250001', '0025', '296', '贵阳市', '1');
INSERT INTO `region` VALUES ('100296', '00250002', '0025', '297', '六盘水市', '1');
INSERT INTO `region` VALUES ('100297', '00250003', '0025', '298', '遵义市', '1');
INSERT INTO `region` VALUES ('100298', '00250004', '0025', '299', '安顺市', '1');
INSERT INTO `region` VALUES ('100299', '00250005', '0025', '300', '铜仁地区', '1');
INSERT INTO `region` VALUES ('100300', '00250006', '0025', '301', '黔西南布依族苗族自治州', '1');
INSERT INTO `region` VALUES ('100301', '00250007', '0025', '302', '毕节地区', '1');
INSERT INTO `region` VALUES ('100302', '00250008', '0025', '303', '黔东南苗族侗族自治州', '1');
INSERT INTO `region` VALUES ('100303', '00250009', '0025', '304', '黔南布依族苗族自治州', '1');
INSERT INTO `region` VALUES ('100304', '00260001', '0026', '305', '昆明市', '1');
INSERT INTO `region` VALUES ('100305', '00260002', '0026', '306', '曲靖市', '1');
INSERT INTO `region` VALUES ('100306', '00260003', '0026', '307', '玉溪市', '1');
INSERT INTO `region` VALUES ('100307', '00260004', '0026', '308', '保山市', '1');
INSERT INTO `region` VALUES ('100308', '00260005', '0026', '309', '昭通市', '1');
INSERT INTO `region` VALUES ('100309', '00260006', '0026', '310', '丽江市', '1');
INSERT INTO `region` VALUES ('100310', '00260007', '0026', '311', '思茅市', '1');
INSERT INTO `region` VALUES ('100311', '00260008', '0026', '312', '临沧市', '1');
INSERT INTO `region` VALUES ('100312', '00260009', '0026', '313', '楚雄彝族自治州', '1');
INSERT INTO `region` VALUES ('100313', '00260010', '0026', '314', '红河哈尼族彝族自治州', '1');
INSERT INTO `region` VALUES ('100314', '00260011', '0026', '315', '文山壮族苗族自治州', '1');
INSERT INTO `region` VALUES ('100315', '00260012', '0026', '316', '西双版纳傣族自治州', '1');
INSERT INTO `region` VALUES ('100316', '00260013', '0026', '317', '大理白族自治州', '1');
INSERT INTO `region` VALUES ('100317', '00260014', '0026', '318', '德宏傣族景颇族自治州', '1');
INSERT INTO `region` VALUES ('100318', '00260015', '0026', '319', '怒江傈僳族自治州', '1');
INSERT INTO `region` VALUES ('100319', '00260016', '0026', '320', '迪庆藏族自治州', '1');
INSERT INTO `region` VALUES ('100320', '00270001', '0027', '321', '拉萨市', '1');
INSERT INTO `region` VALUES ('100321', '00270002', '0027', '322', '昌都地区', '1');
INSERT INTO `region` VALUES ('100322', '00270003', '0027', '323', '山南地区', '1');
INSERT INTO `region` VALUES ('100323', '00270004', '0027', '324', '日喀则地区', '1');
INSERT INTO `region` VALUES ('100324', '00270005', '0027', '325', '那曲地区', '1');
INSERT INTO `region` VALUES ('100325', '00270006', '0027', '326', '阿里地区', '1');
INSERT INTO `region` VALUES ('100326', '00270007', '0027', '327', '林芝地区', '1');
INSERT INTO `region` VALUES ('100327', '00280001', '0028', '328', '西安市', '1');
INSERT INTO `region` VALUES ('100328', '00280002', '0028', '329', '铜川市', '1');
INSERT INTO `region` VALUES ('100329', '00280003', '0028', '330', '宝鸡市', '1');
INSERT INTO `region` VALUES ('100330', '00280004', '0028', '331', '咸阳市', '1');
INSERT INTO `region` VALUES ('100331', '00280005', '0028', '332', '渭南市', '1');
INSERT INTO `region` VALUES ('100332', '00280006', '0028', '333', '延安市', '1');
INSERT INTO `region` VALUES ('100333', '00280007', '0028', '334', '汉中市', '1');
INSERT INTO `region` VALUES ('100334', '00280008', '0028', '335', '榆林市', '1');
INSERT INTO `region` VALUES ('100335', '00280009', '0028', '336', '安康市', '1');
INSERT INTO `region` VALUES ('100336', '00280010', '0028', '337', '商洛市', '1');
INSERT INTO `region` VALUES ('100337', '00290001', '0029', '338', '兰州市', '1');
INSERT INTO `region` VALUES ('100338', '00290002', '0029', '339', '嘉峪关市', '1');
INSERT INTO `region` VALUES ('100339', '00290003', '0029', '340', '金昌市', '1');
INSERT INTO `region` VALUES ('100340', '00290004', '0029', '341', '白银市', '1');
INSERT INTO `region` VALUES ('100341', '00290005', '0029', '342', '天水市', '1');
INSERT INTO `region` VALUES ('100342', '00290006', '0029', '343', '武威市', '1');
INSERT INTO `region` VALUES ('100343', '00290007', '0029', '344', '张掖市', '1');
INSERT INTO `region` VALUES ('100344', '00290008', '0029', '345', '平凉市', '1');
INSERT INTO `region` VALUES ('100345', '00290009', '0029', '346', '酒泉市', '1');
INSERT INTO `region` VALUES ('100346', '00290010', '0029', '347', '庆阳市', '1');
INSERT INTO `region` VALUES ('100347', '00290011', '0029', '348', '定西市', '1');
INSERT INTO `region` VALUES ('100348', '00290012', '0029', '349', '陇南市', '1');
INSERT INTO `region` VALUES ('100349', '00290013', '0029', '350', '临夏回族自治州', '1');
INSERT INTO `region` VALUES ('100350', '00290014', '0029', '351', '甘南藏族自治州', '1');
INSERT INTO `region` VALUES ('100351', '00300001', '0030', '352', '西宁市', '1');
INSERT INTO `region` VALUES ('100352', '00300002', '0030', '353', '海东地区', '1');
INSERT INTO `region` VALUES ('100353', '00300003', '0030', '354', '海北藏族自治州', '1');
INSERT INTO `region` VALUES ('100354', '00300004', '0030', '355', '黄南藏族自治州', '1');
INSERT INTO `region` VALUES ('100355', '00300005', '0030', '356', '海南藏族自治州', '1');
INSERT INTO `region` VALUES ('100356', '00300006', '0030', '357', '果洛藏族自治州', '1');
INSERT INTO `region` VALUES ('100357', '00300007', '0030', '358', '玉树藏族自治州', '1');
INSERT INTO `region` VALUES ('100358', '00300008', '0030', '359', '海西蒙古族藏族自治州', '1');
INSERT INTO `region` VALUES ('100359', '00310001', '0031', '360', '银川市', '1');
INSERT INTO `region` VALUES ('100360', '00310002', '0031', '361', '石嘴山市', '1');
INSERT INTO `region` VALUES ('100361', '00310003', '0031', '362', '吴忠市', '1');
INSERT INTO `region` VALUES ('100362', '00310004', '0031', '363', '固原市', '1');
INSERT INTO `region` VALUES ('100363', '00310005', '0031', '364', '中卫市', '1');
INSERT INTO `region` VALUES ('100364', '00320001', '0032', '365', '乌鲁木齐市', '1');
INSERT INTO `region` VALUES ('100365', '00320002', '0032', '366', '克拉玛依市', '1');
INSERT INTO `region` VALUES ('100366', '00320003', '0032', '367', '吐鲁番地区', '1');
INSERT INTO `region` VALUES ('100367', '00320004', '0032', '368', '哈密地区', '1');
INSERT INTO `region` VALUES ('100368', '00320005', '0032', '369', '昌吉回族自治州', '1');
INSERT INTO `region` VALUES ('100369', '00320006', '0032', '370', '博尔塔拉蒙古自治州', '1');
INSERT INTO `region` VALUES ('100370', '00320007', '0032', '371', '巴音郭楞蒙古自治州', '1');
INSERT INTO `region` VALUES ('100371', '00320008', '0032', '372', '阿克苏地区', '1');
INSERT INTO `region` VALUES ('100372', '00320009', '0032', '373', '克孜勒苏柯尔克孜自治州', '1');
INSERT INTO `region` VALUES ('100373', '00320010', '0032', '374', '喀什地区', '1');
INSERT INTO `region` VALUES ('100374', '00320011', '0032', '375', '和田地区', '1');
INSERT INTO `region` VALUES ('100375', '00320012', '0032', '376', '伊犁哈萨克自治州', '1');
INSERT INTO `region` VALUES ('100376', '00320013', '0032', '377', '塔城地区', '1');
INSERT INTO `region` VALUES ('100377', '00320014', '0032', '378', '阿勒泰地区', '1');
INSERT INTO `region` VALUES ('100378', '000200010001', '00020001', '405', '东城区', '1');
INSERT INTO `region` VALUES ('100379', '000200010002', '00020001', '406', '西城区', '1');
INSERT INTO `region` VALUES ('100380', '000200010003', '00020001', '407', '崇文区', '1');
INSERT INTO `region` VALUES ('100381', '000200010004', '00020001', '408', '宣武区', '1');
INSERT INTO `region` VALUES ('100382', '000200010005', '00020001', '409', '朝阳区', '1');
INSERT INTO `region` VALUES ('100383', '000200010006', '00020001', '410', '丰台区', '1');
INSERT INTO `region` VALUES ('100384', '000200010007', '00020001', '411', '石景山区', '1');
INSERT INTO `region` VALUES ('100385', '000200010008', '00020001', '412', '海淀区', '1');
INSERT INTO `region` VALUES ('100386', '000200010009', '00020001', '413', '门头沟区', '1');
INSERT INTO `region` VALUES ('100387', '000200010010', '00020001', '414', '房山区', '1');
INSERT INTO `region` VALUES ('100388', '000200010011', '00020001', '415', '通州区', '1');
INSERT INTO `region` VALUES ('100389', '000200010012', '00020001', '416', '顺义区', '1');
INSERT INTO `region` VALUES ('100390', '000200010013', '00020001', '417', '昌平区', '1');
INSERT INTO `region` VALUES ('100391', '000200010014', '00020001', '418', '大兴区', '1');
INSERT INTO `region` VALUES ('100392', '000200010015', '00020001', '419', '怀柔区', '1');
INSERT INTO `region` VALUES ('100393', '000200010016', '00020001', '420', '平谷区', '1');
INSERT INTO `region` VALUES ('100394', '000200020001', '00020002', '421', '密云县', '1');
INSERT INTO `region` VALUES ('100395', '000200020002', '00020002', '422', '延庆县', '1');
INSERT INTO `region` VALUES ('100396', '000200020003', '00030001', '423', '和平区', '1');
INSERT INTO `region` VALUES ('100397', '000200020004', '00030001', '424', '河东区', '1');
INSERT INTO `region` VALUES ('100398', '000200020005', '00030001', '425', '河西区', '1');
INSERT INTO `region` VALUES ('100399', '000200020006', '00030001', '426', '南开区', '1');
INSERT INTO `region` VALUES ('100400', '000200020007', '00030001', '427', '河北区', '1');
INSERT INTO `region` VALUES ('100401', '000200020008', '00030001', '428', '红桥区', '1');
INSERT INTO `region` VALUES ('100402', '000200020009', '00030001', '429', '塘沽区', '1');
INSERT INTO `region` VALUES ('100403', '000200020010', '00030001', '430', '汉沽区', '1');
INSERT INTO `region` VALUES ('100404', '000200020011', '00030001', '431', '大港区', '1');
INSERT INTO `region` VALUES ('100405', '000200020012', '00030001', '432', '东丽区', '1');
INSERT INTO `region` VALUES ('100406', '000200020013', '00030001', '433', '西青区', '1');
INSERT INTO `region` VALUES ('100407', '000200020014', '00030001', '434', '津南区', '1');
INSERT INTO `region` VALUES ('100408', '000200020015', '00030001', '435', '北辰区', '1');
INSERT INTO `region` VALUES ('100409', '000200020016', '00030001', '436', '武清区', '1');
INSERT INTO `region` VALUES ('100410', '000200020017', '00030001', '437', '宝坻区', '1');
INSERT INTO `region` VALUES ('100411', '000300020001', '00030002', '438', '宁河县', '1');
INSERT INTO `region` VALUES ('100412', '000300020002', '00030002', '439', '静海县', '1');
INSERT INTO `region` VALUES ('100413', '000300020003', '00030002', '440', '蓟　县', '1');
INSERT INTO `region` VALUES ('100414', '000400010001', '00040001', '441', '市辖区', '1');
INSERT INTO `region` VALUES ('100415', '000400010002', '00040001', '442', '长安区', '1');
INSERT INTO `region` VALUES ('100416', '000400010003', '00040001', '443', '桥东区', '1');
INSERT INTO `region` VALUES ('100417', '000400010004', '00040001', '444', '桥西区', '1');
INSERT INTO `region` VALUES ('100418', '000400010005', '00040001', '445', '新华区', '1');
INSERT INTO `region` VALUES ('100419', '000400010006', '00040001', '446', '井陉矿区', '1');
INSERT INTO `region` VALUES ('100420', '000400010007', '00040001', '447', '裕华区', '1');
INSERT INTO `region` VALUES ('100421', '000400010008', '00040001', '448', '井陉县', '1');
INSERT INTO `region` VALUES ('100422', '000400010009', '00040001', '449', '正定县', '1');
INSERT INTO `region` VALUES ('100423', '000400010010', '00040001', '450', '栾城县', '1');
INSERT INTO `region` VALUES ('100424', '000400010011', '00040001', '451', '行唐县', '1');
INSERT INTO `region` VALUES ('100425', '000400010012', '00040001', '452', '灵寿县', '1');
INSERT INTO `region` VALUES ('100426', '000400010013', '00040001', '453', '高邑县', '1');
INSERT INTO `region` VALUES ('100427', '000400010014', '00040001', '454', '深泽县', '1');
INSERT INTO `region` VALUES ('100428', '000400010015', '00040001', '455', '赞皇县', '1');
INSERT INTO `region` VALUES ('100429', '000400010016', '00040001', '456', '无极县', '1');
INSERT INTO `region` VALUES ('100430', '000400010017', '00040001', '457', '平山县', '1');
INSERT INTO `region` VALUES ('100431', '000400010018', '00040001', '458', '元氏县', '1');
INSERT INTO `region` VALUES ('100432', '000400010019', '00040001', '459', '赵　县', '1');
INSERT INTO `region` VALUES ('100433', '000400010020', '00040001', '460', '辛集市', '1');
INSERT INTO `region` VALUES ('100434', '000400010021', '00040001', '461', '藁城市', '1');
INSERT INTO `region` VALUES ('100435', '000400010022', '00040001', '462', '晋州市', '1');
INSERT INTO `region` VALUES ('100436', '000400010023', '00040001', '463', '新乐市', '1');
INSERT INTO `region` VALUES ('100437', '000400010024', '00040001', '464', '鹿泉市', '1');
INSERT INTO `region` VALUES ('100438', '000400020001', '00040002', '465', '市辖区', '1');
INSERT INTO `region` VALUES ('100439', '000400020002', '00040002', '466', '路南区', '1');
INSERT INTO `region` VALUES ('100440', '000400020003', '00040002', '467', '路北区', '1');
INSERT INTO `region` VALUES ('100441', '000400020004', '00040002', '468', '古冶区', '1');
INSERT INTO `region` VALUES ('100442', '000400020005', '00040002', '469', '开平区', '1');
INSERT INTO `region` VALUES ('100443', '000400020006', '00040002', '470', '丰南区', '1');
INSERT INTO `region` VALUES ('100444', '000400020007', '00040002', '471', '丰润区', '1');
INSERT INTO `region` VALUES ('100445', '000400020008', '00040002', '472', '滦　县', '1');
INSERT INTO `region` VALUES ('100446', '000400020009', '00040002', '473', '滦南县', '1');
INSERT INTO `region` VALUES ('100447', '000400020010', '00040002', '474', '乐亭县', '1');
INSERT INTO `region` VALUES ('100448', '000400020011', '00040002', '475', '迁西县', '1');
INSERT INTO `region` VALUES ('100449', '000400020012', '00040002', '476', '玉田县', '1');
INSERT INTO `region` VALUES ('100450', '000400020013', '00040002', '477', '唐海县', '1');
INSERT INTO `region` VALUES ('100451', '000400020014', '00040002', '478', '遵化市', '1');
INSERT INTO `region` VALUES ('100452', '000400020015', '00040002', '479', '迁安市', '1');
INSERT INTO `region` VALUES ('100453', '000400030001', '00040003', '480', '市辖区', '1');
INSERT INTO `region` VALUES ('100454', '000400030002', '00040003', '481', '海港区', '1');
INSERT INTO `region` VALUES ('100455', '000400030003', '00040003', '482', '山海关区', '1');
INSERT INTO `region` VALUES ('100456', '000400030004', '00040003', '483', '北戴河区', '1');
INSERT INTO `region` VALUES ('100457', '000400030005', '00040003', '484', '青龙满族自治县', '1');
INSERT INTO `region` VALUES ('100458', '000400030006', '00040003', '485', '昌黎县', '1');
INSERT INTO `region` VALUES ('100459', '000400030007', '00040003', '486', '抚宁县', '1');
INSERT INTO `region` VALUES ('100460', '000400030008', '00040003', '487', '卢龙县', '1');
INSERT INTO `region` VALUES ('100461', '000400040001', '00040004', '488', '市辖区', '1');
INSERT INTO `region` VALUES ('100462', '000400040002', '00040004', '489', '邯山区', '1');
INSERT INTO `region` VALUES ('100463', '000400040003', '00040004', '490', '丛台区', '1');
INSERT INTO `region` VALUES ('100464', '000400040004', '00040004', '491', '复兴区', '1');
INSERT INTO `region` VALUES ('100465', '000400040005', '00040004', '492', '峰峰矿区', '1');
INSERT INTO `region` VALUES ('100466', '000400040006', '00040004', '493', '邯郸县', '1');
INSERT INTO `region` VALUES ('100467', '000400040007', '00040004', '494', '临漳县', '1');
INSERT INTO `region` VALUES ('100468', '000400040008', '00040004', '495', '成安县', '1');
INSERT INTO `region` VALUES ('100469', '000400040009', '00040004', '496', '大名县', '1');
INSERT INTO `region` VALUES ('100470', '000400040010', '00040004', '497', '涉　县', '1');
INSERT INTO `region` VALUES ('100471', '000400040011', '00040004', '498', '磁　县', '1');
INSERT INTO `region` VALUES ('100472', '000400040012', '00040004', '499', '肥乡县', '1');
INSERT INTO `region` VALUES ('100473', '000400040013', '00040004', '500', '永年县', '1');
INSERT INTO `region` VALUES ('100474', '000400040014', '00040004', '501', '邱　县', '1');
INSERT INTO `region` VALUES ('100475', '000400040015', '00040004', '502', '鸡泽县', '1');
INSERT INTO `region` VALUES ('100476', '000400040016', '00040004', '503', '广平县', '1');
INSERT INTO `region` VALUES ('100477', '000400040017', '00040004', '504', '馆陶县', '1');
INSERT INTO `region` VALUES ('100478', '000400040018', '00040004', '505', '魏　县', '1');
INSERT INTO `region` VALUES ('100479', '000400040019', '00040004', '506', '曲周县', '1');
INSERT INTO `region` VALUES ('100480', '000400040020', '00040004', '507', '武安市', '1');
INSERT INTO `region` VALUES ('100481', '000400050001', '00040005', '508', '市辖区', '1');
INSERT INTO `region` VALUES ('100482', '000400050002', '00040005', '509', '桥东区', '1');
INSERT INTO `region` VALUES ('100483', '000400050003', '00040005', '510', '桥西区', '1');
INSERT INTO `region` VALUES ('100484', '000400050004', '00040005', '511', '邢台县', '1');
INSERT INTO `region` VALUES ('100485', '000400050005', '00040005', '512', '临城县', '1');
INSERT INTO `region` VALUES ('100486', '000400050006', '00040005', '513', '内丘县', '1');
INSERT INTO `region` VALUES ('100487', '000400050007', '00040005', '514', '柏乡县', '1');
INSERT INTO `region` VALUES ('100488', '000400050008', '00040005', '515', '隆尧县', '1');
INSERT INTO `region` VALUES ('100489', '000400050009', '00040005', '516', '任　县', '1');
INSERT INTO `region` VALUES ('100490', '000400050010', '00040005', '517', '南和县', '1');
INSERT INTO `region` VALUES ('100491', '000400050011', '00040005', '518', '宁晋县', '1');
INSERT INTO `region` VALUES ('100492', '000400050012', '00040005', '519', '巨鹿县', '1');
INSERT INTO `region` VALUES ('100493', '000400050013', '00040005', '520', '新河县', '1');
INSERT INTO `region` VALUES ('100494', '000400050014', '00040005', '521', '广宗县', '1');
INSERT INTO `region` VALUES ('100495', '000400050015', '00040005', '522', '平乡县', '1');
INSERT INTO `region` VALUES ('100496', '000400050016', '00040005', '523', '威　县', '1');
INSERT INTO `region` VALUES ('100497', '000400050017', '00040005', '524', '清河县', '1');
INSERT INTO `region` VALUES ('100498', '000400050018', '00040005', '525', '临西县', '1');
INSERT INTO `region` VALUES ('100499', '000400050019', '00040005', '526', '南宫市', '1');
INSERT INTO `region` VALUES ('100500', '000400050020', '00040005', '527', '沙河市', '1');
INSERT INTO `region` VALUES ('100501', '000400060001', '00040006', '528', '市辖区', '1');
INSERT INTO `region` VALUES ('100502', '000400060002', '00040006', '529', '新市区', '1');
INSERT INTO `region` VALUES ('100503', '000400060003', '00040006', '530', '北市区', '1');
INSERT INTO `region` VALUES ('100504', '000400060004', '00040006', '531', '南市区', '1');
INSERT INTO `region` VALUES ('100505', '000400060005', '00040006', '532', '满城县', '1');
INSERT INTO `region` VALUES ('100506', '000400060006', '00040006', '533', '清苑县', '1');
INSERT INTO `region` VALUES ('100507', '000400060007', '00040006', '534', '涞水县', '1');
INSERT INTO `region` VALUES ('100508', '000400060008', '00040006', '535', '阜平县', '1');
INSERT INTO `region` VALUES ('100509', '000400060009', '00040006', '536', '徐水县', '1');
INSERT INTO `region` VALUES ('100510', '000400060010', '00040006', '537', '定兴县', '1');
INSERT INTO `region` VALUES ('100511', '000400060011', '00040006', '538', '唐　县', '1');
INSERT INTO `region` VALUES ('100512', '000400060012', '00040006', '539', '高阳县', '1');
INSERT INTO `region` VALUES ('100513', '000400060013', '00040006', '540', '容城县', '1');
INSERT INTO `region` VALUES ('100514', '000400060014', '00040006', '541', '涞源县', '1');
INSERT INTO `region` VALUES ('100515', '000400060015', '00040006', '542', '望都县', '1');
INSERT INTO `region` VALUES ('100516', '000400060016', '00040006', '543', '安新县', '1');
INSERT INTO `region` VALUES ('100517', '000400060017', '00040006', '544', '易　县', '1');
INSERT INTO `region` VALUES ('100518', '000400060018', '00040006', '545', '曲阳县', '1');
INSERT INTO `region` VALUES ('100519', '000400060019', '00040006', '546', '蠡　县', '1');
INSERT INTO `region` VALUES ('100520', '000400060020', '00040006', '547', '顺平县', '1');
INSERT INTO `region` VALUES ('100521', '000400060021', '00040006', '548', '博野县', '1');
INSERT INTO `region` VALUES ('100522', '000400060022', '00040006', '549', '雄　县', '1');
INSERT INTO `region` VALUES ('100523', '000400060023', '00040006', '550', '涿州市', '1');
INSERT INTO `region` VALUES ('100524', '000400060024', '00040006', '551', '定州市', '1');
INSERT INTO `region` VALUES ('100525', '000400060025', '00040006', '552', '安国市', '1');
INSERT INTO `region` VALUES ('100526', '000400060026', '00040006', '553', '高碑店市', '1');
INSERT INTO `region` VALUES ('100527', '000400070001', '00040007', '554', '市辖区', '1');
INSERT INTO `region` VALUES ('100528', '000400070002', '00040007', '555', '桥东区', '1');
INSERT INTO `region` VALUES ('100529', '000400070003', '00040007', '556', '桥西区', '1');
INSERT INTO `region` VALUES ('100530', '000400070004', '00040007', '557', '宣化区', '1');
INSERT INTO `region` VALUES ('100531', '000400070005', '00040007', '558', '下花园区', '1');
INSERT INTO `region` VALUES ('100532', '000400070006', '00040007', '559', '宣化县', '1');
INSERT INTO `region` VALUES ('100533', '000400070007', '00040007', '560', '张北县', '1');
INSERT INTO `region` VALUES ('100534', '000400070008', '00040007', '561', '康保县', '1');
INSERT INTO `region` VALUES ('100535', '000400070009', '00040007', '562', '沽源县', '1');
INSERT INTO `region` VALUES ('100536', '000400070010', '00040007', '563', '尚义县', '1');
INSERT INTO `region` VALUES ('100537', '000400070011', '00040007', '564', '蔚　县', '1');
INSERT INTO `region` VALUES ('100538', '000400070012', '00040007', '565', '阳原县', '1');
INSERT INTO `region` VALUES ('100539', '000400070013', '00040007', '566', '怀安县', '1');
INSERT INTO `region` VALUES ('100540', '000400070014', '00040007', '567', '万全县', '1');
INSERT INTO `region` VALUES ('100541', '000400070015', '00040007', '568', '怀来县', '1');
INSERT INTO `region` VALUES ('100542', '000400070016', '00040007', '569', '涿鹿县', '1');
INSERT INTO `region` VALUES ('100543', '000400070017', '00040007', '570', '赤城县', '1');
INSERT INTO `region` VALUES ('100544', '000400070018', '00040007', '571', '崇礼县', '1');
INSERT INTO `region` VALUES ('100545', '000400080001', '00040008', '572', '市辖区', '1');
INSERT INTO `region` VALUES ('100546', '000400080002', '00040008', '573', '双桥区', '1');
INSERT INTO `region` VALUES ('100547', '000400080003', '00040008', '574', '双滦区', '1');
INSERT INTO `region` VALUES ('100548', '000400080004', '00040008', '575', '鹰手营子矿区', '1');
INSERT INTO `region` VALUES ('100549', '000400080005', '00040008', '576', '承德县', '1');
INSERT INTO `region` VALUES ('100550', '000400080006', '00040008', '577', '兴隆县', '1');
INSERT INTO `region` VALUES ('100551', '000400080007', '00040008', '578', '平泉县', '1');
INSERT INTO `region` VALUES ('100552', '000400080008', '00040008', '579', '滦平县', '1');
INSERT INTO `region` VALUES ('100553', '000400080009', '00040008', '580', '隆化县', '1');
INSERT INTO `region` VALUES ('100554', '000400080010', '00040008', '581', '丰宁满族自治县', '1');
INSERT INTO `region` VALUES ('100555', '000400080011', '00040008', '582', '宽城满族自治县', '1');
INSERT INTO `region` VALUES ('100556', '000400080012', '00040008', '583', '围场满族蒙古族自治县', '1');
INSERT INTO `region` VALUES ('100557', '000400090001', '00040009', '584', '市辖区', '1');
INSERT INTO `region` VALUES ('100558', '000400090002', '00040009', '585', '新华区', '1');
INSERT INTO `region` VALUES ('100559', '000400090003', '00040009', '586', '运河区', '1');
INSERT INTO `region` VALUES ('100560', '000400090004', '00040009', '587', '沧　县', '1');
INSERT INTO `region` VALUES ('100561', '000400090005', '00040009', '588', '青　县', '1');
INSERT INTO `region` VALUES ('100562', '000400090006', '00040009', '589', '东光县', '1');
INSERT INTO `region` VALUES ('100563', '000400090007', '00040009', '590', '海兴县', '1');
INSERT INTO `region` VALUES ('100564', '000400090008', '00040009', '591', '盐山县', '1');
INSERT INTO `region` VALUES ('100565', '000400090009', '00040009', '592', '肃宁县', '1');
INSERT INTO `region` VALUES ('100566', '000400090010', '00040009', '593', '南皮县', '1');
INSERT INTO `region` VALUES ('100567', '000400090011', '00040009', '594', '吴桥县', '1');
INSERT INTO `region` VALUES ('100568', '000400090012', '00040009', '595', '献　县', '1');
INSERT INTO `region` VALUES ('100569', '000400090013', '00040009', '596', '孟村回族自治县', '1');
INSERT INTO `region` VALUES ('100570', '000400090014', '00040009', '597', '泊头市', '1');
INSERT INTO `region` VALUES ('100571', '000400090015', '00040009', '598', '任丘市', '1');
INSERT INTO `region` VALUES ('100572', '000400090016', '00040009', '599', '黄骅市', '1');
INSERT INTO `region` VALUES ('100573', '000400090017', '00040009', '600', '河间市', '1');
INSERT INTO `region` VALUES ('100574', '000400100001', '00040010', '601', '市辖区', '1');
INSERT INTO `region` VALUES ('100575', '000400100002', '00040010', '602', '安次区', '1');
INSERT INTO `region` VALUES ('100576', '000400100003', '00040010', '603', '广阳区', '1');
INSERT INTO `region` VALUES ('100577', '000400100004', '00040010', '604', '固安县', '1');
INSERT INTO `region` VALUES ('100578', '000400100005', '00040010', '605', '永清县', '1');
INSERT INTO `region` VALUES ('100579', '000400100006', '00040010', '606', '香河县', '1');
INSERT INTO `region` VALUES ('100580', '000400100007', '00040010', '607', '大城县', '1');
INSERT INTO `region` VALUES ('100581', '000400100008', '00040010', '608', '文安县', '1');
INSERT INTO `region` VALUES ('100582', '000400100009', '00040010', '609', '大厂回族自治县', '1');
INSERT INTO `region` VALUES ('100583', '000400100010', '00040010', '610', '霸州市', '1');
INSERT INTO `region` VALUES ('100584', '000400100011', '00040010', '611', '三河市', '1');
INSERT INTO `region` VALUES ('100585', '000400110001', '00040011', '612', '市辖区', '1');
INSERT INTO `region` VALUES ('100586', '000400110002', '00040011', '613', '桃城区', '1');
INSERT INTO `region` VALUES ('100587', '000400110003', '00040011', '614', '枣强县', '1');
INSERT INTO `region` VALUES ('100588', '000400110004', '00040011', '615', '武邑县', '1');
INSERT INTO `region` VALUES ('100589', '000400110005', '00040011', '616', '武强县', '1');
INSERT INTO `region` VALUES ('100590', '000400110006', '00040011', '617', '饶阳县', '1');
INSERT INTO `region` VALUES ('100591', '000400110007', '00040011', '618', '安平县', '1');
INSERT INTO `region` VALUES ('100592', '000400110008', '00040011', '619', '故城县', '1');
INSERT INTO `region` VALUES ('100593', '000400110009', '00040011', '620', '景　县', '1');
INSERT INTO `region` VALUES ('100594', '000400110010', '00040011', '621', '阜城县', '1');
INSERT INTO `region` VALUES ('100595', '000400110011', '00040011', '622', '冀州市', '1');
INSERT INTO `region` VALUES ('100596', '000400110012', '00040011', '623', '深州市', '1');
INSERT INTO `region` VALUES ('100597', '000500010001', '00050001', '624', '市辖区', '1');
INSERT INTO `region` VALUES ('100598', '000500010002', '00050001', '625', '小店区', '1');
INSERT INTO `region` VALUES ('100599', '000500010003', '00050001', '626', '迎泽区', '1');
INSERT INTO `region` VALUES ('100600', '000500010004', '00050001', '627', '杏花岭区', '1');
INSERT INTO `region` VALUES ('100601', '000500010005', '00050001', '628', '尖草坪区', '1');
INSERT INTO `region` VALUES ('100602', '000500010006', '00050001', '629', '万柏林区', '1');
INSERT INTO `region` VALUES ('100603', '000500010007', '00050001', '630', '晋源区', '1');
INSERT INTO `region` VALUES ('100604', '000500010008', '00050001', '631', '清徐县', '1');
INSERT INTO `region` VALUES ('100605', '000500010009', '00050001', '632', '阳曲县', '1');
INSERT INTO `region` VALUES ('100606', '000500010010', '00050001', '633', '娄烦县', '1');
INSERT INTO `region` VALUES ('100607', '000500010011', '00050001', '634', '古交市', '1');
INSERT INTO `region` VALUES ('100608', '000500020001', '00050002', '635', '市辖区', '1');
INSERT INTO `region` VALUES ('100609', '000500020002', '00050002', '636', '城　区', '1');
INSERT INTO `region` VALUES ('100610', '000500020003', '00050002', '637', '矿　区', '1');
INSERT INTO `region` VALUES ('100611', '000500020004', '00050002', '638', '南郊区', '1');
INSERT INTO `region` VALUES ('100612', '000500020005', '00050002', '639', '新荣区', '1');
INSERT INTO `region` VALUES ('100613', '000500020006', '00050002', '640', '阳高县', '1');
INSERT INTO `region` VALUES ('100614', '000500020007', '00050002', '641', '天镇县', '1');
INSERT INTO `region` VALUES ('100615', '000500020008', '00050002', '642', '广灵县', '1');
INSERT INTO `region` VALUES ('100616', '000500020009', '00050002', '643', '灵丘县', '1');
INSERT INTO `region` VALUES ('100617', '000500020010', '00050002', '644', '浑源县', '1');
INSERT INTO `region` VALUES ('100618', '000500020011', '00050002', '645', '左云县', '1');
INSERT INTO `region` VALUES ('100619', '000500020012', '00050002', '646', '大同县', '1');
INSERT INTO `region` VALUES ('100620', '000500030001', '00050003', '647', '市辖区', '1');
INSERT INTO `region` VALUES ('100621', '000500030002', '00050003', '648', '城　区', '1');
INSERT INTO `region` VALUES ('100622', '000500030003', '00050003', '649', '矿　区', '1');
INSERT INTO `region` VALUES ('100623', '000500030004', '00050003', '650', '郊　区', '1');
INSERT INTO `region` VALUES ('100624', '000500030005', '00050003', '651', '平定县', '1');
INSERT INTO `region` VALUES ('100625', '000500030006', '00050003', '652', '盂　县', '1');
INSERT INTO `region` VALUES ('100626', '000500040001', '00050004', '653', '市辖区', '1');
INSERT INTO `region` VALUES ('100627', '000500040002', '00050004', '654', '城　区', '1');
INSERT INTO `region` VALUES ('100628', '000500040003', '00050004', '655', '郊　区', '1');
INSERT INTO `region` VALUES ('100629', '000500040004', '00050004', '656', '长治县', '1');
INSERT INTO `region` VALUES ('100630', '000500040005', '00050004', '657', '襄垣县', '1');
INSERT INTO `region` VALUES ('100631', '000500040006', '00050004', '658', '屯留县', '1');
INSERT INTO `region` VALUES ('100632', '000500040007', '00050004', '659', '平顺县', '1');
INSERT INTO `region` VALUES ('100633', '000500040008', '00050004', '660', '黎城县', '1');
INSERT INTO `region` VALUES ('100634', '000500040009', '00050004', '661', '壶关县', '1');
INSERT INTO `region` VALUES ('100635', '000500040010', '00050004', '662', '长子县', '1');
INSERT INTO `region` VALUES ('100636', '000500040011', '00050004', '663', '武乡县', '1');
INSERT INTO `region` VALUES ('100637', '000500040012', '00050004', '664', '沁　县', '1');
INSERT INTO `region` VALUES ('100638', '000500040013', '00050004', '665', '沁源县', '1');
INSERT INTO `region` VALUES ('100639', '000500040014', '00050004', '666', '潞城市', '1');
INSERT INTO `region` VALUES ('100640', '000500050001', '00050005', '667', '市辖区', '1');
INSERT INTO `region` VALUES ('100641', '000500050002', '00050005', '668', '城　区', '1');
INSERT INTO `region` VALUES ('100642', '000500050003', '00050005', '669', '沁水县', '1');
INSERT INTO `region` VALUES ('100643', '000500050004', '00050005', '670', '阳城县', '1');
INSERT INTO `region` VALUES ('100644', '000500050005', '00050005', '671', '陵川县', '1');
INSERT INTO `region` VALUES ('100645', '000500050006', '00050005', '672', '泽州县', '1');
INSERT INTO `region` VALUES ('100646', '000500050007', '00050005', '673', '高平市', '1');
INSERT INTO `region` VALUES ('100647', '000500060001', '00050006', '674', '市辖区', '1');
INSERT INTO `region` VALUES ('100648', '000500060002', '00050006', '675', '朔城区', '1');
INSERT INTO `region` VALUES ('100649', '000500060003', '00050006', '676', '平鲁区', '1');
INSERT INTO `region` VALUES ('100650', '000500060004', '00050006', '677', '山阴县', '1');
INSERT INTO `region` VALUES ('100651', '000500060005', '00050006', '678', '应　县', '1');
INSERT INTO `region` VALUES ('100652', '000500060006', '00050006', '679', '右玉县', '1');
INSERT INTO `region` VALUES ('100653', '000500060007', '00050006', '680', '怀仁县', '1');
INSERT INTO `region` VALUES ('100654', '000500070001', '00050007', '681', '市辖区', '1');
INSERT INTO `region` VALUES ('100655', '000500070002', '00050007', '682', '榆次区', '1');
INSERT INTO `region` VALUES ('100656', '000500070003', '00050007', '683', '榆社县', '1');
INSERT INTO `region` VALUES ('100657', '000500070004', '00050007', '684', '左权县', '1');
INSERT INTO `region` VALUES ('100658', '000500070005', '00050007', '685', '和顺县', '1');
INSERT INTO `region` VALUES ('100659', '000500070006', '00050007', '686', '昔阳县', '1');
INSERT INTO `region` VALUES ('100660', '000500070007', '00050007', '687', '寿阳县', '1');
INSERT INTO `region` VALUES ('100661', '000500070008', '00050007', '688', '太谷县', '1');
INSERT INTO `region` VALUES ('100662', '000500070009', '00050007', '689', '祁　县', '1');
INSERT INTO `region` VALUES ('100663', '000500070010', '00050007', '690', '平遥县', '1');
INSERT INTO `region` VALUES ('100664', '000500070011', '00050007', '691', '灵石县', '1');
INSERT INTO `region` VALUES ('100665', '000500070012', '00050007', '692', '介休市', '1');
INSERT INTO `region` VALUES ('100666', '000500080001', '00050008', '693', '市辖区', '1');
INSERT INTO `region` VALUES ('100667', '000500080002', '00050008', '694', '盐湖区', '1');
INSERT INTO `region` VALUES ('100668', '000500080003', '00050008', '695', '临猗县', '1');
INSERT INTO `region` VALUES ('100669', '000500080004', '00050008', '696', '万荣县', '1');
INSERT INTO `region` VALUES ('100670', '000500080005', '00050008', '697', '闻喜县', '1');
INSERT INTO `region` VALUES ('100671', '000500080006', '00050008', '698', '稷山县', '1');
INSERT INTO `region` VALUES ('100672', '000500080007', '00050008', '699', '新绛县', '1');
INSERT INTO `region` VALUES ('100673', '000500080008', '00050008', '700', '绛　县', '1');
INSERT INTO `region` VALUES ('100674', '000500080009', '00050008', '701', '垣曲县', '1');
INSERT INTO `region` VALUES ('100675', '000500080010', '00050008', '702', '夏　县', '1');
INSERT INTO `region` VALUES ('100676', '000500080011', '00050008', '703', '平陆县', '1');
INSERT INTO `region` VALUES ('100677', '000500080012', '00050008', '704', '芮城县', '1');
INSERT INTO `region` VALUES ('100678', '000500080013', '00050008', '705', '永济市', '1');
INSERT INTO `region` VALUES ('100679', '000500080014', '00050008', '706', '河津市', '1');
INSERT INTO `region` VALUES ('100680', '000500090001', '00050009', '707', '市辖区', '1');
INSERT INTO `region` VALUES ('100681', '000500090002', '00050009', '708', '忻府区', '1');
INSERT INTO `region` VALUES ('100682', '000500090003', '00050009', '709', '定襄县', '1');
INSERT INTO `region` VALUES ('100683', '000500090004', '00050009', '710', '五台县', '1');
INSERT INTO `region` VALUES ('100684', '000500090005', '00050009', '711', '代　县', '1');
INSERT INTO `region` VALUES ('100685', '000500090006', '00050009', '712', '繁峙县', '1');
INSERT INTO `region` VALUES ('100686', '000500090007', '00050009', '713', '宁武县', '1');
INSERT INTO `region` VALUES ('100687', '000500090008', '00050009', '714', '静乐县', '1');
INSERT INTO `region` VALUES ('100688', '000500090009', '00050009', '715', '神池县', '1');
INSERT INTO `region` VALUES ('100689', '000500090010', '00050009', '716', '五寨县', '1');
INSERT INTO `region` VALUES ('100690', '000500090011', '00050009', '717', '岢岚县', '1');
INSERT INTO `region` VALUES ('100691', '000500090012', '00050009', '718', '河曲县', '1');
INSERT INTO `region` VALUES ('100692', '000500090013', '00050009', '719', '保德县', '1');
INSERT INTO `region` VALUES ('100693', '000500090014', '00050009', '720', '偏关县', '1');
INSERT INTO `region` VALUES ('100694', '000500090015', '00050009', '721', '原平市', '1');
INSERT INTO `region` VALUES ('100695', '000500100001', '00050010', '722', '市辖区', '1');
INSERT INTO `region` VALUES ('100696', '000500100002', '00050010', '723', '尧都区', '1');
INSERT INTO `region` VALUES ('100697', '000500100003', '00050010', '724', '曲沃县', '1');
INSERT INTO `region` VALUES ('100698', '000500100004', '00050010', '725', '翼城县', '1');
INSERT INTO `region` VALUES ('100699', '000500100005', '00050010', '726', '襄汾县', '1');
INSERT INTO `region` VALUES ('100700', '000500100006', '00050010', '727', '洪洞县', '1');
INSERT INTO `region` VALUES ('100701', '000500100007', '00050010', '728', '古　县', '1');
INSERT INTO `region` VALUES ('100702', '000500100008', '00050010', '729', '安泽县', '1');
INSERT INTO `region` VALUES ('100703', '000500100009', '00050010', '730', '浮山县', '1');
INSERT INTO `region` VALUES ('100704', '000500100010', '00050010', '731', '吉　县', '1');
INSERT INTO `region` VALUES ('100705', '000500100011', '00050010', '732', '乡宁县', '1');
INSERT INTO `region` VALUES ('100706', '000500100012', '00050010', '733', '大宁县', '1');
INSERT INTO `region` VALUES ('100707', '000500100013', '00050010', '734', '隰　县', '1');
INSERT INTO `region` VALUES ('100708', '000500100014', '00050010', '735', '永和县', '1');
INSERT INTO `region` VALUES ('100709', '000500100015', '00050010', '736', '蒲　县', '1');
INSERT INTO `region` VALUES ('100710', '000500100016', '00050010', '737', '汾西县', '1');
INSERT INTO `region` VALUES ('100711', '000500100017', '00050010', '738', '侯马市', '1');
INSERT INTO `region` VALUES ('100712', '000500100018', '00050010', '739', '霍州市', '1');
INSERT INTO `region` VALUES ('100713', '000500110001', '00050011', '740', '市辖区', '1');
INSERT INTO `region` VALUES ('100714', '000500110002', '00050011', '741', '离石区', '1');
INSERT INTO `region` VALUES ('100715', '000500110003', '00050011', '742', '文水县', '1');
INSERT INTO `region` VALUES ('100716', '000500110004', '00050011', '743', '交城县', '1');
INSERT INTO `region` VALUES ('100717', '000500110005', '00050011', '744', '兴　县', '1');
INSERT INTO `region` VALUES ('100718', '000500110006', '00050011', '745', '临　县', '1');
INSERT INTO `region` VALUES ('100719', '000500110007', '00050011', '746', '柳林县', '1');
INSERT INTO `region` VALUES ('100720', '000500110008', '00050011', '747', '石楼县', '1');
INSERT INTO `region` VALUES ('100721', '000500110009', '00050011', '748', '岚　县', '1');
INSERT INTO `region` VALUES ('100722', '000500110010', '00050011', '749', '方山县', '1');
INSERT INTO `region` VALUES ('100723', '000500110011', '00050011', '750', '中阳县', '1');
INSERT INTO `region` VALUES ('100724', '000500110012', '00050011', '751', '交口县', '1');
INSERT INTO `region` VALUES ('100725', '000500110013', '00050011', '752', '孝义市', '1');
INSERT INTO `region` VALUES ('100726', '000500110014', '00050011', '753', '汾阳市', '1');
INSERT INTO `region` VALUES ('100727', '000600010001', '00060001', '754', '市辖区', '1');
INSERT INTO `region` VALUES ('100728', '000600010002', '00060001', '755', '新城区', '1');
INSERT INTO `region` VALUES ('100729', '000600010003', '00060001', '756', '回民区', '1');
INSERT INTO `region` VALUES ('100730', '000600010004', '00060001', '757', '玉泉区', '1');
INSERT INTO `region` VALUES ('100731', '000600010005', '00060001', '758', '赛罕区', '1');
INSERT INTO `region` VALUES ('100732', '000600010006', '00060001', '759', '土默特左旗', '1');
INSERT INTO `region` VALUES ('100733', '000600010007', '00060001', '760', '托克托县', '1');
INSERT INTO `region` VALUES ('100734', '000600010008', '00060001', '761', '和林格尔县', '1');
INSERT INTO `region` VALUES ('100735', '000600010009', '00060001', '762', '清水河县', '1');
INSERT INTO `region` VALUES ('100736', '000600010010', '00060001', '763', '武川县', '1');
INSERT INTO `region` VALUES ('100737', '000600020001', '00060002', '764', '市辖区', '1');
INSERT INTO `region` VALUES ('100738', '000600020002', '00060002', '765', '东河区', '1');
INSERT INTO `region` VALUES ('100739', '000600020003', '00060002', '766', '昆都仑区', '1');
INSERT INTO `region` VALUES ('100740', '000600020004', '00060002', '767', '青山区', '1');
INSERT INTO `region` VALUES ('100741', '000600020005', '00060002', '768', '石拐区', '1');
INSERT INTO `region` VALUES ('100742', '000600020006', '00060002', '769', '白云矿区', '1');
INSERT INTO `region` VALUES ('100743', '000600020007', '00060002', '770', '九原区', '1');
INSERT INTO `region` VALUES ('100744', '000600020008', '00060002', '771', '土默特右旗', '1');
INSERT INTO `region` VALUES ('100745', '000600020009', '00060002', '772', '固阳县', '1');
INSERT INTO `region` VALUES ('100746', '000600020010', '00060002', '773', '达尔罕茂明安联合旗', '1');
INSERT INTO `region` VALUES ('100747', '000600030001', '00060003', '774', '市辖区', '1');
INSERT INTO `region` VALUES ('100748', '000600030002', '00060003', '775', '海勃湾区', '1');
INSERT INTO `region` VALUES ('100749', '000600030003', '00060003', '776', '海南区', '1');
INSERT INTO `region` VALUES ('100750', '000600030004', '00060003', '777', '乌达区', '1');
INSERT INTO `region` VALUES ('100751', '000600040001', '00060004', '778', '市辖区', '1');
INSERT INTO `region` VALUES ('100752', '000600040002', '00060004', '779', '红山区', '1');
INSERT INTO `region` VALUES ('100753', '000600040003', '00060004', '780', '元宝山区', '1');
INSERT INTO `region` VALUES ('100754', '000600040004', '00060004', '781', '松山区', '1');
INSERT INTO `region` VALUES ('100755', '000600040005', '00060004', '782', '阿鲁科尔沁旗', '1');
INSERT INTO `region` VALUES ('100756', '000600040006', '00060004', '783', '巴林左旗', '1');
INSERT INTO `region` VALUES ('100757', '000600040007', '00060004', '784', '巴林右旗', '1');
INSERT INTO `region` VALUES ('100758', '000600040008', '00060004', '785', '林西县', '1');
INSERT INTO `region` VALUES ('100759', '000600040009', '00060004', '786', '克什克腾旗', '1');
INSERT INTO `region` VALUES ('100760', '000600040010', '00060004', '787', '翁牛特旗', '1');
INSERT INTO `region` VALUES ('100761', '000600040011', '00060004', '788', '喀喇沁旗', '1');
INSERT INTO `region` VALUES ('100762', '000600040012', '00060004', '789', '宁城县', '1');
INSERT INTO `region` VALUES ('100763', '000600040013', '00060004', '790', '敖汉旗', '1');
INSERT INTO `region` VALUES ('100764', '000600050001', '00060005', '791', '市辖区', '1');
INSERT INTO `region` VALUES ('100765', '000600050002', '00060005', '792', '科尔沁区', '1');
INSERT INTO `region` VALUES ('100766', '000600050003', '00060005', '793', '科尔沁左翼中旗', '1');
INSERT INTO `region` VALUES ('100767', '000600050004', '00060005', '794', '科尔沁左翼后旗', '1');
INSERT INTO `region` VALUES ('100768', '000600050005', '00060005', '795', '开鲁县', '1');
INSERT INTO `region` VALUES ('100769', '000600050006', '00060005', '796', '库伦旗', '1');
INSERT INTO `region` VALUES ('100770', '000600050007', '00060005', '797', '奈曼旗', '1');
INSERT INTO `region` VALUES ('100771', '000600050008', '00060005', '798', '扎鲁特旗', '1');
INSERT INTO `region` VALUES ('100772', '000600050009', '00060005', '799', '霍林郭勒市', '1');
INSERT INTO `region` VALUES ('100773', '000600060001', '00060006', '800', '东胜区', '1');
INSERT INTO `region` VALUES ('100774', '000600060002', '00060006', '801', '达拉特旗', '1');
INSERT INTO `region` VALUES ('100775', '000600060003', '00060006', '802', '准格尔旗', '1');
INSERT INTO `region` VALUES ('100776', '000600060004', '00060006', '803', '鄂托克前旗', '1');
INSERT INTO `region` VALUES ('100777', '000600060005', '00060006', '804', '鄂托克旗', '1');
INSERT INTO `region` VALUES ('100778', '000600060006', '00060006', '805', '杭锦旗', '1');
INSERT INTO `region` VALUES ('100779', '000600060007', '00060006', '806', '乌审旗', '1');
INSERT INTO `region` VALUES ('100780', '000600060008', '00060006', '807', '伊金霍洛旗', '1');
INSERT INTO `region` VALUES ('100781', '000600070001', '00060007', '808', '市辖区', '1');
INSERT INTO `region` VALUES ('100782', '000600070002', '00060007', '809', '海拉尔区', '1');
INSERT INTO `region` VALUES ('100783', '000600070003', '00060007', '810', '阿荣旗', '1');
INSERT INTO `region` VALUES ('100784', '000600070004', '00060007', '811', '莫力达瓦达斡尔族自治旗', '1');
INSERT INTO `region` VALUES ('100785', '000600070005', '00060007', '812', '鄂伦春自治旗', '1');
INSERT INTO `region` VALUES ('100786', '000600070006', '00060007', '813', '鄂温克族自治旗', '1');
INSERT INTO `region` VALUES ('100787', '000600070007', '00060007', '814', '陈巴尔虎旗', '1');
INSERT INTO `region` VALUES ('100788', '000600070008', '00060007', '815', '新巴尔虎左旗', '1');
INSERT INTO `region` VALUES ('100789', '000600070009', '00060007', '816', '新巴尔虎右旗', '1');
INSERT INTO `region` VALUES ('100790', '000600070010', '00060007', '817', '满洲里市', '1');
INSERT INTO `region` VALUES ('100791', '000600070011', '00060007', '818', '牙克石市', '1');
INSERT INTO `region` VALUES ('100792', '000600070012', '00060007', '819', '扎兰屯市', '1');
INSERT INTO `region` VALUES ('100793', '000600070013', '00060007', '820', '额尔古纳市', '1');
INSERT INTO `region` VALUES ('100794', '000600070014', '00060007', '821', '根河市', '1');
INSERT INTO `region` VALUES ('100795', '000600080001', '00060008', '822', '市辖区', '1');
INSERT INTO `region` VALUES ('100796', '000600080002', '00060008', '823', '临河区', '1');
INSERT INTO `region` VALUES ('100797', '000600080003', '00060008', '824', '五原县', '1');
INSERT INTO `region` VALUES ('100798', '000600080004', '00060008', '825', '磴口县', '1');
INSERT INTO `region` VALUES ('100799', '000600080005', '00060008', '826', '乌拉特前旗', '1');
INSERT INTO `region` VALUES ('100800', '000600080006', '00060008', '827', '乌拉特中旗', '1');
INSERT INTO `region` VALUES ('100801', '000600080007', '00060008', '828', '乌拉特后旗', '1');
INSERT INTO `region` VALUES ('100802', '000600080008', '00060008', '829', '杭锦后旗', '1');
INSERT INTO `region` VALUES ('100803', '000600090001', '00060009', '830', '市辖区', '1');
INSERT INTO `region` VALUES ('100804', '000600090002', '00060009', '831', '集宁区', '1');
INSERT INTO `region` VALUES ('100805', '000600090003', '00060009', '832', '卓资县', '1');
INSERT INTO `region` VALUES ('100806', '000600090004', '00060009', '833', '化德县', '1');
INSERT INTO `region` VALUES ('100807', '000600090005', '00060009', '834', '商都县', '1');
INSERT INTO `region` VALUES ('100808', '000600090006', '00060009', '835', '兴和县', '1');
INSERT INTO `region` VALUES ('100809', '000600090007', '00060009', '836', '凉城县', '1');
INSERT INTO `region` VALUES ('100810', '000600090008', '00060009', '837', '察哈尔右翼前旗', '1');
INSERT INTO `region` VALUES ('100811', '000600090009', '00060009', '838', '察哈尔右翼中旗', '1');
INSERT INTO `region` VALUES ('100812', '000600090010', '00060009', '839', '察哈尔右翼后旗', '1');
INSERT INTO `region` VALUES ('100813', '000600090011', '00060009', '840', '四子王旗', '1');
INSERT INTO `region` VALUES ('100814', '000600090012', '00060009', '841', '丰镇市', '1');
INSERT INTO `region` VALUES ('100815', '000600100001', '00060010', '842', '乌兰浩特市', '1');
INSERT INTO `region` VALUES ('100816', '000600100002', '00060010', '843', '阿尔山市', '1');
INSERT INTO `region` VALUES ('100817', '000600100003', '00060010', '844', '科尔沁右翼前旗', '1');
INSERT INTO `region` VALUES ('100818', '000600100004', '00060010', '845', '科尔沁右翼中旗', '1');
INSERT INTO `region` VALUES ('100819', '000600100005', '00060010', '846', '扎赉特旗', '1');
INSERT INTO `region` VALUES ('100820', '000600100006', '00060010', '847', '突泉县', '1');
INSERT INTO `region` VALUES ('100821', '000600110001', '00060011', '848', '二连浩特市', '1');
INSERT INTO `region` VALUES ('100822', '000600110002', '00060011', '849', '锡林浩特市', '1');
INSERT INTO `region` VALUES ('100823', '000600110003', '00060011', '850', '阿巴嘎旗', '1');
INSERT INTO `region` VALUES ('100824', '000600110004', '00060011', '851', '苏尼特左旗', '1');
INSERT INTO `region` VALUES ('100825', '000600110005', '00060011', '852', '苏尼特右旗', '1');
INSERT INTO `region` VALUES ('100826', '000600110006', '00060011', '853', '东乌珠穆沁旗', '1');
INSERT INTO `region` VALUES ('100827', '000600110007', '00060011', '854', '西乌珠穆沁旗', '1');
INSERT INTO `region` VALUES ('100828', '000600110008', '00060011', '855', '太仆寺旗', '1');
INSERT INTO `region` VALUES ('100829', '000600110009', '00060011', '856', '镶黄旗', '1');
INSERT INTO `region` VALUES ('100830', '000600110010', '00060011', '857', '正镶白旗', '1');
INSERT INTO `region` VALUES ('100831', '000600110011', '00060011', '858', '正蓝旗', '1');
INSERT INTO `region` VALUES ('100832', '000600110012', '00060011', '859', '多伦县', '1');
INSERT INTO `region` VALUES ('100833', '000600110013', '00060011', '860', '阿拉善左旗', '1');
INSERT INTO `region` VALUES ('100834', '000600110014', '00060011', '861', '阿拉善右旗', '1');
INSERT INTO `region` VALUES ('100835', '000600110015', '00060011', '862', '额济纳旗', '1');
INSERT INTO `region` VALUES ('100836', '000700010001', '00070001', '863', '市辖区', '1');
INSERT INTO `region` VALUES ('100837', '000700010002', '00070001', '864', '和平区', '1');
INSERT INTO `region` VALUES ('100838', '000700010003', '00070001', '865', '沈河区', '1');
INSERT INTO `region` VALUES ('100839', '000700010004', '00070001', '866', '大东区', '1');
INSERT INTO `region` VALUES ('100840', '000700010005', '00070001', '867', '皇姑区', '1');
INSERT INTO `region` VALUES ('100841', '000700010006', '00070001', '868', '铁西区', '1');
INSERT INTO `region` VALUES ('100842', '000700010007', '00070001', '869', '苏家屯区', '1');
INSERT INTO `region` VALUES ('100843', '000700010008', '00070001', '870', '东陵区', '1');
INSERT INTO `region` VALUES ('100844', '000700010009', '00070001', '871', '新城子区', '1');
INSERT INTO `region` VALUES ('100845', '000700010010', '00070001', '872', '于洪区', '1');
INSERT INTO `region` VALUES ('100846', '000700010011', '00070001', '873', '辽中县', '1');
INSERT INTO `region` VALUES ('100847', '000700010012', '00070001', '874', '康平县', '1');
INSERT INTO `region` VALUES ('100848', '000700010013', '00070001', '875', '法库县', '1');
INSERT INTO `region` VALUES ('100849', '000700010014', '00070001', '876', '新民市', '1');
INSERT INTO `region` VALUES ('100850', '000700020001', '00070002', '877', '市辖区', '1');
INSERT INTO `region` VALUES ('100851', '000700020002', '00070002', '878', '中山区', '1');
INSERT INTO `region` VALUES ('100852', '000700020003', '00070002', '879', '西岗区', '1');
INSERT INTO `region` VALUES ('100853', '000700020004', '00070002', '880', '沙河口区', '1');
INSERT INTO `region` VALUES ('100854', '000700020005', '00070002', '881', '甘井子区', '1');
INSERT INTO `region` VALUES ('100855', '000700020006', '00070002', '882', '旅顺口区', '1');
INSERT INTO `region` VALUES ('100856', '000700020007', '00070002', '883', '金州区', '1');
INSERT INTO `region` VALUES ('100857', '000700020008', '00070002', '884', '长海县', '1');
INSERT INTO `region` VALUES ('100858', '000700020009', '00070002', '885', '瓦房店市', '1');
INSERT INTO `region` VALUES ('100859', '000700020010', '00070002', '886', '普兰店市', '1');
INSERT INTO `region` VALUES ('100860', '000700020011', '00070002', '887', '庄河市', '1');
INSERT INTO `region` VALUES ('100861', '000700030001', '00070003', '888', '市辖区', '1');
INSERT INTO `region` VALUES ('100862', '000700030002', '00070003', '889', '铁东区', '1');
INSERT INTO `region` VALUES ('100863', '000700030003', '00070003', '890', '铁西区', '1');
INSERT INTO `region` VALUES ('100864', '000700030004', '00070003', '891', '立山区', '1');
INSERT INTO `region` VALUES ('100865', '000700030005', '00070003', '892', '千山区', '1');
INSERT INTO `region` VALUES ('100866', '000700030006', '00070003', '893', '台安县', '1');
INSERT INTO `region` VALUES ('100867', '000700030007', '00070003', '894', '岫岩满族自治县', '1');
INSERT INTO `region` VALUES ('100868', '000700030008', '00070003', '895', '海城市', '1');
INSERT INTO `region` VALUES ('100869', '000700040001', '00070004', '896', '市辖区', '1');
INSERT INTO `region` VALUES ('100870', '000700040002', '00070004', '897', '新抚区', '1');
INSERT INTO `region` VALUES ('100871', '000700040003', '00070004', '898', '东洲区', '1');
INSERT INTO `region` VALUES ('100872', '000700040004', '00070004', '899', '望花区', '1');
INSERT INTO `region` VALUES ('100873', '000700040005', '00070004', '900', '顺城区', '1');
INSERT INTO `region` VALUES ('100874', '000700040006', '00070004', '901', '抚顺县', '1');
INSERT INTO `region` VALUES ('100875', '000700040007', '00070004', '902', '新宾满族自治县', '1');
INSERT INTO `region` VALUES ('100876', '000700040008', '00070004', '903', '清原满族自治县', '1');
INSERT INTO `region` VALUES ('100877', '000700050001', '00070005', '904', '市辖区', '1');
INSERT INTO `region` VALUES ('100878', '000700050002', '00070005', '905', '平山区', '1');
INSERT INTO `region` VALUES ('100879', '000700050003', '00070005', '906', '溪湖区', '1');
INSERT INTO `region` VALUES ('100880', '000700050004', '00070005', '907', '明山区', '1');
INSERT INTO `region` VALUES ('100881', '000700050005', '00070005', '908', '南芬区', '1');
INSERT INTO `region` VALUES ('100882', '000700050006', '00070005', '909', '本溪满族自治县', '1');
INSERT INTO `region` VALUES ('100883', '000700050007', '00070005', '910', '桓仁满族自治县', '1');
INSERT INTO `region` VALUES ('100884', '000700060001', '00070006', '911', '市辖区', '1');
INSERT INTO `region` VALUES ('100885', '000700060002', '00070006', '912', '元宝区', '1');
INSERT INTO `region` VALUES ('100886', '000700060003', '00070006', '913', '振兴区', '1');
INSERT INTO `region` VALUES ('100887', '000700060004', '00070006', '914', '振安区', '1');
INSERT INTO `region` VALUES ('100888', '000700060005', '00070006', '915', '宽甸满族自治县', '1');
INSERT INTO `region` VALUES ('100889', '000700060006', '00070006', '916', '东港市', '1');
INSERT INTO `region` VALUES ('100890', '000700060007', '00070006', '917', '凤城市', '1');
INSERT INTO `region` VALUES ('100891', '000700070001', '00070007', '918', '市辖区', '1');
INSERT INTO `region` VALUES ('100892', '000700070002', '00070007', '919', '古塔区', '1');
INSERT INTO `region` VALUES ('100893', '000700070003', '00070007', '920', '凌河区', '1');
INSERT INTO `region` VALUES ('100894', '000700070004', '00070007', '921', '太和区', '1');
INSERT INTO `region` VALUES ('100895', '000700070005', '00070007', '922', '黑山县', '1');
INSERT INTO `region` VALUES ('100896', '000700070006', '00070007', '923', '义　县', '1');
INSERT INTO `region` VALUES ('100897', '000700070007', '00070007', '924', '凌海市', '1');
INSERT INTO `region` VALUES ('100898', '000700070008', '00070007', '925', '北宁市', '1');
INSERT INTO `region` VALUES ('100899', '000700080001', '00070008', '926', '市辖区', '1');
INSERT INTO `region` VALUES ('100900', '000700080002', '00070008', '927', '站前区', '1');
INSERT INTO `region` VALUES ('100901', '000700080003', '00070008', '928', '西市区', '1');
INSERT INTO `region` VALUES ('100902', '000700080004', '00070008', '929', '鲅鱼圈区', '1');
INSERT INTO `region` VALUES ('100903', '000700080005', '00070008', '930', '老边区', '1');
INSERT INTO `region` VALUES ('100904', '000700080006', '00070008', '931', '盖州市', '1');
INSERT INTO `region` VALUES ('100905', '000700080007', '00070008', '932', '大石桥市', '1');
INSERT INTO `region` VALUES ('100906', '000700090001', '00070009', '933', '市辖区', '1');
INSERT INTO `region` VALUES ('100907', '000700090002', '00070009', '934', '海州区', '1');
INSERT INTO `region` VALUES ('100908', '000700090003', '00070009', '935', '新邱区', '1');
INSERT INTO `region` VALUES ('100909', '000700090004', '00070009', '936', '太平区', '1');
INSERT INTO `region` VALUES ('100910', '000700090005', '00070009', '937', '清河门区', '1');
INSERT INTO `region` VALUES ('100911', '000700090006', '00070009', '938', '细河区', '1');
INSERT INTO `region` VALUES ('100912', '000700090007', '00070009', '939', '阜新蒙古族自治县', '1');
INSERT INTO `region` VALUES ('100913', '000700090008', '00070009', '940', '彰武县', '1');
INSERT INTO `region` VALUES ('100914', '000700100001', '00070010', '941', '市辖区', '1');
INSERT INTO `region` VALUES ('100915', '000700100002', '00070010', '942', '白塔区', '1');
INSERT INTO `region` VALUES ('100916', '000700100003', '00070010', '943', '文圣区', '1');
INSERT INTO `region` VALUES ('100917', '000700100004', '00070010', '944', '宏伟区', '1');
INSERT INTO `region` VALUES ('100918', '000700100005', '00070010', '945', '弓长岭区', '1');
INSERT INTO `region` VALUES ('100919', '000700100006', '00070010', '946', '太子河区', '1');
INSERT INTO `region` VALUES ('100920', '000700100007', '00070010', '947', '辽阳县', '1');
INSERT INTO `region` VALUES ('100921', '000700100008', '00070010', '948', '灯塔市', '1');
INSERT INTO `region` VALUES ('100922', '000700110001', '00070011', '949', '市辖区', '1');
INSERT INTO `region` VALUES ('100923', '000700110002', '00070011', '950', '双台子区', '1');
INSERT INTO `region` VALUES ('100924', '000700110003', '00070011', '951', '兴隆台区', '1');
INSERT INTO `region` VALUES ('100925', '000700110004', '00070011', '952', '大洼县', '1');
INSERT INTO `region` VALUES ('100926', '000700110005', '00070011', '953', '盘山县', '1');
INSERT INTO `region` VALUES ('100927', '000700120001', '00070012', '954', '市辖区', '1');
INSERT INTO `region` VALUES ('100928', '000700120002', '00070012', '955', '银州区', '1');
INSERT INTO `region` VALUES ('100929', '000700120003', '00070012', '956', '清河区', '1');
INSERT INTO `region` VALUES ('100930', '000700120004', '00070012', '957', '铁岭县', '1');
INSERT INTO `region` VALUES ('100931', '000700120005', '00070012', '958', '西丰县', '1');
INSERT INTO `region` VALUES ('100932', '000700120006', '00070012', '959', '昌图县', '1');
INSERT INTO `region` VALUES ('100933', '000700120007', '00070012', '960', '调兵山市', '1');
INSERT INTO `region` VALUES ('100934', '000700120008', '00070012', '961', '开原市', '1');
INSERT INTO `region` VALUES ('100935', '000700130001', '00070013', '962', '市辖区', '1');
INSERT INTO `region` VALUES ('100936', '000700130002', '00070013', '963', '双塔区', '1');
INSERT INTO `region` VALUES ('100937', '000700130003', '00070013', '964', '龙城区', '1');
INSERT INTO `region` VALUES ('100938', '000700130004', '00070013', '965', '朝阳县', '1');
INSERT INTO `region` VALUES ('100939', '000700130005', '00070013', '966', '建平县', '1');
INSERT INTO `region` VALUES ('100940', '000700130006', '00070013', '967', '喀喇沁左翼蒙古族自治县', '1');
INSERT INTO `region` VALUES ('100941', '000700130007', '00070013', '968', '北票市', '1');
INSERT INTO `region` VALUES ('100942', '000700130008', '00070013', '969', '凌源市', '1');
INSERT INTO `region` VALUES ('100943', '000700140001', '00070014', '970', '市辖区', '1');
INSERT INTO `region` VALUES ('100944', '000700140002', '00070014', '971', '连山区', '1');
INSERT INTO `region` VALUES ('100945', '000700140003', '00070014', '972', '龙港区', '1');
INSERT INTO `region` VALUES ('100946', '000700140004', '00070014', '973', '南票区', '1');
INSERT INTO `region` VALUES ('100947', '000700140005', '00070014', '974', '绥中县', '1');
INSERT INTO `region` VALUES ('100948', '000700140006', '00070014', '975', '建昌县', '1');
INSERT INTO `region` VALUES ('100949', '000700140007', '00070014', '976', '兴城市', '1');
INSERT INTO `region` VALUES ('100950', '000800010001', '00080001', '977', '市辖区', '1');
INSERT INTO `region` VALUES ('100951', '000800010002', '00080001', '978', '南关区', '1');
INSERT INTO `region` VALUES ('100952', '000800010003', '00080001', '979', '宽城区', '1');
INSERT INTO `region` VALUES ('100953', '000800010004', '00080001', '980', '朝阳区', '1');
INSERT INTO `region` VALUES ('100954', '000800010005', '00080001', '981', '二道区', '1');
INSERT INTO `region` VALUES ('100955', '000800010006', '00080001', '982', '绿园区', '1');
INSERT INTO `region` VALUES ('100956', '000800010007', '00080001', '983', '双阳区', '1');
INSERT INTO `region` VALUES ('100957', '000800010008', '00080001', '984', '农安县', '1');
INSERT INTO `region` VALUES ('100958', '000800010009', '00080001', '985', '九台市', '1');
INSERT INTO `region` VALUES ('100959', '000800010010', '00080001', '986', '榆树市', '1');
INSERT INTO `region` VALUES ('100960', '000800010011', '00080001', '987', '德惠市', '1');
INSERT INTO `region` VALUES ('100961', '000800020001', '00080002', '988', '市辖区', '1');
INSERT INTO `region` VALUES ('100962', '000800020002', '00080002', '989', '昌邑区', '1');
INSERT INTO `region` VALUES ('100963', '000800020003', '00080002', '990', '龙潭区', '1');
INSERT INTO `region` VALUES ('100964', '000800020004', '00080002', '991', '船营区', '1');
INSERT INTO `region` VALUES ('100965', '000800020005', '00080002', '992', '丰满区', '1');
INSERT INTO `region` VALUES ('100966', '000800020006', '00080002', '993', '永吉县', '1');
INSERT INTO `region` VALUES ('100967', '000800020007', '00080002', '994', '蛟河市', '1');
INSERT INTO `region` VALUES ('100968', '000800020008', '00080002', '995', '桦甸市', '1');
INSERT INTO `region` VALUES ('100969', '000800020009', '00080002', '996', '舒兰市', '1');
INSERT INTO `region` VALUES ('100970', '000800020010', '00080002', '997', '磐石市', '1');
INSERT INTO `region` VALUES ('100971', '000800030001', '00080003', '998', '市辖区', '1');
INSERT INTO `region` VALUES ('100972', '000800030002', '00080003', '999', '铁西区', '1');
INSERT INTO `region` VALUES ('100973', '000800030003', '00080003', '1000', '铁东区', '1');
INSERT INTO `region` VALUES ('100974', '000800030004', '00080003', '1001', '梨树县', '1');
INSERT INTO `region` VALUES ('100975', '000800030005', '00080003', '1002', '伊通满族自治县', '1');
INSERT INTO `region` VALUES ('100976', '000800030006', '00080003', '1003', '公主岭市', '1');
INSERT INTO `region` VALUES ('100977', '000800030007', '00080003', '1004', '双辽市', '1');
INSERT INTO `region` VALUES ('100978', '000800040001', '00080004', '1005', '市辖区', '1');
INSERT INTO `region` VALUES ('100979', '000800040002', '00080004', '1006', '龙山区', '1');
INSERT INTO `region` VALUES ('100980', '000800040003', '00080004', '1007', '西安区', '1');
INSERT INTO `region` VALUES ('100981', '000800040004', '00080004', '1008', '东丰县', '1');
INSERT INTO `region` VALUES ('100982', '000800040005', '00080004', '1009', '东辽县', '1');
INSERT INTO `region` VALUES ('100983', '000800050001', '00080005', '1010', '市辖区', '1');
INSERT INTO `region` VALUES ('100984', '000800050002', '00080005', '1011', '东昌区', '1');
INSERT INTO `region` VALUES ('100985', '000800050003', '00080005', '1012', '二道江区', '1');
INSERT INTO `region` VALUES ('100986', '000800050004', '00080005', '1013', '通化县', '1');
INSERT INTO `region` VALUES ('100987', '000800050005', '00080005', '1014', '辉南县', '1');
INSERT INTO `region` VALUES ('100988', '000800050006', '00080005', '1015', '柳河县', '1');
INSERT INTO `region` VALUES ('100989', '000800050007', '00080005', '1016', '梅河口市', '1');
INSERT INTO `region` VALUES ('100990', '000800050008', '00080005', '1017', '集安市', '1');
INSERT INTO `region` VALUES ('100991', '000800060001', '00080006', '1018', '市辖区', '1');
INSERT INTO `region` VALUES ('100992', '000800060002', '00080006', '1019', '八道江区', '1');
INSERT INTO `region` VALUES ('100993', '000800060003', '00080006', '1020', '抚松县', '1');
INSERT INTO `region` VALUES ('100994', '000800060004', '00080006', '1021', '靖宇县', '1');
INSERT INTO `region` VALUES ('100995', '000800060005', '00080006', '1022', '长白朝鲜族自治县', '1');
INSERT INTO `region` VALUES ('100996', '000800060006', '00080006', '1023', '江源县', '1');
INSERT INTO `region` VALUES ('100997', '000800060007', '00080006', '1024', '临江市', '1');
INSERT INTO `region` VALUES ('100998', '000800070001', '00080007', '1025', '市辖区', '1');
INSERT INTO `region` VALUES ('100999', '000800070002', '00080007', '1026', '宁江区', '1');
INSERT INTO `region` VALUES ('101000', '000800070003', '00080007', '1027', '前郭尔罗斯蒙古族自治县', '1');
INSERT INTO `region` VALUES ('101001', '000800070004', '00080007', '1028', '长岭县', '1');
INSERT INTO `region` VALUES ('101002', '000800070005', '00080007', '1029', '乾安县', '1');
INSERT INTO `region` VALUES ('101003', '000800070006', '00080007', '1030', '扶余县', '1');
INSERT INTO `region` VALUES ('101004', '000800080001', '00080008', '1031', '市辖区', '1');
INSERT INTO `region` VALUES ('101005', '000800080002', '00080008', '1032', '洮北区', '1');
INSERT INTO `region` VALUES ('101006', '000800080003', '00080008', '1033', '镇赉县', '1');
INSERT INTO `region` VALUES ('101007', '000800080004', '00080008', '1034', '通榆县', '1');
INSERT INTO `region` VALUES ('101008', '000800080005', '00080008', '1035', '洮南市', '1');
INSERT INTO `region` VALUES ('101009', '000800080006', '00080008', '1036', '大安市', '1');
INSERT INTO `region` VALUES ('101010', '000800090001', '00080009', '1037', '延吉市', '1');
INSERT INTO `region` VALUES ('101011', '000800090002', '00080009', '1038', '图们市', '1');
INSERT INTO `region` VALUES ('101012', '000800090003', '00080009', '1039', '敦化市', '1');
INSERT INTO `region` VALUES ('101013', '000800090004', '00080009', '1040', '珲春市', '1');
INSERT INTO `region` VALUES ('101014', '000800090005', '00080009', '1041', '龙井市', '1');
INSERT INTO `region` VALUES ('101015', '000800090006', '00080009', '1042', '和龙市', '1');
INSERT INTO `region` VALUES ('101016', '000800090007', '00080009', '1043', '汪清县', '1');
INSERT INTO `region` VALUES ('101017', '000800090008', '00080009', '1044', '安图县', '1');
INSERT INTO `region` VALUES ('101018', '000900010001', '00090001', '1045', '市辖区', '1');
INSERT INTO `region` VALUES ('101019', '000900010002', '00090001', '1046', '道里区', '1');
INSERT INTO `region` VALUES ('101020', '000900010003', '00090001', '1047', '南岗区', '1');
INSERT INTO `region` VALUES ('101021', '000900010004', '00090001', '1048', '道外区', '1');
INSERT INTO `region` VALUES ('101022', '000900010005', '00090001', '1049', '香坊区', '1');
INSERT INTO `region` VALUES ('101023', '000900010006', '00090001', '1050', '动力区', '1');
INSERT INTO `region` VALUES ('101024', '000900010007', '00090001', '1051', '平房区', '1');
INSERT INTO `region` VALUES ('101025', '000900010008', '00090001', '1052', '松北区', '1');
INSERT INTO `region` VALUES ('101026', '000900010009', '00090001', '1053', '呼兰区', '1');
INSERT INTO `region` VALUES ('101027', '000900010010', '00090001', '1054', '依兰县', '1');
INSERT INTO `region` VALUES ('101028', '000900010011', '00090001', '1055', '方正县', '1');
INSERT INTO `region` VALUES ('101029', '000900010012', '00090001', '1056', '宾　县', '1');
INSERT INTO `region` VALUES ('101030', '000900010013', '00090001', '1057', '巴彦县', '1');
INSERT INTO `region` VALUES ('101031', '000900010014', '00090001', '1058', '木兰县', '1');
INSERT INTO `region` VALUES ('101032', '000900010015', '00090001', '1059', '通河县', '1');
INSERT INTO `region` VALUES ('101033', '000900010016', '00090001', '1060', '延寿县', '1');
INSERT INTO `region` VALUES ('101034', '000900010017', '00090001', '1061', '阿城市', '1');
INSERT INTO `region` VALUES ('101035', '000900010018', '00090001', '1062', '双城市', '1');
INSERT INTO `region` VALUES ('101036', '000900010019', '00090001', '1063', '尚志市', '1');
INSERT INTO `region` VALUES ('101037', '000900010020', '00090001', '1064', '五常市', '1');
INSERT INTO `region` VALUES ('101038', '000900020001', '00090002', '1065', '市辖区', '1');
INSERT INTO `region` VALUES ('101039', '000900020002', '00090002', '1066', '龙沙区', '1');
INSERT INTO `region` VALUES ('101040', '000900020003', '00090002', '1067', '建华区', '1');
INSERT INTO `region` VALUES ('101041', '000900020004', '00090002', '1068', '铁锋区', '1');
INSERT INTO `region` VALUES ('101042', '000900020005', '00090002', '1069', '昂昂溪区', '1');
INSERT INTO `region` VALUES ('101043', '000900020006', '00090002', '1070', '富拉尔基区', '1');
INSERT INTO `region` VALUES ('101044', '000900020007', '00090002', '1071', '碾子山区', '1');
INSERT INTO `region` VALUES ('101045', '000900020008', '00090002', '1072', '梅里斯达斡尔族区', '1');
INSERT INTO `region` VALUES ('101046', '000900020009', '00090002', '1073', '龙江县', '1');
INSERT INTO `region` VALUES ('101047', '000900020010', '00090002', '1074', '依安县', '1');
INSERT INTO `region` VALUES ('101048', '000900020011', '00090002', '1075', '泰来县', '1');
INSERT INTO `region` VALUES ('101049', '000900020012', '00090002', '1076', '甘南县', '1');
INSERT INTO `region` VALUES ('101050', '000900020013', '00090002', '1077', '富裕县', '1');
INSERT INTO `region` VALUES ('101051', '000900020014', '00090002', '1078', '克山县', '1');
INSERT INTO `region` VALUES ('101052', '000900020015', '00090002', '1079', '克东县', '1');
INSERT INTO `region` VALUES ('101053', '000900020016', '00090002', '1080', '拜泉县', '1');
INSERT INTO `region` VALUES ('101054', '000900020017', '00090002', '1081', '讷河市', '1');
INSERT INTO `region` VALUES ('101055', '000900030001', '00090003', '1082', '市辖区', '1');
INSERT INTO `region` VALUES ('101056', '000900030002', '00090003', '1083', '鸡冠区', '1');
INSERT INTO `region` VALUES ('101057', '000900030003', '00090003', '1084', '恒山区', '1');
INSERT INTO `region` VALUES ('101058', '000900030004', '00090003', '1085', '滴道区', '1');
INSERT INTO `region` VALUES ('101059', '000900030005', '00090003', '1086', '梨树区', '1');
INSERT INTO `region` VALUES ('101060', '000900030006', '00090003', '1087', '城子河区', '1');
INSERT INTO `region` VALUES ('101061', '000900030007', '00090003', '1088', '麻山区', '1');
INSERT INTO `region` VALUES ('101062', '000900030008', '00090003', '1089', '鸡东县', '1');
INSERT INTO `region` VALUES ('101063', '000900030009', '00090003', '1090', '虎林市', '1');
INSERT INTO `region` VALUES ('101064', '000900030010', '00090003', '1091', '密山市', '1');
INSERT INTO `region` VALUES ('101065', '000900040001', '00090004', '1092', '市辖区', '1');
INSERT INTO `region` VALUES ('101066', '000900040002', '00090004', '1093', '向阳区', '1');
INSERT INTO `region` VALUES ('101067', '000900040003', '00090004', '1094', '工农区', '1');
INSERT INTO `region` VALUES ('101068', '000900040004', '00090004', '1095', '南山区', '1');
INSERT INTO `region` VALUES ('101069', '000900040005', '00090004', '1096', '兴安区', '1');
INSERT INTO `region` VALUES ('101070', '000900040006', '00090004', '1097', '东山区', '1');
INSERT INTO `region` VALUES ('101071', '000900040007', '00090004', '1098', '兴山区', '1');
INSERT INTO `region` VALUES ('101072', '000900040008', '00090004', '1099', '萝北县', '1');
INSERT INTO `region` VALUES ('101073', '000900040009', '00090004', '1100', '绥滨县', '1');
INSERT INTO `region` VALUES ('101074', '000900050001', '00090005', '1101', '市辖区', '1');
INSERT INTO `region` VALUES ('101075', '000900050002', '00090005', '1102', '尖山区', '1');
INSERT INTO `region` VALUES ('101076', '000900050003', '00090005', '1103', '岭东区', '1');
INSERT INTO `region` VALUES ('101077', '000900050004', '00090005', '1104', '四方台区', '1');
INSERT INTO `region` VALUES ('101078', '000900050005', '00090005', '1105', '宝山区', '1');
INSERT INTO `region` VALUES ('101079', '000900050006', '00090005', '1106', '集贤县', '1');
INSERT INTO `region` VALUES ('101080', '000900050007', '00090005', '1107', '友谊县', '1');
INSERT INTO `region` VALUES ('101081', '000900050008', '00090005', '1108', '宝清县', '1');
INSERT INTO `region` VALUES ('101082', '000900050009', '00090005', '1109', '饶河县', '1');
INSERT INTO `region` VALUES ('101083', '000900060001', '00090006', '1110', '市辖区', '1');
INSERT INTO `region` VALUES ('101084', '000900060002', '00090006', '1111', '萨尔图区', '1');
INSERT INTO `region` VALUES ('101085', '000900060003', '00090006', '1112', '龙凤区', '1');
INSERT INTO `region` VALUES ('101086', '000900060004', '00090006', '1113', '让胡路区', '1');
INSERT INTO `region` VALUES ('101087', '000900060005', '00090006', '1114', '红岗区', '1');
INSERT INTO `region` VALUES ('101088', '000900060006', '00090006', '1115', '大同区', '1');
INSERT INTO `region` VALUES ('101089', '000900060007', '00090006', '1116', '肇州县', '1');
INSERT INTO `region` VALUES ('101090', '000900060008', '00090006', '1117', '肇源县', '1');
INSERT INTO `region` VALUES ('101091', '000900060009', '00090006', '1118', '林甸县', '1');
INSERT INTO `region` VALUES ('101092', '000900060010', '00090006', '1119', '杜尔伯特蒙古族自治县', '1');
INSERT INTO `region` VALUES ('101093', '000900070001', '00090007', '1120', '市辖区', '1');
INSERT INTO `region` VALUES ('101094', '000900070002', '00090007', '1121', '伊春区', '1');
INSERT INTO `region` VALUES ('101095', '000900070003', '00090007', '1122', '南岔区', '1');
INSERT INTO `region` VALUES ('101096', '000900070004', '00090007', '1123', '友好区', '1');
INSERT INTO `region` VALUES ('101097', '000900070005', '00090007', '1124', '西林区', '1');
INSERT INTO `region` VALUES ('101098', '000900070006', '00090007', '1125', '翠峦区', '1');
INSERT INTO `region` VALUES ('101099', '000900070007', '00090007', '1126', '新青区', '1');
INSERT INTO `region` VALUES ('101100', '000900070008', '00090007', '1127', '美溪区', '1');
INSERT INTO `region` VALUES ('101101', '000900070009', '00090007', '1128', '金山屯区', '1');
INSERT INTO `region` VALUES ('101102', '000900070010', '00090007', '1129', '五营区', '1');
INSERT INTO `region` VALUES ('101103', '000900070011', '00090007', '1130', '乌马河区', '1');
INSERT INTO `region` VALUES ('101104', '000900070012', '00090007', '1131', '汤旺河区', '1');
INSERT INTO `region` VALUES ('101105', '000900070013', '00090007', '1132', '带岭区', '1');
INSERT INTO `region` VALUES ('101106', '000900070014', '00090007', '1133', '乌伊岭区', '1');
INSERT INTO `region` VALUES ('101107', '000900070015', '00090007', '1134', '红星区', '1');
INSERT INTO `region` VALUES ('101108', '000900070016', '00090007', '1135', '上甘岭区', '1');
INSERT INTO `region` VALUES ('101109', '000900070017', '00090007', '1136', '嘉荫县', '1');
INSERT INTO `region` VALUES ('101110', '000900070018', '00090007', '1137', '铁力市', '1');
INSERT INTO `region` VALUES ('101111', '000900080001', '00090008', '1138', '市辖区', '1');
INSERT INTO `region` VALUES ('101112', '000900080002', '00090008', '1139', '永红区', '1');
INSERT INTO `region` VALUES ('101113', '000900080003', '00090008', '1140', '向阳区', '1');
INSERT INTO `region` VALUES ('101114', '000900080004', '00090008', '1141', '前进区', '1');
INSERT INTO `region` VALUES ('101115', '000900080005', '00090008', '1142', '东风区', '1');
INSERT INTO `region` VALUES ('101116', '000900080006', '00090008', '1143', '郊　区', '1');
INSERT INTO `region` VALUES ('101117', '000900080007', '00090008', '1144', '桦南县', '1');
INSERT INTO `region` VALUES ('101118', '000900080008', '00090008', '1145', '桦川县', '1');
INSERT INTO `region` VALUES ('101119', '000900080009', '00090008', '1146', '汤原县', '1');
INSERT INTO `region` VALUES ('101120', '000900080010', '00090008', '1147', '抚远县', '1');
INSERT INTO `region` VALUES ('101121', '000900080011', '00090008', '1148', '同江市', '1');
INSERT INTO `region` VALUES ('101122', '000900080012', '00090008', '1149', '富锦市', '1');
INSERT INTO `region` VALUES ('101123', '000900090001', '00090009', '1150', '市辖区', '1');
INSERT INTO `region` VALUES ('101124', '000900090002', '00090009', '1151', '新兴区', '1');
INSERT INTO `region` VALUES ('101125', '000900090003', '00090009', '1152', '桃山区', '1');
INSERT INTO `region` VALUES ('101126', '000900090004', '00090009', '1153', '茄子河区', '1');
INSERT INTO `region` VALUES ('101127', '000900090005', '00090009', '1154', '勃利县', '1');
INSERT INTO `region` VALUES ('101128', '000900100001', '00090010', '1155', '市辖区', '1');
INSERT INTO `region` VALUES ('101129', '000900100002', '00090010', '1156', '东安区', '1');
INSERT INTO `region` VALUES ('101130', '000900100003', '00090010', '1157', '阳明区', '1');
INSERT INTO `region` VALUES ('101131', '000900100004', '00090010', '1158', '爱民区', '1');
INSERT INTO `region` VALUES ('101132', '000900100005', '00090010', '1159', '西安区', '1');
INSERT INTO `region` VALUES ('101133', '000900100006', '00090010', '1160', '东宁县', '1');
INSERT INTO `region` VALUES ('101134', '000900100007', '00090010', '1161', '林口县', '1');
INSERT INTO `region` VALUES ('101135', '000900100008', '00090010', '1162', '绥芬河市', '1');
INSERT INTO `region` VALUES ('101136', '000900100009', '00090010', '1163', '海林市', '1');
INSERT INTO `region` VALUES ('101137', '000900100010', '00090010', '1164', '宁安市', '1');
INSERT INTO `region` VALUES ('101138', '000900100011', '00090010', '1165', '穆棱市', '1');
INSERT INTO `region` VALUES ('101139', '000900110001', '00090011', '1166', '市辖区', '1');
INSERT INTO `region` VALUES ('101140', '000900110002', '00090011', '1167', '爱辉区', '1');
INSERT INTO `region` VALUES ('101141', '000900110003', '00090011', '1168', '嫩江县', '1');
INSERT INTO `region` VALUES ('101142', '000900110004', '00090011', '1169', '逊克县', '1');
INSERT INTO `region` VALUES ('101143', '000900110005', '00090011', '1170', '孙吴县', '1');
INSERT INTO `region` VALUES ('101144', '000900110006', '00090011', '1171', '北安市', '1');
INSERT INTO `region` VALUES ('101145', '000900110007', '00090011', '1172', '五大连池市', '1');
INSERT INTO `region` VALUES ('101146', '000900120001', '00090012', '1173', '市辖区', '1');
INSERT INTO `region` VALUES ('101147', '000900120002', '00090012', '1174', '北林区', '1');
INSERT INTO `region` VALUES ('101148', '000900120003', '00090012', '1175', '望奎县', '1');
INSERT INTO `region` VALUES ('101149', '000900120004', '00090012', '1176', '兰西县', '1');
INSERT INTO `region` VALUES ('101150', '000900120005', '00090012', '1177', '青冈县', '1');
INSERT INTO `region` VALUES ('101151', '000900120006', '00090012', '1178', '庆安县', '1');
INSERT INTO `region` VALUES ('101152', '000900120007', '00090012', '1179', '明水县', '1');
INSERT INTO `region` VALUES ('101153', '000900120008', '00090012', '1180', '绥棱县', '1');
INSERT INTO `region` VALUES ('101154', '000900120009', '00090012', '1181', '安达市', '1');
INSERT INTO `region` VALUES ('101155', '000900120010', '00090012', '1182', '肇东市', '1');
INSERT INTO `region` VALUES ('101156', '000900120011', '00090012', '1183', '海伦市', '1');
INSERT INTO `region` VALUES ('101157', '000900130001', '00090013', '1184', '呼玛县', '1');
INSERT INTO `region` VALUES ('101158', '000900130002', '00090013', '1185', '塔河县', '1');
INSERT INTO `region` VALUES ('101159', '000900130003', '00090013', '1186', '漠河县', '1');
INSERT INTO `region` VALUES ('101160', '001000010001', '00100001', '1187', '黄浦区', '1');
INSERT INTO `region` VALUES ('101161', '001000010002', '00100001', '1188', '卢湾区', '1');
INSERT INTO `region` VALUES ('101162', '001000010003', '00100001', '1189', '徐汇区', '1');
INSERT INTO `region` VALUES ('101163', '001000010004', '00100001', '1190', '长宁区', '1');
INSERT INTO `region` VALUES ('101164', '001000010005', '00100001', '1191', '静安区', '1');
INSERT INTO `region` VALUES ('101165', '001000010006', '00100001', '1192', '普陀区', '1');
INSERT INTO `region` VALUES ('101166', '001000010007', '00100001', '1193', '闸北区', '1');
INSERT INTO `region` VALUES ('101167', '001000010008', '00100001', '1194', '虹口区', '1');
INSERT INTO `region` VALUES ('101168', '001000010009', '00100001', '1195', '杨浦区', '1');
INSERT INTO `region` VALUES ('101169', '001000010010', '00100001', '1196', '闵行区', '1');
INSERT INTO `region` VALUES ('101170', '001000010011', '00100001', '1197', '宝山区', '1');
INSERT INTO `region` VALUES ('101171', '001000010012', '00100001', '1198', '嘉定区', '1');
INSERT INTO `region` VALUES ('101172', '001000010013', '00100001', '1199', '浦东新区', '1');
INSERT INTO `region` VALUES ('101173', '001000010014', '00100001', '1200', '金山区', '1');
INSERT INTO `region` VALUES ('101174', '001000010015', '00100001', '1201', '松江区', '1');
INSERT INTO `region` VALUES ('101175', '001000010016', '00100001', '1202', '青浦区', '1');
INSERT INTO `region` VALUES ('101176', '001000010017', '00100001', '1203', '南汇区', '1');
INSERT INTO `region` VALUES ('101177', '001000010018', '00100001', '1204', '奉贤区', '1');
INSERT INTO `region` VALUES ('101178', '001000020001', '00100002', '1205', '崇明县', '1');
INSERT INTO `region` VALUES ('101179', '001100010001', '00110001', '1206', '市辖区', '1');
INSERT INTO `region` VALUES ('101180', '001100010002', '00110001', '1207', '玄武区', '1');
INSERT INTO `region` VALUES ('101181', '001100010003', '00110001', '1208', '白下区', '1');
INSERT INTO `region` VALUES ('101182', '001100010004', '00110001', '1209', '秦淮区', '1');
INSERT INTO `region` VALUES ('101183', '001100010005', '00110001', '1210', '建邺区', '1');
INSERT INTO `region` VALUES ('101184', '001100010006', '00110001', '1211', '鼓楼区', '1');
INSERT INTO `region` VALUES ('101185', '001100010007', '00110001', '1212', '下关区', '1');
INSERT INTO `region` VALUES ('101186', '001100010008', '00110001', '1213', '浦口区', '1');
INSERT INTO `region` VALUES ('101187', '001100010009', '00110001', '1214', '栖霞区', '1');
INSERT INTO `region` VALUES ('101188', '001100010010', '00110001', '1215', '雨花台区', '1');
INSERT INTO `region` VALUES ('101189', '001100010011', '00110001', '1216', '江宁区', '1');
INSERT INTO `region` VALUES ('101190', '001100010012', '00110001', '1217', '六合区', '1');
INSERT INTO `region` VALUES ('101191', '001100010013', '00110001', '1218', '溧水县', '1');
INSERT INTO `region` VALUES ('101192', '001100010001', '00110001', '1219', '高淳县', '1');
INSERT INTO `region` VALUES ('101193', '001100020001', '00110002', '1220', '市辖区', '1');
INSERT INTO `region` VALUES ('101194', '001100020002', '00110002', '1221', '崇安区', '1');
INSERT INTO `region` VALUES ('101195', '001100020003', '00110002', '1222', '南长区', '1');
INSERT INTO `region` VALUES ('101196', '001100020004', '00110002', '1223', '北塘区', '1');
INSERT INTO `region` VALUES ('101197', '001100020005', '00110002', '1224', '锡山区', '1');
INSERT INTO `region` VALUES ('101198', '001100020006', '00110002', '1225', '惠山区', '1');
INSERT INTO `region` VALUES ('101199', '001100020007', '00110002', '1226', '滨湖区', '1');
INSERT INTO `region` VALUES ('101200', '001100020008', '00110002', '1227', '江阴市', '1');
INSERT INTO `region` VALUES ('101201', '001100020009', '00110002', '1228', '宜兴市', '1');
INSERT INTO `region` VALUES ('101202', '001100030001', '00110003', '1229', '市辖区', '1');
INSERT INTO `region` VALUES ('101203', '001100030002', '00110003', '1230', '鼓楼区', '1');
INSERT INTO `region` VALUES ('101204', '001100030003', '00110003', '1231', '云龙区', '1');
INSERT INTO `region` VALUES ('101205', '001100030004', '00110003', '1232', '九里区', '1');
INSERT INTO `region` VALUES ('101206', '001100030005', '00110003', '1233', '贾汪区', '1');
INSERT INTO `region` VALUES ('101207', '001100030006', '00110003', '1234', '泉山区', '1');
INSERT INTO `region` VALUES ('101208', '001100030007', '00110003', '1235', '丰　县', '1');
INSERT INTO `region` VALUES ('101209', '001100030008', '00110003', '1236', '沛　县', '1');
INSERT INTO `region` VALUES ('101210', '001100030009', '00110003', '1237', '铜山县', '1');
INSERT INTO `region` VALUES ('101211', '001100030010', '00110003', '1238', '睢宁县', '1');
INSERT INTO `region` VALUES ('101212', '001100030011', '00110003', '1239', '新沂市', '1');
INSERT INTO `region` VALUES ('101213', '001100030012', '00110003', '1240', '邳州市', '1');
INSERT INTO `region` VALUES ('101214', '001100040001', '00110004', '1241', '市辖区', '1');
INSERT INTO `region` VALUES ('101215', '001100040002', '00110004', '1242', '天宁区', '1');
INSERT INTO `region` VALUES ('101216', '001100040003', '00110004', '1243', '钟楼区', '1');
INSERT INTO `region` VALUES ('101217', '001100040004', '00110004', '1244', '戚墅堰区', '1');
INSERT INTO `region` VALUES ('101218', '001100040005', '00110004', '1245', '新北区', '1');
INSERT INTO `region` VALUES ('101219', '001100040006', '00110004', '1246', '武进区', '1');
INSERT INTO `region` VALUES ('101220', '001100040007', '00110004', '1247', '溧阳市', '1');
INSERT INTO `region` VALUES ('101221', '001100040008', '00110004', '1248', '金坛市', '1');
INSERT INTO `region` VALUES ('101222', '001100050001', '00110005', '1249', '市辖区', '1');
INSERT INTO `region` VALUES ('101223', '001100050002', '00110005', '1250', '沧浪区', '1');
INSERT INTO `region` VALUES ('101224', '001100050003', '00110005', '1251', '平江区', '1');
INSERT INTO `region` VALUES ('101225', '001100050004', '00110005', '1252', '金阊区', '1');
INSERT INTO `region` VALUES ('101226', '001100050005', '00110005', '1253', '虎丘区', '1');
INSERT INTO `region` VALUES ('101227', '001100050006', '00110005', '1254', '吴中区', '1');
INSERT INTO `region` VALUES ('101228', '001100050007', '00110005', '1255', '相城区', '1');
INSERT INTO `region` VALUES ('101229', '001100050008', '00110005', '1256', '常熟市', '1');
INSERT INTO `region` VALUES ('101230', '001100050009', '00110005', '1257', '张家港市', '1');
INSERT INTO `region` VALUES ('101231', '001100050010', '00110005', '1258', '昆山市', '1');
INSERT INTO `region` VALUES ('101232', '001100050011', '00110005', '1259', '吴江市', '1');
INSERT INTO `region` VALUES ('101233', '001100050012', '00110005', '1260', '太仓市', '1');
INSERT INTO `region` VALUES ('101234', '001100060001', '00110006', '1261', '市辖区', '1');
INSERT INTO `region` VALUES ('101235', '001100060002', '00110006', '1262', '崇川区', '1');
INSERT INTO `region` VALUES ('101236', '001100060003', '00110006', '1263', '港闸区', '1');
INSERT INTO `region` VALUES ('101237', '001100060004', '00110006', '1264', '海安县', '1');
INSERT INTO `region` VALUES ('101238', '001100060005', '00110006', '1265', '如东县', '1');
INSERT INTO `region` VALUES ('101239', '001100060006', '00110006', '1266', '启东市', '1');
INSERT INTO `region` VALUES ('101240', '001100060007', '00110006', '1267', '如皋市', '1');
INSERT INTO `region` VALUES ('101241', '001100060008', '00110006', '1268', '通州市', '1');
INSERT INTO `region` VALUES ('101242', '001100060009', '00110006', '1269', '海门市', '1');
INSERT INTO `region` VALUES ('101243', '001100070001', '00110007', '1270', '市辖区', '1');
INSERT INTO `region` VALUES ('101244', '001100070002', '00110007', '1271', '连云区', '1');
INSERT INTO `region` VALUES ('101245', '001100070003', '00110007', '1272', '新浦区', '1');
INSERT INTO `region` VALUES ('101246', '001100070004', '00110007', '1273', '海州区', '1');
INSERT INTO `region` VALUES ('101247', '001100070005', '00110007', '1274', '赣榆县', '1');
INSERT INTO `region` VALUES ('101248', '001100070006', '00110007', '1275', '东海县', '1');
INSERT INTO `region` VALUES ('101249', '001100070007', '00110007', '1276', '灌云县', '1');
INSERT INTO `region` VALUES ('101250', '001100070008', '00110007', '1277', '灌南县', '1');
INSERT INTO `region` VALUES ('101251', '001100080001', '00110008', '1278', '市辖区', '1');
INSERT INTO `region` VALUES ('101252', '001100080002', '00110008', '1279', '清河区', '1');
INSERT INTO `region` VALUES ('101253', '001100080003', '00110008', '1280', '楚州区', '1');
INSERT INTO `region` VALUES ('101254', '001100080004', '00110008', '1281', '淮阴区', '1');
INSERT INTO `region` VALUES ('101255', '001100080005', '00110008', '1282', '清浦区', '1');
INSERT INTO `region` VALUES ('101256', '001100080006', '00110008', '1283', '涟水县', '1');
INSERT INTO `region` VALUES ('101257', '001100080007', '00110008', '1284', '洪泽县', '1');
INSERT INTO `region` VALUES ('101258', '001100080008', '00110008', '1285', '盱眙县', '1');
INSERT INTO `region` VALUES ('101259', '001100080009', '00110008', '1286', '金湖县', '1');
INSERT INTO `region` VALUES ('101260', '001100090001', '00110009', '1287', '市辖区', '1');
INSERT INTO `region` VALUES ('101261', '001100090002', '00110009', '1288', '亭湖区', '1');
INSERT INTO `region` VALUES ('101262', '001100090003', '00110009', '1289', '盐都区', '1');
INSERT INTO `region` VALUES ('101263', '001100090004', '00110009', '1290', '响水县', '1');
INSERT INTO `region` VALUES ('101264', '001100090005', '00110009', '1291', '滨海县', '1');
INSERT INTO `region` VALUES ('101265', '001100090006', '00110009', '1292', '阜宁县', '1');
INSERT INTO `region` VALUES ('101266', '001100090007', '00110009', '1293', '射阳县', '1');
INSERT INTO `region` VALUES ('101267', '001100090008', '00110009', '1294', '建湖县', '1');
INSERT INTO `region` VALUES ('101268', '001100090009', '00110009', '1295', '东台市', '1');
INSERT INTO `region` VALUES ('101269', '001100090010', '00110009', '1296', '大丰市', '1');
INSERT INTO `region` VALUES ('101270', '001100100001', '00110010', '1297', '市辖区', '1');
INSERT INTO `region` VALUES ('101271', '001100100002', '00110010', '1298', '广陵区', '1');
INSERT INTO `region` VALUES ('101272', '001100100003', '00110010', '1299', '邗江区', '1');
INSERT INTO `region` VALUES ('101273', '001100100004', '00110010', '1300', '郊　区', '1');
INSERT INTO `region` VALUES ('101274', '001100100005', '00110010', '1301', '宝应县', '1');
INSERT INTO `region` VALUES ('101275', '001100100006', '00110010', '1302', '仪征市', '1');
INSERT INTO `region` VALUES ('101276', '001100100007', '00110010', '1303', '高邮市', '1');
INSERT INTO `region` VALUES ('101277', '001100100008', '00110010', '1304', '江都市', '1');
INSERT INTO `region` VALUES ('101278', '001100110001', '00110011', '1305', '市辖区', '1');
INSERT INTO `region` VALUES ('101279', '001100110002', '00110011', '1306', '京口区', '1');
INSERT INTO `region` VALUES ('101280', '001100110003', '00110011', '1307', '润州区', '1');
INSERT INTO `region` VALUES ('101281', '001100110004', '00110011', '1308', '丹徒区', '1');
INSERT INTO `region` VALUES ('101282', '001100110005', '00110011', '1309', '丹阳市', '1');
INSERT INTO `region` VALUES ('101283', '001100110006', '00110011', '1310', '扬中市', '1');
INSERT INTO `region` VALUES ('101284', '001100110007', '00110011', '1311', '句容市', '1');
INSERT INTO `region` VALUES ('101285', '001100120001', '00110012', '1312', '市辖区', '1');
INSERT INTO `region` VALUES ('101286', '001100120002', '00110012', '1313', '海陵区', '1');
INSERT INTO `region` VALUES ('101287', '001100120003', '00110012', '1314', '高港区', '1');
INSERT INTO `region` VALUES ('101288', '001100120004', '00110012', '1315', '兴化市', '1');
INSERT INTO `region` VALUES ('101289', '001100120005', '00110012', '1316', '靖江市', '1');
INSERT INTO `region` VALUES ('101290', '001100120006', '00110012', '1317', '泰兴市', '1');
INSERT INTO `region` VALUES ('101291', '001100120007', '00110012', '1318', '姜堰市', '1');
INSERT INTO `region` VALUES ('101292', '001100130001', '00110013', '1319', '市辖区', '1');
INSERT INTO `region` VALUES ('101293', '001100130002', '00110013', '1320', '宿城区', '1');
INSERT INTO `region` VALUES ('101294', '001100130003', '00110013', '1321', '宿豫区', '1');
INSERT INTO `region` VALUES ('101295', '001100130004', '00110013', '1322', '沭阳县', '1');
INSERT INTO `region` VALUES ('101296', '001100130005', '00110013', '1323', '泗阳县', '1');
INSERT INTO `region` VALUES ('101297', '001100130006', '00110013', '1324', '泗洪县', '1');
INSERT INTO `region` VALUES ('101298', '001200010001', '00120001', '1325', '市辖区', '1');
INSERT INTO `region` VALUES ('101299', '001200010002', '00120001', '1326', '上城区', '1');
INSERT INTO `region` VALUES ('101300', '001200010003', '00120001', '1327', '下城区', '1');
INSERT INTO `region` VALUES ('101301', '001200010004', '00120001', '1328', '江干区', '1');
INSERT INTO `region` VALUES ('101302', '001200010005', '00120001', '1329', '拱墅区', '1');
INSERT INTO `region` VALUES ('101303', '001200010006', '00120001', '1330', '西湖区', '1');
INSERT INTO `region` VALUES ('101304', '001200010007', '00120001', '1331', '滨江区', '1');
INSERT INTO `region` VALUES ('101305', '001200010008', '00120001', '1332', '萧山区', '1');
INSERT INTO `region` VALUES ('101306', '001200010009', '00120001', '1333', '余杭区', '1');
INSERT INTO `region` VALUES ('101307', '001200010010', '00120001', '1334', '桐庐县', '1');
INSERT INTO `region` VALUES ('101308', '001200010011', '00120001', '1335', '淳安县', '1');
INSERT INTO `region` VALUES ('101309', '001200010012', '00120001', '1336', '建德市', '1');
INSERT INTO `region` VALUES ('101310', '001200010013', '00120001', '1337', '富阳市', '1');
INSERT INTO `region` VALUES ('101311', '001200010014', '00120001', '1338', '临安市', '1');
INSERT INTO `region` VALUES ('101312', '001200020001', '00120002', '1339', '市辖区', '1');
INSERT INTO `region` VALUES ('101313', '001200020002', '00120002', '1340', '海曙区', '1');
INSERT INTO `region` VALUES ('101314', '001200020003', '00120002', '1341', '江东区', '1');
INSERT INTO `region` VALUES ('101315', '001200020004', '00120002', '1342', '江北区', '1');
INSERT INTO `region` VALUES ('101316', '001200020005', '00120002', '1343', '北仑区', '1');
INSERT INTO `region` VALUES ('101317', '001200020006', '00120002', '1344', '镇海区', '1');
INSERT INTO `region` VALUES ('101318', '001200020007', '00120002', '1345', '鄞州区', '1');
INSERT INTO `region` VALUES ('101319', '001200020008', '00120002', '1346', '象山县', '1');
INSERT INTO `region` VALUES ('101320', '001200020009', '00120002', '1347', '宁海县', '1');
INSERT INTO `region` VALUES ('101321', '001200020010', '00120002', '1348', '余姚市', '1');
INSERT INTO `region` VALUES ('101322', '001200020011', '00120002', '1349', '慈溪市', '1');
INSERT INTO `region` VALUES ('101323', '001200020012', '00120002', '1350', '奉化市', '1');
INSERT INTO `region` VALUES ('101324', '001200030001', '00120003', '1351', '市辖区', '1');
INSERT INTO `region` VALUES ('101325', '001200030002', '00120003', '1352', '鹿城区', '1');
INSERT INTO `region` VALUES ('101326', '001200030003', '00120003', '1353', '龙湾区', '1');
INSERT INTO `region` VALUES ('101327', '001200030004', '00120003', '1354', '瓯海区', '1');
INSERT INTO `region` VALUES ('101328', '001200030005', '00120003', '1355', '洞头县', '1');
INSERT INTO `region` VALUES ('101329', '001200030006', '00120003', '1356', '永嘉县', '1');
INSERT INTO `region` VALUES ('101330', '001200030007', '00120003', '1357', '平阳县', '1');
INSERT INTO `region` VALUES ('101331', '001200030008', '00120003', '1358', '苍南县', '1');
INSERT INTO `region` VALUES ('101332', '001200030009', '00120003', '1359', '文成县', '1');
INSERT INTO `region` VALUES ('101333', '001200030010', '00120003', '1360', '泰顺县', '1');
INSERT INTO `region` VALUES ('101334', '001200030011', '00120003', '1361', '瑞安市', '1');
INSERT INTO `region` VALUES ('101335', '001200030012', '00120003', '1362', '乐清市', '1');
INSERT INTO `region` VALUES ('101336', '001200040001', '00120004', '1363', '市辖区', '1');
INSERT INTO `region` VALUES ('101337', '001200040002', '00120004', '1364', '秀城区', '1');
INSERT INTO `region` VALUES ('101338', '001200040003', '00120004', '1365', '秀洲区', '1');
INSERT INTO `region` VALUES ('101339', '001200040004', '00120004', '1366', '嘉善县', '1');
INSERT INTO `region` VALUES ('101340', '001200040005', '00120004', '1367', '海盐县', '1');
INSERT INTO `region` VALUES ('101341', '001200040006', '00120004', '1368', '海宁市', '1');
INSERT INTO `region` VALUES ('101342', '001200040007', '00120004', '1369', '平湖市', '1');
INSERT INTO `region` VALUES ('101343', '001200040008', '00120004', '1370', '桐乡市', '1');
INSERT INTO `region` VALUES ('101344', '001200050001', '00120005', '1371', '市辖区', '1');
INSERT INTO `region` VALUES ('101345', '001200050002', '00120005', '1372', '吴兴区', '1');
INSERT INTO `region` VALUES ('101346', '001200050003', '00120005', '1373', '南浔区', '1');
INSERT INTO `region` VALUES ('101347', '001200050004', '00120005', '1374', '德清县', '1');
INSERT INTO `region` VALUES ('101348', '001200050005', '00120005', '1375', '长兴县', '1');
INSERT INTO `region` VALUES ('101349', '001200050006', '00120005', '1376', '安吉县', '1');
INSERT INTO `region` VALUES ('101350', '001200060001', '00120006', '1377', '市辖区', '1');
INSERT INTO `region` VALUES ('101351', '001200060002', '00120006', '1378', '越城区', '1');
INSERT INTO `region` VALUES ('101352', '001200060003', '00120006', '1379', '绍兴县', '1');
INSERT INTO `region` VALUES ('101353', '001200060004', '00120006', '1380', '新昌县', '1');
INSERT INTO `region` VALUES ('101354', '001200060005', '00120006', '1381', '诸暨市', '1');
INSERT INTO `region` VALUES ('101355', '001200060006', '00120006', '1382', '上虞市', '1');
INSERT INTO `region` VALUES ('101356', '001200060007', '00120006', '1383', '嵊州市', '1');
INSERT INTO `region` VALUES ('101357', '001200070001', '00120007', '1384', '市辖区', '1');
INSERT INTO `region` VALUES ('101358', '001200070002', '00120007', '1385', '婺城区', '1');
INSERT INTO `region` VALUES ('101359', '001200070003', '00120007', '1386', '金东区', '1');
INSERT INTO `region` VALUES ('101360', '001200070004', '00120007', '1387', '武义县', '1');
INSERT INTO `region` VALUES ('101361', '001200070005', '00120007', '1388', '浦江县', '1');
INSERT INTO `region` VALUES ('101362', '001200070006', '00120007', '1389', '磐安县', '1');
INSERT INTO `region` VALUES ('101363', '001200070007', '00120007', '1390', '兰溪市', '1');
INSERT INTO `region` VALUES ('101364', '001200070008', '00120007', '1391', '义乌市', '1');
INSERT INTO `region` VALUES ('101365', '001200070009', '00120007', '1392', '东阳市', '1');
INSERT INTO `region` VALUES ('101366', '001200070010', '00120007', '1393', '永康市', '1');
INSERT INTO `region` VALUES ('101367', '001200080001', '00120008', '1394', '市辖区', '1');
INSERT INTO `region` VALUES ('101368', '001200080002', '00120008', '1395', '柯城区', '1');
INSERT INTO `region` VALUES ('101369', '001200080003', '00120008', '1396', '衢江区', '1');
INSERT INTO `region` VALUES ('101370', '001200080004', '00120008', '1397', '常山县', '1');
INSERT INTO `region` VALUES ('101371', '001200080005', '00120008', '1398', '开化县', '1');
INSERT INTO `region` VALUES ('101372', '001200080006', '00120008', '1399', '龙游县', '1');
INSERT INTO `region` VALUES ('101373', '001200080007', '00120008', '1400', '江山市', '1');
INSERT INTO `region` VALUES ('101374', '001200090001', '00120009', '1401', '市辖区', '1');
INSERT INTO `region` VALUES ('101375', '001200090002', '00120009', '1402', '定海区', '1');
INSERT INTO `region` VALUES ('101376', '001200090003', '00120009', '1403', '普陀区', '1');
INSERT INTO `region` VALUES ('101377', '001200090004', '00120009', '1404', '岱山县', '1');
INSERT INTO `region` VALUES ('101378', '001200090005', '00120009', '1405', '嵊泗县', '1');
INSERT INTO `region` VALUES ('101379', '001200100001', '00120010', '1406', '市辖区', '1');
INSERT INTO `region` VALUES ('101380', '001200100002', '00120010', '1407', '椒江区', '1');
INSERT INTO `region` VALUES ('101381', '001200100003', '00120010', '1408', '黄岩区', '1');
INSERT INTO `region` VALUES ('101382', '001200100004', '00120010', '1409', '路桥区', '1');
INSERT INTO `region` VALUES ('101383', '001200100005', '00120010', '1410', '玉环县', '1');
INSERT INTO `region` VALUES ('101384', '001200100006', '00120010', '1411', '三门县', '1');
INSERT INTO `region` VALUES ('101385', '001200100007', '00120010', '1412', '天台县', '1');
INSERT INTO `region` VALUES ('101386', '001200100008', '00120010', '1413', '仙居县', '1');
INSERT INTO `region` VALUES ('101387', '001200100009', '00120010', '1414', '温岭市', '1');
INSERT INTO `region` VALUES ('101388', '001200100010', '00120010', '1415', '临海市', '1');
INSERT INTO `region` VALUES ('101389', '001200110001', '00120011', '1416', '市辖区', '1');
INSERT INTO `region` VALUES ('101390', '001200110002', '00120011', '1417', '莲都区', '1');
INSERT INTO `region` VALUES ('101391', '001200110003', '00120011', '1418', '青田县', '1');
INSERT INTO `region` VALUES ('101392', '001200110004', '00120011', '1419', '缙云县', '1');
INSERT INTO `region` VALUES ('101393', '001200110005', '00120011', '1420', '遂昌县', '1');
INSERT INTO `region` VALUES ('101394', '001200110006', '00120011', '1421', '松阳县', '1');
INSERT INTO `region` VALUES ('101395', '001200110007', '00120011', '1422', '云和县', '1');
INSERT INTO `region` VALUES ('101396', '001200110008', '00120011', '1423', '庆元县', '1');
INSERT INTO `region` VALUES ('101397', '001200110009', '00120011', '1424', '景宁畲族自治县', '1');
INSERT INTO `region` VALUES ('101398', '001200110010', '00120011', '1425', '龙泉市', '1');
INSERT INTO `region` VALUES ('101399', '001300010001', '00130001', '1426', '市辖区', '1');
INSERT INTO `region` VALUES ('101400', '001300010002', '00130001', '1427', '瑶海区', '1');
INSERT INTO `region` VALUES ('101401', '001300010003', '00130001', '1428', '庐阳区', '1');
INSERT INTO `region` VALUES ('101402', '001300010004', '00130001', '1429', '蜀山区', '1');
INSERT INTO `region` VALUES ('101403', '001300010005', '00130001', '1430', '包河区', '1');
INSERT INTO `region` VALUES ('101404', '001300010006', '00130001', '1431', '长丰县', '1');
INSERT INTO `region` VALUES ('101405', '001300010007', '00130001', '1432', '肥东县', '1');
INSERT INTO `region` VALUES ('101406', '001300010008', '00130001', '1433', '肥西县', '1');
INSERT INTO `region` VALUES ('101407', '001300020001', '00130002', '1434', '市辖区', '1');
INSERT INTO `region` VALUES ('101408', '001300020002', '00130002', '1435', '镜湖区', '1');
INSERT INTO `region` VALUES ('101409', '001300020003', '00130002', '1436', '马塘区', '1');
INSERT INTO `region` VALUES ('101410', '001300020004', '00130002', '1437', '新芜区', '1');
INSERT INTO `region` VALUES ('101411', '001300020005', '00130002', '1438', '鸠江区', '1');
INSERT INTO `region` VALUES ('101412', '001300020006', '00130002', '1439', '芜湖县', '1');
INSERT INTO `region` VALUES ('101413', '001300020007', '00130002', '1440', '繁昌县', '1');
INSERT INTO `region` VALUES ('101414', '001300020008', '00130002', '1441', '南陵县', '1');
INSERT INTO `region` VALUES ('101415', '001300030001', '00130003', '1442', '市辖区', '1');
INSERT INTO `region` VALUES ('101416', '001300030002', '00130003', '1443', '龙子湖区', '1');
INSERT INTO `region` VALUES ('101417', '001300030003', '00130003', '1444', '蚌山区', '1');
INSERT INTO `region` VALUES ('101418', '001300030004', '00130003', '1445', '禹会区', '1');
INSERT INTO `region` VALUES ('101419', '001300030005', '00130003', '1446', '淮上区', '1');
INSERT INTO `region` VALUES ('101420', '001300030006', '00130003', '1447', '怀远县', '1');
INSERT INTO `region` VALUES ('101421', '001300030007', '00130003', '1448', '五河县', '1');
INSERT INTO `region` VALUES ('101422', '001300030008', '00130003', '1449', '固镇县', '1');
INSERT INTO `region` VALUES ('101423', '001300040001', '00130004', '1450', '市辖区', '1');
INSERT INTO `region` VALUES ('101424', '001300040002', '00130004', '1451', '大通区', '1');
INSERT INTO `region` VALUES ('101425', '001300040003', '00130004', '1452', '田家庵区', '1');
INSERT INTO `region` VALUES ('101426', '001300040004', '00130004', '1453', '谢家集区', '1');
INSERT INTO `region` VALUES ('101427', '001300040005', '00130004', '1454', '八公山区', '1');
INSERT INTO `region` VALUES ('101428', '001300040006', '00130004', '1455', '潘集区', '1');
INSERT INTO `region` VALUES ('101429', '001300040007', '00130004', '1456', '凤台县', '1');
INSERT INTO `region` VALUES ('101430', '001300050001', '00130005', '1457', '市辖区', '1');
INSERT INTO `region` VALUES ('101431', '001300050002', '00130005', '1458', '金家庄区', '1');
INSERT INTO `region` VALUES ('101432', '001300050003', '00130005', '1459', '花山区', '1');
INSERT INTO `region` VALUES ('101433', '001300050004', '00130005', '1460', '雨山区', '1');
INSERT INTO `region` VALUES ('101434', '001300050005', '00130005', '1461', '当涂县', '1');
INSERT INTO `region` VALUES ('101435', '001300060001', '00130006', '1462', '市辖区', '1');
INSERT INTO `region` VALUES ('101436', '001300060002', '00130006', '1463', '杜集区', '1');
INSERT INTO `region` VALUES ('101437', '001300060003', '00130006', '1464', '相山区', '1');
INSERT INTO `region` VALUES ('101438', '001300060004', '00130006', '1465', '烈山区', '1');
INSERT INTO `region` VALUES ('101439', '001300060005', '00130006', '1466', '濉溪县', '1');
INSERT INTO `region` VALUES ('101440', '001300070001', '00130007', '1467', '市辖区', '1');
INSERT INTO `region` VALUES ('101441', '001300070002', '00130007', '1468', '铜官山区', '1');
INSERT INTO `region` VALUES ('101442', '001300070003', '00130007', '1469', '狮子山区', '1');
INSERT INTO `region` VALUES ('101443', '001300070004', '00130007', '1470', '郊　区', '1');
INSERT INTO `region` VALUES ('101444', '001300070005', '00130007', '1471', '铜陵县', '1');
INSERT INTO `region` VALUES ('101445', '001300080001', '00130008', '1472', '市辖区', '1');
INSERT INTO `region` VALUES ('101446', '001300080002', '00130008', '1473', '迎江区', '1');
INSERT INTO `region` VALUES ('101447', '001300080003', '00130008', '1474', '大观区', '1');
INSERT INTO `region` VALUES ('101448', '001300080004', '00130008', '1475', '郊　区', '1');
INSERT INTO `region` VALUES ('101449', '001300080005', '00130008', '1476', '怀宁县', '1');
INSERT INTO `region` VALUES ('101450', '001300080006', '00130008', '1477', '枞阳县', '1');
INSERT INTO `region` VALUES ('101451', '001300080007', '00130008', '1478', '潜山县', '1');
INSERT INTO `region` VALUES ('101452', '001300080008', '00130008', '1479', '太湖县', '1');
INSERT INTO `region` VALUES ('101453', '001300080009', '00130008', '1480', '宿松县', '1');
INSERT INTO `region` VALUES ('101454', '001300080010', '00130008', '1481', '望江县', '1');
INSERT INTO `region` VALUES ('101455', '001300080011', '00130008', '1482', '岳西县', '1');
INSERT INTO `region` VALUES ('101456', '001300080012', '00130008', '1483', '桐城市', '1');
INSERT INTO `region` VALUES ('101457', '001300090001', '00130009', '1484', '市辖区', '1');
INSERT INTO `region` VALUES ('101458', '001300090002', '00130009', '1485', '屯溪区', '1');
INSERT INTO `region` VALUES ('101459', '001300090003', '00130009', '1486', '黄山区', '1');
INSERT INTO `region` VALUES ('101460', '001300090004', '00130009', '1487', '徽州区', '1');
INSERT INTO `region` VALUES ('101461', '001300090005', '00130009', '1488', '歙　县', '1');
INSERT INTO `region` VALUES ('101462', '001300090006', '00130009', '1489', '休宁县', '1');
INSERT INTO `region` VALUES ('101463', '001300090007', '00130009', '1490', '黟　县', '1');
INSERT INTO `region` VALUES ('101464', '001300090008', '00130009', '1491', '祁门县', '1');
INSERT INTO `region` VALUES ('101465', '001300100001', '00130010', '1492', '市辖区', '1');
INSERT INTO `region` VALUES ('101466', '001300100002', '00130010', '1493', '琅琊区', '1');
INSERT INTO `region` VALUES ('101467', '001300100003', '00130010', '1494', '南谯区', '1');
INSERT INTO `region` VALUES ('101468', '001300100004', '00130010', '1495', '来安县', '1');
INSERT INTO `region` VALUES ('101469', '001300100005', '00130010', '1496', '全椒县', '1');
INSERT INTO `region` VALUES ('101470', '001300100006', '00130010', '1497', '定远县', '1');
INSERT INTO `region` VALUES ('101471', '001300100007', '00130010', '1498', '凤阳县', '1');
INSERT INTO `region` VALUES ('101472', '001300100008', '00130010', '1499', '天长市', '1');
INSERT INTO `region` VALUES ('101473', '001300100009', '00130010', '1500', '明光市', '1');
INSERT INTO `region` VALUES ('101474', '001300110001', '00130011', '1501', '市辖区', '1');
INSERT INTO `region` VALUES ('101475', '001300110002', '00130011', '1502', '颍州区', '1');
INSERT INTO `region` VALUES ('101476', '001300110003', '00130011', '1503', '颍东区', '1');
INSERT INTO `region` VALUES ('101477', '001300110004', '00130011', '1504', '颍泉区', '1');
INSERT INTO `region` VALUES ('101478', '001300110005', '00130011', '1505', '临泉县', '1');
INSERT INTO `region` VALUES ('101479', '001300110006', '00130011', '1506', '太和县', '1');
INSERT INTO `region` VALUES ('101480', '001300110007', '00130011', '1507', '阜南县', '1');
INSERT INTO `region` VALUES ('101481', '001300110008', '00130011', '1508', '颍上县', '1');
INSERT INTO `region` VALUES ('101482', '001300110009', '00130011', '1509', '界首市', '1');
INSERT INTO `region` VALUES ('101483', '001300120001', '00130012', '1510', '市辖区', '1');
INSERT INTO `region` VALUES ('101484', '001300120002', '00130012', '1511', '墉桥区', '1');
INSERT INTO `region` VALUES ('101485', '001300120003', '00130012', '1512', '砀山县', '1');
INSERT INTO `region` VALUES ('101486', '001300120004', '00130012', '1513', '萧　县', '1');
INSERT INTO `region` VALUES ('101487', '001300120005', '00130012', '1514', '灵璧县', '1');
INSERT INTO `region` VALUES ('101488', '001300120006', '00130012', '1515', '泗　县', '1');
INSERT INTO `region` VALUES ('101489', '001300130001', '00130013', '1516', '市辖区', '1');
INSERT INTO `region` VALUES ('101490', '001300130002', '00130013', '1517', '居巢区', '1');
INSERT INTO `region` VALUES ('101491', '001300130003', '00130013', '1518', '庐江县', '1');
INSERT INTO `region` VALUES ('101492', '001300130004', '00130013', '1519', '无为县', '1');
INSERT INTO `region` VALUES ('101493', '001300130005', '00130013', '1520', '含山县', '1');
INSERT INTO `region` VALUES ('101494', '001300130006', '00130013', '1521', '和　县', '1');
INSERT INTO `region` VALUES ('101495', '001300140001', '00130014', '1522', '市辖区', '1');
INSERT INTO `region` VALUES ('101496', '001300140002', '00130014', '1523', '金安区', '1');
INSERT INTO `region` VALUES ('101497', '001300140003', '00130014', '1524', '裕安区', '1');
INSERT INTO `region` VALUES ('101498', '001300140004', '00130014', '1525', '寿　县', '1');
INSERT INTO `region` VALUES ('101499', '001300140005', '00130014', '1526', '霍邱县', '1');
INSERT INTO `region` VALUES ('101500', '001300140006', '00130014', '1527', '舒城县', '1');
INSERT INTO `region` VALUES ('101501', '001300140007', '00130014', '1528', '金寨县', '1');
INSERT INTO `region` VALUES ('101502', '001300140008', '00130014', '1529', '霍山县', '1');
INSERT INTO `region` VALUES ('101503', '001300150001', '00130015', '1530', '市辖区', '1');
INSERT INTO `region` VALUES ('101504', '001300150002', '00130015', '1531', '谯城区', '1');
INSERT INTO `region` VALUES ('101505', '001300150003', '00130015', '1532', '涡阳县', '1');
INSERT INTO `region` VALUES ('101506', '001300150004', '00130015', '1533', '蒙城县', '1');
INSERT INTO `region` VALUES ('101507', '001300150005', '00130015', '1534', '利辛县', '1');
INSERT INTO `region` VALUES ('101508', '001300160001', '00130016', '1535', '市辖区', '1');
INSERT INTO `region` VALUES ('101509', '001300160002', '00130016', '1536', '贵池区', '1');
INSERT INTO `region` VALUES ('101510', '001300160003', '00130016', '1537', '东至县', '1');
INSERT INTO `region` VALUES ('101511', '001300160004', '00130016', '1538', '石台县', '1');
INSERT INTO `region` VALUES ('101512', '001300160005', '00130016', '1539', '青阳县', '1');
INSERT INTO `region` VALUES ('101513', '001300170001', '00130017', '1540', '市辖区', '1');
INSERT INTO `region` VALUES ('101514', '001300170002', '00130017', '1541', '宣州区', '1');
INSERT INTO `region` VALUES ('101515', '001300170003', '00130017', '1542', '郎溪县', '1');
INSERT INTO `region` VALUES ('101516', '001300170004', '00130017', '1543', '广德县', '1');
INSERT INTO `region` VALUES ('101517', '001300170005', '00130017', '1544', '泾　县', '1');
INSERT INTO `region` VALUES ('101518', '001300170006', '00130017', '1545', '绩溪县', '1');
INSERT INTO `region` VALUES ('101519', '001300170007', '00130017', '1546', '旌德县', '1');
INSERT INTO `region` VALUES ('101520', '001300170008', '00130017', '1547', '宁国市', '1');
INSERT INTO `region` VALUES ('101521', '001400010001', '00140001', '1548', '市辖区', '1');
INSERT INTO `region` VALUES ('101522', '001400010002', '00140001', '1549', '鼓楼区', '1');
INSERT INTO `region` VALUES ('101523', '001400010003', '00140001', '1550', '台江区', '1');
INSERT INTO `region` VALUES ('101524', '001400010004', '00140001', '1551', '仓山区', '1');
INSERT INTO `region` VALUES ('101525', '001400010005', '00140001', '1552', '马尾区', '1');
INSERT INTO `region` VALUES ('101526', '001400010006', '00140001', '1553', '晋安区', '1');
INSERT INTO `region` VALUES ('101527', '001400010007', '00140001', '1554', '闽侯县', '1');
INSERT INTO `region` VALUES ('101528', '001400010008', '00140001', '1555', '连江县', '1');
INSERT INTO `region` VALUES ('101529', '001400010009', '00140001', '1556', '罗源县', '1');
INSERT INTO `region` VALUES ('101530', '001400010010', '00140001', '1557', '闽清县', '1');
INSERT INTO `region` VALUES ('101531', '001400010011', '00140001', '1558', '永泰县', '1');
INSERT INTO `region` VALUES ('101532', '001400010012', '00140001', '1559', '平潭县', '1');
INSERT INTO `region` VALUES ('101533', '001400010013', '00140001', '1560', '福清市', '1');
INSERT INTO `region` VALUES ('101534', '001400010014', '00140001', '1561', '长乐市', '1');
INSERT INTO `region` VALUES ('101535', '001400020001', '00140002', '1562', '市辖区', '1');
INSERT INTO `region` VALUES ('101536', '001400020002', '00140002', '1563', '思明区', '1');
INSERT INTO `region` VALUES ('101537', '001400020003', '00140002', '1564', '海沧区', '1');
INSERT INTO `region` VALUES ('101538', '001400020004', '00140002', '1565', '湖里区', '1');
INSERT INTO `region` VALUES ('101539', '001400020005', '00140002', '1566', '集美区', '1');
INSERT INTO `region` VALUES ('101540', '001400020006', '00140002', '1567', '同安区', '1');
INSERT INTO `region` VALUES ('101541', '001400020007', '00140002', '1568', '翔安区', '1');
INSERT INTO `region` VALUES ('101542', '001400030001', '00140003', '1569', '市辖区', '1');
INSERT INTO `region` VALUES ('101543', '001400030002', '00140003', '1570', '城厢区', '1');
INSERT INTO `region` VALUES ('101544', '001400030003', '00140003', '1571', '涵江区', '1');
INSERT INTO `region` VALUES ('101545', '001400030004', '00140003', '1572', '荔城区', '1');
INSERT INTO `region` VALUES ('101546', '001400030005', '00140003', '1573', '秀屿区', '1');
INSERT INTO `region` VALUES ('101547', '001400030006', '00140003', '1574', '仙游县', '1');
INSERT INTO `region` VALUES ('101548', '001400040001', '00140004', '1575', '市辖区', '1');
INSERT INTO `region` VALUES ('101549', '001400040002', '00140004', '1576', '梅列区', '1');
INSERT INTO `region` VALUES ('101550', '001400040003', '00140004', '1577', '三元区', '1');
INSERT INTO `region` VALUES ('101551', '001400040004', '00140004', '1578', '明溪县', '1');
INSERT INTO `region` VALUES ('101552', '001400040005', '00140004', '1579', '清流县', '1');
INSERT INTO `region` VALUES ('101553', '001400040006', '00140004', '1580', '宁化县', '1');
INSERT INTO `region` VALUES ('101554', '001400040007', '00140004', '1581', '大田县', '1');
INSERT INTO `region` VALUES ('101555', '001400040008', '00140004', '1582', '尤溪县', '1');
INSERT INTO `region` VALUES ('101556', '001400040009', '00140004', '1583', '沙　县', '1');
INSERT INTO `region` VALUES ('101557', '001400040010', '00140004', '1584', '将乐县', '1');
INSERT INTO `region` VALUES ('101558', '001400040011', '00140004', '1585', '泰宁县', '1');
INSERT INTO `region` VALUES ('101559', '001400040012', '00140004', '1586', '建宁县', '1');
INSERT INTO `region` VALUES ('101560', '001400040013', '00140004', '1587', '永安市', '1');
INSERT INTO `region` VALUES ('101561', '001400050001', '00140005', '1588', '市辖区', '1');
INSERT INTO `region` VALUES ('101562', '001400050002', '00140005', '1589', '鲤城区', '1');
INSERT INTO `region` VALUES ('101563', '001400050003', '00140005', '1590', '丰泽区', '1');
INSERT INTO `region` VALUES ('101564', '001400050004', '00140005', '1591', '洛江区', '1');
INSERT INTO `region` VALUES ('101565', '001400050005', '00140005', '1592', '泉港区', '1');
INSERT INTO `region` VALUES ('101566', '001400050006', '00140005', '1593', '惠安县', '1');
INSERT INTO `region` VALUES ('101567', '001400050007', '00140005', '1594', '安溪县', '1');
INSERT INTO `region` VALUES ('101568', '001400050008', '00140005', '1595', '永春县', '1');
INSERT INTO `region` VALUES ('101569', '001400050009', '00140005', '1596', '德化县', '1');
INSERT INTO `region` VALUES ('101570', '001400050010', '00140005', '1597', '金门县', '1');
INSERT INTO `region` VALUES ('101571', '001400050011', '00140005', '1598', '石狮市', '1');
INSERT INTO `region` VALUES ('101572', '001400050012', '00140005', '1599', '晋江市', '1');
INSERT INTO `region` VALUES ('101573', '001400050013', '00140005', '1600', '南安市', '1');
INSERT INTO `region` VALUES ('101574', '001400060001', '00140006', '1601', '市辖区', '1');
INSERT INTO `region` VALUES ('101575', '001400060002', '00140006', '1602', '芗城区', '1');
INSERT INTO `region` VALUES ('101576', '001400060003', '00140006', '1603', '龙文区', '1');
INSERT INTO `region` VALUES ('101577', '001400060004', '00140006', '1604', '云霄县', '1');
INSERT INTO `region` VALUES ('101578', '001400060005', '00140006', '1605', '漳浦县', '1');
INSERT INTO `region` VALUES ('101579', '001400060006', '00140006', '1606', '诏安县', '1');
INSERT INTO `region` VALUES ('101580', '001400060007', '00140006', '1607', '长泰县', '1');
INSERT INTO `region` VALUES ('101581', '001400060008', '00140006', '1608', '东山县', '1');
INSERT INTO `region` VALUES ('101582', '001400060009', '00140006', '1609', '南靖县', '1');
INSERT INTO `region` VALUES ('101583', '001400060010', '00140006', '1610', '平和县', '1');
INSERT INTO `region` VALUES ('101584', '001400060011', '00140006', '1611', '华安县', '1');
INSERT INTO `region` VALUES ('101585', '001400060012', '00140006', '1612', '龙海市', '1');
INSERT INTO `region` VALUES ('101586', '001400070001', '00140007', '1613', '市辖区', '1');
INSERT INTO `region` VALUES ('101587', '001400070002', '00140007', '1614', '延平区', '1');
INSERT INTO `region` VALUES ('101588', '001400070003', '00140007', '1615', '顺昌县', '1');
INSERT INTO `region` VALUES ('101589', '001400070004', '00140007', '1616', '浦城县', '1');
INSERT INTO `region` VALUES ('101590', '001400070005', '00140007', '1617', '光泽县', '1');
INSERT INTO `region` VALUES ('101591', '001400070006', '00140007', '1618', '松溪县', '1');
INSERT INTO `region` VALUES ('101592', '001400070007', '00140007', '1619', '政和县', '1');
INSERT INTO `region` VALUES ('101593', '001400070008', '00140007', '1620', '邵武市', '1');
INSERT INTO `region` VALUES ('101594', '001400070009', '00140007', '1621', '武夷山市', '1');
INSERT INTO `region` VALUES ('101595', '001400070010', '00140007', '1622', '建瓯市', '1');
INSERT INTO `region` VALUES ('101596', '001400070011', '00140007', '1623', '建阳市', '1');
INSERT INTO `region` VALUES ('101597', '001400080001', '00140008', '1624', '市辖区', '1');
INSERT INTO `region` VALUES ('101598', '001400080002', '00140008', '1625', '新罗区', '1');
INSERT INTO `region` VALUES ('101599', '001400080003', '00140008', '1626', '长汀县', '1');
INSERT INTO `region` VALUES ('101600', '001400080004', '00140008', '1627', '永定县', '1');
INSERT INTO `region` VALUES ('101601', '001400080005', '00140008', '1628', '上杭县', '1');
INSERT INTO `region` VALUES ('101602', '001400080006', '00140008', '1629', '武平县', '1');
INSERT INTO `region` VALUES ('101603', '001400080007', '00140008', '1630', '连城县', '1');
INSERT INTO `region` VALUES ('101604', '001400080008', '00140008', '1631', '漳平市', '1');
INSERT INTO `region` VALUES ('101605', '001400090001', '00140009', '1632', '市辖区', '1');
INSERT INTO `region` VALUES ('101606', '001400090002', '00140009', '1633', '蕉城区', '1');
INSERT INTO `region` VALUES ('101607', '001400090003', '00140009', '1634', '霞浦县', '1');
INSERT INTO `region` VALUES ('101608', '001400090004', '00140009', '1635', '古田县', '1');
INSERT INTO `region` VALUES ('101609', '001400090005', '00140009', '1636', '屏南县', '1');
INSERT INTO `region` VALUES ('101610', '001400090006', '00140009', '1637', '寿宁县', '1');
INSERT INTO `region` VALUES ('101611', '001400090007', '00140009', '1638', '周宁县', '1');
INSERT INTO `region` VALUES ('101612', '001400090008', '00140009', '1639', '柘荣县', '1');
INSERT INTO `region` VALUES ('101613', '001400090009', '00140009', '1640', '福安市', '1');
INSERT INTO `region` VALUES ('101614', '001400090010', '00140009', '1641', '福鼎市', '1');
INSERT INTO `region` VALUES ('101615', '001500010001', '00150001', '1642', '市辖区', '1');
INSERT INTO `region` VALUES ('101616', '001500010002', '00150001', '1643', '东湖区', '1');
INSERT INTO `region` VALUES ('101617', '001500010003', '00150001', '1644', '西湖区', '1');
INSERT INTO `region` VALUES ('101618', '001500010004', '00150001', '1645', '青云谱区', '1');
INSERT INTO `region` VALUES ('101619', '001500010005', '00150001', '1646', '湾里区', '1');
INSERT INTO `region` VALUES ('101620', '001500010006', '00150001', '1647', '青山湖区', '1');
INSERT INTO `region` VALUES ('101621', '001500010007', '00150001', '1648', '南昌县', '1');
INSERT INTO `region` VALUES ('101622', '001500010008', '00150001', '1649', '新建县', '1');
INSERT INTO `region` VALUES ('101623', '001500010009', '00150001', '1650', '安义县', '1');
INSERT INTO `region` VALUES ('101624', '001500010010', '00150001', '1651', '进贤县', '1');
INSERT INTO `region` VALUES ('101625', '001500020001', '00150002', '1652', '市辖区', '1');
INSERT INTO `region` VALUES ('101626', '001500020002', '00150002', '1653', '昌江区', '1');
INSERT INTO `region` VALUES ('101627', '001500020003', '00150002', '1654', '珠山区', '1');
INSERT INTO `region` VALUES ('101628', '001500020004', '00150002', '1655', '浮梁县', '1');
INSERT INTO `region` VALUES ('101629', '001500020005', '00150002', '1656', '乐平市', '1');
INSERT INTO `region` VALUES ('101630', '001500030001', '00150003', '1657', '市辖区', '1');
INSERT INTO `region` VALUES ('101631', '001500030002', '00150003', '1658', '安源区', '1');
INSERT INTO `region` VALUES ('101632', '001500030003', '00150003', '1659', '湘东区', '1');
INSERT INTO `region` VALUES ('101633', '001500030004', '00150003', '1660', '莲花县', '1');
INSERT INTO `region` VALUES ('101634', '001500030005', '00150003', '1661', '上栗县', '1');
INSERT INTO `region` VALUES ('101635', '001500030006', '00150003', '1662', '芦溪县', '1');
INSERT INTO `region` VALUES ('101636', '001500040001', '00150004', '1663', '市辖区', '1');
INSERT INTO `region` VALUES ('101637', '001500040002', '00150004', '1664', '庐山区', '1');
INSERT INTO `region` VALUES ('101638', '001500040003', '00150004', '1665', '浔阳区', '1');
INSERT INTO `region` VALUES ('101639', '001500040004', '00150004', '1666', '九江县', '1');
INSERT INTO `region` VALUES ('101640', '001500040005', '00150004', '1667', '武宁县', '1');
INSERT INTO `region` VALUES ('101641', '001500040006', '00150004', '1668', '修水县', '1');
INSERT INTO `region` VALUES ('101642', '001500040007', '00150004', '1669', '永修县', '1');
INSERT INTO `region` VALUES ('101643', '001500040008', '00150004', '1670', '德安县', '1');
INSERT INTO `region` VALUES ('101644', '001500040009', '00150004', '1671', '星子县', '1');
INSERT INTO `region` VALUES ('101645', '001500040010', '00150004', '1672', '都昌县', '1');
INSERT INTO `region` VALUES ('101646', '001500040011', '00150004', '1673', '湖口县', '1');
INSERT INTO `region` VALUES ('101647', '001500040012', '00150004', '1674', '彭泽县', '1');
INSERT INTO `region` VALUES ('101648', '001500040013', '00150004', '1675', '瑞昌市', '1');
INSERT INTO `region` VALUES ('101649', '001500050001', '00150005', '1676', '市辖区', '1');
INSERT INTO `region` VALUES ('101650', '001500050002', '00150005', '1677', '渝水区', '1');
INSERT INTO `region` VALUES ('101651', '001500050003', '00150005', '1678', '分宜县', '1');
INSERT INTO `region` VALUES ('101652', '001500060001', '00150006', '1679', '市辖区', '1');
INSERT INTO `region` VALUES ('101653', '001500060002', '00150006', '1680', '月湖区', '1');
INSERT INTO `region` VALUES ('101654', '001500060003', '00150006', '1681', '余江县', '1');
INSERT INTO `region` VALUES ('101655', '001500060004', '00150006', '1682', '贵溪市', '1');
INSERT INTO `region` VALUES ('101656', '001500070001', '00150007', '1683', '市辖区', '1');
INSERT INTO `region` VALUES ('101657', '001500070002', '00150007', '1684', '章贡区', '1');
INSERT INTO `region` VALUES ('101658', '001500070003', '00150007', '1685', '赣　县', '1');
INSERT INTO `region` VALUES ('101659', '001500070004', '00150007', '1686', '信丰县', '1');
INSERT INTO `region` VALUES ('101660', '001500070005', '00150007', '1687', '大余县', '1');
INSERT INTO `region` VALUES ('101661', '001500070006', '00150007', '1688', '上犹县', '1');
INSERT INTO `region` VALUES ('101662', '001500070007', '00150007', '1689', '崇义县', '1');
INSERT INTO `region` VALUES ('101663', '001500070008', '00150007', '1690', '安远县', '1');
INSERT INTO `region` VALUES ('101664', '001500070009', '00150007', '1691', '龙南县', '1');
INSERT INTO `region` VALUES ('101665', '001500070010', '00150007', '1692', '定南县', '1');
INSERT INTO `region` VALUES ('101666', '001500070011', '00150007', '1693', '全南县', '1');
INSERT INTO `region` VALUES ('101667', '001500070012', '00150007', '1694', '宁都县', '1');
INSERT INTO `region` VALUES ('101668', '001500070013', '00150007', '1695', '于都县', '1');
INSERT INTO `region` VALUES ('101669', '001500070014', '00150007', '1696', '兴国县', '1');
INSERT INTO `region` VALUES ('101670', '001500070015', '00150007', '1697', '会昌县', '1');
INSERT INTO `region` VALUES ('101671', '001500070016', '00150007', '1698', '寻乌县', '1');
INSERT INTO `region` VALUES ('101672', '001500070017', '00150007', '1699', '石城县', '1');
INSERT INTO `region` VALUES ('101673', '001500070018', '00150007', '1700', '瑞金市', '1');
INSERT INTO `region` VALUES ('101674', '001500070019', '00150007', '1701', '南康市', '1');
INSERT INTO `region` VALUES ('101675', '001500080001', '00150008', '1702', '市辖区', '1');
INSERT INTO `region` VALUES ('101676', '001500080002', '00150008', '1703', '吉州区', '1');
INSERT INTO `region` VALUES ('101677', '001500080003', '00150008', '1704', '青原区', '1');
INSERT INTO `region` VALUES ('101678', '001500080004', '00150008', '1705', '吉安县', '1');
INSERT INTO `region` VALUES ('101679', '001500080005', '00150008', '1706', '吉水县', '1');
INSERT INTO `region` VALUES ('101680', '001500080006', '00150008', '1707', '峡江县', '1');
INSERT INTO `region` VALUES ('101681', '001500080007', '00150008', '1708', '新干县', '1');
INSERT INTO `region` VALUES ('101682', '001500080008', '00150008', '1709', '永丰县', '1');
INSERT INTO `region` VALUES ('101683', '001500080009', '00150008', '1710', '泰和县', '1');
INSERT INTO `region` VALUES ('101684', '001500080010', '00150008', '1711', '遂川县', '1');
INSERT INTO `region` VALUES ('101685', '001500080011', '00150008', '1712', '万安县', '1');
INSERT INTO `region` VALUES ('101686', '001500080012', '00150008', '1713', '安福县', '1');
INSERT INTO `region` VALUES ('101687', '001500080013', '00150008', '1714', '永新县', '1');
INSERT INTO `region` VALUES ('101688', '001500080014', '00150008', '1715', '井冈山市', '1');
INSERT INTO `region` VALUES ('101689', '001500090001', '00150009', '1716', '市辖区', '1');
INSERT INTO `region` VALUES ('101690', '001500090002', '00150009', '1717', '袁州区', '1');
INSERT INTO `region` VALUES ('101691', '001500090003', '00150009', '1718', '奉新县', '1');
INSERT INTO `region` VALUES ('101692', '001500090004', '00150009', '1719', '万载县', '1');
INSERT INTO `region` VALUES ('101693', '001500090005', '00150009', '1720', '上高县', '1');
INSERT INTO `region` VALUES ('101694', '001500090006', '00150009', '1721', '宜丰县', '1');
INSERT INTO `region` VALUES ('101695', '001500090007', '00150009', '1722', '靖安县', '1');
INSERT INTO `region` VALUES ('101696', '001500090008', '00150009', '1723', '铜鼓县', '1');
INSERT INTO `region` VALUES ('101697', '001500090009', '00150009', '1724', '丰城市', '1');
INSERT INTO `region` VALUES ('101698', '001500090010', '00150009', '1725', '樟树市', '1');
INSERT INTO `region` VALUES ('101699', '001500090011', '00150009', '1726', '高安市', '1');
INSERT INTO `region` VALUES ('101700', '001500100001', '00150010', '1727', '市辖区', '1');
INSERT INTO `region` VALUES ('101701', '001500100002', '00150010', '1728', '临川区', '1');
INSERT INTO `region` VALUES ('101702', '001500100003', '00150010', '1729', '南城县', '1');
INSERT INTO `region` VALUES ('101703', '001500100004', '00150010', '1730', '黎川县', '1');
INSERT INTO `region` VALUES ('101704', '001500100005', '00150010', '1731', '南丰县', '1');
INSERT INTO `region` VALUES ('101705', '001500100006', '00150010', '1732', '崇仁县', '1');
INSERT INTO `region` VALUES ('101706', '001500100007', '00150010', '1733', '乐安县', '1');
INSERT INTO `region` VALUES ('101707', '001500100008', '00150010', '1734', '宜黄县', '1');
INSERT INTO `region` VALUES ('101708', '001500100009', '00150010', '1735', '金溪县', '1');
INSERT INTO `region` VALUES ('101709', '001500100010', '00150010', '1736', '资溪县', '1');
INSERT INTO `region` VALUES ('101710', '001500100011', '00150010', '1737', '东乡县', '1');
INSERT INTO `region` VALUES ('101711', '001500100012', '00150010', '1738', '广昌县', '1');
INSERT INTO `region` VALUES ('101712', '001500110001', '00150011', '1739', '市辖区', '1');
INSERT INTO `region` VALUES ('101713', '001500110002', '00150011', '1740', '信州区', '1');
INSERT INTO `region` VALUES ('101714', '001500110003', '00150011', '1741', '上饶县', '1');
INSERT INTO `region` VALUES ('101715', '001500110004', '00150011', '1742', '广丰县', '1');
INSERT INTO `region` VALUES ('101716', '001500110005', '00150011', '1743', '玉山县', '1');
INSERT INTO `region` VALUES ('101717', '001500110006', '00150011', '1744', '铅山县', '1');
INSERT INTO `region` VALUES ('101718', '001500110007', '00150011', '1745', '横峰县', '1');
INSERT INTO `region` VALUES ('101719', '001500110008', '00150011', '1746', '弋阳县', '1');
INSERT INTO `region` VALUES ('101720', '001500110009', '00150011', '1747', '余干县', '1');
INSERT INTO `region` VALUES ('101721', '001500110010', '00150011', '1748', '鄱阳县', '1');
INSERT INTO `region` VALUES ('101722', '001500110011', '00150011', '1749', '万年县', '1');
INSERT INTO `region` VALUES ('101723', '001500110012', '00150011', '1750', '婺源县', '1');
INSERT INTO `region` VALUES ('101724', '001500110013', '00150011', '1751', '德兴市', '1');
INSERT INTO `region` VALUES ('101725', '001600010001', '00160001', '1752', '市辖区', '1');
INSERT INTO `region` VALUES ('101726', '001600010002', '00160001', '1753', '历下区', '1');
INSERT INTO `region` VALUES ('101727', '001600010003', '00160001', '1754', '市中区', '1');
INSERT INTO `region` VALUES ('101728', '001600010004', '00160001', '1755', '槐荫区', '1');
INSERT INTO `region` VALUES ('101729', '001600010005', '00160001', '1756', '天桥区', '1');
INSERT INTO `region` VALUES ('101730', '001600010006', '00160001', '1757', '历城区', '1');
INSERT INTO `region` VALUES ('101731', '001600010007', '00160001', '1758', '长清区', '1');
INSERT INTO `region` VALUES ('101732', '001600010008', '00160001', '1759', '平阴县', '1');
INSERT INTO `region` VALUES ('101733', '001600010009', '00160001', '1760', '济阳县', '1');
INSERT INTO `region` VALUES ('101734', '001600010010', '00160001', '1761', '商河县', '1');
INSERT INTO `region` VALUES ('101735', '001600010011', '00160001', '1762', '章丘市', '1');
INSERT INTO `region` VALUES ('101736', '001600020001', '00160002', '1763', '市辖区', '1');
INSERT INTO `region` VALUES ('101737', '001600020002', '00160002', '1764', '市南区', '1');
INSERT INTO `region` VALUES ('101738', '001600020003', '00160002', '1765', '市北区', '1');
INSERT INTO `region` VALUES ('101739', '001600020004', '00160002', '1766', '四方区', '1');
INSERT INTO `region` VALUES ('101740', '001600020005', '00160002', '1767', '黄岛区', '1');
INSERT INTO `region` VALUES ('101741', '001600020006', '00160002', '1768', '崂山区', '1');
INSERT INTO `region` VALUES ('101742', '001600020007', '00160002', '1769', '李沧区', '1');
INSERT INTO `region` VALUES ('101743', '001600020008', '00160002', '1770', '城阳区', '1');
INSERT INTO `region` VALUES ('101744', '001600020009', '00160002', '1771', '胶州市', '1');
INSERT INTO `region` VALUES ('101745', '001600020010', '00160002', '1772', '即墨市', '1');
INSERT INTO `region` VALUES ('101746', '001600020011', '00160002', '1773', '平度市', '1');
INSERT INTO `region` VALUES ('101747', '001600020012', '00160002', '1774', '胶南市', '1');
INSERT INTO `region` VALUES ('101748', '001600020013', '00160002', '1775', '莱西市', '1');
INSERT INTO `region` VALUES ('101749', '001600030001', '00160003', '1776', '市辖区', '1');
INSERT INTO `region` VALUES ('101750', '001600030002', '00160003', '1777', '淄川区', '1');
INSERT INTO `region` VALUES ('101751', '001600030003', '00160003', '1778', '张店区', '1');
INSERT INTO `region` VALUES ('101752', '001600030004', '00160003', '1779', '博山区', '1');
INSERT INTO `region` VALUES ('101753', '001600030005', '00160003', '1780', '临淄区', '1');
INSERT INTO `region` VALUES ('101754', '001600030006', '00160003', '1781', '周村区', '1');
INSERT INTO `region` VALUES ('101755', '001600030007', '00160003', '1782', '桓台县', '1');
INSERT INTO `region` VALUES ('101756', '001600030008', '00160003', '1783', '高青县', '1');
INSERT INTO `region` VALUES ('101757', '001600030009', '00160003', '1784', '沂源县', '1');
INSERT INTO `region` VALUES ('101758', '001600040001', '00160004', '1785', '市辖区', '1');
INSERT INTO `region` VALUES ('101759', '001600040002', '00160004', '1786', '市中区', '1');
INSERT INTO `region` VALUES ('101760', '001600040003', '00160004', '1787', '薛城区', '1');
INSERT INTO `region` VALUES ('101761', '001600040004', '00160004', '1788', '峄城区', '1');
INSERT INTO `region` VALUES ('101762', '001600040005', '00160004', '1789', '台儿庄区', '1');
INSERT INTO `region` VALUES ('101763', '001600040006', '00160004', '1790', '山亭区', '1');
INSERT INTO `region` VALUES ('101764', '001600040007', '00160004', '1791', '滕州市', '1');
INSERT INTO `region` VALUES ('101765', '001600050001', '00160005', '1792', '市辖区', '1');
INSERT INTO `region` VALUES ('101766', '001600050002', '00160005', '1793', '东营区', '1');
INSERT INTO `region` VALUES ('101767', '001600050003', '00160005', '1794', '河口区', '1');
INSERT INTO `region` VALUES ('101768', '001600050004', '00160005', '1795', '垦利县', '1');
INSERT INTO `region` VALUES ('101769', '001600050005', '00160005', '1796', '利津县', '1');
INSERT INTO `region` VALUES ('101770', '001600050006', '00160005', '1797', '广饶县', '1');
INSERT INTO `region` VALUES ('101771', '001600060001', '00160006', '1798', '市辖区', '1');
INSERT INTO `region` VALUES ('101772', '001600060002', '00160006', '1799', '芝罘区', '1');
INSERT INTO `region` VALUES ('101773', '001600060003', '00160006', '1800', '福山区', '1');
INSERT INTO `region` VALUES ('101774', '001600060004', '00160006', '1801', '牟平区', '1');
INSERT INTO `region` VALUES ('101775', '001600060005', '00160006', '1802', '莱山区', '1');
INSERT INTO `region` VALUES ('101776', '001600060006', '00160006', '1803', '长岛县', '1');
INSERT INTO `region` VALUES ('101777', '001600060007', '00160006', '1804', '龙口市', '1');
INSERT INTO `region` VALUES ('101778', '001600060008', '00160006', '1805', '莱阳市', '1');
INSERT INTO `region` VALUES ('101779', '001600060009', '00160006', '1806', '莱州市', '1');
INSERT INTO `region` VALUES ('101780', '001600060010', '00160006', '1807', '蓬莱市', '1');
INSERT INTO `region` VALUES ('101781', '001600060011', '00160006', '1808', '招远市', '1');
INSERT INTO `region` VALUES ('101782', '001600060012', '00160006', '1809', '栖霞市', '1');
INSERT INTO `region` VALUES ('101783', '001600060013', '00160006', '1810', '海阳市', '1');
INSERT INTO `region` VALUES ('101784', '001600070001', '00160007', '1811', '市辖区', '1');
INSERT INTO `region` VALUES ('101785', '001600070002', '00160007', '1812', '潍城区', '1');
INSERT INTO `region` VALUES ('101786', '001600070003', '00160007', '1813', '寒亭区', '1');
INSERT INTO `region` VALUES ('101787', '001600070004', '00160007', '1814', '坊子区', '1');
INSERT INTO `region` VALUES ('101788', '001600070005', '00160007', '1815', '奎文区', '1');
INSERT INTO `region` VALUES ('101789', '001600070006', '00160007', '1816', '临朐县', '1');
INSERT INTO `region` VALUES ('101790', '001600070007', '00160007', '1817', '昌乐县', '1');
INSERT INTO `region` VALUES ('101791', '001600070008', '00160007', '1818', '青州市', '1');
INSERT INTO `region` VALUES ('101792', '001600070009', '00160007', '1819', '诸城市', '1');
INSERT INTO `region` VALUES ('101793', '001600070010', '00160007', '1820', '寿光市', '1');
INSERT INTO `region` VALUES ('101794', '001600070011', '00160007', '1821', '安丘市', '1');
INSERT INTO `region` VALUES ('101795', '001600070012', '00160007', '1822', '高密市', '1');
INSERT INTO `region` VALUES ('101796', '001600070013', '00160007', '1823', '昌邑市', '1');
INSERT INTO `region` VALUES ('101797', '001600080001', '00160008', '1824', '市辖区', '1');
INSERT INTO `region` VALUES ('101798', '001600080002', '00160008', '1825', '市中区', '1');
INSERT INTO `region` VALUES ('101799', '001600080003', '00160008', '1826', '任城区', '1');
INSERT INTO `region` VALUES ('101800', '001600080004', '00160008', '1827', '微山县', '1');
INSERT INTO `region` VALUES ('101801', '001600080005', '00160008', '1828', '鱼台县', '1');
INSERT INTO `region` VALUES ('101802', '001600080006', '00160008', '1829', '金乡县', '1');
INSERT INTO `region` VALUES ('101803', '001600080007', '00160008', '1830', '嘉祥县', '1');
INSERT INTO `region` VALUES ('101804', '001600080008', '00160008', '1831', '汶上县', '1');
INSERT INTO `region` VALUES ('101805', '001600080009', '00160008', '1832', '泗水县', '1');
INSERT INTO `region` VALUES ('101806', '001600080010', '00160008', '1833', '梁山县', '1');
INSERT INTO `region` VALUES ('101807', '001600080011', '00160008', '1834', '曲阜市', '1');
INSERT INTO `region` VALUES ('101808', '001600080012', '00160008', '1835', '兖州市', '1');
INSERT INTO `region` VALUES ('101809', '001600080013', '00160008', '1836', '邹城市', '1');
INSERT INTO `region` VALUES ('101810', '001600090001', '00160009', '1837', '市辖区', '1');
INSERT INTO `region` VALUES ('101811', '001600090002', '00160009', '1838', '泰山区', '1');
INSERT INTO `region` VALUES ('101812', '001600090003', '00160009', '1839', '岱岳区', '1');
INSERT INTO `region` VALUES ('101813', '001600090004', '00160009', '1840', '宁阳县', '1');
INSERT INTO `region` VALUES ('101814', '001600090005', '00160009', '1841', '东平县', '1');
INSERT INTO `region` VALUES ('101815', '001600090006', '00160009', '1842', '新泰市', '1');
INSERT INTO `region` VALUES ('101816', '001600090007', '00160009', '1843', '肥城市', '1');
INSERT INTO `region` VALUES ('101817', '001600100001', '00160010', '1844', '市辖区', '1');
INSERT INTO `region` VALUES ('101818', '001600100002', '00160010', '1845', '环翠区', '1');
INSERT INTO `region` VALUES ('101819', '001600100003', '00160010', '1846', '文登市', '1');
INSERT INTO `region` VALUES ('101820', '001600100004', '00160010', '1847', '荣成市', '1');
INSERT INTO `region` VALUES ('101821', '001600100005', '00160010', '1848', '乳山市', '1');
INSERT INTO `region` VALUES ('101822', '001600110001', '00160011', '1849', '市辖区', '1');
INSERT INTO `region` VALUES ('101823', '001600110002', '00160011', '1850', '东港区', '1');
INSERT INTO `region` VALUES ('101824', '001600110003', '00160011', '1851', '岚山区', '1');
INSERT INTO `region` VALUES ('101825', '001600110004', '00160011', '1852', '五莲县', '1');
INSERT INTO `region` VALUES ('101826', '001600110005', '00160011', '1853', '莒　县', '1');
INSERT INTO `region` VALUES ('101827', '001600120001', '00160012', '1854', '市辖区', '1');
INSERT INTO `region` VALUES ('101828', '001600120002', '00160012', '1855', '莱城区', '1');
INSERT INTO `region` VALUES ('101829', '001600120003', '00160012', '1856', '钢城区', '1');
INSERT INTO `region` VALUES ('101830', '001600130001', '00160013', '1857', '市辖区', '1');
INSERT INTO `region` VALUES ('101831', '001600130002', '00160013', '1858', '兰山区', '1');
INSERT INTO `region` VALUES ('101832', '001600130003', '00160013', '1859', '罗庄区', '1');
INSERT INTO `region` VALUES ('101833', '001600130004', '00160013', '1860', '河东区', '1');
INSERT INTO `region` VALUES ('101834', '001600130005', '00160013', '1861', '沂南县', '1');
INSERT INTO `region` VALUES ('101835', '001600130006', '00160013', '1862', '郯城县', '1');
INSERT INTO `region` VALUES ('101836', '001600130007', '00160013', '1863', '沂水县', '1');
INSERT INTO `region` VALUES ('101837', '001600130008', '00160013', '1864', '苍山县', '1');
INSERT INTO `region` VALUES ('101838', '001600130009', '00160013', '1865', '费　县', '1');
INSERT INTO `region` VALUES ('101839', '001600130010', '00160013', '1866', '平邑县', '1');
INSERT INTO `region` VALUES ('101840', '001600130011', '00160013', '1867', '莒南县', '1');
INSERT INTO `region` VALUES ('101841', '001600130012', '00160013', '1868', '蒙阴县', '1');
INSERT INTO `region` VALUES ('101842', '001600130013', '00160013', '1869', '临沭县', '1');
INSERT INTO `region` VALUES ('101843', '001600140001', '00160014', '1870', '市辖区', '1');
INSERT INTO `region` VALUES ('101844', '001600140002', '00160014', '1871', '德城区', '1');
INSERT INTO `region` VALUES ('101845', '001600140003', '00160014', '1872', '陵　县', '1');
INSERT INTO `region` VALUES ('101846', '001600140004', '00160014', '1873', '宁津县', '1');
INSERT INTO `region` VALUES ('101847', '001600140005', '00160014', '1874', '庆云县', '1');
INSERT INTO `region` VALUES ('101848', '001600140006', '00160014', '1875', '临邑县', '1');
INSERT INTO `region` VALUES ('101849', '001600140007', '00160014', '1876', '齐河县', '1');
INSERT INTO `region` VALUES ('101850', '001600140008', '00160014', '1877', '平原县', '1');
INSERT INTO `region` VALUES ('101851', '001600140009', '00160014', '1878', '夏津县', '1');
INSERT INTO `region` VALUES ('101852', '001600140010', '00160014', '1879', '武城县', '1');
INSERT INTO `region` VALUES ('101853', '001600140011', '00160014', '1880', '乐陵市', '1');
INSERT INTO `region` VALUES ('101854', '001600140012', '00160014', '1881', '禹城市', '1');
INSERT INTO `region` VALUES ('101855', '001600150001', '00160015', '1882', '市辖区', '1');
INSERT INTO `region` VALUES ('101856', '001600150002', '00160015', '1883', '东昌府区', '1');
INSERT INTO `region` VALUES ('101857', '001600150003', '00160015', '1884', '阳谷县', '1');
INSERT INTO `region` VALUES ('101858', '001600150004', '00160015', '1885', '莘　县', '1');
INSERT INTO `region` VALUES ('101859', '001600150005', '00160015', '1886', '茌平县', '1');
INSERT INTO `region` VALUES ('101860', '001600150006', '00160015', '1887', '东阿县', '1');
INSERT INTO `region` VALUES ('101861', '001600150007', '00160015', '1888', '冠　县', '1');
INSERT INTO `region` VALUES ('101862', '001600150008', '00160015', '1889', '高唐县', '1');
INSERT INTO `region` VALUES ('101863', '001600150009', '00160015', '1890', '临清市', '1');
INSERT INTO `region` VALUES ('101864', '001600160001', '00160016', '1891', '市辖区', '1');
INSERT INTO `region` VALUES ('101865', '001600160002', '00160016', '1892', '滨城区', '1');
INSERT INTO `region` VALUES ('101866', '001600160003', '00160016', '1893', '惠民县', '1');
INSERT INTO `region` VALUES ('101867', '001600160004', '00160016', '1894', '阳信县', '1');
INSERT INTO `region` VALUES ('101868', '001600160005', '00160016', '1895', '无棣县', '1');
INSERT INTO `region` VALUES ('101869', '001600160006', '00160016', '1896', '沾化县', '1');
INSERT INTO `region` VALUES ('101870', '001600160007', '00160016', '1897', '博兴县', '1');
INSERT INTO `region` VALUES ('101871', '001600160008', '00160016', '1898', '邹平县', '1');
INSERT INTO `region` VALUES ('101872', '001600170001', '00160017', '1899', '市辖区', '1');
INSERT INTO `region` VALUES ('101873', '001600170002', '00160017', '1900', '牡丹区', '1');
INSERT INTO `region` VALUES ('101874', '001600170003', '00160017', '1901', '曹　县', '1');
INSERT INTO `region` VALUES ('101875', '001600170004', '00160017', '1902', '单　县', '1');
INSERT INTO `region` VALUES ('101876', '001600170005', '00160017', '1903', '成武县', '1');
INSERT INTO `region` VALUES ('101877', '001600170006', '00160017', '1904', '巨野县', '1');
INSERT INTO `region` VALUES ('101878', '001600170007', '00160017', '1905', '郓城县', '1');
INSERT INTO `region` VALUES ('101879', '001600170008', '00160017', '1906', '鄄城县', '1');
INSERT INTO `region` VALUES ('101880', '001600170009', '00160017', '1907', '定陶县', '1');
INSERT INTO `region` VALUES ('101881', '001600170010', '00160017', '1908', '东明县', '1');
INSERT INTO `region` VALUES ('101882', '001700010001', '00170001', '1909', '市辖区', '1');
INSERT INTO `region` VALUES ('101883', '001700010002', '00170001', '1910', '中原区', '1');
INSERT INTO `region` VALUES ('101884', '001700010003', '00170001', '1911', '二七区', '1');
INSERT INTO `region` VALUES ('101885', '001700010004', '00170001', '1912', '管城回族区', '1');
INSERT INTO `region` VALUES ('101886', '001700010005', '00170001', '1913', '金水区', '1');
INSERT INTO `region` VALUES ('101887', '001700010006', '00170001', '1914', '上街区', '1');
INSERT INTO `region` VALUES ('101888', '001700010007', '00170001', '1915', '邙山区', '1');
INSERT INTO `region` VALUES ('101889', '001700010008', '00170001', '1916', '中牟县', '1');
INSERT INTO `region` VALUES ('101890', '001700010009', '00170001', '1917', '巩义市', '1');
INSERT INTO `region` VALUES ('101891', '001700010010', '00170001', '1918', '荥阳市', '1');
INSERT INTO `region` VALUES ('101892', '001700010011', '00170001', '1919', '新密市', '1');
INSERT INTO `region` VALUES ('101893', '001700010012', '00170001', '1920', '新郑市', '1');
INSERT INTO `region` VALUES ('101894', '001700010013', '00170001', '1921', '登封市', '1');
INSERT INTO `region` VALUES ('101895', '001700020001', '00170002', '1922', '市辖区', '1');
INSERT INTO `region` VALUES ('101896', '001700020002', '00170002', '1923', '龙亭区', '1');
INSERT INTO `region` VALUES ('101897', '001700020003', '00170002', '1924', '顺河回族区', '1');
INSERT INTO `region` VALUES ('101898', '001700020004', '00170002', '1925', '鼓楼区', '1');
INSERT INTO `region` VALUES ('101899', '001700020005', '00170002', '1926', '南关区', '1');
INSERT INTO `region` VALUES ('101900', '001700020006', '00170002', '1927', '郊　区', '1');
INSERT INTO `region` VALUES ('101901', '001700020007', '00170002', '1928', '杞　县', '1');
INSERT INTO `region` VALUES ('101902', '001700020008', '00170002', '1929', '通许县', '1');
INSERT INTO `region` VALUES ('101903', '001700020009', '00170002', '1930', '尉氏县', '1');
INSERT INTO `region` VALUES ('101904', '001700020010', '00170002', '1931', '开封县', '1');
INSERT INTO `region` VALUES ('101905', '001700020011', '00170002', '1932', '兰考县', '1');
INSERT INTO `region` VALUES ('101906', '001700030001', '00170003', '1933', '市辖区', '1');
INSERT INTO `region` VALUES ('101907', '001700030002', '00170003', '1934', '老城区', '1');
INSERT INTO `region` VALUES ('101908', '001700030003', '00170003', '1935', '西工区', '1');
INSERT INTO `region` VALUES ('101909', '001700030004', '00170003', '1936', '廛河回族区', '1');
INSERT INTO `region` VALUES ('101910', '001700030005', '00170003', '1937', '涧西区', '1');
INSERT INTO `region` VALUES ('101911', '001700030006', '00170003', '1938', '吉利区', '1');
INSERT INTO `region` VALUES ('101912', '001700030007', '00170003', '1939', '洛龙区', '1');
INSERT INTO `region` VALUES ('101913', '001700030008', '00170003', '1940', '孟津县', '1');
INSERT INTO `region` VALUES ('101914', '001700030009', '00170003', '1941', '新安县', '1');
INSERT INTO `region` VALUES ('101915', '001700030010', '00170003', '1942', '栾川县', '1');
INSERT INTO `region` VALUES ('101916', '001700030011', '00170003', '1943', '嵩　县', '1');
INSERT INTO `region` VALUES ('101917', '001700030012', '00170003', '1944', '汝阳县', '1');
INSERT INTO `region` VALUES ('101918', '001700030013', '00170003', '1945', '宜阳县', '1');
INSERT INTO `region` VALUES ('101919', '001700030014', '00170003', '1946', '洛宁县', '1');
INSERT INTO `region` VALUES ('101920', '001700030015', '00170003', '1947', '伊川县', '1');
INSERT INTO `region` VALUES ('101921', '001700030016', '00170003', '1948', '偃师市', '1');
INSERT INTO `region` VALUES ('101922', '001700040001', '00170004', '1949', '市辖区', '1');
INSERT INTO `region` VALUES ('101923', '001700040002', '00170004', '1950', '新华区', '1');
INSERT INTO `region` VALUES ('101924', '001700040003', '00170004', '1951', '卫东区', '1');
INSERT INTO `region` VALUES ('101925', '001700040004', '00170004', '1952', '石龙区', '1');
INSERT INTO `region` VALUES ('101926', '001700040005', '00170004', '1953', '湛河区', '1');
INSERT INTO `region` VALUES ('101927', '001700040006', '00170004', '1954', '宝丰县', '1');
INSERT INTO `region` VALUES ('101928', '001700040007', '00170004', '1955', '叶　县', '1');
INSERT INTO `region` VALUES ('101929', '001700040008', '00170004', '1956', '鲁山县', '1');
INSERT INTO `region` VALUES ('101930', '001700040009', '00170004', '1957', '郏　县', '1');
INSERT INTO `region` VALUES ('101931', '001700040010', '00170004', '1958', '舞钢市', '1');
INSERT INTO `region` VALUES ('101932', '001700040011', '00170004', '1959', '汝州市', '1');
INSERT INTO `region` VALUES ('101933', '001700050001', '00170005', '1960', '市辖区', '1');
INSERT INTO `region` VALUES ('101934', '001700050002', '00170005', '1961', '文峰区', '1');
INSERT INTO `region` VALUES ('101935', '001700050003', '00170005', '1962', '北关区', '1');
INSERT INTO `region` VALUES ('101936', '001700050004', '00170005', '1963', '殷都区', '1');
INSERT INTO `region` VALUES ('101937', '001700050005', '00170005', '1964', '龙安区', '1');
INSERT INTO `region` VALUES ('101938', '001700050006', '00170005', '1965', '安阳县', '1');
INSERT INTO `region` VALUES ('101939', '001700050007', '00170005', '1966', '汤阴县', '1');
INSERT INTO `region` VALUES ('101940', '001700050008', '00170005', '1967', '滑　县', '1');
INSERT INTO `region` VALUES ('101941', '001700050009', '00170005', '1968', '内黄县', '1');
INSERT INTO `region` VALUES ('101942', '001700050010', '00170005', '1969', '林州市', '1');
INSERT INTO `region` VALUES ('101943', '001700060001', '00170006', '1970', '市辖区', '1');
INSERT INTO `region` VALUES ('101944', '001700060002', '00170006', '1971', '鹤山区', '1');
INSERT INTO `region` VALUES ('101945', '001700060003', '00170006', '1972', '山城区', '1');
INSERT INTO `region` VALUES ('101946', '001700060004', '00170006', '1973', '淇滨区', '1');
INSERT INTO `region` VALUES ('101947', '001700060005', '00170006', '1974', '浚　县', '1');
INSERT INTO `region` VALUES ('101948', '001700060006', '00170006', '1975', '淇　县', '1');
INSERT INTO `region` VALUES ('101949', '001700070001', '00170007', '1976', '市辖区', '1');
INSERT INTO `region` VALUES ('101950', '001700070002', '00170007', '1977', '红旗区', '1');
INSERT INTO `region` VALUES ('101951', '001700070003', '00170007', '1978', '卫滨区', '1');
INSERT INTO `region` VALUES ('101952', '001700070004', '00170007', '1979', '凤泉区', '1');
INSERT INTO `region` VALUES ('101953', '001700070005', '00170007', '1980', '牧野区', '1');
INSERT INTO `region` VALUES ('101954', '001700070006', '00170007', '1981', '新乡县', '1');
INSERT INTO `region` VALUES ('101955', '001700070007', '00170007', '1982', '获嘉县', '1');
INSERT INTO `region` VALUES ('101956', '001700070008', '00170007', '1983', '原阳县', '1');
INSERT INTO `region` VALUES ('101957', '001700070009', '00170007', '1984', '延津县', '1');
INSERT INTO `region` VALUES ('101958', '001700070010', '00170007', '1985', '封丘县', '1');
INSERT INTO `region` VALUES ('101959', '001700070011', '00170007', '1986', '长垣县', '1');
INSERT INTO `region` VALUES ('101960', '001700070012', '00170007', '1987', '卫辉市', '1');
INSERT INTO `region` VALUES ('101961', '001700070013', '00170007', '1988', '辉县市', '1');
INSERT INTO `region` VALUES ('101962', '001700080001', '00170008', '1989', '市辖区', '1');
INSERT INTO `region` VALUES ('101963', '001700080002', '00170008', '1990', '解放区', '1');
INSERT INTO `region` VALUES ('101964', '001700080003', '00170008', '1991', '中站区', '1');
INSERT INTO `region` VALUES ('101965', '001700080004', '00170008', '1992', '马村区', '1');
INSERT INTO `region` VALUES ('101966', '001700080005', '00170008', '1993', '山阳区', '1');
INSERT INTO `region` VALUES ('101967', '001700080006', '00170008', '1994', '修武县', '1');
INSERT INTO `region` VALUES ('101968', '001700080007', '00170008', '1995', '博爱县', '1');
INSERT INTO `region` VALUES ('101969', '001700080008', '00170008', '1996', '武陟县', '1');
INSERT INTO `region` VALUES ('101970', '001700080009', '00170008', '1997', '温　县', '1');
INSERT INTO `region` VALUES ('101971', '001700080010', '00170008', '1998', '济源市', '1');
INSERT INTO `region` VALUES ('101972', '001700080011', '00170008', '1999', '沁阳市', '1');
INSERT INTO `region` VALUES ('101973', '001700080012', '00170008', '2000', '孟州市', '1');
INSERT INTO `region` VALUES ('101974', '001700090001', '00170009', '2001', '市辖区', '1');
INSERT INTO `region` VALUES ('101975', '001700090002', '00170009', '2002', '华龙区', '1');
INSERT INTO `region` VALUES ('101976', '001700090003', '00170009', '2003', '清丰县', '1');
INSERT INTO `region` VALUES ('101977', '001700090004', '00170009', '2004', '南乐县', '1');
INSERT INTO `region` VALUES ('101978', '001700090005', '00170009', '2005', '范　县', '1');
INSERT INTO `region` VALUES ('101979', '001700090006', '00170009', '2006', '台前县', '1');
INSERT INTO `region` VALUES ('101980', '001700090007', '00170009', '2007', '濮阳县', '1');
INSERT INTO `region` VALUES ('101981', '001700100001', '00170010', '2008', '市辖区', '1');
INSERT INTO `region` VALUES ('101982', '001700100002', '00170010', '2009', '魏都区', '1');
INSERT INTO `region` VALUES ('101983', '001700100003', '00170010', '2010', '许昌县', '1');
INSERT INTO `region` VALUES ('101984', '001700100004', '00170010', '2011', '鄢陵县', '1');
INSERT INTO `region` VALUES ('101985', '001700100005', '00170010', '2012', '襄城县', '1');
INSERT INTO `region` VALUES ('101986', '001700100006', '00170010', '2013', '禹州市', '1');
INSERT INTO `region` VALUES ('101987', '001700100007', '00170010', '2014', '长葛市', '1');
INSERT INTO `region` VALUES ('101988', '001700110001', '00170011', '2015', '市辖区', '1');
INSERT INTO `region` VALUES ('101989', '001700110002', '00170011', '2016', '源汇区', '1');
INSERT INTO `region` VALUES ('101990', '001700110003', '00170011', '2017', '郾城区', '1');
INSERT INTO `region` VALUES ('101991', '001700110004', '00170011', '2018', '召陵区', '1');
INSERT INTO `region` VALUES ('101992', '001700110005', '00170011', '2019', '舞阳县', '1');
INSERT INTO `region` VALUES ('101993', '001700110006', '00170011', '2020', '临颍县', '1');
INSERT INTO `region` VALUES ('101994', '001700120001', '00170012', '2021', '市辖区', '1');
INSERT INTO `region` VALUES ('101995', '001700120002', '00170012', '2022', '湖滨区', '1');
INSERT INTO `region` VALUES ('101996', '001700120003', '00170012', '2023', '渑池县', '1');
INSERT INTO `region` VALUES ('101997', '001700120004', '00170012', '2024', '陕　县', '1');
INSERT INTO `region` VALUES ('101998', '001700120005', '00170012', '2025', '卢氏县', '1');
INSERT INTO `region` VALUES ('101999', '001700120006', '00170012', '2026', '义马市', '1');
INSERT INTO `region` VALUES ('102000', '001700120007', '00170012', '2027', '灵宝市', '1');
INSERT INTO `region` VALUES ('102001', '001700130001', '00170013', '2028', '市辖区', '1');
INSERT INTO `region` VALUES ('102002', '001700130002', '00170013', '2029', '宛城区', '1');
INSERT INTO `region` VALUES ('102003', '001700130003', '00170013', '2030', '卧龙区', '1');
INSERT INTO `region` VALUES ('102004', '001700130004', '00170013', '2031', '南召县', '1');
INSERT INTO `region` VALUES ('102005', '001700130005', '00170013', '2032', '方城县', '1');
INSERT INTO `region` VALUES ('102006', '001700130006', '00170013', '2033', '西峡县', '1');
INSERT INTO `region` VALUES ('102007', '001700130007', '00170013', '2034', '镇平县', '1');
INSERT INTO `region` VALUES ('102008', '001700130008', '00170013', '2035', '内乡县', '1');
INSERT INTO `region` VALUES ('102009', '001700130009', '00170013', '2036', '淅川县', '1');
INSERT INTO `region` VALUES ('102010', '001700130010', '00170013', '2037', '社旗县', '1');
INSERT INTO `region` VALUES ('102011', '001700130011', '00170013', '2038', '唐河县', '1');
INSERT INTO `region` VALUES ('102012', '001700130012', '00170013', '2039', '新野县', '1');
INSERT INTO `region` VALUES ('102013', '001700130013', '00170013', '2040', '桐柏县', '1');
INSERT INTO `region` VALUES ('102014', '001700130014', '00170013', '2041', '邓州市', '1');
INSERT INTO `region` VALUES ('102015', '001700140001', '00170014', '2042', '市辖区', '1');
INSERT INTO `region` VALUES ('102016', '001700140002', '00170014', '2043', '梁园区', '1');
INSERT INTO `region` VALUES ('102017', '001700140003', '00170014', '2044', '睢阳区', '1');
INSERT INTO `region` VALUES ('102018', '001700140004', '00170014', '2045', '民权县', '1');
INSERT INTO `region` VALUES ('102019', '001700140005', '00170014', '2046', '睢　县', '1');
INSERT INTO `region` VALUES ('102020', '001700140006', '00170014', '2047', '宁陵县', '1');
INSERT INTO `region` VALUES ('102021', '001700140007', '00170014', '2048', '柘城县', '1');
INSERT INTO `region` VALUES ('102022', '001700140008', '00170014', '2049', '虞城县', '1');
INSERT INTO `region` VALUES ('102023', '001700140009', '00170014', '2050', '夏邑县', '1');
INSERT INTO `region` VALUES ('102024', '001700140010', '00170014', '2051', '永城市', '1');
INSERT INTO `region` VALUES ('102025', '001700150001', '00170015', '2052', '市辖区', '1');
INSERT INTO `region` VALUES ('102026', '001700150002', '00170015', '2053', '师河区', '1');
INSERT INTO `region` VALUES ('102027', '001700150003', '00170015', '2054', '平桥区', '1');
INSERT INTO `region` VALUES ('102028', '001700150004', '00170015', '2055', '罗山县', '1');
INSERT INTO `region` VALUES ('102029', '001700150005', '00170015', '2056', '光山县', '1');
INSERT INTO `region` VALUES ('102030', '001700150006', '00170015', '2057', '新　县', '1');
INSERT INTO `region` VALUES ('102031', '001700150007', '00170015', '2058', '商城县', '1');
INSERT INTO `region` VALUES ('102032', '001700150008', '00170015', '2059', '固始县', '1');
INSERT INTO `region` VALUES ('102033', '001700150009', '00170015', '2060', '潢川县', '1');
INSERT INTO `region` VALUES ('102034', '001700150010', '00170015', '2061', '淮滨县', '1');
INSERT INTO `region` VALUES ('102035', '001700150011', '00170015', '2062', '息　县', '1');
INSERT INTO `region` VALUES ('102036', '001700160001', '00170016', '2063', '市辖区', '1');
INSERT INTO `region` VALUES ('102037', '001700160002', '00170016', '2064', '川汇区', '1');
INSERT INTO `region` VALUES ('102038', '001700160003', '00170016', '2065', '扶沟县', '1');
INSERT INTO `region` VALUES ('102039', '001700160004', '00170016', '2066', '西华县', '1');
INSERT INTO `region` VALUES ('102040', '001700160005', '00170016', '2067', '商水县', '1');
INSERT INTO `region` VALUES ('102041', '001700160006', '00170016', '2068', '沈丘县', '1');
INSERT INTO `region` VALUES ('102042', '001700160007', '00170016', '2069', '郸城县', '1');
INSERT INTO `region` VALUES ('102043', '001700160008', '00170016', '2070', '淮阳县', '1');
INSERT INTO `region` VALUES ('102044', '001700160009', '00170016', '2071', '太康县', '1');
INSERT INTO `region` VALUES ('102045', '001700160010', '00170016', '2072', '鹿邑县', '1');
INSERT INTO `region` VALUES ('102046', '001700160011', '00170016', '2073', '项城市', '1');
INSERT INTO `region` VALUES ('102047', '001700170001', '00170017', '2074', '市辖区', '1');
INSERT INTO `region` VALUES ('102048', '001700170002', '00170017', '2075', '驿城区', '1');
INSERT INTO `region` VALUES ('102049', '001700170003', '00170017', '2076', '西平县', '1');
INSERT INTO `region` VALUES ('102050', '001700170004', '00170017', '2077', '上蔡县', '1');
INSERT INTO `region` VALUES ('102051', '001700170005', '00170017', '2078', '平舆县', '1');
INSERT INTO `region` VALUES ('102052', '001700170006', '00170017', '2079', '正阳县', '1');
INSERT INTO `region` VALUES ('102053', '001700170007', '00170017', '2080', '确山县', '1');
INSERT INTO `region` VALUES ('102054', '001700170008', '00170017', '2081', '泌阳县', '1');
INSERT INTO `region` VALUES ('102055', '001700170009', '00170017', '2082', '汝南县', '1');
INSERT INTO `region` VALUES ('102056', '001700170010', '00170017', '2083', '遂平县', '1');
INSERT INTO `region` VALUES ('102057', '001700170011', '00170017', '2084', '新蔡县', '1');
INSERT INTO `region` VALUES ('102058', '001800010001', '00180001', '2085', '市辖区', '1');
INSERT INTO `region` VALUES ('102059', '001800010002', '00180001', '2086', '江岸区', '1');
INSERT INTO `region` VALUES ('102060', '001800010003', '00180001', '2087', '江汉区', '1');
INSERT INTO `region` VALUES ('102061', '001800010004', '00180001', '2088', '乔口区', '1');
INSERT INTO `region` VALUES ('102062', '001800010005', '00180001', '2089', '汉阳区', '1');
INSERT INTO `region` VALUES ('102063', '001800010006', '00180001', '2090', '武昌区', '1');
INSERT INTO `region` VALUES ('102064', '001800010007', '00180001', '2091', '青山区', '1');
INSERT INTO `region` VALUES ('102065', '001800010008', '00180001', '2092', '洪山区', '1');
INSERT INTO `region` VALUES ('102066', '001800010009', '00180001', '2093', '东西湖区', '1');
INSERT INTO `region` VALUES ('102067', '001800010010', '00180001', '2094', '汉南区', '1');
INSERT INTO `region` VALUES ('102068', '001800010011', '00180001', '2095', '蔡甸区', '1');
INSERT INTO `region` VALUES ('102069', '001800010012', '00180001', '2096', '江夏区', '1');
INSERT INTO `region` VALUES ('102070', '001800010013', '00180001', '2097', '黄陂区', '1');
INSERT INTO `region` VALUES ('102071', '001800010014', '00180001', '2098', '新洲区', '1');
INSERT INTO `region` VALUES ('102072', '001800020001', '00180002', '2099', '市辖区', '1');
INSERT INTO `region` VALUES ('102073', '001800020002', '00180002', '2100', '黄石港区', '1');
INSERT INTO `region` VALUES ('102074', '001800020003', '00180002', '2101', '西塞山区', '1');
INSERT INTO `region` VALUES ('102075', '001800020004', '00180002', '2102', '下陆区', '1');
INSERT INTO `region` VALUES ('102076', '001800020005', '00180002', '2103', '铁山区', '1');
INSERT INTO `region` VALUES ('102077', '001800020006', '00180002', '2104', '阳新县', '1');
INSERT INTO `region` VALUES ('102078', '001800020007', '00180002', '2105', '大冶市', '1');
INSERT INTO `region` VALUES ('102079', '001800030001', '00180003', '2106', '市辖区', '1');
INSERT INTO `region` VALUES ('102080', '001800030002', '00180003', '2107', '茅箭区', '1');
INSERT INTO `region` VALUES ('102081', '001800030003', '00180003', '2108', '张湾区', '1');
INSERT INTO `region` VALUES ('102082', '001800030004', '00180003', '2109', '郧　县', '1');
INSERT INTO `region` VALUES ('102083', '001800030005', '00180003', '2110', '郧西县', '1');
INSERT INTO `region` VALUES ('102084', '001800030006', '00180003', '2111', '竹山县', '1');
INSERT INTO `region` VALUES ('102085', '001800030007', '00180003', '2112', '竹溪县', '1');
INSERT INTO `region` VALUES ('102086', '001800030008', '00180003', '2113', '房　县', '1');
INSERT INTO `region` VALUES ('102087', '001800030009', '00180003', '2114', '丹江口市', '1');
INSERT INTO `region` VALUES ('102088', '001800040001', '00180004', '2115', '市辖区', '1');
INSERT INTO `region` VALUES ('102089', '001800040002', '00180004', '2116', '西陵区', '1');
INSERT INTO `region` VALUES ('102090', '001800040003', '00180004', '2117', '伍家岗区', '1');
INSERT INTO `region` VALUES ('102091', '001800040004', '00180004', '2118', '点军区', '1');
INSERT INTO `region` VALUES ('102092', '001800040005', '00180004', '2119', '猇亭区', '1');
INSERT INTO `region` VALUES ('102093', '001800040006', '00180004', '2120', '夷陵区', '1');
INSERT INTO `region` VALUES ('102094', '001800040007', '00180004', '2121', '远安县', '1');
INSERT INTO `region` VALUES ('102095', '001800040008', '00180004', '2122', '兴山县', '1');
INSERT INTO `region` VALUES ('102096', '001800040009', '00180004', '2123', '秭归县', '1');
INSERT INTO `region` VALUES ('102097', '001800040010', '00180004', '2124', '长阳土家族自治县', '1');
INSERT INTO `region` VALUES ('102098', '001800040011', '00180004', '2125', '五峰土家族自治县', '1');
INSERT INTO `region` VALUES ('102099', '001800040012', '00180004', '2126', '宜都市', '1');
INSERT INTO `region` VALUES ('102100', '001800040013', '00180004', '2127', '当阳市', '1');
INSERT INTO `region` VALUES ('102101', '001800040014', '00180004', '2128', '枝江市', '1');
INSERT INTO `region` VALUES ('102102', '001800050001', '00180005', '2129', '市辖区', '1');
INSERT INTO `region` VALUES ('102103', '001800050002', '00180005', '2130', '襄城区', '1');
INSERT INTO `region` VALUES ('102104', '001800050003', '00180005', '2131', '樊城区', '1');
INSERT INTO `region` VALUES ('102105', '001800050004', '00180005', '2132', '襄阳区', '1');
INSERT INTO `region` VALUES ('102106', '001800050005', '00180005', '2133', '南漳县', '1');
INSERT INTO `region` VALUES ('102107', '001800050006', '00180005', '2134', '谷城县', '1');
INSERT INTO `region` VALUES ('102108', '001800050007', '00180005', '2135', '保康县', '1');
INSERT INTO `region` VALUES ('102109', '001800050008', '00180005', '2136', '老河口市', '1');
INSERT INTO `region` VALUES ('102110', '001800050009', '00180005', '2137', '枣阳市', '1');
INSERT INTO `region` VALUES ('102111', '001800050010', '00180005', '2138', '宜城市', '1');
INSERT INTO `region` VALUES ('102112', '001800060001', '00180006', '2139', '市辖区', '1');
INSERT INTO `region` VALUES ('102113', '001800060002', '00180006', '2140', '梁子湖区', '1');
INSERT INTO `region` VALUES ('102114', '001800060003', '00180006', '2141', '华容区', '1');
INSERT INTO `region` VALUES ('102115', '001800060004', '00180006', '2142', '鄂城区', '1');
INSERT INTO `region` VALUES ('102116', '001800070001', '00180007', '2143', '市辖区', '1');
INSERT INTO `region` VALUES ('102117', '001800070002', '00180007', '2144', '东宝区', '1');
INSERT INTO `region` VALUES ('102118', '001800070003', '00180007', '2145', '掇刀区', '1');
INSERT INTO `region` VALUES ('102119', '001800070004', '00180007', '2146', '京山县', '1');
INSERT INTO `region` VALUES ('102120', '001800070005', '00180007', '2147', '沙洋县', '1');
INSERT INTO `region` VALUES ('102121', '001800070006', '00180007', '2148', '钟祥市', '1');
INSERT INTO `region` VALUES ('102122', '001800080001', '00180008', '2149', '市辖区', '1');
INSERT INTO `region` VALUES ('102123', '001800080002', '00180008', '2150', '孝南区', '1');
INSERT INTO `region` VALUES ('102124', '001800080003', '00180008', '2151', '孝昌县', '1');
INSERT INTO `region` VALUES ('102125', '001800080004', '00180008', '2152', '大悟县', '1');
INSERT INTO `region` VALUES ('102126', '001800080005', '00180008', '2153', '云梦县', '1');
INSERT INTO `region` VALUES ('102127', '001800080006', '00180008', '2154', '应城市', '1');
INSERT INTO `region` VALUES ('102128', '001800080007', '00180008', '2155', '安陆市', '1');
INSERT INTO `region` VALUES ('102129', '001800080008', '00180008', '2156', '汉川市', '1');
INSERT INTO `region` VALUES ('102130', '001800090001', '00180009', '2157', '市辖区', '1');
INSERT INTO `region` VALUES ('102131', '001800090002', '00180009', '2158', '沙市区', '1');
INSERT INTO `region` VALUES ('102132', '001800090003', '00180009', '2159', '荆州区', '1');
INSERT INTO `region` VALUES ('102133', '001800090004', '00180009', '2160', '公安县', '1');
INSERT INTO `region` VALUES ('102134', '001800090005', '00180009', '2161', '监利县', '1');
INSERT INTO `region` VALUES ('102135', '001800090006', '00180009', '2162', '江陵县', '1');
INSERT INTO `region` VALUES ('102136', '001800090007', '00180009', '2163', '石首市', '1');
INSERT INTO `region` VALUES ('102137', '001800090008', '00180009', '2164', '洪湖市', '1');
INSERT INTO `region` VALUES ('102138', '001800090009', '00180009', '2165', '松滋市', '1');
INSERT INTO `region` VALUES ('102139', '001800100001', '00180010', '2166', '市辖区', '1');
INSERT INTO `region` VALUES ('102140', '001800100002', '00180010', '2167', '黄州区', '1');
INSERT INTO `region` VALUES ('102141', '001800100003', '00180010', '2168', '团风县', '1');
INSERT INTO `region` VALUES ('102142', '001800100004', '00180010', '2169', '红安县', '1');
INSERT INTO `region` VALUES ('102143', '001800100005', '00180010', '2170', '罗田县', '1');
INSERT INTO `region` VALUES ('102144', '001800100006', '00180010', '2171', '英山县', '1');
INSERT INTO `region` VALUES ('102145', '001800100007', '00180010', '2172', '浠水县', '1');
INSERT INTO `region` VALUES ('102146', '001800100008', '00180010', '2173', '蕲春县', '1');
INSERT INTO `region` VALUES ('102147', '001800100009', '00180010', '2174', '黄梅县', '1');
INSERT INTO `region` VALUES ('102148', '001800100010', '00180010', '2175', '麻城市', '1');
INSERT INTO `region` VALUES ('102149', '001800100011', '00180010', '2176', '武穴市', '1');
INSERT INTO `region` VALUES ('102150', '001800110001', '00180011', '2177', '市辖区', '1');
INSERT INTO `region` VALUES ('102151', '001800110002', '00180011', '2178', '咸安区', '1');
INSERT INTO `region` VALUES ('102152', '001800110003', '00180011', '2179', '嘉鱼县', '1');
INSERT INTO `region` VALUES ('102153', '001800110004', '00180011', '2180', '通城县', '1');
INSERT INTO `region` VALUES ('102154', '001800110005', '00180011', '2181', '崇阳县', '1');
INSERT INTO `region` VALUES ('102155', '001800110006', '00180011', '2182', '通山县', '1');
INSERT INTO `region` VALUES ('102156', '001800110007', '00180011', '2183', '赤壁市', '1');
INSERT INTO `region` VALUES ('102157', '001800120001', '00180012', '2184', '市辖区', '1');
INSERT INTO `region` VALUES ('102158', '001800120002', '00180012', '2185', '曾都区', '1');
INSERT INTO `region` VALUES ('102159', '001800120003', '00180012', '2186', '广水市', '1');
INSERT INTO `region` VALUES ('102160', '001800130001', '00180013', '2187', '恩施市', '1');
INSERT INTO `region` VALUES ('102161', '001800130002', '00180013', '2188', '利川市', '1');
INSERT INTO `region` VALUES ('102162', '001800130003', '00180013', '2189', '建始县', '1');
INSERT INTO `region` VALUES ('102163', '001800130004', '00180013', '2190', '巴东县', '1');
INSERT INTO `region` VALUES ('102164', '001800130005', '00180013', '2191', '宣恩县', '1');
INSERT INTO `region` VALUES ('102165', '001800130006', '00180013', '2192', '咸丰县', '1');
INSERT INTO `region` VALUES ('102166', '001800130007', '00180013', '2193', '来凤县', '1');
INSERT INTO `region` VALUES ('102167', '001800130008', '00180013', '2194', '鹤峰县', '1');
INSERT INTO `region` VALUES ('102168', '001800140001', '00180014', '2195', '仙桃市', '1');
INSERT INTO `region` VALUES ('102169', '001800140002', '00180014', '2196', '潜江市', '1');
INSERT INTO `region` VALUES ('102170', '001800140003', '00180014', '2197', '天门市', '1');
INSERT INTO `region` VALUES ('102171', '001800140004', '00180014', '2198', '神农架林区', '1');
INSERT INTO `region` VALUES ('102172', '001900010001', '00190001', '2199', '市辖区', '1');
INSERT INTO `region` VALUES ('102173', '001900010002', '00190001', '2200', '芙蓉区', '1');
INSERT INTO `region` VALUES ('102174', '001900010003', '00190001', '2201', '天心区', '1');
INSERT INTO `region` VALUES ('102175', '001900010004', '00190001', '2202', '岳麓区', '1');
INSERT INTO `region` VALUES ('102176', '001900010005', '00190001', '2203', '开福区', '1');
INSERT INTO `region` VALUES ('102177', '001900010006', '00190001', '2204', '雨花区', '1');
INSERT INTO `region` VALUES ('102178', '001900010007', '00190001', '2205', '长沙县', '1');
INSERT INTO `region` VALUES ('102179', '001900010008', '00190001', '2206', '望城县', '1');
INSERT INTO `region` VALUES ('102180', '001900010009', '00190001', '2207', '宁乡县', '1');
INSERT INTO `region` VALUES ('102181', '001900010010', '00190001', '2208', '浏阳市', '1');
INSERT INTO `region` VALUES ('102182', '001900020001', '00190002', '2209', '市辖区', '1');
INSERT INTO `region` VALUES ('102183', '001900020002', '00190002', '2210', '荷塘区', '1');
INSERT INTO `region` VALUES ('102184', '001900020003', '00190002', '2211', '芦淞区', '1');
INSERT INTO `region` VALUES ('102185', '001900020004', '00190002', '2212', '石峰区', '1');
INSERT INTO `region` VALUES ('102186', '001900020005', '00190002', '2213', '天元区', '1');
INSERT INTO `region` VALUES ('102187', '001900020006', '00190002', '2214', '株洲县', '1');
INSERT INTO `region` VALUES ('102188', '001900020007', '00190002', '2215', '攸　县', '1');
INSERT INTO `region` VALUES ('102189', '001900020008', '00190002', '2216', '茶陵县', '1');
INSERT INTO `region` VALUES ('102190', '001900020009', '00190002', '2217', '炎陵县', '1');
INSERT INTO `region` VALUES ('102191', '001900020010', '00190002', '2218', '醴陵市', '1');
INSERT INTO `region` VALUES ('102192', '001900030001', '00190003', '2219', '市辖区', '1');
INSERT INTO `region` VALUES ('102193', '001900030002', '00190003', '2220', '雨湖区', '1');
INSERT INTO `region` VALUES ('102194', '001900030003', '00190003', '2221', '岳塘区', '1');
INSERT INTO `region` VALUES ('102195', '001900030004', '00190003', '2222', '湘潭县', '1');
INSERT INTO `region` VALUES ('102196', '001900030005', '00190003', '2223', '湘乡市', '1');
INSERT INTO `region` VALUES ('102197', '001900030006', '00190003', '2224', '韶山市', '1');
INSERT INTO `region` VALUES ('102198', '001900040001', '00190004', '2225', '市辖区', '1');
INSERT INTO `region` VALUES ('102199', '001900040002', '00190004', '2226', '珠晖区', '1');
INSERT INTO `region` VALUES ('102200', '001900040003', '00190004', '2227', '雁峰区', '1');
INSERT INTO `region` VALUES ('102201', '001900040004', '00190004', '2228', '石鼓区', '1');
INSERT INTO `region` VALUES ('102202', '001900040005', '00190004', '2229', '蒸湘区', '1');
INSERT INTO `region` VALUES ('102203', '001900040006', '00190004', '2230', '南岳区', '1');
INSERT INTO `region` VALUES ('102204', '001900040007', '00190004', '2231', '衡阳县', '1');
INSERT INTO `region` VALUES ('102205', '001900040008', '00190004', '2232', '衡南县', '1');
INSERT INTO `region` VALUES ('102206', '001900040009', '00190004', '2233', '衡山县', '1');
INSERT INTO `region` VALUES ('102207', '001900040010', '00190004', '2234', '衡东县', '1');
INSERT INTO `region` VALUES ('102208', '001900040011', '00190004', '2235', '祁东县', '1');
INSERT INTO `region` VALUES ('102209', '001900040012', '00190004', '2236', '耒阳市', '1');
INSERT INTO `region` VALUES ('102210', '001900040013', '00190004', '2237', '常宁市', '1');
INSERT INTO `region` VALUES ('102211', '001900050001', '00190005', '2238', '市辖区', '1');
INSERT INTO `region` VALUES ('102212', '001900050002', '00190005', '2239', '双清区', '1');
INSERT INTO `region` VALUES ('102213', '001900050003', '00190005', '2240', '大祥区', '1');
INSERT INTO `region` VALUES ('102214', '001900050004', '00190005', '2241', '北塔区', '1');
INSERT INTO `region` VALUES ('102215', '001900050005', '00190005', '2242', '邵东县', '1');
INSERT INTO `region` VALUES ('102216', '001900050006', '00190005', '2243', '新邵县', '1');
INSERT INTO `region` VALUES ('102217', '001900050007', '00190005', '2244', '邵阳县', '1');
INSERT INTO `region` VALUES ('102218', '001900050008', '00190005', '2245', '隆回县', '1');
INSERT INTO `region` VALUES ('102219', '001900050009', '00190005', '2246', '洞口县', '1');
INSERT INTO `region` VALUES ('102220', '001900050010', '00190005', '2247', '绥宁县', '1');
INSERT INTO `region` VALUES ('102221', '001900050011', '00190005', '2248', '新宁县', '1');
INSERT INTO `region` VALUES ('102222', '001900050012', '00190005', '2249', '城步苗族自治县', '1');
INSERT INTO `region` VALUES ('102223', '001900050013', '00190005', '2250', '武冈市', '1');
INSERT INTO `region` VALUES ('102224', '001900060001', '00190006', '2251', '市辖区', '1');
INSERT INTO `region` VALUES ('102225', '001900060002', '00190006', '2252', '岳阳楼区', '1');
INSERT INTO `region` VALUES ('102226', '001900060003', '00190006', '2253', '云溪区', '1');
INSERT INTO `region` VALUES ('102227', '001900060004', '00190006', '2254', '君山区', '1');
INSERT INTO `region` VALUES ('102228', '001900060005', '00190006', '2255', '岳阳县', '1');
INSERT INTO `region` VALUES ('102229', '001900060006', '00190006', '2256', '华容县', '1');
INSERT INTO `region` VALUES ('102230', '001900060007', '00190006', '2257', '湘阴县', '1');
INSERT INTO `region` VALUES ('102231', '001900060008', '00190006', '2258', '平江县', '1');
INSERT INTO `region` VALUES ('102232', '001900060009', '00190006', '2259', '汨罗市', '1');
INSERT INTO `region` VALUES ('102233', '001900060010', '00190006', '2260', '临湘市', '1');
INSERT INTO `region` VALUES ('102234', '001900070001', '00190007', '2261', '市辖区', '1');
INSERT INTO `region` VALUES ('102235', '001900070002', '00190007', '2262', '武陵区', '1');
INSERT INTO `region` VALUES ('102236', '001900070003', '00190007', '2263', '鼎城区', '1');
INSERT INTO `region` VALUES ('102237', '001900070004', '00190007', '2264', '安乡县', '1');
INSERT INTO `region` VALUES ('102238', '001900070005', '00190007', '2265', '汉寿县', '1');
INSERT INTO `region` VALUES ('102239', '001900070006', '00190007', '2266', '澧　县', '1');
INSERT INTO `region` VALUES ('102240', '001900070007', '00190007', '2267', '临澧县', '1');
INSERT INTO `region` VALUES ('102241', '001900070008', '00190007', '2268', '桃源县', '1');
INSERT INTO `region` VALUES ('102242', '001900070009', '00190007', '2269', '石门县', '1');
INSERT INTO `region` VALUES ('102243', '001900070010', '00190007', '2270', '津市市', '1');
INSERT INTO `region` VALUES ('102244', '001900080001', '00190008', '2271', '市辖区', '1');
INSERT INTO `region` VALUES ('102245', '001900080002', '00190008', '2272', '永定区', '1');
INSERT INTO `region` VALUES ('102246', '001900080003', '00190008', '2273', '武陵源区', '1');
INSERT INTO `region` VALUES ('102247', '001900080004', '00190008', '2274', '慈利县', '1');
INSERT INTO `region` VALUES ('102248', '001900080005', '00190008', '2275', '桑植县', '1');
INSERT INTO `region` VALUES ('102249', '001900090001', '00190009', '2276', '市辖区', '1');
INSERT INTO `region` VALUES ('102250', '001900090002', '00190009', '2277', '资阳区', '1');
INSERT INTO `region` VALUES ('102251', '001900090003', '00190009', '2278', '赫山区', '1');
INSERT INTO `region` VALUES ('102252', '001900090004', '00190009', '2279', '南　县', '1');
INSERT INTO `region` VALUES ('102253', '001900090005', '00190009', '2280', '桃江县', '1');
INSERT INTO `region` VALUES ('102254', '001900090006', '00190009', '2281', '安化县', '1');
INSERT INTO `region` VALUES ('102255', '001900090007', '00190009', '2282', '沅江市', '1');
INSERT INTO `region` VALUES ('102256', '001900100001', '00190010', '2283', '市辖区', '1');
INSERT INTO `region` VALUES ('102257', '001900100002', '00190010', '2284', '北湖区', '1');
INSERT INTO `region` VALUES ('102258', '001900100003', '00190010', '2285', '苏仙区', '1');
INSERT INTO `region` VALUES ('102259', '001900100004', '00190010', '2286', '桂阳县', '1');
INSERT INTO `region` VALUES ('102260', '001900100005', '00190010', '2287', '宜章县', '1');
INSERT INTO `region` VALUES ('102261', '001900100006', '00190010', '2288', '永兴县', '1');
INSERT INTO `region` VALUES ('102262', '001900100007', '00190010', '2289', '嘉禾县', '1');
INSERT INTO `region` VALUES ('102263', '001900100008', '00190010', '2290', '临武县', '1');
INSERT INTO `region` VALUES ('102264', '001900100009', '00190010', '2291', '汝城县', '1');
INSERT INTO `region` VALUES ('102265', '001900100010', '00190010', '2292', '桂东县', '1');
INSERT INTO `region` VALUES ('102266', '001900100011', '00190010', '2293', '安仁县', '1');
INSERT INTO `region` VALUES ('102267', '001900100012', '00190010', '2294', '资兴市', '1');
INSERT INTO `region` VALUES ('102268', '001900110001', '00190011', '2295', '市辖区', '1');
INSERT INTO `region` VALUES ('102269', '001900110002', '00190011', '2296', '芝山区', '1');
INSERT INTO `region` VALUES ('102270', '001900110003', '00190011', '2297', '冷水滩区', '1');
INSERT INTO `region` VALUES ('102271', '001900110004', '00190011', '2298', '祁阳县', '1');
INSERT INTO `region` VALUES ('102272', '001900110005', '00190011', '2299', '东安县', '1');
INSERT INTO `region` VALUES ('102273', '001900110006', '00190011', '2300', '双牌县', '1');
INSERT INTO `region` VALUES ('102274', '001900110007', '00190011', '2301', '道　县', '1');
INSERT INTO `region` VALUES ('102275', '001900110008', '00190011', '2302', '江永县', '1');
INSERT INTO `region` VALUES ('102276', '001900110009', '00190011', '2303', '宁远县', '1');
INSERT INTO `region` VALUES ('102277', '001900110010', '00190011', '2304', '蓝山县', '1');
INSERT INTO `region` VALUES ('102278', '001900110011', '00190011', '2305', '新田县', '1');
INSERT INTO `region` VALUES ('102279', '001900110012', '00190011', '2306', '江华瑶族自治县', '1');
INSERT INTO `region` VALUES ('102280', '001900120001', '00190012', '2307', '市辖区', '1');
INSERT INTO `region` VALUES ('102281', '001900120002', '00190012', '2308', '鹤城区', '1');
INSERT INTO `region` VALUES ('102282', '001900120003', '00190012', '2309', '中方县', '1');
INSERT INTO `region` VALUES ('102283', '001900120004', '00190012', '2310', '沅陵县', '1');
INSERT INTO `region` VALUES ('102284', '001900120005', '00190012', '2311', '辰溪县', '1');
INSERT INTO `region` VALUES ('102285', '001900120006', '00190012', '2312', '溆浦县', '1');
INSERT INTO `region` VALUES ('102286', '001900120007', '00190012', '2313', '会同县', '1');
INSERT INTO `region` VALUES ('102287', '001900120008', '00190012', '2314', '麻阳苗族自治县', '1');
INSERT INTO `region` VALUES ('102288', '001900120009', '00190012', '2315', '新晃侗族自治县', '1');
INSERT INTO `region` VALUES ('102289', '001900120010', '00190012', '2316', '芷江侗族自治县', '1');
INSERT INTO `region` VALUES ('102290', '001900120011', '00190012', '2317', '靖州苗族侗族自治县', '1');
INSERT INTO `region` VALUES ('102291', '001900120012', '00190012', '2318', '通道侗族自治县', '1');
INSERT INTO `region` VALUES ('102292', '001900120013', '00190012', '2319', '洪江市', '1');
INSERT INTO `region` VALUES ('102293', '001900130001', '00190013', '2320', '市辖区', '1');
INSERT INTO `region` VALUES ('102294', '001900130002', '00190013', '2321', '娄星区', '1');
INSERT INTO `region` VALUES ('102295', '001900130003', '00190013', '2322', '双峰县', '1');
INSERT INTO `region` VALUES ('102296', '001900130004', '00190013', '2323', '新化县', '1');
INSERT INTO `region` VALUES ('102297', '001900130005', '00190013', '2324', '冷水江市', '1');
INSERT INTO `region` VALUES ('102298', '001900130006', '00190013', '2325', '涟源市', '1');
INSERT INTO `region` VALUES ('102299', '001900140001', '00190014', '2326', '吉首市', '1');
INSERT INTO `region` VALUES ('102300', '001900140002', '00190014', '2327', '泸溪县', '1');
INSERT INTO `region` VALUES ('102301', '001900140003', '00190014', '2328', '凤凰县', '1');
INSERT INTO `region` VALUES ('102302', '001900140004', '00190014', '2329', '花垣县', '1');
INSERT INTO `region` VALUES ('102303', '001900140005', '00190014', '2330', '保靖县', '1');
INSERT INTO `region` VALUES ('102304', '001900140006', '00190014', '2331', '古丈县', '1');
INSERT INTO `region` VALUES ('102305', '001900140007', '00190014', '2332', '永顺县', '1');
INSERT INTO `region` VALUES ('102306', '001900140008', '00190014', '2333', '龙山县', '1');
INSERT INTO `region` VALUES ('102307', '002000010001', '00200001', '2334', '市辖区', '1');
INSERT INTO `region` VALUES ('102308', '002000010002', '00200001', '2335', '东山区', '1');
INSERT INTO `region` VALUES ('102309', '002000010003', '00200001', '2336', '荔湾区', '1');
INSERT INTO `region` VALUES ('102310', '002000010004', '00200001', '2337', '越秀区', '1');
INSERT INTO `region` VALUES ('102311', '002000010005', '00200001', '2338', '海珠区', '1');
INSERT INTO `region` VALUES ('102312', '002000010006', '00200001', '2339', '天河区', '1');
INSERT INTO `region` VALUES ('102313', '002000010007', '00200001', '2340', '芳村区', '1');
INSERT INTO `region` VALUES ('102314', '002000010008', '00200001', '2341', '白云区', '1');
INSERT INTO `region` VALUES ('102315', '002000010009', '00200001', '2342', '黄埔区', '1');
INSERT INTO `region` VALUES ('102316', '002000010010', '00200001', '2343', '番禺区', '1');
INSERT INTO `region` VALUES ('102317', '002000010011', '00200001', '2344', '花都区', '1');
INSERT INTO `region` VALUES ('102318', '002000010012', '00200001', '2345', '增城市', '1');
INSERT INTO `region` VALUES ('102319', '002000010013', '00200001', '2346', '从化市', '1');
INSERT INTO `region` VALUES ('102320', '002000020001', '00200002', '2347', '市辖区', '1');
INSERT INTO `region` VALUES ('102321', '002000020002', '00200002', '2348', '武江区', '1');
INSERT INTO `region` VALUES ('102322', '002000020003', '00200002', '2349', '浈江区', '1');
INSERT INTO `region` VALUES ('102323', '002000020004', '00200002', '2350', '曲江区', '1');
INSERT INTO `region` VALUES ('102324', '002000020005', '00200002', '2351', '始兴县', '1');
INSERT INTO `region` VALUES ('102325', '002000020006', '00200002', '2352', '仁化县', '1');
INSERT INTO `region` VALUES ('102326', '002000020007', '00200002', '2353', '翁源县', '1');
INSERT INTO `region` VALUES ('102327', '002000020008', '00200002', '2354', '乳源瑶族自治县', '1');
INSERT INTO `region` VALUES ('102328', '002000020009', '00200002', '2355', '新丰县', '1');
INSERT INTO `region` VALUES ('102329', '002000020010', '00200002', '2356', '乐昌市', '1');
INSERT INTO `region` VALUES ('102330', '002000020011', '00200002', '2357', '南雄市', '1');
INSERT INTO `region` VALUES ('102331', '002000030001', '00200003', '2358', '市辖区', '1');
INSERT INTO `region` VALUES ('102332', '002000030002', '00200003', '2359', '罗湖区', '1');
INSERT INTO `region` VALUES ('102333', '002000030003', '00200003', '2360', '福田区', '1');
INSERT INTO `region` VALUES ('102334', '002000030004', '00200003', '2361', '南山区', '1');
INSERT INTO `region` VALUES ('102335', '002000030005', '00200003', '2362', '宝安区', '1');
INSERT INTO `region` VALUES ('102336', '002000030006', '00200003', '2363', '龙岗区', '1');
INSERT INTO `region` VALUES ('102337', '002000040001', '00200003', '2364', '盐田区', '1');
INSERT INTO `region` VALUES ('102338', '002000040002', '00200004', '2365', '市辖区', '1');
INSERT INTO `region` VALUES ('102339', '002000040003', '00200004', '2366', '香洲区', '1');
INSERT INTO `region` VALUES ('102340', '002000040004', '00200004', '2367', '斗门区', '1');
INSERT INTO `region` VALUES ('102341', '002000040005', '00200004', '2368', '金湾区', '1');
INSERT INTO `region` VALUES ('102342', '002000050001', '00200005', '2369', '市辖区', '1');
INSERT INTO `region` VALUES ('102343', '002000050002', '00200005', '2370', '龙湖区', '1');
INSERT INTO `region` VALUES ('102344', '002000050003', '00200005', '2371', '金平区', '1');
INSERT INTO `region` VALUES ('102345', '002000050004', '00200005', '2372', '濠江区', '1');
INSERT INTO `region` VALUES ('102346', '002000050005', '00200005', '2373', '潮阳区', '1');
INSERT INTO `region` VALUES ('102347', '002000050006', '00200005', '2374', '潮南区', '1');
INSERT INTO `region` VALUES ('102348', '002000050007', '00200005', '2375', '澄海区', '1');
INSERT INTO `region` VALUES ('102349', '002000050008', '00200005', '2376', '南澳县', '1');
INSERT INTO `region` VALUES ('102350', '002000060001', '00200006', '2377', '市辖区', '1');
INSERT INTO `region` VALUES ('102351', '002000060002', '00200006', '2378', '禅城区', '1');
INSERT INTO `region` VALUES ('102352', '002000060003', '00200006', '2379', '南海区', '1');
INSERT INTO `region` VALUES ('102353', '002000060004', '00200006', '2380', '顺德区', '1');
INSERT INTO `region` VALUES ('102354', '002000060005', '00200006', '2381', '三水区', '1');
INSERT INTO `region` VALUES ('102355', '002000060006', '00200006', '2382', '高明区', '1');
INSERT INTO `region` VALUES ('102356', '002000070001', '00200007', '2383', '市辖区', '1');
INSERT INTO `region` VALUES ('102357', '002000070002', '00200007', '2384', '蓬江区', '1');
INSERT INTO `region` VALUES ('102358', '002000070003', '00200007', '2385', '江海区', '1');
INSERT INTO `region` VALUES ('102359', '002000070004', '00200007', '2386', '新会区', '1');
INSERT INTO `region` VALUES ('102360', '002000070005', '00200007', '2387', '台山市', '1');
INSERT INTO `region` VALUES ('102361', '002000070006', '00200007', '2388', '开平市', '1');
INSERT INTO `region` VALUES ('102362', '002000070007', '00200007', '2389', '鹤山市', '1');
INSERT INTO `region` VALUES ('102363', '002000070008', '00200007', '2390', '恩平市', '1');
INSERT INTO `region` VALUES ('102364', '002000080001', '00200008', '2391', '市辖区', '1');
INSERT INTO `region` VALUES ('102365', '002000080002', '00200008', '2392', '赤坎区', '1');
INSERT INTO `region` VALUES ('102366', '002000080003', '00200008', '2393', '霞山区', '1');
INSERT INTO `region` VALUES ('102367', '002000080004', '00200008', '2394', '坡头区', '1');
INSERT INTO `region` VALUES ('102368', '002000080005', '00200008', '2395', '麻章区', '1');
INSERT INTO `region` VALUES ('102369', '002000080006', '00200008', '2396', '遂溪县', '1');
INSERT INTO `region` VALUES ('102370', '002000080007', '00200008', '2397', '徐闻县', '1');
INSERT INTO `region` VALUES ('102371', '002000080008', '00200008', '2398', '廉江市', '1');
INSERT INTO `region` VALUES ('102372', '002000080009', '00200008', '2399', '雷州市', '1');
INSERT INTO `region` VALUES ('102373', '002000080010', '00200008', '2400', '吴川市', '1');
INSERT INTO `region` VALUES ('102374', '002000090001', '00200009', '2401', '市辖区', '1');
INSERT INTO `region` VALUES ('102375', '002000090002', '00200009', '2402', '茂南区', '1');
INSERT INTO `region` VALUES ('102376', '002000090003', '00200009', '2403', '茂港区', '1');
INSERT INTO `region` VALUES ('102377', '002000090004', '00200009', '2404', '电白县', '1');
INSERT INTO `region` VALUES ('102378', '002000090005', '00200009', '2405', '高州市', '1');
INSERT INTO `region` VALUES ('102379', '002000090006', '00200009', '2406', '化州市', '1');
INSERT INTO `region` VALUES ('102380', '002000090007', '00200009', '2407', '信宜市', '1');
INSERT INTO `region` VALUES ('102381', '002000100001', '00200010', '2408', '市辖区', '1');
INSERT INTO `region` VALUES ('102382', '002000100002', '00200010', '2409', '端州区', '1');
INSERT INTO `region` VALUES ('102383', '002000100003', '00200010', '2410', '鼎湖区', '1');
INSERT INTO `region` VALUES ('102384', '002000100004', '00200010', '2411', '广宁县', '1');
INSERT INTO `region` VALUES ('102385', '002000100005', '00200010', '2412', '怀集县', '1');
INSERT INTO `region` VALUES ('102386', '002000100006', '00200010', '2413', '封开县', '1');
INSERT INTO `region` VALUES ('102387', '002000100007', '00200010', '2414', '德庆县', '1');
INSERT INTO `region` VALUES ('102388', '002000100008', '00200010', '2415', '高要市', '1');
INSERT INTO `region` VALUES ('102389', '002000100009', '00200010', '2416', '四会市', '1');
INSERT INTO `region` VALUES ('102390', '002000110001', '00200011', '2417', '市辖区', '1');
INSERT INTO `region` VALUES ('102391', '002000110002', '00200011', '2418', '惠城区', '1');
INSERT INTO `region` VALUES ('102392', '002000110003', '00200011', '2419', '惠阳区', '1');
INSERT INTO `region` VALUES ('102393', '002000110004', '00200011', '2420', '博罗县', '1');
INSERT INTO `region` VALUES ('102394', '002000110005', '00200011', '2421', '惠东县', '1');
INSERT INTO `region` VALUES ('102395', '002000110006', '00200011', '2422', '龙门县', '1');
INSERT INTO `region` VALUES ('102396', '002000120001', '00200012', '2423', '市辖区', '1');
INSERT INTO `region` VALUES ('102397', '002000120002', '00200012', '2424', '梅江区', '1');
INSERT INTO `region` VALUES ('102398', '002000120003', '00200012', '2425', '梅　县', '1');
INSERT INTO `region` VALUES ('102399', '002000120004', '00200012', '2426', '大埔县', '1');
INSERT INTO `region` VALUES ('102400', '002000120005', '00200012', '2427', '丰顺县', '1');
INSERT INTO `region` VALUES ('102401', '002000120006', '00200012', '2428', '五华县', '1');
INSERT INTO `region` VALUES ('102402', '002000120007', '00200012', '2429', '平远县', '1');
INSERT INTO `region` VALUES ('102403', '002000120008', '00200012', '2430', '蕉岭县', '1');
INSERT INTO `region` VALUES ('102404', '002000120009', '00200012', '2431', '兴宁市', '1');
INSERT INTO `region` VALUES ('102405', '002000130001', '00200013', '2432', '市辖区', '1');
INSERT INTO `region` VALUES ('102406', '002000130002', '00200013', '2433', '城　区', '1');
INSERT INTO `region` VALUES ('102407', '002000130003', '00200013', '2434', '海丰县', '1');
INSERT INTO `region` VALUES ('102408', '002000130004', '00200013', '2435', '陆河县', '1');
INSERT INTO `region` VALUES ('102409', '002000130005', '00200013', '2436', '陆丰市', '1');
INSERT INTO `region` VALUES ('102410', '002000140001', '00200014', '2437', '市辖区', '1');
INSERT INTO `region` VALUES ('102411', '002000140002', '00200014', '2438', '源城区', '1');
INSERT INTO `region` VALUES ('102412', '002000140003', '00200014', '2439', '紫金县', '1');
INSERT INTO `region` VALUES ('102413', '002000140004', '00200014', '2440', '龙川县', '1');
INSERT INTO `region` VALUES ('102414', '002000140005', '00200014', '2441', '连平县', '1');
INSERT INTO `region` VALUES ('102415', '002000140006', '00200014', '2442', '和平县', '1');
INSERT INTO `region` VALUES ('102416', '002000140007', '00200014', '2443', '东源县', '1');
INSERT INTO `region` VALUES ('102417', '002000150001', '00200015', '2444', '市辖区', '1');
INSERT INTO `region` VALUES ('102418', '002000150002', '00200015', '2445', '江城区', '1');
INSERT INTO `region` VALUES ('102419', '002000150003', '00200015', '2446', '阳西县', '1');
INSERT INTO `region` VALUES ('102420', '002000150004', '00200015', '2447', '阳东县', '1');
INSERT INTO `region` VALUES ('102421', '002000150005', '00200015', '2448', '阳春市', '1');
INSERT INTO `region` VALUES ('102422', '002000160001', '00200016', '2449', '市辖区', '1');
INSERT INTO `region` VALUES ('102423', '002000160002', '00200016', '2450', '清城区', '1');
INSERT INTO `region` VALUES ('102424', '002000160003', '00200016', '2451', '佛冈县', '1');
INSERT INTO `region` VALUES ('102425', '002000160004', '00200016', '2452', '阳山县', '1');
INSERT INTO `region` VALUES ('102426', '002000160005', '00200016', '2453', '连山壮族瑶族自治县', '1');
INSERT INTO `region` VALUES ('102427', '002000160006', '00200016', '2454', '连南瑶族自治县', '1');
INSERT INTO `region` VALUES ('102428', '002000160007', '00200016', '2455', '清新县', '1');
INSERT INTO `region` VALUES ('102429', '002000160008', '00200016', '2456', '英德市', '1');
INSERT INTO `region` VALUES ('102430', '002000160009', '00200016', '2457', '连州市', '1');
INSERT INTO `region` VALUES ('102431', '002000190001', '00200019', '2458', '市辖区', '1');
INSERT INTO `region` VALUES ('102432', '002000190002', '00200019', '2459', '湘桥区', '1');
INSERT INTO `region` VALUES ('102433', '002000190003', '00200019', '2460', '潮安县', '1');
INSERT INTO `region` VALUES ('102434', '002000190004', '00200019', '2461', '饶平县', '1');
INSERT INTO `region` VALUES ('102435', '002000200001', '00200020', '2462', '市辖区', '1');
INSERT INTO `region` VALUES ('102436', '002000200002', '00200020', '2463', '榕城区', '1');
INSERT INTO `region` VALUES ('102437', '002000200003', '00200020', '2464', '揭东县', '1');
INSERT INTO `region` VALUES ('102438', '002000200004', '00200020', '2465', '揭西县', '1');
INSERT INTO `region` VALUES ('102439', '002000200005', '00200020', '2466', '惠来县', '1');
INSERT INTO `region` VALUES ('102440', '002000200006', '00200020', '2467', '普宁市', '1');
INSERT INTO `region` VALUES ('102441', '002000210001', '00200021', '2468', '市辖区', '1');
INSERT INTO `region` VALUES ('102442', '002000210002', '00200021', '2469', '云城区', '1');
INSERT INTO `region` VALUES ('102443', '002000210003', '00200021', '2470', '新兴县', '1');
INSERT INTO `region` VALUES ('102444', '002000210004', '00200021', '2471', '郁南县', '1');
INSERT INTO `region` VALUES ('102445', '002000210005', '00200021', '2472', '云安县', '1');
INSERT INTO `region` VALUES ('102446', '002000210006', '00200021', '2473', '罗定市', '1');
INSERT INTO `region` VALUES ('102447', '002000210007', '00210001', '2474', '市辖区', '1');
INSERT INTO `region` VALUES ('102448', '002100010001', '00210001', '2475', '兴宁区', '1');
INSERT INTO `region` VALUES ('102449', '002100010002', '00210001', '2476', '青秀区', '1');
INSERT INTO `region` VALUES ('102450', '002100010003', '00210001', '2477', '江南区', '1');
INSERT INTO `region` VALUES ('102451', '002100010004', '00210001', '2478', '西乡塘区', '1');
INSERT INTO `region` VALUES ('102452', '002100010005', '00210001', '2479', '良庆区', '1');
INSERT INTO `region` VALUES ('102453', '002100010006', '00210001', '2480', '邕宁区', '1');
INSERT INTO `region` VALUES ('102454', '002100010007', '00210001', '2481', '武鸣县', '1');
INSERT INTO `region` VALUES ('102455', '002100010008', '00210001', '2482', '隆安县', '1');
INSERT INTO `region` VALUES ('102456', '002100010009', '00210001', '2483', '马山县', '1');
INSERT INTO `region` VALUES ('102457', '002100010010', '00210001', '2484', '上林县', '1');
INSERT INTO `region` VALUES ('102458', '002100010011', '00210001', '2485', '宾阳县', '1');
INSERT INTO `region` VALUES ('102459', '002100010012', '00210001', '2486', '横　县', '1');
INSERT INTO `region` VALUES ('102460', '002100020001', '00210002', '2487', '市辖区', '1');
INSERT INTO `region` VALUES ('102461', '002100020002', '00210002', '2488', '城中区', '1');
INSERT INTO `region` VALUES ('102462', '002100020003', '00210002', '2489', '鱼峰区', '1');
INSERT INTO `region` VALUES ('102463', '002100020004', '00210002', '2490', '柳南区', '1');
INSERT INTO `region` VALUES ('102464', '002100020005', '00210002', '2491', '柳北区', '1');
INSERT INTO `region` VALUES ('102465', '002100020006', '00210002', '2492', '柳江县', '1');
INSERT INTO `region` VALUES ('102466', '002100020007', '00210002', '2493', '柳城县', '1');
INSERT INTO `region` VALUES ('102467', '002100020008', '00210002', '2494', '鹿寨县', '1');
INSERT INTO `region` VALUES ('102468', '002100020009', '00210002', '2495', '融安县', '1');
INSERT INTO `region` VALUES ('102469', '002100020010', '00210002', '2496', '融水苗族自治县', '1');
INSERT INTO `region` VALUES ('102470', '002100020011', '00210002', '2497', '三江侗族自治县', '1');
INSERT INTO `region` VALUES ('102471', '002100030001', '00210003', '2498', '市辖区', '1');
INSERT INTO `region` VALUES ('102472', '002100030002', '00210003', '2499', '秀峰区', '1');
INSERT INTO `region` VALUES ('102473', '002100030003', '00210003', '2500', '叠彩区', '1');
INSERT INTO `region` VALUES ('102474', '002100030004', '00210003', '2501', '象山区', '1');
INSERT INTO `region` VALUES ('102475', '002100030005', '00210003', '2502', '七星区', '1');
INSERT INTO `region` VALUES ('102476', '002100030006', '00210003', '2503', '雁山区', '1');
INSERT INTO `region` VALUES ('102477', '002100030007', '00210003', '2504', '阳朔县', '1');
INSERT INTO `region` VALUES ('102478', '002100030008', '00210003', '2505', '临桂县', '1');
INSERT INTO `region` VALUES ('102479', '002100030009', '00210003', '2506', '灵川县', '1');
INSERT INTO `region` VALUES ('102480', '002100030010', '00210003', '2507', '全州县', '1');
INSERT INTO `region` VALUES ('102481', '002100030011', '00210003', '2508', '兴安县', '1');
INSERT INTO `region` VALUES ('102482', '002100030012', '00210003', '2509', '永福县', '1');
INSERT INTO `region` VALUES ('102483', '002100030013', '00210003', '2510', '灌阳县', '1');
INSERT INTO `region` VALUES ('102484', '002100030014', '00210003', '2511', '龙胜各族自治县', '1');
INSERT INTO `region` VALUES ('102485', '002100030015', '00210003', '2512', '资源县', '1');
INSERT INTO `region` VALUES ('102486', '002100030016', '00210003', '2513', '平乐县', '1');
INSERT INTO `region` VALUES ('102487', '002100030017', '00210003', '2514', '荔蒲县', '1');
INSERT INTO `region` VALUES ('102488', '002100030018', '00210003', '2515', '恭城瑶族自治县', '1');
INSERT INTO `region` VALUES ('102489', '002100040001', '00210004', '2516', '市辖区', '1');
INSERT INTO `region` VALUES ('102490', '002100040002', '00210004', '2517', '万秀区', '1');
INSERT INTO `region` VALUES ('102491', '002100040003', '00210004', '2518', '蝶山区', '1');
INSERT INTO `region` VALUES ('102492', '002100040004', '00210004', '2519', '长洲区', '1');
INSERT INTO `region` VALUES ('102493', '002100040005', '00210004', '2520', '苍梧县', '1');
INSERT INTO `region` VALUES ('102494', '002100040006', '00210004', '2521', '藤　县', '1');
INSERT INTO `region` VALUES ('102495', '002100040007', '00210004', '2522', '蒙山县', '1');
INSERT INTO `region` VALUES ('102496', '002100040008', '00210004', '2523', '岑溪市', '1');
INSERT INTO `region` VALUES ('102497', '002100050001', '00210005', '2524', '市辖区', '1');
INSERT INTO `region` VALUES ('102498', '002100050002', '00210005', '2525', '海城区', '1');
INSERT INTO `region` VALUES ('102499', '002100050003', '00210005', '2526', '银海区', '1');
INSERT INTO `region` VALUES ('102500', '002100050004', '00210005', '2527', '铁山港区', '1');
INSERT INTO `region` VALUES ('102501', '002100050005', '00210005', '2528', '合浦县', '1');
INSERT INTO `region` VALUES ('102502', '002100060001', '00210006', '2529', '市辖区', '1');
INSERT INTO `region` VALUES ('102503', '002100060002', '00210006', '2530', '港口区', '1');
INSERT INTO `region` VALUES ('102504', '002100060003', '00210006', '2531', '防城区', '1');
INSERT INTO `region` VALUES ('102505', '002100060004', '00210006', '2532', '上思县', '1');
INSERT INTO `region` VALUES ('102506', '002100060005', '00210006', '2533', '东兴市', '1');
INSERT INTO `region` VALUES ('102507', '002100070001', '00210007', '2534', '市辖区', '1');
INSERT INTO `region` VALUES ('102508', '002100070002', '00210007', '2535', '钦南区', '1');
INSERT INTO `region` VALUES ('102509', '002100070003', '00210007', '2536', '钦北区', '1');
INSERT INTO `region` VALUES ('102510', '002100070004', '00210007', '2537', '灵山县', '1');
INSERT INTO `region` VALUES ('102511', '002100070005', '00210007', '2538', '浦北县', '1');
INSERT INTO `region` VALUES ('102512', '002100080001', '00210008', '2539', '市辖区', '1');
INSERT INTO `region` VALUES ('102513', '002100080002', '00210008', '2540', '港北区', '1');
INSERT INTO `region` VALUES ('102514', '002100080003', '00210008', '2541', '港南区', '1');
INSERT INTO `region` VALUES ('102515', '002100080004', '00210008', '2542', '覃塘区', '1');
INSERT INTO `region` VALUES ('102516', '002100080005', '00210008', '2543', '平南县', '1');
INSERT INTO `region` VALUES ('102517', '002100080006', '00210008', '2544', '桂平市', '1');
INSERT INTO `region` VALUES ('102518', '002100090001', '00210009', '2545', '市辖区', '1');
INSERT INTO `region` VALUES ('102519', '002100090002', '00210009', '2546', '玉州区', '1');
INSERT INTO `region` VALUES ('102520', '002100090003', '00210009', '2547', '容　县', '1');
INSERT INTO `region` VALUES ('102521', '002100090004', '00210009', '2548', '陆川县', '1');
INSERT INTO `region` VALUES ('102522', '002100090005', '00210009', '2549', '博白县', '1');
INSERT INTO `region` VALUES ('102523', '002100090006', '00210009', '2550', '兴业县', '1');
INSERT INTO `region` VALUES ('102524', '002100090007', '00210009', '2551', '北流市', '1');
INSERT INTO `region` VALUES ('102525', '002100100001', '00210010', '2552', '市辖区', '1');
INSERT INTO `region` VALUES ('102526', '002100100002', '00210010', '2553', '右江区', '1');
INSERT INTO `region` VALUES ('102527', '002100100003', '00210010', '2554', '田阳县', '1');
INSERT INTO `region` VALUES ('102528', '002100100004', '00210010', '2555', '田东县', '1');
INSERT INTO `region` VALUES ('102529', '002100100005', '00210010', '2556', '平果县', '1');
INSERT INTO `region` VALUES ('102530', '002100100006', '00210010', '2557', '德保县', '1');
INSERT INTO `region` VALUES ('102531', '002100100007', '00210010', '2558', '靖西县', '1');
INSERT INTO `region` VALUES ('102532', '002100100008', '00210010', '2559', '那坡县', '1');
INSERT INTO `region` VALUES ('102533', '002100100009', '00210010', '2560', '凌云县', '1');
INSERT INTO `region` VALUES ('102534', '002100100010', '00210010', '2561', '乐业县', '1');
INSERT INTO `region` VALUES ('102535', '002100100011', '00210010', '2562', '田林县', '1');
INSERT INTO `region` VALUES ('102536', '002100100012', '00210010', '2563', '西林县', '1');
INSERT INTO `region` VALUES ('102537', '002100100013', '00210010', '2564', '隆林各族自治县', '1');
INSERT INTO `region` VALUES ('102538', '002100110001', '00210011', '2565', '市辖区', '1');
INSERT INTO `region` VALUES ('102539', '002100110002', '00210011', '2566', '八步区', '1');
INSERT INTO `region` VALUES ('102540', '002100110003', '00210011', '2567', '昭平县', '1');
INSERT INTO `region` VALUES ('102541', '002100110004', '00210011', '2568', '钟山县', '1');
INSERT INTO `region` VALUES ('102542', '002100110005', '00210011', '2569', '富川瑶族自治县', '1');
INSERT INTO `region` VALUES ('102543', '002100120001', '00210012', '2570', '市辖区', '1');
INSERT INTO `region` VALUES ('102544', '002100120002', '00210012', '2571', '金城江区', '1');
INSERT INTO `region` VALUES ('102545', '002100120003', '00210012', '2572', '南丹县', '1');
INSERT INTO `region` VALUES ('102546', '002100120004', '00210012', '2573', '天峨县', '1');
INSERT INTO `region` VALUES ('102547', '002100120005', '00210012', '2574', '凤山县', '1');
INSERT INTO `region` VALUES ('102548', '002100120006', '00210012', '2575', '东兰县', '1');
INSERT INTO `region` VALUES ('102549', '002100120007', '00210012', '2576', '罗城仫佬族自治县', '1');
INSERT INTO `region` VALUES ('102550', '002100120008', '00210012', '2577', '环江毛南族自治县', '1');
INSERT INTO `region` VALUES ('102551', '002100120009', '00210012', '2578', '巴马瑶族自治县', '1');
INSERT INTO `region` VALUES ('102552', '002100120010', '00210012', '2579', '都安瑶族自治县', '1');
INSERT INTO `region` VALUES ('102553', '002100120011', '00210012', '2580', '大化瑶族自治县', '1');
INSERT INTO `region` VALUES ('102554', '002100120012', '00210012', '2581', '宜州市', '1');
INSERT INTO `region` VALUES ('102555', '002100130001', '00210013', '2582', '市辖区', '1');
INSERT INTO `region` VALUES ('102556', '002100130002', '00210013', '2583', '兴宾区', '1');
INSERT INTO `region` VALUES ('102557', '002100130003', '00210013', '2584', '忻城县', '1');
INSERT INTO `region` VALUES ('102558', '002100130004', '00210013', '2585', '象州县', '1');
INSERT INTO `region` VALUES ('102559', '002100130005', '00210013', '2586', '武宣县', '1');
INSERT INTO `region` VALUES ('102560', '002100130006', '00210013', '2587', '金秀瑶族自治县', '1');
INSERT INTO `region` VALUES ('102561', '002100130007', '00210013', '2588', '合山市', '1');
INSERT INTO `region` VALUES ('102562', '002100140001', '00210014', '2589', '市辖区', '1');
INSERT INTO `region` VALUES ('102563', '002100140002', '00210014', '2590', '江洲区', '1');
INSERT INTO `region` VALUES ('102564', '002100140003', '00210014', '2591', '扶绥县', '1');
INSERT INTO `region` VALUES ('102565', '002100140004', '00210014', '2592', '宁明县', '1');
INSERT INTO `region` VALUES ('102566', '002100140005', '00210014', '2593', '龙州县', '1');
INSERT INTO `region` VALUES ('102567', '002100140006', '00210014', '2594', '大新县', '1');
INSERT INTO `region` VALUES ('102568', '002100140007', '00210014', '2595', '天等县', '1');
INSERT INTO `region` VALUES ('102569', '002100140008', '00210014', '2596', '凭祥市', '1');
INSERT INTO `region` VALUES ('102570', '002200010001', '00220001', '2597', '市辖区', '1');
INSERT INTO `region` VALUES ('102571', '002200010002', '00220001', '2598', '秀英区', '1');
INSERT INTO `region` VALUES ('102572', '002200010003', '00220001', '2599', '龙华区', '1');
INSERT INTO `region` VALUES ('102573', '002200010004', '00220001', '2600', '琼山区', '1');
INSERT INTO `region` VALUES ('102574', '002200010005', '00220001', '2601', '美兰区', '1');
INSERT INTO `region` VALUES ('102575', '002200020001', '00220002', '2602', '市辖区', '1');
INSERT INTO `region` VALUES ('102576', '002200030001', '00220003', '2603', '五指山市', '1');
INSERT INTO `region` VALUES ('102577', '002200030002', '00220003', '2604', '琼海市', '1');
INSERT INTO `region` VALUES ('102578', '002200030003', '00220003', '2605', '儋州市', '1');
INSERT INTO `region` VALUES ('102579', '002200030004', '00220003', '2606', '文昌市', '1');
INSERT INTO `region` VALUES ('102580', '002200030005', '00220003', '2607', '万宁市', '1');
INSERT INTO `region` VALUES ('102581', '002200030006', '00220003', '2608', '东方市', '1');
INSERT INTO `region` VALUES ('102582', '002200030007', '00220003', '2609', '定安县', '1');
INSERT INTO `region` VALUES ('102583', '002200030008', '00220003', '2610', '屯昌县', '1');
INSERT INTO `region` VALUES ('102584', '002200030009', '00220003', '2611', '澄迈县', '1');
INSERT INTO `region` VALUES ('102585', '002200030010', '00220003', '2612', '临高县', '1');
INSERT INTO `region` VALUES ('102586', '002200030011', '00220003', '2613', '白沙黎族自治县', '1');
INSERT INTO `region` VALUES ('102587', '002200030012', '00220003', '2614', '昌江黎族自治县', '1');
INSERT INTO `region` VALUES ('102588', '002200030013', '00220003', '2615', '乐东黎族自治县', '1');
INSERT INTO `region` VALUES ('102589', '002200030014', '00220003', '2616', '陵水黎族自治县', '1');
INSERT INTO `region` VALUES ('102590', '002200030015', '00220003', '2617', '保亭黎族苗族自治县', '1');
INSERT INTO `region` VALUES ('102591', '002200030016', '00220003', '2618', '琼中黎族苗族自治县', '1');
INSERT INTO `region` VALUES ('102592', '002200030017', '00220003', '2619', '西沙群岛', '1');
INSERT INTO `region` VALUES ('102593', '002200030018', '00220003', '2620', '南沙群岛', '1');
INSERT INTO `region` VALUES ('102594', '002200030019', '00220003', '2621', '中沙群岛的岛礁及其海域', '1');
INSERT INTO `region` VALUES ('102595', '002300010001', '00230001', '2622', '万州区', '1');
INSERT INTO `region` VALUES ('102596', '002300010002', '00230001', '2623', '涪陵区', '1');
INSERT INTO `region` VALUES ('102597', '002300010003', '00230001', '2624', '渝中区', '1');
INSERT INTO `region` VALUES ('102598', '002300010004', '00230001', '2625', '大渡口区', '1');
INSERT INTO `region` VALUES ('102599', '002300010005', '00230001', '2626', '江北区', '1');
INSERT INTO `region` VALUES ('102600', '002300010006', '00230001', '2627', '沙坪坝区', '1');
INSERT INTO `region` VALUES ('102601', '002300010007', '00230001', '2628', '九龙坡区', '1');
INSERT INTO `region` VALUES ('102602', '002300010008', '00230001', '2629', '南岸区', '1');
INSERT INTO `region` VALUES ('102603', '002300010009', '00230001', '2630', '北碚区', '1');
INSERT INTO `region` VALUES ('102604', '002300010010', '00230001', '2631', '万盛区', '1');
INSERT INTO `region` VALUES ('102605', '002300010011', '00230001', '2632', '双桥区', '1');
INSERT INTO `region` VALUES ('102606', '002300010012', '00230001', '2633', '渝北区', '1');
INSERT INTO `region` VALUES ('102607', '002300010013', '00230001', '2634', '巴南区', '1');
INSERT INTO `region` VALUES ('102608', '002300010014', '00230001', '2635', '黔江区', '1');
INSERT INTO `region` VALUES ('102609', '002300010015', '00230001', '2636', '长寿区', '1');
INSERT INTO `region` VALUES ('102610', '002300020001', '00230002', '2637', '綦江县', '1');
INSERT INTO `region` VALUES ('102611', '002300020002', '00230002', '2638', '潼南县', '1');
INSERT INTO `region` VALUES ('102612', '002300020003', '00230002', '2639', '铜梁县', '1');
INSERT INTO `region` VALUES ('102613', '002300020004', '00230002', '2640', '大足县', '1');
INSERT INTO `region` VALUES ('102614', '002300020005', '00230002', '2641', '荣昌县', '1');
INSERT INTO `region` VALUES ('102615', '002300020006', '00230002', '2642', '璧山县', '1');
INSERT INTO `region` VALUES ('102616', '002300020007', '00230002', '2643', '梁平县', '1');
INSERT INTO `region` VALUES ('102617', '002300020008', '00230002', '2644', '城口县', '1');
INSERT INTO `region` VALUES ('102618', '002300020009', '00230002', '2645', '丰都县', '1');
INSERT INTO `region` VALUES ('102619', '002300020010', '00230002', '2646', '垫江县', '1');
INSERT INTO `region` VALUES ('102620', '002300020011', '00230002', '2647', '武隆县', '1');
INSERT INTO `region` VALUES ('102621', '002300020012', '00230002', '2648', '忠　县', '1');
INSERT INTO `region` VALUES ('102622', '002300020013', '00230002', '2649', '开　县', '1');
INSERT INTO `region` VALUES ('102623', '002300020014', '00230002', '2650', '云阳县', '1');
INSERT INTO `region` VALUES ('102624', '002300020015', '00230002', '2651', '奉节县', '1');
INSERT INTO `region` VALUES ('102625', '002300020016', '00230002', '2652', '巫山县', '1');
INSERT INTO `region` VALUES ('102626', '002300020017', '00230002', '2653', '巫溪县', '1');
INSERT INTO `region` VALUES ('102627', '002300020018', '00230002', '2654', '石柱土家族自治县', '1');
INSERT INTO `region` VALUES ('102628', '002300020019', '00230002', '2655', '秀山土家族苗族自治县', '1');
INSERT INTO `region` VALUES ('102629', '002300020020', '00230002', '2656', '酉阳土家族苗族自治县', '1');
INSERT INTO `region` VALUES ('102630', '002300020021', '00230002', '2657', '彭水苗族土家族自治县', '1');
INSERT INTO `region` VALUES ('102631', '002300030001', '00230003', '2658', '江津市', '1');
INSERT INTO `region` VALUES ('102632', '002300030002', '00230003', '2659', '合川市', '1');
INSERT INTO `region` VALUES ('102633', '002300030003', '00230003', '2660', '永川市', '1');
INSERT INTO `region` VALUES ('102634', '002300030004', '00230003', '2661', '南川市', '1');
INSERT INTO `region` VALUES ('102635', '002400010001', '00240001', '2662', '市辖区', '1');
INSERT INTO `region` VALUES ('102636', '002400010002', '00240001', '2663', '锦江区', '1');
INSERT INTO `region` VALUES ('102637', '002400010003', '00240001', '2664', '青羊区', '1');
INSERT INTO `region` VALUES ('102638', '002400010004', '00240001', '2665', '金牛区', '1');
INSERT INTO `region` VALUES ('102639', '002400010005', '00240001', '2666', '武侯区', '1');
INSERT INTO `region` VALUES ('102640', '002400010006', '00240001', '2667', '成华区', '1');
INSERT INTO `region` VALUES ('102641', '002400010007', '00240001', '2668', '龙泉驿区', '1');
INSERT INTO `region` VALUES ('102642', '002400010008', '00240001', '2669', '青白江区', '1');
INSERT INTO `region` VALUES ('102643', '002400010009', '00240001', '2670', '新都区', '1');
INSERT INTO `region` VALUES ('102644', '002400010010', '00240001', '2671', '温江区', '1');
INSERT INTO `region` VALUES ('102645', '002400010011', '00240001', '2672', '金堂县', '1');
INSERT INTO `region` VALUES ('102646', '002400010012', '00240001', '2673', '双流县', '1');
INSERT INTO `region` VALUES ('102647', '002400010013', '00240001', '2674', '郫　县', '1');
INSERT INTO `region` VALUES ('102648', '002400010014', '00240001', '2675', '大邑县', '1');
INSERT INTO `region` VALUES ('102649', '002400010015', '00240001', '2676', '蒲江县', '1');
INSERT INTO `region` VALUES ('102650', '002400010016', '00240001', '2677', '新津县', '1');
INSERT INTO `region` VALUES ('102651', '002400010017', '00240001', '2678', '都江堰市', '1');
INSERT INTO `region` VALUES ('102652', '002400010018', '00240001', '2679', '彭州市', '1');
INSERT INTO `region` VALUES ('102653', '002400010019', '00240001', '2680', '邛崃市', '1');
INSERT INTO `region` VALUES ('102654', '002400010020', '00240001', '2681', '崇州市', '1');
INSERT INTO `region` VALUES ('102655', '002400020001', '00240002', '2682', '市辖区', '1');
INSERT INTO `region` VALUES ('102656', '002400020002', '00240002', '2683', '自流井区', '1');
INSERT INTO `region` VALUES ('102657', '002400020003', '00240002', '2684', '贡井区', '1');
INSERT INTO `region` VALUES ('102658', '002400020004', '00240002', '2685', '大安区', '1');
INSERT INTO `region` VALUES ('102659', '002400020005', '00240002', '2686', '沿滩区', '1');
INSERT INTO `region` VALUES ('102660', '002400020006', '00240002', '2687', '荣　县', '1');
INSERT INTO `region` VALUES ('102661', '002400020007', '00240002', '2688', '富顺县', '1');
INSERT INTO `region` VALUES ('102662', '002400030001', '00240003', '2689', '市辖区', '1');
INSERT INTO `region` VALUES ('102663', '002400030002', '00240003', '2690', '东　区', '1');
INSERT INTO `region` VALUES ('102664', '002400030003', '00240003', '2691', '西　区', '1');
INSERT INTO `region` VALUES ('102665', '002400030004', '00240003', '2692', '仁和区', '1');
INSERT INTO `region` VALUES ('102666', '002400030005', '00240003', '2693', '米易县', '1');
INSERT INTO `region` VALUES ('102667', '002400030006', '00240003', '2694', '盐边县', '1');
INSERT INTO `region` VALUES ('102668', '002400040001', '00240004', '2695', '市辖区', '1');
INSERT INTO `region` VALUES ('102669', '002400040002', '00240004', '2696', '江阳区', '1');
INSERT INTO `region` VALUES ('102670', '002400040003', '00240004', '2697', '纳溪区', '1');
INSERT INTO `region` VALUES ('102671', '002400040004', '00240004', '2698', '龙马潭区', '1');
INSERT INTO `region` VALUES ('102672', '002400040005', '00240004', '2699', '泸　县', '1');
INSERT INTO `region` VALUES ('102673', '002400040006', '00240004', '2700', '合江县', '1');
INSERT INTO `region` VALUES ('102674', '002400040007', '00240004', '2701', '叙永县', '1');
INSERT INTO `region` VALUES ('102675', '002400040008', '00240004', '2702', '古蔺县', '1');
INSERT INTO `region` VALUES ('102676', '002400050001', '00240005', '2703', '市辖区', '1');
INSERT INTO `region` VALUES ('102677', '002400050002', '00240005', '2704', '旌阳区', '1');
INSERT INTO `region` VALUES ('102678', '002400050003', '00240005', '2705', '中江县', '1');
INSERT INTO `region` VALUES ('102679', '002400050004', '00240005', '2706', '罗江县', '1');
INSERT INTO `region` VALUES ('102680', '002400050005', '00240005', '2707', '广汉市', '1');
INSERT INTO `region` VALUES ('102681', '002400050006', '00240005', '2708', '什邡市', '1');
INSERT INTO `region` VALUES ('102682', '002400050007', '00240005', '2709', '绵竹市', '1');
INSERT INTO `region` VALUES ('102683', '002400060001', '00240006', '2710', '市辖区', '1');
INSERT INTO `region` VALUES ('102684', '002400060002', '00240006', '2711', '涪城区', '1');
INSERT INTO `region` VALUES ('102685', '002400060003', '00240006', '2712', '游仙区', '1');
INSERT INTO `region` VALUES ('102686', '002400060004', '00240006', '2713', '三台县', '1');
INSERT INTO `region` VALUES ('102687', '002400060005', '00240006', '2714', '盐亭县', '1');
INSERT INTO `region` VALUES ('102688', '002400060006', '00240006', '2715', '安　县', '1');
INSERT INTO `region` VALUES ('102689', '002400060007', '00240006', '2716', '梓潼县', '1');
INSERT INTO `region` VALUES ('102690', '002400060008', '00240006', '2717', '北川羌族自治县', '1');
INSERT INTO `region` VALUES ('102691', '002400060009', '00240006', '2718', '平武县', '1');
INSERT INTO `region` VALUES ('102692', '002400060010', '00240006', '2719', '江油市', '1');
INSERT INTO `region` VALUES ('102693', '002400070001', '00240007', '2720', '市辖区', '1');
INSERT INTO `region` VALUES ('102694', '002400070002', '00240007', '2721', '市中区', '1');
INSERT INTO `region` VALUES ('102695', '002400070003', '00240007', '2722', '元坝区', '1');
INSERT INTO `region` VALUES ('102696', '002400070004', '00240007', '2723', '朝天区', '1');
INSERT INTO `region` VALUES ('102697', '002400070005', '00240007', '2724', '旺苍县', '1');
INSERT INTO `region` VALUES ('102698', '002400070006', '00240007', '2725', '青川县', '1');
INSERT INTO `region` VALUES ('102699', '002400070007', '00240007', '2726', '剑阁县', '1');
INSERT INTO `region` VALUES ('102700', '002400070008', '00240007', '2727', '苍溪县', '1');
INSERT INTO `region` VALUES ('102701', '002400080001', '00240008', '2728', '市辖区', '1');
INSERT INTO `region` VALUES ('102702', '002400080002', '00240008', '2729', '船山区', '1');
INSERT INTO `region` VALUES ('102703', '002400080003', '00240008', '2730', '安居区', '1');
INSERT INTO `region` VALUES ('102704', '002400080004', '00240008', '2731', '蓬溪县', '1');
INSERT INTO `region` VALUES ('102705', '002400080005', '00240008', '2732', '射洪县', '1');
INSERT INTO `region` VALUES ('102706', '002400080006', '00240008', '2733', '大英县', '1');
INSERT INTO `region` VALUES ('102707', '002400090001', '00240009', '2734', '市辖区', '1');
INSERT INTO `region` VALUES ('102708', '002400090002', '00240009', '2735', '市中区', '1');
INSERT INTO `region` VALUES ('102709', '002400090003', '00240009', '2736', '东兴区', '1');
INSERT INTO `region` VALUES ('102710', '002400090004', '00240009', '2737', '威远县', '1');
INSERT INTO `region` VALUES ('102711', '002400090005', '00240009', '2738', '资中县', '1');
INSERT INTO `region` VALUES ('102712', '002400090006', '00240009', '2739', '隆昌县', '1');
INSERT INTO `region` VALUES ('102713', '002400100001', '00240010', '2740', '市辖区', '1');
INSERT INTO `region` VALUES ('102714', '002400100002', '00240010', '2741', '市中区', '1');
INSERT INTO `region` VALUES ('102715', '002400100003', '00240010', '2742', '沙湾区', '1');
INSERT INTO `region` VALUES ('102716', '002400100004', '00240010', '2743', '五通桥区', '1');
INSERT INTO `region` VALUES ('102717', '002400100005', '00240010', '2744', '金口河区', '1');
INSERT INTO `region` VALUES ('102718', '002400100006', '00240010', '2745', '犍为县', '1');
INSERT INTO `region` VALUES ('102719', '002400100007', '00240010', '2746', '井研县', '1');
INSERT INTO `region` VALUES ('102720', '002400100008', '00240010', '2747', '夹江县', '1');
INSERT INTO `region` VALUES ('102721', '002400100009', '00240010', '2748', '沐川县', '1');
INSERT INTO `region` VALUES ('102722', '002400100010', '00240010', '2749', '峨边彝族自治县', '1');
INSERT INTO `region` VALUES ('102723', '002400100011', '00240010', '2750', '马边彝族自治县', '1');
INSERT INTO `region` VALUES ('102724', '002400100012', '00240010', '2751', '峨眉山市', '1');
INSERT INTO `region` VALUES ('102725', '002400110001', '00240011', '2752', '市辖区', '1');
INSERT INTO `region` VALUES ('102726', '002400110002', '00240011', '2753', '顺庆区', '1');
INSERT INTO `region` VALUES ('102727', '002400110003', '00240011', '2754', '高坪区', '1');
INSERT INTO `region` VALUES ('102728', '002400110004', '00240011', '2755', '嘉陵区', '1');
INSERT INTO `region` VALUES ('102729', '002400110005', '00240011', '2756', '南部县', '1');
INSERT INTO `region` VALUES ('102730', '002400110006', '00240011', '2757', '营山县', '1');
INSERT INTO `region` VALUES ('102731', '002400110007', '00240011', '2758', '蓬安县', '1');
INSERT INTO `region` VALUES ('102732', '002400110008', '00240011', '2759', '仪陇县', '1');
INSERT INTO `region` VALUES ('102733', '002400110009', '00240011', '2760', '西充县', '1');
INSERT INTO `region` VALUES ('102734', '002400110010', '00240011', '2761', '阆中市', '1');
INSERT INTO `region` VALUES ('102735', '002400120001', '00240012', '2762', '市辖区', '1');
INSERT INTO `region` VALUES ('102736', '002400120002', '00240012', '2763', '东坡区', '1');
INSERT INTO `region` VALUES ('102737', '002400120003', '00240012', '2764', '仁寿县', '1');
INSERT INTO `region` VALUES ('102738', '002400120004', '00240012', '2765', '彭山县', '1');
INSERT INTO `region` VALUES ('102739', '002400120005', '00240012', '2766', '洪雅县', '1');
INSERT INTO `region` VALUES ('102740', '002400120006', '00240012', '2767', '丹棱县', '1');
INSERT INTO `region` VALUES ('102741', '002400120007', '00240012', '2768', '青神县', '1');
INSERT INTO `region` VALUES ('102742', '002400130001', '00240013', '2769', '市辖区', '1');
INSERT INTO `region` VALUES ('102743', '002400130002', '00240013', '2770', '翠屏区', '1');
INSERT INTO `region` VALUES ('102744', '002400130003', '00240013', '2771', '宜宾县', '1');
INSERT INTO `region` VALUES ('102745', '002400130004', '00240013', '2772', '南溪县', '1');
INSERT INTO `region` VALUES ('102746', '002400130005', '00240013', '2773', '江安县', '1');
INSERT INTO `region` VALUES ('102747', '002400130006', '00240013', '2774', '长宁县', '1');
INSERT INTO `region` VALUES ('102748', '002400130007', '00240013', '2775', '高　县', '1');
INSERT INTO `region` VALUES ('102749', '002400130008', '00240013', '2776', '珙　县', '1');
INSERT INTO `region` VALUES ('102750', '002400130009', '00240013', '2777', '筠连县', '1');
INSERT INTO `region` VALUES ('102751', '002400130010', '00240013', '2778', '兴文县', '1');
INSERT INTO `region` VALUES ('102752', '002400130011', '00240013', '2779', '屏山县', '1');
INSERT INTO `region` VALUES ('102753', '002400140001', '00240014', '2780', '市辖区', '1');
INSERT INTO `region` VALUES ('102754', '002400140002', '00240014', '2781', '广安区', '1');
INSERT INTO `region` VALUES ('102755', '002400140003', '00240014', '2782', '岳池县', '1');
INSERT INTO `region` VALUES ('102756', '002400140004', '00240014', '2783', '武胜县', '1');
INSERT INTO `region` VALUES ('102757', '002400140005', '00240014', '2784', '邻水县', '1');
INSERT INTO `region` VALUES ('102758', '002400140006', '00240014', '2785', '华莹市', '1');
INSERT INTO `region` VALUES ('102759', '002400150001', '00240015', '2786', '市辖区', '1');
INSERT INTO `region` VALUES ('102760', '002400150002', '00240015', '2787', '通川区', '1');
INSERT INTO `region` VALUES ('102761', '002400150003', '00240015', '2788', '达　县', '1');
INSERT INTO `region` VALUES ('102762', '002400150004', '00240015', '2789', '宣汉县', '1');
INSERT INTO `region` VALUES ('102763', '002400150005', '00240015', '2790', '开江县', '1');
INSERT INTO `region` VALUES ('102764', '002400150006', '00240015', '2791', '大竹县', '1');
INSERT INTO `region` VALUES ('102765', '002400150007', '00240015', '2792', '渠　县', '1');
INSERT INTO `region` VALUES ('102766', '002400150008', '00240015', '2793', '万源市', '1');
INSERT INTO `region` VALUES ('102767', '002400160001', '00240016', '2794', '市辖区', '1');
INSERT INTO `region` VALUES ('102768', '002400160002', '00240016', '2795', '雨城区', '1');
INSERT INTO `region` VALUES ('102769', '002400160003', '00240016', '2796', '名山县', '1');
INSERT INTO `region` VALUES ('102770', '002400160004', '00240016', '2797', '荥经县', '1');
INSERT INTO `region` VALUES ('102771', '002400160005', '00240016', '2798', '汉源县', '1');
INSERT INTO `region` VALUES ('102772', '002400160006', '00240016', '2799', '石棉县', '1');
INSERT INTO `region` VALUES ('102773', '002400160007', '00240016', '2800', '天全县', '1');
INSERT INTO `region` VALUES ('102774', '002400160008', '00240016', '2801', '芦山县', '1');
INSERT INTO `region` VALUES ('102775', '002400160009', '00240016', '2802', '宝兴县', '1');
INSERT INTO `region` VALUES ('102776', '002400170001', '00240017', '2803', '市辖区', '1');
INSERT INTO `region` VALUES ('102777', '002400170002', '00240017', '2804', '巴州区', '1');
INSERT INTO `region` VALUES ('102778', '002400170003', '00240017', '2805', '通江县', '1');
INSERT INTO `region` VALUES ('102779', '002400170004', '00240017', '2806', '南江县', '1');
INSERT INTO `region` VALUES ('102780', '002400170005', '00240017', '2807', '平昌县', '1');
INSERT INTO `region` VALUES ('102781', '002400180001', '00240018', '2808', '市辖区', '1');
INSERT INTO `region` VALUES ('102782', '002400180002', '00240018', '2809', '雁江区', '1');
INSERT INTO `region` VALUES ('102783', '002400180003', '00240018', '2810', '安岳县', '1');
INSERT INTO `region` VALUES ('102784', '002400180004', '00240018', '2811', '乐至县', '1');
INSERT INTO `region` VALUES ('102785', '002400180005', '00240018', '2812', '简阳市', '1');
INSERT INTO `region` VALUES ('102786', '002400190001', '00240019', '2813', '汶川县', '1');
INSERT INTO `region` VALUES ('102787', '002400190002', '00240019', '2814', '理　县', '1');
INSERT INTO `region` VALUES ('102788', '002400190003', '00240019', '2815', '茂　县', '1');
INSERT INTO `region` VALUES ('102789', '002400190004', '00240019', '2816', '松潘县', '1');
INSERT INTO `region` VALUES ('102790', '002400190005', '00240019', '2817', '九寨沟县', '1');
INSERT INTO `region` VALUES ('102791', '002400190006', '00240019', '2818', '金川县', '1');
INSERT INTO `region` VALUES ('102792', '002400190007', '00240019', '2819', '小金县', '1');
INSERT INTO `region` VALUES ('102793', '002400190008', '00240019', '2820', '黑水县', '1');
INSERT INTO `region` VALUES ('102794', '002400190009', '00240019', '2821', '马尔康县', '1');
INSERT INTO `region` VALUES ('102795', '002400190010', '00240019', '2822', '壤塘县', '1');
INSERT INTO `region` VALUES ('102796', '002400190011', '00240019', '2823', '阿坝县', '1');
INSERT INTO `region` VALUES ('102797', '002400190012', '00240019', '2824', '若尔盖县', '1');
INSERT INTO `region` VALUES ('102798', '002400190013', '00240019', '2825', '红原县', '1');
INSERT INTO `region` VALUES ('102799', '002400200001', '00240020', '2826', '康定县', '1');
INSERT INTO `region` VALUES ('102800', '002400200002', '00240020', '2827', '泸定县', '1');
INSERT INTO `region` VALUES ('102801', '002400200003', '00240020', '2828', '丹巴县', '1');
INSERT INTO `region` VALUES ('102802', '002400200004', '00240020', '2829', '九龙县', '1');
INSERT INTO `region` VALUES ('102803', '002400200005', '00240020', '2830', '雅江县', '1');
INSERT INTO `region` VALUES ('102804', '002400200006', '00240020', '2831', '道孚县', '1');
INSERT INTO `region` VALUES ('102805', '002400200007', '00240020', '2832', '炉霍县', '1');
INSERT INTO `region` VALUES ('102806', '002400200008', '00240020', '2833', '甘孜县', '1');
INSERT INTO `region` VALUES ('102807', '002400200009', '00240020', '2834', '新龙县', '1');
INSERT INTO `region` VALUES ('102808', '002400200010', '00240020', '2835', '德格县', '1');
INSERT INTO `region` VALUES ('102809', '002400200011', '00240020', '2836', '白玉县', '1');
INSERT INTO `region` VALUES ('102810', '002400200012', '00240020', '2837', '石渠县', '1');
INSERT INTO `region` VALUES ('102811', '002400200013', '00240020', '2838', '色达县', '1');
INSERT INTO `region` VALUES ('102812', '002400200014', '00240020', '2839', '理塘县', '1');
INSERT INTO `region` VALUES ('102813', '002400200015', '00240020', '2840', '巴塘县', '1');
INSERT INTO `region` VALUES ('102814', '002400200016', '00240020', '2841', '乡城县', '1');
INSERT INTO `region` VALUES ('102815', '002400200017', '00240020', '2842', '稻城县', '1');
INSERT INTO `region` VALUES ('102816', '002400200018', '00240020', '2843', '得荣县', '1');
INSERT INTO `region` VALUES ('102817', '002400210001', '00240021', '2844', '西昌市', '1');
INSERT INTO `region` VALUES ('102818', '002400210002', '00240021', '2845', '木里藏族自治县', '1');
INSERT INTO `region` VALUES ('102819', '002400210003', '00240021', '2846', '盐源县', '1');
INSERT INTO `region` VALUES ('102820', '002400210004', '00240021', '2847', '德昌县', '1');
INSERT INTO `region` VALUES ('102821', '002400210005', '00240021', '2848', '会理县', '1');
INSERT INTO `region` VALUES ('102822', '002400210006', '00240021', '2849', '会东县', '1');
INSERT INTO `region` VALUES ('102823', '002400210007', '00240021', '2850', '宁南县', '1');
INSERT INTO `region` VALUES ('102824', '002400210008', '00240021', '2851', '普格县', '1');
INSERT INTO `region` VALUES ('102825', '002400210009', '00240021', '2852', '布拖县', '1');
INSERT INTO `region` VALUES ('102826', '002400210010', '00240021', '2853', '金阳县', '1');
INSERT INTO `region` VALUES ('102827', '002400210011', '00240021', '2854', '昭觉县', '1');
INSERT INTO `region` VALUES ('102828', '002400210012', '00240021', '2855', '喜德县', '1');
INSERT INTO `region` VALUES ('102829', '002400210013', '00240021', '2856', '冕宁县', '1');
INSERT INTO `region` VALUES ('102830', '002400210014', '00240021', '2857', '越西县', '1');
INSERT INTO `region` VALUES ('102831', '002400210015', '00240021', '2858', '甘洛县', '1');
INSERT INTO `region` VALUES ('102832', '002400210016', '00240021', '2859', '美姑县', '1');
INSERT INTO `region` VALUES ('102833', '002400210017', '00240021', '2860', '雷波县', '1');
INSERT INTO `region` VALUES ('102834', '002500010001', '00250001', '2861', '市辖区', '1');
INSERT INTO `region` VALUES ('102835', '002500010002', '00250001', '2862', '南明区', '1');
INSERT INTO `region` VALUES ('102836', '002500010003', '00250001', '2863', '云岩区', '1');
INSERT INTO `region` VALUES ('102837', '002500010004', '00250001', '2864', '花溪区', '1');
INSERT INTO `region` VALUES ('102838', '002500010005', '00250001', '2865', '乌当区', '1');
INSERT INTO `region` VALUES ('102839', '002500010006', '00250001', '2866', '白云区', '1');
INSERT INTO `region` VALUES ('102840', '002500010007', '00250001', '2867', '小河区', '1');
INSERT INTO `region` VALUES ('102841', '002500010008', '00250001', '2868', '开阳县', '1');
INSERT INTO `region` VALUES ('102842', '002500010009', '00250001', '2869', '息烽县', '1');
INSERT INTO `region` VALUES ('102843', '002500010010', '00250001', '2870', '修文县', '1');
INSERT INTO `region` VALUES ('102844', '002500010011', '00250001', '2871', '清镇市', '1');
INSERT INTO `region` VALUES ('102845', '002500020001', '00250002', '2872', '钟山区', '1');
INSERT INTO `region` VALUES ('102846', '002500020002', '00250002', '2873', '六枝特区', '1');
INSERT INTO `region` VALUES ('102847', '002500020003', '00250002', '2874', '水城县', '1');
INSERT INTO `region` VALUES ('102848', '002500020004', '00250002', '2875', '盘　县', '1');
INSERT INTO `region` VALUES ('102849', '002500030001', '00250003', '2876', '市辖区', '1');
INSERT INTO `region` VALUES ('102850', '002500030002', '00250003', '2877', '红花岗区', '1');
INSERT INTO `region` VALUES ('102851', '002500030003', '00250003', '2878', '汇川区', '1');
INSERT INTO `region` VALUES ('102852', '002500030004', '00250003', '2879', '遵义县', '1');
INSERT INTO `region` VALUES ('102853', '002500030005', '00250003', '2880', '桐梓县', '1');
INSERT INTO `region` VALUES ('102854', '002500030006', '00250003', '2881', '绥阳县', '1');
INSERT INTO `region` VALUES ('102855', '002500030007', '00250003', '2882', '正安县', '1');
INSERT INTO `region` VALUES ('102856', '002500030008', '00250003', '2883', '道真仡佬族苗族自治县', '1');
INSERT INTO `region` VALUES ('102857', '002500030009', '00250003', '2884', '务川仡佬族苗族自治县', '1');
INSERT INTO `region` VALUES ('102858', '002500030010', '00250003', '2885', '凤冈县', '1');
INSERT INTO `region` VALUES ('102859', '002500030011', '00250003', '2886', '湄潭县', '1');
INSERT INTO `region` VALUES ('102860', '002500030012', '00250003', '2887', '余庆县', '1');
INSERT INTO `region` VALUES ('102861', '002500030013', '00250003', '2888', '习水县', '1');
INSERT INTO `region` VALUES ('102862', '002500030014', '00250003', '2889', '赤水市', '1');
INSERT INTO `region` VALUES ('102863', '002500030015', '00250003', '2890', '仁怀市', '1');
INSERT INTO `region` VALUES ('102864', '002500040001', '00250004', '2891', '市辖区', '1');
INSERT INTO `region` VALUES ('102865', '002500040002', '00250004', '2892', '西秀区', '1');
INSERT INTO `region` VALUES ('102866', '002500040003', '00250004', '2893', '平坝县', '1');
INSERT INTO `region` VALUES ('102867', '002500040004', '00250004', '2894', '普定县', '1');
INSERT INTO `region` VALUES ('102868', '002500040005', '00250004', '2895', '镇宁布依族苗族自治县', '1');
INSERT INTO `region` VALUES ('102869', '002500040006', '00250004', '2896', '关岭布依族苗族自治县', '1');
INSERT INTO `region` VALUES ('102870', '002500040007', '00250004', '2897', '紫云苗族布依族自治县', '1');
INSERT INTO `region` VALUES ('102871', '002500050001', '00250005', '2898', '铜仁市', '1');
INSERT INTO `region` VALUES ('102872', '002500050002', '00250005', '2899', '江口县', '1');
INSERT INTO `region` VALUES ('102873', '002500050003', '00250005', '2900', '玉屏侗族自治县', '1');
INSERT INTO `region` VALUES ('102874', '002500050004', '00250005', '2901', '石阡县', '1');
INSERT INTO `region` VALUES ('102875', '002500050005', '00250005', '2902', '思南县', '1');
INSERT INTO `region` VALUES ('102876', '002500050006', '00250005', '2903', '印江土家族苗族自治县', '1');
INSERT INTO `region` VALUES ('102877', '002500050007', '00250005', '2904', '德江县', '1');
INSERT INTO `region` VALUES ('102878', '002500050008', '00250005', '2905', '沿河土家族自治县', '1');
INSERT INTO `region` VALUES ('102879', '002500050009', '00250005', '2906', '松桃苗族自治县', '1');
INSERT INTO `region` VALUES ('102880', '002500050010', '00250005', '2907', '万山特区', '1');
INSERT INTO `region` VALUES ('102881', '002500060001', '00250006', '2908', '兴义市', '1');
INSERT INTO `region` VALUES ('102882', '002500060002', '00250006', '2909', '兴仁县', '1');
INSERT INTO `region` VALUES ('102883', '002500060003', '00250006', '2910', '普安县', '1');
INSERT INTO `region` VALUES ('102884', '002500060004', '00250006', '2911', '晴隆县', '1');
INSERT INTO `region` VALUES ('102885', '002500060005', '00250006', '2912', '贞丰县', '1');
INSERT INTO `region` VALUES ('102886', '002500060006', '00250006', '2913', '望谟县', '1');
INSERT INTO `region` VALUES ('102887', '002500060007', '00250006', '2914', '册亨县', '1');
INSERT INTO `region` VALUES ('102888', '002500060008', '00250006', '2915', '安龙县', '1');
INSERT INTO `region` VALUES ('102889', '002500070001', '00250007', '2916', '毕节市', '1');
INSERT INTO `region` VALUES ('102890', '002500070002', '00250007', '2917', '大方县', '1');
INSERT INTO `region` VALUES ('102891', '002500070003', '00250007', '2918', '黔西县', '1');
INSERT INTO `region` VALUES ('102892', '002500070004', '00250007', '2919', '金沙县', '1');
INSERT INTO `region` VALUES ('102893', '002500070005', '00250007', '2920', '织金县', '1');
INSERT INTO `region` VALUES ('102894', '002500070006', '00250007', '2921', '纳雍县', '1');
INSERT INTO `region` VALUES ('102895', '002500070007', '00250007', '2922', '威宁彝族回族苗族自治县', '1');
INSERT INTO `region` VALUES ('102896', '002500070008', '00250007', '2923', '赫章县', '1');
INSERT INTO `region` VALUES ('102897', '002500080001', '00250008', '2924', '凯里市', '1');
INSERT INTO `region` VALUES ('102898', '002500080002', '00250008', '2925', '黄平县', '1');
INSERT INTO `region` VALUES ('102899', '002500080003', '00250008', '2926', '施秉县', '1');
INSERT INTO `region` VALUES ('102900', '002500080004', '00250008', '2927', '三穗县', '1');
INSERT INTO `region` VALUES ('102901', '002500080005', '00250008', '2928', '镇远县', '1');
INSERT INTO `region` VALUES ('102902', '002500080006', '00250008', '2929', '岑巩县', '1');
INSERT INTO `region` VALUES ('102903', '002500080007', '00250008', '2930', '天柱县', '1');
INSERT INTO `region` VALUES ('102904', '002500080008', '00250008', '2931', '锦屏县', '1');
INSERT INTO `region` VALUES ('102905', '002500080009', '00250008', '2932', '剑河县', '1');
INSERT INTO `region` VALUES ('102906', '002500080010', '00250008', '2933', '台江县', '1');
INSERT INTO `region` VALUES ('102907', '002500080011', '00250008', '2934', '黎平县', '1');
INSERT INTO `region` VALUES ('102908', '002500080012', '00250008', '2935', '榕江县', '1');
INSERT INTO `region` VALUES ('102909', '002500080013', '00250008', '2936', '从江县', '1');
INSERT INTO `region` VALUES ('102910', '002500080014', '00250008', '2937', '雷山县', '1');
INSERT INTO `region` VALUES ('102911', '002500080015', '00250008', '2938', '麻江县', '1');
INSERT INTO `region` VALUES ('102912', '002500080016', '00250008', '2939', '丹寨县', '1');
INSERT INTO `region` VALUES ('102913', '002500090001', '00250009', '2940', '都匀市', '1');
INSERT INTO `region` VALUES ('102914', '002500090002', '00250009', '2941', '福泉市', '1');
INSERT INTO `region` VALUES ('102915', '002500090003', '00250009', '2942', '荔波县', '1');
INSERT INTO `region` VALUES ('102916', '002500090004', '00250009', '2943', '贵定县', '1');
INSERT INTO `region` VALUES ('102917', '002500090005', '00250009', '2944', '瓮安县', '1');
INSERT INTO `region` VALUES ('102918', '002500090006', '00250009', '2945', '独山县', '1');
INSERT INTO `region` VALUES ('102919', '002500090007', '00250009', '2946', '平塘县', '1');
INSERT INTO `region` VALUES ('102920', '002500090008', '00250009', '2947', '罗甸县', '1');
INSERT INTO `region` VALUES ('102921', '002500090009', '00250009', '2948', '长顺县', '1');
INSERT INTO `region` VALUES ('102922', '002500090010', '00250009', '2949', '龙里县', '1');
INSERT INTO `region` VALUES ('102923', '002500090011', '00250009', '2950', '惠水县', '1');
INSERT INTO `region` VALUES ('102924', '002500090012', '00250009', '2951', '三都水族自治县', '1');
INSERT INTO `region` VALUES ('102925', '002600010001', '00260001', '2952', '市辖区', '1');
INSERT INTO `region` VALUES ('102926', '002600010002', '00260001', '2953', '五华区', '1');
INSERT INTO `region` VALUES ('102927', '002600010003', '00260001', '2954', '盘龙区', '1');
INSERT INTO `region` VALUES ('102928', '002600010004', '00260001', '2955', '官渡区', '1');
INSERT INTO `region` VALUES ('102929', '002600010005', '00260001', '2956', '西山区', '1');
INSERT INTO `region` VALUES ('102930', '002600010006', '00260001', '2957', '东川区', '1');
INSERT INTO `region` VALUES ('102931', '002600010007', '00260001', '2958', '呈贡县', '1');
INSERT INTO `region` VALUES ('102932', '002600010008', '00260001', '2959', '晋宁县', '1');
INSERT INTO `region` VALUES ('102933', '002600010009', '00260001', '2960', '富民县', '1');
INSERT INTO `region` VALUES ('102934', '002600010010', '00260001', '2961', '宜良县', '1');
INSERT INTO `region` VALUES ('102935', '002600010011', '00260001', '2962', '石林彝族自治县', '1');
INSERT INTO `region` VALUES ('102936', '002600010012', '00260001', '2963', '嵩明县', '1');
INSERT INTO `region` VALUES ('102937', '002600010013', '00260001', '2964', '禄劝彝族苗族自治县', '1');
INSERT INTO `region` VALUES ('102938', '002600010014', '00260001', '2965', '寻甸回族彝族自治县', '1');
INSERT INTO `region` VALUES ('102939', '002600010015', '00260001', '2966', '安宁市', '1');
INSERT INTO `region` VALUES ('102940', '002600020001', '00260002', '2967', '市辖区', '1');
INSERT INTO `region` VALUES ('102941', '002600020002', '00260002', '2968', '麒麟区', '1');
INSERT INTO `region` VALUES ('102942', '002600020003', '00260002', '2969', '马龙县', '1');
INSERT INTO `region` VALUES ('102943', '002600020004', '00260002', '2970', '陆良县', '1');
INSERT INTO `region` VALUES ('102944', '002600020005', '00260002', '2971', '师宗县', '1');
INSERT INTO `region` VALUES ('102945', '002600020006', '00260002', '2972', '罗平县', '1');
INSERT INTO `region` VALUES ('102946', '002600020007', '00260002', '2973', '富源县', '1');
INSERT INTO `region` VALUES ('102947', '002600020008', '00260002', '2974', '会泽县', '1');
INSERT INTO `region` VALUES ('102948', '002600020009', '00260002', '2975', '沾益县', '1');
INSERT INTO `region` VALUES ('102949', '002600020010', '00260002', '2976', '宣威市', '1');
INSERT INTO `region` VALUES ('102950', '002600030001', '00260003', '2977', '市辖区', '1');
INSERT INTO `region` VALUES ('102951', '002600030002', '00260003', '2978', '红塔区', '1');
INSERT INTO `region` VALUES ('102952', '002600030003', '00260003', '2979', '江川县', '1');
INSERT INTO `region` VALUES ('102953', '002600030004', '00260003', '2980', '澄江县', '1');
INSERT INTO `region` VALUES ('102954', '002600030005', '00260003', '2981', '通海县', '1');
INSERT INTO `region` VALUES ('102955', '002600030006', '00260003', '2982', '华宁县', '1');
INSERT INTO `region` VALUES ('102956', '002600030007', '00260003', '2983', '易门县', '1');
INSERT INTO `region` VALUES ('102957', '002600030008', '00260003', '2984', '峨山彝族自治县', '1');
INSERT INTO `region` VALUES ('102958', '002600030009', '00260003', '2985', '新平彝族傣族自治县', '1');
INSERT INTO `region` VALUES ('102959', '002600030010', '00260003', '2986', '元江哈尼族彝族傣族自治县', '1');
INSERT INTO `region` VALUES ('102960', '002600040001', '00260004', '2987', '市辖区', '1');
INSERT INTO `region` VALUES ('102961', '002600040002', '00260004', '2988', '隆阳区', '1');
INSERT INTO `region` VALUES ('102962', '002600040003', '00260004', '2989', '施甸县', '1');
INSERT INTO `region` VALUES ('102963', '002600040004', '00260004', '2990', '腾冲县', '1');
INSERT INTO `region` VALUES ('102964', '002600040005', '00260004', '2991', '龙陵县', '1');
INSERT INTO `region` VALUES ('102965', '002600040006', '00260004', '2992', '昌宁县', '1');
INSERT INTO `region` VALUES ('102966', '002600050001', '00260005', '2993', '市辖区', '1');
INSERT INTO `region` VALUES ('102967', '002600050002', '00260005', '2994', '昭阳区', '1');
INSERT INTO `region` VALUES ('102968', '002600050003', '00260005', '2995', '鲁甸县', '1');
INSERT INTO `region` VALUES ('102969', '002600050004', '00260005', '2996', '巧家县', '1');
INSERT INTO `region` VALUES ('102970', '002600050005', '00260005', '2997', '盐津县', '1');
INSERT INTO `region` VALUES ('102971', '002600050006', '00260005', '2998', '大关县', '1');
INSERT INTO `region` VALUES ('102972', '002600050007', '00260005', '2999', '永善县', '1');
INSERT INTO `region` VALUES ('102973', '002600050008', '00260005', '3000', '绥江县', '1');
INSERT INTO `region` VALUES ('102974', '002600050009', '00260005', '3001', '镇雄县', '1');
INSERT INTO `region` VALUES ('102975', '002600050010', '00260005', '3002', '彝良县', '1');
INSERT INTO `region` VALUES ('102976', '002600050011', '00260005', '3003', '威信县', '1');
INSERT INTO `region` VALUES ('102977', '002600050012', '00260005', '3004', '水富县', '1');
INSERT INTO `region` VALUES ('102978', '002600060001', '00260006', '3005', '市辖区', '1');
INSERT INTO `region` VALUES ('102979', '002600060002', '00260006', '3006', '古城区', '1');
INSERT INTO `region` VALUES ('102980', '002600060003', '00260006', '3007', '玉龙纳西族自治县', '1');
INSERT INTO `region` VALUES ('102981', '002600060004', '00260006', '3008', '永胜县', '1');
INSERT INTO `region` VALUES ('102982', '002600060005', '00260006', '3009', '华坪县', '1');
INSERT INTO `region` VALUES ('102983', '002600060006', '00260006', '3010', '宁蒗彝族自治县', '1');
INSERT INTO `region` VALUES ('102984', '002600070001', '00260007', '3011', '市辖区', '1');
INSERT INTO `region` VALUES ('102985', '002600070002', '00260007', '3012', '翠云区', '1');
INSERT INTO `region` VALUES ('102986', '002600070003', '00260007', '3013', '普洱哈尼族彝族自治县', '1');
INSERT INTO `region` VALUES ('102987', '002600070004', '00260007', '3014', '墨江哈尼族自治县', '1');
INSERT INTO `region` VALUES ('102988', '002600070005', '00260007', '3015', '景东彝族自治县', '1');
INSERT INTO `region` VALUES ('102989', '002600070006', '00260007', '3016', '景谷傣族彝族自治县', '1');
INSERT INTO `region` VALUES ('102990', '002600070007', '00260007', '3017', '镇沅彝族哈尼族拉祜族自治县', '1');
INSERT INTO `region` VALUES ('102991', '002600070008', '00260007', '3018', '江城哈尼族彝族自治县', '1');
INSERT INTO `region` VALUES ('102992', '002600070009', '00260007', '3019', '孟连傣族拉祜族佤族自治县', '1');
INSERT INTO `region` VALUES ('102993', '002600070010', '00260007', '3020', '澜沧拉祜族自治县', '1');
INSERT INTO `region` VALUES ('102994', '002600070011', '00260007', '3021', '西盟佤族自治县', '1');
INSERT INTO `region` VALUES ('102995', '002600080001', '00260008', '3022', '市辖区', '1');
INSERT INTO `region` VALUES ('102996', '002600080002', '00260008', '3023', '临翔区', '1');
INSERT INTO `region` VALUES ('102997', '002600080003', '00260008', '3024', '凤庆县', '1');
INSERT INTO `region` VALUES ('102998', '002600080004', '00260008', '3025', '云　县', '1');
INSERT INTO `region` VALUES ('102999', '002600080005', '00260008', '3026', '永德县', '1');
INSERT INTO `region` VALUES ('103000', '002600080006', '00260008', '3027', '镇康县', '1');
INSERT INTO `region` VALUES ('103001', '002600080007', '00260008', '3028', '双江拉祜族佤族布朗族傣族自治县', '1');
INSERT INTO `region` VALUES ('103002', '002600080008', '00260008', '3029', '耿马傣族佤族自治县', '1');
INSERT INTO `region` VALUES ('103003', '002600080009', '00260008', '3030', '沧源佤族自治县', '1');
INSERT INTO `region` VALUES ('103004', '002600090001', '00260009', '3031', '楚雄市', '1');
INSERT INTO `region` VALUES ('103005', '002600090002', '00260009', '3032', '双柏县', '1');
INSERT INTO `region` VALUES ('103006', '002600090003', '00260009', '3033', '牟定县', '1');
INSERT INTO `region` VALUES ('103007', '002600090004', '00260009', '3034', '南华县', '1');
INSERT INTO `region` VALUES ('103008', '002600090005', '00260009', '3035', '姚安县', '1');
INSERT INTO `region` VALUES ('103009', '002600090006', '00260009', '3036', '大姚县', '1');
INSERT INTO `region` VALUES ('103010', '002600090007', '00260009', '3037', '永仁县', '1');
INSERT INTO `region` VALUES ('103011', '002600090008', '00260009', '3038', '元谋县', '1');
INSERT INTO `region` VALUES ('103012', '002600090009', '00260009', '3039', '武定县', '1');
INSERT INTO `region` VALUES ('103013', '002600090010', '00260009', '3040', '禄丰县', '1');
INSERT INTO `region` VALUES ('103014', '002600100001', '00260010', '3041', '个旧市', '1');
INSERT INTO `region` VALUES ('103015', '002600100002', '00260010', '3042', '开远市', '1');
INSERT INTO `region` VALUES ('103016', '002600100003', '00260010', '3043', '蒙自县', '1');
INSERT INTO `region` VALUES ('103017', '002600100004', '00260010', '3044', '屏边苗族自治县', '1');
INSERT INTO `region` VALUES ('103018', '002600100005', '00260010', '3045', '建水县', '1');
INSERT INTO `region` VALUES ('103019', '002600100006', '00260010', '3046', '石屏县', '1');
INSERT INTO `region` VALUES ('103020', '002600100007', '00260010', '3047', '弥勒县', '1');
INSERT INTO `region` VALUES ('103021', '002600100008', '00260010', '3048', '泸西县', '1');
INSERT INTO `region` VALUES ('103022', '002600100009', '00260010', '3049', '元阳县', '1');
INSERT INTO `region` VALUES ('103023', '002600100010', '00260010', '3050', '红河县', '1');
INSERT INTO `region` VALUES ('103024', '002600100011', '00260010', '3051', '金平苗族瑶族傣族自治县', '1');
INSERT INTO `region` VALUES ('103025', '002600100012', '00260010', '3052', '绿春县', '1');
INSERT INTO `region` VALUES ('103026', '002600100013', '00260010', '3053', '河口瑶族自治县', '1');
INSERT INTO `region` VALUES ('103027', '002600110001', '00260011', '3054', '文山县', '1');
INSERT INTO `region` VALUES ('103028', '002600110002', '00260011', '3055', '砚山县', '1');
INSERT INTO `region` VALUES ('103029', '002600110003', '00260011', '3056', '西畴县', '1');
INSERT INTO `region` VALUES ('103030', '002600110004', '00260011', '3057', '麻栗坡县', '1');
INSERT INTO `region` VALUES ('103031', '002600110005', '00260011', '3058', '马关县', '1');
INSERT INTO `region` VALUES ('103032', '002600110006', '00260011', '3059', '丘北县', '1');
INSERT INTO `region` VALUES ('103033', '002600110007', '00260011', '3060', '广南县', '1');
INSERT INTO `region` VALUES ('103034', '002600110008', '00260011', '3061', '富宁县', '1');
INSERT INTO `region` VALUES ('103035', '002600120001', '00260012', '3062', '景洪市', '1');
INSERT INTO `region` VALUES ('103036', '002600120002', '00260012', '3063', '勐海县', '1');
INSERT INTO `region` VALUES ('103037', '002600120003', '00260012', '3064', '勐腊县', '1');
INSERT INTO `region` VALUES ('103038', '002600120004', '00260013', '3065', '大理市', '1');
INSERT INTO `region` VALUES ('103039', '002600130001', '00260013', '3066', '漾濞彝族自治县', '1');
INSERT INTO `region` VALUES ('103040', '002600130002', '00260013', '3067', '祥云县', '1');
INSERT INTO `region` VALUES ('103041', '002600130003', '00260013', '3068', '宾川县', '1');
INSERT INTO `region` VALUES ('103042', '002600130004', '00260013', '3069', '弥渡县', '1');
INSERT INTO `region` VALUES ('103043', '002600130005', '00260013', '3070', '南涧彝族自治县', '1');
INSERT INTO `region` VALUES ('103044', '002600130006', '00260013', '3071', '巍山彝族回族自治县', '1');
INSERT INTO `region` VALUES ('103045', '002600130007', '00260013', '3072', '永平县', '1');
INSERT INTO `region` VALUES ('103046', '002600130008', '00260013', '3073', '云龙县', '1');
INSERT INTO `region` VALUES ('103047', '002600130009', '00260013', '3074', '洱源县', '1');
INSERT INTO `region` VALUES ('103048', '002600130010', '00260013', '3075', '剑川县', '1');
INSERT INTO `region` VALUES ('103049', '002600130011', '00260013', '3076', '鹤庆县', '1');
INSERT INTO `region` VALUES ('103050', '002600140001', '00260014', '3077', '瑞丽市', '1');
INSERT INTO `region` VALUES ('103051', '002600140002', '00260014', '3078', '潞西市', '1');
INSERT INTO `region` VALUES ('103052', '002600140003', '00260014', '3079', '梁河县', '1');
INSERT INTO `region` VALUES ('103053', '002600140004', '00260014', '3080', '盈江县', '1');
INSERT INTO `region` VALUES ('103054', '002600140005', '00260014', '3081', '陇川县', '1');
INSERT INTO `region` VALUES ('103055', '002600140006', '00260015', '3082', '泸水县', '1');
INSERT INTO `region` VALUES ('103056', '002600150001', '00260015', '3083', '福贡县', '1');
INSERT INTO `region` VALUES ('103057', '002600150002', '00260015', '3084', '贡山独龙族怒族自治县', '1');
INSERT INTO `region` VALUES ('103058', '002600150003', '00260015', '3085', '兰坪白族普米族自治县', '1');
INSERT INTO `region` VALUES ('103059', '002600150004', '00260016', '3086', '香格里拉县', '1');
INSERT INTO `region` VALUES ('103060', '002600160001', '00260016', '3087', '德钦县', '1');
INSERT INTO `region` VALUES ('103061', '002600160002', '00260016', '3088', '维西傈僳族自治县', '1');
INSERT INTO `region` VALUES ('103062', '002600160003', '00270001', '3089', '市辖区', '1');
INSERT INTO `region` VALUES ('103063', '002600170001', '00270001', '3090', '城关区', '1');
INSERT INTO `region` VALUES ('103064', '002600170002', '00270001', '3091', '林周县', '1');
INSERT INTO `region` VALUES ('103065', '002600170003', '00270001', '3092', '当雄县', '1');
INSERT INTO `region` VALUES ('103066', '002600170004', '00270001', '3093', '尼木县', '1');
INSERT INTO `region` VALUES ('103067', '002600170005', '00270001', '3094', '曲水县', '1');
INSERT INTO `region` VALUES ('103068', '002600170006', '00270001', '3095', '堆龙德庆县', '1');
INSERT INTO `region` VALUES ('103069', '002600170007', '00270001', '3096', '达孜县', '1');
INSERT INTO `region` VALUES ('103070', '002600170008', '00270001', '3097', '墨竹工卡县', '1');
INSERT INTO `region` VALUES ('103071', '002700020001', '00270002', '3098', '昌都县', '1');
INSERT INTO `region` VALUES ('103072', '002700020002', '00270002', '3099', '江达县', '1');
INSERT INTO `region` VALUES ('103073', '002700020003', '00270002', '3100', '贡觉县', '1');
INSERT INTO `region` VALUES ('103074', '002700020004', '00270002', '3101', '类乌齐县', '1');
INSERT INTO `region` VALUES ('103075', '002700020005', '00270002', '3102', '丁青县', '1');
INSERT INTO `region` VALUES ('103076', '002700020006', '00270002', '3103', '察雅县', '1');
INSERT INTO `region` VALUES ('103077', '002700020007', '00270002', '3104', '八宿县', '1');
INSERT INTO `region` VALUES ('103078', '002700020008', '00270002', '3105', '左贡县', '1');
INSERT INTO `region` VALUES ('103079', '002700020009', '00270002', '3106', '芒康县', '1');
INSERT INTO `region` VALUES ('103080', '002700020010', '00270002', '3107', '洛隆县', '1');
INSERT INTO `region` VALUES ('103081', '002700020011', '00270002', '3108', '边坝县', '1');
INSERT INTO `region` VALUES ('103082', '002700030001', '00270003', '3109', '乃东县', '1');
INSERT INTO `region` VALUES ('103083', '002700030002', '00270003', '3110', '扎囊县', '1');
INSERT INTO `region` VALUES ('103084', '002700030003', '00270003', '3111', '贡嘎县', '1');
INSERT INTO `region` VALUES ('103085', '002700030004', '00270003', '3112', '桑日县', '1');
INSERT INTO `region` VALUES ('103086', '002700030005', '00270003', '3113', '琼结县', '1');
INSERT INTO `region` VALUES ('103087', '002700030006', '00270003', '3114', '曲松县', '1');
INSERT INTO `region` VALUES ('103088', '002700030007', '00270003', '3115', '措美县', '1');
INSERT INTO `region` VALUES ('103089', '002700030008', '00270003', '3116', '洛扎县', '1');
INSERT INTO `region` VALUES ('103090', '002700030009', '00270003', '3117', '加查县', '1');
INSERT INTO `region` VALUES ('103091', '002700030010', '00270003', '3118', '隆子县', '1');
INSERT INTO `region` VALUES ('103092', '002700030011', '00270003', '3119', '错那县', '1');
INSERT INTO `region` VALUES ('103093', '002700030012', '00270003', '3120', '浪卡子县', '1');
INSERT INTO `region` VALUES ('103094', '002700040001', '00270004', '3121', '日喀则市', '1');
INSERT INTO `region` VALUES ('103095', '002700040002', '00270004', '3122', '南木林县', '1');
INSERT INTO `region` VALUES ('103096', '002700040003', '00270004', '3123', '江孜县', '1');
INSERT INTO `region` VALUES ('103097', '002700040004', '00270004', '3124', '定日县', '1');
INSERT INTO `region` VALUES ('103098', '002700040005', '00270004', '3125', '萨迦县', '1');
INSERT INTO `region` VALUES ('103099', '002700040006', '00270004', '3126', '拉孜县', '1');
INSERT INTO `region` VALUES ('103100', '002700040007', '00270004', '3127', '昂仁县', '1');
INSERT INTO `region` VALUES ('103101', '002700040008', '00270004', '3128', '谢通门县', '1');
INSERT INTO `region` VALUES ('103102', '002700040009', '00270004', '3129', '白朗县', '1');
INSERT INTO `region` VALUES ('103103', '002700040010', '00270004', '3130', '仁布县', '1');
INSERT INTO `region` VALUES ('103104', '002700040011', '00270004', '3131', '康马县', '1');
INSERT INTO `region` VALUES ('103105', '002700040012', '00270004', '3132', '定结县', '1');
INSERT INTO `region` VALUES ('103106', '002700040013', '00270004', '3133', '仲巴县', '1');
INSERT INTO `region` VALUES ('103107', '002700040014', '00270004', '3134', '亚东县', '1');
INSERT INTO `region` VALUES ('103108', '002700040015', '00270004', '3135', '吉隆县', '1');
INSERT INTO `region` VALUES ('103109', '002700040016', '00270004', '3136', '聂拉木县', '1');
INSERT INTO `region` VALUES ('103110', '002700040017', '00270004', '3137', '萨嘎县', '1');
INSERT INTO `region` VALUES ('103111', '002700040018', '00270004', '3138', '岗巴县', '1');
INSERT INTO `region` VALUES ('103112', '002700050001', '00270005', '3139', '那曲县', '1');
INSERT INTO `region` VALUES ('103113', '002700050002', '00270005', '3140', '嘉黎县', '1');
INSERT INTO `region` VALUES ('103114', '002700050003', '00270005', '3141', '比如县', '1');
INSERT INTO `region` VALUES ('103115', '002700050004', '00270005', '3142', '聂荣县', '1');
INSERT INTO `region` VALUES ('103116', '002700050005', '00270005', '3143', '安多县', '1');
INSERT INTO `region` VALUES ('103117', '002700050006', '00270005', '3144', '申扎县', '1');
INSERT INTO `region` VALUES ('103118', '002700050007', '00270005', '3145', '索　县', '1');
INSERT INTO `region` VALUES ('103119', '002700050008', '00270005', '3146', '班戈县', '1');
INSERT INTO `region` VALUES ('103120', '002700050009', '00270005', '3147', '巴青县', '1');
INSERT INTO `region` VALUES ('103121', '002700050010', '00270005', '3148', '尼玛县', '1');
INSERT INTO `region` VALUES ('103122', '002700060001', '00270006', '3149', '普兰县', '1');
INSERT INTO `region` VALUES ('103123', '002700060002', '00270006', '3150', '札达县', '1');
INSERT INTO `region` VALUES ('103124', '002700060003', '00270006', '3151', '噶尔县', '1');
INSERT INTO `region` VALUES ('103125', '002700060004', '00270006', '3152', '日土县', '1');
INSERT INTO `region` VALUES ('103126', '002700060005', '00270006', '3153', '革吉县', '1');
INSERT INTO `region` VALUES ('103127', '002700060006', '00270006', '3154', '改则县', '1');
INSERT INTO `region` VALUES ('103128', '002700060007', '00270006', '3155', '措勤县', '1');
INSERT INTO `region` VALUES ('103129', '002700070001', '00270007', '3156', '林芝县', '1');
INSERT INTO `region` VALUES ('103130', '002700070002', '00270007', '3157', '工布江达县', '1');
INSERT INTO `region` VALUES ('103131', '002700070003', '00270007', '3158', '米林县', '1');
INSERT INTO `region` VALUES ('103132', '002700070004', '00270007', '3159', '墨脱县', '1');
INSERT INTO `region` VALUES ('103133', '002700070005', '00270007', '3160', '波密县', '1');
INSERT INTO `region` VALUES ('103134', '002700070006', '00270007', '3161', '察隅县', '1');
INSERT INTO `region` VALUES ('103135', '002700070007', '00270007', '3162', '朗　县', '1');
INSERT INTO `region` VALUES ('103136', '002800010001', '00280001', '3163', '市辖区', '1');
INSERT INTO `region` VALUES ('103137', '002800010002', '00280001', '3164', '新城区', '1');
INSERT INTO `region` VALUES ('103138', '002800010003', '00280001', '3165', '碑林区', '1');
INSERT INTO `region` VALUES ('103139', '002800010004', '00280001', '3166', '莲湖区', '1');
INSERT INTO `region` VALUES ('103140', '002800010005', '00280001', '3167', '灞桥区', '1');
INSERT INTO `region` VALUES ('103141', '002800010006', '00280001', '3168', '未央区', '1');
INSERT INTO `region` VALUES ('103142', '002800010007', '00280001', '3169', '雁塔区', '1');
INSERT INTO `region` VALUES ('103143', '002800010008', '00280001', '3170', '阎良区', '1');
INSERT INTO `region` VALUES ('103144', '002800010009', '00280001', '3171', '临潼区', '1');
INSERT INTO `region` VALUES ('103145', '002800010010', '00280001', '3172', '长安区', '1');
INSERT INTO `region` VALUES ('103146', '002800010011', '00280001', '3173', '蓝田县', '1');
INSERT INTO `region` VALUES ('103147', '002800010012', '00280001', '3174', '周至县', '1');
INSERT INTO `region` VALUES ('103148', '002800010013', '00280001', '3175', '户　县', '1');
INSERT INTO `region` VALUES ('103149', '002800010014', '00280001', '3176', '高陵县', '1');
INSERT INTO `region` VALUES ('103150', '002800020001', '00280002', '3177', '市辖区', '1');
INSERT INTO `region` VALUES ('103151', '002800020002', '00280002', '3178', '王益区', '1');
INSERT INTO `region` VALUES ('103152', '002800020003', '00280002', '3179', '印台区', '1');
INSERT INTO `region` VALUES ('103153', '002800020004', '00280002', '3180', '耀州区', '1');
INSERT INTO `region` VALUES ('103154', '002800020005', '00280002', '3181', '宜君县', '1');
INSERT INTO `region` VALUES ('103155', '002800030001', '00280003', '3182', '市辖区', '1');
INSERT INTO `region` VALUES ('103156', '002800030002', '00280003', '3183', '渭滨区', '1');
INSERT INTO `region` VALUES ('103157', '002800030003', '00280003', '3184', '金台区', '1');
INSERT INTO `region` VALUES ('103158', '002800030004', '00280003', '3185', '陈仓区', '1');
INSERT INTO `region` VALUES ('103159', '002800030005', '00280003', '3186', '凤翔县', '1');
INSERT INTO `region` VALUES ('103160', '002800030006', '00280003', '3187', '岐山县', '1');
INSERT INTO `region` VALUES ('103161', '002800030007', '00280003', '3188', '扶风县', '1');
INSERT INTO `region` VALUES ('103162', '002800030008', '00280003', '3189', '眉　县', '1');
INSERT INTO `region` VALUES ('103163', '002800030009', '00280003', '3190', '陇　县', '1');
INSERT INTO `region` VALUES ('103164', '002800030010', '00280003', '3191', '千阳县', '1');
INSERT INTO `region` VALUES ('103165', '002800030011', '00280003', '3192', '麟游县', '1');
INSERT INTO `region` VALUES ('103166', '002800030012', '00280003', '3193', '凤　县', '1');
INSERT INTO `region` VALUES ('103167', '002800030013', '00280003', '3194', '太白县', '1');
INSERT INTO `region` VALUES ('103168', '002800040001', '00280004', '3195', '市辖区', '1');
INSERT INTO `region` VALUES ('103169', '002800040002', '00280004', '3196', '秦都区', '1');
INSERT INTO `region` VALUES ('103170', '002800040003', '00280004', '3197', '杨凌区', '1');
INSERT INTO `region` VALUES ('103171', '002800040004', '00280004', '3198', '渭城区', '1');
INSERT INTO `region` VALUES ('103172', '002800040005', '00280004', '3199', '三原县', '1');
INSERT INTO `region` VALUES ('103173', '002800040006', '00280004', '3200', '泾阳县', '1');
INSERT INTO `region` VALUES ('103174', '002800040007', '00280004', '3201', '乾　县', '1');
INSERT INTO `region` VALUES ('103175', '002800040008', '00280004', '3202', '礼泉县', '1');
INSERT INTO `region` VALUES ('103176', '002800040009', '00280004', '3203', '永寿县', '1');
INSERT INTO `region` VALUES ('103177', '002800040010', '00280004', '3204', '彬　县', '1');
INSERT INTO `region` VALUES ('103178', '002800040011', '00280004', '3205', '长武县', '1');
INSERT INTO `region` VALUES ('103179', '002800040012', '00280004', '3206', '旬邑县', '1');
INSERT INTO `region` VALUES ('103180', '002800040013', '00280004', '3207', '淳化县', '1');
INSERT INTO `region` VALUES ('103181', '002800040014', '00280004', '3208', '武功县', '1');
INSERT INTO `region` VALUES ('103182', '002800040015', '00280004', '3209', '兴平市', '1');
INSERT INTO `region` VALUES ('103183', '002800050001', '00280005', '3210', '市辖区', '1');
INSERT INTO `region` VALUES ('103184', '002800050002', '00280005', '3211', '临渭区', '1');
INSERT INTO `region` VALUES ('103185', '002800050003', '00280005', '3212', '华　县', '1');
INSERT INTO `region` VALUES ('103186', '002800050004', '00280005', '3213', '潼关县', '1');
INSERT INTO `region` VALUES ('103187', '002800050005', '00280005', '3214', '大荔县', '1');
INSERT INTO `region` VALUES ('103188', '002800050006', '00280005', '3215', '合阳县', '1');
INSERT INTO `region` VALUES ('103189', '002800050007', '00280005', '3216', '澄城县', '1');
INSERT INTO `region` VALUES ('103190', '002800050008', '00280005', '3217', '蒲城县', '1');
INSERT INTO `region` VALUES ('103191', '002800050009', '00280005', '3218', '白水县', '1');
INSERT INTO `region` VALUES ('103192', '002800050010', '00280005', '3219', '富平县', '1');
INSERT INTO `region` VALUES ('103193', '002800050011', '00280005', '3220', '韩城市', '1');
INSERT INTO `region` VALUES ('103194', '002800050012', '00280005', '3221', '华阴市', '1');
INSERT INTO `region` VALUES ('103195', '002800050013', '00280006', '3222', '市辖区', '1');
INSERT INTO `region` VALUES ('103196', '002800060001', '00280006', '3223', '宝塔区', '1');
INSERT INTO `region` VALUES ('103197', '002800060002', '00280006', '3224', '延长县', '1');
INSERT INTO `region` VALUES ('103198', '002800060003', '00280006', '3225', '延川县', '1');
INSERT INTO `region` VALUES ('103199', '002800060004', '00280006', '3226', '子长县', '1');
INSERT INTO `region` VALUES ('103200', '002800060005', '00280006', '3227', '安塞县', '1');
INSERT INTO `region` VALUES ('103201', '002800060006', '00280006', '3228', '志丹县', '1');
INSERT INTO `region` VALUES ('103202', '002800060007', '00280006', '3229', '吴旗县', '1');
INSERT INTO `region` VALUES ('103203', '002800060008', '00280006', '3230', '甘泉县', '1');
INSERT INTO `region` VALUES ('103204', '002800060009', '00280006', '3231', '富　县', '1');
INSERT INTO `region` VALUES ('103205', '002800060010', '00280006', '3232', '洛川县', '1');
INSERT INTO `region` VALUES ('103206', '002800060011', '00280006', '3233', '宜川县', '1');
INSERT INTO `region` VALUES ('103207', '002800060012', '00280006', '3234', '黄龙县', '1');
INSERT INTO `region` VALUES ('103208', '002800060013', '00280006', '3235', '黄陵县', '1');
INSERT INTO `region` VALUES ('103209', '002800070001', '00280007', '3236', '市辖区', '1');
INSERT INTO `region` VALUES ('103210', '002800070002', '00280007', '3237', '汉台区', '1');
INSERT INTO `region` VALUES ('103211', '002800070003', '00280007', '3238', '南郑县', '1');
INSERT INTO `region` VALUES ('103212', '002800070004', '00280007', '3239', '城固县', '1');
INSERT INTO `region` VALUES ('103213', '002800070005', '00280007', '3240', '洋　县', '1');
INSERT INTO `region` VALUES ('103214', '002800070006', '00280007', '3241', '西乡县', '1');
INSERT INTO `region` VALUES ('103215', '002800070007', '00280007', '3242', '勉　县', '1');
INSERT INTO `region` VALUES ('103216', '002800070008', '00280007', '3243', '宁强县', '1');
INSERT INTO `region` VALUES ('103217', '002800070009', '00280007', '3244', '略阳县', '1');
INSERT INTO `region` VALUES ('103218', '002800070010', '00280007', '3245', '镇巴县', '1');
INSERT INTO `region` VALUES ('103219', '002800070011', '00280007', '3246', '留坝县', '1');
INSERT INTO `region` VALUES ('103220', '002800070012', '00280007', '3247', '佛坪县', '1');
INSERT INTO `region` VALUES ('103221', '002800080001', '00280008', '3248', '市辖区', '1');
INSERT INTO `region` VALUES ('103222', '002800080002', '00280008', '3249', '榆阳区', '1');
INSERT INTO `region` VALUES ('103223', '002800080003', '00280008', '3250', '神木县', '1');
INSERT INTO `region` VALUES ('103224', '002800080004', '00280008', '3251', '府谷县', '1');
INSERT INTO `region` VALUES ('103225', '002800080005', '00280008', '3252', '横山县', '1');
INSERT INTO `region` VALUES ('103226', '002800080006', '00280008', '3253', '靖边县', '1');
INSERT INTO `region` VALUES ('103227', '002800080007', '00280008', '3254', '定边县', '1');
INSERT INTO `region` VALUES ('103228', '002800080008', '00280008', '3255', '绥德县', '1');
INSERT INTO `region` VALUES ('103229', '002800080009', '00280008', '3256', '米脂县', '1');
INSERT INTO `region` VALUES ('103230', '002800080010', '00280008', '3257', '佳　县', '1');
INSERT INTO `region` VALUES ('103231', '002800080011', '00280008', '3258', '吴堡县', '1');
INSERT INTO `region` VALUES ('103232', '002800080012', '00280008', '3259', '清涧县', '1');
INSERT INTO `region` VALUES ('103233', '002800080013', '00280008', '3260', '子洲县', '1');
INSERT INTO `region` VALUES ('103234', '002800090001', '00280009', '3261', '市辖区', '1');
INSERT INTO `region` VALUES ('103235', '002800090002', '00280009', '3262', '汉滨区', '1');
INSERT INTO `region` VALUES ('103236', '002800090003', '00280009', '3263', '汉阴县', '1');
INSERT INTO `region` VALUES ('103237', '002800090004', '00280009', '3264', '石泉县', '1');
INSERT INTO `region` VALUES ('103238', '002800090005', '00280009', '3265', '宁陕县', '1');
INSERT INTO `region` VALUES ('103239', '002800090006', '00280009', '3266', '紫阳县', '1');
INSERT INTO `region` VALUES ('103240', '002800090007', '00280009', '3267', '岚皋县', '1');
INSERT INTO `region` VALUES ('103241', '002800090008', '00280009', '3268', '平利县', '1');
INSERT INTO `region` VALUES ('103242', '002800090009', '00280009', '3269', '镇坪县', '1');
INSERT INTO `region` VALUES ('103243', '002800090010', '00280009', '3270', '旬阳县', '1');
INSERT INTO `region` VALUES ('103244', '002800090011', '00280009', '3271', '白河县', '1');
INSERT INTO `region` VALUES ('103245', '002800100001', '00280010', '3272', '市辖区', '1');
INSERT INTO `region` VALUES ('103246', '002800100002', '00280010', '3273', '商州区', '1');
INSERT INTO `region` VALUES ('103247', '002800100003', '00280010', '3274', '洛南县', '1');
INSERT INTO `region` VALUES ('103248', '002800100004', '00280010', '3275', '丹凤县', '1');
INSERT INTO `region` VALUES ('103249', '002800100005', '00280010', '3276', '商南县', '1');
INSERT INTO `region` VALUES ('103250', '002800100006', '00280010', '3277', '山阳县', '1');
INSERT INTO `region` VALUES ('103251', '002800100007', '00280010', '3278', '镇安县', '1');
INSERT INTO `region` VALUES ('103252', '002800100008', '00280010', '3279', '柞水县', '1');
INSERT INTO `region` VALUES ('103253', '002900010001', '00290001', '3280', '市辖区', '1');
INSERT INTO `region` VALUES ('103254', '002900010002', '00290001', '3281', '城关区', '1');
INSERT INTO `region` VALUES ('103255', '002900010003', '00290001', '3282', '七里河区', '1');
INSERT INTO `region` VALUES ('103256', '002900010004', '00290001', '3283', '西固区', '1');
INSERT INTO `region` VALUES ('103257', '002900010005', '00290001', '3284', '安宁区', '1');
INSERT INTO `region` VALUES ('103258', '002900010006', '00290001', '3285', '红古区', '1');
INSERT INTO `region` VALUES ('103259', '002900010007', '00290001', '3286', '永登县', '1');
INSERT INTO `region` VALUES ('103260', '002900010008', '00290001', '3287', '皋兰县', '1');
INSERT INTO `region` VALUES ('103261', '002900010009', '00290001', '3288', '榆中县', '1');
INSERT INTO `region` VALUES ('103262', '002900020001', '00290002', '3289', '市辖区', '1');
INSERT INTO `region` VALUES ('103263', '002900030001', '00290003', '3290', '市辖区', '1');
INSERT INTO `region` VALUES ('103264', '002900030002', '00290003', '3291', '金川区', '1');
INSERT INTO `region` VALUES ('103265', '002900030003', '00290003', '3292', '永昌县', '1');
INSERT INTO `region` VALUES ('103266', '002900040001', '00290004', '3293', '市辖区', '1');
INSERT INTO `region` VALUES ('103267', '002900040002', '00290004', '3294', '白银区', '1');
INSERT INTO `region` VALUES ('103268', '002900040003', '00290004', '3295', '平川区', '1');
INSERT INTO `region` VALUES ('103269', '002900040004', '00290004', '3296', '靖远县', '1');
INSERT INTO `region` VALUES ('103270', '002900040005', '00290004', '3297', '会宁县', '1');
INSERT INTO `region` VALUES ('103271', '002900040006', '00290004', '3298', '景泰县', '1');
INSERT INTO `region` VALUES ('103272', '002900050001', '00290005', '3299', '市辖区', '1');
INSERT INTO `region` VALUES ('103273', '002900050002', '00290005', '3300', '秦城区', '1');
INSERT INTO `region` VALUES ('103274', '002900050003', '00290005', '3301', '北道区', '1');
INSERT INTO `region` VALUES ('103275', '002900050004', '00290005', '3302', '清水县', '1');
INSERT INTO `region` VALUES ('103276', '002900050005', '00290005', '3303', '秦安县', '1');
INSERT INTO `region` VALUES ('103277', '002900050006', '00290005', '3304', '甘谷县', '1');
INSERT INTO `region` VALUES ('103278', '002900050007', '00290005', '3305', '武山县', '1');
INSERT INTO `region` VALUES ('103279', '002900050008', '00290005', '3306', '张家川回族自治县', '1');
INSERT INTO `region` VALUES ('103280', '002900060001', '00290006', '3307', '市辖区', '1');
INSERT INTO `region` VALUES ('103281', '002900060002', '00290006', '3308', '凉州区', '1');
INSERT INTO `region` VALUES ('103282', '002900060003', '00290006', '3309', '民勤县', '1');
INSERT INTO `region` VALUES ('103283', '002900060004', '00290006', '3310', '古浪县', '1');
INSERT INTO `region` VALUES ('103284', '002900060005', '00290006', '3311', '天祝藏族自治县', '1');
INSERT INTO `region` VALUES ('103285', '002900070001', '00290007', '3312', '市辖区', '1');
INSERT INTO `region` VALUES ('103286', '002900070002', '00290007', '3313', '甘州区', '1');
INSERT INTO `region` VALUES ('103287', '002900070003', '00290007', '3314', '肃南裕固族自治县', '1');
INSERT INTO `region` VALUES ('103288', '002900070004', '00290007', '3315', '民乐县', '1');
INSERT INTO `region` VALUES ('103289', '002900070005', '00290007', '3316', '临泽县', '1');
INSERT INTO `region` VALUES ('103290', '002900070006', '00290007', '3317', '高台县', '1');
INSERT INTO `region` VALUES ('103291', '002900070007', '00290007', '3318', '山丹县', '1');
INSERT INTO `region` VALUES ('103292', '002900080001', '00290008', '3319', '市辖区', '1');
INSERT INTO `region` VALUES ('103293', '002900080002', '00290008', '3320', '崆峒区', '1');
INSERT INTO `region` VALUES ('103294', '002900080003', '00290008', '3321', '泾川县', '1');
INSERT INTO `region` VALUES ('103295', '002900080004', '00290008', '3322', '灵台县', '1');
INSERT INTO `region` VALUES ('103296', '002900080005', '00290008', '3323', '崇信县', '1');
INSERT INTO `region` VALUES ('103297', '002900080006', '00290008', '3324', '华亭县', '1');
INSERT INTO `region` VALUES ('103298', '002900080007', '00290008', '3325', '庄浪县', '1');
INSERT INTO `region` VALUES ('103299', '002900080008', '00290008', '3326', '静宁县', '1');
INSERT INTO `region` VALUES ('103300', '002900090001', '00290009', '3327', '市辖区', '1');
INSERT INTO `region` VALUES ('103301', '002900090002', '00290009', '3328', '肃州区', '1');
INSERT INTO `region` VALUES ('103302', '002900090003', '00290009', '3329', '金塔县', '1');
INSERT INTO `region` VALUES ('103303', '002900090004', '00290009', '3330', '安西县', '1');
INSERT INTO `region` VALUES ('103304', '002900090005', '00290009', '3331', '肃北蒙古族自治县', '1');
INSERT INTO `region` VALUES ('103305', '002900090006', '00290009', '3332', '阿克塞哈萨克族自治县', '1');
INSERT INTO `region` VALUES ('103306', '002900090007', '00290009', '3333', '玉门市', '1');
INSERT INTO `region` VALUES ('103307', '002900090008', '00290009', '3334', '敦煌市', '1');
INSERT INTO `region` VALUES ('103308', '002900100001', '00290010', '3335', '市辖区', '1');
INSERT INTO `region` VALUES ('103309', '002900100002', '00290010', '3336', '西峰区', '1');
INSERT INTO `region` VALUES ('103310', '002900100003', '00290010', '3337', '庆城县', '1');
INSERT INTO `region` VALUES ('103311', '002900100004', '00290010', '3338', '环　县', '1');
INSERT INTO `region` VALUES ('103312', '002900100005', '00290010', '3339', '华池县', '1');
INSERT INTO `region` VALUES ('103313', '002900100006', '00290010', '3340', '合水县', '1');
INSERT INTO `region` VALUES ('103314', '002900100007', '00290010', '3341', '正宁县', '1');
INSERT INTO `region` VALUES ('103315', '002900100008', '00290010', '3342', '宁　县', '1');
INSERT INTO `region` VALUES ('103316', '002900100009', '00290010', '3343', '镇原县', '1');
INSERT INTO `region` VALUES ('103317', '002900110001', '00290011', '3344', '市辖区', '1');
INSERT INTO `region` VALUES ('103318', '002900110002', '00290011', '3345', '安定区', '1');
INSERT INTO `region` VALUES ('103319', '002900110003', '00290011', '3346', '通渭县', '1');
INSERT INTO `region` VALUES ('103320', '002900110004', '00290011', '3347', '陇西县', '1');
INSERT INTO `region` VALUES ('103321', '002900110005', '00290011', '3348', '渭源县', '1');
INSERT INTO `region` VALUES ('103322', '002900110006', '00290011', '3349', '临洮县', '1');
INSERT INTO `region` VALUES ('103323', '002900110007', '00290011', '3350', '漳　县', '1');
INSERT INTO `region` VALUES ('103324', '002900110008', '00290011', '3351', '岷　县', '1');
INSERT INTO `region` VALUES ('103325', '002900120001', '00290012', '3352', '市辖区', '1');
INSERT INTO `region` VALUES ('103326', '002900120002', '00290012', '3353', '武都区', '1');
INSERT INTO `region` VALUES ('103327', '002900120003', '00290012', '3354', '成　县', '1');
INSERT INTO `region` VALUES ('103328', '002900120004', '00290012', '3355', '文　县', '1');
INSERT INTO `region` VALUES ('103329', '002900120005', '00290012', '3356', '宕昌县', '1');
INSERT INTO `region` VALUES ('103330', '002900120006', '00290012', '3357', '康　县', '1');
INSERT INTO `region` VALUES ('103331', '002900120007', '00290012', '3358', '西和县', '1');
INSERT INTO `region` VALUES ('103332', '002900120008', '00290012', '3359', '礼　县', '1');
INSERT INTO `region` VALUES ('103333', '002900120009', '00290012', '3360', '徽　县', '1');
INSERT INTO `region` VALUES ('103334', '002900120010', '00290012', '3361', '两当县', '1');
INSERT INTO `region` VALUES ('103335', '002900130001', '00290013', '3362', '临夏市', '1');
INSERT INTO `region` VALUES ('103336', '002900130002', '00290013', '3363', '临夏县', '1');
INSERT INTO `region` VALUES ('103337', '002900130003', '00290013', '3364', '康乐县', '1');
INSERT INTO `region` VALUES ('103338', '002900130004', '00290013', '3365', '永靖县', '1');
INSERT INTO `region` VALUES ('103339', '002900130005', '00290013', '3366', '广河县', '1');
INSERT INTO `region` VALUES ('103340', '002900130006', '00290013', '3367', '和政县', '1');
INSERT INTO `region` VALUES ('103341', '002900130007', '00290013', '3368', '东乡族自治县', '1');
INSERT INTO `region` VALUES ('103342', '002900130008', '00290013', '3369', '积石山保安族东乡族撒拉族自治县', '1');
INSERT INTO `region` VALUES ('103343', '002900140001', '00290014', '3370', '合作市', '1');
INSERT INTO `region` VALUES ('103344', '002900140002', '00290014', '3371', '临潭县', '1');
INSERT INTO `region` VALUES ('103345', '002900140003', '00290014', '3372', '卓尼县', '1');
INSERT INTO `region` VALUES ('103346', '002900140004', '00290014', '3373', '舟曲县', '1');
INSERT INTO `region` VALUES ('103347', '002900140005', '00290014', '3374', '迭部县', '1');
INSERT INTO `region` VALUES ('103348', '002900140006', '00290014', '3375', '玛曲县', '1');
INSERT INTO `region` VALUES ('103349', '002900140007', '00290014', '3376', '碌曲县', '1');
INSERT INTO `region` VALUES ('103350', '002900140008', '00290014', '3377', '夏河县', '1');
INSERT INTO `region` VALUES ('103351', '003000010001', '00300001', '3378', '市辖区', '1');
INSERT INTO `region` VALUES ('103352', '003000010002', '00300001', '3379', '城东区', '1');
INSERT INTO `region` VALUES ('103353', '003000010003', '00300001', '3380', '城中区', '1');
INSERT INTO `region` VALUES ('103354', '003000010004', '00300001', '3381', '城西区', '1');
INSERT INTO `region` VALUES ('103355', '003000010005', '00300001', '3382', '城北区', '1');
INSERT INTO `region` VALUES ('103356', '003000010006', '00300001', '3383', '大通回族土族自治县', '1');
INSERT INTO `region` VALUES ('103357', '003000010007', '00300001', '3384', '湟中县', '1');
INSERT INTO `region` VALUES ('103358', '003000010008', '00300001', '3385', '湟源县', '1');
INSERT INTO `region` VALUES ('103359', '003000020001', '00300002', '3386', '平安县', '1');
INSERT INTO `region` VALUES ('103360', '003000020002', '00300002', '3387', '民和回族土族自治县', '1');
INSERT INTO `region` VALUES ('103361', '003000020003', '00300002', '3388', '乐都县', '1');
INSERT INTO `region` VALUES ('103362', '003000020004', '00300002', '3389', '互助土族自治县', '1');
INSERT INTO `region` VALUES ('103363', '003000020005', '00300002', '3390', '化隆回族自治县', '1');
INSERT INTO `region` VALUES ('103364', '003000020006', '00300002', '3391', '循化撒拉族自治县', '1');
INSERT INTO `region` VALUES ('103365', '003000030001', '00300003', '3392', '门源回族自治县', '1');
INSERT INTO `region` VALUES ('103366', '003000030002', '00300003', '3393', '祁连县', '1');
INSERT INTO `region` VALUES ('103367', '003000030003', '00300003', '3394', '海晏县', '1');
INSERT INTO `region` VALUES ('103368', '003000030004', '00300003', '3395', '刚察县', '1');
INSERT INTO `region` VALUES ('103369', '003000040001', '00300004', '3396', '同仁县', '1');
INSERT INTO `region` VALUES ('103370', '003000040002', '00300004', '3397', '尖扎县', '1');
INSERT INTO `region` VALUES ('103371', '003000040003', '00300004', '3398', '泽库县', '1');
INSERT INTO `region` VALUES ('103372', '003000040004', '00300004', '3399', '河南蒙古族自治县', '1');
INSERT INTO `region` VALUES ('103373', '003000050001', '00300005', '3400', '共和县', '1');
INSERT INTO `region` VALUES ('103374', '003000050002', '00300005', '3401', '同德县', '1');
INSERT INTO `region` VALUES ('103375', '003000050003', '00300005', '3402', '贵德县', '1');
INSERT INTO `region` VALUES ('103376', '003000050004', '00300005', '3403', '兴海县', '1');
INSERT INTO `region` VALUES ('103377', '003000050005', '00300005', '3404', '贵南县', '1');
INSERT INTO `region` VALUES ('103378', '003000060001', '00300006', '3405', '玛沁县', '1');
INSERT INTO `region` VALUES ('103379', '003000060002', '00300006', '3406', '班玛县', '1');
INSERT INTO `region` VALUES ('103380', '003000060003', '00300006', '3407', '甘德县', '1');
INSERT INTO `region` VALUES ('103381', '003000060004', '00300006', '3408', '达日县', '1');
INSERT INTO `region` VALUES ('103382', '003000060005', '00300006', '3409', '久治县', '1');
INSERT INTO `region` VALUES ('103383', '003000060006', '00300006', '3410', '玛多县', '1');
INSERT INTO `region` VALUES ('103384', '003000070001', '00300007', '3411', '玉树县', '1');
INSERT INTO `region` VALUES ('103385', '003000070002', '00300007', '3412', '杂多县', '1');
INSERT INTO `region` VALUES ('103386', '003000070003', '00300007', '3413', '称多县', '1');
INSERT INTO `region` VALUES ('103387', '003000070004', '00300007', '3414', '治多县', '1');
INSERT INTO `region` VALUES ('103388', '003000070005', '00300007', '3415', '囊谦县', '1');
INSERT INTO `region` VALUES ('103389', '003000070006', '00300007', '3416', '曲麻莱县', '1');
INSERT INTO `region` VALUES ('103390', '003000080001', '00300008', '3417', '格尔木市', '1');
INSERT INTO `region` VALUES ('103391', '003000080002', '00300008', '3418', '德令哈市', '1');
INSERT INTO `region` VALUES ('103392', '003000080003', '00300008', '3419', '乌兰县', '1');
INSERT INTO `region` VALUES ('103393', '003000080004', '00300008', '3420', '都兰县', '1');
INSERT INTO `region` VALUES ('103394', '003000080005', '00300008', '3421', '天峻县', '1');
INSERT INTO `region` VALUES ('103395', '003100010001', '00310001', '3422', '市辖区', '1');
INSERT INTO `region` VALUES ('103396', '003100010002', '00310001', '3423', '兴庆区', '1');
INSERT INTO `region` VALUES ('103397', '003100010003', '00310001', '3424', '西夏区', '1');
INSERT INTO `region` VALUES ('103398', '003100010004', '00310001', '3425', '金凤区', '1');
INSERT INTO `region` VALUES ('103399', '003100010005', '00310001', '3426', '永宁县', '1');
INSERT INTO `region` VALUES ('103400', '003100010006', '00310001', '3427', '贺兰县', '1');
INSERT INTO `region` VALUES ('103401', '003100010007', '00310001', '3428', '灵武市', '1');
INSERT INTO `region` VALUES ('103402', '003100020001', '00310002', '3429', '市辖区', '1');
INSERT INTO `region` VALUES ('103403', '003100020002', '00310002', '3430', '大武口区', '1');
INSERT INTO `region` VALUES ('103404', '003100020003', '00310002', '3431', '惠农区', '1');
INSERT INTO `region` VALUES ('103405', '003100020004', '00310002', '3432', '平罗县', '1');
INSERT INTO `region` VALUES ('103406', '003100030001', '00310003', '3433', '市辖区', '1');
INSERT INTO `region` VALUES ('103407', '003100030002', '00310003', '3434', '利通区', '1');
INSERT INTO `region` VALUES ('103408', '003100030003', '00310003', '3435', '盐池县', '1');
INSERT INTO `region` VALUES ('103409', '003100030004', '00310003', '3436', '同心县', '1');
INSERT INTO `region` VALUES ('103410', '003100030005', '00310003', '3437', '青铜峡市', '1');
INSERT INTO `region` VALUES ('103411', '003100040001', '00310004', '3438', '市辖区', '1');
INSERT INTO `region` VALUES ('103412', '003100040002', '00310004', '3439', '原州区', '1');
INSERT INTO `region` VALUES ('103413', '003100040003', '00310004', '3440', '西吉县', '1');
INSERT INTO `region` VALUES ('103414', '003100040004', '00310004', '3441', '隆德县', '1');
INSERT INTO `region` VALUES ('103415', '003100040005', '00310004', '3442', '泾源县', '1');
INSERT INTO `region` VALUES ('103416', '003100040006', '00310004', '3443', '彭阳县', '1');
INSERT INTO `region` VALUES ('103417', '003100050001', '00310005', '3444', '市辖区', '1');
INSERT INTO `region` VALUES ('103418', '003100050002', '00310005', '3445', '沙坡头区', '1');
INSERT INTO `region` VALUES ('103419', '003100050003', '00310005', '3446', '中宁县', '1');
INSERT INTO `region` VALUES ('103420', '003100050004', '00310005', '3447', '海原县', '1');
INSERT INTO `region` VALUES ('103421', '003200010001', '00320001', '3448', '市辖区', '1');
INSERT INTO `region` VALUES ('103422', '003200010002', '00320001', '3449', '天山区', '1');
INSERT INTO `region` VALUES ('103423', '003200010003', '00320001', '3450', '沙依巴克区', '1');
INSERT INTO `region` VALUES ('103424', '003200010004', '00320001', '3451', '新市区', '1');
INSERT INTO `region` VALUES ('103425', '003200010005', '00320001', '3452', '水磨沟区', '1');
INSERT INTO `region` VALUES ('103426', '003200010006', '00320001', '3453', '头屯河区', '1');
INSERT INTO `region` VALUES ('103427', '003200010007', '00320001', '3454', '达坂城区', '1');
INSERT INTO `region` VALUES ('103428', '003200010008', '00320001', '3455', '东山区', '1');
INSERT INTO `region` VALUES ('103429', '003200010009', '00320001', '3456', '乌鲁木齐县', '1');
INSERT INTO `region` VALUES ('103430', '003200020001', '00320002', '3457', '市辖区', '1');
INSERT INTO `region` VALUES ('103431', '003200020002', '00320002', '3458', '独山子区', '1');
INSERT INTO `region` VALUES ('103432', '003200020003', '00320002', '3459', '克拉玛依区', '1');
INSERT INTO `region` VALUES ('103433', '003200020004', '00320002', '3460', '白碱滩区', '1');
INSERT INTO `region` VALUES ('103434', '003200020005', '00320002', '3461', '乌尔禾区', '1');
INSERT INTO `region` VALUES ('103435', '003200030001', '00320003', '3462', '吐鲁番市', '1');
INSERT INTO `region` VALUES ('103436', '003200030002', '00320003', '3463', '鄯善县', '1');
INSERT INTO `region` VALUES ('103437', '003200030003', '00320003', '3464', '托克逊县', '1');
INSERT INTO `region` VALUES ('103438', '003200040001', '00320004', '3465', '哈密市', '1');
INSERT INTO `region` VALUES ('103439', '003200040002', '00320004', '3466', '巴里坤哈萨克自治县', '1');
INSERT INTO `region` VALUES ('103440', '003200040003', '00320004', '3467', '伊吾县', '1');
INSERT INTO `region` VALUES ('103441', '003200050001', '00320005', '3468', '昌吉市', '1');
INSERT INTO `region` VALUES ('103442', '003200050002', '00320005', '3469', '阜康市', '1');
INSERT INTO `region` VALUES ('103443', '003200050003', '00320005', '3470', '米泉市', '1');
INSERT INTO `region` VALUES ('103444', '003200050004', '00320005', '3471', '呼图壁县', '1');
INSERT INTO `region` VALUES ('103445', '003200050005', '00320005', '3472', '玛纳斯县', '1');
INSERT INTO `region` VALUES ('103446', '003200050006', '00320005', '3473', '奇台县', '1');
INSERT INTO `region` VALUES ('103447', '003200050007', '00320005', '3474', '吉木萨尔县', '1');
INSERT INTO `region` VALUES ('103448', '003200050008', '00320005', '3475', '木垒哈萨克自治县', '1');
INSERT INTO `region` VALUES ('103449', '003200060001', '00320006', '3476', '博乐市', '1');
INSERT INTO `region` VALUES ('103450', '003200060002', '00320006', '3477', '精河县', '1');
INSERT INTO `region` VALUES ('103451', '003200060003', '00320006', '3478', '温泉县', '1');
INSERT INTO `region` VALUES ('103452', '003200070001', '00320007', '3479', '库尔勒市', '1');
INSERT INTO `region` VALUES ('103453', '003200070002', '00320007', '3480', '轮台县', '1');
INSERT INTO `region` VALUES ('103454', '003200070003', '00320007', '3481', '尉犁县', '1');
INSERT INTO `region` VALUES ('103455', '003200070004', '00320007', '3482', '若羌县', '1');
INSERT INTO `region` VALUES ('103456', '003200070005', '00320007', '3483', '且末县', '1');
INSERT INTO `region` VALUES ('103457', '003200070006', '00320007', '3484', '焉耆回族自治县', '1');
INSERT INTO `region` VALUES ('103458', '003200070007', '00320007', '3485', '和静县', '1');
INSERT INTO `region` VALUES ('103459', '003200070008', '00320007', '3486', '和硕县', '1');
INSERT INTO `region` VALUES ('103460', '003200070009', '00320007', '3487', '博湖县', '1');
INSERT INTO `region` VALUES ('103461', '003200080001', '00320008', '3488', '阿克苏市', '1');
INSERT INTO `region` VALUES ('103462', '003200080002', '00320008', '3489', '温宿县', '1');
INSERT INTO `region` VALUES ('103463', '003200080003', '00320008', '3490', '库车县', '1');
INSERT INTO `region` VALUES ('103464', '003200080004', '00320008', '3491', '沙雅县', '1');
INSERT INTO `region` VALUES ('103465', '003200080005', '00320008', '3492', '新和县', '1');
INSERT INTO `region` VALUES ('103466', '003200080006', '00320008', '3493', '拜城县', '1');
INSERT INTO `region` VALUES ('103467', '003200080007', '00320008', '3494', '乌什县', '1');
INSERT INTO `region` VALUES ('103468', '003200080008', '00320008', '3495', '阿瓦提县', '1');
INSERT INTO `region` VALUES ('103469', '003200080009', '00320008', '3496', '柯坪县', '1');
INSERT INTO `region` VALUES ('103470', '003200090001', '00320009', '3497', '阿图什市', '1');
INSERT INTO `region` VALUES ('103471', '003200090002', '00320009', '3498', '阿克陶县', '1');
INSERT INTO `region` VALUES ('103472', '003200090003', '00320009', '3499', '阿合奇县', '1');
INSERT INTO `region` VALUES ('103473', '003200090004', '00320009', '3500', '乌恰县', '1');
INSERT INTO `region` VALUES ('103474', '003200100001', '00320010', '3501', '喀什市', '1');
INSERT INTO `region` VALUES ('103475', '003200100002', '00320010', '3502', '疏附县', '1');
INSERT INTO `region` VALUES ('103476', '003200100003', '00320010', '3503', '疏勒县', '1');
INSERT INTO `region` VALUES ('103477', '003200100004', '00320010', '3504', '英吉沙县', '1');
INSERT INTO `region` VALUES ('103478', '003200100005', '00320010', '3505', '泽普县', '1');
INSERT INTO `region` VALUES ('103479', '003200100006', '00320010', '3506', '莎车县', '1');
INSERT INTO `region` VALUES ('103480', '003200100007', '00320010', '3507', '叶城县', '1');
INSERT INTO `region` VALUES ('103481', '003200100008', '00320010', '3508', '麦盖提县', '1');
INSERT INTO `region` VALUES ('103482', '003200100009', '00320010', '3509', '岳普湖县', '1');
INSERT INTO `region` VALUES ('103483', '003200100010', '00320010', '3510', '伽师县', '1');
INSERT INTO `region` VALUES ('103484', '003200100011', '00320010', '3511', '巴楚县', '1');
INSERT INTO `region` VALUES ('103485', '003200100012', '00320010', '3512', '塔什库尔干塔吉克自治县', '1');
INSERT INTO `region` VALUES ('103486', '003200110001', '00320011', '3513', '和田市', '1');
INSERT INTO `region` VALUES ('103487', '003200110002', '00320011', '3514', '和田县', '1');
INSERT INTO `region` VALUES ('103488', '003200110003', '00320011', '3515', '墨玉县', '1');
INSERT INTO `region` VALUES ('103489', '003200110004', '00320011', '3516', '皮山县', '1');
INSERT INTO `region` VALUES ('103490', '003200110005', '00320011', '3517', '洛浦县', '1');
INSERT INTO `region` VALUES ('103491', '003200110006', '00320011', '3518', '策勒县', '1');
INSERT INTO `region` VALUES ('103492', '003200110007', '00320011', '3519', '于田县', '1');
INSERT INTO `region` VALUES ('103493', '003200110008', '00320011', '3520', '民丰县', '1');
INSERT INTO `region` VALUES ('103494', '003200120001', '00320012', '3521', '伊宁市', '1');
INSERT INTO `region` VALUES ('103495', '003200120002', '00320012', '3522', '奎屯市', '1');
INSERT INTO `region` VALUES ('103496', '003200120003', '00320012', '3523', '伊宁县', '1');
INSERT INTO `region` VALUES ('103497', '003200120004', '00320012', '3524', '察布查尔锡伯自治县', '1');
INSERT INTO `region` VALUES ('103498', '003200120005', '00320012', '3525', '霍城县', '1');
INSERT INTO `region` VALUES ('103499', '003200120006', '00320012', '3526', '巩留县', '1');
INSERT INTO `region` VALUES ('103500', '003200120007', '00320012', '3527', '新源县', '1');
INSERT INTO `region` VALUES ('103501', '003200120008', '00320012', '3528', '昭苏县', '1');
INSERT INTO `region` VALUES ('103502', '003200120009', '00320012', '3529', '特克斯县', '1');
INSERT INTO `region` VALUES ('103503', '003200120010', '00320012', '3530', '尼勒克县', '1');
INSERT INTO `region` VALUES ('103504', '003200130001', '00320013', '3531', '塔城市', '1');
INSERT INTO `region` VALUES ('103505', '003200130002', '00320013', '3532', '乌苏市', '1');
INSERT INTO `region` VALUES ('103506', '003200130003', '00320013', '3533', '额敏县', '1');
INSERT INTO `region` VALUES ('103507', '003200130004', '00320013', '3534', '沙湾县', '1');
INSERT INTO `region` VALUES ('103508', '003200130005', '00320013', '3535', '托里县', '1');
INSERT INTO `region` VALUES ('103509', '003200130006', '00320013', '3536', '裕民县', '1');
INSERT INTO `region` VALUES ('103510', '003200130007', '00320013', '3537', '和布克赛尔蒙古自治县', '1');
INSERT INTO `region` VALUES ('103511', '003200140001', '00320014', '3538', '阿勒泰市', '1');
INSERT INTO `region` VALUES ('103512', '003200140002', '00320014', '3539', '布尔津县', '1');
INSERT INTO `region` VALUES ('103513', '003200140003', '00320014', '3540', '富蕴县', '1');
INSERT INTO `region` VALUES ('103514', '003200140004', '00320014', '3541', '福海县', '1');
INSERT INTO `region` VALUES ('103515', '003200140005', '00320014', '3542', '哈巴河县', '1');
INSERT INTO `region` VALUES ('103516', '003200140006', '00320014', '3543', '青河县', '1');
INSERT INTO `region` VALUES ('103517', '003200140007', '00320014', '3544', '吉木乃县', '1');

-- ----------------------------
-- Table structure for `store_info`
-- ----------------------------
DROP TABLE IF EXISTS `store_info`;
CREATE TABLE `store_info` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `enter_id` int(11) DEFAULT NULL,
  `store_name` varchar(40) DEFAULT NULL,
  `store_level` int(11) DEFAULT NULL,
  `store_addr` varchar(100) DEFAULT NULL,
  `cont_person` varchar(20) DEFAULT NULL,
  `cont_tel` varchar(20) DEFAULT NULL,
  `cont_qq` varchar(15) DEFAULT NULL,
  `store_logo` varchar(50) DEFAULT NULL,
  `service` varchar(200) DEFAULT NULL,
  `busi_start_hour` time DEFAULT NULL,
  `busi_end_hour` time DEFAULT NULL,
  `deliver_price` double(8,2) DEFAULT NULL,
  `shipping_fee` double(8,2) DEFAULT NULL,
  `resp_time` int(11) DEFAULT NULL,
  `store_state` int(11) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `store_type` int(11) DEFAULT NULL,
  `store_rank_accu` int(11) DEFAULT NULL,
  `store_rank` varchar(10) DEFAULT NULL,
  `store_credit` varchar(10) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `access_num` int(11) DEFAULT NULL,
  `deliver_range` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  KEY `Index_1` (`enter_id`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商铺信息表\r\n';

-- ----------------------------
-- Records of store_info
-- ----------------------------
INSERT INTO `store_info` VALUES ('1', '1', '爱便民首创店', '12', 'one strees', 'cwl', 'N', '943894329', '120130914165236.jpg', '热情', '09:00:00', '21:00:00', '18.00', '9.00', '5', '8', '2013-09-14 16:52:00', '10', '0', null, null, null, null, 'one strees datas');
INSERT INTO `store_info` VALUES ('2', '1', 'store2', '12', 'two strees', 'cwl', '15882477832', '493024523', '120130914171927.jpg', 'reqing', '09:00:00', '21:00:00', '15.00', '19.00', '4', '8', '2013-09-14 17:19:00', '10', '0', null, null, null, null, 'two streets  data');

-- ----------------------------
-- Table structure for `unit`
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='商品尺寸表';

-- ----------------------------
-- Records of unit
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `is_cert` varchar(5) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `is_validate` int(11) DEFAULT NULL,
  `user_rank` int(11) DEFAULT NULL,
  `regster_date` datetime DEFAULT NULL,
  `radom_str1` varchar(20) DEFAULT NULL,
  `radom_str2` varchar(20) DEFAULT NULL,
  `user_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `user_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  `user_add` varchar(100) DEFAULT NULL,
  `is_default` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户送货地址';

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('1', '1', '天津省县静海县', 'Y');
INSERT INTO `user_address` VALUES ('2', '2', '辽宁省抚顺市望花区', 'Y');
INSERT INTO `user_address` VALUES ('3', '3', '天津省市和平区', 'Y');
INSERT INTO `user_address` VALUES ('4', '4', '天津省县静海县', 'Y');
INSERT INTO `user_address` VALUES ('5', '5', '天津省县静海县', 'Y');
INSERT INTO `user_address` VALUES ('6', '6', '内蒙古省乌海市海南区', 'Y');
INSERT INTO `user_address` VALUES ('7', '7', '辽宁省本溪市南芬区', 'Y');
INSERT INTO `user_address` VALUES ('8', '8', '辽宁省本溪市南芬区', 'Y');
INSERT INTO `user_address` VALUES ('9', '9', '辽宁省本溪市南芬区', 'Y');
INSERT INTO `user_address` VALUES ('10', '10', '辽宁省本溪市南芬区', 'Y');
INSERT INTO `user_address` VALUES ('11', '11', '辽宁省本溪市南芬区', 'Y');
INSERT INTO `user_address` VALUES ('12', '12', '四川省成都市成华区', 'N');
INSERT INTO `user_address` VALUES ('13', '12', '内蒙古省赤峰市元宝山区', 'Y');
INSERT INTO `user_address` VALUES ('14', '12', '北京省市崇文区', 'N');

-- ----------------------------
-- Table structure for `user_login_session`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_session`;
CREATE TABLE `user_login_session` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(50) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `isvalidate` int(11) DEFAULT NULL,
  `user_rank` varchar(50) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_session
-- ----------------------------
INSERT INTO `user_login_session` VALUES ('12', '94596538', '陈文磊', null, '15823905822', '1', '123', '747ba11e2976147756bd2da8071709cd', '0', null, '100', null, 'unknown');

-- ----------------------------
-- View structure for `v_brand`
-- ----------------------------
DROP VIEW IF EXISTS `v_brand`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_brand` AS select `brand`.`brand_id` AS `brand_id`,`brand`.`cate_id` AS `cate_id`,`brand`.`brand_name` AS `brand_name`,`brand`.`recommend` AS `recommend` from `brand` ;

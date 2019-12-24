/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2019-12-20 10:37:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bookadmin`
-- ----------------------------
DROP TABLE IF EXISTS `bookadmin`;
CREATE TABLE `bookadmin` (
  `AdminId` int(50) NOT NULL AUTO_INCREMENT,
  `AdminPass` varchar(50) NOT NULL,
  `AdminName` varchar(45) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `Realname` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `receAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AdminId`)
) ENGINE=InnoDB AUTO_INCREMENT=947431254 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookadmin
-- ----------------------------
INSERT INTO `bookadmin` VALUES ('111', '111', '1234567', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('123', '123', '丁亚东', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('12345', '12345', '123', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('123123', '12313123', '1231231', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('123456', '123456', '余会', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('666666', '666666', '代清阳', '女', '代清阳', '', '13000000000', '', '');
INSERT INTO `bookadmin` VALUES ('1234567', '1234567', '1234567', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('123456789', '123456789', '康佳', null, null, null, null, null, null);
INSERT INTO `bookadmin` VALUES ('947431253', '228339726', '贾茜', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `bookclass`
-- ----------------------------
DROP TABLE IF EXISTS `bookclass`;
CREATE TABLE `bookclass` (
  `ClassId` int(11) NOT NULL COMMENT '图书类别ID序列号',
  `ClassName` varchar(50) DEFAULT NULL COMMENT '图书类别号',
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookclass
-- ----------------------------
INSERT INTO `bookclass` VALUES ('1', '新华书店');

-- ----------------------------
-- Table structure for `bookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `BookId` int(45) NOT NULL AUTO_INCREMENT COMMENT '图书编号 主键（自增字段）',
  `BookName` varchar(20) DEFAULT NULL COMMENT '书籍名',
  `BookClassID` int(11) DEFAULT NULL COMMENT '图书类别ID',
  `BookPress` varchar(20) DEFAULT NULL COMMENT '出版社',
  `BookPubDate` datetime DEFAULT NULL COMMENT '出版日期',
  `BookAuthor` varchar(10) DEFAULT NULL COMMENT '图书作者',
  `Bookisbn` varchar(10) DEFAULT NULL COMMENT '图书ISBN',
  `BookPrice` decimal(10,0) DEFAULT NULL COMMENT '图书定价',
  `BookPages` int(11) DEFAULT NULL COMMENT '图书页码',
  `BookQutline` varchar(255) DEFAULT NULL COMMENT '图书简介',
  `BookDealmount` int(11) DEFAULT NULL COMMENT '销量',
  `BookPic` varchar(255) DEFAULT NULL COMMENT '图书封面图',
  `BookStoremount` int(11) DEFAULT NULL COMMENT '图书库存量',
  `BookStoretime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入库时间',
  PRIMARY KEY (`BookId`),
  KEY `fk_BookClassID` (`BookClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', '墨菲定律', null, '北京师范大学出版社', '2016-01-01 00:00:00', '王华', '45641', '38', '264', '让你成为人生赢家', '2465', 'ia_10001.jpg', '1364', '2019-11-25 14:42:31');
INSERT INTO `bookinfo` VALUES ('2', '狼道', null, ' 江苏凤凰美术出版社', '2014-01-12 00:00:00', '梦华', '51653', '30', '224', '让人终生受益的书', '212', 'ia_10002.jpg', '2133', '2019-11-25 15:31:09');
INSERT INTO `bookinfo` VALUES ('3', '当你孤独时，你要干些什么', null, '京华出版社', '2019-11-30 17:20:55', '夏至', '124515', '59', '345', '从抗拒孤独，到喜欢孤独，再到享受孤独', '1588', 'ia_10003.jpg', '246', '2019-11-30 17:21:11');
INSERT INTO `bookinfo` VALUES ('4', '白天的房子，夜晚的房子', null, '人民出版社', '2014-01-01 00:00:00', '奥尔加.托卡尔丘克', '24667', '55', '154', '多次获得波兰权威文学大奖“尼刻奖”', '234', 'ia_10004.jpg', '479', '2019-12-03 00:29:31');
INSERT INTO `bookinfo` VALUES ('5', '古代人的日常生活', null, '万卷出版社', '2019-03-18 16:46:23', '将历史的王老师', '15356', '34', '256', '古人日常生活大曝光', '2455', 'hs_10001.jpg', '3462', '2019-09-03 16:16:09');
INSERT INTO `bookinfo` VALUES ('6', '曾国藩', null, '江苏文化出版社', '2016-07-01 16:52:47', '度阴山', '5664', '56', '341', '不走捷径', '8841', 'hs_10002.jpg', '1874', '2019-12-08 16:50:02');
INSERT INTO `bookinfo` VALUES ('7', '知行合一王阳明', null, '江苏文化出版社', '2012-01-09 16:52:24', '度阴山', '34627', '54', '321', '了解王阳明，绝大多数人都读这本书！', '1451', 'hs_10003.jpg', '561', '2019-12-08 16:51:22');
INSERT INTO `bookinfo` VALUES ('8', '孙子兵法', null, '江苏文化出版社', '2017-06-20 16:52:16', '华杉', '6841', '34', '126', '通俗通透解读经典战列，讲透兵法愿意', '498', 'hs_10004.jpg', '3461', '2019-12-08 16:52:01');
INSERT INTO `bookinfo` VALUES ('9', '传习录', null, ' 江苏凤凰美术出版社', '2016-05-21 17:00:08', '张靖杰', '6546', '45', '312', '尘封四百余年的初始善本', '3156', 'hs_10005.jpg', '2153', '2019-12-08 16:59:58');
INSERT INTO `bookinfo` VALUES ('10', '深不可测刘伯温', null, '江苏文化出版社', '2014-06-26 17:28:53', '度阴山', '1544', '36', '251', '千古谋臣！', '288', 'hs_10006.jpg', '1314', '2019-12-08 17:01:34');
INSERT INTO `bookinfo` VALUES ('11', '华杉讲透王阳明传习录', null, '江苏文化出版社', '2017-05-24 17:28:40', '度阴山', '54689', '56', '251', '这回是真正透彻理解阳明心学', '347', 'hs_10007.jpg', '2134', '2019-12-08 17:03:33');
INSERT INTO `bookinfo` VALUES ('12', '帝国首辅张居正', null, '江苏文化出版社', '2019-06-25 17:28:32', '度阴山', '6656', '43', '354', '力挽狂澜，看张居正，如何不择手段救天下！', '357', 'hs_10008.jpg', '3164', '2019-12-08 17:04:10');
INSERT INTO `bookinfo` VALUES ('13', '成吉思汗意志征服世界', null, '江苏文化出版社', '2015-05-26 17:28:21', '度阴山', '57825', '52', '258', '比智慧更强大的是意志！', '3467', 'hs_10009.jpg', '2445', '2019-12-08 17:04:46');
INSERT INTO `bookinfo` VALUES ('14', '大唐兴亡三百年', null, '万卷出版社', '2015-06-24 17:27:49', '王觉仁', '5565', '58', '142', '了解唐朝历史，读这套就够啦！', '348', 'hs_10010.jpg', null, '2019-12-08 17:07:17');
INSERT INTO `bookinfo` VALUES ('15', '一看就停不下来的北洋军阀史', null, '辽宁人民出版社', '2010-06-16 17:27:38', '直系', '45452', '45', '243', '拿得起，放不下！', '2546', 'hs_10050.jpg', '3131', '2019-12-08 17:11:17');
INSERT INTO `bookinfo` VALUES ('16', '唐史演义', null, '天津出版社', '2018-06-20 17:27:29', '蔡东潘', '154248', '68', '124', '民国时期精挑细选的学生课外读物；系统学习中国历史的入门级读本！', '245', 'hs_10051.jpg', '3421', '2019-12-08 17:13:02');
INSERT INTO `bookinfo` VALUES ('17', '唐诗现场', null, '山东文化出版社', '2016-05-17 17:27:20', '章雪峰', '24820', '34', '342', '每首唐诗都是一个历史现场', '545', 'hs_10052.jpg', '1242', '2019-12-08 17:14:12');
INSERT INTO `bookinfo` VALUES ('18', '明史不忍细看', null, '江苏人民出版社', '2016-05-10 17:27:09', '想敬之', '24254', '25', '352', '朱元璋，李善长，蓝玉，于谦，张居正，，，', '2412', 'hs_10053.jpg', '2365', '2019-12-08 17:15:02');
INSERT INTO `bookinfo` VALUES ('19', '这个历史很有趣', null, '台海出版社', '2017-05-16 17:27:03', '于春梅', '4504', '75', '324', '一本颠覆脸谱化历史记载的趣味图书，一堂诲人不倦而又逗人不倦的历史课。', '753', 'hs_10054.jpg', '3541', '2019-12-08 17:16:09');
INSERT INTO `bookinfo` VALUES ('20', '大明权利场', null, '台海出版社', '2018-05-18 17:26:55', '阮景东', '52204', '58', '142', '现实主义官僚PK理想主义皇帝', '354', 'hs_10055.jpg', '2316', '2019-12-08 17:16:35');
INSERT INTO `bookinfo` VALUES ('21', '这个清朝太有意思了', null, '台海出版社', '2019-10-29 17:26:50', '张晓珉', '2425', '36', '341', '明末战乱，群雄争霸。', '3414', 'hs_10056.jpg', '4142', '2019-12-08 17:17:50');
INSERT INTO `bookinfo` VALUES ('22', '明史演义', null, '天津出版社', '2015-10-21 17:26:40', '蔡东潘', '54525', '47', '233', '被誉为“读《二十四史》不如读蔡东潘”！', '463', 'hs_10057.jpg', '2541', '2019-12-08 17:19:24');
INSERT INTO `bookinfo` VALUES ('23', '人类文明简史', null, '辽宁人民出版社', '2017-05-01 17:26:23', '赵雪', '2525', '56', '243', '启示“永久和平”的真正意义所在', '4121', 'hs_10058.jpg', '6168', '2019-12-08 17:19:57');
INSERT INTO `bookinfo` VALUES ('24', '阳谋安天下诸葛亮', null, '台海出版社', '2019-10-22 17:26:18', '朱真', '5672', '52', '354', '天下共鉴，品诸葛亮经天纬地之才', '471', 'hs_10059.jpg', '2634', '2019-12-08 17:20:45');
INSERT INTO `bookinfo` VALUES ('25', '明朝那些事儿', null, '浙江人民出版社', '2011-06-08 17:26:09', '当年明月', '8814', '75', '421', '近三十年来不可多得的全本白话正说明朝大历史', '3524', 'hs_10060.jpg', '254', '2019-12-08 17:22:01');
INSERT INTO `bookinfo` VALUES ('26', '魂兮归来', null, '北京联合出版社', '2016-05-01 17:26:00', '金一南', '1522', '45', '254', '金一南讲抗日战争', '2411', 'hs_10061.jpg', '1641', '2019-12-08 17:23:12');
INSERT INTO `bookinfo` VALUES ('27', '明朝那些事儿新', null, '北京联合出版社', '2012-09-21 17:26:09', '当年明月', '56841', '71', '341', '朱元璋：从和尚到皇帝', '3468', 'hs_10062.jpg', '34845', '2019-12-16 09:17:32');
INSERT INTO `bookinfo` VALUES ('28', '唐朝穿越指南', null, '北京联合出版社', '2013-06-18 17:26:09', '森林鹿', '87941', '56', '246', '长安及各地人民生活手册', '25448', 'hs_10063.jpg', '1647', '2019-12-16 09:25:39');
INSERT INTO `bookinfo` VALUES ('29', '明朝那些事儿第三部', null, '浙江人民出版社', '2013-12-24 10:26:09', '当年明月', '78448', '60', '348', '近三十年来不可多得的全本白话正说明朝大历史，经典畅销不衰，影响无数读者的史学读本。', '6522', 'hs_10064.jpg', '38441', '2019-12-16 09:28:02');
INSERT INTO `bookinfo` VALUES ('30', '明朝那些事儿第六部', null, '浙江人民出版社', '2017-08-28 13:26:09', '当年明月', '878744', '56', '354', '近三十年来不可多得的全本白话正说明朝大历史，经典畅销不衰，影响无数读者的史学读本。', '9781', 'hs_10065.jpg', '68412', '2019-12-16 09:28:26');
INSERT INTO `bookinfo` VALUES ('31', '明朝那些事儿第六部新', null, '北京联合出版社', '2018-11-16 11:26:09', '当年明月', '8748', '66', '367', '帝国，风雨欲来', '29415', 'hs_10066.jpg', '24134', '2019-12-16 09:29:13');
INSERT INTO `bookinfo` VALUES ('32', '明朝那些事儿第七部', null, '浙江人民出版社', '2019-10-16 13:26:09', '当年明月', '2546', '78', '266', '近三十年来不可多得的全本白话正说明朝大历史，经典畅销不衰，影响无数读者的史学读本。', '5741', 'hs_10067.jpg', '4846', '2019-12-16 09:30:12');
INSERT INTO `bookinfo` VALUES ('33', '明朝那些事儿第五部新', null, '北京联合出版社', '2015-06-06 16:26:09', '当年明月', '1566', '65', '345', '内阁不相信眼泪', '5561', 'hs_10068.jpg', '6592', '2019-12-16 09:31:14');
INSERT INTO `bookinfo` VALUES ('34', '余生很长，别慌张，别失望', null, '北京联合出版社', '2017-08-28 13:26:09', '史铁生', '16414', '45', '142', '余生很长，别慌张，别失望', '54164', 'op_10001.jpg', '3251', '2019-12-17 17:01:53');
INSERT INTO `bookinfo` VALUES ('35', '鬼谷子', null, '台海出版社', '2013-06-18 17:26:09', '宋犀堕', '65255', '66', '245', '受益一生的12本书', '65564168', 'op_10002.png', '3366', '2019-12-17 17:32:53');
INSERT INTO `bookinfo` VALUES ('36', '贫穷的本质', null, '中信出版社集团', '2018-11-16 11:26:09', '阿比吉特.班纳级', '32513', '54', '354', '我们为什么摆脱不了贫穷', '34813', 'op_10003.jpg', '13231', '2019-12-17 17:37:14');
INSERT INTO `bookinfo` VALUES ('37', '罗生门', null, '江苏人民出版社', '2015-06-06 16:26:09', '芥川龙之介', '6253', '46', '234', '日本近代文学大师，你一辈子都很难看清的人性终于在《罗生门》李露出了全部面容！', '6513', 'op_10004.jpg', '7354', '2019-12-17 17:37:51');
INSERT INTO `bookinfo` VALUES ('38', '一看就停不下来的中国史', null, '台海出版社', '2013-06-18 17:26:09', '最爱君', '3151', '56', '451', '拿的起，放不下！', '955234', 'op_10005.jpg', '476', '2019-12-17 17:40:58');
INSERT INTO `bookinfo` VALUES ('39', '活着', null, '作家出版社', '2016-06-18 09:29:59', '余华', '2532', '34', '353', '本书荣获：意大利格林扎纳.卡佛文学奖', '4641634', 'op_10006.jpg', '45412', '2019-12-17 17:41:07');
INSERT INTO `bookinfo` VALUES ('40', '格局', null, '台海出版社', '2015-06-06 16:26:09', '宋犀堕', '2523', '57', '284', '让你受益一生的12本书', '3', 'op_10007.jpg', '34', '2019-12-18 08:34:07');
INSERT INTO `bookinfo` VALUES ('41', '环球国家地理百科全书', null, '北京联合出版社', '2013-12-24 10:26:09', '王越', '352356', '24', '345', '百科全书，环球国家地理', '65622', 'op_10008.jpg', '5164', '2019-12-18 08:34:28');
INSERT INTO `bookinfo` VALUES ('42', '墨菲定律', null, '吉林文辞出版社', '2017-08-28 13:26:09', '李源', '552', '32', '251', '不可不知的黄金法则和人生定律，不可不用的生存利器盒成功方法。', '4344264', 'op_10009.jpg', '4865', '2019-12-18 08:34:45');
INSERT INTO `bookinfo` VALUES ('43', '局外人', null, '北京联合出版社', '2012-09-21 17:26:09', '加缪', '36841', '52', '321', '如果你在人群中感觉到格格不入一定要读《局外人》！', '44131', 'op_10010.jpg', '68416', '2019-12-18 08:34:56');
INSERT INTO `bookinfo` VALUES ('44', '这里是中国', null, '中信出版集团', '2017-08-28 13:26:09', '中国青藏高原研究会', '54616', '51', '451', '你好，让我们重新发现这个之美', '5666', 'op_10011.jpg', '737', '2019-12-18 08:35:15');
INSERT INTO `bookinfo` VALUES ('45', '你不努力，没人能给你想要的生活', null, '吉林文辞出版社', '2012-09-21 17:26:09', '宿文渊', '6852', '84', '521', '青春成长励志书籍', '2123', 'op_10012.jpg', '345773', '2019-12-18 08:36:49');
INSERT INTO `bookinfo` VALUES ('46', '林薇因不慌不忙的坚强', null, '哈尔滨出版社', '2015-06-06 16:26:09', '赵一', '5962', '67', '242', '没有公主命，那就练一颗女王心！做林薇因一样完美的女人，内外兼修，成为自己的心中的女王！', '54231', 'op_10013.jpg', '6773', '2019-12-18 08:38:33');
INSERT INTO `bookinfo` VALUES ('47', '人间失格', null, '武汉出版社', '2018-11-16 11:26:09', '太宰治', '36413', '58', '546', '胆小鬼连幸福都会害怕，碰到棉花都会受伤，有时还会被幸福所伤。', '7545', 'op_10014.jpg', '357463', '2019-12-18 08:38:42');
INSERT INTO `bookinfo` VALUES ('48', '半小时漫画中国史', null, '吉林文史出版社', '2013-12-24 10:26:09', '陈磊', '2415642', '56', '215', '其实是一本严谨的极简中国史', '47563', 'op_10015.jpg', '3473', '2019-12-18 08:39:17');
INSERT INTO `bookinfo` VALUES ('49', '浮生六记', null, '天津出版传媒集团', '2015-06-06 16:26:09', '沈复', '34156', '74', '324', '本版原文系开明书店民国遗本', '3543', 'op_10016.jpg', '53173', '2019-12-18 08:39:51');
INSERT INTO `bookinfo` VALUES ('50', '你不努力谁也给不了你想要的生活', null, '中信出版社集团', '2012-09-21 17:26:09', '曾及始', '35451', '56', '124', '生活的理想，就是为了理想的生活', '6736', 'op_10017.jpg', '5467', '2019-12-18 08:40:30');
INSERT INTO `bookinfo` VALUES ('51', '深度思考', null, '江苏人民出版社', '2017-08-28 13:26:09', '莫林.希凯', '6511', '53', '354', '不断逼近问题的本质', '65736', 'op_10018.jpg', '53', '2019-12-18 08:41:56');
INSERT INTO `bookinfo` VALUES ('52', '未来简史，今日简史', null, '中信出版集团', '2016-06-18 09:29:59', '尤瓦尔', '3513', '45', '354', '人类命运大议题', '7613', 'op_10019.jpg', '3765', '2019-12-18 08:42:20');
INSERT INTO `bookinfo` VALUES ('53', '格局', null, '吉林文辞出版社', '2017-08-28 13:26:09', '李奕飞', '2345', '56', '524', '思路决定出路，格局决定结局', '35317', 'op_10020.jpg', '6433', '2019-12-18 08:42:42');
INSERT INTO `bookinfo` VALUES ('54', '小王子', null, '黑龙江美术出版社', '2016-06-18 09:29:59', '刘磊', '34231', '34', '3461', '引人入胜的精彩故事，受益终生的文学经典', '367463', 'op_10022.jpg', '153661', '2019-12-18 08:43:32');
INSERT INTO `bookinfo` VALUES ('55', '鬼谷子', null, '江苏凤凰美术出版社', '2013-06-18 17:26:09', '宋犀堕', '4466', '35', '654', '受益一生的10本书', '3537', 'op_10023.png', '7131', '2019-12-18 08:43:55');
INSERT INTO `bookinfo` VALUES ('56', '狼道', null, '吉林文史出版社', '2012-09-21 17:26:09', '梦华', '65432115', '32', '681', '社会生活的强者法则，组织管理，世界业经营', '6373', 'op_10024.jpg', '7386', '2019-12-18 08:44:08');
INSERT INTO `bookinfo` VALUES ('57', '国富论', null, '中信出版集团', '2016-06-18 09:29:59', '亚当', '246541', '25', '234', '全套72册，世界名著经典文学', '36361', 'op_10025.jpg', '478341', '2019-12-18 08:44:55');
INSERT INTO `bookinfo` VALUES ('58', '你不努力谁也给不了你想要的生活', null, '北京联合出版社', '2017-08-28 13:26:09', '曾及始', '2341', '45', '235', '致奋斗者，活出自己，沟通艺术', '63736', 'op_10026.jpg', '4731', '2019-12-18 08:45:28');
INSERT INTO `bookinfo` VALUES ('59', '了不起的挖掘机', null, '江苏凤凰美术出版社', '2013-06-18 17:26:09', '林东晨', '23154', '34', '346', '能看能听有声伴读', '76355', 'op_10027.jpg', '2346', '2019-12-18 08:45:43');
INSERT INTO `bookinfo` VALUES ('60', '白夜行', null, '台海出版社', '2018-05-22 09:45:13', '东野圭吾', '235498', '54', '534', '白夜行', '673', 'op_10028.jpg', '65', '2019-12-18 08:46:04');
INSERT INTO `bookinfo` VALUES ('61', '答案之书', null, '江苏凤凰美术出版社', '2017-08-28 13:26:09', '韦恩', '345123', '35', '642', '解答你的世界里正在发生的一切', '7334', 'op_10029.jpg', '64613', '2019-12-12 10:27:34');
INSERT INTO `bookinfo` VALUES ('62', '一只特立独行的猪', null, '北京出版社集团公司', '2013-06-18 17:26:09', '王小波', '4643', '34', '324', '我觉得黑色幽默是我的气质是天生的', '3456', 'op_10030.jpg', '64611', '2019-12-18 08:46:55');
INSERT INTO `bookinfo` VALUES ('63', '三体', null, '重庆出版社', '2012-09-21 17:26:09', '刘慈欣', '364562', '51', '341', '中国科幻银河奖特别奖获奖作品', '6246', 'op_10031.jpg', '346834', '2019-12-18 08:47:04');
INSERT INTO `bookinfo` VALUES ('64', '学生学具卡片', null, '人民教育出版社', '2017-08-28 13:26:09', '课程教材研究所', '26541', '62', '324', '二年级上册，小学生数学课程教材研究开发中心', '355', 'op_10032.jpg', '4683', '2019-12-18 08:47:39');
INSERT INTO `bookinfo` VALUES ('65', '平凡的世界', null, '中信出版集团', '2018-05-22 09:45:13', '路遥', '36556', '54', '664', '矛盾文学奖皇冠上的明珠', '564526', 'op_10033.jpg', '544936', '2019-12-18 08:47:51');
INSERT INTO `bookinfo` VALUES ('66', '你不可不知的人性', null, '重庆出版社', '2012-09-21 17:26:09', '刘墉', '364253', '67', '134', '洞悉人性的黑暗丑恶，以爱与善意驾奴生活', '534863', 'op_10034.jpg', '36647', '2019-12-18 08:48:07');
INSERT INTO `bookinfo` VALUES ('67', '故宫日历', null, '故宫出版社', '2017-08-28 13:26:00', '刘慈欣', '646631', '73', '361', '选取表现鼠年与紫禁城的文物', '6262', 'op_10035.jpg', '536645', '2019-12-18 08:49:43');
INSERT INTO `bookinfo` VALUES ('68', '乌合之众', null, '中信出版集团', '2018-05-22 09:45:13', '古斯塔夫，勒陇', '3644', '46', '620', '大众心理研究，一部影响世界的群体心理遵基之作', '6688', 'op_10036.jpg', '563648', '2019-12-18 08:49:50');
INSERT INTO `bookinfo` VALUES ('69', '观山海', null, '湖南文化出版社', '2017-08-28 13:26:00', '杉泽', '3162', '73', '215', '即日起买书送杉泽最新画作：蛇身人面神，宣纸装饰画', '6625', 'op_10037.jpg', '447742', '2019-12-18 08:50:41');
INSERT INTO `bookinfo` VALUES ('70', '你不努力谁也给不了你想要的生活', null, '中国出版集团', '2017-08-28 13:26:09', '曾庆灿', '3161568', '62', '225', '全套12册青少年励志书籍', '62554', 'op_10038.png', '5552', '2019-12-18 08:51:25');
INSERT INTO `bookinfo` VALUES ('71', '中国通史', null, '明日报出出版社', '2012-09-21 17:26:09', '吕思融', '3264', '31', '325', '中国通史第一到第五卷', '6256', 'op_10039.jpg', '552', '2019-12-18 08:51:36');
INSERT INTO `bookinfo` VALUES ('72', '别在吃苦的年级选择安逸', null, '文化出版社', '2012-09-21 17:26:09', '沉白', '352', '34', '515', '努力到无能为力，拼搏到感动自己，你的人生终将闪耀。', '5225', 'op_10040.jpg', '546249', '2019-12-18 08:51:56');
INSERT INTO `bookinfo` VALUES ('73', '给孩子的数学三书', null, '图书出版社', '2017-08-28 13:26:00', '刘薰宇', '31215', '54', '313', '原来数学可以这样学，马先生算数学', '5225', 'op_10041.jpg', '61446', '2019-12-18 08:52:25');
INSERT INTO `bookinfo` VALUES ('74', '你若不努力谁也给不了你想要的生活', null, '成都地图出版社', '2018-05-22 09:45:13', '曹君则', '645654', '64', '315', '所有成功的背后都有着不为人知的艰辛', '25426', 'op_10042.png', '8997914', '2019-12-18 08:52:49');
INSERT INTO `bookinfo` VALUES ('75', '背影', null, '北京出版社集团公司', '2012-09-21 17:26:09', '宋存', '6463', '64', '115', '大家小书，阅读经典', '66415', 'op_10043.jpg', '64144', '2019-12-18 08:56:00');
INSERT INTO `bookinfo` VALUES ('76', '中国诗词大会古来圣贤皆寂寞', null, '红旗出版社', '2013-06-18 17:26:09', '刘雷', '536415', '33', '152', '中国诗词大全，古来圣贤皆寂寞', '66526', 'op_10044.jpg', '641444', '2019-12-18 08:56:15');
INSERT INTO `bookinfo` VALUES ('77', '中华上下五千年', null, '北京出版社集团公司', '2014-01-12 00:00:00', '三国', '655323', '73', '143', '中华上下五千年第一册到第五册', '23215', 'op_10045.jpg', '644164', '2019-12-18 08:57:06');
INSERT INTO `bookinfo` VALUES ('78', '所有失去的都会以另一种方式归来', null, '重庆出版社', '2012-09-21 17:26:09', '耿帅', '642516', '36', '414', '著名华文畅销作家（耿帅）5年备受瞩暖心力作1800000次转发赞好，超过5亿次阅读', '15256', 'op_10046.jpg', '6134', '2019-12-18 08:57:36');
INSERT INTO `bookinfo` VALUES ('79', '格局', null, '江苏凤凰美术出版社', '2018-05-22 09:45:13', '乔治', '6415623', '63', '352', '百万强者的成功秘法', '5545', 'op_10047.jpg', '6114', '2019-12-18 08:57:51');
INSERT INTO `bookinfo` VALUES ('80', '巨人的陨落', null, '重庆美术出版社', '2013-06-18 17:26:09', '于大卫', '34562', '52', '625', '世纪三部曲', '64622', 'op_10048.jpg', '3411', '2019-12-18 08:58:20');
INSERT INTO `bookinfo` VALUES ('81', '鬼谷子', null, '台海出版社', '2014-01-12 00:00:00', '宋犀堕', '254165', '34', '334', '受益一生的12本书', '6411', 'op_10050.png', '13446', '2019-12-18 08:59:28');
INSERT INTO `bookinfo` VALUES ('82', '迷宫', null, '重庆出版社', '2017-08-28 13:26:09', '耿帅', '14342', '45', '343', '如意琳琅圆籍', '2486', '1.jpg', '34135', '2019-12-19 08:38:05');
INSERT INTO `bookinfo` VALUES ('83', '声律启蒙', null, '北京出版社集团公司', '2012-09-21 17:26:09', '东万商', '233241', '34', '642', '影响孩子一生的国学启蒙经典', '553452', '2.jpg', '5334', '2019-12-19 08:46:13');
INSERT INTO `bookinfo` VALUES ('84', '十宗罪', null, '浙江文化出版社', '2016-06-18 09:29:59', '蜘蛛', '4161', '86', '525', '一本对人性深层次揭示的罪案推理', '6254', '3.jpg', '52566', '2019-12-19 08:49:10');

-- ----------------------------
-- Table structure for `bookuser`
-- ----------------------------
DROP TABLE IF EXISTS `bookuser`;
CREATE TABLE `bookuser` (
  `UserId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户ID',
  `UserPass` varchar(50) DEFAULT NULL COMMENT '用户密码',
  `NormalName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `Address` varchar(255) DEFAULT NULL COMMENT '地址',
  `Phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `Post` varchar(8) DEFAULT NULL COMMENT '邮编',
  `Email` varchar(50) DEFAULT NULL,
  `RegTime` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookuser
-- ----------------------------

-- ----------------------------
-- Table structure for `favorites`
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` int(50) NOT NULL,
  `bid` int(45) NOT NULL,
  PRIMARY KEY (`id`,`bid`),
  KEY `bidd` (`bid`),
  CONSTRAINT `bidd` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`BookId`),
  CONSTRAINT `uidd` FOREIGN KEY (`id`) REFERENCES `bookadmin` (`AdminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES ('666666', '2');
INSERT INTO `favorites` VALUES ('666666', '3');
INSERT INTO `favorites` VALUES ('123', '4');
INSERT INTO `favorites` VALUES ('123', '5');
INSERT INTO `favorites` VALUES ('666666', '5');
INSERT INTO `favorites` VALUES ('666666', '31');
INSERT INTO `favorites` VALUES ('666666', '69');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(45) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `bid` int(45) DEFAULT NULL COMMENT '图书号',
  `iod` int(45) DEFAULT NULL,
  `number` int(11) NOT NULL COMMENT '单项图书货物数量',
  PRIMARY KEY (`id`),
  KEY `fk_BookId` (`bid`),
  KEY `oitem_order_id_idx` (`iod`),
  CONSTRAINT `oitem_book_id` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`BookId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `oitem_order_id` FOREIGN KEY (`iod`) REFERENCES `order_` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('79', '8', '46', '3');
INSERT INTO `orderitem` VALUES ('80', '7', '46', '1');
INSERT INTO `orderitem` VALUES ('81', '15', '47', '3');
INSERT INTO `orderitem` VALUES ('82', '22', '47', '1');
INSERT INTO `orderitem` VALUES ('83', '8', '48', '9');
INSERT INTO `orderitem` VALUES ('84', '25', '48', '1');
INSERT INTO `orderitem` VALUES ('85', '9', '49', '3');
INSERT INTO `orderitem` VALUES ('86', '5', '49', '1');
INSERT INTO `orderitem` VALUES ('87', '2', '50', '2');
INSERT INTO `orderitem` VALUES ('88', '2', '51', '2');
INSERT INTO `orderitem` VALUES ('89', '9', '51', '1');
INSERT INTO `orderitem` VALUES ('90', '9', '52', '5');
INSERT INTO `orderitem` VALUES ('91', '4', '52', '7');
INSERT INTO `orderitem` VALUES ('92', '2', '53', '3');
INSERT INTO `orderitem` VALUES ('93', '9', '53', '4');
INSERT INTO `orderitem` VALUES ('94', '23', '53', '5');
INSERT INTO `orderitem` VALUES ('95', '10', '54', '4');
INSERT INTO `orderitem` VALUES ('96', '23', '54', '1');
INSERT INTO `orderitem` VALUES ('97', '2', '55', '16');

-- ----------------------------
-- Table structure for `order_`
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(45) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `uid` int(45) DEFAULT NULL COMMENT '用户id',
  `crateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `order_user_id_idx` (`uid`),
  CONSTRAINT `order_user_id` FOREIGN KEY (`uid`) REFERENCES `bookadmin` (`AdminId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('46', '123', '2019-12-20 00:37:40');
INSERT INTO `order_` VALUES ('47', '123', '2019-12-20 00:38:13');
INSERT INTO `order_` VALUES ('48', '123', '2019-12-20 00:40:27');
INSERT INTO `order_` VALUES ('49', '123', '2019-12-20 00:41:14');
INSERT INTO `order_` VALUES ('50', '123', '2019-12-20 00:43:34');
INSERT INTO `order_` VALUES ('51', '123', '2019-12-20 00:53:38');
INSERT INTO `order_` VALUES ('52', '123', '2019-12-20 00:54:11');
INSERT INTO `order_` VALUES ('53', '123', '2019-12-20 01:22:44');
INSERT INTO `order_` VALUES ('54', '666666', '2019-12-20 08:43:11');
INSERT INTO `order_` VALUES ('55', '123', '2019-12-20 10:34:54');

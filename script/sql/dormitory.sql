-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: dormitory
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dor_bed`
--

DROP TABLE IF EXISTS `dor_bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_bed` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `bed_id` bigint NOT NULL,
  `dormitory_id` bigint DEFAULT NULL COMMENT '宿舍',
  `bed_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '床位编号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '床位状态',
  `record_id` bigint DEFAULT NULL COMMENT '记录id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='床位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_bed`
--

LOCK TABLES `dor_bed` WRITE;
/*!40000 ALTER TABLE `dor_bed` DISABLE KEYS */;
INSERT INTO `dor_bed` VALUES ('2023-05-20 07:12:45','2023-05-21 18:58:57','admin','admin',1659698634156548097,1659698634143965184,'1','2',1660238743666872320),('2023-05-20 07:12:45','2023-05-21 18:59:40','admin','admin',1659698634156548098,1659698634143965184,'2','2',1660238923891920896),('2023-05-20 07:12:45','2023-05-21 19:38:40','admin','admin',1659698634211074050,1659698634143965184,'3','2',1660248737284042752),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',1659698634211074051,1659698634143965184,'4','1',NULL);
/*!40000 ALTER TABLE `dor_bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dor_building`
--

DROP TABLE IF EXISTS `dor_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_building` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `building_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `number_floors` int DEFAULT NULL COMMENT '楼层数量',
  `total_rooms` int DEFAULT NULL COMMENT '房间数量',
  `available_rooms` int DEFAULT NULL COMMENT '可用房间数量',
  `occupied_rooms` int DEFAULT NULL COMMENT '已使用房间数量',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='楼栋信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_building`
--

LOCK TABLES `dor_building` WRITE;
/*!40000 ALTER TABLE `dor_building` DISABLE KEYS */;
INSERT INTO `dor_building` VALUES ('2023-05-19 20:14:20','2023-05-19 20:14:20','admin','admin',1659532939376627714,'一栋',6,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dor_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dor_dormitory`
--

DROP TABLE IF EXISTS `dor_dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_dormitory` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `dormitory_id` bigint NOT NULL,
  `dormitory_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍编号',
  `dormitory_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍类型',
  `building_id` bigint DEFAULT NULL COMMENT '楼栋',
  `in_floor` int DEFAULT NULL COMMENT '楼层',
  `at_full` char(2) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否满员bool'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宿舍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_dormitory`
--

LOCK TABLES `dor_dormitory` WRITE;
/*!40000 ALTER TABLE `dor_dormitory` DISABLE KEYS */;
INSERT INTO `dor_dormitory` VALUES ('2023-05-19 20:50:02','2023-05-19 21:49:17','admin','admin',1659541925064830978,'1101','4',1659532939376627714,NULL,'N'),('2023-05-19 21:49:12','2023-05-19 21:49:12','admin','admin',1659556812994301954,'1102','4',1659532939376627714,NULL,'N'),('2023-05-19 21:51:49','2023-05-19 21:51:49','admin','admin',1659557469847502849,'1103','4',1659532939376627714,NULL,'N'),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',1659698634143965184,'1104','4',1659532939376627714,NULL,'N');
/*!40000 ALTER TABLE `dor_dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dor_entrance_record`
--

DROP TABLE IF EXISTS `dor_entrance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_entrance_record` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `user_id` bigint DEFAULT NULL COMMENT '学生',
  `bed_id` bigint DEFAULT NULL COMMENT '床位',
  `entrance_time` datetime DEFAULT NULL COMMENT '入住时间',
  `leave_time` datetime DEFAULT NULL COMMENT '离开时间',
  `record_id` bigint NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='居住记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_entrance_record`
--

LOCK TABLES `dor_entrance_record` WRITE;
/*!40000 ALTER TABLE `dor_entrance_record` DISABLE KEYS */;
INSERT INTO `dor_entrance_record` VALUES ('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',101,1659698634156548097,NULL,NULL,1660234499761041408,'1'),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',1660067352858574848,1659698634156548098,NULL,NULL,1660235471333810176,'1'),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',1660067352858574848,1659698634156548097,NULL,NULL,1660238743666872320,'Y'),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',110,1659698634156548098,NULL,NULL,1660238923891920896,'Y'),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',101,1659698634211074050,'2023-05-21 19:38:40',NULL,1660248737284042752,'1');
/*!40000 ALTER TABLE `dor_entrance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dor_repair_order`
--

DROP TABLE IF EXISTS `dor_repair_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_repair_order` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `repair_id` bigint NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报修位置',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报修情况',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '维修状态',
  `repair_user` bigint DEFAULT NULL COMMENT '维修人',
  `repair_date_time` datetime DEFAULT NULL COMMENT '维修时间',
  `confirm_user` bigint DEFAULT NULL COMMENT '确认人',
  `confirm_date_time` datetime DEFAULT NULL COMMENT '确认时间',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保修人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='维修工单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_repair_order`
--

LOCK TABLES `dor_repair_order` WRITE;
/*!40000 ALTER TABLE `dor_repair_order` DISABLE KEYS */;
INSERT INTO `dor_repair_order` VALUES ('2023-05-21 19:46:01','2023-05-21 19:46:01','admin','admin',1660250587022413825,'一栋一单元101','空调坏了',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dor_repair_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dor_visitor`
--

DROP TABLE IF EXISTS `dor_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_visitor` (
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `visitor_id` bigint NOT NULL,
  `visit_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_visitor`
--

LOCK TABLES `dor_visitor` WRITE;
/*!40000 ALTER TABLE `dor_visitor` DISABLE KEYS */;
INSERT INTO `dor_visitor` VALUES ('2023-05-21 20:10:55','2023-10-11 21:26:40','admin','admin','木子','15812365487',1660256855023869954,'2023-05-21 11:00:00',NULL);
/*!40000 ALTER TABLE `dor_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_cache`
--

DROP TABLE IF EXISTS `sys_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_cache` (
  `cache_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cache_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cache_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_cache`
--

LOCK TABLES `sys_cache` WRITE;
/*!40000 ALTER TABLE `sys_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL,
  `config_name` varchar(255) DEFAULT NULL,
  `config_key` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  `config_type` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-04-21 21:11:39','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-04-21 21:11:39','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-04-21 21:11:39','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2023-04-21 21:11:39','admin','2023-05-21 07:02:14','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2023-04-21 21:11:39','admin','2023-04-21 21:19:41','是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-04-21 21:11:39','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `ancestors` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `order_num` int DEFAULT NULL,
  `leader` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'0','高校',1,'宿舍管理','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:20:32'),(101,1,'0,1','后勤部',1,'admin','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:21:39'),(103,101,'0,1,101','宿管部',1,'admin','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:21:42'),(105,101,'0,1,101','维修部',3,'admin','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:21:44');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL,
  `dict_sort` int DEFAULT NULL,
  `dict_label` varchar(255) DEFAULT NULL,
  `dict_value` varchar(255) DEFAULT NULL,
  `dict_type` varchar(255) DEFAULT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `list_class` varchar(255) DEFAULT NULL,
  `is_default` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-04-21 21:11:38','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-04-21 21:11:38','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-04-21 21:11:38','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-04-21 21:11:38','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-04-21 21:11:38','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-04-21 21:11:38','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-04-21 21:11:38','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-04-21 21:11:38','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-04-21 21:11:38','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-04-21 21:11:39','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-04-21 21:11:39','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-04-21 21:11:39','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-04-21 21:11:39','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-04-21 21:11:39','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-04-21 21:11:39','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-04-21 21:11:39','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-04-21 21:11:39','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-04-21 21:11:39','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-04-21 21:11:39','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-04-21 21:11:39','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-04-21 21:11:39','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-04-21 21:11:39','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-04-21 21:11:39','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'停用状态'),(30,1,'四人间','4','dor_dormitory_type','','primary','N','0','admin','2023-04-21 23:08:19','admin','2023-05-19 21:43:23',''),(31,2,'六人间','6','dor_dormitory_type','','primary','N','0','admin','2023-04-21 23:08:19','admin','2023-05-19 21:43:27',''),(32,3,'八人间','8','dor_dormitory_type','','primary','N','0','admin','2023-04-21 23:08:19','admin','2023-05-19 21:43:30',''),(33,1,'空闲','1','dor_bed_status','','info','N','0','admin','2023-04-21 23:08:19','',NULL,''),(34,2,'有人','2','dor_bed_status','','primary','N','0','admin','2023-04-21 23:08:19','',NULL,''),(35,3,'维修','3','dor_bed_status','','danger','N','0','admin','2023-04-21 23:08:19','',NULL,''),(36,1,'待维修','1','dor_repair_state','','warning','N','0','admin','2023-05-21 19:52:26','',NULL,''),(37,2,'已维修','2','dor_repair_state','','primary','N','0','admin','2023-05-21 19:52:26','',NULL,''),(38,3,'关闭','3','dor_repair_state','','info','N','0','admin','2023-05-21 19:52:26','',NULL,'');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL,
  `dict_name` varchar(255) DEFAULT NULL,
  `dict_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-04-21 21:11:38','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-04-21 21:11:38','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-04-21 21:11:38','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-04-21 21:11:38','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-04-21 21:11:38','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-04-21 21:11:38','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-04-21 21:11:38','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-04-21 21:11:38','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-04-21 21:11:38','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-04-21 21:11:38','',NULL,'登录状态列表'),(11,'宿舍类型','dor_dormitory_type','0','admin','2023-04-21 23:08:40','',NULL,''),(12,'床位状态','dor_bed_status','0','admin','2023-05-20 07:16:54','',NULL,''),(13,'维修状态','dor_repair_state','0','admin','2023-05-21 19:52:16','',NULL,'');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-04-21 21:11:39','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-04-21 21:11:39','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-04-21 21:11:39','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `ipaddr` varchar(255) DEFAULT NULL,
  `login_location` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `login_time` date DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `order_num` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `is_frame` varchar(255) DEFAULT NULL,
  `is_cache` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `visible` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `perms` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL,
  `query_param` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'1','0','M','0','0','','system','admin','2023-04-21 21:11:36','',NULL,'系统管理目录',NULL),(100,'用户管理',1,1,'user','system/user/index','1','0','C','0','0','system:user:list','user','admin','2023-04-21 21:11:36','',NULL,'用户管理菜单',NULL),(101,'角色管理',1,2,'role','system/role/index','1','0','C','0','0','system:role:list','peoples','admin','2023-04-21 21:11:36','',NULL,'角色管理菜单',NULL),(102,'菜单管理',1,3,'menu','system/menu/index','1','0','C','0','0','system:menu:list','tree-table','admin','2023-04-21 21:11:36','',NULL,'菜单管理菜单',NULL),(103,'部门管理',1,4,'dept','system/dept/index','1','0','C','0','0','system:dept:list','tree','admin','2023-04-21 21:11:36','',NULL,'部门管理菜单',NULL),(105,'字典管理',1,6,'dict','system/dict/index','1','0','C','0','0','system:dict:list','dict','admin','2023-04-21 21:11:36','',NULL,'字典管理菜单',NULL),(106,'参数设置',1,7,'config','system/config/index','1','0','C','0','0','system:config:list','edit','admin','2023-04-21 21:11:36','',NULL,'参数设置菜单',NULL),(108,'日志管理',1,9,'log','','1','0','M','0','0','','log','admin','2023-04-21 21:11:36','',NULL,'日志管理菜单',NULL),(109,'在线用户',1,1,'online','monitor/online/index','1','0','C','0','0','monitor:online:list','online','admin','2023-04-21 21:11:36','admin','2023-04-21 23:17:49','在线用户菜单',NULL),(500,'操作日志',108,1,'operlog','monitor/operlog/index','1','0','C','0','0','monitor:operlog:list','form','admin','2023-04-21 21:11:36','',NULL,'操作日志菜单',NULL),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','1','0','C','0','0','monitor:logininfor:list','logininfor','admin','2023-04-21 21:11:36','',NULL,'登录日志菜单',NULL),(1000,'用户查询',100,1,'','','1','0','F','0','0','system:user:query','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1001,'用户新增',100,2,'','','1','0','F','0','0','system:user:add','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1002,'用户修改',100,3,'','','1','0','F','0','0','system:user:edit','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1003,'用户删除',100,4,'','','1','0','F','0','0','system:user:remove','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1004,'用户导出',100,5,'','','1','0','F','0','0','system:user:export','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1005,'用户导入',100,6,'','','1','0','F','0','0','system:user:import','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1006,'重置密码',100,7,'','','1','0','F','0','0','system:user:resetPwd','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1007,'角色查询',101,1,'','','1','0','F','0','0','system:role:query','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1008,'角色新增',101,2,'','','1','0','F','0','0','system:role:add','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1009,'角色修改',101,3,'','','1','0','F','0','0','system:role:edit','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1010,'角色删除',101,4,'','','1','0','F','0','0','system:role:remove','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1011,'角色导出',101,5,'','','1','0','F','0','0','system:role:export','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1012,'菜单查询',102,1,'','','1','0','F','0','0','system:menu:query','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1013,'菜单新增',102,2,'','','1','0','F','0','0','system:menu:add','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1014,'菜单修改',102,3,'','','1','0','F','0','0','system:menu:edit','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1015,'菜单删除',102,4,'','','1','0','F','0','0','system:menu:remove','#','admin','2023-04-21 21:11:36','',NULL,'',NULL),(1016,'部门查询',103,1,'','','1','0','F','0','0','system:dept:query','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1017,'部门新增',103,2,'','','1','0','F','0','0','system:dept:add','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1018,'部门修改',103,3,'','','1','0','F','0','0','system:dept:edit','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1019,'部门删除',103,4,'','','1','0','F','0','0','system:dept:remove','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1025,'字典查询',105,1,'#','','1','0','F','0','0','system:dict:query','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1026,'字典新增',105,2,'#','','1','0','F','0','0','system:dict:add','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1027,'字典修改',105,3,'#','','1','0','F','0','0','system:dict:edit','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1028,'字典删除',105,4,'#','','1','0','F','0','0','system:dict:remove','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1029,'字典导出',105,5,'#','','1','0','F','0','0','system:dict:export','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1030,'参数查询',106,1,'#','','1','0','F','0','0','system:config:query','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1031,'参数新增',106,2,'#','','1','0','F','0','0','system:config:add','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1032,'参数修改',106,3,'#','','1','0','F','0','0','system:config:edit','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1033,'参数删除',106,4,'#','','1','0','F','0','0','system:config:remove','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1034,'参数导出',106,5,'#','','1','0','F','0','0','system:config:export','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1039,'操作查询',500,1,'#','','1','0','F','0','0','monitor:operlog:query','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1040,'操作删除',500,2,'#','','1','0','F','0','0','monitor:operlog:remove','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1041,'日志导出',500,3,'#','','1','0','F','0','0','monitor:operlog:export','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1042,'登录查询',501,1,'#','','1','0','F','0','0','monitor:logininfor:query','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1043,'登录删除',501,2,'#','','1','0','F','0','0','monitor:logininfor:remove','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1044,'日志导出',501,3,'#','','1','0','F','0','0','monitor:logininfor:export','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1045,'账户解锁',501,4,'#','','1','0','F','0','0','monitor:logininfor:unlock','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1046,'在线查询',109,1,'#','','1','0','F','0','0','monitor:online:query','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1047,'批量强退',109,2,'#','','1','0','F','0','0','monitor:online:batchLogout','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1048,'单条强退',109,3,'#','','1','0','F','0','0','monitor:online:forceLogout','#','admin','2023-04-21 21:11:37','',NULL,'',NULL),(1658470188742328320,'床位',0,1,'bed','dormitory/bed/index','1','0','C','0','0','dormitory:bed:list','edit','admin','2023-05-16 22:12:01','admin','2023-05-21 20:20:51','床位菜单',NULL),(1658470188742328321,'床位查询',1658470188742328320,1,'#','','1','0','F','0','0','dormitory:bed:query','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470188742328322,'床位新增',1658470188742328320,2,'#','','1','0','F','0','0','dormitory:bed:add','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470188742328323,'床位修改',1658470188742328320,3,'#','','1','0','F','0','0','dormitory:bed:edit','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470188742328324,'床位删除',1658470188742328320,4,'#','','1','0','F','0','0','dormitory:bed:remove','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470188742328325,'床位导出',1658470188742328320,5,'#','','1','0','F','0','0','dormitory:bed:export','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470189266616320,'宿舍',0,1,'dormitory','dormitory/dormitory/index','1','0','C','0','0','dormitory:dormitory:list','example','admin','2023-05-16 22:12:02','admin','2023-05-21 20:20:30','宿舍菜单',NULL),(1658470189266616321,'宿舍查询',1658470189266616320,1,'#','','1','0','F','0','0','dormitory:dormitory:query','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470189266616322,'宿舍新增',1658470189266616320,2,'#','','1','0','F','0','0','dormitory:dormitory:add','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470189266616323,'宿舍修改',1658470189266616320,3,'#','','1','0','F','0','0','dormitory:dormitory:edit','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470189266616324,'宿舍删除',1658470189266616320,4,'#','','1','0','F','0','0','dormitory:dormitory:remove','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470189266616325,'宿舍导出',1658470189266616320,5,'#','','1','0','F','0','0','dormitory:dormitory:export','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470189690241024,'居住记录',0,1,'record','dormitory/record/index','1','0','C','0','0','dormitory:record:list','log','admin','2023-05-16 22:12:02','admin','2023-05-21 20:21:17','居住记录菜单',NULL),(1658470190071922688,'维修工单',0,1,'order','dormitory/order/index','1','0','C','0','0','dormitory:order:list','tool','admin','2023-05-16 22:12:02','admin','2023-05-21 20:21:42','维修工单菜单',NULL),(1658470190071922689,'维修工单查询',1658470190071922688,1,'#','','1','0','F','0','0','dormitory:order:query','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470190071922690,'维修工单新增',1658470190071922688,2,'#','','1','0','F','0','0','dormitory:order:add','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470190071922691,'维修工单修改',1658470190071922688,3,'#','','1','0','F','0','0','dormitory:order:edit','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470190071922692,'维修工单删除',1658470190071922688,4,'#','','1','0','F','0','0','dormitory:order:remove','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470190071922693,'维修工单导出',1658470190071922688,5,'#','','1','0','F','0','0','dormitory:order:export','#','admin','2023-05-16 22:12:02','',NULL,'',NULL),(1658470190071922694,'居住记录查询',1658470189690241024,1,'#','','1','0','F','0','0','dormitory:record:query','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190071922695,'居住记录新增',1658470189690241024,2,'#','','1','0','F','0','0','dormitory:record:add','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190071922696,'居住记录修改',1658470189690241024,3,'#','','1','0','F','0','0','dormitory:record:edit','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190071922697,'居住记录删除',1658470189690241024,4,'#','','1','0','F','0','0','dormitory:record:remove','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190071922698,'居住记录导出',1658470189690241024,5,'#','','1','0','F','0','0','dormitory:record:export','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190449410048,'访客',0,1,'visitor','dormitory/visitor/index','1','0','C','0','0','dormitory:visitor:list','user','admin','2023-05-16 22:12:03','admin','2023-05-21 20:22:06','访客菜单',NULL),(1658470190449410049,'访客查询',1658470190449410048,1,'#','','1','0','F','0','0','dormitory:visitor:query','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190449410050,'访客新增',1658470190449410048,2,'#','','1','0','F','0','0','dormitory:visitor:add','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190449410051,'访客修改',1658470190449410048,3,'#','','1','0','F','0','0','dormitory:visitor:edit','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190449410052,'访客删除',1658470190449410048,4,'#','','1','0','F','0','0','dormitory:visitor:remove','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190449410053,'访客导出',1658470190449410048,5,'#','','1','0','F','0','0','dormitory:visitor:export','#','admin','2023-05-16 22:12:03','',NULL,'',NULL),(1658470190449410054,'楼栋',0,1,'building','dormitory/building/index','1','0','C','0','0',NULL,'component','admin','2023-05-19 19:50:27','',NULL,'',NULL),(1658470190449410055,'学生',0,5,'student','system/user/student','1','0','C','0','0',NULL,'people','admin','2023-05-20 20:25:39','',NULL,'',NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_type` varchar(255) DEFAULT NULL,
  `notice_content` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2023-04-21 21:11:39','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2023-04-21 21:11:39','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `business_type` int DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `request_method` varchar(255) DEFAULT NULL,
  `operator_type` int DEFAULT NULL,
  `oper_name` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `oper_url` varchar(255) DEFAULT NULL,
  `oper_ip` varchar(255) DEFAULT NULL,
  `oper_location` varchar(255) DEFAULT NULL,
  `oper_param` varchar(2000) DEFAULT NULL,
  `json_result` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `error_msg` varchar(255) DEFAULT NULL,
  `oper_time` date DEFAULT NULL,
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_suffix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `service` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss_config`
--

DROP TABLE IF EXISTS `sys_oss_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL,
  `config_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bucket_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `endpoint` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_https` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ext1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss_config`
--

LOCK TABLES `sys_oss_config` WRITE;
/*!40000 ALTER TABLE `sys_oss_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `post_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `post_sort` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_sort` int DEFAULT NULL,
  `data_scope` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menu_check_strictly` bit(1) DEFAULT NULL,
  `dept_check_strictly` bit(1) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL,
  `dept_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL,
  `dept_id` bigint DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0',
  `user_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,1,'admin','admin','1296581679@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','sys_user','127.0.0.1','2023-10-11','管理员','2023-01-08 11:19:43','2023-10-11 21:24:58','admin','admin');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `token_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dept_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ipaddr` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `os` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_time` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL,
  `post_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dormitory'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11 21:27:09

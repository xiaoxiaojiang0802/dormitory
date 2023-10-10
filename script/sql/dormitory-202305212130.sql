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
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bed_id` bigint NOT NULL,
  `dormitory_id` bigint DEFAULT NULL COMMENT '宿舍',
  `bed_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '床位编号',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '床位状态',
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
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `building_id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `number_floors` int DEFAULT NULL COMMENT '楼层数量',
  `total_rooms` int DEFAULT NULL COMMENT '房间数量',
  `available_rooms` int DEFAULT NULL COMMENT '可用房间数量',
  `occupied_rooms` int DEFAULT NULL COMMENT '已使用房间数量',
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址'
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
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dormitory_id` bigint NOT NULL,
  `dormitory_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍编号',
  `dormitory_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '宿舍类型',
  `floor` int DEFAULT NULL COMMENT '楼层',
  `building_id` bigint DEFAULT NULL COMMENT '楼栋',
  `full` char(2) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否满员bool'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='宿舍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dor_dormitory`
--

LOCK TABLES `dor_dormitory` WRITE;
/*!40000 ALTER TABLE `dor_dormitory` DISABLE KEYS */;
INSERT INTO `dor_dormitory` VALUES ('2023-05-19 20:50:02','2023-05-19 21:49:17','admin','admin',1659541925064830978,'1101','4',1,1659532939376627714,'N'),('2023-05-19 21:49:12','2023-05-19 21:49:12','admin','admin',1659556812994301954,'1102','4',1,1659532939376627714,'N'),('2023-05-19 21:51:49','2023-05-19 21:51:49','admin','admin',1659557469847502849,'1103','4',1,1659532939376627714,'N'),('2023-05-20 07:12:45','2023-05-20 07:12:45','admin','admin',1659698634143965184,'1104','4',1,1659532939376627714,'N');
/*!40000 ALTER TABLE `dor_dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dor_entrance_record`
--

DROP TABLE IF EXISTS `dor_entrance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dor_entrance_record` (
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL COMMENT '学生',
  `bed_id` bigint DEFAULT NULL COMMENT '床位',
  `entrance_time` datetime DEFAULT NULL COMMENT '入住时间',
  `leave_time` datetime DEFAULT NULL COMMENT '离开时间',
  `record_id` bigint NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL
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
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `repair_id` bigint NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报修位置',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报修情况',
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '维修状态',
  `repair_user` bigint DEFAULT NULL COMMENT '维修人',
  `repair_date_time` datetime DEFAULT NULL COMMENT '维修时间',
  `confirm_user` bigint DEFAULT NULL COMMENT '确认人',
  `confirm_date_time` datetime DEFAULT NULL COMMENT '确认时间',
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '保修人'
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
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
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
INSERT INTO `dor_visitor` VALUES ('2023-05-21 20:10:55','2023-05-21 20:17:38','admin','admin','小江','15812365487',1660256855023869954,'2023-05-21 11:00:00',NULL);
/*!40000 ALTER TABLE `dor_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
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
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','高校',1,'宿舍管理','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:20:32'),(101,100,'0,100','后勤部',1,'admin','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:21:39'),(103,101,'0,100,101','宿管部',1,'admin','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:21:42'),(105,101,'0,100,101','维修部',3,'admin','15812345678','sushe@qq.com','0','0','admin','2023-04-21 21:11:36','admin','2023-05-20 20:21:44');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
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
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
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
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
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
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1658470190449410056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-04-21 21:11:36','',NULL,'系统管理目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-04-21 21:11:36','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-04-21 21:11:36','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-04-21 21:11:36','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-04-21 21:11:36','',NULL,'部门管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-04-21 21:11:36','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-04-21 21:11:36','',NULL,'参数设置菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-04-21 21:11:36','',NULL,'日志管理菜单'),(109,'在线用户',1,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-04-21 21:11:36','admin','2023-04-21 23:17:49','在线用户菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-04-21 21:11:36','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-04-21 21:11:36','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-04-21 21:11:36','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-04-21 21:11:36','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-04-21 21:11:36','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-04-21 21:11:36','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-04-21 21:11:36','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-04-21 21:11:36','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-04-21 21:11:36','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-04-21 21:11:36','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-04-21 21:11:36','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-04-21 21:11:36','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-04-21 21:11:36','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-04-21 21:11:36','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-04-21 21:11:36','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-04-21 21:11:36','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-04-21 21:11:36','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-04-21 21:11:36','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-04-21 21:11:37','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-04-21 21:11:37','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-04-21 21:11:37','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-04-21 21:11:37','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-04-21 21:11:37','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-04-21 21:11:37','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-04-21 21:11:37','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-04-21 21:11:37','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-04-21 21:11:37','',NULL,''),(1658470188742328320,'床位',0,1,'bed','dormitory/bed/index',NULL,1,0,'C','0','0','dormitory:bed:list','edit','admin','2023-05-16 22:12:01','admin','2023-05-21 20:20:51','床位菜单'),(1658470188742328321,'床位查询',1658470188742328320,1,'#','',NULL,1,0,'F','0','0','dormitory:bed:query','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470188742328322,'床位新增',1658470188742328320,2,'#','',NULL,1,0,'F','0','0','dormitory:bed:add','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470188742328323,'床位修改',1658470188742328320,3,'#','',NULL,1,0,'F','0','0','dormitory:bed:edit','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470188742328324,'床位删除',1658470188742328320,4,'#','',NULL,1,0,'F','0','0','dormitory:bed:remove','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470188742328325,'床位导出',1658470188742328320,5,'#','',NULL,1,0,'F','0','0','dormitory:bed:export','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470189266616320,'宿舍',0,1,'dormitory','dormitory/dormitory/index',NULL,1,0,'C','0','0','dormitory:dormitory:list','example','admin','2023-05-16 22:12:02','admin','2023-05-21 20:20:30','宿舍菜单'),(1658470189266616321,'宿舍查询',1658470189266616320,1,'#','',NULL,1,0,'F','0','0','dormitory:dormitory:query','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470189266616322,'宿舍新增',1658470189266616320,2,'#','',NULL,1,0,'F','0','0','dormitory:dormitory:add','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470189266616323,'宿舍修改',1658470189266616320,3,'#','',NULL,1,0,'F','0','0','dormitory:dormitory:edit','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470189266616324,'宿舍删除',1658470189266616320,4,'#','',NULL,1,0,'F','0','0','dormitory:dormitory:remove','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470189266616325,'宿舍导出',1658470189266616320,5,'#','',NULL,1,0,'F','0','0','dormitory:dormitory:export','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470189690241024,'居住记录',0,1,'record','dormitory/record/index',NULL,1,0,'C','0','0','dormitory:record:list','log','admin','2023-05-16 22:12:02','admin','2023-05-21 20:21:17','居住记录菜单'),(1658470190071922688,'维修工单',0,1,'order','dormitory/order/index',NULL,1,0,'C','0','0','dormitory:order:list','tool','admin','2023-05-16 22:12:02','admin','2023-05-21 20:21:42','维修工单菜单'),(1658470190071922689,'维修工单查询',1658470190071922688,1,'#','',NULL,1,0,'F','0','0','dormitory:order:query','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470190071922690,'维修工单新增',1658470190071922688,2,'#','',NULL,1,0,'F','0','0','dormitory:order:add','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470190071922691,'维修工单修改',1658470190071922688,3,'#','',NULL,1,0,'F','0','0','dormitory:order:edit','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470190071922692,'维修工单删除',1658470190071922688,4,'#','',NULL,1,0,'F','0','0','dormitory:order:remove','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470190071922693,'维修工单导出',1658470190071922688,5,'#','',NULL,1,0,'F','0','0','dormitory:order:export','#','admin','2023-05-16 22:12:02','',NULL,''),(1658470190071922694,'居住记录查询',1658470189690241024,1,'#','',NULL,1,0,'F','0','0','dormitory:record:query','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190071922695,'居住记录新增',1658470189690241024,2,'#','',NULL,1,0,'F','0','0','dormitory:record:add','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190071922696,'居住记录修改',1658470189690241024,3,'#','',NULL,1,0,'F','0','0','dormitory:record:edit','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190071922697,'居住记录删除',1658470189690241024,4,'#','',NULL,1,0,'F','0','0','dormitory:record:remove','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190071922698,'居住记录导出',1658470189690241024,5,'#','',NULL,1,0,'F','0','0','dormitory:record:export','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190449410048,'访客',0,1,'visitor','dormitory/visitor/index',NULL,1,0,'C','0','0','dormitory:visitor:list','user','admin','2023-05-16 22:12:03','admin','2023-05-21 20:22:06','访客菜单'),(1658470190449410049,'访客查询',1658470190449410048,1,'#','',NULL,1,0,'F','0','0','dormitory:visitor:query','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190449410050,'访客新增',1658470190449410048,2,'#','',NULL,1,0,'F','0','0','dormitory:visitor:add','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190449410051,'访客修改',1658470190449410048,3,'#','',NULL,1,0,'F','0','0','dormitory:visitor:edit','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190449410052,'访客删除',1658470190449410048,4,'#','',NULL,1,0,'F','0','0','dormitory:visitor:remove','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190449410053,'访客导出',1658470190449410048,5,'#','',NULL,1,0,'F','0','0','dormitory:visitor:export','#','admin','2023-05-16 22:12:03','',NULL,''),(1658470190449410054,'楼栋',0,1,'building','dormitory/building/index',NULL,1,0,'C','0','0',NULL,'component','admin','2023-05-19 19:50:27','',NULL,''),(1658470190449410055,'学生',0,5,'student','system/user/student',NULL,1,0,'C','0','0',NULL,'people','admin','2023-05-20 20:25:39','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2023-04-21 21:11:39','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2023-04-21 21:11:39','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'参数管理',2,'com.cdmzl.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.cdmzl.system.domain.SysConfig\'','2023-04-21 21:17:15',19),(101,'参数管理',2,'com.cdmzl.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.cdmzl.system.domain.SysConfig\'','2023-04-21 21:17:25',4),(102,'参数管理',2,'com.cdmzl.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 21:19:41',32),(103,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/3','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 22:04:55',2),(104,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/115','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 22:04:57',8),(105,'角色管理',2,'com.cdmzl.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-04-21 21:11:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"修改角色\'普通角色\'失败，请联系管理员\",\"code\":500}',0,NULL,'2023-04-21 22:05:04',23),(106,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/117','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:05:29',13),(107,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/116','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:05:41',14),(108,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/115','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:06:58',15),(109,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:07:04',12),(110,'个人信息',2,'com.cdmzl.web.controller.system.SysProfileController.updatePwd()','PUT',1,'admin',NULL,'/system/user/profile/updatePwd','127.0.0.1','内网IP','{}','{\"msg\":\"修改密码异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-21 22:10:07',187),(111,'菜单管理',1,'com.cdmzl.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学习\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"study\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:28:46',16),(112,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"pm:course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:28:56',15),(113,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220290064384,\"path\":\"score\",\"perms\":\"pm:score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:01',14),(114,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/type/index\",\"createTime\":\"2023-04-21 22:27:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220290064384,\"menuName\":\"类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"type\",\"perms\":\"pm:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:11',11),(115,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"pm:score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:17',12),(116,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"pm:question:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:22',16),(117,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"study:course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:37',7),(118,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:42',14),(119,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/type/index\",\"createTime\":\"2023-04-21 22:27:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220290064384,\"menuName\":\"类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"type\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:48',0),(120,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:54',16),(121,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"pm:question:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:59',1),(122,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:30:02',18),(123,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580252','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:29',17),(124,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580235','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:37',27),(125,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580234','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:39',16),(126,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580233','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:41',21),(127,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580232','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:42',19),(128,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580231','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:44',17),(129,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580256','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:46',14),(130,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580254','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:49',5),(131,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580253','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:51',16),(132,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580255','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:54',17),(133,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:07',33),(134,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"rate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:15',10),(135,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:23',12),(136,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/type/index\",\"createTime\":\"2023-04-21 22:27:36\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220290064384,\"menuName\":\"类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"type\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:30',17),(137,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:46',0),(138,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:54',17),(139,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"rate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:37:04',18),(140,'岗位管理',2,'com.cdmzl.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:36\",\"flag\":false,\"params\":{},\"postCode\":\"admin\",\"postId\":1,\"postName\":\"管理员\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:09:39',15),(141,'岗位管理',2,'com.cdmzl.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:36\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":2,\"postName\":\"教师\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:09:55',25),(142,'岗位管理',2,'com.cdmzl.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:36\",\"flag\":false,\"params\":{},\"postCode\":\"student\",\"postId\":3,\"postName\":\"学生\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:10',16),(143,'岗位管理',3,'com.cdmzl.web.controller.system.SysPostController.remove()','DELETE',1,'admin',NULL,'/system/post/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:12',18),(144,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1007','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 23:10:31',0),(145,'角色管理',2,'com.cdmzl.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-04-21 21:11:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:38',14),(146,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/104','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 23:10:49',2),(147,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1020','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:53',16),(148,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1021','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:56',3),(149,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1022','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:58',1),(150,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1023','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:01',18),(151,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1024','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:03',24),(152,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:05',15),(153,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/107','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 23:11:12',0),(154,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1035','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:15',18),(155,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1036','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:17',12),(156,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1037','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:20',17),(157,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1038','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:22',16),(158,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:24',17),(159,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/111','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:44',17),(160,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/112','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:47',12),(161,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2023-04-21 21:11:36\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"在线用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:49',34),(162,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1049','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:55',3),(163,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1050','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:57',16),(164,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1051','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:59',15),(165,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1052','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:01',15),(166,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1053','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:04',17),(167,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1054','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:06',1),(168,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/110','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:08',12),(169,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:10',16),(170,'用户头像',2,'com.cdmzl.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-22 08:48:01',6),(171,'用户头像',2,'com.cdmzl.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-22 08:48:57',12),(172,'用户头像',2,'com.cdmzl.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-22 08:50:04',14824),(173,'用户头像',2,'com.cdmzl.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/04/22/blob_20230422085948A001.png\",\"code\":200}',0,NULL,'2023-04-22 08:59:49',6395),(174,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580225','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-05-16 22:12:28',10),(175,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580247','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:13:26',21),(176,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580248','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:13:28',21),(177,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580249','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:13:30',12),(178,'菜单管理',3,'com.cdmzl.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580250','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:13:53',20),(179,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/dormitory/index\",\"createTime\":\"2023-05-16 22:12:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470189266616320,\"menuName\":\"宿舍\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"dormitory\",\"perms\":\"dormitory:dormitory:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:14:31',101),(180,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/bed/index\",\"createTime\":\"2023-05-16 22:12:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470188742328320,\"menuName\":\"床位\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"bed\",\"perms\":\"dormitory:bed:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:14:40',10),(181,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/visitor/index\",\"createTime\":\"2023-05-16 22:12:03\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470190449410048,\"menuName\":\"访客\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"visitor\",\"perms\":\"dormitory:visitor:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:14:45',21),(182,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/record/index\",\"createTime\":\"2023-05-16 22:12:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470189690241024,\"menuName\":\"居住记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"record\",\"perms\":\"dormitory:record:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:14:49',12),(183,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/order/index\",\"createTime\":\"2023-05-16 22:12:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470190071922688,\"menuName\":\"维修工单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"dormitory:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-16 22:14:52',13),(184,'菜单管理',1,'com.cdmzl.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/building/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"楼栋\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"building\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-19 19:50:27',140),(185,'字典数据',2,'com.cdmzl.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 23:08:19\",\"cssClass\":\"\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"四人间\",\"dictSort\":1,\"dictType\":\"dor_dormitory_type\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.cdmzl.common.core.domain.entity.SysDictData\'','2023-05-19 21:40:56',38),(186,'字典数据',2,'com.cdmzl.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 23:08:19\",\"cssClass\":\"\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"四人间\",\"dictSort\":1,\"dictType\":\"dor_dormitory_type\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.cdmzl.common.core.domain.entity.SysDictData\'','2023-05-19 21:41:00',1),(187,'字典数据',2,'com.cdmzl.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 23:08:19\",\"cssClass\":\"\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"四人间\",\"dictSort\":1,\"dictType\":\"dor_dormitory_type\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.cdmzl.common.core.domain.entity.SysDictData\'','2023-05-19 21:42:02',1),(188,'字典数据',2,'com.cdmzl.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 23:08:19\",\"cssClass\":\"\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"四人间\",\"dictSort\":1,\"dictType\":\"dor_dormitory_type\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-19 21:43:23',40),(189,'字典数据',2,'com.cdmzl.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 23:08:19\",\"cssClass\":\"\",\"default\":false,\"dictCode\":31,\"dictLabel\":\"六人间\",\"dictSort\":2,\"dictType\":\"dor_dormitory_type\",\"dictValue\":\"6\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-19 21:43:27',7),(190,'字典数据',2,'com.cdmzl.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 23:08:19\",\"cssClass\":\"\",\"default\":false,\"dictCode\":32,\"dictLabel\":\"八人间\",\"dictSort\":3,\"dictType\":\"dor_dormitory_type\",\"dictValue\":\"8\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-19 21:43:30',7),(191,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:18:57',15),(192,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:18:58',11),(193,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:19:00',9),(194,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:19:01',8),(195,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:19:03',9),(196,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2023-05-20 20:19:05',3),(197,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:19:07',10),(198,'部门管理',3,'com.cdmzl.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/103','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2023-05-20 20:19:09',4),(199,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"高校\",\"email\":\"sushe@qq.com\",\"leader\":\"宿舍管理\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:20:32',43),(200,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"后勤部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"高校\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:20:43',18),(201,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"宿管部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:20:50',15),(202,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"维修部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:00',13),(203,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"后勤部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"高校\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:06',14),(204,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"宿管部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:09',15),(205,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"维修部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:12',15),(206,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"维修部\",\"email\":\"sushe@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:22',12),(207,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"宿管部\",\"email\":\"sushe@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:25',12),(208,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"后勤部\",\"email\":\"sushe@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"高校\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:29',16),(209,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"后勤部\",\"email\":\"sushe@qq.com\",\"leader\":\"admin\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"高校\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:39',14),(210,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"宿管部\",\"email\":\"sushe@qq.com\",\"leader\":\"admin\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:42',12),(211,'部门管理',2,'com.cdmzl.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"维修部\",\"email\":\"sushe@qq.com\",\"leader\":\"admin\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"后勤部\",\"phone\":\"15812345678\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:21:44',13),(212,'菜单管理',1,'com.cdmzl.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/student\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学生\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"student\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 20:25:39',15),(213,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"555\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"555\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 21:07:39',87),(214,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"1234\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"1234\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 21:08:55',80),(215,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"12345\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"12345\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-20 21:09:30',75),(216,'参数管理',2,'com.cdmzl.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:02:14',111),(217,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"123321\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":103,\"userName\":\"123321\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:02:28',93),(218,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"123321123321\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":104,\"userName\":\"123321123321\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:03:36',11629),(219,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"12341234\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":105,\"userName\":\"12341234\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:04:06',79),(220,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"123412341234\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":106,\"userName\":\"123412341234\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:04:39',78),(221,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"12341\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":107,\"userName\":\"12341\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:04:51',78),(222,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"userType\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":108,\"userName\":\"userType\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:05:52',28217),(223,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"userType\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":109,\"userName\":\"userTypeuserType\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:07:27',14127),(224,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"userType22\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":110,\"userName\":\"userType22\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:09:20',112),(225,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"cadnode\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"cadnode\",\"userType\":\"1\"}',NULL,1,'com.cdmzl.system.mapper.SysUserMapper.insertUser (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1','2023-05-21 07:17:17',147),(226,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"cadnode\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"cadnode\",\"userType\":\"1\"}',NULL,1,'com.cdmzl.system.mapper.SysUserMapper.insertUser (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1','2023-05-21 07:18:42',77),(227,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"2222\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":1660063466399653888,\"userName\":\"userType222\",\"userType\":\"1\"}',NULL,1,'com.cdmzl.system.mapper.SysUserMapper.insertUser (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1','2023-05-21 07:22:27',1295),(228,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"cardNo\":\"2222\",\"createBy\":\"admin\",\"nickName\":\"22221\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":1660066027055800320,\"userName\":\"userType2221\",\"userType\":\"1\"}',NULL,1,'com.cdmzl.system.mapper.SysUserMapper.insertUser (batch index #1) failed. Cause: java.sql.BatchUpdateException: Unknown column \'card_no\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.BatchUpdateException: Unknown column \'card_no\' in \'field list\'','2023-05-21 07:32:38',85),(229,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"cardNo\":\"222\",\"createBy\":\"admin\",\"nickName\":\"userType223\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":1660066739345080320,\"userName\":\"userType223\",\"userType\":\"1\"}',NULL,1,'com.cdmzl.system.mapper.SysUserMapper.insertUser (batch index #1) failed. Cause: java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.BatchUpdateException: Column count doesn\'t match value count at row 1','2023-05-21 07:35:27',1308),(230,'用户管理',1,'com.cdmzl.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"cardNo\":\"userType2299\",\"createBy\":\"admin\",\"nickName\":\"userType2299\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":1660067352858574848,\"userName\":\"userType2299\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 07:37:54',1281),(231,'用户管理',2,'com.cdmzl.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"cardNo\":\"315025\",\"createBy\":\"admin\",\"createTime\":\"2023-05-20 21:07:39\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"555\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-21 17:29:19\",\"userId\":100,\"userName\":\"555\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 17:29:19',135),(232,'用户管理',2,'com.cdmzl.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"cardNo\":\"2023011\",\"createBy\":\"admin\",\"createTime\":\"2023-05-21 07:37:54\",\"delFlag\":\"0\",\"nickName\":\"userType2299\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-21 17:31:57\",\"userId\":1660067352858574848,\"userName\":\"userType2299\",\"userType\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 17:31:57',45),(233,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/dormitory/index\",\"createTime\":\"2023-05-16 22:12:02\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470189266616320,\"menuName\":\"宿舍\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"dormitory\",\"perms\":\"dormitory:dormitory:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:20:30',45),(234,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/bed/index\",\"createTime\":\"2023-05-16 22:12:01\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470188742328320,\"menuName\":\"床位\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"bed\",\"perms\":\"dormitory:bed:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:20:51',10),(235,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/record/index\",\"createTime\":\"2023-05-16 22:12:02\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470189690241024,\"menuName\":\"居住记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"record\",\"perms\":\"dormitory:record:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:21:17',7),(236,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/order/index\",\"createTime\":\"2023-05-16 22:12:02\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470190071922688,\"menuName\":\"维修工单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"dormitory:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:21:42',8),(237,'菜单管理',2,'com.cdmzl.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory/visitor/index\",\"createTime\":\"2023-05-16 22:12:03\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1658470190449410048,\"menuName\":\"访客\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"visitor\",\"perms\":\"dormitory:visitor:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:22:06',8),(238,'用户管理',2,'com.cdmzl.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-21 20:56:36\",\"userId\":101}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:56:36',14),(239,'用户管理',2,'com.cdmzl.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-21 20:56:38\",\"userId\":110}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:56:38',6),(240,'用户管理',2,'com.cdmzl.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-21 20:56:40\",\"userId\":1660067352858574848}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-05-21 20:56:40',6);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss_file`
--

DROP TABLE IF EXISTS `sys_oss_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss_file` (
  `id` bigint NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `bucket_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `file_size` bigint DEFAULT NULL,
  `del_flag` int DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss_file`
--

LOCK TABLES `sys_oss_file` WRITE;
/*!40000 ALTER TABLE `sys_oss_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'admin','管理员',1,'0','admin','2023-04-21 21:11:36','admin','2023-04-21 23:09:39',''),(2,'teacher','教师',2,'0','admin','2023-04-21 21:11:36','admin','2023-04-21 23:09:55',''),(3,'student','学生',3,'0','admin','2023-04-21 21:11:36','admin','2023-04-21 23:10:10','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-04-21 21:11:36','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-04-21 21:11:36','admin','2023-04-21 23:10:38','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
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
  `user_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `user_type` char(2) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  `login_ip` varchar(255) DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL COMMENT '学号',
  `in_dormitory` char(1) DEFAULT 'N',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','宿舍','00','sushe@163.com','15888888888','1','','$2a$10$jmmo4m9y7J7MQi1Uuj.bNOFeiE9DvPeNeUbioJ7HNIrJrq6a7mKFu','0','0','127.0.0.1','2023-05-21','admin','2023-04-21 21:11:36','','2023-05-21 21:24:56','管理员',NULL,NULL),(2,105,'ry','宿舍','00','sushe@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-04-21','admin','2023-04-21 21:11:36','',NULL,'测试员',NULL,NULL),(100,NULL,'555','宿舍','1','','','0','','$2a$10$L4fSugSkavQN1LldejhxbOBibJREwIgTpWy8dlgJVcGwNAGOoG0Aa','0','0','',NULL,'admin','2023-05-20 21:07:39','admin','2023-05-21 17:29:19',NULL,NULL,NULL),(101,NULL,'1234','宿舍','1','','','0','','$2a$10$mBfqasOVp5gQCpzPD96Qz.5TEbF0TYOFZyGL0mjTmSbTpZKl7w2eu','0','0','',NULL,'admin','2023-05-20 21:08:55','admin','2023-05-21 20:56:36',NULL,NULL,'N'),(102,NULL,'12345','宿舍','1','','','0','','$2a$10$2nq4g8gvzlHXGVylG4LhletNJcRD0kisaSB4eljoHtDnihZYduET2','0','0','',NULL,'admin','2023-05-20 21:09:30','',NULL,NULL,NULL,'N'),(110,NULL,'userType22','宿舍','1','','','0','','$2a$10$gTenAvdS0gXjczc9FZv4LOjTi9d5X3g6lGTLVv3b4AwDZcVnqAxze','0','0','',NULL,'admin','2023-05-21 07:09:20','admin','2023-05-21 20:56:38',NULL,NULL,'N'),(1660067352858574848,NULL,'userType2299','宿舍','1',NULL,NULL,'0',NULL,'$2a$10$MMFF77URiEuyFYR3EqBu9.bzTwIulhty8AtIYiowTosFNAxGkybd.','0','0',NULL,NULL,'admin','2023-05-21 07:37:54','admin','2023-05-21 20:56:40',NULL,'2023011','N');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
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

-- Dump completed on 2023-05-21 21:30:57

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mzl-study
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
-- Table structure for table `sch_course_user`
--

DROP TABLE IF EXISTS `sch_course_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sch_course_user` (
  `user_id` bigint DEFAULT NULL,
  `course_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_course_user`
--

LOCK TABLES `sch_course_user` WRITE;
/*!40000 ALTER TABLE `sch_course_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sch_course_user` ENABLE KEYS */;
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
-- Table structure for table `sch_course_type`
--

DROP TABLE IF EXISTS `sch_course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sch_course_type` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_course_type`
--

LOCK TABLES `sch_course_type` WRITE;
/*!40000 ALTER TABLE `sch_course_type` DISABLE KEYS */;
INSERT INTO `sch_course_type` VALUES (1649422355833643010,'历史','2023-04-21 22:38:29','2023-04-21 22:38:29','admin','admin'),(1649422662642786305,'技术','2023-04-21 22:39:42','2023-04-21 22:39:42','admin','admin'),(1649422740736532481,'数学','2023-04-21 22:40:01','2023-04-21 22:40:01','admin','admin');
/*!40000 ALTER TABLE `sch_course_type` ENABLE KEYS */;
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
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-04-21 21:11:38','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-04-21 21:11:38','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-04-21 21:11:38','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-04-21 21:11:38','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-04-21 21:11:38','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-04-21 21:11:38','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-04-21 21:11:38','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-04-21 21:11:38','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-04-21 21:11:38','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-04-21 21:11:39','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-04-21 21:11:39','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-04-21 21:11:39','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-04-21 21:11:39','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-04-21 21:11:39','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-04-21 21:11:39','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-04-21 21:11:39','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-04-21 21:11:39','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-04-21 21:11:39','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-04-21 21:11:39','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-04-21 21:11:39','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-04-21 21:11:39','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-04-21 21:11:39','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-04-21 21:11:39','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-04-21 21:11:39','',NULL,'停用状态'),(30,1,'填空','1','sch_question_type','','primary','N','0','admin','2023-04-21 23:08:19','',NULL,''),(31,2,'单选题','2','sch_question_type','','primary','N','0','admin','2023-04-21 23:08:19','',NULL,''),(32,3,'多选题','3','sch_question_type','','primary','N','0','admin','2023-04-21 23:08:19','',NULL,''),(33,4,'判断题','4','sch_question_type','','primary','N','0','admin','2023-04-21 23:08:19','',NULL,'');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-04-21 21:14:25'),(101,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-04-21 21:16:53'),(102,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-04-21 21:16:57'),(103,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2023-04-21 21:20:09'),(104,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-04-21 21:21:24'),(105,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','密码输入错误1次','2023-04-21 22:09:26'),(106,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2023-04-21 22:09:26'),(107,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2023-04-21 22:09:38'),(108,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','密码输入错误2次','2023-04-21 22:09:38'),(109,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-04-21 22:09:42'),(110,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-04-21 22:34:28'),(111,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-04-21 22:34:33'),(112,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-04-21 22:34:33'),(113,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-04-21 22:34:38'),(114,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-04-21 22:34:43'),(115,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-04-21 22:34:48'),(116,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误2次','2023-04-21 22:34:51'),(117,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-04-21 22:34:51'),(118,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-04-21 22:34:57'),(119,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','密码输入错误1次','2023-04-22 07:50:44'),(120,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2023-04-22 07:50:44'),(121,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-04-22 07:50:52'),(122,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','密码输入错误2次','2023-04-22 07:51:27'),(123,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2023-04-22 07:51:27'),(124,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2023-04-22 07:51:34'),(125,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','密码输入错误3次','2023-04-22 07:51:34'),(126,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','验证码错误','2023-04-22 07:51:45'),(127,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2023-04-22 07:51:47'),(128,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','1','密码输入错误4次','2023-04-22 07:51:47'),(129,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-04-22 07:51:54'),(130,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-04-22 08:17:00'),(131,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-04-22 08:24:09'),(132,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-04-22 08:24:09'),(133,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-04-22 08:24:15'),(134,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-04-22 08:46:34'),(135,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2023-04-22 21:22:37');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1649417220646580257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-04-21 21:11:36','',NULL,'系统管理目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-04-21 21:11:36','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-04-21 21:11:36','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-04-21 21:11:36','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-04-21 21:11:36','',NULL,'部门管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-04-21 21:11:36','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-04-21 21:11:36','',NULL,'参数设置菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-04-21 21:11:36','',NULL,'日志管理菜单'),(109,'在线用户',1,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-04-21 21:11:36','admin','2023-04-21 23:17:49','在线用户菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-04-21 21:11:36','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-04-21 21:11:36','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-04-21 21:11:36','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-04-21 21:11:36','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-04-21 21:11:36','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-04-21 21:11:36','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-04-21 21:11:36','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-04-21 21:11:36','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-04-21 21:11:36','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-04-21 21:11:36','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-04-21 21:11:36','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-04-21 21:11:36','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-04-21 21:11:36','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-04-21 21:11:36','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-04-21 21:11:36','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-04-21 21:11:36','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-04-21 21:11:36','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-04-21 21:11:36','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-04-21 21:11:37','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-04-21 21:11:37','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-04-21 21:11:37','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-04-21 21:11:37','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-04-21 21:11:37','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-04-21 21:11:37','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-04-21 21:11:37','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-04-21 21:11:37','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-04-21 21:11:37','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-04-21 21:11:37','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-04-21 21:11:37','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-04-21 21:11:37','',NULL,''),(1649417219845468160,'课程',1649417220646580225,2,'course','study/course/index',NULL,1,0,'C','0','0','','build','admin','2023-04-21 22:27:09','admin','2023-04-21 22:36:46','课程菜单'),(1649417220290064384,'类别',1649417220646580225,1,'type','study/type/index',NULL,1,0,'C','0','0','','dashboard','admin','2023-04-21 22:27:36','admin','2023-04-21 22:36:30','类别菜单'),(1649417220583665664,'考试成绩',1649417220646580225,4,'score','study/score/index',NULL,1,0,'C','0','0','','rate','admin','2023-04-21 22:27:29','admin','2023-04-21 22:37:04','考试成绩菜单'),(1649417220646580224,'题目',1649417220646580225,4,'question','study/question/index',NULL,1,0,'C','0','0','','log','admin','2023-04-21 22:27:22','admin','2023-04-21 22:36:54','题目菜单'),(1649417220646580225,'学习',0,3,'study',NULL,NULL,1,0,'M','0','0',NULL,'dict','admin','2023-04-21 22:28:46','',NULL,''),(1649417220646580226,'课程查询',1649417219845468160,1,'#','',NULL,1,0,'F','0','0','pm:course:query','#','admin','2023-04-21 22:32:26','',NULL,''),(1649417220646580227,'课程新增',1649417219845468160,2,'#','',NULL,1,0,'F','0','0','pm:course:add','#','admin','2023-04-21 22:32:26','',NULL,''),(1649417220646580228,'课程修改',1649417219845468160,3,'#','',NULL,1,0,'F','0','0','pm:course:edit','#','admin','2023-04-21 22:32:26','',NULL,''),(1649417220646580229,'课程删除',1649417219845468160,4,'#','',NULL,1,0,'F','0','0','pm:course:remove','#','admin','2023-04-21 22:32:26','',NULL,''),(1649417220646580230,'课程导出',1649417219845468160,5,'#','',NULL,1,0,'F','0','0','pm:course:export','#','admin','2023-04-21 22:32:26','',NULL,''),(1649417220646580236,'题目查询',1649417220646580224,1,'#','',NULL,1,0,'F','0','0','pm:question:query','#','admin','2023-04-21 22:32:49','',NULL,''),(1649417220646580237,'题目新增',1649417220646580224,2,'#','',NULL,1,0,'F','0','0','pm:question:add','#','admin','2023-04-21 22:32:49','',NULL,''),(1649417220646580238,'题目修改',1649417220646580224,3,'#','',NULL,1,0,'F','0','0','pm:question:edit','#','admin','2023-04-21 22:32:49','',NULL,''),(1649417220646580239,'题目删除',1649417220646580224,4,'#','',NULL,1,0,'F','0','0','pm:question:remove','#','admin','2023-04-21 22:32:49','',NULL,''),(1649417220646580240,'题目导出',1649417220646580224,5,'#','',NULL,1,0,'F','0','0','pm:question:export','#','admin','2023-04-21 22:32:49','',NULL,''),(1649417220646580241,'考试成绩查询',1649417220583665664,1,'#','',NULL,1,0,'F','0','0','pm:score:query','#','admin','2023-04-21 22:32:58','',NULL,''),(1649417220646580242,'考试成绩新增',1649417220583665664,2,'#','',NULL,1,0,'F','0','0','pm:score:add','#','admin','2023-04-21 22:32:58','',NULL,''),(1649417220646580243,'考试成绩修改',1649417220583665664,3,'#','',NULL,1,0,'F','0','0','pm:score:edit','#','admin','2023-04-21 22:32:58','',NULL,''),(1649417220646580244,'考试成绩删除',1649417220583665664,4,'#','',NULL,1,0,'F','0','0','pm:score:remove','#','admin','2023-04-21 22:32:58','',NULL,''),(1649417220646580245,'考试成绩导出',1649417220583665664,5,'#','',NULL,1,0,'F','0','0','pm:score:export','#','admin','2023-04-21 22:32:58','',NULL,''),(1649417220646580246,'类别导出',1649417220583665664,5,'#','',NULL,1,0,'F','0','0','pm:type:export','#','admin','2023-04-21 22:33:06','',NULL,''),(1649417220646580247,'类别查询',1649417220290064384,1,'#','',NULL,1,0,'F','0','0','pm:type:query','#','admin','2023-04-21 22:33:11','',NULL,''),(1649417220646580248,'类别新增',1649417220290064384,2,'#','',NULL,1,0,'F','0','0','pm:type:add','#','admin','2023-04-21 22:33:11','',NULL,''),(1649417220646580249,'类别修改',1649417220290064384,3,'#','',NULL,1,0,'F','0','0','pm:type:edit','#','admin','2023-04-21 22:33:11','',NULL,''),(1649417220646580250,'类别删除',1649417220290064384,4,'#','',NULL,1,0,'F','0','0','pm:type:remove','#','admin','2023-04-21 22:33:11','',NULL,''),(1649417220646580251,'类别导出',1649417220290064384,5,'#','',NULL,1,0,'F','0','0','pm:type:export','#','admin','2023-04-21 22:33:11','',NULL,'');
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
-- Table structure for table `sch_course`
--

DROP TABLE IF EXISTS `sch_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sch_course` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `course_type_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_course`
--

LOCK TABLES `sch_course` WRITE;
/*!40000 ALTER TABLE `sch_course` DISABLE KEYS */;
INSERT INTO `sch_course` VALUES (1649424827151114241,'一年级数学','<p>这是美好的一节课</p>',NULL,NULL,NULL,'2023-04-21 22:48:18','2023-04-21 22:48:18','admin','admin',NULL);
/*!40000 ALTER TABLE `sch_course` ENABLE KEYS */;
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
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-04-21 21:11:39','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-04-21 21:11:39','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-04-21 21:11:39','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2023-04-21 21:11:39','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2023-04-21 21:11:39','admin','2023-04-21 21:19:41','是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-04-21 21:11:39','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sch_exam_score`
--

DROP TABLE IF EXISTS `sch_exam_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sch_exam_score` (
  `student_id` int DEFAULT NULL COMMENT '学生ID',
  `exam_id` int DEFAULT NULL COMMENT '考试ID',
  `score` double(10,0) DEFAULT NULL COMMENT '成绩',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='考试成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_exam_score`
--

LOCK TABLES `sch_exam_score` WRITE;
/*!40000 ALTER TABLE `sch_exam_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `sch_exam_score` ENABLE KEYS */;
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
-- Table structure for table `sch_evaluation`
--

DROP TABLE IF EXISTS `sch_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sch_evaluation` (
  `id` bigint NOT NULL COMMENT '评价ID',
  `content` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `score` int DEFAULT NULL COMMENT '评价分数',
  `time` date DEFAULT NULL COMMENT '评价时间',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_evaluation`
--

LOCK TABLES `sch_evaluation` WRITE;
/*!40000 ALTER TABLE `sch_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sch_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sch_question`
--

DROP TABLE IF EXISTS `sch_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sch_question` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '题目内容',
  `question_type` varchar(255) DEFAULT NULL COMMENT '题型',
  `options` varchar(255) DEFAULT NULL COMMENT '题目选项',
  `answer` varchar(255) DEFAULT NULL COMMENT '题目答案',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_question`
--

LOCK TABLES `sch_question` WRITE;
/*!40000 ALTER TABLE `sch_question` DISABLE KEYS */;
INSERT INTO `sch_question` VALUES (1649432501183959041,'新中国成立时间？','1','新中国成立时间？','1949','2023-04-21 23:18:48','2023-04-21 23:19:53','admin','admin');
/*!40000 ALTER TABLE `sch_question` ENABLE KEYS */;
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
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-04-21 21:11:36','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'参数管理',2,'com.code.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.code.system.domain.SysConfig\'','2023-04-21 21:17:15',19),(101,'参数管理',2,'com.code.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'remark\' in \'class com.code.system.domain.SysConfig\'','2023-04-21 21:17:25',4),(102,'参数管理',2,'com.code.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:39\",\"params\":{},\"updateBy\":\"admin\"}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 21:19:41',32),(103,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/3','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 22:04:55',2),(104,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/115','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 22:04:57',8),(105,'角色管理',2,'com.code.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-04-21 21:11:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"修改角色\'普通角色\'失败，请联系管理员\",\"code\":500}',0,NULL,'2023-04-21 22:05:04',23),(106,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/117','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:05:29',13),(107,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/116','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:05:41',14),(108,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/115','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:06:58',15),(109,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作失败\",\"code\":500}',0,NULL,'2023-04-21 22:07:04',12),(110,'个人信息',2,'com.code.web.controller.system.SysProfileController.updatePwd()','PUT',1,'admin',NULL,'/system/user/profile/updatePwd','127.0.0.1','内网IP','{}','{\"msg\":\"修改密码异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-21 22:10:07',187),(111,'菜单管理',1,'com.code.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学习\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"study\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:28:46',16),(112,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"pm:course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:28:56',15),(113,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220290064384,\"path\":\"score\",\"perms\":\"pm:score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:01',14),(114,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/type/index\",\"createTime\":\"2023-04-21 22:27:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220290064384,\"menuName\":\"类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"type\",\"perms\":\"pm:type:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:11',11),(115,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"pm:score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:17',12),(116,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"pm/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"pm:question:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:22',16),(117,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"study:course:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:37',7),(118,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:42',14),(119,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/type/index\",\"createTime\":\"2023-04-21 22:27:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220290064384,\"menuName\":\"类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"type\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:48',0),(120,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:54',16),(121,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"pm:question:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:29:59',1),(122,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:30:02',18),(123,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580252','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:29',17),(124,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580235','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:37',27),(125,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580234','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:39',16),(126,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580233','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:41',21),(127,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580232','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:42',19),(128,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580231','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:44',17),(129,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580256','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:46',14),(130,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580254','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:49',5),(131,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580253','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:51',16),(132,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1649417220646580255','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:35:54',17),(133,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:07',33),(134,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"rate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:15',10),(135,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:23',12),(136,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/type/index\",\"createTime\":\"2023-04-21 22:27:36\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220290064384,\"menuName\":\"类别\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"type\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:30',17),(137,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/course/index\",\"createTime\":\"2023-04-21 22:27:09\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417219845468160,\"menuName\":\"课程\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"course\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:46',0),(138,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/question/index\",\"createTime\":\"2023-04-21 22:27:22\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220646580224,\"menuName\":\"题目\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"question\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:36:54',17),(139,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"study/score/index\",\"createTime\":\"2023-04-21 22:27:29\",\"icon\":\"rate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1649417220583665664,\"menuName\":\"考试成绩\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1649417220646580225,\"path\":\"score\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 22:37:04',18),(140,'岗位管理',2,'com.code.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:36\",\"flag\":false,\"params\":{},\"postCode\":\"admin\",\"postId\":1,\"postName\":\"管理员\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:09:39',15),(141,'岗位管理',2,'com.code.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:36\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":2,\"postName\":\"教师\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:09:55',25),(142,'岗位管理',2,'com.code.web.controller.system.SysPostController.edit()','PUT',1,'admin',NULL,'/system/post','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-04-21 21:11:36\",\"flag\":false,\"params\":{},\"postCode\":\"student\",\"postId\":3,\"postName\":\"学生\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:10',16),(143,'岗位管理',3,'com.code.web.controller.system.SysPostController.remove()','DELETE',1,'admin',NULL,'/system/post/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:12',18),(144,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1007','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 23:10:31',0),(145,'角色管理',2,'com.code.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-04-21 21:11:36\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:38',14),(146,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/104','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 23:10:49',2),(147,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1020','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:53',16),(148,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1021','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:56',3),(149,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1022','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:10:58',1),(150,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1023','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:01',18),(151,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1024','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:03',24),(152,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:05',15),(153,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/107','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2023-04-21 23:11:12',0),(154,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1035','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:15',18),(155,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1036','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:17',12),(156,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1037','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:20',17),(157,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1038','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:22',16),(158,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:24',17),(159,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/111','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:44',17),(160,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/112','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:11:47',12),(161,'菜单管理',2,'com.code.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2023-04-21 21:11:36\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"在线用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:49',34),(162,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1049','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:55',3),(163,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1050','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:57',16),(164,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1051','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:17:59',15),(165,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1052','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:01',15),(166,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1053','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:04',17),(167,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/1054','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:06',1),(168,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/110','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:08',12),(169,'菜单管理',3,'com.code.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-04-21 23:18:10',16),(170,'用户头像',2,'com.code.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-22 08:48:01',6),(171,'用户头像',2,'com.code.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-22 08:48:57',12),(172,'用户头像',2,'com.code.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"上传图片异常，请联系管理员\",\"code\":500}',0,NULL,'2023-04-22 08:50:04',14824),(173,'用户头像',2,'com.code.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/04/22/blob_20230422085948A001.png\",\"code\":200}',0,NULL,'2023-04-22 08:59:49',6395);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','/profile/avatar/2023/04/22/blob_20230422085948A001.png','$2a$10$jmmo4m9y7J7MQi1Uuj.bNOFeiE9DvPeNeUbioJ7HNIrJrq6a7mKFu','0','0','127.0.0.1','2023-04-22 21:22:38','admin','2023-04-21 21:11:36','','2023-04-22 21:22:37','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-04-21 21:11:36','admin','2023-04-21 21:11:36','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
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
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-04-21 21:11:38','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-04-21 21:11:38','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-04-21 21:11:38','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-04-21 21:11:38','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-04-21 21:11:38','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-04-21 21:11:38','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-04-21 21:11:38','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-04-21 21:11:38','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-04-21 21:11:38','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-04-21 21:11:38','',NULL,'登录状态列表'),(11,'题目类型','sch_question_type','0','admin','2023-04-21 23:08:40','',NULL,'');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-22 21:24:03

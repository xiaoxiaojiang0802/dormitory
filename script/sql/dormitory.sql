/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 13/03/2024 20:43:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dor_bed
-- ----------------------------
DROP TABLE IF EXISTS `dor_bed`;
CREATE TABLE `dor_bed`  (
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bed_id` bigint NOT NULL,
  `dormitory_id` bigint NULL DEFAULT NULL COMMENT '宿舍',
  `bed_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位编号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位状态',
  `record_id` bigint NULL DEFAULT NULL COMMENT '记录id',
  PRIMARY KEY (`bed_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '床位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dor_bed
-- ----------------------------
INSERT INTO `dor_bed` VALUES ('2023-05-20 07:12:45', '2023-05-21 18:58:57', 'admin', 'admin', 1659698634156548097, 1659698634143965184, '1', '2', 1660238743666872320);
INSERT INTO `dor_bed` VALUES ('2023-05-20 07:12:45', '2023-05-21 18:59:40', 'admin', 'admin', 1659698634156548098, 1659698634143965184, '2', '2', 1660238923891920896);
INSERT INTO `dor_bed` VALUES ('2023-05-20 07:12:45', '2023-05-21 19:38:40', 'admin', 'admin', 1659698634211074050, 1659698634143965184, '3', '2', 1660248737284042752);
INSERT INTO `dor_bed` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 1659698634211074051, 1659698634143965184, '4', '1', NULL);

-- ----------------------------
-- Table structure for dor_building
-- ----------------------------
DROP TABLE IF EXISTS `dor_building`;
CREATE TABLE `dor_building`  (
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `building_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `number_floors` int NULL DEFAULT NULL COMMENT '楼层数量',
  `total_rooms` int NULL DEFAULT NULL COMMENT '房间数量',
  `available_rooms` int NULL DEFAULT NULL COMMENT '可用房间数量',
  `occupied_rooms` int NULL DEFAULT NULL COMMENT '已使用房间数量',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`building_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '楼栋信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dor_building
-- ----------------------------
INSERT INTO `dor_building` VALUES ('2023-05-19 20:14:20', '2023-05-19 20:14:20', 'admin', 'admin', 1659532939376627714, '一栋', 6, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dor_dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dor_dormitory`;
CREATE TABLE `dor_dormitory`  (
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `dormitory_id` bigint NOT NULL,
  `dormitory_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宿舍编号',
  `dormitory_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宿舍类型',
  `building_id` bigint NULL DEFAULT NULL COMMENT '楼栋',
  `in_floor` int NULL DEFAULT NULL COMMENT '楼层',
  `at_full` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否满员bool',
  PRIMARY KEY (`dormitory_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '宿舍' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dor_dormitory
-- ----------------------------
INSERT INTO `dor_dormitory` VALUES ('2023-05-19 20:50:02', '2024-03-12 21:40:03', 'admin', 'admin', 1659541925064830978, '1101', '6', 1659532939376627714, NULL, 'N');
INSERT INTO `dor_dormitory` VALUES ('2023-05-19 21:49:12', '2023-05-19 21:49:12', 'admin', 'admin', 1659556812994301954, '1102', '4', 1659532939376627714, NULL, 'N');
INSERT INTO `dor_dormitory` VALUES ('2023-05-19 21:51:49', '2023-05-19 21:51:49', 'admin', 'admin', 1659557469847502849, '1103', '4', 1659532939376627714, NULL, 'N');
INSERT INTO `dor_dormitory` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 1659698634143965184, '1104', '4', 1659532939376627714, NULL, 'N');

-- ----------------------------
-- Table structure for dor_entrance_record
-- ----------------------------
DROP TABLE IF EXISTS `dor_entrance_record`;
CREATE TABLE `dor_entrance_record`  (
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `user_id` bigint NULL DEFAULT NULL COMMENT '学生',
  `bed_id` bigint NULL DEFAULT NULL COMMENT '床位',
  `entrance_time` datetime(0) NULL DEFAULT NULL COMMENT '入住时间',
  `leave_time` datetime(0) NULL DEFAULT NULL COMMENT '离开时间',
  `record_id` bigint NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '居住记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dor_entrance_record
-- ----------------------------
INSERT INTO `dor_entrance_record` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 101, 1659698634156548097, NULL, NULL, 1660234499761041408, '1');
INSERT INTO `dor_entrance_record` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 1660067352858574848, 1659698634156548098, NULL, NULL, 1660235471333810176, '1');
INSERT INTO `dor_entrance_record` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 1660067352858574848, 1659698634156548097, NULL, NULL, 1660238743666872320, 'Y');
INSERT INTO `dor_entrance_record` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 110, 1659698634156548098, NULL, NULL, 1660238923891920896, 'Y');
INSERT INTO `dor_entrance_record` VALUES ('2023-05-20 07:12:45', '2023-05-20 07:12:45', 'admin', 'admin', 101, 1659698634211074050, '2023-05-21 19:38:40', NULL, 1660248737284042752, '1');

-- ----------------------------
-- Table structure for dor_repair_order
-- ----------------------------
DROP TABLE IF EXISTS `dor_repair_order`;
CREATE TABLE `dor_repair_order`  (
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `repair_id` bigint NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修位置',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修情况',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维修状态',
  `repair_user` bigint NULL DEFAULT NULL COMMENT '维修人',
  `repair_date_time` datetime(0) NULL DEFAULT NULL COMMENT '维修时间',
  `confirm_user` bigint NULL DEFAULT NULL COMMENT '确认人',
  `confirm_date_time` datetime(0) NULL DEFAULT NULL COMMENT '确认时间',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保修人',
  PRIMARY KEY (`repair_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '维修工单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dor_repair_order
-- ----------------------------
INSERT INTO `dor_repair_order` VALUES ('2023-05-21 19:46:01', '2023-05-21 19:46:01', 'admin', 'admin', 1660250587022413825, '一栋一单元101', '空调坏了', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dor_visitor
-- ----------------------------
DROP TABLE IF EXISTS `dor_visitor`;
CREATE TABLE `dor_visitor`  (
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `visitor_id` bigint NOT NULL,
  `visit_date` datetime(0) NULL DEFAULT NULL,
  `leave_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`visitor_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dor_visitor
-- ----------------------------
INSERT INTO `dor_visitor` VALUES ('2023-05-21 20:10:55', '2023-10-11 21:26:40', 'admin', 'admin', '木子', '15812365487', 1660256855023869954, '2023-05-21 11:00:00', NULL);

-- ----------------------------
-- Table structure for sys_cache
-- ----------------------------
DROP TABLE IF EXISTS `sys_cache`;
CREATE TABLE `sys_cache`  (
  `cache_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cache_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cache_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_cache
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL,
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `config_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-04-21 21:11:39', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-04-21 21:11:39', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-04-21 21:11:39', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-04-21 21:11:39', 'admin', '2023-05-21 07:02:14', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-04-21 21:11:39', 'admin', '2023-04-21 21:19:41', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-04-21 21:11:39', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `ancestors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_num` int NULL DEFAULT NULL,
  `leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '高校', 1, '宿舍管理', '15812345678', 'sushe@qq.com', '0', '0', 'admin', '2023-04-21 21:11:36', 'admin', '2023-05-20 20:20:32');
INSERT INTO `sys_dept` VALUES (101, 1, '0,1', '后勤部', 1, 'admin', '15812345678', 'sushe@qq.com', '0', '0', 'admin', '2023-04-21 21:11:36', 'admin', '2023-05-20 20:21:39');
INSERT INTO `sys_dept` VALUES (103, 101, '0,1,101', '宿管部', 1, 'admin', '15812345678', 'sushe@qq.com', '0', '0', 'admin', '2023-04-21 21:11:36', 'admin', '2023-05-20 20:21:42');
INSERT INTO `sys_dept` VALUES (105, 101, '0,1,101', '维修部', 3, 'admin', '15812345678', 'sushe@qq.com', '0', '0', 'admin', '2023-04-21 21:11:36', 'admin', '2023-05-20 20:21:44');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL,
  `dict_sort` int NULL DEFAULT NULL,
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `css_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `list_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '四人间', '4', 'dor_dormitory_type', '', 'primary', 'N', '0', 'admin', '2023-04-21 23:08:19', 'admin', '2023-05-19 21:43:23', '');
INSERT INTO `sys_dict_data` VALUES (31, 2, '六人间', '6', 'dor_dormitory_type', '', 'primary', 'N', '0', 'admin', '2023-04-21 23:08:19', 'admin', '2023-05-19 21:43:27', '');
INSERT INTO `sys_dict_data` VALUES (32, 3, '八人间', '8', 'dor_dormitory_type', '', 'primary', 'N', '0', 'admin', '2023-04-21 23:08:19', 'admin', '2023-05-19 21:43:30', '');
INSERT INTO `sys_dict_data` VALUES (33, 1, '空闲', '1', 'dor_bed_status', '', 'info', 'N', '0', 'admin', '2023-04-21 23:08:19', '', NULL, '');
INSERT INTO `sys_dict_data` VALUES (34, 2, '有人', '2', 'dor_bed_status', '', 'primary', 'N', '0', 'admin', '2023-04-21 23:08:19', '', NULL, '');
INSERT INTO `sys_dict_data` VALUES (35, 3, '维修', '3', 'dor_bed_status', '', 'danger', 'N', '0', 'admin', '2023-04-21 23:08:19', '', NULL, '');
INSERT INTO `sys_dict_data` VALUES (36, 1, '待维修', '1', 'dor_repair_state', '', 'warning', 'N', '0', 'admin', '2023-05-21 19:52:26', '', NULL, '');
INSERT INTO `sys_dict_data` VALUES (37, 2, '已维修', '2', 'dor_repair_state', '', 'primary', 'N', '0', 'admin', '2023-05-21 19:52:26', '', NULL, '');
INSERT INTO `sys_dict_data` VALUES (38, 3, '关闭', '3', 'dor_repair_state', '', 'info', 'N', '0', 'admin', '2023-05-21 19:52:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dict_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-04-21 21:11:38', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '宿舍类型', 'dor_dormitory_type', '0', 'admin', '2023-04-21 23:08:40', '', NULL, '');
INSERT INTO `sys_dict_type` VALUES (12, '床位状态', 'dor_bed_status', '0', 'admin', '2023-05-20 07:16:54', '', NULL, '');
INSERT INTO `sys_dict_type` VALUES (13, '维修状态', 'dor_repair_state', '0', 'admin', '2023-05-21 19:52:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-04-21 21:11:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-04-21 21:11:39', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-04-21 21:11:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ipaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `login_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1767545656782462978, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '密码输入错误1次', '2024-03-12');
INSERT INTO `sys_logininfor` VALUES (1767545676101427202, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-12');
INSERT INTO `sys_logininfor` VALUES (1767546542246174722, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-03-12');
INSERT INTO `sys_logininfor` VALUES (1767553231292833793, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-03-12');
INSERT INTO `sys_logininfor` VALUES (1767553338813816833, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-03-12');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `order_num` int NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_frame` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_cache` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `menu_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `perms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '1', '0', 'M', '0', '0', '', 'system', 'admin', '2023-04-21 21:11:36', '', NULL, '系统管理目录', NULL);
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-04-21 21:11:36', '', NULL, '用户管理菜单', NULL);
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-04-21 21:11:36', '', NULL, '角色管理菜单', NULL);
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-04-21 21:11:36', '', NULL, '菜单管理菜单', NULL);
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-04-21 21:11:36', '', NULL, '部门管理菜单', NULL);
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-04-21 21:11:36', '', NULL, '字典管理菜单', NULL);
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-04-21 21:11:36', '', NULL, '参数设置菜单', NULL);
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2023-04-21 21:11:36', '', NULL, '日志管理菜单', NULL);
INSERT INTO `sys_menu` VALUES (109, '在线用户', 1, 1, 'online', 'monitor/online/index', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-04-21 21:11:36', 'admin', '2023-04-21 23:17:49', '在线用户菜单', NULL);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-04-21 21:11:36', '', NULL, '操作日志菜单', NULL);
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-04-21 21:11:36', '', NULL, '登录日志菜单', NULL);
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-04-21 21:11:36', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-04-21 21:11:37', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470188742328320, '床位', 0, 1, 'bed', 'dormitory/bed/index', '1', '0', 'C', '0', '0', 'dormitory:bed:list', 'edit', 'admin', '2023-05-16 22:12:01', 'admin', '2023-05-21 20:20:51', '床位菜单', NULL);
INSERT INTO `sys_menu` VALUES (1658470188742328321, '床位查询', 1658470188742328320, 1, '#', '', '1', '0', 'F', '0', '0', 'dormitory:bed:query', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470188742328322, '床位新增', 1658470188742328320, 2, '#', '', '1', '0', 'F', '0', '0', 'dormitory:bed:add', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470188742328323, '床位修改', 1658470188742328320, 3, '#', '', '1', '0', 'F', '0', '0', 'dormitory:bed:edit', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470188742328324, '床位删除', 1658470188742328320, 4, '#', '', '1', '0', 'F', '0', '0', 'dormitory:bed:remove', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470188742328325, '床位导出', 1658470188742328320, 5, '#', '', '1', '0', 'F', '0', '0', 'dormitory:bed:export', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470189266616320, '宿舍', 0, 1, 'dormitory', 'dormitory/dormitory/index', '1', '0', 'C', '0', '0', 'dormitory:dormitory:list', 'example', 'admin', '2023-05-16 22:12:02', 'admin', '2023-05-21 20:20:30', '宿舍菜单', NULL);
INSERT INTO `sys_menu` VALUES (1658470189266616321, '宿舍查询', 1658470189266616320, 1, '#', '', '1', '0', 'F', '0', '0', 'dormitory:dormitory:query', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470189266616322, '宿舍新增', 1658470189266616320, 2, '#', '', '1', '0', 'F', '0', '0', 'dormitory:dormitory:add', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470189266616323, '宿舍修改', 1658470189266616320, 3, '#', '', '1', '0', 'F', '0', '0', 'dormitory:dormitory:edit', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470189266616324, '宿舍删除', 1658470189266616320, 4, '#', '', '1', '0', 'F', '0', '0', 'dormitory:dormitory:remove', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470189266616325, '宿舍导出', 1658470189266616320, 5, '#', '', '1', '0', 'F', '0', '0', 'dormitory:dormitory:export', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470189690241024, '居住记录', 0, 1, 'record', 'dormitory/record/index', '1', '0', 'C', '0', '0', 'dormitory:record:list', 'log', 'admin', '2023-05-16 22:12:02', 'admin', '2023-05-21 20:21:17', '居住记录菜单', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922688, '维修工单', 0, 1, 'order', 'dormitory/order/index', '1', '0', 'C', '0', '0', 'dormitory:order:list', 'tool', 'admin', '2023-05-16 22:12:02', 'admin', '2023-05-21 20:21:42', '维修工单菜单', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922689, '维修工单查询', 1658470190071922688, 1, '#', '', '1', '0', 'F', '0', '0', 'dormitory:order:query', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922690, '维修工单新增', 1658470190071922688, 2, '#', '', '1', '0', 'F', '0', '0', 'dormitory:order:add', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922691, '维修工单修改', 1658470190071922688, 3, '#', '', '1', '0', 'F', '0', '0', 'dormitory:order:edit', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922692, '维修工单删除', 1658470190071922688, 4, '#', '', '1', '0', 'F', '0', '0', 'dormitory:order:remove', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922693, '维修工单导出', 1658470190071922688, 5, '#', '', '1', '0', 'F', '0', '0', 'dormitory:order:export', '#', 'admin', '2023-05-16 22:12:02', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922694, '居住记录查询', 1658470189690241024, 1, '#', '', '1', '0', 'F', '0', '0', 'dormitory:record:query', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922695, '居住记录新增', 1658470189690241024, 2, '#', '', '1', '0', 'F', '0', '0', 'dormitory:record:add', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922696, '居住记录修改', 1658470189690241024, 3, '#', '', '1', '0', 'F', '0', '0', 'dormitory:record:edit', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922697, '居住记录删除', 1658470189690241024, 4, '#', '', '1', '0', 'F', '0', '0', 'dormitory:record:remove', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190071922698, '居住记录导出', 1658470189690241024, 5, '#', '', '1', '0', 'F', '0', '0', 'dormitory:record:export', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410048, '访客', 0, 1, 'visitor', 'dormitory/visitor/index', '1', '0', 'C', '0', '0', 'dormitory:visitor:list', 'user', 'admin', '2023-05-16 22:12:03', 'admin', '2023-05-21 20:22:06', '访客菜单', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410049, '访客查询', 1658470190449410048, 1, '#', '', '1', '0', 'F', '0', '0', 'dormitory:visitor:query', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410050, '访客新增', 1658470190449410048, 2, '#', '', '1', '0', 'F', '0', '0', 'dormitory:visitor:add', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410051, '访客修改', 1658470190449410048, 3, '#', '', '1', '0', 'F', '0', '0', 'dormitory:visitor:edit', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410052, '访客删除', 1658470190449410048, 4, '#', '', '1', '0', 'F', '0', '0', 'dormitory:visitor:remove', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410053, '访客导出', 1658470190449410048, 5, '#', '', '1', '0', 'F', '0', '0', 'dormitory:visitor:export', '#', 'admin', '2023-05-16 22:12:03', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410054, '楼栋', 0, 1, 'building', 'dormitory/building/index', '1', '0', 'C', '0', '0', NULL, 'component', 'admin', '2023-05-19 19:50:27', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1658470190449410055, '学生', 0, 5, 'student', 'system/user/student', '1', '0', 'C', '0', '0', NULL, 'people', 'admin', '2023-05-20 20:25:39', '', NULL, '', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL,
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `notice_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `notice_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2023-04-21 21:11:39', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `business_type` int NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operator_type` int NULL DEFAULT NULL,
  `oper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oper_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `json_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `oper_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_https` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL,
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_sort` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_sort` int NULL DEFAULT NULL,
  `data_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_check_strictly` bit(1) NULL DEFAULT NULL,
  `dept_check_strictly` bit(1) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NULL DEFAULT NULL,
  `dept_id` bigint NULL DEFAULT NULL,
  UNIQUE INDEX `actable_uni_role_id`(`role_id`) USING BTREE,
  UNIQUE INDEX `actable_uni_dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NULL DEFAULT NULL,
  `menu_id` bigint NULL DEFAULT NULL,
  UNIQUE INDEX `actable_uni_role_id`(`role_id`) USING BTREE,
  UNIQUE INDEX `actable_uni_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL,
  `dept_id` bigint NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phonenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_date` date NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', 'admin', '1296581679@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', 'sys_user', '127.0.0.1', '2024-03-12', '管理员', '2023-01-08 11:19:43', '2024-03-12 22:08:25', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `token_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ipaddr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_time` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NULL DEFAULT NULL,
  `post_id` bigint NULL DEFAULT NULL,
  INDEX `actable_idx_user_id`(`user_id`) USING BTREE,
  INDEX `actable_idx_post_id`(`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (2, 3);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (1, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NULL DEFAULT NULL,
  `role_id` bigint NULL DEFAULT NULL,
  UNIQUE INDEX `actable_uni_user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `actable_uni_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

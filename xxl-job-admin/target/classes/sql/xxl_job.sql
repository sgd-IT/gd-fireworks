/*
 Navicat Premium Data Transfer

 Source Server         : 测试环境
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : 192.168.250.160:3306
 Source Schema         : xxl_job_fireworks

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 21/10/2025 10:41:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (3, 'xxl-job-executor-fireworks', '烟花爆竹定时器', 0, NULL, '2025-10-21 10:40:54');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (5, 3, '推送企业基本信息', '2025-06-25 18:49:49', '2025-06-26 09:38:32', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendBaseInfo', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-25 18:49:49', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (6, 3, '推送企业人员信息', '2025-06-25 18:50:30', '2025-06-25 18:50:30', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'pushEnterprisesData', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-25 18:50:30', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (7, 3, '推送仓库信息', '2025-06-26 09:39:03', '2025-06-26 09:39:03', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoStore', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:39:03', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (8, 3, '推送库房信息', '2025-06-26 09:39:17', '2025-06-26 09:39:17', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoStoreroom', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:39:17', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (9, 3, '推送进入企业人员、车辆数据', '2025-06-26 09:39:35', '2025-06-26 09:39:35', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoPersonStatistics', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:39:35', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (10, 3, '推送设备信息', '2025-06-26 09:41:03', '2025-06-26 09:41:03', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoDevice', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:41:03', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (11, 3, '推送服务器信息', '2025-06-26 09:41:14', '2025-06-26 09:41:14', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoComputer', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:41:14', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (12, 3, '推送人员出入信息', '2025-06-26 09:41:26', '2025-06-26 09:41:26', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoPersonInout', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:41:26', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (13, 3, '推送温度信息', '2025-06-26 09:41:37', '2025-06-26 09:41:37', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoTemperature', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:41:37', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (14, 3, '推送湿度信息', '2025-06-26 09:42:39', '2025-06-26 09:42:39', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoHumidity', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:42:39', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (15, 3, '推送报警信息', '2025-06-26 09:42:49', '2025-06-26 09:42:49', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoAlarm', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:42:49', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (16, 3, '推送部级预警信息处置上报', '2025-06-26 09:43:03', '2025-06-26 09:43:03', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'sendInfoAlarmPush', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:43:03', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (17, 3, '拉去部级预警信息下发', '2025-06-26 09:47:49', '2025-06-26 09:47:49', '张三', '', 'CRON', '0/2 * * * * ?', 'DO_NOTHING', 'FIRST', 'pullWarningInfo', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-06-26 09:47:49', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (18, 3, '本地人闸人员新增/删除定时任务', '2025-09-18 15:32:19', '2025-10-21 10:27:28', '测试', '', 'CRON', '0 */2 * * * ?', 'DO_NOTHING', 'FIRST', 'personSyncHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-09-18 15:32:19', '', 1, 1761014400000, 1761014520000);
INSERT INTO `xxl_job_info` VALUES (23, 3, '本地报警信息执行消警任务', '2025-10-16 10:20:08', '2025-10-21 10:23:45', '测试', '', 'CRON', '0 * * * * ?', 'DO_NOTHING', 'FIRST', 'DisposalAlarm', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-10-16 10:20:08', '', 1, 1761014460000, 1761014520000);
INSERT INTO `xxl_job_info` VALUES (24, 3, '本地自研人员定位数据是否在线任务判断', '2025-10-16 10:20:45', '2025-10-21 10:23:40', '测试', '', 'CRON', '0 * * * * ?', 'DO_NOTHING', 'FIRST', 'PersondataParsingJob', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-10-16 10:20:45', '', 1, 1761014460000, 1761014520000);
INSERT INTO `xxl_job_info` VALUES (25, 3, '本地同步企业基础数据', '2025-10-21 10:15:37', '2025-10-21 10:23:37', '测试', '', 'CRON', '*/20 * * * * ?', 'DO_NOTHING', 'FIRST', 'downloadData', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-10-21 10:15:37', '', 1, 1761014460000, 1761014480000);
INSERT INTO `xxl_job_info` VALUES (26, 3, '本地上报企业报警数据', '2025-10-21 10:24:53', '2025-10-21 10:26:55', '测试', '', 'CRON', '*/20 * * * * ?', 'DO_NOTHING', 'FIRST', 'syncAlarmData', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-10-21 10:24:53', '', 1, 1761014460000, 1761014480000);
INSERT INTO `xxl_job_info` VALUES (27, 3, '本地实时检查是否断网', '2025-10-21 10:25:53', '2025-10-21 10:26:52', '测试', '', 'CRON', '0 * * * * ?', 'DO_NOTHING', 'FIRST', 'checkNetwork', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-10-21 10:25:53', '', 1, 1761014460000, 1761014520000);
INSERT INTO `xxl_job_info` VALUES (28, 3, '本地同步企业断网数据', '2025-10-21 10:26:39', '2025-10-21 10:26:49', '测试', '', 'CRON', '0/30 * * * * ?', 'DO_NOTHING', 'FIRST', 'noNetworkUpload', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2025-10-21 10:26:39', '', 1, 1761014460000, 1761014490000);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调度-日志',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time`) USING BTREE,
  INDEX `I_handle_code`(`handle_code`) USING BTREE,
  INDEX `I_jobid_jobgroup`(`job_id`, `job_group`) USING BTREE,
  INDEX `I_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 863 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_g_k_v`(`registry_group`, `registry_key`, `registry_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO `xxl_job_registry` VALUES (60, 'EXECUTOR', 'xxl-job-executor-fireworks', 'http://192.168.250.160:9999/', '2025-10-21 10:40:39');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;

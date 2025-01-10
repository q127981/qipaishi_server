/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 139.155.146.244:8306
 Source Schema         : test1

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 30/12/2024 14:16:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for infra_api_access_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_api_access_log`;
CREATE TABLE `infra_api_access_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '用户类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求地址',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求参数',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `begin_time` datetime NOT NULL COMMENT '开始请求时间',
  `end_time` datetime NOT NULL COMMENT '结束请求时间',
  `duration` int NOT NULL COMMENT '执行时长',
  `result_code` int NOT NULL DEFAULT 0 COMMENT '结果码',
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果提示',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'API 访问日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_api_access_log
-- ----------------------------

-- ----------------------------
-- Table structure for infra_api_error_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_api_error_log`;
CREATE TABLE `infra_api_error_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链路追踪编号\n     *\n     * 一般来说，通过链路追踪编号，可以将访问日志，错误日志，链路追踪日志，logger 打印日志等，结合在一起，从而进行排错。',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '用户类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名\n     *\n     * 目前读取 spring.application.name',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求地址',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求参数',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `exception_time` datetime NOT NULL COMMENT '异常发生时间',
  `exception_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '异常名\n     *\n     * {@link Throwable#getClass()} 的类全名',
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的消息\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getMessage(Throwable)}',
  `exception_root_cause_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常导致的根消息\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getRootCauseMessage(Throwable)}',
  `exception_stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常的栈轨迹\n     *\n     * {@link cn.iocoder.common.framework.util.ExceptionUtil#getServiceException(Exception)}',
  `exception_class_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类全名\n     *\n     * {@link StackTraceElement#getClassName()}',
  `exception_file_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的类文件\n     *\n     * {@link StackTraceElement#getFileName()}',
  `exception_method_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '异常发生的方法名\n     *\n     * {@link StackTraceElement#getMethodName()}',
  `exception_line_number` int NOT NULL COMMENT '异常发生的方法所在行\n     *\n     * {@link StackTraceElement#getLineNumber()}',
  `process_status` tinyint NOT NULL COMMENT '处理状态',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `process_user_id` int NULL DEFAULT 0 COMMENT '处理用户编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统异常日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_api_error_log
-- ----------------------------

-- ----------------------------
-- Table structure for infra_codegen_column
-- ----------------------------
DROP TABLE IF EXISTS `infra_codegen_column`;
CREATE TABLE `infra_codegen_column`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NOT NULL COMMENT '表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名',
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段描述',
  `nullable` bit(1) NOT NULL COMMENT '是否允许为空',
  `primary_key` bit(1) NOT NULL COMMENT '是否主键',
  `auto_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否自增',
  `ordinal_position` int NOT NULL COMMENT '排序',
  `java_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性类型',
  `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 属性名',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `example` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据示例',
  `create_operation` bit(1) NOT NULL COMMENT '是否为 Create 创建操作的字段',
  `update_operation` bit(1) NOT NULL COMMENT '是否为 Update 更新操作的字段',
  `list_operation` bit(1) NOT NULL COMMENT '是否为 List 查询操作的字段',
  `list_operation_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=' COMMENT 'List 查询操作的条件类型',
  `list_operation_result` bit(1) NOT NULL COMMENT '是否为 List 查询操作的返回字段',
  `html_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '显示类型',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成表字段定义' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_codegen_column
-- ----------------------------

-- ----------------------------
-- Table structure for infra_codegen_table
-- ----------------------------
DROP TABLE IF EXISTS `infra_codegen_table`;
CREATE TABLE `infra_codegen_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `data_source_config_id` bigint NOT NULL COMMENT '数据源配置的编号',
  `scene` tinyint NOT NULL DEFAULT 1 COMMENT '生成场景',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '业务名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类名称',
  `class_comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类描述',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `template_type` tinyint NOT NULL DEFAULT 1 COMMENT '模板类型',
  `front_type` tinyint NOT NULL COMMENT '前端类型',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '父菜单编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成表定义' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_codegen_table
-- ----------------------------

-- ----------------------------
-- Table structure for infra_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_config`;
CREATE TABLE `infra_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数分组',
  `type` tinyint NOT NULL COMMENT '参数类型',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数键值',
  `visible` bit(1) NOT NULL COMMENT '是否可见',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_config
-- ----------------------------
INSERT INTO `infra_config` VALUES (2, 'biz', 1, '用户管理-账号初始密码', 'sys.user.init-password', '123456', b'0', '初始化密码 123456', 'admin', '2021-01-05 17:03:48', '1', '2022-03-20 02:25:51', b'0');
INSERT INTO `infra_config` VALUES (7, 'url', 2, 'MySQL 监控的地址', 'url.druid', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:33:38', b'0');
INSERT INTO `infra_config` VALUES (8, 'url', 2, 'SkyWalking 监控的地址', 'url.skywalking', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:57:03', b'0');
INSERT INTO `infra_config` VALUES (9, 'url', 2, 'Spring Boot Admin 监控的地址', 'url.spring-boot-admin', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:52:07', b'0');
INSERT INTO `infra_config` VALUES (10, 'url', 2, 'Swagger 接口文档的地址', 'url.swagger', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:59:00', b'0');
INSERT INTO `infra_config` VALUES (19, 'biz', 2, '用户管理-默认头像', 'sys.user.init-avatar', 'https://images.scyanzu.com/icon_avatar.png', b'1', NULL, '1', '2024-03-06 15:40:57', '1', '2024-03-06 15:40:57', b'0');
INSERT INTO `infra_config` VALUES (20, 'app', 2, '小程序版本', 'app.version', '24.12.13', b'1', NULL, '1', '2024-10-21 11:15:56', '1', '2024-10-21 11:15:56', b'0');

-- ----------------------------
-- Table structure for infra_data_source_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_data_source_config`;
CREATE TABLE `infra_data_source_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名称',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据源连接',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据源配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_data_source_config
-- ----------------------------

-- ----------------------------
-- Table structure for infra_file
-- ----------------------------
DROP TABLE IF EXISTS `infra_file`;
CREATE TABLE `infra_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `config_id` bigint NULL DEFAULT NULL COMMENT '配置编号',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件 URL',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` int NOT NULL COMMENT '文件大小',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_file
-- ----------------------------

-- ----------------------------
-- Table structure for infra_file_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_file_config`;
CREATE TABLE `infra_file_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置名',
  `storage` tinyint NOT NULL COMMENT '存储器',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `master` bit(1) NOT NULL COMMENT '是否为主配置',
  `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储配置',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_file_config
-- ----------------------------
INSERT INTO `infra_file_config` VALUES (4, '数据库', 1, '我是数据库', b'0', '{\"@class\":\"com.yanzu.framework.file.core.client.db.DBFileClientConfig\",\"domain\":\"http://127.0.0.1:48080\"}', '1', '2022-03-15 23:56:24', '1', '2024-01-16 15:13:45', b'0');
INSERT INTO `infra_file_config` VALUES (5, '本地磁盘', 10, '在服务器新建目录，域名改成自己的', b'1', '{\"@class\":\"com.yanzu.framework.file.core.client.local.LocalFileClientConfig\",\"basePath\":\"/data/images\",\"domain\":\"https://images.xxxxx.com\"}', '1', '2022-03-15 23:57:00', '1', '2024-01-16 15:14:28', b'0');

-- ----------------------------
-- Table structure for infra_file_content
-- ----------------------------
DROP TABLE IF EXISTS `infra_file_content`;
CREATE TABLE `infra_file_content`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `config_id` bigint NOT NULL COMMENT '配置编号',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `content` mediumblob NOT NULL COMMENT '文件内容',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_file_content
-- ----------------------------

-- ----------------------------
-- Table structure for infra_job
-- ----------------------------
DROP TABLE IF EXISTS `infra_job`;
CREATE TABLE `infra_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `status` tinyint NOT NULL COMMENT '任务状态',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理器的参数',
  `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 表达式',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_interval` int NOT NULL DEFAULT 0 COMMENT '重试间隔',
  `monitor_timeout` int NOT NULL DEFAULT 0 COMMENT '监控超时时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_job
-- ----------------------------
INSERT INTO `infra_job` VALUES (20, '小程序订单处理job', 1, 'appOrderCheckJob', NULL, '0 * * * * ?', 0, 0, 60, '1', '2023-08-02 17:34:55', '1', '2023-10-09 17:59:06', b'0');
INSERT INTO `infra_job` VALUES (22, '美团授权刷新Job', 1, 'appMeituanRefreshTokenJob', NULL, '0 1 0 * * ?', 0, 0, 60, '1', '2023-11-24 17:26:58', '1', '2023-11-24 17:26:58', b'0');
INSERT INTO `infra_job` VALUES (23, '每日定时检查任务', 1, 'appCouponExpireCheckJob', NULL, '0 1 0 * * ?', 0, 0, 60, '1', '2023-11-30 17:31:38', '1', '2024-10-21 17:54:20', b'0');
INSERT INTO `infra_job` VALUES (24, '微信支付分账', 1, 'appWxPaySplitJob', NULL, '0 30 0 * * ?', 0, 0, 300, '1', '2023-12-08 14:34:55', '1', '2023-12-08 14:34:55', b'0');

-- ----------------------------
-- Table structure for infra_job_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_job_log`;
CREATE TABLE `infra_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `job_id` bigint NOT NULL COMMENT '任务编号',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理器的名字',
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '处理器的参数',
  `execute_index` tinyint NOT NULL DEFAULT 1 COMMENT '第几次执行',
  `begin_time` datetime NOT NULL COMMENT '开始执行时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束执行时间',
  `duration` int NULL DEFAULT NULL COMMENT '执行时长',
  `status` tinyint NOT NULL COMMENT '任务状态',
  `result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果数据',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_job_log
-- ----------------------------
INSERT INTO `infra_job_log` VALUES (1, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:32:00', '2024-01-16 15:32:00', 65, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:32:00', NULL, '2024-01-16 15:32:00', b'0');
INSERT INTO `infra_job_log` VALUES (2, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:33:00', '2024-01-16 15:33:00', 51, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:33:00', NULL, '2024-01-16 15:33:00', b'0');
INSERT INTO `infra_job_log` VALUES (3, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:34:00', '2024-01-16 15:34:00', 52, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:34:00', NULL, '2024-01-16 15:34:00', b'0');
INSERT INTO `infra_job_log` VALUES (4, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:35:00', '2024-01-16 15:35:00', 50, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:35:00', NULL, '2024-01-16 15:35:00', b'0');
INSERT INTO `infra_job_log` VALUES (5, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:36:00', '2024-01-16 15:36:00', 57, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:36:00', NULL, '2024-01-16 15:36:00', b'0');
INSERT INTO `infra_job_log` VALUES (6, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:37:00', '2024-01-16 15:37:00', 45, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:37:00', NULL, '2024-01-16 15:37:00', b'0');
INSERT INTO `infra_job_log` VALUES (7, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:38:00', '2024-01-16 15:38:00', 57, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:38:00', NULL, '2024-01-16 15:38:00', b'0');
INSERT INTO `infra_job_log` VALUES (8, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:39:00', '2024-01-16 15:39:00', 50, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:39:00', NULL, '2024-01-16 15:39:00', b'0');
INSERT INTO `infra_job_log` VALUES (9, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:40:00', '2024-01-16 15:40:00', 47, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:40:00', NULL, '2024-01-16 15:40:00', b'0');
INSERT INTO `infra_job_log` VALUES (10, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:41:00', '2024-01-16 15:41:00', 55, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:41:00', NULL, '2024-01-16 15:41:00', b'0');
INSERT INTO `infra_job_log` VALUES (11, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:42:00', '2024-01-16 15:42:00', 59, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:42:00', NULL, '2024-01-16 15:42:00', b'0');
INSERT INTO `infra_job_log` VALUES (12, 20, 'appOrderCheckJob', NULL, 1, '2024-01-16 15:43:00', '2024-01-16 15:43:00', 60, 1, '{\"1\":\"success\",\"150\":\"success\"}', NULL, '2024-01-16 15:43:00', NULL, '2024-01-16 15:43:00', b'0');

-- ----------------------------
-- Table structure for infra_test_demo
-- ----------------------------
DROP TABLE IF EXISTS `infra_test_demo`;
CREATE TABLE `infra_test_demo`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名字',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `type` tinyint NOT NULL COMMENT '类型',
  `category` tinyint NOT NULL COMMENT '分类',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of infra_test_demo
-- ----------------------------

-- ----------------------------
-- Table structure for member_banner_info
-- ----------------------------
DROP TABLE IF EXISTS `member_banner_info`;
CREATE TABLE `member_banner_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `jump_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址/页面路径',
  `sort_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '广告类型 1首页 2个人中心',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_banner_info
-- ----------------------------
INSERT INTO `member_banner_info` VALUES (1, 'https://images.scyanzu.com/banner12125412312.png', '广告1', NULL, 0, 1, '127', '2023-07-28 22:31:40', '127', '2024-04-09 09:17:09', b'0', 150);

-- ----------------------------
-- Table structure for member_clear_bill
-- ----------------------------
DROP TABLE IF EXISTS `member_clear_bill`;
CREATE TABLE `member_clear_bill`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `money` decimal(10, 2) UNSIGNED NOT NULL COMMENT '结算金额',
  `store_id` bigint UNSIGNED NOT NULL COMMENT '门店id',
  `order_num` int NOT NULL COMMENT '订单数量',
  `order_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单ids',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '清洁账单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_clear_bill
-- ----------------------------

-- ----------------------------
-- Table structure for member_clear_info
-- ----------------------------
DROP TABLE IF EXISTS `member_clear_info`;
CREATE TABLE `member_clear_info`  (
  `clear_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '清洁记录id',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单id',
  `store_id` bigint UNSIGNED NOT NULL COMMENT '门店id',
  `room_id` bigint NOT NULL COMMENT '房间id',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '清洁图片',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `complaint_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驳回的原因',
  `complaint_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '驳回的照片',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `settlement_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0待接单 1已接单 2已开始 3已完成 4已取消 5被投诉 6已失效 7已结算',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`clear_id`) USING BTREE,
  INDEX `user_id`(`user_id`, `status`, `deleted`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `user_id_2`(`user_id`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保洁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_clear_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_coupon_info
-- ----------------------------
DROP TABLE IF EXISTS `member_coupon_info`;
CREATE TABLE `member_coupon_info`  (
  `coupon_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '持有用户id',
  `create_user_id` bigint NOT NULL COMMENT '创建用户id',
  `exprice_time` date NOT NULL COMMENT '过期时间',
  `coupon_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠券名称',
  `min_use_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '使用门槛',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '优惠券面额',
  `store_id` bigint NOT NULL COMMENT '适用门店id',
  `room_type` tinyint(1) NULL DEFAULT NULL COMMENT '适用房间类型',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '优惠券类型 1抵扣券 2满减券',
  `status` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '状态 0待使用 1已使用 2已过期',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`coupon_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `user_id_2`(`user_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_coupon_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_device_info
-- ----------------------------
DROP TABLE IF EXISTS `member_device_info`;
CREATE TABLE `member_device_info`  (
  `device_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设备id',
  `device_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备sn',
  `device_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备数据',
  `share` bit(1) NULL DEFAULT b'0' COMMENT '共享设备',
  `type` tinyint(1) NOT NULL COMMENT '设备类型',
  `room_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '房间id',
  `store_id` bigint NULL DEFAULT NULL COMMENT '门店id',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 1在线 0离线',
  `rssi` int NULL DEFAULT 0 COMMENT '信号强度',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_device_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_device_use_info
-- ----------------------------
DROP TABLE IF EXISTS `member_device_use_info`;
CREATE TABLE `member_device_use_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `store_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '门店ID',
  `room_id` bigint NULL DEFAULT NULL COMMENT '房间ID',
  `cmd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '命令',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备使用记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_device_use_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_discount_rules
-- ----------------------------
DROP TABLE IF EXISTS `member_discount_rules`;
CREATE TABLE `member_discount_rules`  (
  `discount_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pay_money` decimal(10, 2) UNSIGNED NOT NULL COMMENT '支付金额',
  `gift_money` decimal(10, 2) NOT NULL COMMENT '赠送金额',
  `exprice_time` date NOT NULL COMMENT '过期时间',
  `store_id` bigint NOT NULL COMMENT '适用门店id',
  `status` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '状态 0禁用 1启用 2过期',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '充值优惠规则信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_discount_rules
-- ----------------------------
INSERT INTO `member_discount_rules` VALUES (22, 0.01, 60.00, '2026-10-01', 5, 1, '247', '2023-09-17 09:19:54', '247', '2024-01-16 15:37:40', b'0', 150);

-- ----------------------------
-- Table structure for member_face_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `member_face_blacklist`;
CREATE TABLE `member_face_blacklist`  (
  `blacklist_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `store_id` bigint NULL DEFAULT NULL COMMENT '门店id',
  `photo_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '照片 url',
  `photo_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '照片 base64编码',
  `admit_guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '人员guid',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`blacklist_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '人脸黑名单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_face_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for member_face_record
-- ----------------------------
DROP TABLE IF EXISTS `member_face_record`;
CREATE TABLE `member_face_record`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `face_id` bigint NULL DEFAULT NULL COMMENT '识别记录ID',
  `device_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `admit_guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人员guid',
  `photo_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '照片url',
  `photo_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '照片 base64编码',
  `show_time` timestamp NULL DEFAULT NULL COMMENT '识别记录时间戳',
  `type` int UNSIGNED NOT NULL COMMENT '人员比对结果,1:比对成功 2:比对失败',
  `store_id` bigint NOT NULL COMMENT '门店Id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_sn`(`device_sn`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '人脸识别记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_face_record
-- ----------------------------

-- ----------------------------
-- Table structure for member_franchise_info
-- ----------------------------
DROP TABLE IF EXISTS `member_franchise_info`;
CREATE TABLE `member_franchise_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市名称',
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人电话',
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0已提交 1已跟进 2已成交',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加盟信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_franchise_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_game_info
-- ----------------------------
DROP TABLE IF EXISTS `member_game_info`;
CREATE TABLE `member_game_info`  (
  `game_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '对局ID',
  `store_id` bigint UNSIGNED NOT NULL COMMENT '门店ID',
  `room_id` bigint UNSIGNED NOT NULL COMMENT '房间ID',
  `rule_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则描述',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_num` int UNSIGNED NOT NULL COMMENT '玩家数量',
  `play_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '玩家ids',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0组局中 1 已组局 2已支付 3已失效 4房主解散',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`game_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组局信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_game_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_group_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `member_group_pay_info`;
CREATE TABLE `member_group_pay_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '团购券名称',
  `group_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '团购券编码',
  `group_shop_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '团购商品id',
  `ticket_info` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '团购券信息',
  `group_pay_price` decimal(10, 2) NOT NULL COMMENT '商品售卖价格',
  `group_pay_type` int NOT NULL COMMENT '团购券类型',
  `store_id` bigint NOT NULL COMMENT '门店ID',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '团购支付信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_group_pay_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_holiday
-- ----------------------------
DROP TABLE IF EXISTS `member_holiday`;
CREATE TABLE `member_holiday`  (
  `date_time` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_holiday
-- ----------------------------

-- ----------------------------
-- Table structure for member_order_info
-- ----------------------------
DROP TABLE IF EXISTS `member_order_info`;
CREATE TABLE `member_order_info`  (
  `order_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `order_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单key',
  `store_id` bigint UNSIGNED NOT NULL COMMENT '门店id',
  `room_id` bigint NOT NULL COMMENT '房间id',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `start_time` datetime NOT NULL COMMENT '订单开始时间',
  `end_time` datetime NOT NULL COMMENT '订单结束时间',
  `order_hour` int NULL DEFAULT NULL COMMENT '订单时长 单位/分钟',
  `night_long` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '是否通宵',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '订单价格',
  `deposit` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '押金',
  `work_discount` int UNSIGNED NULL DEFAULT 10 COMMENT '工作日折扣',
  `pay_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '实际支付价格',
  `renew_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '续费价格',
  `group_pay_price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '团购支付价格',
  `refund_price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '退款价格',
  `pay_type` tinyint(1) NULL DEFAULT NULL COMMENT '支付方式 1微信 2余额 3团购',
  `group_pay_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '团购券码',
  `group_pay_type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '团购类型 1美团 2抖音',
  `coupon_id` bigint NULL DEFAULT NULL COMMENT '优惠券Id',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0未开始 1进行中 2已完成 3已取消',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `room_id`(`room_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`, `deleted`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_order_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `member_pay_order`;
CREATE TABLE `member_pay_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `order_no` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单编号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `store_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '门店id',
  `pay_type` int NULL DEFAULT NULL COMMENT '支付类型',
  `order_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单内容',
  `price` int NOT NULL COMMENT '价格，单位：分',
  `pay_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已支付：[0:未支付 1:已经支付过]',
  `pay_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支付订单编号',
  `split_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已分账',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '订单支付时间',
  `pay_refund_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '退款订单编号',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `refund_time` datetime NULL DEFAULT NULL COMMENT '退款时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '支付订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_pay_order
-- ----------------------------

-- ----------------------------
-- Table structure for member_pkg_info
-- ----------------------------
DROP TABLE IF EXISTS `member_pkg_info`;
CREATE TABLE `member_pkg_info`  (
  `pkg_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `pkg_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '套餐名称',
  `hours` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '抵扣时长',
  `store_id` bigint NOT NULL COMMENT '门店id',
  `room_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间类型',
  `mt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '美团团购商品id',
  `dy_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音团购商品id',
  `ks_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快手团购商品id',
  `enable_room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按包厢设置',
  `enable_time` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可用时间',
  `enable_week` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可用星期',
  `enable_holiday` bit(1) NOT NULL DEFAULT b'0' COMMENT '节假日可用',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '销售价格',
  `expire_day` int NOT NULL DEFAULT -1 COMMENT '购买后过期时间',
  `max_num` int NOT NULL DEFAULT -1 COMMENT '最大购买数量',
  `enable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  `sort_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `balance_buy` bit(1) NULL DEFAULT b'0' COMMENT '支持余额购买',
  `create_user_id` bigint NOT NULL COMMENT '创建用户id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`pkg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '套餐信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_pkg_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_pkg_user_info
-- ----------------------------
DROP TABLE IF EXISTS `member_pkg_user_info`;
CREATE TABLE `member_pkg_user_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '持有用户id',
  `pkg_id` bigint UNSIGNED NOT NULL COMMENT '套餐id',
  `store_id` bigint NOT NULL COMMENT '门店id',
  `expire_date` date NULL DEFAULT NULL COMMENT '过期时间',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `status` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0待使用 1已使用 2过期',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户套餐信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_pkg_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_product_order
-- ----------------------------
DROP TABLE IF EXISTS `member_product_order`;
CREATE TABLE `member_product_order`  (
  `order_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `store_id` bigint NOT NULL COMMENT '门店id',
  `room_id` bigint NOT NULL COMMENT '房间id',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `product_info` json NULL COMMENT '商品信息',
  `total_num` int UNSIGNED NULL DEFAULT 0 COMMENT '订单商品总数',
  `total_price` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单总价',
  `pay_price` int UNSIGNED NULL DEFAULT 0 COMMENT '实际支付金额',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态(0:待支付,1:已支付,2:已完成,3:已经取消)',
  `pay_type` tinyint(1) NULL DEFAULT 1 COMMENT '支付方式 1微信 2余额 3团购',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '逻辑删除',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  INDEX `room_id`(`room_id`) USING BTREE,
  INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品购买订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_product_order
-- ----------------------------

-- ----------------------------
-- Table structure for member_room_info
-- ----------------------------
DROP TABLE IF EXISTS `member_room_info`;
CREATE TABLE `member_room_info`  (
  `room_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `room_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房间名称',
  `room_call_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间简称',
  `room_class` int NULL DEFAULT 0 COMMENT '房间类别0棋牌 1台球',
  `qr_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '房间小程序码',
  `renew_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '续费码',
  `store_id` bigint NOT NULL COMMENT '门店id',
  `type` tinyint UNSIGNED NOT NULL COMMENT '房间类型',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '单价',
  `deposit` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '押金',
  `work_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '工作日价格',
  `tongxiao_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '通宵场价格',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间标签，逗号分割',
  `image_urls` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '房间照片',
  `sort_id` int NULL DEFAULT 0 COMMENT '排序位置',
  `yunlaba_sound` int UNSIGNED NULL DEFAULT NULL COMMENT '云喇叭音量，1-5',
  `ban_time_start` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '禁用开始时间',
  `ban_time_end` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '禁用结束时间',
  `total_order_num` int UNSIGNED NULL DEFAULT 0 COMMENT '总完成订单数',
  `total_money` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '总收益',
  `min_hour` int UNSIGNED NULL DEFAULT 4 COMMENT '最小下单时间',
  `lead_hour` int UNSIGNED NULL DEFAULT 6 COMMENT '最大提前开始时间',
  `lead_day` int UNSIGNED NULL DEFAULT 5 COMMENT '最大提前下单天数',
  `jump_clear` bit(1) NULL DEFAULT b'0' COMMENT '跳过清洁',
  `reserve` bit(1) NULL DEFAULT b'1' COMMENT '是否可预定',
  `status` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '状态 0禁用 1空闲 2待清洁 3使用中 4已预约 ',
  `svg_x` int NULL DEFAULT NULL COMMENT 'svg x轴坐标',
  `svg_y` int NULL DEFAULT NULL COMMENT 'svg y轴坐标',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房间信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_room_info
-- ----------------------------
INSERT INTO `member_room_info` VALUES (20, '测试房间', NULL, 0, NULL, NULL, 12, 1, 0.01, 0.00, 0.01, 0.01, '60玉石麻将,WIFI,落地窗,舒适座椅,空调', 'https://images.scyanzu.com/f1134b356a1716f8236db36e962c6be2af8602ac62821ffd1b19d09d3a745648.jpg', 0, 2, '', '', 0, 0.00, 4, 3, 5, b'0', b'1', 1, NULL, NULL, '250', '2024-04-05 14:18:54', '250', '2024-04-09 09:15:26', b'0', 150);
INSERT INTO `member_room_info` VALUES (21, '测试房间', NULL, 0, NULL, NULL, 13, 1, 0.01, 0.00, 0.01, 0.01, '沙发,落地窗,内窗,独立卫生间,舒适座椅', 'https://images.scyanzu.com/2b506458a945ddb67fb90c678828f23b0838da5062350954bece94024225429b.jpg', 0, 1, '', '', 0, 0.00, 4, 6, 5, b'0', b'1', 1, NULL, NULL, '250', '2024-04-05 14:23:04', '250', '2024-04-09 09:15:26', b'0', 150);
INSERT INTO `member_room_info` VALUES (22, '测试房间', NULL, 0, NULL, NULL, 14, 1, 0.01, 0.00, 0.01, 0.01, '60玉石麻将,新风,有窗', 'https://images.scyanzu.com/f1134b356a1716f8236db36e962c6be2af8602ac62821ffd1b19d09d3a745648.jpg', 1, 1, '', '', 0, 0.00, 1, 1, 5, b'0', b'1', 1, NULL, NULL, '250', '2024-04-05 14:23:49', '250', '2024-04-09 09:15:26', b'0', 150);
INSERT INTO `member_room_info` VALUES (23, '测试房间', NULL, 0, NULL, NULL, 15, 1, 0.01, 0.00, 0.01, 0.01, '落地窗,独立卫生间,新风,每日特价,空调,有窗', 'https://images.scyanzu.com/f1134b356a1716f8236db36e962c6be2af8602ac62821ffd1b19d09d3a745648.jpg', 1, 1, '', '', 0, 0.00, 1, 4, 5, b'0', b'1', 1, NULL, NULL, '250', '2024-04-05 14:24:20', '250', '2024-04-09 09:15:26', b'0', 150);
INSERT INTO `member_room_info` VALUES (24, '测试房间', NULL, 0, NULL, NULL, 16, 1, 0.01, 0.00, 0.01, 0.01, '60玉石麻将,沙发,内窗,新风,每日特价', 'https://images.scyanzu.com/f1134b356a1716f8236db36e962c6be2af8602ac62821ffd1b19d09d3a745648.jpg', 0, 1, '', '', 0, 0.00, 2, 2, 5, b'0', b'1', 1, NULL, NULL, '250', '2024-04-05 23:13:45', '250', '2024-04-09 09:15:26', b'0', 150);

-- ----------------------------
-- Table structure for member_store_info
-- ----------------------------
DROP TABLE IF EXISTS `member_store_info`;
CREATE TABLE `member_store_info`  (
  `store_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '门店ID',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门店名称',
  `city_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '城市名称',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '门店富文本详情',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图url',
  `store_env_img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '门店环境照片url',
  `banner_img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '门店banner照片url',
  `notice` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '门店公告',
  `lat` double(12, 8) NULL DEFAULT NULL COMMENT '纬度',
  `lon` double(12, 8) NULL DEFAULT NULL COMMENT '经度',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `qr_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码照片',
  `simple_model` bit(1) NULL DEFAULT b'0' COMMENT '简洁模式',
  `btn_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '预约按钮照片',
  `tg_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '团购照片',
  `open_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '开门照片',
  `wifi_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'wifi照片',
  `kf_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '客服照片',
  `cz_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '充值照片',
  `qh_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '切换门店照片',
  `clear_open` bit(1) NULL DEFAULT b'1' COMMENT '清洁状态开放',
  `clear_time` int UNSIGNED NULL DEFAULT 5 COMMENT '订单清洁时间',
  `show_tx_price` bit(1) NULL DEFAULT b'1' COMMENT '显示通宵场价格',
  `tx_start_hour` int UNSIGNED NULL DEFAULT 23 COMMENT '通宵起始小时',
  `tx_hour` int UNSIGNED NULL DEFAULT 9 COMMENT '通宵时长',
  `delay_light` bit(1) NULL DEFAULT b'1' COMMENT '延时灯光',
  `work_price` bit(1) NULL DEFAULT b'1' COMMENT '启用工作日价格',
  `order_door_open` bit(1) NULL DEFAULT b'1' COMMENT '订单门禁常开',
  `clear_open_door` bit(1) NULL DEFAULT b'0' COMMENT '保洁任意开门',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '门店状态 0正常 1审核中',
  `wifi_info` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wifi信息',
  `wifi_pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wifi密码',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间标签，逗号分割',
  `kefu_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客服电话',
  `order_webhook` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信机器人webhook',
  `game_webhook` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线组局机器人webhook',
  `douyin_poi_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音门店poi_id',
  `room_num` int UNSIGNED NULL DEFAULT 0 COMMENT '房间数量',
  `total_money` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '总收入',
  `total_withdrawal` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '已提现',
  `expire_time` date NULL DEFAULT NULL COMMENT '过期时间',
  `svg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'svg代码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_store_info
-- ----------------------------
INSERT INTO `member_store_info` VALUES (12, '棋牌室模板A', '成都', NULL, 'https://images.scyanzu.com/7c0a2f81a629e1c1e8324890d0e8a31ba00075f5e59316671ab6e859446546ec.png', 'https://images.scyanzu.com/b4bccfc6701fcd58be44ae93c3b5664fe64ffd80c2ab511d473172445a9c8a3e.png', 'https://images.scyanzu.com/b4bccfc6701fcd58be44ae93c3b5664fe64ffd80c2ab511d473172445a9c8a3e.png', '15675555180', 30.75734900, 104.86583700, '成都市锦江区人民南路一段', NULL, b'1', 'https://images.scyanzu.com/16bc66daaa9c537ec0f5dd3ddaac4fde368e151c1dac496e867fd8742b83beb7.png', 'https://images.scyanzu.com/ba7fc61df503ef9d49d16a5fad8280d11553145306a8277c4f25e644f5e90200.png', 'https://images.scyanzu.com/cd1d29157414e8a3ea368f93ecd1dadeab006b7171b6b4388857915f3bfb48d1.png', 'https://images.scyanzu.com/36f20e97768e981ef01d89b9a9014a02ad24578116eae65584220d53c1439f35.png', 'https://images.scyanzu.com/fdef2ea3aaf4e8c8ba37670ea0c193def4a73e9cafb5d8a46f61ea299100c173.png', 'https://images.scyanzu.com/7c6a14ee3a85621119be53f8c8babfd5bba8c114c5f2f52f799ecfc2e880d19d.png', 'https://images.scyanzu.com/71aee9adc07b007f09d6ee8e82534a46c5c9dd69faefb5026619b9a3aec3e3fa.png', b'1', 10, b'1', 22, 9, b'1', b'1', b'1', b'0', 0, 'CMCC 密码8个8', NULL, NULL, '15675555180', NULL, NULL, NULL, 1, 0.00, 0.00, '2025-04-04', NULL, '250', '2024-04-04 22:27:39', '450', '2024-12-13 17:26:46', b'0', 150);
INSERT INTO `member_store_info` VALUES (13, '台球模板', '成都', NULL, 'https://images.scyanzu.com/a6c6657cd2ec8df8f9acb35baa5c215e4ed03c6accd10d18e95fefb1b51879df.png', 'https://images.scyanzu.com/4c5a2994b028f9d6704630981acb189e658b40654f42eec204482101abfc266c.png', 'https://images.scyanzu.com/713111631d5f2053c9d8936d8542633e5ff98126deffae1bf917bc545755d7b7.png', '15675555180', 30.65734900, 104.06583700, '四川省成都市人民南路一段86号', NULL, b'0', 'https://images.scyanzu.com/02abf4cab9d662c3f19458cab370a22183d1752f43c1e81e6fb6eed4d8a48ea0.png', 'https://images.scyanzu.com/fb0ec0c3dcfbe274f6b06e894ff847337d483fce7b2688a7721b760575aa2b06.png', 'https://images.scyanzu.com/81777341ea0dd1973a32d34f7ea0cd4feecd95aabe6ce094f9da4b050a88ba67.png', 'https://images.scyanzu.com/a6c21614aa4fa52095dd75e390da11c356ce72399c46f220122d9d147bdf51e7.png', 'https://images.scyanzu.com/0f4dfebc836612039666d95e0f881c5ffcd1b3b246c70397e593b68a7c012db5.png', 'https://images.scyanzu.com/95a6e5caa94f4ac83a7c385edfeb65cde566a1da04bdd7c2b08793caac873743.png', 'https://images.scyanzu.com/1e20252e002ad049012905c324196aed077d1a7731a719478476de2ca403a31d.png', b'1', 5, b'0', 23, 9, b'1', b'1', b'1', b'0', 0, 'CMCC 密码12345678', NULL, NULL, '15675555180', NULL, NULL, NULL, 1, 0.00, 0.00, '2025-04-04', NULL, '250', '2024-04-04 23:34:29', '250', '2024-12-13 17:26:46', b'0', 150);
INSERT INTO `member_store_info` VALUES (14, '棋牌室模板B', '成都', NULL, 'https://images.scyanzu.com/450fdd0699468a4b25aa1ad019e98fe76794426db36e8ad3c98525dd003ce64b.png', 'https://images.scyanzu.com/9a1af27b538245b6d343ef7ecf9e98d0c67c2bd43550bfac4ebbe37f5733bca2.jpg', 'https://images.scyanzu.com/eb3169623e645ed8452d7827333c4d7b0417921f398efa81070296f0be61f4aa.jpg', '15675555180', 30.25734900, 104.26583700, '四川省成都市人民南路一段86号', NULL, b'0', 'https://images.scyanzu.com/67cd493f2482da74db6683c178854824ff5f99389622aeb9e640a7a9c8747fa8.jpg', 'https://images.scyanzu.com/ba6838e0f1f80c2a952dc7f01f5abc5d8d80963dd8a0e6fd7aed8e6ae5692267.png', 'https://images.scyanzu.com/7c5d32bdde738958e6dd1af95385975b9aa3effc0c36f453f8464417e145a7f5.png', 'https://images.scyanzu.com/80de0a6d3ed37e6f97593cd772af1a994e0a8f68130e02d3eddff2eb1de6177d.png', 'https://images.scyanzu.com/1626885baa268b74c16f9afd052ed4d0773282a7433c2231b031c7a931ba68a1.png', 'https://images.scyanzu.com/be1e1ff666421d8ad6325981eee7a4067c5d5b7c7b9b49048c7aa4f6cc9d5739.png', 'https://images.scyanzu.com/7fea1aedefe188ca2454ad2e62b2bda3c18092c9fcacb49382186a358e70a80c.png', b'1', 15, b'1', 20, 9, b'1', b'1', b'1', b'0', 0, 'CMCC 密码15675555180', NULL, NULL, '15675555180', NULL, NULL, NULL, 1, 0.00, 0.00, '2025-04-05', NULL, '250', '2024-04-05 12:22:18', '250', '2024-12-13 17:26:46', b'0', 150);
INSERT INTO `member_store_info` VALUES (15, '棋牌室模板C', '成都', NULL, 'https://images.scyanzu.com/d61e47377a29d3021f9a7c186e14fa07f8d96b4eb5d2f17364f41eba6c3fbc96.png', 'https://images.scyanzu.com/d5a169144088ec497ae5f3c12c45432f33dc04b2548fc3e7ae4a5805866e1f37.png', 'https://images.scyanzu.com/97c87075683630d8a6a13a76ad5152c72df89f7c0b8e121617a229c48f25d0bc.png', '15675555180', 30.35734900, 104.36583700, '四川省成都市人民南路一段86号', NULL, b'0', 'https://images.scyanzu.com/91f9d85a21574ea9661fb84480ed9dba8d41a60cdf40451eec288f45607996a6.png', 'https://images.scyanzu.com/1afc3aa460b996df50e2800fde8d8e4c1a932b3d06d45da21ddae65c55c0b44f.png', 'https://images.scyanzu.com/82a3de92b4116de9ac71331606e14a5750c5c71292cbc31164ce17c937a3616e.png', 'https://images.scyanzu.com/945ec3e6e85ad5a7239f8b8504d53f4c4f7dddca2353bdba144326a0438cebf1.png', 'https://images.scyanzu.com/3a1fd5c0cc7392658002afed52aadb449ef930270db8dd101bf359770bab588f.png', 'https://images.scyanzu.com/dce9ca860cda303fb41107869cc9365389db0566bf5c815e20acae85eb9994ac.png', 'https://images.scyanzu.com/4468b877d8af1783760fc7be263e591960ea2ecffad30add1195b47603489073.png', b'1', 5, b'1', 23, 9, b'1', b'1', b'1', b'0', 0, '15675555180', NULL, NULL, '15675555180', NULL, NULL, NULL, 1, 0.00, 0.00, '2025-04-05', NULL, '250', '2024-04-05 14:11:46', '250', '2024-12-13 17:26:46', b'0', 150);
INSERT INTO `member_store_info` VALUES (16, '棋牌室模板D', '成都', NULL, 'https://images.scyanzu.com/fa17465ece4ef934aaff64df01711821c8544841d1c449d33e14921f9392ebe8.png', 'https://images.scyanzu.com/a514c2e40e22e96c207e76a28cb37ebdb3b844d51b6ac8e5a1f8b6451c042a27.jpg', 'https://images.scyanzu.com/5d3c047e8caa9a86dc848fc2bc7e9b562991b7452d8b343a093f409b1708469f.png,https://images.scyanzu.com/06bb1c61b6a0fe5c13a8a9c218bd313a842506fae8fed636fe66547778a8ce6a.png', '15675555180', 30.45734900, 104.46583700, '四川省成都市人民南路一段86号', NULL, b'0', 'https://images.scyanzu.com/9f018a90d34719d82b38fb5113ae19ed9bf6718863f5b659091c516211350388.png', 'https://images.scyanzu.com/32cfd11c9a12a68cbb460055878eb2c46fc6920f421d7e3cf060c4c081ad8c3b.png', 'https://images.scyanzu.com/751859ed2d5f7b6291319fe2f2b0b4837193527e3a9d42fc13eea9f249b78212.png', 'https://images.scyanzu.com/c96166cabf2693c9b54460bacd5ba0b5f9be6d028176153ace7f311368e351df.png', 'https://images.scyanzu.com/1b1351df736ac34f81b18bc9b6c079ddad833ad9c753ae28b830ab9da7b98040.png', 'https://images.scyanzu.com/9b1e8471b8f83bd630f5a70594459e2557afbdd463f411487ebc919720269cb6.png', 'https://images.scyanzu.com/c04b5767b78bfa68b816a3b42af7173b910238982f5651b2012ad15a35e569a9.png', b'1', 10, b'1', 22, 9, b'1', b'1', b'1', b'0', 0, 'CMCC 密码15675555180', NULL, NULL, '15675555180', NULL, NULL, NULL, 1, 0.00, 0.00, '2025-04-05', NULL, '250', '2024-04-05 23:12:08', '250', '2024-12-13 17:26:46', b'0', 150);

-- ----------------------------
-- Table structure for member_store_meituan_info
-- ----------------------------
DROP TABLE IF EXISTS `member_store_meituan_info`;
CREATE TABLE `member_store_meituan_info`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint NOT NULL COMMENT '门店ID',
  `open_shop_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_shop_uuid',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'access_token',
  `expires_in` timestamp NULL DEFAULT NULL COMMENT 'expires_in',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'refresh_token',
  `remain_refresh_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'remain_refresh_count',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id`(`store_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店美团平台信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_store_meituan_info
-- ----------------------------
INSERT INTO `member_store_meituan_info` VALUES (1, 5, '', '', '2023-10-08 12:22:50', NULL, '12', NULL, '2023-09-08 12:13:10', NULL, '2024-01-16 15:34:47', b'0', 0);

-- ----------------------------
-- Table structure for member_store_sound_info
-- ----------------------------
DROP TABLE IF EXISTS `member_store_sound_info`;
CREATE TABLE `member_store_sound_info`  (
  `sound_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint NOT NULL COMMENT '门店Id',
  `welcome_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '欢迎语',
  `end_text30` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束30分钟',
  `end_text5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结束5分钟',
  `night_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '深夜提示语',
  `customize_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义提示语',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`sound_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店播放语音信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_store_sound_info
-- ----------------------------

-- ----------------------------
-- Table structure for member_store_user
-- ----------------------------
DROP TABLE IF EXISTS `member_store_user`;
CREATE TABLE `member_store_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint UNSIGNED NOT NULL COMMENT '门店id',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `type` tinyint(1) NOT NULL COMMENT '类型 11用户 12超管 13管理员 14保洁 ',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 0启用 1禁用',
  `balance` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '账户余额',
  `gift_balance` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '赠送余额',
  `vip_blacklist` bit(1) NULL DEFAULT b'0' COMMENT '是否黑名单 0否 1是',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加拉黑时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `store_id`(`store_id`, `user_id`) USING BTREE,
  INDEX `store_id_2`(`store_id`, `status`, `create_time`, `deleted`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `status_2`(`status`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店用户关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_store_user
-- ----------------------------
INSERT INTO `member_store_user` VALUES (49, 12, 247, NULL, 12, 0, 999.00, 0.00, b'0', '2024-12-13 17:26:45', '450', '2024-04-04 22:27:39', '450', '2024-04-09 09:16:26', b'0', 150);
INSERT INTO `member_store_user` VALUES (50, 13, 247, NULL, 12, 0, 999.00, 0.00, b'0', '2024-12-13 17:26:45', '450', '2024-04-04 23:34:29', '450', '2024-04-09 09:16:26', b'0', 150);
INSERT INTO `member_store_user` VALUES (51, 14, 247, NULL, 12, 0, 999.00, 0.00, b'0', '2024-12-13 17:26:45', '450', '2024-04-05 12:22:18', '450', '2024-04-09 09:16:26', b'0', 150);
INSERT INTO `member_store_user` VALUES (52, 15, 247, NULL, 12, 0, 999.00, 0.00, b'0', '2024-12-13 17:26:45', '450', '2024-04-05 14:11:46', '450', '2024-04-09 09:16:26', b'0', 150);
INSERT INTO `member_store_user` VALUES (53, 16, 247, NULL, 12, 0, 999.00, 0.00, b'0', '2024-12-13 17:26:45', '450', '2024-04-05 23:12:08', '450', '2024-04-09 09:16:26', b'0', 150);

-- ----------------------------
-- Table structure for member_store_wxpay_config
-- ----------------------------
DROP TABLE IF EXISTS `member_store_wxpay_config`;
CREATE TABLE `member_store_wxpay_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint NOT NULL COMMENT '门店ID',
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小程序id',
  `mch_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户号',
  `mch_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付密钥',
  `p12` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'p12证书',
  `service_model` bit(1) NOT NULL DEFAULT b'0' COMMENT '支付服务商模式',
  `split` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否分账',
  `split_prop` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '分账比例',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门店微信支付配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_store_wxpay_config
-- ----------------------------

-- ----------------------------
-- Table structure for member_user
-- ----------------------------
DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `status` tinyint UNSIGNED NOT NULL COMMENT '状态',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `register_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册 IP',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `user_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户类型 11用户 12加盟商13管理员 14保洁',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '收入（非余额）',
  `withdrawal_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `balance` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '账户余额',
  `gift_balance` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '赠送余额',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`, `tenant_id`, `deleted`) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 445 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_user
-- ----------------------------
INSERT INTO `member_user` VALUES (247, '新修改昵称', 'https://pics0.baidu.com/feed/dc54564e9258d10911be8fd7256d30b46c814d33.jpeg', 0, '15675555180', '$2a$04$W1M.Xg1KJfeB95CZrLeHneokvKYtZ9u9AEnEF1Kjk/W7PUvcZ/axC', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', '2023-09-06 15:04:38', 12, 0.00, 0.00, 0.00, 0.00, NULL, '2023-07-27 20:40:08', '250', '2024-01-16 15:40:32', b'0', 150);

-- ----------------------------
-- Table structure for member_user_money_bill
-- ----------------------------
DROP TABLE IF EXISTS `member_user_money_bill`;
CREATE TABLE `member_user_money_bill`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `store_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '门店id',
  `type` tinyint(1) NOT NULL COMMENT '类型 1在线充值 2充值赠送 3订单支付 4订单退款',
  `money` decimal(10, 2) UNSIGNED NOT NULL COMMENT '金额',
  `money_type` tinyint(1) NULL DEFAULT NULL COMMENT '金额类型 1账户余额 2赠送余额',
  `total_money` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '当时总账户余额',
  `total_gift_money` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '当时总赠送余额',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户账单明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_user_money_bill
-- ----------------------------

-- ----------------------------
-- Table structure for member_user_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `member_user_withdrawal`;
CREATE TABLE `member_user_withdrawal`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户Id',
  `money` decimal(10, 2) NOT NULL COMMENT '提现金额',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `status` tinyint(1) NOT NULL COMMENT '状态 0已提交 1已完成',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户提现记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_user_withdrawal
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'appCouponExpireCheckJob', 'DEFAULT', '0 0 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'appMeituanRefreshTokenJob', 'DEFAULT', '0 1 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'appOrderCheckJob', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'appWxPaySplitJob', 'DEFAULT', '0 30 0 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payNotifyJob', 'DEFAULT', '* * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payOrderExpireJob', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payOrderSyncJob', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerName', 'payRefundSyncJob', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'appCouponExpireCheckJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000177400104A4F425F48414E444C45525F4E414D45740017617070436F75706F6E457870697265436865636B4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'appMeituanRefreshTokenJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000167400104A4F425F48414E444C45525F4E414D457400196170704D65697475616E52656672657368546F6B656E4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'appOrderCheckJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000147400104A4F425F48414E444C45525F4E414D457400106170704F72646572436865636B4A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'appWxPaySplitJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000187400104A4F425F48414E444C45525F4E414D45740010617070577850617953706C69744A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payNotifyJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000057400104A4F425F48414E444C45525F4E414D4574000C7061794E6F746966794A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payOrderExpireJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000127400104A4F425F48414E444C45525F4E414D457400117061794F726465724578706972654A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payOrderSyncJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000117400104A4F425F48414E444C45525F4E414D4574000F7061794F7264657253796E634A6F627800);
INSERT INTO `qrtz_job_details` VALUES ('schedulerName', 'payRefundSyncJob', 'DEFAULT', NULL, 'com.yanzu.framework.quartz.core.handler.JobHandlerInvoker', '0', '1', '1', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000027400064A4F425F49447372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000137400104A4F425F48414E444C45525F4E414D45740010706179526566756E6453796E634A6F627800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('schedulerName', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerName', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerName', 'PC-2023062422001729505868785', 1729506003466, 15000);
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerName', 'VM-24-16-centos1729492416112', 1729505999277, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `INT_PROP_1` int NULL DEFAULT NULL,
  `INT_PROP_2` int NULL DEFAULT NULL,
  `LONG_PROP_1` bigint NULL DEFAULT NULL,
  `LONG_PROP_2` bigint NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint NULL DEFAULT NULL,
  `PRIORITY` int NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'appCouponExpireCheckJob', 'DEFAULT', 'appCouponExpireCheckJob', 'DEFAULT', NULL, 1729526400000, 1729440000000, 5, 'WAITING', 'CRON', 1701336698000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'appMeituanRefreshTokenJob', 'DEFAULT', 'appMeituanRefreshTokenJob', 'DEFAULT', NULL, 1729526460000, 1729440060000, 5, 'WAITING', 'CRON', 1699335711000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'appOrderCheckJob', 'DEFAULT', 'appOrderCheckJob', 'DEFAULT', NULL, 1729506060000, 1729506000000, 5, 'WAITING', 'CRON', 1691129675000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'appWxPaySplitJob', 'DEFAULT', 'appWxPaySplitJob', 'DEFAULT', NULL, 1729528200000, 1729441800000, 5, 'WAITING', 'CRON', 1702017295000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payNotifyJob', 'DEFAULT', 'payNotifyJob', 'DEFAULT', NULL, 1691130177000, 1691130176000, 5, 'PAUSED', 'CRON', 1635294882000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payOrderExpireJob', 'DEFAULT', 'payOrderExpireJob', 'DEFAULT', NULL, 1691130240000, 1691130180000, 5, 'PAUSED', 'CRON', 1690011553000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payOrderSyncJob', 'DEFAULT', 'payOrderSyncJob', 'DEFAULT', NULL, 1691130180000, 1691130120000, 5, 'PAUSED', 'CRON', 1690007785000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);
INSERT INTO `qrtz_triggers` VALUES ('schedulerName', 'payRefundSyncJob', 'DEFAULT', 'payRefundSyncJob', 'DEFAULT', NULL, 1691130240000, 1691130180000, 5, 'PAUSED', 'CRON', 1690117424000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000037400114A4F425F48414E444C45525F504152414D707400124A4F425F52455452595F494E54455256414C737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000074000F4A4F425F52455452595F434F554E5471007E000B7800);

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父部门id',
  `sort` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `leader_user_id` bigint NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint NOT NULL COMMENT '部门状态（0正常 1停用）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (100, 'test', 0, 0, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-06-19 00:29:10', b'0', 1);
INSERT INTO `system_dept` VALUES (101, '深圳总公司', 100, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:23', b'0', 1);
INSERT INTO `system_dept` VALUES (102, '长沙分公司', 100, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:40', b'0', 1);
INSERT INTO `system_dept` VALUES (103, '研发部门', 101, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-14 01:04:14', b'0', 1);
INSERT INTO `system_dept` VALUES (104, '市场部门', 101, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:38', b'0', 1);
INSERT INTO `system_dept` VALUES (105, '测试部门', 101, 3, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:15', b'0', 1);
INSERT INTO `system_dept` VALUES (106, '财务部门', 101, 4, 103, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-15 21:32:22', b'0', 1);
INSERT INTO `system_dept` VALUES (107, '运维部门', 101, 5, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:33', b'0', 1);
INSERT INTO `system_dept` VALUES (108, '市场部门', 102, 1, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-02-16 08:35:45', b'0', 1);
INSERT INTO `system_dept` VALUES (109, '财务部门', 102, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:29', b'0', 1);
INSERT INTO `system_dept` VALUES (110, '新部门', 0, 1, NULL, NULL, NULL, 0, '110', '2022-02-23 20:46:30', '110', '2022-02-23 20:46:30', b'0', 121);
INSERT INTO `system_dept` VALUES (111, '顶级部门', 0, 1, NULL, NULL, NULL, 0, '113', '2022-03-07 21:44:50', '113', '2022-03-07 21:44:50', b'0', 122);

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_data`;
CREATE TABLE `system_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `sort` int NOT NULL DEFAULT 0 COMMENT '字典排序',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典标签',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `color_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '颜色类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'css 样式',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
INSERT INTO `system_dict_data` VALUES (1, 1, '男', '1', 'system_user_sex', 0, 'default', 'A', '性别男', 'admin', '2021-01-05 17:03:48', '1', '2022-03-29 00:14:39', b'0');
INSERT INTO `system_dict_data` VALUES (2, 2, '女', '2', 'system_user_sex', 1, 'success', '', '性别女', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 01:30:51', b'0');
INSERT INTO `system_dict_data` VALUES (8, 1, '正常', '1', 'infra_job_status', 0, 'success', '', '正常状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:38', b'0');
INSERT INTO `system_dict_data` VALUES (9, 2, '暂停', '2', 'infra_job_status', 0, 'danger', '', '停用状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:45', b'0');
INSERT INTO `system_dict_data` VALUES (12, 1, '系统内置', '1', 'infra_config_type', 0, 'danger', '', '参数类型 - 系统内置', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:02', b'0');
INSERT INTO `system_dict_data` VALUES (13, 2, '自定义', '2', 'infra_config_type', 0, 'primary', '', '参数类型 - 自定义', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:07', b'0');
INSERT INTO `system_dict_data` VALUES (14, 1, '通知', '1', 'system_notice_type', 0, 'success', '', '通知', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:05:57', b'0');
INSERT INTO `system_dict_data` VALUES (15, 2, '公告', '2', 'system_notice_type', 0, 'info', '', '公告', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:06:01', b'0');
INSERT INTO `system_dict_data` VALUES (16, 0, '其它', '0', 'system_operate_type', 0, 'default', '', '其它操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:32:46', b'0');
INSERT INTO `system_dict_data` VALUES (17, 1, '查询', '1', 'system_operate_type', 0, 'info', '', '查询操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:16', b'0');
INSERT INTO `system_dict_data` VALUES (18, 2, '新增', '2', 'system_operate_type', 0, 'primary', '', '新增操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:13', b'0');
INSERT INTO `system_dict_data` VALUES (19, 3, '修改', '3', 'system_operate_type', 0, 'warning', '', '修改操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:22', b'0');
INSERT INTO `system_dict_data` VALUES (20, 4, '删除', '4', 'system_operate_type', 0, 'danger', '', '删除操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:27', b'0');
INSERT INTO `system_dict_data` VALUES (22, 5, '导出', '5', 'system_operate_type', 0, 'default', '', '导出操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:32', b'0');
INSERT INTO `system_dict_data` VALUES (23, 6, '导入', '6', 'system_operate_type', 0, 'default', '', '导入操作', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:33:35', b'0');
INSERT INTO `system_dict_data` VALUES (27, 1, '开启', '0', 'common_status', 0, 'primary', '', '开启状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:39', b'0');
INSERT INTO `system_dict_data` VALUES (28, 2, '关闭', '1', 'common_status', 0, 'info', '', '关闭状态', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:44', b'0');
INSERT INTO `system_dict_data` VALUES (29, 1, '目录', '1', 'system_menu_type', 0, '', '', '目录', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:45', b'0');
INSERT INTO `system_dict_data` VALUES (30, 2, '菜单', '2', 'system_menu_type', 0, '', '', '菜单', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:41', b'0');
INSERT INTO `system_dict_data` VALUES (31, 3, '按钮', '3', 'system_menu_type', 0, '', '', '按钮', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:39', b'0');
INSERT INTO `system_dict_data` VALUES (32, 1, '内置', '1', 'system_role_type', 0, 'danger', '', '内置角色', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:08', b'0');
INSERT INTO `system_dict_data` VALUES (33, 2, '自定义', '2', 'system_role_type', 0, 'primary', '', '自定义角色', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:12', b'0');
INSERT INTO `system_dict_data` VALUES (34, 1, '全部数据权限', '1', 'system_data_scope', 0, '', '', '全部数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:17', b'0');
INSERT INTO `system_dict_data` VALUES (35, 2, '指定部门数据权限', '2', 'system_data_scope', 0, '', '', '指定部门数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:18', b'0');
INSERT INTO `system_dict_data` VALUES (36, 3, '本部门数据权限', '3', 'system_data_scope', 0, '', '', '本部门数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:16', b'0');
INSERT INTO `system_dict_data` VALUES (37, 4, '本部门及以下数据权限', '4', 'system_data_scope', 0, '', '', '本部门及以下数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:21', b'0');
INSERT INTO `system_dict_data` VALUES (38, 5, '仅本人数据权限', '5', 'system_data_scope', 0, '', '', '仅本人数据权限', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:23', b'0');
INSERT INTO `system_dict_data` VALUES (39, 0, '成功', '0', 'system_login_result', 0, 'success', '', '登陆结果 - 成功', '', '2021-01-18 06:17:36', '1', '2022-02-16 13:23:49', b'0');
INSERT INTO `system_dict_data` VALUES (40, 10, '账号或密码不正确', '10', 'system_login_result', 0, 'primary', '', '登陆结果 - 账号或密码不正确', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:27', b'0');
INSERT INTO `system_dict_data` VALUES (41, 20, '用户被禁用', '20', 'system_login_result', 0, 'warning', '', '登陆结果 - 用户被禁用', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:23:57', b'0');
INSERT INTO `system_dict_data` VALUES (42, 30, '验证码不存在', '30', 'system_login_result', 0, 'info', '', '登陆结果 - 验证码不存在', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:07', b'0');
INSERT INTO `system_dict_data` VALUES (43, 31, '验证码不正确', '31', 'system_login_result', 0, 'info', '', '登陆结果 - 验证码不正确', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:11', b'0');
INSERT INTO `system_dict_data` VALUES (44, 100, '未知异常', '100', 'system_login_result', 0, 'danger', '', '登陆结果 - 未知异常', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:23', b'0');
INSERT INTO `system_dict_data` VALUES (45, 1, '是', 'true', 'infra_boolean_string', 0, 'danger', '', 'Boolean 是否类型 - 是', '', '2021-01-19 03:20:55', '1', '2022-03-15 23:01:45', b'0');
INSERT INTO `system_dict_data` VALUES (46, 1, '否', 'false', 'infra_boolean_string', 0, 'info', '', 'Boolean 是否类型 - 否', '', '2021-01-19 03:20:55', '1', '2022-03-15 23:09:45', b'0');
INSERT INTO `system_dict_data` VALUES (47, 1, '永不超时', '1', 'infra_redis_timeout_type', 0, 'primary', '', 'Redis 未设置超时的情况', '', '2021-01-26 00:53:17', '1', '2022-02-16 19:03:35', b'0');
INSERT INTO `system_dict_data` VALUES (48, 1, '动态超时', '2', 'infra_redis_timeout_type', 0, 'info', '', '程序里动态传入超时时间，无法固定', '', '2021-01-26 00:55:00', '1', '2022-02-16 19:03:41', b'0');
INSERT INTO `system_dict_data` VALUES (49, 3, '固定超时', '3', 'infra_redis_timeout_type', 0, 'success', '', 'Redis 设置了过期时间', '', '2021-01-26 00:55:26', '1', '2022-02-16 19:03:45', b'0');
INSERT INTO `system_dict_data` VALUES (50, 1, '单表（增删改查）', '1', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:09:06', '', '2022-03-10 16:33:15', b'0');
INSERT INTO `system_dict_data` VALUES (51, 2, '树表（增删改查）', '2', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:14:46', '', '2022-03-10 16:33:19', b'0');
INSERT INTO `system_dict_data` VALUES (53, 0, '初始化中', '0', 'infra_job_status', 0, 'primary', '', NULL, '', '2021-02-07 07:46:49', '1', '2022-02-16 19:33:29', b'0');
INSERT INTO `system_dict_data` VALUES (57, 0, '运行中', '0', 'infra_job_log_status', 0, 'primary', '', 'RUNNING', '', '2021-02-08 10:04:24', '1', '2022-02-16 19:07:48', b'0');
INSERT INTO `system_dict_data` VALUES (58, 1, '成功', '1', 'infra_job_log_status', 0, 'success', '', NULL, '', '2021-02-08 10:06:57', '1', '2022-02-16 19:07:52', b'0');
INSERT INTO `system_dict_data` VALUES (59, 2, '失败', '2', 'infra_job_log_status', 0, 'warning', '', '失败', '', '2021-02-08 10:07:38', '1', '2022-02-16 19:07:56', b'0');
INSERT INTO `system_dict_data` VALUES (60, 1, '加盟商', '12', 'user_type', 0, 'primary', '', NULL, '', '2021-02-26 00:16:27', '1', '2023-07-28 17:24:31', b'0');
INSERT INTO `system_dict_data` VALUES (61, 999, '后台管理员', '2', 'user_type', 0, 'default', '', NULL, '', '2021-02-26 00:16:34', '1', '2023-07-28 17:21:21', b'0');
INSERT INTO `system_dict_data` VALUES (62, 0, '未处理', '0', 'infra_api_error_log_process_status', 0, 'primary', '', NULL, '', '2021-02-26 07:07:19', '1', '2022-02-16 20:14:17', b'0');
INSERT INTO `system_dict_data` VALUES (63, 1, '已处理', '1', 'infra_api_error_log_process_status', 0, 'success', '', NULL, '', '2021-02-26 07:07:26', '1', '2022-02-16 20:14:08', b'0');
INSERT INTO `system_dict_data` VALUES (64, 2, '已忽略', '2', 'infra_api_error_log_process_status', 0, 'danger', '', NULL, '', '2021-02-26 07:07:34', '1', '2022-02-16 20:14:14', b'0');
INSERT INTO `system_dict_data` VALUES (66, 2, '阿里云', 'ALIYUN', 'system_sms_channel_code', 0, 'primary', '', NULL, '1', '2021-04-05 01:05:26', '1', '2022-02-16 10:09:52', b'0');
INSERT INTO `system_dict_data` VALUES (67, 1, '验证码', '1', 'system_sms_template_type', 0, 'warning', '', NULL, '1', '2021-04-05 21:50:57', '1', '2022-02-16 12:48:30', b'0');
INSERT INTO `system_dict_data` VALUES (68, 2, '通知', '2', 'system_sms_template_type', 0, 'primary', '', NULL, '1', '2021-04-05 21:51:08', '1', '2022-02-16 12:48:27', b'0');
INSERT INTO `system_dict_data` VALUES (69, 0, '营销', '3', 'system_sms_template_type', 0, 'danger', '', NULL, '1', '2021-04-05 21:51:15', '1', '2022-02-16 12:48:22', b'0');
INSERT INTO `system_dict_data` VALUES (70, 0, '初始化', '0', 'system_sms_send_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:18:33', '1', '2022-02-16 10:26:07', b'0');
INSERT INTO `system_dict_data` VALUES (71, 1, '发送成功', '10', 'system_sms_send_status', 0, 'success', '', NULL, '1', '2021-04-11 20:18:43', '1', '2022-02-16 10:25:56', b'0');
INSERT INTO `system_dict_data` VALUES (72, 2, '发送失败', '20', 'system_sms_send_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:18:49', '1', '2022-02-16 10:26:03', b'0');
INSERT INTO `system_dict_data` VALUES (73, 3, '不发送', '30', 'system_sms_send_status', 0, 'info', '', NULL, '1', '2021-04-11 20:19:44', '1', '2022-02-16 10:26:10', b'0');
INSERT INTO `system_dict_data` VALUES (74, 0, '等待结果', '0', 'system_sms_receive_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:27:43', '1', '2022-02-16 10:28:24', b'0');
INSERT INTO `system_dict_data` VALUES (75, 1, '接收成功', '10', 'system_sms_receive_status', 0, 'success', '', NULL, '1', '2021-04-11 20:29:25', '1', '2022-02-16 10:28:28', b'0');
INSERT INTO `system_dict_data` VALUES (76, 2, '接收失败', '20', 'system_sms_receive_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:29:31', '1', '2022-02-16 10:28:32', b'0');
INSERT INTO `system_dict_data` VALUES (77, 0, '调试(钉钉)', 'DEBUG_DING_TALK', 'system_sms_channel_code', 0, 'info', '', NULL, '1', '2021-04-13 00:20:37', '1', '2022-02-16 10:10:00', b'0');
INSERT INTO `system_dict_data` VALUES (78, 1, '自动生成', '1', 'system_error_code_type', 0, 'warning', '', NULL, '1', '2021-04-21 00:06:48', '1', '2022-02-16 13:57:20', b'0');
INSERT INTO `system_dict_data` VALUES (79, 2, '手动编辑', '2', 'system_error_code_type', 0, 'primary', '', NULL, '1', '2021-04-21 00:07:14', '1', '2022-02-16 13:57:24', b'0');
INSERT INTO `system_dict_data` VALUES (80, 100, '账号登录', '100', 'system_login_type', 0, 'primary', '', '账号登录', '1', '2021-10-06 00:52:02', '1', '2022-02-16 13:11:34', b'0');
INSERT INTO `system_dict_data` VALUES (81, 101, '社交登录', '101', 'system_login_type', 0, 'info', '', '社交登录', '1', '2021-10-06 00:52:17', '1', '2022-02-16 13:11:40', b'0');
INSERT INTO `system_dict_data` VALUES (83, 200, '主动登出', '200', 'system_login_type', 0, 'primary', '', '主动登出', '1', '2021-10-06 00:52:58', '1', '2022-02-16 13:11:49', b'0');
INSERT INTO `system_dict_data` VALUES (85, 202, '强制登出', '202', 'system_login_type', 0, 'danger', '', '强制退出', '1', '2021-10-06 00:53:41', '1', '2022-02-16 13:11:57', b'0');
INSERT INTO `system_dict_data` VALUES (113, 1, '微信公众号支付', 'wx_pub', 'pay_channel_code', 0, 'success', '', '微信公众号支付', '1', '2021-12-03 10:40:24', '1', '2023-07-19 20:08:47', b'0');
INSERT INTO `system_dict_data` VALUES (114, 2, '微信小程序支付', 'wx_lite', 'pay_channel_code', 0, 'success', '', '微信小程序支付', '1', '2021-12-03 10:41:06', '1', '2023-07-19 20:08:50', b'0');
INSERT INTO `system_dict_data` VALUES (115, 3, '微信 App 支付', 'wx_app', 'pay_channel_code', 0, 'success', '', '微信 App 支付', '1', '2021-12-03 10:41:20', '1', '2023-07-19 20:08:56', b'0');
INSERT INTO `system_dict_data` VALUES (116, 10, '支付宝 PC 网站支付', 'alipay_pc', 'pay_channel_code', 0, 'primary', '', '支付宝 PC 网站支付', '1', '2021-12-03 10:42:09', '1', '2023-07-19 20:09:12', b'0');
INSERT INTO `system_dict_data` VALUES (117, 11, '支付宝 Wap 网站支付', 'alipay_wap', 'pay_channel_code', 0, 'primary', '', '支付宝 Wap 网站支付', '1', '2021-12-03 10:42:26', '1', '2023-07-19 20:09:16', b'0');
INSERT INTO `system_dict_data` VALUES (118, 12, '支付宝 App 支付', 'alipay_app', 'pay_channel_code', 0, 'primary', '', '支付宝 App 支付', '1', '2021-12-03 10:42:55', '1', '2023-07-19 20:09:20', b'0');
INSERT INTO `system_dict_data` VALUES (119, 14, '支付宝扫码支付', 'alipay_qr', 'pay_channel_code', 0, 'primary', '', '支付宝扫码支付', '1', '2021-12-03 10:43:10', '1', '2023-07-19 20:09:28', b'0');
INSERT INTO `system_dict_data` VALUES (120, 10, '通知成功', '10', 'pay_notify_status', 0, 'success', '', '通知成功', '1', '2021-12-03 11:02:41', '1', '2023-07-19 10:08:19', b'0');
INSERT INTO `system_dict_data` VALUES (121, 20, '通知失败', '20', 'pay_notify_status', 0, 'danger', '', '通知失败', '1', '2021-12-03 11:02:59', '1', '2023-07-19 10:08:21', b'0');
INSERT INTO `system_dict_data` VALUES (122, 0, '等待通知', '0', 'pay_notify_status', 0, 'info', '', '未通知', '1', '2021-12-03 11:03:10', '1', '2023-07-19 10:08:24', b'0');
INSERT INTO `system_dict_data` VALUES (123, 10, '支付成功', '10', 'pay_order_status', 0, 'success', '', '支付成功', '1', '2021-12-03 11:18:29', '1', '2023-07-19 18:04:28', b'0');
INSERT INTO `system_dict_data` VALUES (124, 30, '支付关闭', '30', 'pay_order_status', 0, 'info', '', '支付关闭', '1', '2021-12-03 11:18:42', '1', '2023-07-19 18:05:07', b'0');
INSERT INTO `system_dict_data` VALUES (125, 0, '等待支付', '0', 'pay_order_status', 0, 'info', '', '未支付', '1', '2021-12-03 11:18:18', '1', '2023-07-19 18:04:15', b'0');
INSERT INTO `system_dict_data` VALUES (1118, 0, '等待退款', '0', 'pay_refund_status', 0, 'info', '', '等待退款', '1', '2021-12-10 16:44:59', '1', '2023-07-19 10:14:39', b'0');
INSERT INTO `system_dict_data` VALUES (1119, 20, '退款失败', '20', 'pay_refund_status', 0, 'danger', '', '退款失败', '1', '2021-12-10 16:45:10', '1', '2023-07-19 10:15:10', b'0');
INSERT INTO `system_dict_data` VALUES (1124, 10, '退款成功', '10', 'pay_refund_status', 0, 'success', '', '退款成功', '1', '2021-12-10 16:46:26', '1', '2023-07-19 10:15:00', b'0');
INSERT INTO `system_dict_data` VALUES (1145, 1, '管理后台', '1', 'infra_codegen_scene', 0, '', '', '代码生成的场景枚举 - 管理后台', '1', '2022-02-02 13:15:06', '1', '2022-03-10 16:32:59', b'0');
INSERT INTO `system_dict_data` VALUES (1146, 2, '用户 APP', '2', 'infra_codegen_scene', 0, '', '', '代码生成的场景枚举 - 用户 APP', '1', '2022-02-02 13:15:19', '1', '2022-03-10 16:33:03', b'0');
INSERT INTO `system_dict_data` VALUES (1150, 1, '数据库', '1', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:28', '1', '2022-03-15 00:25:28', b'0');
INSERT INTO `system_dict_data` VALUES (1151, 10, '本地磁盘', '10', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:41', '1', '2022-03-15 00:25:56', b'0');
INSERT INTO `system_dict_data` VALUES (1152, 11, 'FTP 服务器', '11', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:06', '1', '2022-03-15 00:26:10', b'0');
INSERT INTO `system_dict_data` VALUES (1153, 12, 'SFTP 服务器', '12', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:22', '1', '2022-03-15 00:26:22', b'0');
INSERT INTO `system_dict_data` VALUES (1154, 20, 'S3 对象存储', '20', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:31', '1', '2022-03-15 00:26:45', b'0');
INSERT INTO `system_dict_data` VALUES (1155, 103, '短信登录', '103', 'system_login_type', 0, 'default', '', NULL, '1', '2022-05-09 23:57:58', '1', '2022-05-09 23:58:09', b'0');
INSERT INTO `system_dict_data` VALUES (1156, 1, 'password', 'password', 'system_oauth2_grant_type', 0, 'default', '', '密码模式', '1', '2022-05-12 00:22:05', '1', '2022-05-11 16:26:01', b'0');
INSERT INTO `system_dict_data` VALUES (1157, 2, 'authorization_code', 'authorization_code', 'system_oauth2_grant_type', 0, 'primary', '', '授权码模式', '1', '2022-05-12 00:22:59', '1', '2022-05-11 16:26:02', b'0');
INSERT INTO `system_dict_data` VALUES (1158, 3, 'implicit', 'implicit', 'system_oauth2_grant_type', 0, 'success', '', '简化模式', '1', '2022-05-12 00:23:40', '1', '2022-05-11 16:26:05', b'0');
INSERT INTO `system_dict_data` VALUES (1159, 4, 'client_credentials', 'client_credentials', 'system_oauth2_grant_type', 0, 'default', '', '客户端模式', '1', '2022-05-12 00:23:51', '1', '2022-05-11 16:26:08', b'0');
INSERT INTO `system_dict_data` VALUES (1160, 5, 'refresh_token', 'refresh_token', 'system_oauth2_grant_type', 0, 'info', '', '刷新模式', '1', '2022-05-12 00:24:02', '1', '2022-05-11 16:26:11', b'0');
INSERT INTO `system_dict_data` VALUES (1162, 1, '销售中', '1', 'product_spu_status', 0, 'success', '', '商品 SPU 状态 - 销售中', '1', '2022-10-24 21:19:47', '1', '2022-10-24 21:20:38', b'0');
INSERT INTO `system_dict_data` VALUES (1163, 0, '仓库中', '0', 'product_spu_status', 0, 'info', '', '商品 SPU 状态 - 仓库中', '1', '2022-10-24 21:20:54', '1', '2022-10-24 21:21:22', b'0');
INSERT INTO `system_dict_data` VALUES (1164, 0, '回收站', '-1', 'product_spu_status', 0, 'default', '', '商品 SPU 状态 - 回收站', '1', '2022-10-24 21:21:11', '1', '2022-10-24 21:21:11', b'0');
INSERT INTO `system_dict_data` VALUES (1165, 1, '满减', '1', 'promotion_discount_type', 0, 'success', '', '优惠类型 - 满减', '1', '2022-11-01 12:46:41', '1', '2022-11-01 12:50:11', b'0');
INSERT INTO `system_dict_data` VALUES (1166, 2, '折扣', '2', 'promotion_discount_type', 0, 'primary', '', '优惠类型 - 折扣', '1', '2022-11-01 12:46:51', '1', '2022-11-01 12:50:08', b'0');
INSERT INTO `system_dict_data` VALUES (1167, 1, '固定日期', '1', 'promotion_coupon_template_validity_type', 0, 'default', '', '优惠劵模板的有限期类型 - 固定日期', '1', '2022-11-02 00:07:34', '1', '2022-11-04 00:07:49', b'0');
INSERT INTO `system_dict_data` VALUES (1168, 2, '领取之后', '2', 'promotion_coupon_template_validity_type', 0, 'default', '', '优惠劵模板的有限期类型 - 领取之后', '1', '2022-11-02 00:07:54', '1', '2022-11-04 00:07:52', b'0');
INSERT INTO `system_dict_data` VALUES (1169, 1, '全部商品参与', '1', 'promotion_product_scope', 0, 'default', '', '营销的商品范围 - 全部商品参与', '1', '2022-11-02 00:28:22', '1', '2022-11-02 00:28:22', b'0');
INSERT INTO `system_dict_data` VALUES (1170, 2, '指定商品参与', '2', 'promotion_product_scope', 0, 'default', '', '营销的商品范围 - 指定商品参与', '1', '2022-11-02 00:28:34', '1', '2022-11-02 00:28:40', b'0');
INSERT INTO `system_dict_data` VALUES (1171, 1, '已领取', '1', 'promotion_coupon_status', 0, 'primary', '', '优惠劵的状态 - 已领取', '1', '2022-11-04 00:15:08', '1', '2022-11-04 19:16:04', b'0');
INSERT INTO `system_dict_data` VALUES (1172, 2, '已使用', '2', 'promotion_coupon_status', 0, 'success', '', '优惠劵的状态 - 已使用', '1', '2022-11-04 00:15:21', '1', '2022-11-04 19:16:08', b'0');
INSERT INTO `system_dict_data` VALUES (1173, 3, '已过期', '3', 'promotion_coupon_status', 0, 'info', '', '优惠劵的状态 - 已过期', '1', '2022-11-04 00:15:43', '1', '2022-11-04 19:16:12', b'0');
INSERT INTO `system_dict_data` VALUES (1174, 1, '直接领取', '1', 'promotion_coupon_take_type', 0, 'primary', '', '优惠劵的领取方式 - 直接领取', '1', '2022-11-04 19:13:00', '1', '2022-11-04 19:13:25', b'0');
INSERT INTO `system_dict_data` VALUES (1175, 2, '指定发放', '2', 'promotion_coupon_take_type', 0, 'success', '', '优惠劵的领取方式 - 指定发放', '1', '2022-11-04 19:13:13', '1', '2022-11-04 19:14:48', b'0');
INSERT INTO `system_dict_data` VALUES (1176, 10, '未开始', '10', 'promotion_activity_status', 0, 'primary', '', '促销活动的状态枚举 - 未开始', '1', '2022-11-04 22:54:49', '1', '2022-11-04 22:55:53', b'0');
INSERT INTO `system_dict_data` VALUES (1177, 20, '进行中', '20', 'promotion_activity_status', 0, 'success', '', '促销活动的状态枚举 - 进行中', '1', '2022-11-04 22:55:06', '1', '2022-11-04 22:55:20', b'0');
INSERT INTO `system_dict_data` VALUES (1178, 30, '已结束', '30', 'promotion_activity_status', 0, 'info', '', '促销活动的状态枚举 - 已结束', '1', '2022-11-04 22:55:41', '1', '2022-11-04 22:55:41', b'0');
INSERT INTO `system_dict_data` VALUES (1179, 40, '已关闭', '40', 'promotion_activity_status', 0, 'warning', '', '促销活动的状态枚举 - 已关闭', '1', '2022-11-04 22:56:10', '1', '2022-11-04 22:56:18', b'0');
INSERT INTO `system_dict_data` VALUES (1180, 10, '满 N 元', '10', 'promotion_condition_type', 0, 'primary', '', '营销的条件类型 - 满 N 元', '1', '2022-11-04 22:59:45', '1', '2022-11-04 22:59:45', b'0');
INSERT INTO `system_dict_data` VALUES (1181, 20, '满 N 件', '20', 'promotion_condition_type', 0, 'success', '', '营销的条件类型 - 满 N 件', '1', '2022-11-04 23:00:02', '1', '2022-11-04 23:00:02', b'0');
INSERT INTO `system_dict_data` VALUES (1182, 10, '申请售后', '10', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 申请售后', '1', '2022-11-19 20:53:33', '1', '2022-11-19 20:54:42', b'0');
INSERT INTO `system_dict_data` VALUES (1183, 20, '商品待退货', '20', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 商品待退货', '1', '2022-11-19 20:54:36', '1', '2022-11-19 20:58:58', b'0');
INSERT INTO `system_dict_data` VALUES (1184, 30, '商家待收货', '30', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 商家待收货', '1', '2022-11-19 20:56:56', '1', '2022-11-19 20:59:20', b'0');
INSERT INTO `system_dict_data` VALUES (1185, 40, '等待退款', '40', 'trade_after_sale_status', 0, 'primary', '', '交易售后状态 - 等待退款', '1', '2022-11-19 20:59:54', '1', '2022-11-19 21:00:01', b'0');
INSERT INTO `system_dict_data` VALUES (1186, 50, '退款成功', '50', 'trade_after_sale_status', 0, 'default', '', '交易售后状态 - 退款成功', '1', '2022-11-19 21:00:33', '1', '2022-11-19 21:00:33', b'0');
INSERT INTO `system_dict_data` VALUES (1187, 61, '买家取消', '61', 'trade_after_sale_status', 0, 'info', '', '交易售后状态 - 买家取消', '1', '2022-11-19 21:01:29', '1', '2022-11-19 21:01:29', b'0');
INSERT INTO `system_dict_data` VALUES (1188, 62, '商家拒绝', '62', 'trade_after_sale_status', 0, 'info', '', '交易售后状态 - 商家拒绝', '1', '2022-11-19 21:02:17', '1', '2022-11-19 21:02:17', b'0');
INSERT INTO `system_dict_data` VALUES (1189, 63, '商家拒收货', '63', 'trade_after_sale_status', 0, 'info', '', '交易售后状态 - 商家拒收货', '1', '2022-11-19 21:02:37', '1', '2022-11-19 21:03:07', b'0');
INSERT INTO `system_dict_data` VALUES (1190, 10, '售中退款', '10', 'trade_after_sale_type', 0, 'success', '', '交易售后的类型 - 售中退款', '1', '2022-11-19 21:05:05', '1', '2022-11-19 21:38:23', b'0');
INSERT INTO `system_dict_data` VALUES (1191, 20, '售后退款', '20', 'trade_after_sale_type', 0, 'primary', '', '交易售后的类型 - 售后退款', '1', '2022-11-19 21:05:32', '1', '2022-11-19 21:38:32', b'0');
INSERT INTO `system_dict_data` VALUES (1192, 10, '仅退款', '10', 'trade_after_sale_way', 0, 'primary', '', '交易售后的方式 - 仅退款', '1', '2022-11-19 21:39:19', '1', '2022-11-19 21:39:19', b'0');
INSERT INTO `system_dict_data` VALUES (1193, 20, '退货退款', '20', 'trade_after_sale_way', 0, 'success', '', '交易售后的方式 - 退货退款', '1', '2022-11-19 21:39:38', '1', '2022-11-19 21:39:49', b'0');
INSERT INTO `system_dict_data` VALUES (1194, 10, '微信小程序', '10', 'terminal', 0, 'default', '', '终端 - 微信小程序', '1', '2022-12-10 10:51:11', '1', '2022-12-10 10:51:57', b'0');
INSERT INTO `system_dict_data` VALUES (1195, 20, 'H5 网页', '20', 'terminal', 0, 'default', '', '终端 - H5 网页', '1', '2022-12-10 10:51:30', '1', '2022-12-10 10:51:59', b'0');
INSERT INTO `system_dict_data` VALUES (1196, 11, '微信公众号', '11', 'terminal', 0, 'default', '', '终端 - 微信公众号', '1', '2022-12-10 10:54:16', '1', '2022-12-10 10:52:01', b'0');
INSERT INTO `system_dict_data` VALUES (1197, 31, '苹果 App', '31', 'terminal', 0, 'default', '', '终端 - 苹果 App', '1', '2022-12-10 10:54:42', '1', '2022-12-10 10:52:18', b'0');
INSERT INTO `system_dict_data` VALUES (1198, 32, '安卓 App', '32', 'terminal', 0, 'default', '', '终端 - 安卓 App', '1', '2022-12-10 10:55:02', '1', '2022-12-10 10:59:17', b'0');
INSERT INTO `system_dict_data` VALUES (1199, 0, '普通订单', '0', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 普通订单', '1', '2022-12-10 16:34:14', '1', '2022-12-10 16:34:14', b'0');
INSERT INTO `system_dict_data` VALUES (1200, 1, '秒杀订单', '1', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 秒杀订单', '1', '2022-12-10 16:34:26', '1', '2022-12-10 16:34:26', b'0');
INSERT INTO `system_dict_data` VALUES (1201, 2, '拼团订单', '2', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 拼团订单', '1', '2022-12-10 16:34:36', '1', '2022-12-10 16:34:36', b'0');
INSERT INTO `system_dict_data` VALUES (1202, 3, '砍价订单', '3', 'trade_order_type', 0, 'default', '', '交易订单的类型 - 砍价订单', '1', '2022-12-10 16:34:48', '1', '2022-12-10 16:34:48', b'0');
INSERT INTO `system_dict_data` VALUES (1203, 0, '待支付', '0', 'trade_order_status', 0, 'default', '', '交易订单状态 - 待支付', '1', '2022-12-10 16:49:29', '1', '2022-12-10 16:49:29', b'0');
INSERT INTO `system_dict_data` VALUES (1204, 10, '待发货', '10', 'trade_order_status', 0, 'primary', '', '交易订单状态 - 待发货', '1', '2022-12-10 16:49:53', '1', '2022-12-10 16:51:17', b'0');
INSERT INTO `system_dict_data` VALUES (1205, 20, '已发货', '20', 'trade_order_status', 0, 'primary', '', '交易订单状态 - 已发货', '1', '2022-12-10 16:50:13', '1', '2022-12-10 16:51:31', b'0');
INSERT INTO `system_dict_data` VALUES (1206, 30, '已完成', '30', 'trade_order_status', 0, 'success', '', '交易订单状态 - 已完成', '1', '2022-12-10 16:50:30', '1', '2022-12-10 16:51:06', b'0');
INSERT INTO `system_dict_data` VALUES (1207, 40, '已取消', '40', 'trade_order_status', 0, 'danger', '', '交易订单状态 - 已取消', '1', '2022-12-10 16:50:50', '1', '2022-12-10 16:51:00', b'0');
INSERT INTO `system_dict_data` VALUES (1208, 0, '未售后', '0', 'trade_order_item_after_sale_status', 0, 'info', '', '交易订单项的售后状态 - 未售后', '1', '2022-12-10 20:58:42', '1', '2022-12-10 20:59:29', b'0');
INSERT INTO `system_dict_data` VALUES (1209, 1, '售后中', '1', 'trade_order_item_after_sale_status', 0, 'primary', '', '交易订单项的售后状态 - 售后中', '1', '2022-12-10 20:59:21', '1', '2022-12-10 20:59:21', b'0');
INSERT INTO `system_dict_data` VALUES (1210, 2, '已退款', '2', 'trade_order_item_after_sale_status', 0, 'success', '', '交易订单项的售后状态 - 已退款', '1', '2022-12-10 20:59:46', '1', '2022-12-10 20:59:46', b'0');
INSERT INTO `system_dict_data` VALUES (1211, 1, '完全匹配', '1', 'mp_auto_reply_request_match', 0, 'primary', '', '公众号自动回复的请求关键字匹配模式 - 完全匹配', '1', '2023-01-16 23:30:39', '1', '2023-01-16 23:31:00', b'0');
INSERT INTO `system_dict_data` VALUES (1212, 2, '半匹配', '2', 'mp_auto_reply_request_match', 0, 'success', '', '公众号自动回复的请求关键字匹配模式 - 半匹配', '1', '2023-01-16 23:30:55', '1', '2023-01-16 23:31:10', b'0');
INSERT INTO `system_dict_data` VALUES (1213, 1, '文本', 'text', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 文本', '1', '2023-01-17 22:17:32', '1', '2023-01-17 22:17:39', b'0');
INSERT INTO `system_dict_data` VALUES (1214, 2, '图片', 'image', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 图片', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:19:47', b'0');
INSERT INTO `system_dict_data` VALUES (1215, 3, '语音', 'voice', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 语音', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:20:08', b'0');
INSERT INTO `system_dict_data` VALUES (1216, 4, '视频', 'video', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 视频', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:21:08', b'0');
INSERT INTO `system_dict_data` VALUES (1217, 5, '小视频', 'shortvideo', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 小视频', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:19:59', b'0');
INSERT INTO `system_dict_data` VALUES (1218, 6, '图文', 'news', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 图文', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:22:54', b'0');
INSERT INTO `system_dict_data` VALUES (1219, 7, '音乐', 'music', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 音乐', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:22:54', b'0');
INSERT INTO `system_dict_data` VALUES (1220, 8, '地理位置', 'location', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 地理位置', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:23:51', b'0');
INSERT INTO `system_dict_data` VALUES (1221, 9, '链接', 'link', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 链接', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:24:49', b'0');
INSERT INTO `system_dict_data` VALUES (1222, 10, '事件', 'event', 'mp_message_type', 0, 'default', '', '公众号的消息类型 - 事件', '1', '2023-01-17 22:17:32', '1', '2023-01-17 14:24:49', b'0');
INSERT INTO `system_dict_data` VALUES (1223, 0, '初始化', '0', 'system_mail_send_status', 0, 'primary', '', '邮件发送状态 - 初始化\n', '1', '2023-01-26 09:53:49', '1', '2023-01-26 16:36:14', b'0');
INSERT INTO `system_dict_data` VALUES (1224, 10, '发送成功', '10', 'system_mail_send_status', 0, 'success', '', '邮件发送状态 - 发送成功', '1', '2023-01-26 09:54:28', '1', '2023-01-26 16:36:22', b'0');
INSERT INTO `system_dict_data` VALUES (1225, 20, '发送失败', '20', 'system_mail_send_status', 0, 'danger', '', '邮件发送状态 - 发送失败', '1', '2023-01-26 09:54:50', '1', '2023-01-26 16:36:26', b'0');
INSERT INTO `system_dict_data` VALUES (1226, 30, '不发送', '30', 'system_mail_send_status', 0, 'info', '', '邮件发送状态 -  不发送', '1', '2023-01-26 09:55:06', '1', '2023-01-26 16:36:36', b'0');
INSERT INTO `system_dict_data` VALUES (1227, 1, '通知公告', '1', 'system_notify_template_type', 0, 'primary', '', '站内信模版的类型 - 通知公告', '1', '2023-01-28 10:35:59', '1', '2023-01-28 10:35:59', b'0');
INSERT INTO `system_dict_data` VALUES (1228, 2, '系统消息', '2', 'system_notify_template_type', 0, 'success', '', '站内信模版的类型 - 系统消息', '1', '2023-01-28 10:36:20', '1', '2023-01-28 10:36:25', b'0');
INSERT INTO `system_dict_data` VALUES (1229, 0, '模拟支付', 'mock', 'pay_channel_code', 0, 'default', '', '模拟支付', '1', '2023-02-12 21:50:22', '1', '2023-07-10 10:11:02', b'0');
INSERT INTO `system_dict_data` VALUES (1230, 13, '支付宝条码支付', 'alipay_bar', 'pay_channel_code', 0, 'primary', '', '支付宝条码支付', '1', '2023-02-18 23:32:24', '1', '2023-07-19 20:09:23', b'0');
INSERT INTO `system_dict_data` VALUES (1231, 10, 'Vue2 Element UI 标准模版', '10', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:03:55', '1', '2023-04-13 00:03:55', b'0');
INSERT INTO `system_dict_data` VALUES (1232, 20, 'Vue3 Element Plus 标准模版', '20', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:08', '1', '2023-04-13 00:04:08', b'0');
INSERT INTO `system_dict_data` VALUES (1233, 21, 'Vue3 Element Plus Schema 模版', '21', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:26', '1', '2023-04-13 00:04:26', b'0');
INSERT INTO `system_dict_data` VALUES (1234, 30, 'Vue3 vben 模版', '30', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:26', '1', '2023-04-13 00:04:26', b'0');
INSERT INTO `system_dict_data` VALUES (1235, 1, '个', '1', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1236, 1, '件', '2', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1237, 1, '盒', '3', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1238, 1, '袋', '4', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1239, 1, '箱', '5', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1240, 1, '套', '6', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1241, 1, '包', '7', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1242, 1, '双', '8', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1243, 1, '卷', '9', 'product_unit', 0, '', '', '', '1', '2023-05-23 14:38:38', '1', '2023-05-23 14:38:38', b'0');
INSERT INTO `system_dict_data` VALUES (1244, 0, '按件', '1', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:46:40', '1', '2023-05-21 22:46:40', b'0');
INSERT INTO `system_dict_data` VALUES (1245, 1, '按重量', '2', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:46:58', '1', '2023-05-21 22:46:58', b'0');
INSERT INTO `system_dict_data` VALUES (1246, 2, '按体积', '3', 'trade_delivery_express_charge_mode', 0, '', '', '', '1', '2023-05-21 22:47:18', '1', '2023-05-21 22:47:18', b'0');
INSERT INTO `system_dict_data` VALUES (1335, 1, '购物', '1', 'member_point_biz_type', 0, '', '', '', '1', '2023-06-10 12:15:27', '1', '2023-06-28 13:48:28', b'0');
INSERT INTO `system_dict_data` VALUES (1336, 2, '签到', '2', 'member_point_biz_type', 0, '', '', '', '1', '2023-06-10 12:15:48', '1', '2023-06-28 13:48:31', b'0');
INSERT INTO `system_dict_data` VALUES (1337, 1, '订单创建', '1', 'member_point_status', 0, '', '', '', '1', '2023-06-10 12:16:42', '1', '2023-06-28 13:48:34', b'0');
INSERT INTO `system_dict_data` VALUES (1338, 2, '冻结期', '2', 'member_point_status', 0, '', '', '', '1', '2023-06-10 12:16:58', '1', '2023-06-28 13:48:36', b'0');
INSERT INTO `system_dict_data` VALUES (1339, 3, '完成', '3', 'member_point_status', 0, '', '', '', '1', '2023-06-10 12:17:07', '1', '2023-06-28 13:48:38', b'0');
INSERT INTO `system_dict_data` VALUES (1340, 4, '失效(订单退款)', '4', 'member_point_status', 0, '', '', '', '1', '2023-06-10 12:17:21', '1', '2023-06-28 13:48:42', b'0');
INSERT INTO `system_dict_data` VALUES (1341, 20, '已退款', '20', 'pay_order_status', 0, 'danger', '', '已退款', '1', '2023-07-19 18:05:37', '1', '2023-07-19 18:05:37', b'0');
INSERT INTO `system_dict_data` VALUES (1342, 21, '请求成功，但是结果失败', '21', 'pay_notify_status', 0, 'warning', '', '请求成功，但是结果失败', '1', '2023-07-19 18:10:47', '1', '2023-07-19 18:11:38', b'0');
INSERT INTO `system_dict_data` VALUES (1343, 22, '请求失败', '22', 'pay_notify_status', 0, 'warning', '', NULL, '1', '2023-07-19 18:11:05', '1', '2023-07-19 18:11:27', b'0');
INSERT INTO `system_dict_data` VALUES (1344, 4, '微信扫码支付', 'wx_native', 'pay_channel_code', 0, 'success', '', '微信扫码支付', '1', '2023-07-19 20:07:47', '1', '2023-07-19 20:09:03', b'0');
INSERT INTO `system_dict_data` VALUES (1345, 5, '微信条码支付', 'wx_bar', 'pay_channel_code', 0, 'success', '', '微信条码支付\n', '1', '2023-07-19 20:08:06', '1', '2023-07-19 20:09:08', b'0');
INSERT INTO `system_dict_data` VALUES (1346, 1, '支付单', '1', 'pay_notify_type', 0, 'primary', '', '支付单', '1', '2023-07-20 12:23:17', '1', '2023-07-20 12:23:17', b'0');
INSERT INTO `system_dict_data` VALUES (1347, 2, '退款单', '2', 'pay_notify_type', 0, 'danger', '', NULL, '1', '2023-07-20 12:23:26', '1', '2023-07-20 12:23:26', b'0');
INSERT INTO `system_dict_data` VALUES (1348, 0, '抵扣券', '1', 'member_coupon_type', 0, 'default', '', NULL, '1', '2023-07-26 11:36:31', '1', '2023-07-26 11:36:31', b'0');
INSERT INTO `system_dict_data` VALUES (1349, 0, '满减券', '2', 'member_coupon_type', 0, 'default', '', NULL, '1', '2023-07-26 11:36:38', '1', '2023-07-26 11:36:38', b'0');
INSERT INTO `system_dict_data` VALUES (1350, 0, '待使用', '0', 'member_coupon_status', 0, 'default', '', NULL, '1', '2023-07-26 11:37:04', '1', '2023-07-26 11:37:04', b'0');
INSERT INTO `system_dict_data` VALUES (1351, 1, '已使用', '1', 'member_coupon_status', 0, 'default', '', NULL, '1', '2023-07-26 11:37:11', '1', '2023-07-26 11:37:11', b'0');
INSERT INTO `system_dict_data` VALUES (1352, 2, '已过期', '2', 'member_coupon_status', 0, 'default', '', NULL, '1', '2023-07-26 11:37:18', '1', '2023-07-26 11:37:18', b'0');
INSERT INTO `system_dict_data` VALUES (1354, 1, '门禁', '1', 'member_device_type', 0, 'default', '', NULL, '1', '2023-07-26 11:38:05', '1', '2024-03-24 20:11:01', b'0');
INSERT INTO `system_dict_data` VALUES (1355, 2, '空开', '2', 'member_device_type', 0, 'default', '', NULL, '1', '2023-07-26 11:38:12', '1', '2024-03-24 20:11:07', b'0');
INSERT INTO `system_dict_data` VALUES (1356, 3, '云喇叭', '3', 'member_device_type', 0, 'default', '', NULL, '1', '2023-07-26 11:38:17', '1', '2024-03-24 20:11:10', b'0');
INSERT INTO `system_dict_data` VALUES (1357, 0, '禁用', '0', 'member_discount_rules_status', 0, 'default', '', NULL, '1', '2023-07-26 11:39:01', '1', '2023-07-26 11:39:01', b'0');
INSERT INTO `system_dict_data` VALUES (1358, 1, '启用', '1', 'member_discount_rules_status', 0, 'default', '', NULL, '1', '2023-07-26 11:39:08', '1', '2023-07-26 11:39:08', b'0');
INSERT INTO `system_dict_data` VALUES (1359, 2, '过期', '2', 'member_discount_rules_status', 0, 'default', '', NULL, '1', '2023-07-26 11:39:15', '1', '2023-07-26 11:39:15', b'0');
INSERT INTO `system_dict_data` VALUES (1360, 0, '组局中', '0', 'member_game_status', 0, 'default', '', NULL, '1', '2023-07-26 11:39:48', '1', '2023-07-26 11:39:48', b'0');
INSERT INTO `system_dict_data` VALUES (1361, 0, '已组局', '1', 'member_game_status', 0, 'default', '', NULL, '1', '2023-07-26 11:39:53', '1', '2023-07-26 11:39:53', b'0');
INSERT INTO `system_dict_data` VALUES (1362, 2, '已支付', '2', 'member_game_status', 0, 'default', '', NULL, '1', '2023-07-26 11:39:59', '1', '2023-07-26 11:39:59', b'0');
INSERT INTO `system_dict_data` VALUES (1363, 3, '已失效', '3', 'member_game_status', 0, 'default', '', NULL, '1', '2023-07-26 11:40:06', '1', '2023-07-26 11:40:06', b'0');
INSERT INTO `system_dict_data` VALUES (1364, 1, '微信', '1', 'member_order_pay_type', 0, 'default', '', NULL, '1', '2023-07-26 11:40:34', '1', '2024-07-20 11:54:53', b'0');
INSERT INTO `system_dict_data` VALUES (1365, 2, '余额', '2', 'member_order_pay_type', 0, 'default', '', NULL, '1', '2023-07-26 11:40:39', '1', '2023-07-26 11:40:39', b'0');
INSERT INTO `system_dict_data` VALUES (1366, 3, '团购', '3', 'member_order_pay_type', 0, 'default', '', NULL, '1', '2023-07-26 11:40:45', '1', '2023-10-13 21:55:56', b'0');
INSERT INTO `system_dict_data` VALUES (1367, 4, '套餐', '4', 'member_order_pay_type', 0, 'default', '', NULL, '1', '2023-07-26 11:40:58', '1', '2024-07-20 11:54:16', b'0');
INSERT INTO `system_dict_data` VALUES (1368, 5, '预订', '5', 'member_order_pay_type', 0, 'default', '', NULL, '1', '2023-07-26 11:41:17', '1', '2024-12-13 16:11:32', b'0');
INSERT INTO `system_dict_data` VALUES (1369, 0, '未开始', '0', 'member_order_status', 0, 'default', '', NULL, '1', '2023-07-26 11:42:20', '1', '2023-07-26 11:42:20', b'0');
INSERT INTO `system_dict_data` VALUES (1370, 1, '进行中', '1', 'member_order_status', 0, 'default', '', NULL, '1', '2023-07-26 11:42:26', '1', '2023-07-26 11:42:26', b'0');
INSERT INTO `system_dict_data` VALUES (1371, 2, '已完成 ', '2', 'member_order_status', 0, 'default', '', NULL, '1', '2023-07-26 11:42:34', '1', '2023-07-26 11:42:34', b'0');
INSERT INTO `system_dict_data` VALUES (1372, 3, '已取消', '3', 'member_order_status', 0, 'default', '', NULL, '1', '2023-07-26 11:42:39', '1', '2023-07-26 11:42:39', b'0');
INSERT INTO `system_dict_data` VALUES (1373, 0, '特价包', '0', 'member_room_type', 0, 'default', '', NULL, '1', '2023-07-26 11:43:08', '1', '2023-07-26 11:43:08', b'0');
INSERT INTO `system_dict_data` VALUES (1374, 1, '小包', '1', 'member_room_type', 0, 'default', '', NULL, '1', '2023-07-26 11:43:14', '1', '2023-07-26 11:43:14', b'0');
INSERT INTO `system_dict_data` VALUES (1375, 2, '中包', '2', 'member_room_type', 0, 'default', '', NULL, '1', '2023-07-26 11:43:21', '1', '2023-07-26 11:43:21', b'0');
INSERT INTO `system_dict_data` VALUES (1376, 3, '大包', '3', 'member_room_type', 0, 'default', '', NULL, '1', '2023-07-26 11:43:27', '1', '2023-07-26 11:43:27', b'0');
INSERT INTO `system_dict_data` VALUES (1377, 0, '禁用', '0', 'member_room_status', 0, 'default', '', NULL, '1', '2023-07-26 11:43:56', '1', '2023-07-26 11:43:56', b'0');
INSERT INTO `system_dict_data` VALUES (1378, 1, '空闲', '1', 'member_room_status', 0, 'default', '', NULL, '1', '2023-07-26 11:44:04', '1', '2023-07-26 11:44:04', b'0');
INSERT INTO `system_dict_data` VALUES (1379, 2, '待清洁', '2', 'member_room_status', 0, 'default', '', NULL, '1', '2023-07-26 11:44:10', '1', '2023-07-26 11:44:10', b'0');
INSERT INTO `system_dict_data` VALUES (1380, 3, '使用中', '3', 'member_room_status', 0, 'default', '', NULL, '1', '2023-07-26 11:44:19', '1', '2023-07-26 11:44:19', b'0');
INSERT INTO `system_dict_data` VALUES (1381, 4, '已预约', '4', 'member_room_status', 0, 'default', '', NULL, '1', '2023-07-26 11:44:26', '1', '2023-07-26 11:44:26', b'0');
INSERT INTO `system_dict_data` VALUES (1382, 0, '60玉石麻将', '0', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:45:15', '1', '2023-07-26 11:45:15', b'0');
INSERT INTO `system_dict_data` VALUES (1383, 1, 'WIFI', '1', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:45:22', '1', '2023-07-26 11:45:22', b'0');
INSERT INTO `system_dict_data` VALUES (1384, 2, '免费茶水', '2', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:45:31', '1', '2023-07-26 11:45:31', b'0');
INSERT INTO `system_dict_data` VALUES (1385, 3, '沙发', '3', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:46:17', '1', '2023-07-26 11:46:17', b'0');
INSERT INTO `system_dict_data` VALUES (1386, 4, '落地窗', '4', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:46:31', '1', '2023-07-26 11:46:31', b'0');
INSERT INTO `system_dict_data` VALUES (1387, 5, '无窗户', '5', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:46:38', '1', '2023-07-26 11:46:38', b'0');
INSERT INTO `system_dict_data` VALUES (1388, 6, '内窗', '6', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:46:51', '1', '2023-07-26 11:46:51', b'0');
INSERT INTO `system_dict_data` VALUES (1389, 7, '独立卫生间', '7', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:47:07', '1', '2023-07-26 11:47:07', b'0');
INSERT INTO `system_dict_data` VALUES (1390, 8, '舒适座椅', '8', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:47:23', '1', '2023-07-26 11:47:23', b'0');
INSERT INTO `system_dict_data` VALUES (1391, 9, '新风', '9', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:47:33', '1', '2023-07-26 11:47:33', b'0');
INSERT INTO `system_dict_data` VALUES (1392, 10, '每日特价', '10', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:47:46', '1', '2023-07-26 11:47:46', b'0');
INSERT INTO `system_dict_data` VALUES (1393, 12, '空调', '12', 'member_room_label', 0, 'default', '', NULL, '1', '2023-07-26 11:47:57', '1', '2023-07-26 11:47:57', b'0');
INSERT INTO `system_dict_data` VALUES (1394, 0, '创建者', '1', 'member_store_user_type', 0, 'default', '', NULL, '1', '2023-07-26 11:49:13', '1', '2023-07-26 11:49:13', b'0');
INSERT INTO `system_dict_data` VALUES (1395, 2, '管理员', '2', 'member_store_user_type', 0, 'default', '', NULL, '1', '2023-07-26 11:49:18', '1', '2023-07-26 11:49:18', b'0');
INSERT INTO `system_dict_data` VALUES (1396, 3, '保洁员', '3', 'member_store_user_type', 0, 'default', '', NULL, '1', '2023-07-26 11:49:25', '1', '2023-07-26 11:49:25', b'0');
INSERT INTO `system_dict_data` VALUES (1397, 0, '在线充值', '1', 'member_user_money_bill_type', 0, 'default', '', NULL, '1', '2023-07-26 11:49:55', '1', '2023-07-26 11:49:55', b'0');
INSERT INTO `system_dict_data` VALUES (1398, 2, '充值赠送', '2', 'member_user_money_bill_type', 0, 'default', '', NULL, '1', '2023-07-26 11:50:00', '1', '2023-07-26 11:50:05', b'0');
INSERT INTO `system_dict_data` VALUES (1399, 3, '订单支付', '3', 'member_user_money_bill_type', 0, 'default', '', NULL, '1', '2023-07-26 11:50:11', '1', '2023-07-26 11:50:11', b'0');
INSERT INTO `system_dict_data` VALUES (1400, 4, '订单退款', '4', 'member_user_money_bill_type', 0, 'default', '', NULL, '1', '2023-07-26 11:50:20', '1', '2023-07-26 11:50:20', b'0');
INSERT INTO `system_dict_data` VALUES (1401, 0, '账户余额', '1', 'member_user_money_type', 0, 'default', '', NULL, '1', '2023-07-26 11:51:07', '1', '2023-07-26 11:51:07', b'0');
INSERT INTO `system_dict_data` VALUES (1402, 2, '赠送余额', '2', 'member_user_money_type', 0, 'default', '', NULL, '1', '2023-07-26 11:51:12', '1', '2023-07-26 11:51:12', b'0');
INSERT INTO `system_dict_data` VALUES (1403, 0, '已提交', '0', 'member_user_withdrawal', 0, 'default', '', NULL, '1', '2023-07-26 11:51:43', '1', '2023-07-26 11:51:43', b'0');
INSERT INTO `system_dict_data` VALUES (1404, 1, '已完成', '1', 'member_user_withdrawal', 0, 'default', '', NULL, '1', '2023-07-26 11:51:49', '1', '2023-07-26 11:51:49', b'0');
INSERT INTO `system_dict_data` VALUES (1405, 0, '已提交', '0', 'member_franchise_status', 0, 'default', '', NULL, '1', '2023-07-26 16:52:04', '1', '2023-07-26 16:52:04', b'0');
INSERT INTO `system_dict_data` VALUES (1406, 1, '已跟进', '1', 'member_franchise_status', 0, 'default', '', NULL, '1', '2023-07-26 16:52:09', '1', '2023-07-26 16:52:20', b'0');
INSERT INTO `system_dict_data` VALUES (1407, 2, '已成交', '2', 'member_franchise_status', 0, 'default', '', NULL, '1', '2023-07-26 16:52:16', '1', '2023-07-26 16:52:16', b'0');
INSERT INTO `system_dict_data` VALUES (1411, 0, '首页', '1', 'member_banner_type', 0, 'default', '', NULL, '1', '2023-07-28 09:56:15', '1', '2023-07-28 09:56:15', b'0');
INSERT INTO `system_dict_data` VALUES (1412, 0, '个人中心', '2', 'member_banner_type', 0, 'default', '', NULL, '1', '2023-07-28 09:56:19', '1', '2023-07-28 09:56:19', b'0');
INSERT INTO `system_dict_data` VALUES (1413, 0, '用户', '11', 'member_user_type', 0, 'info', '', NULL, '1', '2023-07-28 15:54:10', '1', '2023-07-28 17:58:07', b'0');
INSERT INTO `system_dict_data` VALUES (1414, 2, '管理员', '13', 'member_user_type', 0, 'success', '', NULL, '1', '2023-07-28 15:54:17', '1', '2023-07-28 17:05:58', b'0');
INSERT INTO `system_dict_data` VALUES (1415, 3, '保洁', '14', 'member_user_type', 0, 'default', '', NULL, '1', '2023-07-28 15:54:26', '1', '2023-07-28 17:58:13', b'0');
INSERT INTO `system_dict_data` VALUES (1416, 1, '加盟商', '12', 'member_user_type', 0, 'success', '', NULL, '1', '2023-07-28 16:03:46', '1', '2023-07-28 17:05:54', b'0');
INSERT INTO `system_dict_data` VALUES (1417, 0, '普通用户', '11', 'user_type', 0, 'info', '', NULL, '1', '2023-07-28 17:20:21', '1', '2023-07-28 17:20:21', b'0');
INSERT INTO `system_dict_data` VALUES (1418, 3, '门店管理员', '13', 'user_type', 0, 'primary', '', NULL, '1', '2023-07-28 17:21:13', '1', '2023-07-28 17:21:13', b'0');
INSERT INTO `system_dict_data` VALUES (1419, 4, '保洁员', '14', 'user_type', 0, 'default', '', NULL, '1', '2023-07-28 17:21:33', '1', '2023-08-28 14:20:19', b'0');
INSERT INTO `system_dict_data` VALUES (1420, 0, '待接单', '0', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 21:51:19', '1', '2023-07-29 21:51:33', b'0');
INSERT INTO `system_dict_data` VALUES (1421, 1, '已接单', '1', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 21:51:36', '1', '2023-07-29 21:51:36', b'0');
INSERT INTO `system_dict_data` VALUES (1422, 3, '已完成', '3', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 21:51:42', '1', '2023-07-29 22:15:21', b'0');
INSERT INTO `system_dict_data` VALUES (1423, 4, '已取消', '4', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 21:51:47', '1', '2023-07-29 22:15:18', b'0');
INSERT INTO `system_dict_data` VALUES (1424, 5, '被投诉', '5', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 21:51:53', '1', '2023-07-29 22:15:14', b'0');
INSERT INTO `system_dict_data` VALUES (1425, 6, '已结算', '6', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 21:52:00', '1', '2023-07-29 22:15:10', b'0');
INSERT INTO `system_dict_data` VALUES (1426, 2, '已开始', '2', 'member_clear_info_status', 0, 'default', '', NULL, '1', '2023-07-29 22:15:27', '1', '2023-07-29 22:15:27', b'0');
INSERT INTO `system_dict_data` VALUES (1427, 4, '待支付', '4', 'member_order_status', 0, 'default', '', NULL, '1', '2023-07-30 17:29:14', '1', '2023-07-30 20:52:39', b'1');
INSERT INTO `system_dict_data` VALUES (1428, 0, '正常', '0', 'member_store_status', 0, 'default', '', NULL, '1', '2023-08-29 15:01:11', '1', '2023-08-29 15:01:37', b'0');
INSERT INTO `system_dict_data` VALUES (1429, 2, '停用中', '2', 'member_store_status', 0, 'default', '', NULL, '1', '2023-08-29 15:01:28', '1', '2023-08-29 15:01:28', b'0');
INSERT INTO `system_dict_data` VALUES (1430, 1, '审核中', '1', 'member_store_status', 0, 'default', '', NULL, '1', '2023-08-29 15:01:45', '1', '2023-08-29 15:01:45', b'0');
INSERT INTO `system_dict_data` VALUES (1431, 4, '已解散', '4', 'member_game_status', 0, 'default', '', NULL, '1', '2023-08-30 10:34:40', '1', '2023-08-30 10:34:40', b'0');
INSERT INTO `system_dict_data` VALUES (1432, 13, '有窗', '13', 'member_room_label', 0, 'default', '', NULL, '1', '2023-09-16 11:44:15', '1', '2023-09-16 11:44:15', b'0');
INSERT INTO `system_dict_data` VALUES (1433, 5, '管理员赠送', '5', 'member_user_money_bill_type', 0, 'default', '', NULL, '1', '2023-09-22 10:43:26', '1', '2023-09-22 10:43:26', b'0');
INSERT INTO `system_dict_data` VALUES (1434, 1, '美团', '1', 'member_group_no_type', 0, 'default', '', NULL, '1', '2023-10-09 13:26:51', '1', '2024-07-20 12:07:01', b'0');
INSERT INTO `system_dict_data` VALUES (1435, 2, '抖音', '2', 'member_group_no_type', 0, 'default', '', NULL, '1', '2023-10-09 13:26:56', '1', '2023-10-09 13:26:56', b'0');
INSERT INTO `system_dict_data` VALUES (1436, 4, '未支付', '4', 'member_order_status', 0, 'default', '', NULL, '1', '2023-10-27 17:50:11', '1', '2023-10-27 17:50:11', b'0');
INSERT INTO `system_dict_data` VALUES (1437, 4, '灯具', '4', 'member_device_type', 0, 'default', '', NULL, '1', '2024-03-24 20:10:31', '1', '2024-03-24 20:10:31', b'0');
INSERT INTO `system_dict_data` VALUES (1438, 5, '密码锁', '5', 'member_device_type', 0, 'default', '', NULL, '1', '2024-03-24 20:10:56', '1', '2024-03-24 20:10:56', b'0');
INSERT INTO `system_dict_data` VALUES (1439, 0, '棋牌', '0', 'member_room_class', 0, 'default', '', NULL, '1', '2024-03-24 20:11:55', '1', '2024-03-24 20:11:55', b'0');
INSERT INTO `system_dict_data` VALUES (1440, 1, '台球', '1', 'member_room_class', 0, 'default', '', NULL, '1', '2024-03-24 20:11:59', '1', '2024-03-24 20:11:59', b'0');
INSERT INTO `system_dict_data` VALUES (1441, 2, '自习室', '2', 'member_room_class', 0, 'default', '', NULL, '1', '2024-03-24 20:14:02', '1', '2024-03-24 20:14:02', b'0');
INSERT INTO `system_dict_data` VALUES (1442, 6, '网关', '6', 'member_device_type', 0, 'default', '', NULL, '1', '2024-03-24 20:16:32', '1', '2024-03-24 20:16:41', b'0');
INSERT INTO `system_dict_data` VALUES (1443, 3, '加时券', '3', 'member_coupon_type', 0, 'default', '', NULL, '1', '2024-04-27 13:18:08', '1', '2024-04-27 13:18:08', b'0');
INSERT INTO `system_dict_data` VALUES (1444, 7, '插座', '7', 'member_device_type', 0, 'default', '', NULL, '1', '2024-05-12 19:23:38', '1', '2024-05-12 19:23:38', b'0');
INSERT INTO `system_dict_data` VALUES (1445, 4, '豪包', '4', 'member_room_type', 0, 'default', '', NULL, '1', '2024-06-02 14:17:20', '1', '2024-06-02 14:17:20', b'0');
INSERT INTO `system_dict_data` VALUES (1446, 5, '商务包', '5', 'member_room_type', 0, 'default', '', NULL, '1', '2024-06-09 09:27:33', '1', '2024-06-09 09:27:33', b'0');
INSERT INTO `system_dict_data` VALUES (1447, 3, '快手', '3', 'member_group_no_type', 0, '', '', NULL, 'admin', '2024-07-20 12:06:29', '', '2024-07-20 12:06:32', b'0');
INSERT INTO `system_dict_data` VALUES (1448, 8, '锁球器控制器（12V）', '8', 'member_device_type', 0, 'default', '', NULL, '1', '2024-09-15 17:48:55', '1', '2024-09-15 17:48:55', b'0');
INSERT INTO `system_dict_data` VALUES (1449, 9, '人脸门禁机', '9', 'member_device_type', 0, 'default', '', NULL, '1', '2024-09-15 17:49:09', '1', '2024-09-15 17:49:09', b'0');
INSERT INTO `system_dict_data` VALUES (1450, 10, '智能语音喇叭', '10', 'member_device_type', 0, 'default', '', NULL, '1', '2024-09-15 17:49:21', '1', '2024-09-15 17:49:21', b'0');
INSERT INTO `system_dict_data` VALUES (1451, 11, '二维码识别器', '11', 'member_device_type', 0, 'default', '', NULL, '1', '2024-09-15 17:50:48', '1', '2024-09-15 17:50:48', b'0');
INSERT INTO `system_dict_data` VALUES (1452, 12, '红外控制器', '12', 'member_device_type', 0, 'default', '', NULL, '1', '2024-10-21 18:18:30', '1', '2024-10-21 18:18:30', b'0');
INSERT INTO `system_dict_data` VALUES (1453, 13, '三路控制器', '13', 'member_device_type', 0, 'default', '', NULL, '1', '2024-10-21 18:18:38', '1', '2024-10-21 18:18:38', b'0');
INSERT INTO `system_dict_data` VALUES (1454, 6, '斯洛克', '6', 'member_room_type', 0, 'default', '', NULL, '1', '2024-12-13 16:11:01', '1', '2024-12-13 16:11:01', b'0');
INSERT INTO `system_dict_data` VALUES (1455, 7, '中式黑八', '7', 'member_room_type', 0, 'default', '', NULL, '1', '2024-12-13 16:11:06', '1', '2024-12-13 16:11:06', b'0');
INSERT INTO `system_dict_data` VALUES (1456, 8, '美式球桌', '8', 'member_room_type', 0, 'default', '', NULL, '1', '2024-12-13 16:11:11', '1', '2024-12-13 16:11:11', b'0');
INSERT INTO `system_dict_data` VALUES (1457, 0, '管理员', '0', 'member_order_pay_type', 0, 'default', '', NULL, '1', '2024-12-13 16:11:52', '1', '2024-12-13 16:11:52', b'0');

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
INSERT INTO `system_dict_type` VALUES (1, '用户性别', 'system_user_sex', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-05-16 20:29:32', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (6, '参数类型', 'infra_config_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:36:54', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (7, '通知类型', 'system_notice_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:35:26', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (9, '操作类型', 'system_operate_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 09:32:21', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (10, '系统状态', 'common_status', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:21:28', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (11, 'Boolean 是否类型', 'infra_boolean_string', 0, 'boolean 转是否', '', '2021-01-19 03:20:08', '', '2022-02-01 16:37:10', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (104, '登陆结果', 'system_login_result', 0, '登陆结果', '', '2021-01-18 06:17:11', '', '2022-02-01 16:36:00', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (105, 'Redis 超时类型', 'infra_redis_timeout_type', 0, 'RedisKeyDefine.TimeoutTypeEnum', '', '2021-01-26 00:52:50', '', '2022-02-01 16:50:29', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (106, '代码生成模板类型', 'infra_codegen_template_type', 0, NULL, '', '2021-02-05 07:08:06', '1', '2022-05-16 20:26:50', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (107, '定时任务状态', 'infra_job_status', 0, NULL, '', '2021-02-07 07:44:16', '', '2022-02-01 16:51:11', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (108, '定时任务日志状态', 'infra_job_log_status', 0, NULL, '', '2021-02-08 10:03:51', '', '2022-02-01 16:50:43', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (109, '用户类型', 'user_type', 0, NULL, '', '2021-02-26 00:15:51', '', '2021-02-26 00:15:51', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (110, 'API 异常数据的处理状态', 'infra_api_error_log_process_status', 0, NULL, '', '2021-02-26 07:07:01', '', '2022-02-01 16:50:53', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (111, '短信渠道编码', 'system_sms_channel_code', 0, NULL, '1', '2021-04-05 01:04:50', '1', '2022-02-16 02:09:08', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (112, '短信模板的类型', 'system_sms_template_type', 0, NULL, '1', '2021-04-05 21:50:43', '1', '2022-02-01 16:35:06', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (113, '短信发送状态', 'system_sms_send_status', 0, NULL, '1', '2021-04-11 20:18:03', '1', '2022-02-01 16:35:09', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (114, '短信接收状态', 'system_sms_receive_status', 0, NULL, '1', '2021-04-11 20:27:14', '1', '2022-02-01 16:35:14', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (115, '错误码的类型', 'system_error_code_type', 0, NULL, '1', '2021-04-21 00:06:30', '1', '2022-02-01 16:36:49', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (116, '登陆日志的类型', 'system_login_type', 0, '登陆日志的类型', '1', '2021-10-06 00:50:46', '1', '2022-02-01 16:35:56', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (130, '支付渠道编码类型', 'pay_channel_code', 0, '支付渠道的编码', '1', '2021-12-03 10:35:08', '1', '2023-07-10 10:11:39', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (131, '支付回调状态', 'pay_notify_status', 0, '支付回调状态（包括退款回调）', '1', '2021-12-03 10:53:29', '1', '2023-07-19 18:09:43', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (132, '支付订单状态', 'pay_order_status', 0, '支付订单状态', '1', '2021-12-03 11:17:50', '1', '2021-12-03 11:17:50', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (134, '退款订单状态', 'pay_refund_status', 0, '退款订单状态', '1', '2021-12-10 16:42:50', '1', '2023-07-19 10:13:17', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (144, '代码生成的场景枚举', 'infra_codegen_scene', 0, '代码生成的场景枚举', '1', '2022-02-02 13:14:45', '1', '2022-03-10 16:33:46', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (145, '角色类型', 'system_role_type', 0, '角色类型', '1', '2022-02-16 13:01:46', '1', '2022-02-16 13:01:46', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (146, '文件存储器', 'infra_file_storage', 0, '文件存储器', '1', '2022-03-15 00:24:38', '1', '2022-03-15 00:24:38', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (147, 'OAuth 2.0 授权类型', 'system_oauth2_grant_type', 0, 'OAuth 2.0 授权类型（模式）', '1', '2022-05-12 00:20:52', '1', '2022-05-11 16:25:49', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (149, '商品 SPU 状态', 'product_spu_status', 0, '商品 SPU 状态', '1', '2022-10-24 21:19:04', '1', '2022-10-24 21:19:08', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (150, '优惠类型', 'promotion_discount_type', 0, '优惠类型', '1', '2022-11-01 12:46:06', '1', '2022-11-01 12:46:06', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (151, '优惠劵模板的有限期类型', 'promotion_coupon_template_validity_type', 0, '优惠劵模板的有限期类型', '1', '2022-11-02 00:06:20', '1', '2022-11-04 00:08:26', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (152, '营销的商品范围', 'promotion_product_scope', 0, '营销的商品范围', '1', '2022-11-02 00:28:01', '1', '2022-11-02 00:28:01', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (153, '优惠劵的状态', 'promotion_coupon_status', 0, '优惠劵的状态', '1', '2022-11-04 00:14:49', '1', '2022-11-04 00:14:49', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (154, '优惠劵的领取方式', 'promotion_coupon_take_type', 0, '优惠劵的领取方式', '1', '2022-11-04 19:12:27', '1', '2022-11-04 19:12:27', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (155, '促销活动的状态', 'promotion_activity_status', 0, '促销活动的状态', '1', '2022-11-04 22:54:23', '1', '2022-11-04 22:54:23', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (156, '营销的条件类型', 'promotion_condition_type', 0, '营销的条件类型', '1', '2022-11-04 22:59:23', '1', '2022-11-04 22:59:23', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (157, '交易售后状态', 'trade_after_sale_status', 0, '交易售后状态', '1', '2022-11-19 20:52:56', '1', '2022-11-19 20:52:56', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (158, '交易售后的类型', 'trade_after_sale_type', 0, '交易售后的类型', '1', '2022-11-19 21:04:09', '1', '2022-11-19 21:04:09', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (159, '交易售后的方式', 'trade_after_sale_way', 0, '交易售后的方式', '1', '2022-11-19 21:39:04', '1', '2022-11-19 21:39:04', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (160, '终端', 'terminal', 0, '终端', '1', '2022-12-10 10:50:50', '1', '2022-12-10 10:53:11', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (161, '交易订单的类型', 'trade_order_type', 0, '交易订单的类型', '1', '2022-12-10 16:33:54', '1', '2022-12-10 16:33:54', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (162, '交易订单的状态', 'trade_order_status', 0, '交易订单的状态', '1', '2022-12-10 16:48:44', '1', '2022-12-10 16:48:44', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (163, '交易订单项的售后状态', 'trade_order_item_after_sale_status', 0, '交易订单项的售后状态', '1', '2022-12-10 20:58:08', '1', '2022-12-10 20:58:08', b'0', NULL);
INSERT INTO `system_dict_type` VALUES (164, '公众号自动回复的请求关键字匹配模式', 'mp_auto_reply_request_match', 0, '公众号自动回复的请求关键字匹配模式', '1', '2023-01-16 23:29:56', '1', '2023-01-16 23:29:56', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (165, '公众号的消息类型', 'mp_message_type', 0, '公众号的消息类型', '1', '2023-01-17 22:17:09', '1', '2023-01-17 22:17:09', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (166, '邮件发送状态', 'system_mail_send_status', 0, '邮件发送状态', '1', '2023-01-26 09:53:13', '1', '2023-01-26 09:53:13', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (167, '站内信模版的类型', 'system_notify_template_type', 0, '站内信模版的类型', '1', '2023-01-28 10:35:10', '1', '2023-01-28 10:35:10', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (168, '代码生成的前端类型', 'infra_codegen_front_type', 0, '', '1', '2023-04-12 23:57:52', '1', '2023-04-12 23:57:52', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (169, '商品的单位', 'product_unit', 0, '商品的单位', '1', '2023-05-24 21:23:59', '1', '2023-05-24 21:23:59', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (170, '快递计费方式', 'trade_delivery_express_charge_mode', 0, '用于商城交易模块配送管理', '1', '2023-05-21 22:45:03', '1', '2023-05-21 22:45:03', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (171, '积分业务类型', 'member_point_biz_type', 0, '', '1', '2023-06-10 12:15:00', '1', '2023-06-28 13:48:20', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (172, '积分订单状态', 'member_point_status', 0, '', '1', '2023-06-10 12:16:27', '1', '2023-06-28 13:48:17', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (173, '支付通知类型', 'pay_notify_type', 0, NULL, '1', '2023-07-20 12:23:03', '1', '2023-07-20 12:23:03', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (174, 'miniapp保洁信息状态', 'member_clear_info_status', 0, NULL, '1', '2023-07-24 21:18:20', '1', '2023-07-27 16:47:50', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (175, 'miniapp优惠券类型', 'member_coupon_type', 0, NULL, '1', '2023-07-26 11:36:21', '1', '2023-07-27 16:47:47', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (176, 'miniapp优惠券状态', 'member_coupon_status', 0, NULL, '1', '2023-07-26 11:36:51', '1', '2023-07-27 16:47:45', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (177, 'miniapp设备类型', 'member_device_type', 0, NULL, '1', '2023-07-26 11:37:58', '1', '2023-07-27 16:47:41', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (178, 'miniapp充值优惠规则状态', 'member_discount_rules_status', 0, NULL, '1', '2023-07-26 11:38:49', '1', '2023-07-27 16:47:39', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (179, 'miniapp在线组局状态', 'member_game_status', 0, NULL, '1', '2023-07-26 11:39:38', '1', '2023-07-27 16:47:36', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (180, 'miniapp订单支付方式', 'member_order_pay_type', 0, NULL, '1', '2023-07-26 11:40:27', '1', '2023-07-27 16:47:32', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (181, 'miniapp订单支付状态', 'member_order_status', 0, NULL, '1', '2023-07-26 11:42:11', '1', '2023-07-27 16:47:30', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (182, 'miniapp房间类型', 'member_room_type', 0, NULL, '1', '2023-07-26 11:42:59', '1', '2023-07-27 16:47:27', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (183, 'miniapp房间使用状态', 'member_room_status', 0, NULL, '1', '2023-07-26 11:43:49', '1', '2023-07-27 16:47:24', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (184, 'miniapp房间标签', 'member_room_label', 0, NULL, '1', '2023-07-26 11:45:04', '1', '2023-07-27 16:47:22', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (185, 'miniapp门店用户类型', 'member_store_user_type', 0, NULL, '1', '2023-07-26 11:49:04', '1', '2023-07-27 16:47:19', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (186, 'miniapp用户账单明细类型', 'member_user_money_bill_type', 0, NULL, '1', '2023-07-26 11:49:45', '1', '2023-07-27 16:47:16', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (187, 'miniapp用户账单金额类型', 'member_user_money_type', 0, NULL, '1', '2023-07-26 11:51:01', '1', '2023-07-27 16:47:13', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (188, 'miniapp用户提现记录状态', 'member_user_withdrawal', 0, NULL, '1', '2023-07-26 11:51:35', '1', '2023-07-27 16:47:10', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (189, 'miniapp用户加盟信息状态', 'member_franchise_status', 0, NULL, '1', '2023-07-26 16:51:56', '1', '2023-07-27 16:47:08', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (205, 'miniapp广告类型', 'member_banner_type', 0, NULL, '1', '2023-07-28 09:56:06', '1', '2023-07-28 09:56:06', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (206, 'miniapp用户类型', 'member_user_type', 0, NULL, '1', '2023-07-28 15:53:05', '1', '2023-07-28 15:53:05', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (207, 'miniapp门店状态', 'member_store_status', 0, NULL, '1', '2023-08-29 15:01:00', '1', '2023-08-29 15:01:00', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` VALUES (208, 'miniapp房间类别', 'room_class', 0, NULL, '1', '2024-03-24 20:11:28', '1', '2024-03-24 20:11:36', b'1', '2024-03-24 20:11:37');
INSERT INTO `system_dict_type` VALUES (209, 'miniapp房间类别', 'member_room_class', 0, NULL, '1', '2024-03-24 20:11:49', '1', '2024-03-24 20:11:49', b'0', '1970-01-01 00:00:00');

-- ----------------------------
-- Table structure for system_error_code
-- ----------------------------
DROP TABLE IF EXISTS `system_error_code`;
CREATE TABLE `system_error_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '错误码编号',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '错误码类型',
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `code` int NOT NULL DEFAULT 0 COMMENT '错误码编码',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '错误码错误提示',
  `memo` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5833 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '错误码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_error_code
-- ----------------------------

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `log_type` bigint NOT NULL COMMENT '日志类型',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '用户类型',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `result` tinyint NOT NULL COMMENT '登陆结果',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户 IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '浏览器 UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_mail_account
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_account`;
CREATE TABLE `system_mail_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP 服务器域名',
  `port` int NOT NULL COMMENT 'SMTP 服务器端口',
  `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否开启 SSL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
INSERT INTO `system_mail_account` VALUES (1, '7684413@qq.com', '7684413@qq.com', '123457', '127.0.0.1', 8080, b'0', '1', '2023-01-25 17:39:52', '1', '2023-04-12 23:04:49', b'0');
INSERT INTO `system_mail_account` VALUES (2, 'ydym_test@163.com', 'ydym_test@163.com', 'WBZTEINMIFVRYSOE', 'smtp.163.com', 465, b'1', '1', '2023-01-26 01:26:03', '1', '2023-04-12 22:39:38', b'0');
INSERT INTO `system_mail_account` VALUES (3, '76854114@qq.com', '3335', '11234', 'yunai1.cn', 466, b'0', '1', '2023-01-27 15:06:38', '1', '2023-01-27 07:08:36', b'1');
INSERT INTO `system_mail_account` VALUES (4, '7685413x@qq.com', '2', '3', '4', 5, b'1', '1', '2023-04-12 23:05:06', '1', '2023-04-12 15:05:11', b'1');

-- ----------------------------
-- Table structure for system_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_log`;
CREATE TABLE `system_mail_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '用户类型',
  `to_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接收邮箱地址',
  `account_id` bigint NOT NULL COMMENT '邮箱账号编号',
  `from_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送邮箱地址',
  `template_id` bigint NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模版发送人名称',
  `template_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件标题',
  `template_content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮件参数',
  `send_status` tinyint NOT NULL DEFAULT 0 COMMENT '发送状态',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `send_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送返回的消息 ID',
  `send_exception` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送异常',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 354 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮件日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_mail_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_mail_template
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_template`;
CREATE TABLE `system_mail_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `account_id` bigint NOT NULL COMMENT '发送的邮箱账号编号',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送人名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板标题',
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮件模版表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_mail_template
-- ----------------------------
INSERT INTO `system_mail_template` VALUES (13, '后台用户短信登录', 'admin-sms-login', 1, '奥特曼', '你猜我猜', '<p>您的验证码是{code}，名字是{name}</p>', '[\"code\",\"name\"]', 0, '3', '1', '2021-10-11 08:10:00', '1', '2023-01-26 23:22:05', b'0');
INSERT INTO `system_mail_template` VALUES (14, '测试模版', 'test_01', 2, '芋艿', '一个标题', '<p>你是 {key01} 吗？</p><p><br></p><p>是的话，赶紧 {key02} 一下！</p>', '[\"key01\",\"key02\"]', 0, NULL, '1', '2023-01-26 01:27:40', '1', '2023-01-27 10:32:16', b'0');
INSERT INTO `system_mail_template` VALUES (15, '3', '2', 2, '7', '4', '<p>45</p>', '[]', 1, '80', '1', '2023-01-27 15:50:35', '1', '2023-01-27 16:34:49', b'0');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `type` tinyint NOT NULL COMMENT '菜单类型',
  `sort` int NOT NULL DEFAULT 0 COMMENT '显示顺序',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父菜单ID',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件名',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '菜单状态',
  `visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可见',
  `keep_alive` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否缓存',
  `always_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否总是显示',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2362 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '系统管理', '', 1, 10, 0, '/system', 'system', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (2, '基础设施', '', 1, 20, 0, '/infra', 'monitor', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (5, 'OA 示例', '', 1, 40, 1185, 'oa', 'people', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-09-20 16:26:19', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (100, '用户管理', 'system:user:list', 2, 1, 1, 'user', 'user', 'system/user/index', 'SystemUser', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:31:59', b'0');
INSERT INTO `system_menu` VALUES (101, '角色管理', '', 2, 2, 1, 'role', 'peoples', 'system/role/index', 'SystemRole', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:33:59', b'0');
INSERT INTO `system_menu` VALUES (102, '菜单管理', '', 2, 3, 1, 'menu', 'tree-table', 'system/menu/index', 'SystemMenu', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:34:32', b'0');
INSERT INTO `system_menu` VALUES (103, '部门管理', '', 2, 4, 1, 'dept', 'tree', 'system/dept/index', 'SystemDept', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:35:32', b'0');
INSERT INTO `system_menu` VALUES (104, '岗位管理', '', 2, 5, 1, 'post', 'post', 'system/post/index', 'SystemPost', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:36:21', b'0');
INSERT INTO `system_menu` VALUES (105, '字典管理', '', 2, 6, 1, 'dict', 'dict', 'system/dict/index', 'SystemDictType', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:36:45', b'0');
INSERT INTO `system_menu` VALUES (106, '配置管理', '', 2, 6, 2, 'config', 'edit', 'infra/config/index', 'InfraConfig', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:31:17', b'0');
INSERT INTO `system_menu` VALUES (107, '通知公告', '', 2, 8, 1, 'notice', 'message', 'system/notice/index', 'SystemNotice', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:45:06', b'0');
INSERT INTO `system_menu` VALUES (108, '审计日志', '', 1, 9, 1, 'log', 'log', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (109, '令牌管理', '', 2, 2, 1261, 'token', 'online', 'system/oauth2/token/index', 'SystemTokenClient', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:47:41', b'0');
INSERT INTO `system_menu` VALUES (110, '定时任务', '', 2, 12, 2, 'job', 'job', 'infra/job/index', 'InfraJob', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:36:49', b'0');
INSERT INTO `system_menu` VALUES (111, 'MySQL 监控', '', 2, 9, 2, 'druid', 'druid', 'infra/druid/index', 'InfraDruid', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:09:30', b'0');
INSERT INTO `system_menu` VALUES (112, 'Java 监控', '', 2, 11, 2, 'admin-server', 'server', 'infra/server/index', 'InfraAdminServer', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:34:08', b'0');
INSERT INTO `system_menu` VALUES (113, 'Redis 监控', '', 2, 10, 2, 'redis', 'redis', 'infra/redis/index', 'InfraRedis', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 10:33:30', b'0');
INSERT INTO `system_menu` VALUES (114, '表单构建', 'infra:build:list', 2, 2, 2, 'build', 'build', 'infra/build/index', 'InfraBuild', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:06:12', b'0');
INSERT INTO `system_menu` VALUES (115, '代码生成', 'infra:codegen:query', 2, 1, 2, 'codegen', 'code', 'infra/codegen/index', 'InfraCodegen', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:02:24', b'0');
INSERT INTO `system_menu` VALUES (116, '系统接口', 'infra:swagger:list', 2, 3, 2, 'swagger', 'swagger', 'infra/swagger/index', 'InfraSwagger', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 09:11:28', b'0');
INSERT INTO `system_menu` VALUES (500, '操作日志', '', 2, 1, 108, 'operate-log', 'form', 'system/operatelog/index', 'SystemOperateLog', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:47:00', b'0');
INSERT INTO `system_menu` VALUES (501, '登录日志', '', 2, 2, 108, 'login-log', 'logininfor', 'system/loginlog/index', 'SystemLoginLog', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2023-04-08 08:46:18', b'0');
INSERT INTO `system_menu` VALUES (1001, '用户查询', 'system:user:query', 3, 1, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1002, '用户新增', 'system:user:create', 3, 2, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1003, '用户修改', 'system:user:update', 3, 3, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1004, '用户删除', 'system:user:delete', 3, 4, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1005, '用户导出', 'system:user:export', 3, 5, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1006, '用户导入', 'system:user:import', 3, 6, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1007, '重置密码', 'system:user:update-password', 3, 7, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1008, '角色查询', 'system:role:query', 3, 1, 101, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1009, '角色新增', 'system:role:create', 3, 2, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1010, '角色修改', 'system:role:update', 3, 3, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1011, '角色删除', 'system:role:delete', 3, 4, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1012, '角色导出', 'system:role:export', 3, 5, 101, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1013, '菜单查询', 'system:menu:query', 3, 1, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1014, '菜单新增', 'system:menu:create', 3, 2, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1015, '菜单修改', 'system:menu:update', 3, 3, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1016, '菜单删除', 'system:menu:delete', 3, 4, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1017, '部门查询', 'system:dept:query', 3, 1, 103, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1018, '部门新增', 'system:dept:create', 3, 2, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1019, '部门修改', 'system:dept:update', 3, 3, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1020, '部门删除', 'system:dept:delete', 3, 4, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1021, '岗位查询', 'system:post:query', 3, 1, 104, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1022, '岗位新增', 'system:post:create', 3, 2, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1023, '岗位修改', 'system:post:update', 3, 3, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1024, '岗位删除', 'system:post:delete', 3, 4, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1025, '岗位导出', 'system:post:export', 3, 5, 104, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1026, '字典查询', 'system:dict:query', 3, 1, 105, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1027, '字典新增', 'system:dict:create', 3, 2, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1028, '字典修改', 'system:dict:update', 3, 3, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1029, '字典删除', 'system:dict:delete', 3, 4, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1030, '字典导出', 'system:dict:export', 3, 5, 105, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1031, '配置查询', 'infra:config:query', 3, 1, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1032, '配置新增', 'infra:config:create', 3, 2, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1033, '配置修改', 'infra:config:update', 3, 3, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1034, '配置删除', 'infra:config:delete', 3, 4, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1035, '配置导出', 'infra:config:export', 3, 5, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1036, '公告查询', 'system:notice:query', 3, 1, 107, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1037, '公告新增', 'system:notice:create', 3, 2, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1038, '公告修改', 'system:notice:update', 3, 3, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1039, '公告删除', 'system:notice:delete', 3, 4, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1040, '操作查询', 'system:operate-log:query', 3, 1, 500, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1042, '日志导出', 'system:operate-log:export', 3, 2, 500, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1043, '登录查询', 'system:login-log:query', 3, 1, 501, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1045, '日志导出', 'system:login-log:export', 3, 3, 501, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1046, '令牌列表', 'system:oauth2-token:page', 3, 1, 109, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:42', b'0');
INSERT INTO `system_menu` VALUES (1048, '令牌删除', 'system:oauth2-token:delete', 3, 2, 109, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:53', b'0');
INSERT INTO `system_menu` VALUES (1050, '任务新增', 'infra:job:create', 3, 2, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1051, '任务修改', 'infra:job:update', 3, 3, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1052, '任务删除', 'infra:job:delete', 3, 4, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1053, '状态修改', 'infra:job:update', 3, 5, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1054, '任务导出', 'infra:job:export', 3, 7, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1056, '生成修改', 'infra:codegen:update', 3, 2, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1057, '生成删除', 'infra:codegen:delete', 3, 3, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1058, '导入代码', 'infra:codegen:create', 3, 2, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1059, '预览代码', 'infra:codegen:preview', 3, 4, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1060, '生成代码', 'infra:codegen:download', 3, 5, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1063, '设置角色菜单权限', 'system:permission:assign-role-menu', 3, 6, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-06 17:53:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1064, '设置角色数据权限', 'system:permission:assign-role-data-scope', 3, 7, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-06 17:56:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1065, '设置用户角色', 'system:permission:assign-user-role', 3, 8, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-07 10:23:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1066, '获得 Redis 监控信息', 'infra:redis:get-monitor-info', 3, 1, 113, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-26 01:02:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1067, '获得 Redis Key 列表', 'infra:redis:get-key-list', 3, 2, 113, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-26 01:02:52', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1070, '代码生成示例', 'infra:test-demo:query', 2, 1, 2, 'test-demo', 'validCode', 'infra/testDemo/index', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1071, '测试示例表创建', 'infra:test-demo:create', 3, 1, 1070, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1072, '测试示例表更新', 'infra:test-demo:update', 3, 2, 1070, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1073, '测试示例表删除', 'infra:test-demo:delete', 3, 3, 1070, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1074, '测试示例表导出', 'infra:test-demo:export', 3, 4, 1070, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1075, '任务触发', 'infra:job:trigger', 3, 8, 110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-07 13:03:10', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1076, '数据库文档', '', 2, 4, 2, 'db-doc', 'table', 'infra/dbDoc/index', 'InfraDBDoc', 0, b'1', b'1', b'1', '', '2021-02-08 01:41:47', '1', '2023-04-08 09:13:38', b'0');
INSERT INTO `system_menu` VALUES (1077, '监控平台', '', 2, 13, 2, 'skywalking', 'eye-open', 'infra/skywalking/index', 'InfraSkyWalking', 0, b'1', b'1', b'1', '', '2021-02-08 20:41:31', '1', '2023-04-08 10:39:06', b'0');
INSERT INTO `system_menu` VALUES (1078, '访问日志', '', 2, 1, 1083, 'api-access-log', 'log', 'infra/apiAccessLog/index', 'InfraApiAccessLog', 0, b'1', b'1', b'1', '', '2021-02-26 01:32:59', '1', '2023-04-08 10:31:34', b'0');
INSERT INTO `system_menu` VALUES (1082, '日志导出', 'infra:api-access-log:export', 3, 2, 1078, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 01:32:59', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1083, 'API 日志', '', 2, 8, 2, 'log', 'log', NULL, NULL, 0, b'1', b'1', b'1', '', '2021-02-26 02:18:24', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1084, '错误日志', 'infra:api-error-log:query', 2, 2, 1083, 'api-error-log', 'log', 'infra/apiErrorLog/index', 'InfraApiErrorLog', 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2023-04-08 10:32:25', b'0');
INSERT INTO `system_menu` VALUES (1085, '日志处理', 'infra:api-error-log:update-status', 3, 2, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1086, '日志导出', 'infra:api-error-log:export', 3, 3, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1087, '任务查询', 'infra:job:query', 3, 1, 110, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:26:19', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1088, '日志查询', 'infra:api-access-log:query', 3, 1, 1078, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:28:04', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1089, '日志查询', 'infra:api-error-log:query', 3, 1, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:29:09', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1090, '文件列表', '', 2, 5, 1243, 'file', 'upload', 'infra/file/index', 'InfraFile', 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '1', '2023-04-08 09:21:31', b'0');
INSERT INTO `system_menu` VALUES (1091, '文件查询', 'infra:file:query', 3, 1, 1090, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1092, '文件删除', 'infra:file:delete', 3, 4, 1090, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1093, '短信管理', '', 1, 11, 1, 'sms', 'validCode', NULL, NULL, 0, b'1', b'1', b'1', '1', '2021-04-05 01:10:16', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1094, '短信渠道', '', 2, 0, 1093, 'sms-channel', 'phone', 'system/sms/channel/index', 'SystemSmsChannel', 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '1', '2023-04-08 08:50:41', b'0');
INSERT INTO `system_menu` VALUES (1095, '短信渠道查询', 'system:sms-channel:query', 3, 1, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1096, '短信渠道创建', 'system:sms-channel:create', 3, 2, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1097, '短信渠道更新', 'system:sms-channel:update', 3, 3, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1098, '短信渠道删除', 'system:sms-channel:delete', 3, 4, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1100, '短信模板', '', 2, 1, 1093, 'sms-template', 'phone', 'system/sms/template/index', 'SystemSmsTemplate', 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '1', '2023-04-08 08:50:50', b'0');
INSERT INTO `system_menu` VALUES (1101, '短信模板查询', 'system:sms-template:query', 3, 1, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1102, '短信模板创建', 'system:sms-template:create', 3, 2, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1103, '短信模板更新', 'system:sms-template:update', 3, 3, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1104, '短信模板删除', 'system:sms-template:delete', 3, 4, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1105, '短信模板导出', 'system:sms-template:export', 3, 5, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1106, '发送测试短信', 'system:sms-template:send-sms', 3, 6, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-04-11 00:26:40', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1107, '短信日志', '', 2, 2, 1093, 'sms-log', 'phone', 'system/sms/log/index', 'SystemSmsLog', 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '1', '2023-04-08 08:50:58', b'0');
INSERT INTO `system_menu` VALUES (1108, '短信日志查询', 'system:sms-log:query', 3, 1, 1107, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1109, '短信日志导出', 'system:sms-log:export', 3, 5, 1107, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1110, '错误码管理', '', 2, 12, 1, 'error-code', 'code', 'system/errorCode/index', 'SystemErrorCode', 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '1', '2023-04-08 09:01:15', b'0');
INSERT INTO `system_menu` VALUES (1111, '错误码查询', 'system:error-code:query', 3, 1, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1112, '错误码创建', 'system:error-code:create', 3, 2, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1113, '错误码更新', 'system:error-code:update', 3, 3, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1114, '错误码删除', 'system:error-code:delete', 3, 4, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1115, '错误码导出', 'system:error-code:export', 3, 5, 1110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-13 21:46:42', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1117, '支付管理', '', 1, 30, 0, '/pay', 'money', NULL, NULL, 0, b'1', b'1', b'1', '1', '2021-12-25 16:43:41', '1', '2023-11-22 13:45:24', b'1');
INSERT INTO `system_menu` VALUES (1126, '应用信息', '', 2, 1, 1117, 'app', 'table', 'pay/app/index', 'PayApp', 0, b'1', b'1', b'1', '', '2021-11-10 01:13:30', '1', '2023-11-22 13:44:51', b'1');
INSERT INTO `system_menu` VALUES (1127, '支付应用信息查询', 'pay:app:query', 3, 1, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2023-11-22 13:44:12', b'1');
INSERT INTO `system_menu` VALUES (1128, '支付应用信息创建', 'pay:app:create', 3, 2, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2023-11-22 13:44:14', b'1');
INSERT INTO `system_menu` VALUES (1129, '支付应用信息更新', 'pay:app:update', 3, 3, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2023-11-22 13:44:46', b'1');
INSERT INTO `system_menu` VALUES (1130, '支付应用信息删除', 'pay:app:delete', 3, 4, 1126, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:31', '', '2023-11-22 13:44:18', b'1');
INSERT INTO `system_menu` VALUES (1132, '秘钥解析', 'pay:channel:parsing', 3, 6, 1129, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-11-08 15:15:47', '1', '2023-11-22 13:44:44', b'1');
INSERT INTO `system_menu` VALUES (1133, '支付商户信息查询', 'pay:merchant:query', 3, 1, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2023-11-22 13:44:40', b'1');
INSERT INTO `system_menu` VALUES (1134, '支付商户信息创建', 'pay:merchant:create', 3, 2, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2023-11-22 13:44:38', b'1');
INSERT INTO `system_menu` VALUES (1135, '支付商户信息更新', 'pay:merchant:update', 3, 3, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2023-11-22 13:44:42', b'1');
INSERT INTO `system_menu` VALUES (1136, '支付商户信息删除', 'pay:merchant:delete', 3, 4, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2023-11-22 13:44:36', b'1');
INSERT INTO `system_menu` VALUES (1137, '支付商户信息导出', 'pay:merchant:export', 3, 5, 1132, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-11-10 01:13:41', '', '2023-11-22 13:44:31', b'1');
INSERT INTO `system_menu` VALUES (1138, '租户列表', '', 2, 0, 1224, 'list', 'peoples', 'system/tenant/index', 'SystemTenant', 0, b'1', b'1', b'1', '', '2021-12-14 12:31:43', '1', '2023-04-08 08:29:08', b'0');
INSERT INTO `system_menu` VALUES (1139, '租户查询', 'system:tenant:query', 3, 1, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1140, '租户创建', 'system:tenant:create', 3, 2, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1141, '租户更新', 'system:tenant:update', 3, 3, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1142, '租户删除', 'system:tenant:delete', 3, 4, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1143, '租户导出', 'system:tenant:export', 3, 5, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1150, '秘钥解析', '', 3, 6, 1129, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-11-08 15:15:47', '1', '2023-11-22 13:44:34', b'1');
INSERT INTO `system_menu` VALUES (1161, '退款订单', '', 2, 3, 1117, 'refund', 'order', 'pay/refund/index', 'PayRefund', 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '1', '2023-11-22 13:45:10', b'1');
INSERT INTO `system_menu` VALUES (1162, '退款订单查询', 'pay:refund:query', 3, 1, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2023-11-22 13:45:02', b'1');
INSERT INTO `system_menu` VALUES (1163, '退款订单创建', 'pay:refund:create', 3, 2, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2023-11-22 13:45:04', b'1');
INSERT INTO `system_menu` VALUES (1164, '退款订单更新', 'pay:refund:update', 3, 3, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2023-11-22 13:45:09', b'1');
INSERT INTO `system_menu` VALUES (1165, '退款订单删除', 'pay:refund:delete', 3, 4, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2023-11-22 13:45:06', b'1');
INSERT INTO `system_menu` VALUES (1166, '退款订单导出', 'pay:refund:export', 3, 5, 1161, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:29:07', '', '2023-11-22 13:45:07', b'1');
INSERT INTO `system_menu` VALUES (1173, '支付订单', '', 2, 2, 1117, 'order', 'pay', 'pay/order/index', 'PayOrder', 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '1', '2023-11-22 13:45:22', b'1');
INSERT INTO `system_menu` VALUES (1174, '支付订单查询', 'pay:order:query', 3, 1, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2023-11-22 13:45:14', b'1');
INSERT INTO `system_menu` VALUES (1175, '支付订单创建', 'pay:order:create', 3, 2, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2023-11-22 13:45:15', b'1');
INSERT INTO `system_menu` VALUES (1176, '支付订单更新', 'pay:order:update', 3, 3, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2023-11-22 13:45:17', b'1');
INSERT INTO `system_menu` VALUES (1177, '支付订单删除', 'pay:order:delete', 3, 4, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2023-11-22 13:45:19', b'1');
INSERT INTO `system_menu` VALUES (1178, '支付订单导出', 'pay:order:export', 3, 5, 1173, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-25 08:49:43', '', '2023-11-22 13:45:20', b'1');
INSERT INTO `system_menu` VALUES (1200, '任务管理', '', 1, 20, 1185, 'task', 'cascader', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-01-07 23:51:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1224, '租户管理', '', 2, 0, 1, 'tenant', 'peoples', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-02-20 01:41:13', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1225, '租户套餐', '', 2, 0, 1224, 'package', 'eye', 'system/tenantPackage/index', 'SystemTenantPackage', 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '1', '2023-04-08 08:17:08', b'0');
INSERT INTO `system_menu` VALUES (1226, '租户套餐查询', 'system:tenant-package:query', 3, 1, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1227, '租户套餐创建', 'system:tenant-package:create', 3, 2, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1228, '租户套餐更新', 'system:tenant-package:update', 3, 3, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1229, '租户套餐删除', 'system:tenant-package:delete', 3, 4, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1237, '文件配置', '', 2, 0, 1243, 'file-config', 'config', 'infra/fileConfig/index', 'InfraFileConfig', 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '1', '2023-04-08 09:16:05', b'0');
INSERT INTO `system_menu` VALUES (1238, '文件配置查询', 'infra:file-config:query', 3, 1, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1239, '文件配置创建', 'infra:file-config:create', 3, 2, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1240, '文件配置更新', 'infra:file-config:update', 3, 3, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1241, '文件配置删除', 'infra:file-config:delete', 3, 4, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1242, '文件配置导出', 'infra:file-config:export', 3, 5, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1243, '文件管理', '', 2, 5, 2, 'file', 'download', NULL, '', 0, b'1', b'1', b'1', '1', '2022-03-16 23:47:40', '1', '2023-02-10 13:47:46', b'0');
INSERT INTO `system_menu` VALUES (1247, '敏感词管理', '', 2, 13, 1, 'sensitive-word', 'education', 'system/sensitiveWord/index', 'SystemSensitiveWord', 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '1', '2023-04-08 09:00:40', b'0');
INSERT INTO `system_menu` VALUES (1248, '敏感词查询', 'system:sensitive-word:query', 3, 1, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1249, '敏感词创建', 'system:sensitive-word:create', 3, 2, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1250, '敏感词更新', 'system:sensitive-word:update', 3, 3, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1251, '敏感词删除', 'system:sensitive-word:delete', 3, 4, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1252, '敏感词导出', 'system:sensitive-word:export', 3, 5, 1247, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-07 16:55:03', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` VALUES (1255, '数据源配置', '', 2, 1, 2, 'data-source-config', 'rate', 'infra/dataSourceConfig/index', 'InfraDataSourceConfig', 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '1', '2023-04-08 09:05:21', b'0');
INSERT INTO `system_menu` VALUES (1256, '数据源配置查询', 'infra:data-source-config:query', 3, 1, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1257, '数据源配置创建', 'infra:data-source-config:create', 3, 2, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1258, '数据源配置更新', 'infra:data-source-config:update', 3, 3, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1259, '数据源配置删除', 'infra:data-source-config:delete', 3, 4, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1260, '数据源配置导出', 'infra:data-source-config:export', 3, 5, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` VALUES (1261, 'OAuth 2.0', '', 1, 10, 1, 'oauth2', 'people', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-05-09 23:38:17', '1', '2022-05-11 23:51:46', b'0');
INSERT INTO `system_menu` VALUES (1263, '应用管理', '', 2, 0, 1261, 'oauth2/application', 'tool', 'system/oauth2/client/index', 'SystemOAuth2Client', 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2023-04-08 08:47:31', b'0');
INSERT INTO `system_menu` VALUES (1264, '客户端查询', 'system:oauth2-client:query', 3, 1, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:06', b'0');
INSERT INTO `system_menu` VALUES (1265, '客户端创建', 'system:oauth2-client:create', 3, 2, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:23', b'0');
INSERT INTO `system_menu` VALUES (1266, '客户端更新', 'system:oauth2-client:update', 3, 3, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:28', b'0');
INSERT INTO `system_menu` VALUES (1267, '客户端删除', 'system:oauth2-client:delete', 3, 4, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:33', b'0');
INSERT INTO `system_menu` VALUES (2083, '地区管理', '', 2, 14, 1, 'area', 'row', 'system/area/index', 'SystemArea', 0, b'1', b'1', b'1', '1', '2022-12-23 17:35:05', '1', '2023-04-08 09:01:37', b'0');
INSERT INTO `system_menu` VALUES (2130, '邮箱管理', '', 2, 11, 1, 'mail', 'email', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-01-25 17:27:44', '1', '2023-01-25 17:27:44', b'0');
INSERT INTO `system_menu` VALUES (2131, '邮箱账号', '', 2, 0, 2130, 'mail-account', 'user', 'system/mail/account/index', 'SystemMailAccount', 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '1', '2023-04-08 08:53:43', b'0');
INSERT INTO `system_menu` VALUES (2132, '账号查询', 'system:mail-account:query', 3, 1, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2133, '账号创建', 'system:mail-account:create', 3, 2, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2134, '账号更新', 'system:mail-account:update', 3, 3, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2135, '账号删除', 'system:mail-account:delete', 3, 4, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` VALUES (2136, '邮件模版', '', 2, 0, 2130, 'mail-template', 'education', 'system/mail/template/index', 'SystemMailTemplate', 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '1', '2023-04-08 08:53:34', b'0');
INSERT INTO `system_menu` VALUES (2137, '模版查询', 'system:mail-template:query', 3, 1, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2138, '模版创建', 'system:mail-template:create', 3, 2, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2139, '模版更新', 'system:mail-template:update', 3, 3, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2140, '模版删除', 'system:mail-template:delete', 3, 4, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` VALUES (2141, '邮件记录', '', 2, 0, 2130, 'mail-log', 'log', 'system/mail/log/index', 'SystemMailLog', 0, b'1', b'1', b'1', '', '2023-01-26 02:16:50', '1', '2023-04-08 08:53:49', b'0');
INSERT INTO `system_menu` VALUES (2142, '日志查询', 'system:mail-log:query', 3, 1, 2141, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-26 02:16:50', '', '2023-01-26 02:16:50', b'0');
INSERT INTO `system_menu` VALUES (2143, '发送测试邮件', 'system:mail-template:send-mail', 3, 5, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-26 23:29:15', '1', '2023-01-26 23:29:15', b'0');
INSERT INTO `system_menu` VALUES (2144, '站内信管理', '', 1, 11, 1, 'notify', 'message', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-01-28 10:25:18', '1', '2023-01-28 10:25:46', b'0');
INSERT INTO `system_menu` VALUES (2145, '模板管理', '', 2, 0, 2144, 'notify-template', 'education', 'system/notify/template/index', 'SystemNotifyTemplate', 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '1', '2023-04-08 08:54:39', b'0');
INSERT INTO `system_menu` VALUES (2146, '站内信模板查询', 'system:notify-template:query', 3, 1, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2147, '站内信模板创建', 'system:notify-template:create', 3, 2, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2148, '站内信模板更新', 'system:notify-template:update', 3, 3, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2149, '站内信模板删除', 'system:notify-template:delete', 3, 4, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` VALUES (2150, '发送测试站内信', 'system:notify-template:send-notify', 3, 5, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-28 10:54:43', '1', '2023-01-28 10:54:43', b'0');
INSERT INTO `system_menu` VALUES (2151, '消息记录', '', 2, 0, 2144, 'notify-message', 'edit', 'system/notify/message/index', 'SystemNotifyMessage', 0, b'1', b'1', b'1', '', '2023-01-28 04:28:22', '1', '2023-04-08 08:54:11', b'0');
INSERT INTO `system_menu` VALUES (2152, '站内信消息查询', 'system:notify-message:query', 3, 1, 2151, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 04:28:22', '', '2023-01-28 04:28:22', b'0');
INSERT INTO `system_menu` VALUES (2161, '接入示例', '', 2, 99, 1117, 'demo-order', 'drag', 'pay/demo/index', NULL, 0, b'1', b'1', b'1', '', '2023-02-11 14:21:42', '1', '2023-11-22 13:44:54', b'1');
INSERT INTO `system_menu` VALUES (2301, '回调通知', '', 2, 4, 1117, 'notify', 'example', 'pay/notify/index', 'PayNotify', 0, b'1', b'1', b'1', '', '2023-07-20 04:41:32', '1', '2023-11-22 13:44:58', b'1');
INSERT INTO `system_menu` VALUES (2302, '支付通知查询', 'pay:notify:query', 3, 1, 2301, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-20 04:41:32', '', '2023-11-22 13:44:57', b'1');
INSERT INTO `system_menu` VALUES (2303, '业务管理', '', 1, 1, 0, '/member', 'merchant', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-07-27 16:44:41', '1', '2023-07-27 16:44:41', b'0');
INSERT INTO `system_menu` VALUES (2304, '广告管理', '', 2, 0, 2303, 'banner-info', '', 'member/bannerInfo/index', 'BannerInfo', 0, b'1', b'1', b'1', '', '2023-07-28 09:56:59', '', '2023-07-28 16:39:38', b'0');
INSERT INTO `system_menu` VALUES (2305, '广告管理查询', 'member:banner-info:query', 3, 1, 2304, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 09:56:59', '', '2023-07-28 09:56:59', b'0');
INSERT INTO `system_menu` VALUES (2306, '广告管理创建', 'member:banner-info:create', 3, 2, 2304, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 09:56:59', '', '2023-07-28 09:56:59', b'0');
INSERT INTO `system_menu` VALUES (2307, '广告管理更新', 'member:banner-info:update', 3, 3, 2304, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 09:56:59', '', '2023-07-28 09:56:59', b'0');
INSERT INTO `system_menu` VALUES (2308, '广告管理删除', 'member:banner-info:delete', 3, 4, 2304, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 09:56:59', '', '2023-07-28 09:56:59', b'0');
INSERT INTO `system_menu` VALUES (2309, '广告管理导出', 'member:banner-info:export', 3, 5, 2304, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 09:56:59', '', '2023-07-28 09:56:59', b'0');
INSERT INTO `system_menu` VALUES (2310, '用户管理', '', 2, 0, 2303, 'app-user', '', 'member/appUser/index', 'AppUser', 0, b'1', b'1', b'1', '', '2023-07-28 16:14:56', '', '2023-07-28 16:39:36', b'0');
INSERT INTO `system_menu` VALUES (2311, '用户管理查询', 'member:app-user:query', 3, 1, 2310, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 16:14:56', '', '2023-07-28 16:14:56', b'0');
INSERT INTO `system_menu` VALUES (2312, '用户管理创建', 'member:app-user:create', 3, 2, 2310, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 16:14:56', '', '2023-07-28 16:14:56', b'0');
INSERT INTO `system_menu` VALUES (2313, '用户管理更新', 'member:app-user:update', 3, 3, 2310, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 16:14:56', '', '2023-07-28 16:14:56', b'0');
INSERT INTO `system_menu` VALUES (2314, '用户管理删除', 'member:app-user:delete', 3, 4, 2310, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 16:14:56', '', '2023-07-28 16:14:56', b'0');
INSERT INTO `system_menu` VALUES (2315, '用户管理导出', 'member:app-user:export', 3, 5, 2310, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-07-28 16:14:56', '', '2023-07-28 16:14:56', b'0');
INSERT INTO `system_menu` VALUES (2316, '门店用户管理', '', 2, 0, 2303, 'store-user', '', 'member/storeUser/index', 'StoreUser', 0, b'1', b'1', b'1', '', '2023-08-02 16:33:20', '1', '2023-08-08 11:34:57', b'1');
INSERT INTO `system_menu` VALUES (2317, '门店用户管理查询', 'member:store-user:query', 3, 1, 2316, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:33:20', '', '2023-08-08 11:34:47', b'1');
INSERT INTO `system_menu` VALUES (2318, '门店用户管理创建', 'member:store-user:create', 3, 2, 2316, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:33:20', '', '2023-08-08 11:34:49', b'1');
INSERT INTO `system_menu` VALUES (2319, '门店用户管理更新', 'member:store-user:update', 3, 3, 2316, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:33:20', '', '2023-08-08 11:34:51', b'1');
INSERT INTO `system_menu` VALUES (2320, '门店用户管理删除', 'member:store-user:delete', 3, 4, 2316, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:33:20', '', '2023-08-08 11:34:53', b'1');
INSERT INTO `system_menu` VALUES (2321, '门店用户管理导出', 'member:store-user:export', 3, 5, 2316, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:33:20', '', '2023-08-08 11:34:55', b'1');
INSERT INTO `system_menu` VALUES (2322, '门店管理', '', 2, 0, 2303, 'store-info', '', 'member/storeInfo/index', 'StoreInfo', 0, b'1', b'1', b'1', '', '2023-08-02 16:36:07', '1', '2023-08-02 16:59:26', b'0');
INSERT INTO `system_menu` VALUES (2323, '门店管理查询', 'member:store-info:query', 3, 1, 2322, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:36:07', '', '2023-08-02 16:36:07', b'0');
INSERT INTO `system_menu` VALUES (2324, '门店管理创建', 'member:store-info:create', 3, 2, 2322, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:36:07', '', '2023-08-02 16:36:07', b'0');
INSERT INTO `system_menu` VALUES (2325, '门店管理更新', 'member:store-info:update', 3, 3, 2322, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:36:07', '', '2023-08-02 16:36:07', b'0');
INSERT INTO `system_menu` VALUES (2326, '门店管理删除', 'member:store-info:delete', 3, 4, 2322, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:36:07', '', '2023-08-02 16:36:07', b'0');
INSERT INTO `system_menu` VALUES (2327, '门店管理导出', 'member:store-info:export', 3, 5, 2322, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:36:07', '', '2023-08-02 16:36:07', b'0');
INSERT INTO `system_menu` VALUES (2328, '设备管理', '', 2, 0, 2303, 'device-info', '', 'member/deviceInfo/index', 'DeviceInfo', 0, b'1', b'1', b'1', '', '2023-08-02 16:37:43', '1', '2023-08-02 16:59:29', b'0');
INSERT INTO `system_menu` VALUES (2329, '设备管理查询', 'member:device-info:query', 3, 1, 2328, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:37:43', '', '2023-08-02 16:37:43', b'0');
INSERT INTO `system_menu` VALUES (2330, '设备管理创建', 'member:device-info:create', 3, 2, 2328, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:37:43', '', '2023-08-02 16:37:43', b'0');
INSERT INTO `system_menu` VALUES (2331, '设备管理更新', 'member:device-info:update', 3, 3, 2328, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:37:43', '', '2023-08-02 16:37:43', b'0');
INSERT INTO `system_menu` VALUES (2332, '设备管理删除', 'member:device-info:delete', 3, 4, 2328, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:37:43', '', '2023-08-02 16:37:43', b'0');
INSERT INTO `system_menu` VALUES (2333, '设备管理导出', 'member:device-info:export', 3, 5, 2328, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-02 16:37:43', '', '2023-08-02 16:37:43', b'0');
INSERT INTO `system_menu` VALUES (2334, '支付订单管理', '', 2, 0, 2303, 'pay-order', '', 'member/payOrder/index', 'PayOrder', 0, b'1', b'1', b'1', '', '2023-08-05 14:29:13', '', '2023-08-05 14:29:13', b'0');
INSERT INTO `system_menu` VALUES (2335, '支付订单查询', 'member:pay-order:query', 3, 1, 2334, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-05 14:29:13', '', '2023-08-05 14:29:13', b'0');
INSERT INTO `system_menu` VALUES (2336, '支付订单创建', 'member:pay-order:create', 3, 2, 2334, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-05 14:29:13', '', '2023-08-05 14:29:13', b'0');
INSERT INTO `system_menu` VALUES (2337, '支付订单更新', 'member:pay-order:update', 3, 3, 2334, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-05 14:29:13', '', '2023-08-05 14:29:13', b'0');
INSERT INTO `system_menu` VALUES (2338, '支付订单删除', 'member:pay-order:delete', 3, 4, 2334, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-05 14:29:13', '', '2023-08-05 14:29:13', b'0');
INSERT INTO `system_menu` VALUES (2339, '支付订单导出', 'member:pay-order:export', 3, 5, 2334, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-08-05 14:29:13', '', '2023-08-05 14:29:13', b'0');
INSERT INTO `system_menu` VALUES (2340, '团购验券记录', '', 2, 0, 2303, 'group-pay-info', '', 'member/groupPayInfo/index', 'GroupPayInfo', 0, b'1', b'1', b'1', '', '2023-10-25 18:33:26', '1', '2023-11-22 13:45:52', b'0');
INSERT INTO `system_menu` VALUES (2341, '团购支付信息查询', 'member:group-pay-info:query', 3, 1, 2340, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-25 18:33:26', '', '2023-10-25 18:33:26', b'0');
INSERT INTO `system_menu` VALUES (2342, '团购支付信息创建', 'member:group-pay-info:create', 3, 2, 2340, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-25 18:33:26', '', '2023-10-25 18:33:26', b'0');
INSERT INTO `system_menu` VALUES (2343, '团购支付信息更新', 'member:group-pay-info:update', 3, 3, 2340, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-25 18:33:26', '', '2023-10-25 18:33:26', b'0');
INSERT INTO `system_menu` VALUES (2344, '团购支付信息删除', 'member:group-pay-info:delete', 3, 4, 2340, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-25 18:33:26', '', '2023-10-25 18:33:26', b'0');
INSERT INTO `system_menu` VALUES (2345, '团购支付信息导出', 'member:group-pay-info:export', 3, 5, 2340, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-10-25 18:33:26', '', '2023-10-25 18:33:26', b'0');
INSERT INTO `system_menu` VALUES (2346, '微信支付配置', '', 2, 0, 2303, 'store-wxpay-config', '', 'member/storeWxpayConfig/index', 'StoreWxpayConfig', 0, b'1', b'1', b'1', '', '2023-11-22 13:42:11', '1', '2023-11-22 13:45:36', b'0');
INSERT INTO `system_menu` VALUES (2347, '门店微信支付配置查询', 'member:store-wxpay-config:query', 3, 1, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-22 13:42:11', '', '2023-11-22 13:42:11', b'0');
INSERT INTO `system_menu` VALUES (2348, '门店微信支付配置创建', 'member:store-wxpay-config:create', 3, 2, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-22 13:42:11', '', '2023-11-22 13:42:11', b'0');
INSERT INTO `system_menu` VALUES (2349, '门店微信支付配置更新', 'member:store-wxpay-config:update', 3, 3, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-22 13:42:11', '', '2023-11-22 13:42:11', b'0');
INSERT INTO `system_menu` VALUES (2350, '门店微信支付配置删除', 'member:store-wxpay-config:delete', 3, 4, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-22 13:42:11', '', '2023-11-22 13:42:11', b'0');
INSERT INTO `system_menu` VALUES (2351, '门店微信支付配置导出', 'member:store-wxpay-config:export', 3, 5, 2346, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-22 13:42:11', '', '2023-11-22 13:59:41', b'1');
INSERT INTO `system_menu` VALUES (2352, '加盟信息管理', '', 2, 0, 2303, 'franchise-info', '', 'member/franchiseInfo/index', 'FranchiseInfo', 0, b'1', b'1', b'1', '', '2024-03-06 11:06:18', '', '2024-03-06 11:06:18', b'0');
INSERT INTO `system_menu` VALUES (2353, '加盟信息查询', 'member:franchise-info:query', 3, 1, 2352, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-06 11:06:18', '', '2024-03-06 11:06:18', b'0');
INSERT INTO `system_menu` VALUES (2354, '加盟信息删除', 'member:franchise-info:delete', 3, 4, 2352, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-06 11:06:18', '', '2024-03-06 11:06:18', b'0');
INSERT INTO `system_menu` VALUES (2355, '加盟信息导出', 'member:franchise-info:export', 3, 5, 2352, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-06 11:06:18', '', '2024-03-06 11:06:18', b'0');
INSERT INTO `system_menu` VALUES (2356, '设备使用记录', '', 2, 0, 2303, 'device-use-info', '', 'member/deviceUseInfo/index', 'DeviceUseInfo', 0, b'1', b'1', b'1', '', '2024-03-19 11:16:56', '1', '2024-03-19 11:26:15', b'0');
INSERT INTO `system_menu` VALUES (2357, '设备使用记录查询', 'member:device-use-info:query', 3, 1, 2356, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-19 11:16:56', '', '2024-03-19 11:16:56', b'0');
INSERT INTO `system_menu` VALUES (2358, '设备使用记录创建', 'member:device-use-info:create', 3, 2, 2356, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-19 11:16:56', '', '2024-03-19 11:16:56', b'0');
INSERT INTO `system_menu` VALUES (2359, '设备使用记录更新', 'member:device-use-info:update', 3, 3, 2356, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-19 11:16:56', '', '2024-03-19 11:16:56', b'0');
INSERT INTO `system_menu` VALUES (2360, '设备使用记录删除', 'member:device-use-info:delete', 3, 4, 2356, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-19 11:16:56', '', '2024-03-19 11:16:56', b'0');
INSERT INTO `system_menu` VALUES (2361, '设备使用记录导出', 'member:device-use-info:export', 3, 5, 2356, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-03-19 11:16:56', '', '2024-03-19 11:16:56', b'0');

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告内容',
  `type` tinyint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '公告状态（0正常 1关闭）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
INSERT INTO `system_notice` VALUES (1, '芋道的公众', '<p>新版本内容133</p>', 1, 0, 'admin', '2021-01-05 17:03:48', '1', '2022-05-04 21:00:20', b'0', 1);
INSERT INTO `system_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '<p><img src=\"http://test.mazongjian.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg\">维护内容</p>', 2, 1, 'admin', '2021-01-05 17:03:48', '1', '2022-05-11 12:34:24', b'0', 1);
INSERT INTO `system_notice` VALUES (4, '我是测试标题', '<p>哈哈哈哈123</p>', 1, 0, '110', '2022-02-22 01:01:25', '110', '2022-02-22 01:01:46', b'0', 121);

-- ----------------------------
-- Table structure for system_notify_message
-- ----------------------------
DROP TABLE IF EXISTS `system_notify_message`;
CREATE TABLE `system_notify_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `template_id` bigint NOT NULL COMMENT '模版编号',
  `template_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版发送人名称',
  `template_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
  `template_type` int NOT NULL COMMENT '模版类型',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版参数',
  `read_status` bit(1) NOT NULL COMMENT '是否已读',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内信消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_notify_message
-- ----------------------------
INSERT INTO `system_notify_message` VALUES (2, 1, 2, 1, 'test', '123', '我是 1，我开始 2 了', 1, '{\"name\":\"1\",\"what\":\"2\"}', b'1', '2023-02-10 00:47:04', '1', '2023-01-28 11:44:08', '1', '2023-02-10 00:47:04', b'0', 1);
INSERT INTO `system_notify_message` VALUES (3, 1, 2, 1, 'test', '123', '我是 1，我开始 2 了', 1, '{\"name\":\"1\",\"what\":\"2\"}', b'1', '2023-02-10 00:47:04', '1', '2023-01-28 11:45:04', '1', '2023-02-10 00:47:04', b'0', 1);
INSERT INTO `system_notify_message` VALUES (4, 103, 2, 2, 'register', '系统消息', '你好，欢迎 哈哈 加入大家庭！', 2, '{\"name\":\"哈哈\"}', b'0', NULL, '1', '2023-01-28 21:02:20', '1', '2023-01-28 21:02:20', b'0', 1);
INSERT INTO `system_notify_message` VALUES (5, 1, 2, 1, 'test', '123', '我是 芋艿，我开始 写代码 了', 1, '{\"name\":\"芋艿\",\"what\":\"写代码\"}', b'1', '2023-02-10 00:47:04', '1', '2023-01-28 22:21:42', '1', '2023-02-10 00:47:04', b'0', 1);
INSERT INTO `system_notify_message` VALUES (6, 1, 2, 1, 'test', '123', '我是 芋艿，我开始 写代码 了', 1, '{\"name\":\"芋艿\",\"what\":\"写代码\"}', b'1', '2023-01-29 10:52:06', '1', '2023-01-28 22:22:07', '1', '2023-01-29 10:52:06', b'0', 1);
INSERT INTO `system_notify_message` VALUES (7, 1, 2, 1, 'test', '123', '我是 2，我开始 3 了', 1, '{\"name\":\"2\",\"what\":\"3\"}', b'1', '2023-01-29 10:52:06', '1', '2023-01-28 23:45:21', '1', '2023-01-29 10:52:06', b'0', 1);
INSERT INTO `system_notify_message` VALUES (8, 1, 2, 2, 'register', '系统消息', '你好，欢迎 123 加入大家庭！', 2, '{\"name\":\"123\"}', b'1', '2023-01-29 10:52:06', '1', '2023-01-28 23:50:21', '1', '2023-01-29 10:52:06', b'0', 1);

-- ----------------------------
-- Table structure for system_notify_template
-- ----------------------------
DROP TABLE IF EXISTS `system_notify_template`;
CREATE TABLE `system_notify_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版编码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发送人名称',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模版内容',
  `type` tinyint NOT NULL COMMENT '类型',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数数组',
  `status` tinyint NOT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '站内信模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_notify_template
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_access_token`;
CREATE TABLE `system_oauth2_access_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问令牌',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权范围',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 访问令牌' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_oauth2_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_approve
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_approve`;
CREATE TABLE `system_oauth2_approve`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '授权范围',
  `approved` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否接受',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 批准表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_oauth2_approve
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_client`;
CREATE TABLE `system_oauth2_client`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端密钥',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用描述',
  `status` tinyint NOT NULL COMMENT '状态',
  `access_token_validity_seconds` int NOT NULL COMMENT '访问令牌的有效期',
  `refresh_token_validity_seconds` int NOT NULL COMMENT '刷新令牌的有效期',
  `redirect_uris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '可重定向的 URI 地址',
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权类型',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权范围',
  `auto_approve_scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自动通过的授权范围',
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资源',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附加信息',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 客户端表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_oauth2_client
-- ----------------------------
INSERT INTO `system_oauth2_client` VALUES (1, 'default', 'mazongjian', 'mazongjian', 'http://test.mazongjian.iocoder.cn/a5e2e244368878a366b516805a4aabf1.png', '我是描述', 0, 147483646, 147483646, '[\"https://www.iocoder.cn\",\"https://doc.iocoder.cn\"]', '[\"password\",\"authorization_code\",\"implicit\",\"refresh_token\"]', '[\"user.read\",\"user.write\"]', '[]', '[\"user.read\",\"user.write\"]', '[]', '{}', '1', '2022-05-11 21:47:12', '1', '2023-07-27 22:27:56', b'0');

-- ----------------------------
-- Table structure for system_oauth2_code
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_code`;
CREATE TABLE `system_oauth2_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '授权码',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '授权范围',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '可重定向的 URI 地址',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 授权码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_oauth2_code
-- ----------------------------

-- ----------------------------
-- Table structure for system_oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_refresh_token`;
CREATE TABLE `system_oauth2_refresh_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '刷新令牌',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端编号',
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '授权范围',
  `expires_time` datetime NOT NULL COMMENT '过期时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 刷新令牌' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_oauth2_refresh_token
-- ----------------------------

-- ----------------------------
-- Table structure for system_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operate_log`;
CREATE TABLE `system_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链路追踪编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '用户类型',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块标题',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作名',
  `type` bigint NOT NULL DEFAULT 0 COMMENT '操作分类',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `exts` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '拓展字段',
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方法名',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求地址',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户 IP',
  `user_agent` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器 UA',
  `java_method` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Java 方法名',
  `java_method_args` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Java 方法的参数',
  `start_time` datetime NOT NULL COMMENT '操作时间',
  `duration` int NOT NULL COMMENT '执行时长',
  `result_code` int NOT NULL DEFAULT 0 COMMENT '结果码',
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果提示',
  `result_data` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '结果数据',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_operate_log
-- ----------------------------
INSERT INTO `system_operate_log` VALUES (1, '', 127, 2, '管理后台 - 用户个人中心', '修改用户个人密码', 3, '', '', 'PUT', '/admin-api/system/user/profile/update-password', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', 'CommonResult com.yanzu.module.system.controller.admin.user.UserProfileController.updateUserProfilePassword(UserProfileUpdatePasswordReqVO)', '{\"reqVO\":{\"oldPassword\":\"cn.haoyu\",\"newPassword\":\"admin123\"}}', '2024-01-16 15:40:05', 35, 0, '', 'true', NULL, '2024-01-16 15:40:05', NULL, '2024-01-16 15:40:05', b'0', 150);

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `sort` int NOT NULL COMMENT '显示顺序',
  `status` tinyint NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_post
-- ----------------------------
INSERT INTO `system_post` VALUES (1, 'ceo', '董事长', 1, 0, '', 'admin', '2021-01-06 17:03:48', '1', '2023-02-11 15:19:04', b'0', 1);
INSERT INTO `system_post` VALUES (2, 'se', '项目经理', 2, 0, '', 'admin', '2021-01-05 17:03:48', '1', '2021-12-12 10:47:47', b'0', 1);
INSERT INTO `system_post` VALUES (4, 'user', '普通员工', 4, 0, '111', 'admin', '2021-01-05 17:03:48', '1', '2023-02-11 15:19:00', b'0', 1);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` tinyint NOT NULL DEFAULT 1 COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `data_scope_dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数据范围(指定部门数组)',
  `status` tinyint NOT NULL COMMENT '角色状态（0正常 1停用）',
  `type` tinyint NOT NULL COMMENT '角色类型',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', 'super_admin', 1, 1, '', 0, 1, '超级管理员', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:21', b'0', 1);
INSERT INTO `system_role` VALUES (2, '普通角色', 'common', 2, 2, '', 0, 1, '普通角色', 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:20', b'0', 1);
INSERT INTO `system_role` VALUES (101, '测试账号', 'test', 0, 1, '[]', 0, 2, '132', '', '2021-01-06 13:49:35', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role` VALUES (109, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_role` VALUES (110, '测试角色', 'test', 0, 1, '[]', 0, 2, '嘿嘿', '110', '2022-02-23 00:14:34', '110', '2022-02-23 13:14:58', b'0', 121);
INSERT INTO `system_role` VALUES (111, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_role` VALUES (113, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role` VALUES (114, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role` VALUES (115, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role` VALUES (116, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role` VALUES (118, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role` VALUES (136, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role` VALUES (137, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role` VALUES (138, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role` VALUES (139, '租户管理员', 'tenant_admin', 0, 1, '', 0, 1, '系统自动生成', '1', '2023-07-27 16:54:32', '1', '2023-07-27 16:54:32', b'0', 150);

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES (263, 109, 1, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_role_menu` VALUES (434, 2, 1, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (454, 2, 1093, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (455, 2, 1094, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (460, 2, 1100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (467, 2, 1107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (470, 2, 1110, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (476, 2, 1117, '1', '2022-02-22 13:09:12', '1', '2023-11-22 13:45:24', b'1', 1);
INSERT INTO `system_role_menu` VALUES (477, 2, 100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (478, 2, 101, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (479, 2, 102, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (480, 2, 1126, '1', '2022-02-22 13:09:12', '1', '2023-11-22 13:44:51', b'1', 1);
INSERT INTO `system_role_menu` VALUES (481, 2, 103, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (483, 2, 104, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (485, 2, 105, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (488, 2, 107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (490, 2, 108, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (492, 2, 109, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (498, 2, 1138, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (523, 2, 1224, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (524, 2, 1225, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (541, 2, 500, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (543, 2, 501, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (675, 2, 2, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (689, 2, 1077, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (690, 2, 1078, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (692, 2, 1083, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (693, 2, 1084, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (699, 2, 1090, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (703, 2, 106, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (704, 2, 110, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (705, 2, 111, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (706, 2, 112, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (707, 2, 113, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1296, 110, 1, '110', '2022-02-23 00:23:55', '110', '2022-02-23 00:23:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1489, 1, 1, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1490, 1, 2, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1494, 1, 1077, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1495, 1, 1078, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1496, 1, 1083, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1497, 1, 1084, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1498, 1, 1090, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1499, 1, 1093, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1500, 1, 1094, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1501, 1, 1100, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1502, 1, 1107, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1503, 1, 1110, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1505, 1, 1117, '1', '2022-02-23 20:03:57', '1', '2023-11-22 13:45:24', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1506, 1, 100, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1507, 1, 101, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1508, 1, 102, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1509, 1, 1126, '1', '2022-02-23 20:03:57', '1', '2023-11-22 13:44:51', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1510, 1, 103, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1511, 1, 104, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1512, 1, 105, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1513, 1, 106, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1514, 1, 107, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1515, 1, 108, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1516, 1, 109, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1517, 1, 110, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1518, 1, 111, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1519, 1, 112, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1520, 1, 113, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1522, 1, 1138, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1525, 1, 1224, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1526, 1, 1225, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1527, 1, 500, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1528, 1, 501, '1', '2022-02-23 20:03:57', '1', '2022-02-23 20:03:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1578, 111, 1, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1604, 101, 1216, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1605, 101, 1217, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1606, 101, 1218, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1607, 101, 1219, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1608, 101, 1220, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1609, 101, 1221, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1610, 101, 5, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1611, 101, 1222, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1612, 101, 1118, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1613, 101, 1119, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1614, 101, 1120, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1615, 101, 1185, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1616, 101, 1186, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1617, 101, 1187, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1618, 101, 1188, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1619, 101, 1189, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1620, 101, 1190, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1621, 101, 1191, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1622, 101, 1192, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1623, 101, 1193, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1624, 101, 1194, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1625, 101, 1195, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1626, 101, 1196, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1627, 101, 1197, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1628, 101, 1198, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1629, 101, 1199, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1630, 101, 1200, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1631, 101, 1201, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1632, 101, 1202, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1633, 101, 1207, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1634, 101, 1208, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1635, 101, 1209, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1636, 101, 1210, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1637, 101, 1211, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1638, 101, 1212, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1639, 101, 1213, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1640, 101, 1215, '1', '2022-03-19 21:45:52', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1641, 101, 2, '1', '2022-04-01 22:21:24', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1642, 101, 1031, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1643, 101, 1032, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1644, 101, 1033, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1645, 101, 1034, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1646, 101, 1035, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1647, 101, 1050, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1648, 101, 1051, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1649, 101, 1052, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1650, 101, 1053, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1651, 101, 1054, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1652, 101, 1056, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1653, 101, 1057, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1654, 101, 1058, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1655, 101, 1059, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1656, 101, 1060, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1657, 101, 1066, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1658, 101, 1067, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1659, 101, 1070, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1660, 101, 1071, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1661, 101, 1072, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1662, 101, 1073, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1663, 101, 1074, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1664, 101, 1075, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1665, 101, 1076, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1666, 101, 1077, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1667, 101, 1078, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1668, 101, 1082, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1669, 101, 1083, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1670, 101, 1084, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1671, 101, 1085, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1672, 101, 1086, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1673, 101, 1087, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1674, 101, 1088, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1675, 101, 1089, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1679, 101, 1237, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1680, 101, 1238, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1681, 101, 1239, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1682, 101, 1240, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1683, 101, 1241, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1684, 101, 1242, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1685, 101, 1243, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1687, 101, 106, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1688, 101, 110, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1689, 101, 111, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1690, 101, 112, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1691, 101, 113, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1692, 101, 114, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1693, 101, 115, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1694, 101, 116, '1', '2022-04-01 22:21:37', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (1712, 113, 1024, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1713, 113, 1025, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1714, 113, 1, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1715, 113, 102, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1716, 113, 103, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1717, 113, 104, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1718, 113, 1013, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1719, 113, 1014, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1720, 113, 1015, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1721, 113, 1016, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1722, 113, 1017, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1723, 113, 1018, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1724, 113, 1019, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1725, 113, 1020, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1726, 113, 1021, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1727, 113, 1022, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1728, 113, 1023, '1', '2022-05-17 10:07:10', '1', '2022-05-17 10:07:10', b'0', 124);
INSERT INTO `system_role_menu` VALUES (1729, 109, 100, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1730, 109, 101, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1731, 109, 1063, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1732, 109, 1064, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1733, 109, 1001, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1734, 109, 1065, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1735, 109, 1002, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1736, 109, 1003, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1737, 109, 1004, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1738, 109, 1005, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1739, 109, 1006, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1740, 109, 1007, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1741, 109, 1008, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1742, 109, 1009, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1743, 109, 1010, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1744, 109, 1011, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1745, 109, 1012, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1746, 111, 100, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1747, 111, 101, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1748, 111, 1063, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1749, 111, 1064, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1750, 111, 1001, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1751, 111, 1065, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1752, 111, 1002, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1753, 111, 1003, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1754, 111, 1004, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1755, 111, 1005, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1756, 111, 1006, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1757, 111, 1007, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1758, 111, 1008, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1759, 111, 1009, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1760, 111, 1010, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1761, 111, 1011, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1762, 111, 1012, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1763, 109, 100, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1764, 109, 101, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1765, 109, 1063, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1766, 109, 1064, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1767, 109, 1001, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1768, 109, 1065, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1769, 109, 1002, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1770, 109, 1003, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1771, 109, 1004, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1772, 109, 1005, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1773, 109, 1006, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1774, 109, 1007, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1775, 109, 1008, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1776, 109, 1009, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1777, 109, 1010, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1778, 109, 1011, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1779, 109, 1012, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1780, 111, 100, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1781, 111, 101, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1782, 111, 1063, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1783, 111, 1064, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1784, 111, 1001, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1785, 111, 1065, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1786, 111, 1002, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1787, 111, 1003, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1788, 111, 1004, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1789, 111, 1005, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1790, 111, 1006, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1791, 111, 1007, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1792, 111, 1008, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1793, 111, 1009, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1794, 111, 1010, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1795, 111, 1011, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1796, 111, 1012, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1797, 109, 100, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1798, 109, 101, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1799, 109, 1063, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1800, 109, 1064, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1801, 109, 1001, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1802, 109, 1065, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1803, 109, 1002, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1804, 109, 1003, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1805, 109, 1004, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1806, 109, 1005, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1807, 109, 1006, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1808, 109, 1007, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1809, 109, 1008, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1810, 109, 1009, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1811, 109, 1010, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1812, 109, 1011, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1813, 109, 1012, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1814, 111, 100, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1815, 111, 101, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1816, 111, 1063, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1817, 111, 1064, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1818, 111, 1001, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1819, 111, 1065, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1820, 111, 1002, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1821, 111, 1003, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1822, 111, 1004, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1823, 111, 1005, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1824, 111, 1006, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1825, 111, 1007, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1826, 111, 1008, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1827, 111, 1009, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1828, 111, 1010, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1829, 111, 1011, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1830, 111, 1012, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1831, 109, 103, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1832, 109, 1017, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1833, 109, 1018, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1834, 109, 1019, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1835, 109, 1020, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1836, 111, 103, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1837, 111, 1017, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1838, 111, 1018, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1839, 111, 1019, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1840, 111, 1020, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1841, 109, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1842, 109, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1843, 109, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1844, 109, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1845, 109, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` VALUES (1846, 111, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1847, 111, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1848, 111, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1849, 111, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1850, 111, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 122);
INSERT INTO `system_role_menu` VALUES (1851, 114, 1, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1852, 114, 1036, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1853, 114, 1037, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1854, 114, 1038, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1855, 114, 1039, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1856, 114, 100, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1857, 114, 101, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1858, 114, 1063, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1859, 114, 103, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1860, 114, 1064, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1861, 114, 1001, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1862, 114, 1065, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1863, 114, 1002, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1864, 114, 1003, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1865, 114, 107, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1866, 114, 1004, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1867, 114, 1005, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1868, 114, 1006, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1869, 114, 1007, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1870, 114, 1008, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1871, 114, 1009, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1872, 114, 1010, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1873, 114, 1011, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1874, 114, 1012, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1875, 114, 1017, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1876, 114, 1018, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1877, 114, 1019, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1878, 114, 1020, '1', '2022-12-30 11:32:03', '1', '2022-12-30 11:32:03', b'0', 125);
INSERT INTO `system_role_menu` VALUES (1879, 115, 1, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1880, 115, 1036, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1881, 115, 1037, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1882, 115, 1038, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1883, 115, 1039, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1884, 115, 100, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1885, 115, 101, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1886, 115, 1063, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1887, 115, 103, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1888, 115, 1064, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1889, 115, 1001, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1890, 115, 1065, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1891, 115, 1002, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1892, 115, 1003, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1893, 115, 107, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1894, 115, 1004, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1895, 115, 1005, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1896, 115, 1006, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1897, 115, 1007, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1898, 115, 1008, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1899, 115, 1009, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1900, 115, 1010, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1901, 115, 1011, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1902, 115, 1012, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1903, 115, 1017, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1904, 115, 1018, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1905, 115, 1019, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1906, 115, 1020, '1', '2022-12-30 11:33:42', '1', '2022-12-30 11:33:42', b'0', 126);
INSERT INTO `system_role_menu` VALUES (1907, 116, 1, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1908, 116, 1036, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1909, 116, 1037, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1910, 116, 1038, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1911, 116, 1039, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1912, 116, 100, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1913, 116, 101, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1914, 116, 1063, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1915, 116, 103, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1916, 116, 1064, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1917, 116, 1001, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1918, 116, 1065, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1919, 116, 1002, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1920, 116, 1003, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1921, 116, 107, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1922, 116, 1004, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1923, 116, 1005, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1924, 116, 1006, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1925, 116, 1007, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1926, 116, 1008, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1927, 116, 1009, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1928, 116, 1010, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1929, 116, 1011, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1930, 116, 1012, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1931, 116, 1017, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1932, 116, 1018, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1933, 116, 1019, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1934, 116, 1020, '1', '2022-12-30 11:33:48', '1', '2022-12-30 11:33:48', b'0', 127);
INSERT INTO `system_role_menu` VALUES (1963, 118, 1, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1964, 118, 1036, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1965, 118, 1037, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1966, 118, 1038, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1967, 118, 1039, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1968, 118, 100, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1969, 118, 101, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1970, 118, 1063, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1971, 118, 103, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1972, 118, 1064, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1973, 118, 1001, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1974, 118, 1065, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1975, 118, 1002, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1976, 118, 1003, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1977, 118, 107, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1978, 118, 1004, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1979, 118, 1005, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1980, 118, 1006, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1981, 118, 1007, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1982, 118, 1008, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1983, 118, 1009, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1984, 118, 1010, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1985, 118, 1011, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1986, 118, 1012, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1987, 118, 1017, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1988, 118, 1018, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1989, 118, 1019, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1990, 118, 1020, '1', '2022-12-30 11:47:52', '1', '2022-12-30 11:47:52', b'0', 129);
INSERT INTO `system_role_menu` VALUES (1991, 2, 1024, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1992, 2, 1025, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1993, 2, 1026, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1994, 2, 1027, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1995, 2, 1028, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1996, 2, 1029, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1997, 2, 1030, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1998, 2, 1031, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (1999, 2, 1032, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2000, 2, 1033, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2001, 2, 1034, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2002, 2, 1035, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2003, 2, 1036, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2004, 2, 1037, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2005, 2, 1038, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2006, 2, 1039, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2007, 2, 1040, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2008, 2, 1042, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2009, 2, 1043, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2010, 2, 1045, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2011, 2, 1046, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2012, 2, 1048, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2013, 2, 1050, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2014, 2, 1051, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2015, 2, 1052, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2016, 2, 1053, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2017, 2, 1054, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2018, 2, 1056, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2019, 2, 1057, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2020, 2, 1058, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2021, 2, 2083, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2022, 2, 1059, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2023, 2, 1060, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2024, 2, 1063, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2025, 2, 1064, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2026, 2, 1065, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2027, 2, 1066, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2028, 2, 1067, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2029, 2, 1070, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2030, 2, 1071, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2031, 2, 1072, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2032, 2, 1073, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2033, 2, 1074, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2034, 2, 1075, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2035, 2, 1076, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2036, 2, 1082, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2037, 2, 1085, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2038, 2, 1086, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2039, 2, 1087, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2040, 2, 1088, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2041, 2, 1089, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2042, 2, 1091, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2043, 2, 1092, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2044, 2, 1095, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2045, 2, 1096, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2046, 2, 1097, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2047, 2, 1098, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2048, 2, 1101, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2049, 2, 1102, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2050, 2, 1103, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2051, 2, 1104, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2052, 2, 1105, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2053, 2, 1106, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2054, 2, 1108, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2055, 2, 1109, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2056, 2, 1111, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2057, 2, 1112, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2058, 2, 1113, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2059, 2, 1114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2060, 2, 1115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2061, 2, 1127, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:12', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2062, 2, 1128, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:14', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2063, 2, 1129, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:46', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2064, 2, 1130, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:18', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2066, 2, 1132, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:44', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2067, 2, 1133, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:40', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2068, 2, 1134, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:38', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2069, 2, 1135, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:42', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2070, 2, 1136, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:36', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2071, 2, 1137, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:31', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2072, 2, 114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2073, 2, 1139, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2074, 2, 115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2075, 2, 1140, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2076, 2, 116, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2077, 2, 1141, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2078, 2, 1142, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2079, 2, 1143, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2080, 2, 1150, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:44:34', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2081, 2, 1161, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:10', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2082, 2, 1162, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:02', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2083, 2, 1163, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:04', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2084, 2, 1164, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:09', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2085, 2, 1165, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:06', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2086, 2, 1166, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:07', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2087, 2, 1173, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:22', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2088, 2, 1174, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:14', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2089, 2, 1175, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:15', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2090, 2, 1176, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:17', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2091, 2, 1177, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:19', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2092, 2, 1178, '1', '2023-01-25 08:42:52', '1', '2023-11-22 13:45:20', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2099, 2, 1226, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2100, 2, 1227, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2101, 2, 1228, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2102, 2, 1229, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2103, 2, 1237, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2104, 2, 1238, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2105, 2, 1239, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2106, 2, 1240, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2107, 2, 1241, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2108, 2, 1242, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2109, 2, 1243, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2110, 2, 1247, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2111, 2, 1248, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2112, 2, 1249, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2113, 2, 1250, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2114, 2, 1251, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2115, 2, 1252, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2116, 2, 1254, '1', '2023-01-25 08:42:52', '1', '2023-07-27 15:38:29', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2117, 2, 1255, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2118, 2, 1256, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2119, 2, 1257, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2120, 2, 1258, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2121, 2, 1259, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2122, 2, 1260, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2123, 2, 1261, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2124, 2, 1263, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2125, 2, 1264, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2126, 2, 1265, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2127, 2, 1266, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2128, 2, 1267, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2129, 2, 1001, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2130, 2, 1002, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2131, 2, 1003, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2132, 2, 1004, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2133, 2, 1005, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2134, 2, 1006, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2135, 2, 1007, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2136, 2, 1008, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2137, 2, 1009, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2138, 2, 1010, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2139, 2, 1011, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2140, 2, 1012, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2141, 2, 1013, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2142, 2, 1014, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2143, 2, 1015, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2144, 2, 1016, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2145, 2, 1017, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2146, 2, 1018, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2147, 2, 1019, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2148, 2, 1020, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2149, 2, 1021, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2150, 2, 1022, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2151, 2, 1023, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2152, 2, 1281, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2153, 2, 1282, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2154, 2, 2000, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2155, 2, 2002, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2156, 2, 2003, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2157, 2, 2004, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2158, 2, 2005, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2159, 2, 2006, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2160, 2, 2008, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2161, 2, 2009, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2162, 2, 2010, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2163, 2, 2011, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2164, 2, 2012, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2170, 2, 2019, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2171, 2, 2020, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2172, 2, 2021, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2173, 2, 2022, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2174, 2, 2023, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2175, 2, 2025, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2177, 2, 2027, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2178, 2, 2028, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2179, 2, 2029, '1', '2023-01-25 08:42:58', '1', '2023-01-25 08:42:58', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2180, 2, 2014, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2181, 2, 2015, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2182, 2, 2016, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2183, 2, 2017, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2184, 2, 2018, '1', '2023-01-25 08:43:12', '1', '2023-01-25 08:43:12', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2188, 101, 1024, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2189, 101, 1, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2190, 101, 1025, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2191, 101, 1026, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2192, 101, 1027, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2193, 101, 1028, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2194, 101, 1029, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2195, 101, 1030, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2196, 101, 1036, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2197, 101, 1037, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2198, 101, 1038, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2199, 101, 1039, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2200, 101, 1040, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2201, 101, 1042, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2202, 101, 1043, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2203, 101, 1045, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2204, 101, 1046, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2205, 101, 1048, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2206, 101, 2083, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2207, 101, 1063, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2208, 101, 1064, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2209, 101, 1065, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2210, 101, 1093, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2211, 101, 1094, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2212, 101, 1095, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2213, 101, 1096, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2214, 101, 1097, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2215, 101, 1098, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2216, 101, 1100, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2217, 101, 1101, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2218, 101, 1102, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2219, 101, 1103, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2220, 101, 1104, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2221, 101, 1105, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2222, 101, 1106, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2223, 101, 2130, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2224, 101, 1107, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2225, 101, 2131, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2226, 101, 1108, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2227, 101, 2132, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2228, 101, 1109, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2229, 101, 2133, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2230, 101, 2134, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2231, 101, 1110, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2232, 101, 2135, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2233, 101, 1111, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2234, 101, 2136, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2235, 101, 1112, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2236, 101, 2137, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2237, 101, 1113, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2238, 101, 2138, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2239, 101, 1114, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2240, 101, 2139, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2241, 101, 1115, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2242, 101, 2140, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2243, 101, 2141, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2244, 101, 2142, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2245, 101, 2143, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2246, 101, 2144, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2247, 101, 2145, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2248, 101, 2146, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2249, 101, 2147, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2250, 101, 100, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2251, 101, 2148, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2252, 101, 101, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2253, 101, 2149, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2254, 101, 102, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2255, 101, 2150, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2256, 101, 103, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2257, 101, 2151, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2258, 101, 104, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2259, 101, 2152, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2260, 101, 105, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2261, 101, 107, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2262, 101, 108, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2263, 101, 109, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2264, 101, 1138, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2265, 101, 1139, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2266, 101, 1140, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2267, 101, 1141, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2268, 101, 1142, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2269, 101, 1143, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2270, 101, 1224, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2271, 101, 1225, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2272, 101, 1226, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2273, 101, 1227, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2274, 101, 1228, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2275, 101, 1229, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2276, 101, 1247, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2277, 101, 1248, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2278, 101, 1249, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2279, 101, 1250, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2280, 101, 1251, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2281, 101, 1252, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2282, 101, 1261, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2283, 101, 1263, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2284, 101, 1264, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2285, 101, 1265, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2286, 101, 1266, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2287, 101, 1267, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2288, 101, 1001, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2289, 101, 1002, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2290, 101, 1003, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2291, 101, 1004, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2292, 101, 1005, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2293, 101, 1006, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2294, 101, 1007, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2295, 101, 1008, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2296, 101, 1009, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2297, 101, 1010, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2298, 101, 1011, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2299, 101, 1012, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2300, 101, 500, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2301, 101, 1013, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2302, 101, 501, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2303, 101, 1014, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2304, 101, 1015, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2305, 101, 1016, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2306, 101, 1017, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2307, 101, 1018, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2308, 101, 1019, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2309, 101, 1020, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2310, 101, 1021, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2311, 101, 1022, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2312, 101, 1023, '1', '2023-02-09 23:49:46', '1', '2024-01-16 15:16:25', b'1', 1);
INSERT INTO `system_role_menu` VALUES (2789, 136, 1, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2790, 136, 1036, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2791, 136, 1037, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2792, 136, 1038, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2793, 136, 1039, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2794, 136, 100, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2795, 136, 101, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2796, 136, 1063, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2797, 136, 103, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2798, 136, 1064, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2799, 136, 1001, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2800, 136, 1065, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2801, 136, 1002, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2802, 136, 1003, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2803, 136, 107, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2804, 136, 1004, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2805, 136, 1005, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2806, 136, 1006, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2807, 136, 1007, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2808, 136, 1008, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2809, 136, 1009, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2810, 136, 1010, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2811, 136, 1011, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2812, 136, 1012, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2813, 136, 1017, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2814, 136, 1018, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2815, 136, 1019, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2816, 136, 1020, '1', '2023-03-05 21:23:32', '1', '2023-03-05 21:23:32', b'0', 147);
INSERT INTO `system_role_menu` VALUES (2817, 137, 1, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2818, 137, 1036, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2819, 137, 1037, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2820, 137, 1038, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2821, 137, 1039, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2822, 137, 100, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2823, 137, 101, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2824, 137, 1063, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2825, 137, 103, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2826, 137, 1064, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2827, 137, 1001, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2828, 137, 1065, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2829, 137, 1002, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2830, 137, 1003, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2831, 137, 107, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2832, 137, 1004, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2833, 137, 1005, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2834, 137, 1006, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2835, 137, 1007, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2836, 137, 1008, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2837, 137, 1009, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2838, 137, 1010, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2839, 137, 1011, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2840, 137, 1012, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2841, 137, 1017, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2842, 137, 1018, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2843, 137, 1019, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2844, 137, 1020, '1', '2023-03-05 21:42:27', '1', '2023-03-05 21:42:27', b'0', 148);
INSERT INTO `system_role_menu` VALUES (2845, 138, 1, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2846, 138, 1036, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2847, 138, 1037, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2848, 138, 1038, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2849, 138, 1039, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2850, 138, 100, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2851, 138, 101, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2852, 138, 1063, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2853, 138, 103, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2854, 138, 1064, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2855, 138, 1001, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2856, 138, 1065, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2857, 138, 1002, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2858, 138, 1003, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2859, 138, 107, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2860, 138, 1004, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2861, 138, 1005, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2862, 138, 1006, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2863, 138, 1007, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2864, 138, 1008, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2865, 138, 1009, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2866, 138, 1010, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2867, 138, 1011, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2868, 138, 1012, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2869, 138, 1017, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2870, 138, 1018, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2871, 138, 1019, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2872, 138, 1020, '1', '2023-03-05 21:59:02', '1', '2023-03-05 21:59:02', b'0', 149);
INSERT INTO `system_role_menu` VALUES (2873, 139, 1, '1', '2023-07-27 16:54:32', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2874, 139, 1036, '1', '2023-07-27 16:54:32', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2875, 139, 1037, '1', '2023-07-27 16:54:32', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2876, 139, 1038, '1', '2023-07-27 16:54:32', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2877, 139, 1039, '1', '2023-07-27 16:54:32', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2878, 139, 100, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2879, 139, 101, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2880, 139, 1063, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2881, 139, 103, '1', '2023-07-27 16:54:32', '1', '2023-07-27 16:55:19', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2882, 139, 1064, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2883, 139, 1001, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2884, 139, 1065, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2885, 139, 1002, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2886, 139, 1003, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2887, 139, 107, '1', '2023-07-27 16:54:32', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2888, 139, 1004, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2889, 139, 1005, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2890, 139, 1006, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2891, 139, 1007, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:17', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2892, 139, 1008, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2893, 139, 1009, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2894, 139, 1010, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2895, 139, 1011, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2896, 139, 1012, '1', '2023-07-27 16:54:32', '1', '2023-08-02 17:33:33', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2897, 139, 1017, '1', '2023-07-27 16:54:32', '1', '2023-07-27 16:55:19', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2898, 139, 1018, '1', '2023-07-27 16:54:32', '1', '2023-07-27 16:55:19', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2899, 139, 1019, '1', '2023-07-27 16:54:32', '1', '2023-07-27 16:55:19', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2900, 139, 1020, '1', '2023-07-27 16:54:32', '1', '2023-07-27 16:55:19', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2901, 139, 1026, '1', '2023-07-27 16:55:19', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2902, 139, 2, '1', '2023-07-27 16:55:19', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2903, 139, 1030, '1', '2023-07-27 16:55:19', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2904, 139, 105, '1', '2023-07-27 16:55:19', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2905, 139, 116, '1', '2023-07-27 16:55:19', '1', '2023-12-12 16:16:32', b'1', 150);
INSERT INTO `system_role_menu` VALUES (2906, 139, 2303, '1', '2023-07-27 16:55:19', '1', '2023-07-27 16:55:19', b'0', 150);
INSERT INTO `system_role_menu` VALUES (2907, 1, 1024, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2908, 1, 1025, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2909, 1, 1026, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2910, 1, 1027, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2911, 1, 1028, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2912, 1, 1029, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2913, 1, 1030, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2914, 1, 1031, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2915, 1, 1032, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2916, 1, 1033, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2917, 1, 1034, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2918, 1, 1035, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2919, 1, 1036, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2920, 1, 1037, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2921, 1, 1038, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2922, 1, 1039, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2923, 1, 1040, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2924, 1, 1042, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2925, 1, 1043, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2926, 1, 1045, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2927, 1, 1046, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2928, 1, 1048, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2929, 1, 1050, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2930, 1, 1051, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2931, 1, 1052, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2932, 1, 1053, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2933, 1, 1054, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2934, 1, 1056, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2935, 1, 1057, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2936, 1, 1058, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2937, 1, 2083, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2938, 1, 1059, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2939, 1, 1060, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2940, 1, 1063, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2941, 1, 1064, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2942, 1, 1065, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2943, 1, 1066, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2944, 1, 1067, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2945, 1, 1070, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2946, 1, 1071, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2947, 1, 1072, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2948, 1, 1073, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2949, 1, 1074, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2950, 1, 1075, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2951, 1, 1076, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2952, 1, 1082, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2953, 1, 1085, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2954, 1, 1086, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2955, 1, 1087, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2956, 1, 1088, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2957, 1, 1089, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2958, 1, 1091, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2959, 1, 1092, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2960, 1, 1095, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2961, 1, 1096, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2962, 1, 1097, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2963, 1, 1098, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2964, 1, 1101, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2965, 1, 1102, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2966, 1, 1103, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2967, 1, 1104, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2968, 1, 1105, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2969, 1, 1106, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2970, 1, 2130, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2971, 1, 2131, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2972, 1, 1108, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2973, 1, 2132, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2974, 1, 1109, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2975, 1, 2133, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2976, 1, 2134, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2977, 1, 2135, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2978, 1, 1111, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2979, 1, 2136, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2980, 1, 1112, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2981, 1, 2137, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2982, 1, 1113, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2983, 1, 2138, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2984, 1, 1114, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2985, 1, 2139, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2986, 1, 1115, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2987, 1, 2140, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2988, 1, 2141, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2989, 1, 2142, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2990, 1, 2143, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2991, 1, 2144, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2992, 1, 2145, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2993, 1, 2146, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2994, 1, 2147, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2995, 1, 2148, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2996, 1, 2149, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2997, 1, 2150, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2998, 1, 2151, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (2999, 1, 1127, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:12', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3000, 1, 2152, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3001, 1, 1128, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:14', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3002, 1, 1129, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:46', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3003, 1, 1130, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:18', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3004, 1, 1132, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:44', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3005, 1, 1133, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:40', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3006, 1, 1134, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:38', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3007, 1, 1135, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:42', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3008, 1, 1136, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:36', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3009, 1, 1137, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:31', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3010, 1, 2161, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:54', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3011, 1, 114, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3012, 1, 1139, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3013, 1, 115, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3014, 1, 1140, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3015, 1, 116, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3016, 1, 1141, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3017, 1, 1142, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3018, 1, 1143, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3019, 1, 1150, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:34', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3020, 1, 1161, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:10', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3021, 1, 1162, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:02', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3022, 1, 1163, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:04', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3023, 1, 1164, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:09', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3024, 1, 1165, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:06', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3025, 1, 1166, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:07', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3026, 1, 1173, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:22', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3027, 1, 1174, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:14', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3028, 1, 1175, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:15', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3029, 1, 1176, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:17', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3030, 1, 1177, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:19', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3031, 1, 1178, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:45:20', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3032, 1, 1226, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3033, 1, 1227, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3034, 1, 1228, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3035, 1, 1229, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3036, 1, 1237, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3037, 1, 1238, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3038, 1, 1239, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3039, 1, 1240, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3040, 1, 1241, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3041, 1, 1242, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3042, 1, 1243, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3043, 1, 1247, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3044, 1, 1248, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3045, 1, 1249, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3046, 1, 1250, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3047, 1, 1251, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3048, 1, 1252, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3049, 1, 1255, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3050, 1, 1256, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3051, 1, 1257, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3052, 1, 1258, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3053, 1, 1259, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3054, 1, 1260, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3055, 1, 1261, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3056, 1, 1263, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3057, 1, 1264, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3058, 1, 1265, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3059, 1, 1266, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3060, 1, 1267, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3061, 1, 2301, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:58', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3062, 1, 2302, '1', '2023-07-28 16:38:57', '1', '2023-11-22 13:44:57', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3063, 1, 2303, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3064, 1, 2304, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3065, 1, 2305, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3066, 1, 2306, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3067, 1, 2307, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3068, 1, 2308, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3069, 1, 2309, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3070, 1, 2310, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3071, 1, 2311, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3072, 1, 2312, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3073, 1, 2313, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3074, 1, 2314, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3075, 1, 2315, '1', '2023-07-28 16:38:57', '1', '2024-01-16 15:19:33', b'1', 1);
INSERT INTO `system_role_menu` VALUES (3076, 1, 1001, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3077, 1, 1002, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3078, 1, 1003, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3079, 1, 1004, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3080, 1, 1005, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3081, 1, 1006, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3082, 1, 1007, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3083, 1, 1008, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3084, 1, 1009, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3085, 1, 1010, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3086, 1, 1011, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3087, 1, 1012, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3088, 1, 1013, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3089, 1, 1014, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3090, 1, 1015, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3091, 1, 1016, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3092, 1, 1017, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3093, 1, 1018, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3094, 1, 1019, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3095, 1, 1020, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3096, 1, 1021, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3097, 1, 1022, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3098, 1, 1023, '1', '2023-07-28 16:38:57', '1', '2023-07-28 16:38:57', b'0', 1);
INSERT INTO `system_role_menu` VALUES (3099, 139, 2304, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3100, 139, 2305, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3101, 139, 2306, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3102, 139, 2307, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3103, 139, 2308, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3104, 139, 2309, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3105, 139, 2310, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3106, 139, 2311, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3107, 139, 2312, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3108, 139, 2313, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3109, 139, 2314, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3110, 139, 2315, '1', '2023-07-28 16:42:30', '1', '2023-07-28 16:42:30', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3111, 139, 2316, '1', '2023-08-02 17:00:06', '1', '2023-08-08 11:35:59', b'1', 150);
INSERT INTO `system_role_menu` VALUES (3112, 139, 2317, '1', '2023-08-02 17:00:06', '1', '2023-08-08 11:35:59', b'1', 150);
INSERT INTO `system_role_menu` VALUES (3113, 139, 2318, '1', '2023-08-02 17:00:06', '1', '2023-08-08 11:35:59', b'1', 150);
INSERT INTO `system_role_menu` VALUES (3114, 139, 2319, '1', '2023-08-02 17:00:06', '1', '2023-08-08 11:35:59', b'1', 150);
INSERT INTO `system_role_menu` VALUES (3115, 139, 2320, '1', '2023-08-02 17:00:06', '1', '2023-08-08 11:35:59', b'1', 150);
INSERT INTO `system_role_menu` VALUES (3116, 139, 2321, '1', '2023-08-02 17:00:06', '1', '2023-08-08 11:35:59', b'1', 150);
INSERT INTO `system_role_menu` VALUES (3117, 139, 2322, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3118, 139, 2323, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3119, 139, 2324, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3120, 139, 2325, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3121, 139, 2326, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3122, 139, 2327, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3123, 139, 2328, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3124, 139, 2329, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3125, 139, 2330, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3126, 139, 2331, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3127, 139, 2332, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3128, 139, 2333, '1', '2023-08-02 17:00:06', '1', '2023-08-02 17:00:06', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3129, 139, 2334, '1', '2023-08-08 11:35:59', '1', '2023-08-08 11:35:59', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3130, 139, 2335, '1', '2023-08-08 11:35:59', '1', '2023-08-08 11:35:59', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3131, 139, 2339, '1', '2023-08-08 11:35:59', '1', '2023-08-08 11:35:59', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3132, 139, 2340, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3133, 139, 2341, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3134, 139, 2342, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3135, 139, 2343, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3136, 139, 2344, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3137, 139, 2345, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3138, 139, 2346, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3139, 139, 2347, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3140, 139, 2348, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3141, 139, 2349, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3142, 139, 2350, '1', '2023-11-22 14:00:04', '1', '2023-11-22 14:00:04', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3143, 139, 2352, '1', '2024-03-06 11:06:40', '1', '2024-03-06 11:06:40', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3144, 139, 2353, '1', '2024-03-06 11:06:40', '1', '2024-03-06 11:06:40', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3145, 139, 2354, '1', '2024-03-06 11:06:40', '1', '2024-03-06 11:06:40', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3146, 139, 2355, '1', '2024-03-06 11:06:40', '1', '2024-03-06 11:06:40', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3147, 139, 2356, '1', '2024-03-19 11:17:32', '1', '2024-03-19 11:17:32', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3148, 139, 2357, '1', '2024-03-19 11:17:32', '1', '2024-03-19 11:17:32', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3149, 139, 2358, '1', '2024-03-19 11:17:32', '1', '2024-03-19 11:17:32', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3150, 139, 2359, '1', '2024-03-19 11:17:32', '1', '2024-03-19 11:17:32', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3151, 139, 2360, '1', '2024-03-19 11:17:32', '1', '2024-03-19 11:17:32', b'0', 150);
INSERT INTO `system_role_menu` VALUES (3152, 139, 2361, '1', '2024-03-19 11:17:32', '1', '2024-03-19 11:17:32', b'0', 150);

-- ----------------------------
-- Table structure for system_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `system_sensitive_word`;
CREATE TABLE `system_sensitive_word`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '敏感词',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签数组',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '敏感词' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_sensitive_word
-- ----------------------------
INSERT INTO `system_sensitive_word` VALUES (3, '土豆', '好呀', '蔬菜,短信', 0, '1', '2022-04-08 21:07:12', '1', '2022-04-09 10:28:14', b'0');
INSERT INTO `system_sensitive_word` VALUES (4, 'XXX', NULL, '短信', 0, '1', '2022-04-08 21:27:49', '1', '2022-06-19 00:36:50', b'0');
INSERT INTO `system_sensitive_word` VALUES (5, '白痴', NULL, '测试', 0, '1', '2022-12-31 19:08:25', '1', '2022-12-31 19:08:25', b'0');

-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_channel`;
CREATE TABLE `system_sms_channel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信签名',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道编码',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的账号',
  `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 的秘钥',
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信发送回调 URL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信渠道' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
INSERT INTO `system_sms_channel` VALUES (2, 'Ballcat', 'ALIYUN', 0, '啦啦啦', 'LTAI5tCnKso2uG3kJ5gRav88', 'fGJ5SNXL7P1NHNRmJ7DJaMJGPyE55C', NULL, '', '2021-03-31 11:53:10', '1', '2021-04-14 00:08:37', b'0');
INSERT INTO `system_sms_channel` VALUES (4, '测试渠道', 'DEBUG_DING_TALK', 0, '123', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2021-04-13 00:23:14', '1', '2022-03-27 20:29:49', b'0');
INSERT INTO `system_sms_channel` VALUES (6, '测试演示', 'DEBUG_DING_TALK', 0, NULL, '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2022-04-10 23:07:59', '1', '2022-06-19 00:33:54', b'0');

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_code`;
CREATE TABLE `system_sms_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创建 IP',
  `scene` tinyint NOT NULL COMMENT '发送场景',
  `today_index` tinyint NOT NULL COMMENT '今日发送的第几条',
  `used` tinyint NOT NULL COMMENT '是否使用',
  `used_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '使用 IP',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 485 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '手机验证码' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_sms_code
-- ----------------------------
INSERT INTO `system_sms_code` VALUES (484, '15601691234', '9999', '0:0:0:0:0:0:0:1', 1, 1, 0, NULL, NULL, NULL, '2023-07-27 21:52:27', NULL, '2023-07-27 21:52:27', b'0', 150);

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_log`;
CREATE TABLE `system_sms_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `template_id` bigint NOT NULL COMMENT '模板编号',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `template_type` tinyint NOT NULL COMMENT '短信类型',
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信参数',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户编号',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '用户类型',
  `send_status` tinyint NOT NULL DEFAULT 0 COMMENT '发送状态',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `send_code` int NULL DEFAULT NULL COMMENT '发送结果的编码',
  `send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送结果的提示',
  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送结果的编码',
  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送失败的提示',
  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送返回的唯一请求 ID',
  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '短信 API 发送返回的序号',
  `receive_status` tinyint NOT NULL DEFAULT 0 COMMENT '接收状态',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '接收时间',
  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 接收结果的编码',
  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 接收结果的说明',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 350 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_sms_log
-- ----------------------------
INSERT INTO `system_sms_log` VALUES (349, 6, 'DEBUG_DING_TALK', 8, 'user-sms-login', 1, '您的验证码是9999', '{\"code\":\"9999\"}', '4372216', '15601691234', NULL, NULL, 10, '2023-07-27 21:52:28', 0, '成功', '0', NULL, NULL, 'f718a5ad-431d-4e15-be28-fa206ce788b3', 0, NULL, NULL, NULL, NULL, '2023-07-27 21:52:27', NULL, '2023-07-27 21:52:28', b'0');

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_template`;
CREATE TABLE `system_sms_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` tinyint NOT NULL COMMENT '短信签名',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板编码',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板内容',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信 API 的模板编号',
  `channel_id` bigint NOT NULL COMMENT '短信渠道编号',
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信渠道编码',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
INSERT INTO `system_sms_template` VALUES (2, 1, 0, 'test_01', '测试验证码短信', '正在进行登录操作{operation}，您的验证码是{code}', '[\"operation\",\"code\"]', NULL, '4383920', 6, 'DEBUG_DING_TALK', '', '2021-03-31 10:49:38', '1', '2022-12-10 21:26:20', b'0');
INSERT INTO `system_sms_template` VALUES (3, 1, 0, 'test_02', '公告通知', '您的验证码{code}，该验证码5分钟内有效，请勿泄漏于他人！', '[\"code\"]', NULL, 'SMS_207945135', 2, 'ALIYUN', '', '2021-03-31 11:56:30', '1', '2021-04-10 01:22:02', b'0');
INSERT INTO `system_sms_template` VALUES (6, 3, 0, 'test-01', '测试模板', '哈哈哈 {name}', '[\"name\"]', 'f哈哈哈', '4383920', 6, 'DEBUG_DING_TALK', '1', '2021-04-10 01:07:21', '1', '2022-12-10 21:26:09', b'0');
INSERT INTO `system_sms_template` VALUES (7, 3, 0, 'test-04', '测试下', '老鸡{name}，牛逼{code}', '[\"name\",\"code\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2021-04-13 00:29:53', '1', '2021-04-14 00:30:38', b'0');
INSERT INTO `system_sms_template` VALUES (8, 1, 0, 'user-sms-login', '前台用户短信登录', '您的验证码是{code}', '[\"code\"]', NULL, '4372216', 6, 'DEBUG_DING_TALK', '1', '2021-10-11 08:10:00', '1', '2022-12-10 21:25:59', b'0');
INSERT INTO `system_sms_template` VALUES (9, 2, 0, 'bpm_task_assigned', '【工作流】任务被分配', '您收到了一条新的待办任务：{processInstanceName}-{taskName}，申请人：{startUserNickname}，处理链接：{detailUrl}', '[\"processInstanceName\",\"taskName\",\"startUserNickname\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-21 22:31:19', '1', '2022-01-22 00:03:36', b'0');
INSERT INTO `system_sms_template` VALUES (10, 2, 0, 'bpm_process_instance_reject', '【工作流】流程被不通过', '您的流程被审批不通过：{processInstanceName}，原因：{reason}，查看链接：{detailUrl}', '[\"processInstanceName\",\"reason\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:03:31', '1', '2022-05-01 12:33:14', b'0');
INSERT INTO `system_sms_template` VALUES (11, 2, 0, 'bpm_process_instance_approve', '【工作流】流程被通过', '您的流程被审批通过：{processInstanceName}，查看链接：{detailUrl}', '[\"processInstanceName\",\"detailUrl\"]', NULL, 'suibian', 4, 'DEBUG_DING_TALK', '1', '2022-01-22 00:04:31', '1', '2022-03-27 20:32:21', b'0');
INSERT INTO `system_sms_template` VALUES (12, 2, 0, 'demo', '演示模板', '我就是测试一下下', '[]', NULL, 'biubiubiu', 6, 'DEBUG_DING_TALK', '1', '2022-04-10 23:22:49', '1', '2023-03-24 23:45:07', b'0');

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user`;
CREATE TABLE `system_social_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `type` tinyint NOT NULL COMMENT '社交平台的类型',
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '社交 openid',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '社交 token',
  `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始 Token 数据，一般是 JSON 格式',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始用户数据，一般是 JSON 格式',
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '最后一次的认证 code',
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后一次的认证 state',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_social_user
-- ----------------------------

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user_bind`;
CREATE TABLE `system_social_user_bind`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键(自增策略)',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '用户类型',
  `social_type` tinyint NOT NULL COMMENT '社交平台的类型',
  `social_user_id` bigint NOT NULL COMMENT '社交用户的编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社交绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_social_user_bind
-- ----------------------------

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant`;
CREATE TABLE `system_tenant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '租户编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '租户名',
  `contact_user_id` bigint NULL DEFAULT NULL COMMENT '联系人的用户编号',
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人',
  `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系手机',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '租户状态（0正常 1停用）',
  `domain` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '绑定域名',
  `package_id` bigint NOT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `account_count` int NOT NULL COMMENT '账号数量',
  `miniapp_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '小程序id',
  `miniapp_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '小程序secret',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
INSERT INTO `system_tenant` VALUES (1, '超级管理员', NULL, '超级管理员', '15675555180', 0, 'https://www.iocoder.cn', 0, '2099-02-19 17:14:16', 9999, NULL, NULL, '1', '2021-01-05 17:03:47', '1', '2024-03-06 16:48:05', b'0');
INSERT INTO `system_tenant` VALUES (150, '麻总监', 126, 'admin', '15675555180', 0, 'xxx.xxxxx.com', 111, '2029-01-01 00:00:00', 99999, NULL, NULL, '1', '2023-07-27 16:54:32', '1', '2024-01-16 15:17:46', b'0');

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant_package`;
CREATE TABLE `system_tenant_package`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '租户状态（0正常 1停用）',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `menu_ids` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关联的菜单编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '租户套餐表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
INSERT INTO `system_tenant_package` VALUES (111, '普通套餐', 0, '小功能', '[2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2322,2323,2324,2325,2326,2327,2328,2329,2330,2331,2332,2333,2334,2335,2339,2340,2341,2342,2343,2344,2345,2346,2347,2348,2349,2350,2352,2353,2354,2355,2356,2357,2358,2359,2360,2361,2303]', '1', '2022-02-22 00:54:00', '1', '2024-03-19 12:36:46', b'0');

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户ID',
  `post_id` bigint NOT NULL DEFAULT 0 COMMENT '岗位ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户岗位表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
INSERT INTO `system_user_post` VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` VALUES (114, 114, 3, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', b'0', 1);
INSERT INTO `system_user_post` VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', b'0', 1);
INSERT INTO `system_user_post` VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', b'0', 1);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', b'0', 1);
INSERT INTO `system_user_role` VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', b'0', 1);
INSERT INTO `system_user_role` VALUES (32, 127, 139, '126', '2023-07-27 17:08:41', '126', '2023-07-27 17:08:41', b'0', 150);

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位编号数组',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` tinyint NULL DEFAULT 0 COMMENT '用户性别',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`, `update_time`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_users
-- ----------------------------
INSERT INTO `system_users` VALUES (1, 'admin', '$2a$04$2Mr7d4GCn/.JlixMBkf4vOTeMT0s6k1WzAXt4/Li8.oLKxXTz27Bq', '超级管理员', '管理员', 103, '[1]', 'aoteman@126.com', '13112345678', 1, 'http://test.mazongjian.iocoder.cn/e1fdd7271685ec143a0900681606406621717a666ad0b2798b096df41422b32f.png', 0, '0:0:0:0:0:0:0:1', '2024-01-16 15:19:48', 'admin', '2021-01-05 17:03:47', '1', '2024-07-03 14:38:16', b'0', 1);
INSERT INTO `system_users` VALUES (127, 'yanfa', '$2a$04$2Mr7d4GCn/.JlixMBkf4vOTeMT0s6k1WzAXt4/Li8.oLKxXTz27Bq', '研发', NULL, NULL, '[]', '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2024-01-16 15:22:34', '126', '2023-07-27 17:08:29', '127', '2024-07-03 14:38:25', b'0', 150);

-- ----------------------------
-- Table structure for yshop_store_product
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product`;
CREATE TABLE `yshop_store_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id用\'',
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `bar_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品条码（一维码）',
  `brand_id` bigint NULL DEFAULT NULL COMMENT '品牌',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `vip_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '会员价格',
  `ot_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '市场价',
  `postage` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名',
  `sort` smallint NULL DEFAULT 0 COMMENT '排序',
  `sales` mediumint UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `stock` mediumint UNSIGNED NULL DEFAULT 0 COMMENT '库存',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否热卖',
  `is_benefit` tinyint(1) NULL DEFAULT 0 COMMENT '是否优惠',
  `is_best` tinyint(1) NULL DEFAULT 0 COMMENT '是否精品',
  `is_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品描述',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `is_postage` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '是否包邮',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '是否删除',
  `mer_use` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '获得积分',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `is_seckill` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `is_good` tinyint(1) NULL DEFAULT 0 COMMENT '是否优品推荐',
  `ficti` mediumint NULL DEFAULT 100 COMMENT '虚拟销量',
  `browse` int NULL DEFAULT 0 COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `is_sub` tinyint(1) NULL DEFAULT 0 COMMENT '是否单独分佣',
  `temp_id` int NULL DEFAULT 0 COMMENT '运费模板ID',
  `spec_type` tinyint(1) NULL DEFAULT 0 COMMENT '规格 0单 1多',
  `is_integral` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '是开启积分兑换',
  `integral` int NULL DEFAULT 0 COMMENT '需要多少积分兑换 只在开启积分兑换时生效',
  `tenant_id` bigint NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_benefit`(`is_benefit`) USING BTREE,
  INDEX `is_best`(`is_best`) USING BTREE,
  INDEX `is_new`(`is_new`) USING BTREE,
  INDEX `toggle_on_sale, is_del`(`deleted`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sales`(`sales`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_attr`;
CREATE TABLE `yshop_store_product_attr`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_attr
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_attr_result`;
CREATE TABLE `yshop_store_product_attr_result`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` bigint UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` datetime NOT NULL COMMENT '上次修改时间',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_attr_result
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_attr_value`;
CREATE TABLE `yshop_store_product_attr_value`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` bigint UNSIGNED NOT NULL COMMENT '商品ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `bar_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `ot_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原价',
  `weight` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '重量',
  `volume` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '体积',
  `brokerage` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '一级返佣',
  `brokerage_two` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '二级返佣',
  `pink_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '拼团价',
  `pink_stock` int NOT NULL DEFAULT 0 COMMENT '拼团库存',
  `seckill_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '秒杀价',
  `seckill_stock` int NOT NULL DEFAULT 0 COMMENT '秒杀库存',
  `integral` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000 COMMENT '需要多少积分兑换',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`, `sku`) USING BTREE,
  INDEX `store_id`(`product_id`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_attr_value
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_brand
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_brand`;
CREATE TABLE `yshop_store_product_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌图片',
  `sort` int NULL DEFAULT 0 COMMENT '品牌排序',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品品牌' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_brand
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_category
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_category`;
CREATE TABLE `yshop_store_product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id用\'',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父分类编号',
  `shop_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类图片',
  `sort` int NULL DEFAULT 0 COMMENT '分类排序',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类描述',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '开启状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_relation`;
CREATE TABLE `yshop_store_product_relation`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` bigint UNSIGNED NOT NULL COMMENT '用户ID',
  `product_id` bigint UNSIGNED NOT NULL COMMENT '商品ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '删除',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `product_id`, `type`, `category`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品点赞和收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_relation
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_reply`;
CREATE TABLE `yshop_store_product_reply`  (
  `reply_id` bigint NOT NULL COMMENT '评论id',
  `uid` bigint NOT NULL COMMENT '用户id',
  `oid` bigint NOT NULL COMMENT '订单id',
  `unique` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一id',
  `product_id` bigint NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品)',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论图片',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `merchant_reply_content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` datetime NULL DEFAULT NULL COMMENT '管理员回复时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回复1已回复',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_reply
-- ----------------------------

-- ----------------------------
-- Table structure for yshop_store_product_rule
-- ----------------------------
DROP TABLE IF EXISTS `yshop_store_product_rule`;
CREATE TABLE `yshop_store_product_rule`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rule_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `rule_value` json NOT NULL COMMENT '规格值',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '删除',
  `tenant_id` bigint NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规则值(规格)表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yshop_store_product_rule
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

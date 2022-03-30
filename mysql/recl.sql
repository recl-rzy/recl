/*
 Navicat Premium Data Transfer

 Source Server         : 47.108.105.42
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 47.108.105.42:3306
 Source Schema         : recl

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 26/03/2022 23:02:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint unsigned NOT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', NULL, NULL, 0, '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', NULL, NULL, 0, '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL, NULL, 0, '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL, NULL, 0, '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '咨询师管理', 1, NULL, '/counselor', 'Layout', NULL, NULL, 0, '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '咨询师列表', 1, NULL, 'list', '/edu/counselor/list', 'table', NULL, 0, '2019-11-15 22:35:52', '2022-03-11 21:34:26');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加咨询师', 1, NULL, 'save', '/edu/counselor/save', 'tree', NULL, 0, '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'counselor.add', '', '', NULL, NULL, 0, '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'counselor.list', '', '', NULL, NULL, 0, '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'counselor.update', 'edit/:id', '/edu/counselor/save', NULL, NULL, 0, '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'counselor.remove', '', '', NULL, NULL, 0, '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2019-11-18 13:38:56', '2019-11-18 13:38:56');
INSERT INTO `acl_permission` VALUES ('1502136512605663234', '1', '忆文管理', 1, NULL, '/article', 'Layout', NULL, NULL, 0, '2022-03-11 12:17:08', '2022-03-11 12:17:08');
INSERT INTO `acl_permission` VALUES ('1502137198135291906', '1502136512605663234', '忆文列表', 1, NULL, 'list', '/edu/article/list', NULL, NULL, 0, '2022-03-11 12:19:51', '2022-03-11 12:19:51');
INSERT INTO `acl_permission` VALUES ('1502142661576962050', '1502137198135291906', '删除', 2, 'article.remove', '', '', NULL, NULL, 0, '2022-03-11 12:41:34', '2022-03-11 12:41:34');
INSERT INTO `acl_permission` VALUES ('1502142853252460545', '1502137198135291906', '查看', 2, 'article.list', '', '', NULL, NULL, 0, '2022-03-11 12:42:19', '2022-03-11 12:42:19');
INSERT INTO `acl_permission` VALUES ('1502143260414521346', '1502137198135291906', '修改', 2, 'article.update', 'edit/:id', '/edu/article/update', NULL, NULL, 0, '2022-03-11 12:43:56', '2022-03-11 12:43:56');
INSERT INTO `acl_permission` VALUES ('1502144221614780417', '1502136512605663234', '忆文编辑发布', 1, NULL, 'send', '/edu/article/send', NULL, NULL, 0, '2022-03-11 12:47:46', '2022-03-11 12:47:46');
INSERT INTO `acl_permission` VALUES ('1502148199618523137', '1', '量表管理', 1, NULL, '/scale', 'Layout', NULL, NULL, 0, '2022-03-11 13:03:34', '2022-03-11 13:03:34');
INSERT INTO `acl_permission` VALUES ('1502148514434592770', '1502148199618523137', '量表管理列表', 1, NULL, 'list', '/edu/scale/list', NULL, NULL, 0, '2022-03-11 13:04:49', '2022-03-11 13:04:49');
INSERT INTO `acl_permission` VALUES ('1502148830735446018', '1502148514434592770', '修改', 2, 'scale.update', 'edit/:id', '/edu/scale/info', NULL, NULL, 0, '2022-03-11 13:06:04', '2022-03-11 13:06:04');
INSERT INTO `acl_permission` VALUES ('1502149528067846146', '1502148514434592770', '删除', 2, 'scale.remove', '', '', NULL, NULL, 0, '2022-03-11 13:08:51', '2022-03-11 13:08:51');
INSERT INTO `acl_permission` VALUES ('1502149633441345538', '1502148514434592770', '查看', 2, 'scale.list', '', '', NULL, NULL, 0, '2022-03-11 13:09:16', '2022-03-11 13:09:16');
INSERT INTO `acl_permission` VALUES ('1502149801909760002', '1502148199618523137', '量表编辑', 1, NULL, 'info', '/edu/scale/info', NULL, NULL, 0, '2022-03-11 13:09:56', '2022-03-11 13:10:19');
INSERT INTO `acl_permission` VALUES ('1502152046533488641', '1502149801909760002', '题目上传', 2, 'scale.subject', 'subject/:id', '/edu/scale/subject', NULL, NULL, 0, '2022-03-11 13:18:51', '2022-03-11 13:18:51');
INSERT INTO `acl_permission` VALUES ('1502152246048141313', '1502149801909760002', '评估策略上传', 2, 'scale.appraisal', 'appraisal/:id', '/edu/scale/appraisal', NULL, NULL, 0, '2022-03-11 13:19:39', '2022-03-11 13:19:39');
INSERT INTO `acl_permission` VALUES ('1502152358463877121', '1502149801909760002', '发布审核', 2, 'scale.send', 'send/:id', '/edu/scale/send', NULL, NULL, 0, '2022-03-11 13:20:06', '2022-03-11 13:20:06');
INSERT INTO `acl_permission` VALUES ('1502156955735633921', '1', '量表分类管理', 1, NULL, '/classify', 'Layout', NULL, NULL, 0, '2022-03-11 13:38:22', '2022-03-11 13:38:22');
INSERT INTO `acl_permission` VALUES ('1502157101953265666', '1502156955735633921', '分类列表', 1, NULL, 'list', '/edu/classify/list', NULL, NULL, 0, '2022-03-11 13:38:56', '2022-03-11 13:38:56');
INSERT INTO `acl_permission` VALUES ('1502157256509173762', '1502156955735633921', '量表分类添加', 1, NULL, 'save', '/edu/classify/add', NULL, NULL, 0, '2022-03-11 13:39:33', '2022-03-11 13:39:33');
INSERT INTO `acl_permission` VALUES ('1502157667907481601', '1', '倾听师管理', 1, NULL, '/listener', 'Layout', NULL, NULL, 0, '2022-03-11 13:41:11', '2022-03-11 13:41:11');
INSERT INTO `acl_permission` VALUES ('1502157885994512386', '1502157667907481601', '倾听师列表', 1, NULL, 'list', '/edu/listener/list', NULL, NULL, 0, '2022-03-11 13:42:03', '2022-03-13 15:55:14');
INSERT INTO `acl_permission` VALUES ('1502158086964588546', '1502157667907481601', '倾听师添加', 1, NULL, 'add', '/edu/listener/save', NULL, NULL, 0, '2022-03-11 13:42:51', '2022-03-11 13:43:46');
INSERT INTO `acl_permission` VALUES ('1502158572480442370', '1502157885994512386', '查看', 2, 'listener.list', '', '', NULL, NULL, 0, '2022-03-11 13:44:47', '2022-03-11 13:44:47');
INSERT INTO `acl_permission` VALUES ('1502158732103069698', '1502157885994512386', '修改', 2, 'listener.update', 'edit/:id', '/edu/listener/save', NULL, NULL, 0, '2022-03-11 13:45:25', '2022-03-11 13:45:25');
INSERT INTO `acl_permission` VALUES ('1502158874101231618', '1502157885994512386', '删除', 2, 'listener.remove', '', '', NULL, NULL, 0, '2022-03-11 13:45:59', '2022-03-11 13:45:59');
INSERT INTO `acl_permission` VALUES ('1502159187214413826', '1502158086964588546', '添加', 2, 'listener.add', 'add', '/edu/listener/save', NULL, NULL, 0, '2022-03-11 13:47:14', '2022-03-11 13:47:14');
INSERT INTO `acl_permission` VALUES ('1502159857036374018', '1', 'FM管理', 1, NULL, '/FM', 'Layout', NULL, NULL, 0, '2022-03-11 13:49:53', '2022-03-24 15:31:46');
INSERT INTO `acl_permission` VALUES ('1502159982529949697', '1502159857036374018', 'FM列表', 1, NULL, 'list', '/edu/FM/list', NULL, NULL, 0, '2022-03-11 13:50:23', '2022-03-24 15:32:53');
INSERT INTO `acl_permission` VALUES ('1502160251183509506', '1502159982529949697', '修改', 2, 'FM.update', 'edit/:id', '/edu/FM/save', NULL, NULL, 0, '2022-03-11 13:51:27', '2022-03-24 15:33:20');
INSERT INTO `acl_permission` VALUES ('1502160353373532161', '1502159982529949697', '查看', 2, 'FM.list', '', '', NULL, NULL, 0, '2022-03-11 13:51:52', '2022-03-24 15:33:09');
INSERT INTO `acl_permission` VALUES ('1502160447644708865', '1502159982529949697', '删除', 2, 'FM.remove', '', '', NULL, NULL, 0, '2022-03-11 13:52:14', '2022-03-24 15:33:02');
INSERT INTO `acl_permission` VALUES ('1502160700624154625', '1502159857036374018', '播放背景管理', 1, NULL, 'coverList', '/edu/FM/cover/list', NULL, NULL, 0, '2022-03-11 13:53:14', '2022-03-24 15:32:38');
INSERT INTO `acl_permission` VALUES ('1502161001456414721', '1502160700624154625', '查看', 2, 'cover.list', '', '', NULL, NULL, 0, '2022-03-11 13:54:26', '2022-03-11 13:54:26');
INSERT INTO `acl_permission` VALUES ('1502161070666625025', '1502160700624154625', '删除', 2, 'cover.remove', '', '', NULL, NULL, 0, '2022-03-11 13:54:43', '2022-03-11 13:54:43');
INSERT INTO `acl_permission` VALUES ('1502162447614685185', '1502159857036374018', '播放背景添加', 1, NULL, 'cover', '/edu/FM/cover/cover', NULL, NULL, 0, '2022-03-11 14:00:11', '2022-03-24 15:32:21');
INSERT INTO `acl_permission` VALUES ('1502934820764823554', '1', '心理档案管理', 1, NULL, '/doc', 'Layout', NULL, NULL, 0, '2022-03-13 17:09:19', '2022-03-13 17:09:19');
INSERT INTO `acl_permission` VALUES ('1502935133815091202', '1502934820764823554', '量表测评', 1, NULL, 'docScale', '/edu/doc/docScale', NULL, NULL, 0, '2022-03-13 17:10:34', '2022-03-14 09:20:11');
INSERT INTO `acl_permission` VALUES ('1502937628998152194', '1502934820764823554', '专家咨询', 1, NULL, 'docCounselor', '/edu/doc/docCounselor', NULL, NULL, 0, '2022-03-13 17:20:29', '2022-03-14 09:20:29');
INSERT INTO `acl_permission` VALUES ('1502937827413897217', '1502934820764823554', '专家倾听', 1, NULL, 'docListener', '/edu/doc/docListener', NULL, NULL, 0, '2022-03-13 17:21:16', '2022-03-14 09:20:47');
INSERT INTO `acl_permission` VALUES ('1503354320450510850', '1502144221614780417', '添加', 2, 'article.add', '', '', NULL, NULL, 0, '2022-03-14 20:56:16', '2022-03-14 20:56:16');
INSERT INTO `acl_permission` VALUES ('1503354445952475138', '1502162447614685185', '添加', 2, 'FM.add', '', '', NULL, NULL, 0, '2022-03-14 20:56:46', '2022-03-24 15:32:29');
INSERT INTO `acl_permission` VALUES ('1503354557982334978', '1502935133815091202', '删除', 2, 'docScale.remove', '', '', NULL, NULL, 0, '2022-03-14 20:57:12', '2022-03-14 20:57:12');
INSERT INTO `acl_permission` VALUES ('1503718341578108930', '1502159857036374018', 'FM添加', 1, NULL, 'add', '/edu/FM/save', NULL, NULL, 0, '2022-03-15 21:02:45', '2022-03-24 15:32:01');
INSERT INTO `acl_permission` VALUES ('1503718474000674818', '1503718341578108930', '添加', 2, 'FM.add', '', '', NULL, NULL, 0, '2022-03-15 21:03:17', '2022-03-24 15:32:11');
INSERT INTO `acl_permission` VALUES ('1507281512848973825', '1502159857036374018', 'FM发布', 1, NULL, 'publish', '/edu/FM/publish', NULL, NULL, 0, '2022-03-25 17:01:31', '2022-03-25 17:01:31');
INSERT INTO `acl_permission` VALUES ('1507282375604723713', '1507281512848973825', '发布', 2, 'FM.publish', '', '', NULL, NULL, 0, '2022-03-25 17:04:57', '2022-03-25 17:04:57');
INSERT INTO `acl_permission` VALUES ('1507282462485536769', '1507281512848973825', '删除', 2, 'FM.remove', '', '', NULL, NULL, 0, '2022-03-25 17:05:18', '2022-03-25 17:05:18');
INSERT INTO `acl_permission` VALUES ('1507606338453123074', '1', '后台数据管理', 1, NULL, '/statistics', 'Layout', NULL, NULL, 0, '2022-03-26 14:32:16', '2022-03-26 14:32:31');
INSERT INTO `acl_permission` VALUES ('1507606686131564546', '1507606338453123074', '服务数据', 1, NULL, 'service', '/edu/statistics/service', NULL, NULL, 0, '2022-03-26 14:33:39', '2022-03-26 14:33:39');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint unsigned NOT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1503533558055092225', '普通管理员', NULL, NULL, 0, '2022-03-15 08:48:29', '2022-03-15 08:48:29');
INSERT INTO `acl_role` VALUES ('1503540540069728258', '咨询师', NULL, NULL, 0, '2022-03-15 09:16:14', '2022-03-15 09:16:14');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint unsigned NOT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1503538928538439682', '1503533558055092225', '1', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439683', '1503533558055092225', '1502148199618523137', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439684', '1503533558055092225', '1502149801909760002', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439685', '1503533558055092225', '1502152046533488641', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439686', '1503533558055092225', '1502152246048141313', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439687', '1503533558055092225', '1502152358463877121', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439688', '1503533558055092225', '1502156955735633921', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439689', '1503533558055092225', '1502157101953265666', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439690', '1503533558055092225', '1502157256509173762', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439691', '1503533558055092225', '1502157667907481601', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439692', '1503533558055092225', '1502157885994512386', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439693', '1503533558055092225', '1502158572480442370', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439694', '1503533558055092225', '1502158732103069698', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439695', '1503533558055092225', '1502158874101231618', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439696', '1503533558055092225', '1502158086964588546', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439697', '1503533558055092225', '1502159187214413826', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439698', '1503533558055092225', '1502159857036374018', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439699', '1503533558055092225', '1502159982529949697', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439700', '1503533558055092225', '1502160251183509506', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439701', '1503533558055092225', '1502160353373532161', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439702', '1503533558055092225', '1502160447644708865', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439703', '1503533558055092225', '1502160700624154625', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439704', '1503533558055092225', '1502161001456414721', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439705', '1503533558055092225', '1502161070666625025', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439706', '1503533558055092225', '1502162447614685185', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439707', '1503533558055092225', '1503354445952475138', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439708', '1503533558055092225', '1502934820764823554', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439709', '1503533558055092225', '1502935133815091202', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503538928538439710', '1503533558055092225', '1503354557982334978', 0, '2022-03-15 09:09:50', '2022-03-15 09:09:50');
INSERT INTO `acl_role_permission` VALUES ('1503719549239865345', '1503540540069728258', '1', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549239865346', '1503540540069728258', '1502136512605663234', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549239865347', '1503540540069728258', '1502137198135291906', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549239865348', '1503540540069728258', '1502142661576962050', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549239865349', '1503540540069728258', '1502142853252460545', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974210', '1503540540069728258', '1502143260414521346', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974211', '1503540540069728258', '1502144221614780417', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974212', '1503540540069728258', '1503354320450510850', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974213', '1503540540069728258', '1502148199618523137', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974214', '1503540540069728258', '1502148514434592770', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974215', '1503540540069728258', '1502148830735446018', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974216', '1503540540069728258', '1502149528067846146', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974217', '1503540540069728258', '1502149633441345538', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974218', '1503540540069728258', '1502149801909760002', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974219', '1503540540069728258', '1502152046533488641', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974220', '1503540540069728258', '1502152246048141313', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974221', '1503540540069728258', '1502152358463877121', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974222', '1503540540069728258', '1502159857036374018', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974223', '1503540540069728258', '1502159982529949697', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974224', '1503540540069728258', '1502160251183509506', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974225', '1503540540069728258', '1502160353373532161', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974226', '1503540540069728258', '1502160447644708865', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974227', '1503540540069728258', '1502160700624154625', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974228', '1503540540069728258', '1502161001456414721', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974229', '1503540540069728258', '1502161070666625025', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974230', '1503540540069728258', '1502162447614685185', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974231', '1503540540069728258', '1503354445952475138', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974232', '1503540540069728258', '1503718341578108930', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974233', '1503540540069728258', '1503718474000674818', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974234', '1503540540069728258', '1502934820764823554', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719549306974235', '1503540540069728258', '1502935133815091202', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');
INSERT INTO `acl_role_permission` VALUES ('1503719550867255298', '1503540540069728258', '1503354557982334978', 0, '2022-03-15 21:07:33', '2022-03-15 21:07:33');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_counselor` tinyint(1) NOT NULL DEFAULT 0,
  `is_listener` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint unsigned NOT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', 'c76133fda827c69efb2258ab2857b73c', '风吹起海棠', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/08/10/9060f46f93984b5ca4d6c105d3f5a743file.png', NULL, 0, 0, 0, '2019-11-01 10:39:47', '2019-11-01 10:39:47');
INSERT INTO `acl_user` VALUES ('1502211201646481410', '18582416620', 'c76133fda827c69efb2258ab2857b73c', '李晴', NULL, NULL, 1, 0, 0, '2022-03-11 17:13:55', '2022-03-23 16:52:15');
INSERT INTO `acl_user` VALUES ('1502211555981283330', '18582416621', 'c76133fda827c69efb2258ab2857b73c', '王梅', NULL, NULL, 1, 0, 0, '2022-03-11 17:15:19', '2022-03-23 15:30:02');
INSERT INTO `acl_user` VALUES ('1502211653154918401', '18582416622', 'c76133fda827c69efb2258ab2857b73c', '李九', NULL, NULL, 1, 0, 0, '2022-03-11 17:15:43', '2022-03-11 17:15:43');
INSERT INTO `acl_user` VALUES ('1502211793588604930', '18582416623', 'c76133fda827c69efb2258ab2857b73c', '艾希', NULL, NULL, 1, 0, 0, '2022-03-11 17:16:16', '2022-03-11 17:16:16');
INSERT INTO `acl_user` VALUES ('1502246606873903105', '18582416624', 'c76133fda827c69efb2258ab2857b73c', '天云', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/11/4d0bb68512f446c5b1baeb759f9d9f17file.png', NULL, 1, 0, 0, '2022-03-11 19:34:36', '2022-03-11 19:34:36');
INSERT INTO `acl_user` VALUES ('1502922324813357057', '15892701910', 'c76133fda827c69efb2258ab2857b73c', '艾心', NULL, NULL, 0, 1, 0, '2022-03-13 16:19:40', '2022-03-13 16:19:40');
INSERT INTO `acl_user` VALUES ('1502922398549221377', '15892701911', 'c76133fda827c69efb2258ab2857b73c', '周晴', NULL, NULL, 0, 1, 0, '2022-03-13 16:19:57', '2022-03-13 16:19:57');
INSERT INTO `acl_user` VALUES ('1502922492942032898', '15892701912', 'c76133fda827c69efb2258ab2857b73c', '赵杰', NULL, NULL, 0, 1, 0, '2022-03-13 16:20:20', '2022-03-13 16:20:20');
INSERT INTO `acl_user` VALUES ('1502922580292608001', '15892701913', 'c76133fda827c69efb2258ab2857b73c', '杨晨', NULL, NULL, 0, 1, 0, '2022-03-13 16:20:41', '2022-03-13 16:20:41');
INSERT INTO `acl_user` VALUES ('1502922681920593921', '15892701914', 'c76133fda827c69efb2258ab2857b73c', '王夕', NULL, NULL, 0, 1, 0, '2022-03-13 16:21:05', '2022-03-13 16:21:05');
INSERT INTO `acl_user` VALUES ('1502922815236546561', '15892701915', 'c76133fda827c69efb2258ab2857b73c', '沐辰', NULL, NULL, 0, 1, 0, '2022-03-13 16:21:37', '2022-03-13 16:21:37');
INSERT INTO `acl_user` VALUES ('1503360545816846337', 'admin1', 'c76133fda827c69efb2258ab2857b73c', 'admin1', NULL, NULL, 0, 0, 0, '2022-03-14 21:21:00', '2022-03-14 21:21:00');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint unsigned NOT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1503538971286786049', '1503533558055092225', '1503360545816846337', 0, '2022-03-15 09:10:00', '2022-03-15 09:10:00');
INSERT INTO `acl_user_role` VALUES ('1503540728809213953', '1503540540069728258', '1502211201646481410', 0, '2022-03-15 09:16:59', '2022-03-15 09:16:59');
INSERT INTO `acl_user_role` VALUES ('1503693053800525825', '1503540540069728258', '1502211555981283330', 0, '2022-03-15 19:22:16', '2022-03-15 19:22:16');
INSERT INTO `acl_user_role` VALUES ('1503693076852420609', '1503540540069728258', '1502211653154918401', 0, '2022-03-15 19:22:21', '2022-03-15 19:22:21');
INSERT INTO `acl_user_role` VALUES ('1503693098125930498', '1503540540069728258', '1502211793588604930', 0, '2022-03-15 19:22:27', '2022-03-15 19:22:27');
INSERT INTO `acl_user_role` VALUES ('1503693122616471554', '1503540540069728258', '1502246606873903105', 0, '2022-03-15 19:22:32', '2022-03-15 19:22:32');

-- ----------------------------
-- Table structure for article_comment_praise
-- ----------------------------
DROP TABLE IF EXISTS `article_comment_praise`;
CREATE TABLE `article_comment_praise`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论点赞唯一id',
  `praise_user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点赞用户唯一id',
  `comment_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属评论id',
  `comment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评论状态（0表示已点赞， 1表示取消点赞）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_comment_praise
-- ----------------------------
INSERT INTO `article_comment_praise` VALUES ('1451810022699929602', '1439828722283794437', '1447180441426632705', 0, 0, '2021-10-23 15:17:37', '2022-02-27 19:22:30');
INSERT INTO `article_comment_praise` VALUES ('1451852388047548417', '1439828722283794433', '1451534090926907394', 0, 0, '2021-10-23 18:05:58', '2022-02-27 19:22:32');
INSERT INTO `article_comment_praise` VALUES ('1451852485326041089', '1439828722283794436', '1447180082071248897', 0, 0, '2021-10-23 18:06:21', '2021-10-23 20:44:32');
INSERT INTO `article_comment_praise` VALUES ('1451852492611547137', '1439828722283794435', '1447179887996608514', 0, 0, '2021-10-23 18:06:23', '2022-02-27 19:22:27');
INSERT INTO `article_comment_praise` VALUES ('1451892265501880321', '1439828722283794433', '1451892228063522818', 0, 0, '2021-10-23 20:44:26', '2022-02-27 19:22:34');
INSERT INTO `article_comment_praise` VALUES ('1503351985074642945', '1439828722283794433', '1503269571501498369', 1, 0, '2022-03-14 20:46:59', '2022-03-14 20:47:03');
INSERT INTO `article_comment_praise` VALUES ('1503352008579522561', '1439828722283794433', '1503269567823093762', 0, 0, '2022-03-14 20:47:04', '2022-03-14 20:47:04');
INSERT INTO `article_comment_praise` VALUES ('1503352016179601409', '1439828722283794433', '1503351951906086914', 1, 0, '2022-03-14 20:47:06', '2022-03-14 20:47:23');

-- ----------------------------
-- Table structure for chat_msg
-- ----------------------------
DROP TABLE IF EXISTS `chat_msg`;
CREATE TABLE `chat_msg`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '聊天记录唯一id',
  `send_user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送方用户id',
  `receive_user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收方用户id',
  `send_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送内容',
  `send_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送状态（0代表单聊，1表示群聊）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat_msg
-- ----------------------------
INSERT INTO `chat_msg` VALUES ('1459779299235082241', '1439828722283794434', '1439828722283794433', '咨询师，你好<div><br></div>', '0', 0, '2021-11-14 15:04:41', '2021-11-14 15:04:41');
INSERT INTO `chat_msg` VALUES ('1459779496648388609', '1439828722283794433', '1439828722283794434', '你好，请问你最近是否有烦心事呢', '0', 0, '2021-11-14 15:05:28', '2021-11-14 15:05:28');
INSERT INTO `chat_msg` VALUES ('1459779540885712897', '1439828722283794434', '1439828722283794433', '是的', '0', 0, '2021-11-14 15:05:39', '2021-11-14 15:05:39');

-- ----------------------------
-- Table structure for daily_statistics
-- ----------------------------
DROP TABLE IF EXISTS `daily_statistics`;
CREATE TABLE `daily_statistics`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日常数据唯一id',
  `date_calculated` date NOT NULL COMMENT '统计日期',
  `login_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天登录用户数量',
  `register_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天注册用户数量',
  `scale_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天量表服务访问量',
  `music_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天音频服务访问量',
  `article_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天美文服务访问量',
  `consult_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天咨询服务访问量',
  `listen_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天倾听服务访问量',
  `request_count` int(0) NOT NULL DEFAULT 0 COMMENT '当天请求次数',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `date_calculated`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily_statistics
-- ----------------------------
INSERT INTO `daily_statistics` VALUES ('12313', '2022-03-25', 190, 100, 120, 120, 110, 70, 102, 400, 0, '2022-03-25 15:34:46', '2022-03-25 15:34:50');

-- ----------------------------
-- Table structure for doc_scale
-- ----------------------------
DROP TABLE IF EXISTS `doc_scale`;
CREATE TABLE `doc_scale`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录唯一id',
  `scale_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '量表id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `appraisal_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测评结果',
  `warning_level` int(0) NOT NULL COMMENT '(0表示正常， 1表示一级预警（测评者有轻微的心理问题），2表示二级预警（测评者有较为严重的心理问题，需要进行心理疏导），3表示三级预警，测评者患有严重心理问题，需要立刻就医治疗)',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc_scale
-- ----------------------------
INSERT INTO `doc_scale` VALUES ('1502981794595622914', '1425400052131688449', '1439828722283794433', '中度抑郁', 2, 0, '2022-03-13 20:15:59', '2022-03-13 20:15:59');
INSERT INTO `doc_scale` VALUES ('1502982365088075777', '1425706032405016577', '1439828722283794433', '需要进一步的诊断被认为确有心理卫生问题的学生，该学生需要进行持续的心理咨询', 3, 0, '2022-03-13 20:18:15', '2022-03-13 20:18:15');
INSERT INTO `doc_scale` VALUES ('1502989666729603074', '1425400052131688449', '1439828722283794433', '中度抑郁', 2, 0, '2022-03-13 20:47:15', '2022-03-13 20:47:15');
INSERT INTO `doc_scale` VALUES ('1502991014623719426', '1425400052131688449', '1439828722283794433', '轻度抑郁', 1, 0, '2022-03-13 20:52:37', '2022-03-13 20:52:37');
INSERT INTO `doc_scale` VALUES ('1502991796886581249', '1425400052131688449', '1439828722283794433', '中度抑郁', 2, 0, '2022-03-13 20:55:43', '2022-03-13 20:55:43');
INSERT INTO `doc_scale` VALUES ('1502992428380991489', '1425400052131688449', '1439828722283794433', '中度抑郁', 2, 0, '2022-03-13 20:58:14', '2022-03-13 20:58:14');
INSERT INTO `doc_scale` VALUES ('1502992746292457474', '1425400052131688449', '1439828722283794433', '中度抑郁', 2, 0, '2022-03-13 20:59:30', '2022-03-13 20:59:30');
INSERT INTO `doc_scale` VALUES ('1502993121108045825', '1425400052131688449', '1439828722283794433', '正常', 0, 0, '2022-03-13 21:00:59', '2022-03-13 21:00:59');
INSERT INTO `doc_scale` VALUES ('1503270730006011905', '1425706032405016577', '1439828722283794433', '需要进一步的诊断被认为确有心理卫生问题的学生，该学生需要进行持续的心理咨询', 3, 0, '2022-03-14 15:24:06', '2022-03-14 15:24:06');

-- ----------------------------
-- Table structure for edu_article
-- ----------------------------
DROP TABLE IF EXISTS `edu_article`;
CREATE TABLE `edu_article`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美文唯一id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布者用户id',
  `one_tag` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美文所属标签1',
  `two_tag` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '美文所属标签2',
  `three_tag` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '美文所属标签3',
  `title` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美文标题名称',
  `article_classify` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属分类名称',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美文内容部分',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '封面图片地址',
  `view_count` bigint(0) NOT NULL DEFAULT 0 COMMENT '访问量',
  `praise_count` bigint(0) NOT NULL DEFAULT 0 COMMENT '点赞量',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Draft' COMMENT '审核状态（Draft 表示未审核， Normal表示审核成功）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_article
-- ----------------------------
INSERT INTO `edu_article` VALUES ('1427253476267683842', '1502211201646481410', '未来心理', '畅享未来心理学', NULL, '心理咨询师会被人工智能（AI）取代吗？发抖也要看完！', '社会热点', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<blockquote>\n<p><strong>我们个人存在的时间都极为短暂，其间只能探索整个宇宙的小部分。但人类是好奇的族类&hellip;&hellip;</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>我们怎么能理解我们处于其中的世界呢？宇宙如何运行？什么是实在的本性？所有这一切从何而来？宇宙需要一个造物主吗？</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p>&nbsp;</p>\n<p><strong>我们中的多数人在大部分时间里不为这些问题烦恼，但是我们几乎每个人有时会为这些问题所困扰。</strong></p>\n<p>&nbsp;</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>&nbsp;&mdash;&mdash;斯蒂芬&middot;威廉&middot;霍金</strong></p>\n<p><strong>Stephen William Hawking</strong></p>\n</blockquote>\n<br />\n<h1><strong>01<br /></strong></h1>\n<h1><strong>问题的提出：</strong></h1>\n<h1><strong>普遍的观点很可能是错的</strong></h1>\n<p>&nbsp;</p>\n<p>1879年，德国学者冯特受自然科学的影响，在莱比锡大学建立第一个心理实验室，这标志着科学心理学的诞生。大约同一时期，心理咨询这个职业开始萌芽。</p>\n<p>&nbsp;</p>\n<p>1956年，麦卡赛、明斯基等科学家聚在一起，共同研究和探讨用机器模拟智能的一系列有关问题，首次提出&ldquo;人工智能&rdquo;的概念， &ldquo;人工智能&rdquo;这一新兴学科由此诞生。</p>\n<p>&nbsp;</p>\n<p><strong>在故事刚开始的时候，心理咨询和人工智能并不认识，也没有血缘关系。可以说，他们几乎是平行的，一点也不搭嘎。</strong></p>\n<p>&nbsp;</p>\n<p>不过，树大了总是会招风的。近年来，这两个行业发展迅速，尤其是人工智能的发展，更加激发了人类对未来的想象力。</p>\n<p>&nbsp;</p>\n<p>好奇的人类，终于开始担心起两个行业的命运来。具体来说，就是担心心理咨询这个职业有没有可能被人工智能灭掉？</p>\n<p>&nbsp;</p>\n<p>对这个问题的探讨，是个哲学问题，也是个科学问题。</p>\n<p>&nbsp;</p>\n<p>前几年，BBC发布过一项研究，剑桥大学的两位人工智能研究人员分析了 365 个职业在未来10年的&ldquo;被淘汰概率&rdquo;，他们得出结论：心理医生被人工智能取代的概率是0.7%。</p>\n<p>&nbsp;</p>\n<p>如果你不知道这个数字是什么概念，我可以告诉你，在这项研究中，第一名电话销售员职业的&ldquo;得分&rdquo;是99%，一般人认为很难被取代的音乐家职业&ldquo;得分&rdquo;4.5%。</p>\n<p>&nbsp;</p>\n<p><strong>这项研究代表了一种普遍的观点：人们一般认为，心理咨询（广义的心理咨询包括心理治疗）是几乎不可能被AI取代的。</strong></p>\n<p>&nbsp;</p>\n<p>作为一名心理咨询师，从情感上来说，我是非常愿意接受这个观点的。有谁愿意自己从事的职业被集体&ldquo;fire&rdquo;掉呢？</p>\n<p>&nbsp;</p>\n<p>但事实并不如想象的那么美好。</p>\n<p>&nbsp;</p>\n<p>结合对心理咨询行业的了解，在对将近20万字的有关论述、资讯、讨论进行研究以后，我发现这些说人工智能无法取代心理咨询的观点有一个重要的误区，一些若隐若现的重要事实被忽略掉了。而正是这些事实表明，普遍的观点很有可能是错的。</p>\n<p>&nbsp;</p>\n<p>如果你现在让我评估心理咨询被人工智能取代的概率，我的答案是70%。没错，比0.7%大了100倍！</p>\n<p>&nbsp;</p>\n<p>原因是什么呢？</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220314/9563ee459c86625ca60b08bf6c210fab.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<h1><strong>02</strong></h1>\n<h1><strong>一个重大的误区：</strong></h1>\n<h1><strong>未来很难用过去和现在推导出来</strong></h1>\n<p>&nbsp;</p>\n<p>人不会两次踏入同一条河流，人类却会。</p>\n<p>&nbsp;</p>\n<p>如果你去问19世纪的欧洲人，你想要什么样的交通工具，他们的答案很可能会是，&ldquo;想要一匹跑得更快的马&rdquo;。但是，当1908年亨利&middot;福特生产出T型福特汽车，人们开始说，&ldquo;我其实更想要一辆车&rdquo;。</p>\n<p>&nbsp;</p>\n<p>1896年，英国一位物理学带头人J&middot;W.瑞利断言：&ldquo;除了气球以外，我丝毫不相信其它任何飞行器。&rdquo;7年后，怀特兄弟造出了飞机。</p>\n<p>，</p>\n<p>1956年，英国皇家天文学家理查德&middot;范&middot;德&middot;里特&middot;伍利断定，太空旅行纯粹是无稽之谈。仅仅一年后，苏联发射了第一颗人造卫星。</p>\n<p>&nbsp;</p>\n<p>人们容易受到现有经验的制约，不仅仅体现在对人类进步的预测上，对于人类灾难的预测上同样如此。</p>\n<p>&nbsp;</p>\n<p>17年前的&ldquo;非典&rdquo;，今年袭击全球的&ldquo;新冠&rdquo;，没有任何机构在它发生以前就预测到。</p>\n<p>&nbsp;</p>\n<p>就在今年，无数分析师在日夜关注的原油价格波动也没人成功预测到。刚一开春，沙特和俄罗斯就掐起来了，导致国际油价大幅下跌，跌到30美元上下的历史低价。</p>\n<p>&nbsp;</p>\n<p><strong>人们热衷于预测，但是往往在长期预测上出错。</strong></p>\n<p>&nbsp;</p>\n<p>造成这种情况的原因主要有两个：从客观角度来说，未知世界总是大于已知的世界，人们总是不自觉受到现有环境、技术水平等的限制，这个不用解释；另一个是主观的角度（心理学角度）来说，<strong>人们对于未来的预测，往往是当时人们内在需求的一种投射，而不是真的在预测。</strong>比如曾经在物资匮乏的时候，科幻作品中就出现过吃不完的大鱼和像人一样大的西瓜。</p>\n<p>&nbsp;</p>\n<p>人们对心理咨询和AI行业的判断同样如此。</p>\n<p>&nbsp;</p>\n<p><strong>梳理一下，说AI不能取代心理咨询的论点，主要有：</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>① 人工智能无法与人共情；</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>② 人工智很难完成对人表情、情绪等的及时捕捉；</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>③ 人工智能没有直觉；</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>④ 心理咨询案例采集十分困难；</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>⑤ 人工智能无法提供个性化疗愈方案。</strong></p>\n<p>&nbsp;</p>\n<p>下面咱捡主要的扒一扒。</p>\n<p>&nbsp;</p>\n<p><strong>◆ 先说共情</strong></p>\n<p>&nbsp;</p>\n<p>探讨这个问题之前，我们首先要厘清一个基本概念，我们做心理咨询是为了什么？是为帮来访者疗愈，还是为了展示咨询师熟练的技术手法？</p>\n<p>&nbsp;</p>\n<p>即使你对心理咨询一无所知，我想你也知道答案是前者。然而，在面对来势汹汹的AI的时候，很多心理咨询业内人士却陷入了自己编织的陷阱。</p>\n<p>&nbsp;</p>\n<p><strong>如果你也同意咨询的目的是疗愈。那么，你或许可以接受，共情只是手段，而且不是唯一的手段。</strong></p>\n<p>&nbsp;</p>\n<p>这样说，可能有点绕。咱洗把脸，举个栗子。</p>\n<p>&nbsp;</p>\n<p>woebot是一款由斯坦福大学团队研发的智能咨询软件，它基于认知行为疗法开发。和传统的精神分析咨询取向不同，这种疗法并不会寻找行为背后的潜意识，而是着眼于不合理的认知做工作。</p>\n<p>&nbsp;</p>\n<p>认知行为治疗认为，影响人情绪的不是事件本身，而是人们怎么看待这件事。例如，有人因为&ldquo;我不明白这个问题&rdquo;，所以认定自己是个愚蠢的人；有人因为打碎了一只碗，就评价自己为一个不称职的母亲。&rdquo;治疗的策略，便在于帮助他重新构建认知结构，重新评价自己，重建对自己的信心，更改&ldquo;认为&rdquo;自己不好的认知。</p>\n<p>&nbsp;</p>\n<p>斯坦福的研究人员召集了70名大学生，随机分配到两个组，一组使用woebot，一组使用认知行为疗法的自助电子书。经过两个星期，研究者发现，实验组使用woebot的频率非常高，几乎每天都会打开。并且，使用woebot的组别在焦虑和抑郁症状上有了显著降低。</p>\n<p>&nbsp;</p>\n<p>在这个例子里，对焦虑和抑郁的治疗，并未采取任何传统意义上的共情手段，同样达到了很好的疗愈效果。</p>\n<p>&nbsp;</p>\n<p>进一步说，即使确实需要共情，或许也未必需要一个活生生的人在现场参与。请注意这里说的是&ldquo;未必&rdquo;，不是说的&ldquo;绝对不&rdquo;。</p>\n<p>&nbsp;</p>\n<p>有人试用了一款名为&ldquo;replika&rdquo;的聊天软件，她会根据人的情绪曲线说出很多让人会心一笑的金句，比如，&ldquo;你能想象出一个这样的场景吗？在那里，同样一个想法可能不再构成任何问题。&rdquo;&mdash;&mdash;例外问句；&ldquo;想象你明天可以去往任何一个地方，你会去哪里？&rdquo;&mdash;&mdash;假设问句等等。</p>\n<p>&nbsp;</p>\n<p>一项权威杂志上发表的研究成果表明，人可以与AI机器人建立情感联结，形成类似人与人的关系。例如，老人会给机器人办欢送会、去实验室探望机器人，儿童会把机器人看作自己的朋友。</p>\n<p>&nbsp;</p>\n<p>这很难说是传统意义上的共情，但从心理疗愈的角度来说，是个很好的探索和开始。</p>\n<p>&nbsp;</p>\n<p><strong>◆ 再说说对表情、情绪的捕捉</strong></p>\n<p>&nbsp;</p>\n<p>如果你同意上面关于共情的分析，这一条的局限性就显而易见了。</p>\n<p>&nbsp;</p>\n<p>首先，心理疗愈有可能不依赖对表情、情绪的捕捉完成。其次，说人工智能不能捕捉表情、情绪，是典型的根据现在揣测未来，就像在说，&ldquo;我需要一匹更快的马&rdquo;。</p>\n<p>&nbsp;</p>\n<p>当今科技已经在很多领域开始了对人情绪、表情等进行识别的尝试，并且取得了很好的效果。</p>\n<p>&nbsp;</p>\n<p>上面提到的replika，就可以记录你说的每一句话，通过计算分析你的人格特征，同时记录所有的情绪波动。</p>\n<p>&nbsp;</p>\n<p>从去年开始，我在支付宝上参与了一个微笑打卡的活动。打开软件，你的头像会出现在镜头里，你只要一笑，相机就会自动拍照；但是，如果你不笑，是没有强制拍照按钮的，再怎么变化表情，手机也不会拍照。也就是说，你真的笑没笑，是瞒不过机器的。</p>\n<p>&nbsp;</p>\n<p>从大数据和忠实记录的角度来说，或许将来人工智能在捕捉人的表情、情绪等方面，甚至会比任何一位咨询师都有优势。</p>\n<p>&nbsp;</p>\n<p>至于味觉、触觉等，只要传感器足够灵敏，这都不是问题。</p>\n<p>&nbsp;</p>\n<p><strong>◆&nbsp;再说说人工智能的直觉</strong></p>\n<p>&nbsp;</p>\n<p>为什么说人工智能没有直觉，也算是说咨询师无法取代的理由呢？</p>\n<p>&nbsp;</p>\n<p>如果对心理咨询行业接触比较少，可能会觉得这句话无厘头。其实背后的原因很简单，因为心理学是个很年轻的学科，并且还是一个介于自然科学和社会科学之间的学科，很多治疗方法的实现，实质上是基于咨询师的&ldquo;直觉&rdquo;。</p>\n<p>&nbsp;</p>\n<p>为什么这么做？这么做能起到疗愈作用的原因是什么？如何才能知道遇到什么情况时该这么做？</p>\n<p>&nbsp;</p>\n<p>对于一些心理治疗而言，至今都不能确切地回答上述问题。</p>\n<p>&nbsp;</p>\n<p>世界著名的家庭系统排列大师海灵格在做治疗时，会让来访者、学员扮演不同的角色，而这些角色到底是如何设定的，什么时间该怎么上，并没有一套严密的科学理论可以确切地说清楚。最好的解释，就是现象学。至于现象学是什么，这里不再科普的，有兴趣的同学可以自行百度。</p>\n<p>&nbsp;</p>\n<p>20世纪最伟大的催眠大师艾瑞克森在做催眠治疗时，也会有很多神来之笔，他会叫来访者去逛沙漠公园，可能会安排来访者去高级酒店吃个豪华套餐，也可能会和患者一起敲击地板上的钉子......很多人就是这样被疗愈了。并且，同样的方法，其他治疗师去模仿的时候，往往效果不如艾瑞克森做的效果好。</p>\n<p>&nbsp;</p>\n<p>这些或许只能用&ldquo;直觉&rdquo;来解释。因此，很多人说AI没有直觉，所以成不了心理治疗大师。</p>\n<p>&nbsp;</p>\n<p>这种说法背后隐藏着一个巨大的误区，心理治疗过程中，这些靠直觉产生神奇效果的方法，产生在过去只有人作为咨询师的情况下。这里面的&ldquo;直觉&rdquo;是对人而言的，对于&ldquo;机器治疗师&rdquo;则未必需要。</p>\n<p>&nbsp;</p>\n<p><strong>爱因斯坦说，上帝不会掷骰子。所有的随机性，只是因为我们对这个世界的认识还不够。</strong></p>\n<p>&nbsp;</p>\n<p>如果数据足够、足够大，案例足够、足够多，人工智能用数据分析，或许就会把一个个依靠&ldquo;神来之笔&rdquo;的直觉进行有效拆解。</p>\n<p>&nbsp;</p>\n<p>到那时，我们可能依然不知道这些&ldquo;直觉&rdquo;背后的原理是什么，但是却有可能找到归属于&ldquo;直觉&rdquo;的各个要素如何排列是有效的，从而对来访者成功地进行疗愈。</p>\n<p>&nbsp;</p>\n<p>维吉尼亚&middot;萨提亚是享誉世界的家庭治疗大师，她的治疗效果显著，受到广泛认可。然而，想要掌握这套治疗技术并不容易，即使是她本人也很难确切地描述其中的机理和规律。</p>\n<p>&nbsp;</p>\n<p>加州大学的学生班德勒，在一次偶然的机会里认识了萨提亚。后来，班德勒受雇帮忙把萨提亚在加拿大之为期一个月的工作坊的内容制成录音带和文字记录。这份工作花了班德勒数个月的时间才能完成，过程中他学会了萨提亚在辅导过程中所运用的声调和行为模式。</p>\n<p>&nbsp;</p>\n<p>随后，他和语言学家格林德用萨提亚的录像带做研究，很快就发现萨提亚的一些常用的语言技巧，编成一些模式，这就是&ldquo;检定语言模式&rdquo;的前身。他俩也发现萨提亚对一些受导者用视觉型文字，一些受导者用听觉型文字，另外一些多用感觉型文字。后来，萨提亚自己听到他俩这样说才知道自己工作的模式如此。这些录像带的内容后来编成一书《Changing with Families》出版。</p>\n<p>&nbsp;</p>\n<p>而班德勒和格林德，正是风靡全世界的心理流派NLP（神经语言程序学 Neuro-Linguistic Programming）的创始人，在全球培养了不计其数的导师，成为当今最流行的心理疗愈技术之一。</p>\n<p>&nbsp;</p>\n<p>虽然关于NLP的科学性，学界还有质疑之声。但这至少说明，只要数据足够大，是可以发现&ldquo;直觉&rdquo;背后的某些应用规律的。</p>\n<p>&nbsp;</p>\n<p>这不仅不是人工智能的短处，还很有可能是它的长处呢。</p>\n<p>&nbsp;</p>\n<p>现在的一小步，也许就是未来的一大步。</p>\n<p>&nbsp;</p>\n<p>至于&ldquo;④心理咨询案例采集十分困难和⑤人工智能无法提供个性化疗愈方案&rdquo;这两条，在现在看来，更像是个时间问题，而不是技术问题。不再多聊。</p>\n<p><br /><img src=\"https://ossimg.xinli001.com/20220314/1f967e5a4a83e5351c134b8647f04134.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<h1><strong>03</strong></h1>\n<h1><strong>结局会是什么：</strong></h1>\n<h1><strong>想象力带给人永不枯竭的希望</strong></h1>\n<p>&nbsp;</p>\n<p>人工智能和心理咨询，从某种意义上说，对人类最大的贡献是一致的，那就是激活人类的想象力。</p>\n<p>&nbsp;</p>\n<p>人工智能激活了人类对&ldquo;工具&rdquo;的认识。钻木取火，用石头砸开果子，人工智能作为新的工具让人体的功能得到延伸，很多原来只有人才能做的事，在可遇见的未来，比如驾驶汽车，机器也能做，甚至可以比人做得更好。这打开了人与世界关系的新大门，为人类未来的发展增添了无限的想象空间。</p>\n<p>&nbsp;</p>\n<p>心理咨询一个基本理念，就是帮助来访者发现生命中更多的可能性，化解开原生家庭、现有环境的局限，向着那个真正想成为的自己迈进。心理咨询旨在为来访者打开认识自己的新大门，为人自身的发展创造丰富的想象空间。</p>\n<p>&nbsp;</p>\n<p><strong>越来越多的证据表明，很多动物也会使用简单的工具，会不会使用工具或许并不是人与动物最本质的区别。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>也许，想象力会是。</strong></p>\n<p>&nbsp;</p>\n<p>人类就是在不断寻找可能性，创造可能性的过程中，形成了文明。</p>\n<p>&nbsp;</p>\n<p>目前，关于这个话题的思考还在继续。有人提出了很多有趣的观点，比如：</p>\n<p>&nbsp;</p>\n<p>●&ldquo;月光如流水一般，静静地泻在这一片叶子和花上。薄薄的青雾浮起在荷塘里。叶子和花仿佛在牛乳中洗过一样；又像笼着轻纱的梦。虽然是满月，天上却有一层淡淡的云，所以不能朗照；但我以为这恰是到了好处&mdash;&mdash;酣眠固不可少，小睡也别有风味的。&rdquo;朱自清的散文《荷塘月色》，纵然机器能认出每一个字，但是他能读出其中的韵味吗？</p>\n<p>&nbsp;</p>\n<p>● 有的心理病症，根本不需要治疗，只需要人的温度。&ldquo;不是咨询师告诉我怎么做，而是突然意识到，原来有人可以接受这样的我。这个&ldquo;有人&rdquo;是无法取代的。</p>\n<p>&nbsp;</p>\n<p>● 根本就不是一个物种，你懂我又能如何？</p>\n<p>&nbsp;</p>\n<p>● 如果AI可以做咨询师了，是不是人就能和AI谈恋爱了？如果机器这么智能，他还会在乎人类和人类的知识吗？</p>\n<p>&nbsp;</p>\n<p>●&nbsp;AI是基于人类的思维和知识创造的，那很可能不可避免有人身上的BUG，他们也需要心理咨询吗?</p>\n<p>&nbsp;</p>\n<p>关于人工智能能否取代心理咨询，也有无数种可能性，确切的答案或许并不存在。</p>\n<p>&nbsp;</p>\n<p>从某种角度来说，答案也并不是最重要的。重要的是，沿着这个思路持续进行探索和想象。</p>\n<p>&nbsp;</p>\n<p><strong>我很乐观，不觉得AI是一种威胁或者很恐怖的东西，因为人类很聪明。我觉得AI很有意思，我们会拥抱它。</strong><strong>&mdash;&mdash;马云</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h6>文：海狮子</h6>\n<h6>责任编辑：殷水</h6>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n<div class=\"copy-right-btn-list\">\n<p id=\"yxl-article-report-btn\">举报</p>\n</div>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/5ee4ef1fb815401c808282e12dc401effile.png', 93272, 0, 'Normal', 0, '2021-08-16 20:58:40', '2022-03-15 18:46:43');
INSERT INTO `edu_article` VALUES ('1503695038704517122', '1502211555981283330', '自我修复和疗愈', '热点事件', '女性研究', '女性面临的最大困境是什么？', '社会热点', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<h6>作者：紫二</h6>\n<h6>编辑：未未</h6>\n<h6>来源：微信公众号：社会学了没（ID：socialor）</h6>\n<p>&nbsp;</p>\n<p>在我们出生的时代，&ldquo;男女平等&rdquo;几乎是不言而喻的社会共识，而当我们走出象牙塔，走进社会，走向婚姻时，却发现越来越多的女性在家庭、职场、婚恋与生育的漩涡中挣扎。</p>\n<p>&nbsp;</p>\n<p>其中，最根本的一个问题是：女性到底享有多大程度的生育自由，以及由此引发的女性一系列思考：无法生育的女性能否得到平等对待？具备生育能力的女性选择不生的空间有多大？一旦决定生养，现代女性面临的种种实际问题该如何解决？</p>\n<p>&nbsp;</p>\n<p>一连串的追问背后是更多未曾暴露、难以持续跟进的，是更为庞杂、混沌的生活万象，它们时时困扰着我们身边的每位女性，无从下手又挥之不去。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220310/1a3756f28d1eca489347d74515fcf73a.png?x-oss-process=image/quality,Q_80\" /></p>\n<h1><strong>观念再&ldquo;先进&rdquo;都要接受实际生活的检验</strong></h1>\n<p>&nbsp;</p>\n<p>生儿育女、传宗接代的观念古已有之。但在自我意识不断觉醒的今天，种族延续的意义显然不足以成为年轻人选择生育的充要条件。</p>\n<p>&nbsp;</p>\n<p>从世界范围内看，越来越多的年轻人不再把生孩子当成自己人生的必经之事。根据2006-2010年的全美家庭成长调查数据，15%的女性和24%的男性在40岁时还没有生育孩子，40至44岁的未生育女性中，有44%的人是自主做出了这样的选择。</p>\n<p>&nbsp;</p>\n<p>在国内，丁克一词虽然早就被引进，但具体到每个家庭，接受程度还十分有限。一旦结婚，生育就不只是夫妻双方，更是两个家庭的事情。能生而不生，往往会一石激起千层浪，观念上的&ldquo;先进&rdquo;、&ldquo;现代&rdquo;，在现实选择中往往意味着更大的勇气和更坚定的意志。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220310/05dedb8dfec199c9a56238b106f0b78f.png?x-oss-process=image/quality,Q_80\" /></p>\n<h1><strong>女性为何要捍卫生育自由？</strong></h1>\n<p>&nbsp;</p>\n<p>1.法律将更大的决定权交由女性行使</p>\n<p>&nbsp;</p>\n<p>在法律层面，《妇女权益保障法》第47条明确规定，妇女有按照国家有关规定生育子女的权利，也有不生育的自由。即生育的最终决定权在女方。同理，如果女方怀孕后，未经男方同意擅自打掉孩子，在法律上并不会涉及侵害男方的生育权。因为从怀孕、生产以及生育后的哺乳，女方实际上较男性承担更多的身体付出，所以在这个问题上，法律将更大的决定权交由女性行使。</p>\n<p>&nbsp;</p>\n<p>但在实际生活中，女性的生育意愿在多大程度上拥有自决权？研究表明，整体上，女性的教育水平越高、收入和生活水平越高、智商越高，生育子女的比例越低；居住在大城市和独生子女更有可能选择不生育；如果一个女性在家庭环境中，被鼓励争取独立和获得个人成就，那么她们不生育的几率也更大。我们并非鼓励或反对女性生育，重要的是她们要拥有选择生育与否的自由意志。</p>\n<p>&nbsp;</p>\n<p>2.法律之外，女性更需要这个选择权</p>\n<p>&nbsp;</p>\n<p>事实上，除了生理上更多的付出之外，对于但凡有点责任感的父母来说，更大的付出在漫长的抚育过程中。正如韩剧《产后调理院》里的院长对新住进来的产妇所说的：&ldquo;怀孕很累，分娩很残忍，恢复的过程很难堪，但这些都只是痛苦的开始。&rdquo;</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220310/fc5eaea35a6658d9774a247fafb2ae84.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>费孝通就指出，新生命的产生没有不靠母体的消耗和亏损,彻底为自己利益打算的。孕妇的痛苦，临盆的危险，哺乳的麻烦，都是无法回避的事情。尤其是在当下婚姻制度中处于最弱势地位，难以独立的基层女性，她们遇到的困境，有其独特性，但也是所有女性可能共同遭遇的困境。那些不想或无法言传的切身痛楚，往往只能一个人在深夜消化，女性真实的生育过程很少能曝光在大众视野之中。</p>\n<p>&nbsp;</p>\n<p>因此，当纪录片《生门》在2016年公映时，引发了很多关注。中南医院妇产科里，集结了穷与富的对比、生与死的挣扎、舍与得的纠结、老与少的代沟，物质困境和价值选择在生死关头被无限放大。北京大学医学人文研究院教授王一方把这部片子拿来做教学，他认为这才是真正的成人礼，很多看完这部纪录片的学生，对婚姻家庭有了更深刻的思考，开始试图重新理解女性生育的本能，与母亲达成一种和解。</p>\n<p>&nbsp;</p>\n<p>3.婚姻和生育对女性在就业领域有负面影响</p>\n<p>&nbsp;</p>\n<p>无论是在西方还是东亚社会，大量的研究发现婚姻和生育对女性在就业领域有负面影响。进入婚姻以后，特别是随着第一个孩子的出生，女性往往因承担更多照料责任却缺乏灵活工作制度而中断就业，中断数年后难回职场，即便回归工作，通常会选择较为轻松的岗位，收入也开始和同龄的男性拉开显著差距。</p>\n<p>&nbsp;</p>\n<p>社会学家称这一现象为 &ldquo;母职惩罚&rdquo;。相比而言，婚姻和生育不仅不会影响男性的职业发展，反而会给男性带来&ldquo;父亲红利&rdquo;&mdash;&mdash;每多一个孩子收入就会提高10%。</p>\n<p>&nbsp;</p>\n<p>&ldquo;母职惩罚&rdquo; 产生的原因，在于无偿的再生产职能（包括家务、育儿、照料）由女性承担。父亲在家庭中的缺位，社会公共支持体系的缺失，加剧了性别化的家庭分工和绩效利益至上的现代企业制度之间的冲突。当女性发展时间被照顾孩子大量吞噬时，她们的职业发展势必受到影响，致使她们的时间价值相比男性变得更低，从家庭理性角度来看就更应该承担育儿之责。性别化的家长主义不仅在实践层面承继了男主外女主内的传统性别分工模式，也使不平等的性别关系得以强化和再生产。</p>\n<p>&nbsp;</p>\n<p>阿德里安&middot;瑞奇在《女人所生》一书中说，一个母亲必须完全放弃自己的目标，才能给小孩&ldquo;无条件的&rdquo;爱和注意力，才能合乎社会对好母亲的期待。身为母亲任何保有追求育儿之外个人发展意愿，都是与这种&ldquo;牺牲自我&rdquo;的期待相悖的，因此她们不得不在他人的评断及自己的罪恶感中挣扎。</p>\n<p>&nbsp;</p>\n<p>《产后调理院》里兼具&ldquo;高龄产妇&rdquo;和&ldquo;职场精英&rdquo;双重身份的&ldquo;固体胶妈妈&rdquo;就是典型的例子，她会因为忍受不了宝宝吮吸乳头时的疼痛，怀疑自己不算是个母亲；会因为奶水不足而自责；在纠结是否要用奶粉喂养时，又会遭到周围妈妈甚至提倡母乳喂养的整个月子中心的鄙夷；因为产假不得不暂停作为精神支柱的工作，却看着丈夫在工作上非但没有受到影响，还拿了奖项，个中滋味只能自己咀嚼。</p>\n<p>&nbsp;</p>\n<p>4.子女教育的焦虑正在加剧&ldquo;母性惩罚&rdquo;</p>\n<p>&nbsp;</p>\n<p>人民网调查显示，92.8％受访家长对孩子的成长教育存在焦虑，98.6％的人认为身边有家长存在焦虑现象。如今，抚育子女也未能逃离向私人领域的高度内卷化。在《变迁中的亲职与抚育》中，中国社科院助理研究员施芸卿发出一系列疑问：</p>\n<p>&nbsp;</p>\n<p>生养抚育，为何在当下越来越脱离原初的自然状态，变成一件极为复杂、专业的事情？</p>\n<p>&nbsp;</p>\n<p>作为父母，为何当我们自身看似已拥有更高教育水平、更多资源和选择的时候，反而好像越来越不知该如何当好父母？</p>\n<p>&nbsp;</p>\n<p>进一步地，作为母亲，无论是&ldquo;工作妈妈&rdquo;还是全职主妇，为何似乎始终处于一种怎样都不够称职的境地，面临内心的冲突和挣扎？</p>\n<p>&nbsp;</p>\n<p>当面对现代社会倡导的自我鲜明的独立女性形象和家庭生活中的以其他成员为中心的照顾者角色产生内在文化冲突时，除了成为&ldquo;超级妈妈&rdquo;外，是否还有别的出路？</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220310/789d88096a849fa10bb20f39fccafc91.png?x-oss-process=image/quality,Q_80\" /></p>\n<h1><strong>女性面临的最大困境，</strong></h1>\n<h1><strong>是社会普遍上不把你的困境当作困境</strong></h1>\n<p>&nbsp;</p>\n<p>女性主义学者雷格指出，母职并非是为母天生、自然生成的，而是一个被定义、被规范的角色意识和行为准则。女性所面临的结构性不公贯穿古今历史，在父权制的权力结构未被打破之前，女性无法得到实质性的解放。</p>\n<p>&nbsp;</p>\n<p>处于婚姻中的女性，在漫长的历史中都被建构为整体的弱势地位，虽然现代婚姻的特征是夫妻之间的地位平等和&ldquo;相互性&rdquo;，但是家庭任务层面的不平等仍然大量存在。男性的缺席让更多现代女性背负公私领域的双重劳动负担，同时，男性只需要偶尔踏足家庭事务，便能营造出夫妻双方共同承担家庭劳动职责的假象。</p>\n<p>&nbsp;</p>\n<p>在美国电影《婚姻故事》中，妮可和查理都是好父母，他们尽量平衡工作和家庭。但只有当查理需要纽约、洛杉矶两头跑的时候，他才真正意识到这所需要耗费的精力。</p>\n<p>&nbsp;</p>\n<p>在韩国电影《82年生的金智英》中，当丈夫好心地对金智英说：&ldquo;那就先在家里休息一段时间，带带孩子&rdquo;时，金智英问他：&ldquo;带孩子是休息吗？&rdquo;我们才发现，丈夫几乎天然地认为家庭里的劳动是轻松愉悦的，而这与待在家里的妻子的感受却截然相反。这一矛盾其实也一直隐匿在妮可和查理的关系中，并且也是发展至今的当代婚姻关系中如影随形的问题。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220310/ef44fcecaa0a8edf918220b32b12c877.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>其实，女性面临的最大困境是社会普遍上不把你的困境当作困境。对于女性，生育却是绕不过去的一个坎。角田光代的《坡道上的家》、英国作家蕾切尔&middot;卡斯克的《成为母亲》等，讨论的都是究竟要不要生小孩。有些人指责这些作品令女性恐育，但我们恰恰要通过这些声音促使整个社会进行思考，如何从家庭、公司等各个社会单元对女性进行支持，而不是一味地报道，出生率悬崖式暴跌的新闻。</p>\n<p>&nbsp;</p>\n<p>就像20世纪初当鲁迅讨论娜拉出走后会变得如何一样，问题不在于这些出走的娜拉，问题在于社会和政府是否能够为这些追求自主和实现自我的生活者们创造一个与之匹配的环境和制度。</p>\n<p>&nbsp;</p>\n<h6>作者简介：紫二，本文转载自微信公众号：社会学了没（ID：socialor），泛社会知识社区~理解社会，探索自我。</h6>\n<h6>&nbsp;</h6>\n<h6><img src=\"https://ossimg.xinli001.com/20220311/4d7ca828607a881f35dbd49a73e877d9.jpeg?x-oss-process=image/quality,Q_80\" /></h6>\n<h6>&nbsp;</h6>\n</div>\n<div class=\"article-copyright\">\n<p><span class=\"subtitle\">原作者名:</span><span class=\"copyright-desc\">紫二</span></p>\n<p><span class=\"subtitle\">转载来源:</span><span class=\"copyright-desc\">微信公众号：社会学了没（ID：socialor）</span></p>\n<p><span class=\"subtitle\">原文标题</span><span class=\"copyright-desc\">女性面临的最大困境是什么？</span></p>\n<p><span class=\"subtitle\">授权说明:</span><span class=\"copyright-desc\">本文转载自公众号，如有侵权，请联系删除</span></p>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户在发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/3bae0b9efc4143cd9c3ab1f207348c83file.png', 0, 0, 'Normal', 0, '2022-03-15 19:30:09', '2022-03-15 19:36:36');
INSERT INTO `edu_article` VALUES ('1503697895885496322', '1502211555981283330', '爱情心理学', NULL, NULL, '“我养你”是一剂慢性毒药', '婚恋爱情', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<p><span data-offset-key=\"8s57c-0-0\">&ldquo;我养你&rdquo;是爱情里极具诱惑的动人话语，就像古希腊神话中海妖塞壬的歌声，听之即被俘获。</span></p>\n<p><span data-offset-key=\"8s57c-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"7cieo-0-0\">或是因为哺育后代，保障种族延续，需要女性具备敏感的情感功能以照料婴儿，女性发展出情感的优势功能。</span><span data-offset-key=\"di40q-0-0\">这种情感优势功能，也像进化的诅咒刻进女性基因。</span></p>\n<p><span data-offset-key=\"35rev-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"35rev-0-0\">情感优势种下的诅咒，让女性世代在爱情中容易一往情深，容易奋不顾身，容易为情所困。</span><span data-offset-key=\"4u3th-0-0\">情感优势种下的诅咒，让女性在心中期待自己的&ldquo;真命天子&rdquo;。</span></p>\n<p><span data-offset-key=\"4u3th-0-0\">&nbsp;</span></p>\n<blockquote class=\"Edi-styled\" data-block=\"true\" data-editor=\"bgeml\" data-offset-key=\"ctde9-0-0\"><span data-offset-key=\"ctde9-0-0\">我的意中人是一位盖世英雄，有一天他会身披金甲圣衣、驾着七彩祥云来娶我。&mdash;&mdash;《大话西游》</span></blockquote>\n<p><span data-offset-key=\"54dp9-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"54dp9-0-0\">情感优势种下的诅咒，让情话对女性有着无法抵御的魔力。明知甜言蜜语不一定真心，亦满心欢喜，愿付出此心此生；纵使爱人递过来毒酒，奈何香气已醉人，仍一饮而尽。</span></p>\n<p><span data-offset-key=\"8i8n6-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"8i8n6-0-0\">进入现代社会，&ldquo;我养你&rdquo;这句话，如同开启诅咒的咒语，如同游戏中的究极必杀技，让女性几无防御之力。</span><span data-offset-key=\"duh5e-0-0\">《喜剧之王》中，周星驰饰演的尹天仇，对张柏芝饰演的柳飘飘说出那句&ldquo;我养你啊&rdquo;，哪怕柳飘飘知道这只是一句空头承诺，尹天仇根本没能力做到，内心亦欢喜得无以复加。</span></p>\n<p><span data-offset-key=\"duh5e-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"8p33r-0-0\">&ldquo;我养你&rdquo;是一剂香甜的慢性毒药。</span><span data-offset-key=\"cvenp-0-0\">因为香气袭人，甜美可口，诱人尝试；</span><span data-offset-key=\"1n498-0-0\">因为&ldquo;慢性毒发&rdquo;，初期未见伤害，更加诱人尝试。</span><span data-offset-key=\"am8nm-0-0\">慢性毒药，毒性入体，病发便是膏肓。</span></p>\n<p><span data-offset-key=\"am8nm-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"3772h-0-0\">网上搜索&ldquo;全职家庭主妇&rdquo;，可以看到太多真实案例的不幸教训。</span><span data-offset-key=\"j3kh-0-0\">一位西安的全职妈妈，丈夫每月只给500元生活不够用，再要500元都需要写借条。</span></p>\n<p><span data-offset-key=\"j3kh-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"b32nc-0-0\">网上很多的家暴案件，网友总说为何不离婚。其中很重要的一个原因是：如果当事人离婚，缺乏独立经济能力，生存可能都成问题。</span><span data-offset-key=\"52eco-0-0\">还有很多全职妈妈考虑孩子，希望获得抚养权。如果没有经济来源，丈夫又不同意离婚，即使诉讼离婚也很难争取到孩子的抚养权，让她们宁愿忍气吞声。</span></p>\n<p><span data-offset-key=\"52eco-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"708ut-0-0\">也许有人会说，我只举状况糟糕的全职妈妈例子，还有生活幸福的全职妈妈。</span><span data-offset-key=\"1vthe-0-0\">没错，可&ldquo;全职家庭主妇&rdquo;可能过得好，也可能过得糟糕的境地，意味着接受&ldquo;我养你&rdquo;是一场赌博。</span><span data-offset-key=\"8938f-0-0\">赌赢了，幸福美满；</span><span data-offset-key=\"bf9tg-0-0\">赌输了呢？</span><span data-offset-key=\"ct48r-0-0\">这不像赌钱，输了还有机会再挣；赌上自己的人生，如果你的伴侣不再像当初&ldquo;我养你&rdquo;的态度对待你，失去经济能力的你，如何自处？</span></p>\n<p><span data-offset-key=\"ct48r-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"4j7t3-0-0\">我并非故意否定男方说出&ldquo;我养你&rdquo;时的决心和意愿。可&ldquo;知人者智，自知者明&rdquo;，&ldquo;明心见性&rdquo;比&ldquo;智&rdquo;更难，很多人对自己不够了解。</span><span data-offset-key=\"40f01-0-0\">就像很多人觉得，如果回到二战，自己不会成为纳粹、日本士兵那样的刽子手，可阿希的从众实验便证明：即使是作为有知识素养的大学生，面对容易判断线段等长的简单任务，在压力情境下，容易选择与多数人一样的错误答案，而不是相信自己。</span></p>\n<p><span data-offset-key=\"40f01-0-0\">&nbsp;</span></p>\n<p>还有很多如斯坦福监狱实验、米尔格拉姆&ldquo;电击实验&rdquo;等心理学实验，证明着我们并不如&ldquo;自以为&rdquo;的了解自己。有兴趣可以看看《社会性动物》这本社会心理学著作。</p>\n<p>&nbsp;</p>\n<p><span data-offset-key=\"7pf69-0-0\">可能又会有人说：我也知道女性保持自己独立经济能力的重要性，可一旦有了孩子，再回职场，会遇到很多困难。</span><span data-offset-key=\"d7t0n-0-0\">诚然，这是对于女性的另一个社会困境。我无法在这里给出太好的建议。可如果因为这个困境而选择成为全职家庭主妇，未能解决问题。</span><span data-offset-key=\"d7t0n-0-0\">如果&ldquo;我养你&rdquo;的承诺有一天失效，再就业的困难只会越发困难。</span></p>\n<p><span data-offset-key=\"d7t0n-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"e0nc0-0-0\">&ldquo;得寸进尺&rdquo;是人的天性，能够尊重全职妻子照顾家庭不容易，做好&ldquo;男主外，女主内&rdquo;分工的丈夫，需要修炼自己克服天性。这种修心炼性是很多人未能达到的。</span></p>\n<p><span data-offset-key=\"e0nc0-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"9eos5-0-0\">俗话说&ldquo;吃人家嘴短，拿人家手短&rdquo;，父母对孩子的爱，很多时候都存在一定条件：我为你付出这么多，你就应该听我的。</span><span data-offset-key=\"cim4n-0-0\">夫妻关系的天然联结本弱于亲子关系，&ldquo;吃人家嘴短&rdquo;的长此以往，夫妻关系无形间容易变得不平衡，让丈夫对妻子为家庭的付出不够尊重，要求更多。</span></p>\n<p><span data-offset-key=\"cim4n-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"fbf8b-0-0\">女性保持自己独立经济能力，避免&ldquo;吃人家嘴短&rdquo;的潜移默化的权利失衡。</span></p>\n<p><span data-offset-key=\"fbf8b-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"9gnt5-0-0\">&ldquo;我养你&rdquo;虽动听动心，但温柔陷阱，心动不宜行动。</span><span data-offset-key=\"cjkkf-0-0\">挣多挣少，保持自己独立的经济能力。</span></p>\n<p><span data-offset-key=\"cjkkf-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"3bo4u-0-1\">安身，方能立命。</span><span data-offset-key=\"9kpii-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"9kpii-0-0\">&nbsp;</span></p>\n<p><span data-offset-key=\"9kpii-0-1\">&nbsp;</span></p>\n<h6><span data-offset-key=\"9kpii-0-1\">文：许标&nbsp; （中科院心理所健康心理学硕士，全职心理咨询师，5000+小时心理咨询经验，2000+小时专业受训经验。）</span></h6>\n<h6><span data-offset-key=\"9kpii-0-1\">责任编辑：殷水</span></h6>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户在发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/568ca04cf9104976bfb52c3b5cedf383file.png', 0, 0, 'Normal', 0, '2022-03-15 19:41:30', '2022-03-15 19:51:11');
INSERT INTO `edu_article` VALUES ('1503698435725975554', '1502211653154918401', '冷暴力', '婚恋技巧', '婚姻观念', '从俄乌战争看夫妻相处之道', '婚恋爱情', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<h6>作者：安伟</h6>\n<h6>编辑：李宇昕</h6>\n<h6>来源：微信公众号：&nbsp;<span class=\"rich_media_meta rich_media_meta_text\">家姻心理（ID：gh_b23d067f4e3c）</span></h6>\n<p>&nbsp;</p>\n<p>俄乌的战争还在继续进行，我们看着新闻，尤其是看到图片里的那些因为战乱而无家可归或者饱受摧残的苦难中的人们，不免恻隐，和平的呼唤如鲠在喉。</p>\n<p>&nbsp;</p>\n<p>已经有很多文章分析了俄乌战争爆发的原因、可能的走向，以及对俄乌两个国家，乃至是世界安全的影响。我们不是这方面的专家，不去分析其中的是非曲折，谁对谁错。我们是家庭治疗师，<strong>尝试从家庭治疗的角度出发来解析俄乌战争，探索俄乌战争与夫妻冲突之间的异同，您也许会发现两者之间存在惊人的相似之处。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p>俄乌之间的战争不是突然就爆发的，有其轨迹和模式可循。这有点像夫妻之间的冲突，<strong>大多数夫妻冲突都源于琐事</strong>，就像浙江高等法院对2018年５万多对离婚案件原因的分析所显示的那样，占比第一位的原因并非日常经常听说的&ldquo;没有感情了&rdquo;和&ldquo;性格不合&rdquo;这两大原因，而是&ldquo;生活琐事&rdquo;，所占比重为34.21%。<strong>为何生活琐事会导致最后离婚？最根本的原因是由于夫妻之间没能很好地解决这些生活琐事，导致形成负性循环，矛盾逐渐升级，最后闹到要离婚的地步。</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220311/4ebbc1f8fb531231f31c2a68ab9ed1c6.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>俄乌之间的矛盾虽然不像夫妻冲突这么简单，还包含文化历史的原因，但也有相似之处。俄乌从苏联解体后就成为两个独立的国家，由于各自利益和需要不同，其间不断爆发各种摩擦和纠纷，造成乌克兰产生越来越趋近美国和北约，而脱离俄罗斯的行为。这种矛盾一直没有很好地得到解决，直到乌克兰寻求加入北约，北约也试图将乌克兰纳入版图，将北约的边界推到与俄罗斯的边缘，让俄罗斯产生了生存的危机和压力的时候，来了一个总的爆发。</p>\n<p>&nbsp;</p>\n<p>当然，从家庭治疗来看，俄乌战争可能还有点像夫妻冲突的另外一种模式：<strong>迂回关系</strong>。原本在俄罗斯与北约之间也存在因北约不断东扩而产生的摩擦。北约先后经过了5次东扩，每次东扩都会引起与俄罗斯之间的一些摩擦和纠纷，到最后北约想把乌克兰纳入版图，但由于担心直接纳入版图而引发与俄罗斯之间的直接冲突，就不断地鼓动乌克兰做出一些刺激俄罗斯的行为，以实现最终东扩的目的。从这个来看，<strong>俄罗斯和北约就像有矛盾但没有直接发生冲突的夫妻，而是通过家中或者家外的第三方（如孩子或者其他的原生家庭成员）来发生冲突。这就是家庭治疗理论中讲的迂回关系。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p>在北约通过挑动乌克兰与俄罗斯发生冲突之后，乌克兰做出了选边站的举动（当然，这样的选边站也与第一段讲的其自身的需求有关），而且，北约也在通过不断支持乌克兰的行为增加乌克兰与俄罗斯斗争的勇气和砝码，使乌克兰最后紧紧地绑在了北约的战车上。这也与夫妻冲突的走向有惊人相似之处。<strong>在夫妻发生冲突的时候，家内的或者家外的第三方（例如孩子或者原生家庭的父母）可能会主动或者被动地卷入到发生冲突的父母中去形成三角关系，如果卷入进去的第三方采取了选边站的立场，站到了发生冲突的父母中的一方，就会与之形成稳定的结盟关系，共同对抗另外一方。</strong></p>\n<p>&nbsp;</p>\n<p><strong>在第三方卷入到父母的冲突中去后，就会改变双方的力量对比，同时还会破坏亚系统之间的界线，使得问题变成了多方之间的矛盾，解决起来会变得更加的困难。</strong>另外一方在与结盟的一方做斗争的时候，由于力量属于弱势的一方，大都不太可能与整个结盟的一方进行斗争，一种选择就是退出这种斗争认输，但像俄乌战争这种，如果俄罗斯直接投降，不再抗争，那后果就是北约扩张到乌克兰，挤压俄罗斯的战略和生存空间。</p>\n<p>&nbsp;</p>\n<p>这是俄罗斯万万不能接受的结果，只有与结盟的一方进行殊死斗争，也许还会换来一线生机。但直接与整个结盟的一方做斗争显然会让自己处于不利位置，于是就会选择结盟关系中的弱者作为斗争的对象，就发生了俄罗斯拿乌克兰开刀的事情，希望通过惩罚结盟关系中的弱者来让原来与自己有矛盾的一方感受到疼痛，有所收敛。这也是&ldquo;打在孩子的身上，痛在父母的心上&rdquo;要表达的意思。</p>\n<p>&nbsp;</p>\n<p>在弱者受到惩罚之后，往往会导致与弱者结盟的一方采取更多更大的支持行为来为弱者打气加油，与弱者结盟的一方不可能眼看自己的同盟被别人欺负而没有任何的反应。如果他们没有反应就等于承认了对另外一方权力或者解决方式的认可，是一种认输和投降。这就出现了在俄乌战争爆发后很多国家对乌克兰的经济和军事等提供支持，对俄罗斯实施各种制裁。</p>\n<p>&nbsp;</p>\n<p><strong>这个过程还反映了夫妻冲突解决的一种模式，即更多通过竞争性的问题解决模式来解决冲突，谁都想对方同意用自己的方式来解决问题</strong>，就像最早有关谈判的条件那样，俄罗斯的谈判条件是&ldquo;乌克兰军人要放下武器&rdquo;才会谈判，而乌克兰要求&ldquo;俄罗斯军队要退回到边境下俄罗斯一方&rdquo;才谈判。这两种方法完全是对立的，是对方不可能接受的，结果就会导致负性循环的发生，你对我不好，我就对你更不好，促使战争不断升级。</p>\n<p>&nbsp;</p>\n<p>到后来双方认识到这些要求的不妥（当然还有战争带来的破坏等等），都从自己的立场上退了一步，才有今天俄乌双方的第一轮、第二轮和第三轮的谈判。尽管在谈判中还有不少对立和冲突，但双方都开始尝试用合作的方式来解决问题，这给问题的解决带来了一线希望。</p>\n<p>&nbsp;</p>\n<p><strong>在家庭治疗看来，结盟一方中的弱者，如果最后经受不住对手的惩罚，而与对手达成了和解，就会使得最初想通过挑动弱者与对方斗争而获利的那一方的需求得不到满足，这一方就会继续寻找其他的途径，或者到别处去寻求需求的满足。</strong>什么地方将成为他们需求满足的地方？会不会真的发生这样的事情？让我们拭目以待！</p>\n<p>&nbsp;</p>\n<h6>作者简介：安伟，本文转载自微信公众号：<span class=\"rich_media_meta rich_media_meta_text\">家姻心理（ID：gh_b23d067f4e3c）</span>，家姻心理是由北京师耘家和科技有限公司精心打造的品牌，致力于为婚姻家庭、婚姻家庭咨询师和相关机构提供科学有效的心理健康服务。【咨询电话】：010-62279199</h6>\n<h6>&nbsp;</h6>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户在发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/a002f804376d4bd5b0c4fb30403d7f2dfile.png', 0, 0, 'Normal', 0, '2022-03-15 19:43:39', '2022-03-15 19:51:12');
INSERT INTO `edu_article` VALUES ('1503699043539345410', '1502211653154918401', '安全感', NULL, NULL, '安全感，才是这个时代最贵的奢侈品', '婚恋爱情', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<p>作为一名女性，我发现女孩们经常会把&ldquo;安全感&rdquo;挂在嘴边，一直如此；</p>\n<p>&nbsp;</p>\n<p>作为一名咨询师，我发现来访者的困扰和痛苦，多多少少也有安全感有关。</p>\n<p>&nbsp;</p>\n<p>安全感，似乎与幸福直接挂钩。那么安全感究竟是什么呢？</p>\n<p>&nbsp;</p>\n<p><strong>如果把心灵比喻成身体，安全感就是皮肤。</strong></p>\n<p>&nbsp;</p>\n<p>有安全感的人皮肤是完好的，所以外界的大部分刺激，会被皮肤屏障挡回去，不会真正伤害到ta；</p>\n<p>&nbsp;</p>\n<p>没有安全感的人，皮肤是受损的，屏障功能很弱，所以这里磕一下那里碰一下，都有可能伤害到ta。</p>\n<p>&nbsp;</p>\n<p><strong>安全感完好与否，从来不是我们的错。</strong></p>\n<p>&nbsp;</p>\n<p><strong>如果你的安全感受损，最好的办法，就是从现在开始好好呵护它，让它更健康，更能从容地抵抗伤害。</strong></p>\n<p>&nbsp;</p>\n<p>我自己曾经也是不太有安全感的人，比如我打电话给爱人他没接，我就会特别着急，感觉像失联了一样。幸运的是，通过心理学的学习，我获得了成长（如果你对我的故事感兴趣，可以在文末点击查看）。</p>\n<p>&nbsp;</p>\n<p>今天我想结合自身经历和咨询经验，与大家分享，<strong>安全感可以被修复，并且需要被修复。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<h1><strong>01</strong></h1>\n<h1><strong>有安全感和没安全感，</strong></h1>\n<h1><strong>分别是什么样的？</strong></h1>\n<p>&nbsp;</p>\n<p>如何判断自己没有安全感？</p>\n<p>&nbsp;</p>\n<p>第一，当你和爱人或孩子分开，看不到他们的时候，你感到安全吗？</p>\n<p>&nbsp;</p>\n<p>第二，当你和别人意见不一致，你会不会担心坚持自己的想法会破坏关系？</p>\n<p>&nbsp;</p>\n<p>第三，你是否能够向人展示脆弱的一面和负面情绪？</p>\n<p>&nbsp;</p>\n<p>如果三个答案都是&ldquo;否&rdquo;，那你的安全感可能就不太充分。</p>\n<p>&nbsp;</p>\n<p><strong>安全感不同的人，面对感情危机也会有不一样的处理方式。</strong></p>\n<p>&nbsp;</p>\n<p>曾经我有两位来访者，来做婚姻家庭咨询，他俩本来很恩爱，已经准备结婚了，但是偶然有一天，女孩发现男朋友跟前任有联系。</p>\n<p>&nbsp;</p>\n<p>于是她那根不安全的心弦拨动了，一次次去问男朋友：<em>我在你心里真的重要吗？你确定我是你独一无二的吗？</em></p>\n<p>&nbsp;</p>\n<p>一开始男朋友还很坚定地回答她，但是几次过后，男朋友就烦了。</p>\n<p>&nbsp;</p>\n<p>经过咨询我们发现，女友的追问激发了他内心的恐惧，后来女朋友还没开口问，他就感觉山雨欲来风满楼，只想往后退。</p>\n<p>&nbsp;</p>\n<p>结果是女孩觉得更加不安全，更加往前追问，男孩就一直往后躲。最后逼到墙角，开始冷战。</p>\n<p>&nbsp;</p>\n<p>另一个来访者，已经步入婚姻，妻子发现丈夫跟女同事有暧昧出轨的迹象，当时心里跟针扎一样，特别不舒服。</p>\n<p>&nbsp;</p>\n<p>但是她很快冷静了下来，问自己：<em>我到底要怎么选？是要放弃这段婚姻，还是继续试试？</em></p>\n<p>&nbsp;</p>\n<p>她想继续试试，所以决定什么也不说，去观察和反思关系当中的问题。</p>\n<p>&nbsp;</p>\n<p>婚姻当中，假如有99%是对方的错，那么可能也有1%自己的原因，她就去找这1%，然后一点一点地，把丈夫的心拉回来。</p>\n<p>&nbsp;</p>\n<p>丈夫本身也没有实际出轨，后来心就回来了，两人度过了这次婚姻危机。</p>\n<p>&nbsp;</p>\n<p>两对关系，遇到的是类似的问题，但是一个选择的是&ldquo;推&rdquo;，一个选择的是&ldquo;拉&rdquo;，结果也有所不同。</p>\n<p>&nbsp;</p>\n<p>选择&ldquo;推&rdquo;的，是本身就没有安全感的女士，当她发现一个迹象，就像受到了暴击，她的所有力气都用来对抗这场暴击，无暇顾及其它了。</p>\n<p>&nbsp;</p>\n<p>选择&ldquo;拉&rdquo;的女士，本身属于安全感比较充足的人，所以她感受到的伤害不至于毁灭她的理智，让她有心力放下情绪去衡量其它。</p>\n<p>&nbsp;</p>\n<p><strong>当人安全感不足，情绪就容易激动；情绪激动时，认知就容易失调。所以我们常说，不要在生气的时候做决定。</strong></p>\n<p>&nbsp;</p>\n<p>有安全感的人，你会觉得ta像大地，在你无助的时候、紧张的时候甚至做错事的时候，都稳稳地接住你，不带一丝评判。</p>\n<p>&nbsp;</p>\n<p>那么有安全感的人有什么特征呢？</p>\n<p>&nbsp;</p>\n<p><strong>首先</strong><strong>ta</strong><strong>比较能容纳内心复杂的情绪，甚至是互相矛盾的情绪。</strong>比如既欣赏又嫉妒，既悲伤又开心，既绝望又觉得有希望。这些情绪不会让ta觉得很分裂。</p>\n<p>&nbsp;</p>\n<p><strong>其次，安全感充足的人，建立关系往往是比较慢的。</strong></p>\n<p>&nbsp;</p>\n<p>我们经常误以为，那些看起来很容易跟人建立关系的人，比如第一次见面聊天就掏心掏肺的人，肯定是很有安全感的，不会感到害怕。</p>\n<p>&nbsp;</p>\n<p>其实不是的，恰恰是因为他们没有安全感，所以迫切地想建立一个安全基地，让自己感到安全放心。</p>\n<p>&nbsp;</p>\n<p><strong>第三，安全感充足的人，建立关系虽然不快，却很稳定持久。</strong></p>\n<p>&nbsp;</p>\n<p>我理解的&ldquo;亲密&rdquo;并非没有冲突，而是满意度高。安全感充足的人，情绪和人格都相对稳定，能够接纳关系中矛盾的时刻、不和谐的部分，容易对关系感到满意。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220228/46ae4e7bfa2971dffafc5f4be92849ef.gif\" /></p>\n<p>&nbsp;</p>\n<h1><strong>02</strong></h1>\n<h1><strong>是什么影响了你的安全感？</strong></h1>\n<p>&nbsp;</p>\n<p>先讲一个寓言故事。</p>\n<p>&nbsp;</p>\n<p>小A准备去一个小镇，去之前他先问了一个从小镇出来的人：<em>小镇居民怎么样？</em></p>\n<p>&nbsp;</p>\n<p>那个人跟小A说：<em>小镇居民友善、勤劳、勇敢、乐于助人。</em></p>\n<p>&nbsp;</p>\n<p>小A听完就去了，结果觉得小镇居民确实如他说的一样友善、勤劳、勇敢、乐于助人。</p>\n<p>&nbsp;</p>\n<p>小C也准备去这个小镇，他问了同样从小镇出来的人，那个人说：<em>小镇居民可糟糕了，恶毒又冷漠，人和人之间的距离很远。</em></p>\n<p>&nbsp;</p>\n<p>于是小C去到小镇之后，发现小镇居民也和他说的完全吻合。</p>\n<p>&nbsp;</p>\n<p>小镇居民是同一批人，可是给小A和小C的印象却完全不一样，而这只是因为，小A和小C相信了不同的描述。</p>\n<p>&nbsp;</p>\n<p>通过这个故事，我想表达的是，<strong>我们相信什么，就会去印证什么。</strong></p>\n<p>&nbsp;</p>\n<p>如果小时候有好的关系滋养到我们，我们相信&ldquo;人和人之间是会有美好的关系的&rdquo;，长大后就更容易建立亲密关系，更容易体会到需要和被需要的感觉，从而印证自己的信念，印证过程就是对安全感的进一步强化。</p>\n<p>&nbsp;</p>\n<p>如果小时候我们经历了一些不好的关系，相信&ldquo;人和人之间很难有好的关系&rdquo;，我们长大后也会去印证这一点，从而越来越没有安全感。</p>\n<p>&nbsp;</p>\n<p><strong>影响安全感的，就是</strong><strong>&ldquo;</strong><strong>信任感</strong><strong>&rdquo;</strong><strong>。而信任感，来自儿时。</strong></p>\n<p>&nbsp;</p>\n<p>有句老话是：<em>三岁看大，七岁看老。</em></p>\n<p>&nbsp;</p>\n<p>从心理学的角度，这句话是有科学性的：0~3岁是安全感&ldquo;打地基&rdquo;的时期。</p>\n<p>&nbsp;</p>\n<p>0~3岁间，你天生的性格、遗传因素，你被如何养育、如何对待、有需求时被如何回应、需求满足程度是多少&hellip;&hellip;，共同形成了你的&ldquo;依恋模式&rdquo;，也就是&ldquo;安全感地基&rdquo;。</p>\n<p>&nbsp;</p>\n<p><strong>地基打扎实了，形成安全型依恋，以后高楼大厦随便建；地基没打扎实，建楼时每加一块砖，楼身可能都会晃动，令人战战兢兢。</strong></p>\n<p>&nbsp;</p>\n<p>但地基也不是万年不变的，如果你长大后遇到一些好的关系，对你有非常充足的滋养，你可能会慢慢开始&ldquo;相信&rdquo;，于是从不安全型依恋变成安全型依恋（会有点难度且需要时间）；</p>\n<p>&nbsp;</p>\n<p>如果本来你是很安全的，但是后来在关系中遭到了很大的打击，比如离婚，比如亲人去世，那你的地基也可能有所松动，变得没那么安全。</p>\n<p>&nbsp;</p>\n<h1><strong>03</strong></h1>\n<h1><strong>如何建立安全感？</strong></h1>\n<p>&nbsp;</p>\n<p>一旦你小时候形成了不安全型依恋，延续到现在；或者你本来是安全型，遭遇一些事情后变得没那么安全，我们要如何重新建立安全感呢？</p>\n<p>&nbsp;</p>\n<p>首先要说明，没有一蹴而就的方法，除非你遇到了一个魔术师，他有一根能瞬间把不安全变安全的魔法棒。</p>\n<p>&nbsp;</p>\n<p><strong>安全感是在关系中形成的，那么也要从关系中疗愈。而任何一种关系的建立和确认，都是需要时间沉淀的，急不得。</strong></p>\n<p>&nbsp;</p>\n<p>我曾经是个没有安全感的人，现在回看以前的日记，会发现我一天心情起起伏伏，情绪很不稳定，跟坐过山车似的。而且我一个人的时候，我觉得很孤单，很难独处。</p>\n<p>&nbsp;</p>\n<p>在婚姻中，我曾经也有很强的不安全感，比如丈夫说我碗没洗干净，我情绪立刻激动，内心觉得&ldquo;我不够好&rdquo;；还有常常觉得没有尽好一个妈妈的责任。</p>\n<p>&nbsp;</p>\n<p>我没办法将事情和人分开，有事情就立刻有情绪，立刻感到不安全，立刻开启防御模式保护自己，张牙舞爪指责抱怨。</p>\n<p>&nbsp;</p>\n<p><strong>但我很幸运，拥有了两段比较好的关系。</strong></p>\n<p>&nbsp;</p>\n<p>第一段是我跟丈夫的关系。我丈夫虽然有点逃避和退缩，但总体来说是个内核比较稳定的人，所以会比较接得住我，我能在这个关系中一点点体验到被包容，心境越来越稳定。</p>\n<p>&nbsp;</p>\n<p><strong>第二段是我和我的心理咨询师的关系。</strong>没错，在我成为咨询师之前，我就去体验了心理咨询，并且从中受益，才走上了从业的道路。</p>\n<p>&nbsp;</p>\n<p><strong>心理咨询本质上就是从关系中疗愈，你和咨询师的关系就像一面镜子，会折射出你与他人的关系，而咨询师会在这段关系中帮助你觉察并领悟、修通你的关系模式。</strong></p>\n<p>&nbsp;</p>\n<p>并且心理咨询<strong>营造了一个温暖的、抱持的、无条件接纳的氛围，对于小时候没有体验过这种抱持的人来说，这是一次重新体验、重新获得滋养、重新成长的机会。</strong></p>\n<p>&nbsp;</p>\n<p>所以，如果你也是个安全感不足的人，并且觉察到已经影响到了你的工作、生活、以及你的亲密和不亲密的关系，那么，也许是时候开启一段关于真实自我的探索的旅程了，无论这个旅程的陪伴者是不是我。</p>\n<p>&nbsp;</p>\n<p><strong>在咨询的抱持下，你能够更多更深地去体验自己的情绪情感，尝试放心地跳进生活的河流，看见安全感的样子，变得更灵活变通、更加稳定、更加归于你自己的中心。</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h6>文：刘萍</h6>\n<h6>责任编辑：殷水</h6>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户在发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/09631eb0abf54c1fba6a88371d1eb06dfile.png', 0, 0, 'Normal', 0, '2022-03-15 19:46:04', '2022-03-15 19:51:13');
INSERT INTO `edu_article` VALUES ('1503699811549962242', '1502211793588604930', '与子女沟通', '成长过程', NULL, '亲子间，这种有效管教，要警惕', '家庭关系', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<p>刷到一个让人窒息的短视频。</p>\n<p>&nbsp;</p>\n<p>由于上初中的儿子玩手机成绩下降，从学校回到家后的爸爸，竟然脱掉了自己的上衣，还递给儿子一根鞭子，让他来打自己。</p>\n<p>&nbsp;</p>\n<p>理由是：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>你变得越来越坏是爸爸的责任！</p>\n<p>&nbsp;</p>\n<p>没教育好你，是我的错，动手！</p>\n<p>&nbsp;</p>\n<p>我来替你挨打！我来替你受这个罪！</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>一旁的孩子听着这些，吓得不敢说话，一动不动。</p>\n<p>&nbsp;</p>\n<p>爸爸就光着后背趴在那里，还一个劲儿地施压：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>快点动手！</p>\n<p>&nbsp;</p>\n<p>现在连我的话都不听了是吗？</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>反复逼着孩子动手。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/dd8108f101c3d0aa507d50fd49cdc8dd.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>有人评论说：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>子不教父之过，这个父亲真是用心良苦，这样的教育让人心服口服。</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>然而，从心理学视角看，这样的行为能和&ldquo;教育&rdquo;挂钩，绝对<strong>是对「教育」一词的侮辱。</strong></p>\n<p>&nbsp;</p>\n<p>这位父亲极端自残的方式，只是为了<strong>激起孩子的内疚感和羞耻感，进而让孩子不负重荷，只得乖乖听话。</strong></p>\n<p>&nbsp;</p>\n<p>很多网友留言：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>我妈就是这样的。从小到大我必须听她的，有一次我坚决不肯照她说的做，她就发疯一样用头撞玻璃，一边撞一边叫「我怎么还不死！」最后玻璃碎了她一头。<strong>这个场景从此成为我噩梦的引子。</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>一次我鼓足勇气反抗我妈，跟她吵起来，然后锁上门不再听她骂街。等我再出门时，发现她不在了，<strong>地上全是带血的卫生纸，</strong>当时16岁的我吓得腿都软了，哭着跑出门找她，后来跪在她面前认错。</p>\n<p>&nbsp;</p>\n<p>很多年后我才知道那是她愤怒中磕破了手，然后把血抹在卫生纸上故意吓我的。<strong>但是很奏效，从那以后我被她拿捏得死死的，让我朝西我不往东。</strong></p>\n</blockquote>\n<p>&nbsp;</p>\n<p>这些听上去堪比恐怖片的「教育方式」，在现实生活中，其实并不在少数。</p>\n<p>&nbsp;</p>\n<p>今天，壹心理就和你聊聊：令孩子不堪重负的<strong>「自残式教育」</strong><strong>。</strong></p>\n<p>&nbsp;</p>\n<h1><strong>01</strong></h1>\n<h1><strong>对自己下狠手的父母，</strong></h1>\n<h1><strong>相当于给孩子投毒</strong></h1>\n<p>&nbsp;</p>\n<p>综艺《不要小看我》中，一个妈妈对待孩子的方式「火」了。</p>\n<p>&nbsp;</p>\n<p>这位妈妈自述是一个「完美主义者」，要求女儿一定要把长长的课文一字不漏地背完。</p>\n<p>&nbsp;</p>\n<p>但事与愿违，无论她怎样发脾气，4岁的孩子就是背不下来。</p>\n<p>&nbsp;</p>\n<p>耗到凌晨一点的时候，妈妈开始放大招：</p>\n<p>&nbsp;</p>\n<p>孩子卡一下壳，妈妈就抽自己一耳光；</p>\n<p>&nbsp;</p>\n<p>孩子一直卡壳，她就一直抽。</p>\n<p>&nbsp;</p>\n<p>面对镜头，她笑着说：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p><strong>然后我看到，我女儿的表情变得特别的惊恐。</strong></p>\n</blockquote>\n<p>&nbsp;</p>\n<p>这个妈妈觉得自己的方法奏效了，既没有打孩子，孩子又被「镇」住了，不禁有些得意。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/8658021bed87032a3fff1fb6723aa27a.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>殊不知，<strong>「直接打孩子」</strong>与<strong>「</strong><strong>打自己让孩子害怕」</strong>，这两者的本质都是<strong>暴力</strong>，只是表现形式不同罢了。</p>\n<p>&nbsp;</p>\n<p>而<strong>「</strong><strong>殴打自己、控制孩子</strong><strong>」</strong>的形式，<strong>往往更隐蔽，给孩子的内心造成的冲突也更大。</strong></p>\n<p>&nbsp;</p>\n<p>因为它往往披着各种「对你好」的外衣：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>我已经都这么痛苦了，你还要跟我作对吗？</p>\n<p>&nbsp;</p>\n<p>你看，我宁可打自己都不舍得打你！</p>\n<p>&nbsp;</p>\n<p>我宁愿伤害自己都要对你好&hellip;&hellip;</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>难以识别。</p>\n<p>&nbsp;</p>\n<p>其实，凡有点育儿常识的父母都知道，「自残」根本解决不了实质问题，因为即使孩子服从，那也是因为<strong>外</strong><strong>驱</strong>的恐惧、压力，而不是内心的意愿、力量。</p>\n<p>&nbsp;</p>\n<p>那为什么有那么多的父母，选择对自己下狠手呢？</p>\n<p>&nbsp;</p>\n<p>我认为有两个原因，供参考。</p>\n<p>&nbsp;</p>\n<p><strong>a. 父母严重缺乏安全感</strong></p>\n<p>&nbsp;</p>\n<p>越缺乏安全感，就越需要掌控点什么。</p>\n<p>&nbsp;</p>\n<p>当父母通过「行之有效」的手段，牢牢地控制住孩子，完全按照自己的来，似乎就可以避免重温曾经失控的焦虑了。</p>\n<p>&nbsp;</p>\n<p><strong>b. 把孩子投射为满足「我」一切期待的神</strong></p>\n<p>&nbsp;</p>\n<p>最近，「未来少女」谷爱凌和她的妈妈，让我们看到了无条件的爱。</p>\n<p>&nbsp;</p>\n<p>相反，对于我们多数人，从小见到的都是「有条件的爱」的样子&mdash;&mdash;如果不能满足父母的期待，就不配被爱。</p>\n<p>&nbsp;</p>\n<p>就像2019年全国花滑成人组冠军安香怡，和母亲张女士。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/1d4a3a45f6967e7897516f4dfa650a60.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>张女士渴望当「女强人」，可进入外企后，现实却以「螺丝钉」的角色来回应她。</p>\n<p>&nbsp;</p>\n<p>为此她非常痛苦、挫败。</p>\n<p>&nbsp;</p>\n<p>有了女儿安香怡后，她就以「发疯虎妈」的状态逼女儿苦练花滑，「虎」到在冰场打骂年幼的女儿，以至于被其他家长举报。</p>\n<p>&nbsp;</p>\n<p><strong>这类父母，自己还处于婴儿期的全能自恋中，认定自己很完美，只是由于种种外部原因未能超越所有人。</strong></p>\n<p>&nbsp;</p>\n<p><strong>既然我不是一般人，那我生的孩子就一定不能是一般人。</strong></p>\n<p>&nbsp;</p>\n<p>所以，如果孩子在学业、工作、待人接物等等上不够完，就会引起父母的自恋幻灭，打破了父母「我很完美」的自恋幻想。</p>\n<p>&nbsp;</p>\n<p>这时父母就很抓狂暴躁，把怨恨全都倾泻到孩子身上去，让孩子承受父母自恋挫败的暴怒。</p>\n<p>&nbsp;</p>\n<p>但值得注意的是，如果这种暴怒是直接宣泄到孩子头上，对孩子非打即骂，虽然也很糟糕。</p>\n<p>&nbsp;</p>\n<p>但如此一来，孩子很清楚父母是「坏」的角色，<strong>内心可以比较坦然地恨父母，也不会有太多内疚。</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/263e2edf92d7adb5508e504759eb7644.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>最可怕的情形是，父母接受不了自己是「坏」的。</p>\n<p>&nbsp;</p>\n<p>所以，干脆狠狠地自我攻击。</p>\n<p>&nbsp;</p>\n<p>这样，既宣泄了对孩子的恨意，成功吓住了孩子；</p>\n<p>&nbsp;</p>\n<p>又没有成为打孩子的坏父母，甚至从「加害者」摇身一变成了「受害者」，堪称道德完人。</p>\n<p>&nbsp;</p>\n<p><strong>可事实上，这和给孩子投毒，别无两样。</strong></p>\n<p>&nbsp;</p>\n<p><strong>他们不仅无法坦然地恨父母，还会攻击自己，心疼给自己投毒的父母。</strong></p>\n<p>&nbsp;</p>\n<p>这会让孩子在心理层面与父母的分离愈加艰难，也成为孩子未来人生的痛苦之源。</p>\n<p>&nbsp;</p>\n<h1><strong>02</strong></h1>\n<h1><strong>「都是因为你，你要为此负责」</strong></h1>\n<p>&nbsp;</p>\n<p>所谓养育创伤，很少有一朝筑成。</p>\n<p>&nbsp;</p>\n<p>那么，随着父母的「自残」日积月累，有苦难言的孩子，会变成什么模样？</p>\n<p>&nbsp;</p>\n<p><strong>首先，就是自我惩罚。</strong></p>\n<p>&nbsp;</p>\n<p>试想，一个孩子天天看到：因为我，妈妈狠命抽自己耳光；因为我，爸爸替我挨鞭子&hellip;&hellip;</p>\n<p>&nbsp;</p>\n<p>这些<strong>侵入性场景</strong>，是不是太恐怖了？</p>\n<p>&nbsp;</p>\n<p>慢慢的，他们幼小的心灵中，塞满无法消化的异物。</p>\n<p>&nbsp;</p>\n<p>他们不会觉得父母有错，只会认为自己攻击了最爱的人，心中充满负罪感和亏欠感。</p>\n<p>&nbsp;</p>\n<p>成年后，也不敢过好日子，不敢轻松，更不敢享受。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/e53657a6644c3ad0fa8d7e7af923fbac.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>因为一旦迈出这一步，潜意识中就有一个熟悉哀怨的声音响起：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>看，我这么痛苦，都是因为你，你要为我负责。</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>这样的孩子，长大后也习惯为他人的情绪负责，时常陷入「我必须完美/我必须解决问题」的巨大焦虑中。</p>\n<p>&nbsp;</p>\n<p><strong>然后，是容易走入危险关系。</strong></p>\n<p>&nbsp;</p>\n<p>我一个大学同学，毕业后「遇人不淑」。</p>\n<p>&nbsp;</p>\n<p>男生追她时很热烈，也很殷勤。</p>\n<p>&nbsp;</p>\n<p>但随着交往加深，她渐渐发现对方的性格偏执，且有自虐倾向。</p>\n<p>&nbsp;</p>\n<p>平时只要有不顺着他的情况，他就会一两天不吃饭不喝水，甚至发烧呕吐也不去医院，必须我同学彻底地认错道歉、痛哭流涕地求饶才行。</p>\n<p>&nbsp;</p>\n<p>次数多了，同学受不了便提出分手，但此时对方的自残行为也升级了&mdash;&mdash;扇自己耳光，拿头撞墙，割腕，往车水马龙的大街上冲等等&hellip;&hellip;</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/a03bea70fdc2ee355f9dcd3928f774e9.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>很明显，就是想吓住女方，从而不得不配合自己的意志。</p>\n<p>&nbsp;</p>\n<p>事实证明，他得逞了。</p>\n<p>&nbsp;</p>\n<p>更可悲的点在于，我这个同学从小就被父母如此对待，<strong>所以她对于这种情绪高度不稳定、危险人格的对象具有高耐受性，</strong>任对方剥削、打压，还会觉得自己错了，被PUA得团团转。</p>\n<p>&nbsp;</p>\n<h1><strong>03</strong></h1>\n<h1><strong>爱，是一种稀有的能力</strong></h1>\n<p>&nbsp;</p>\n<p>以上场景，我相信没有任何父母愿意看到。</p>\n<p>&nbsp;</p>\n<p>这些动不动就扇自己耳光、捶自己头的父母，难道他们真的不想爱自己的孩子吗？</p>\n<p>&nbsp;</p>\n<p>未必。</p>\n<p>&nbsp;</p>\n<p><strong>只是，爱不光是一种意愿，更是一种稀有的能力。</strong></p>\n<p>&nbsp;</p>\n<p>美国知名心理治疗师苏珊&middot;福沃德在《中毒的父母》一书中说过：</p>\n<p>&nbsp;</p>\n<blockquote>\n<p>爱包含的不仅仅是感情，它也是一种行为方式。</p>\n<p>&nbsp;</p>\n<p>如果你去问任何中毒的父母，他们爱不爱自己的孩子，他们中大多数人会斩钉截铁地说&lsquo;爱&rsquo;，<strong>然而可悲的是，他们的孩子却多半会感受从未得到过父母的爱。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p>中毒父母所述的爱，很少转换为哺育关爱的行为。</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>所以身为父母，要从孩子的感受出发，给到孩子所需要的爱。</p>\n<p><br />不要再那么「残忍」了。</p>\n<p>&nbsp;</p>\n<p><strong>要知道，你之所以能用伤害自己的方式吓住孩子，无非是利用了孩子对你天然真挚、发自内心的爱。</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220301/c30ee93b57632f26cc1845f9f4fba1d2.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>如果你是孩子，在有「自残式父母」的家庭环境中长大，你最重要的功课就是<strong>重新建立边界感</strong>。</p>\n<p>&nbsp;</p>\n<p>父母自残，核心就是让你感到内疚、亏欠，继而为他们负责。</p>\n<p>&nbsp;</p>\n<p>所以你的边界感往往是模糊的，<strong>总想为别人的情绪（通常是负面的）而做点什么</strong>，让他们开心、满意起来。</p>\n<p>&nbsp;</p>\n<p>如果现在有人对你表达失望，你要做的，不是努力让他不失望，而是拨开心疼、内疚和恐惧，看到：</p>\n<p>&nbsp;</p>\n<p><strong>失望是他的</strong><strong>感受，而你不必为他的感受负责。</strong></p>\n<p>&nbsp;</p>\n<p>如果你失望，那你就失望去好了。</p>\n<p>&nbsp;</p>\n<p>这样，你便拥有了清晰的界限。</p>\n<p>&nbsp;</p>\n<p>最后，也是最重要的一点：</p>\n<p>&nbsp;</p>\n<p>接受自己是个普通人&mdash;&mdash;<strong>有能和不能，有对也有错。</strong></p>\n<p>&nbsp;</p>\n<p>我们需要接受那些我们做不到的、解决不了的、不完美的部分。</p>\n<p>&nbsp;</p>\n<p>如此，你便走进了一片新的天地。</p>\n<p>&nbsp;</p>\n<p>光透进来，那些伤痕终于被看见，被轻抚，被接纳，也终于成为我们自身不再被排斥的一部分。</p>\n<p>&nbsp;</p>\n<p><strong>带着伤，我们依旧光芒万丈。</strong></p>\n<p>&nbsp;</p>\n<p>世界和我爱着你。</p>\n<p>&nbsp;</p>\n<h6>References：</h6>\n<h6>1.苏珊&middot;福沃德《中毒的父母》</h6>\n<h6>2.时尚先生《天才花滑少女和她的虎妈》</h6>\n<h6>&nbsp;</h6>\n<h6>&nbsp;</h6>\n<h6>图源：keira burton</h6>\n<h6>作者：晴岸&nbsp; （心理学硕士，年轻妈妈，大千世界中一个耐心的记录者。知识星球/个人公众号：晴岸的心理空间）</h6>\n<h6>编辑：朴素的树、青橙</h6>\n<h6>责任编辑：殷水</h6>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/ea328785d7df48b8ac4d503abdd10a69file.png', 0, 0, 'Normal', 0, '2022-03-15 19:49:07', '2022-03-15 19:51:13');
INSERT INTO `edu_article` VALUES ('1503700285019774977', '1502211793588604930', '自我修复疗愈', '接纳自我', NULL, '如何让心灵永远保持活力？', '自我疗愈', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<h6>作者：Lachel</h6>\n<h6>来源：微信公众号：L先生说（ID：lxianshengmiao）</h6>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>在这篇文章的开头，我想先分享一个最新的研究。</p>\n<p>&nbsp;</p>\n<p>在过去几十年里，学术界一直认为：我们的智力会随着时间推移逐步下降，对绝大多数人来说，25岁左右是一个高峰，到了25岁以后，智力就开始走下坡路了。</p>\n<p>&nbsp;</p>\n<p>这里的智力包含什么呢？主要是流体智力，也就是分析和思考问题的能力。比如：思维速度，反应速度，理解能力，记忆力，等等。</p>\n<p>&nbsp;</p>\n<p>这也非常符合我们的认知。毕竟，随着年岁增大，我们很容易觉得：大脑转动的速度越来越不如从前，记忆力和反应速度都没有年轻时那么敏捷了&hellip;&hellip;</p>\n<p>&nbsp;</p>\n<p>但是，最新的一个研究给了我们一个振奋人心的消息。这篇研究发在 2022 年 2 月的《自然》上。它分析了超过 120 万名年龄在 10 岁到 80 岁的参与者数据，发现：我们智力下降的速度，可能没有我们过往想象的那么多。(von Krause等, 2022)</p>\n<p>&nbsp;</p>\n<p>简单来说，如果保养得当的话，<strong>我们的思维速度，可以维持一个较为平稳的水准，一直持续到 60 岁左右。</strong>直到 60 岁以后，思维速度才会出现明显的下降。</p>\n<p>&nbsp;</p>\n<p>不过，这项研究只分析了思维速度，没有分析其他跟认知和智力相关的能力。并且这项研究由于颠覆性较强，尚需更多的验证和支撑，现在还无法直接下定论。</p>\n<p>&nbsp;</p>\n<p>但不可否认，这给了我们更大的勇气，去面对自己一步步的成长和变老。它让我们知道：<strong>只要自己愿意，生命中的每一个节点都可以是「开始」。无论你想在哪个节点开始探索新的兴趣、新的事业，都不算迟。</strong></p>\n<p>&nbsp;</p>\n<p>那么，如何更好地让自己能够长期保持良好的状态，在生命中的每个节点，都能像20多岁一样充满活力呢？</p>\n<p>&nbsp;</p>\n<p>之前，在旧文&nbsp;如何让大脑保持年轻与健康？之中，我已经系统阐述了对「脑力」的保护。简单来说就是：</p>\n<p>&nbsp;</p>\n<p>随着年龄增长，大脑神经元会逐步积累损伤，这些损伤会导致神经元工作效率下降，影响我们的脑力。</p>\n<p>&nbsp;</p>\n<p>如何避免脑力下降？最核心的做法，是去积累「认知储备」，也就是提高神经元的效率，从而抵消掉损伤所带来的效率下降。</p>\n<p>&nbsp;</p>\n<p>这篇文章对于脑力的部分，已经讲了很多，无须再赘述了。</p>\n<p>&nbsp;</p>\n<p>因此，在今天文章里，我想进一步跟大家聊聊</p>\n<p>&nbsp;</p>\n<p>除了脑力之外，如何让心灵永远保持年轻，保持活力、激情和冲劲。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220312/7623c31a7d88623b8e8d259b158dd8d3.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>每一期的智识营，学员年纪都以30-40岁这个区间居多，但也会有不少40岁以上的同学。其中，不少同学都会有这样的顾虑：</p>\n<p>&nbsp;</p>\n<p>我年纪已经不小了，也没有基础，现在来学这么复杂的东西，真的能学得会吗？会不会远远比不上同期的年轻人？</p>\n<p>&nbsp;</p>\n<p>这似乎是很多人的困惑。似乎我们一旦到了某个特定的年纪，再去接触新东西，就会自动产生下意识的排斥和畏难心理：</p>\n<p>&nbsp;</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>我真的学得会吗？</p>\n</li>\n<li>\n<p>我会不会被年轻人抛在后面？</p>\n</li>\n<li>\n<p>我是不是需要花费更多的时间、精力，才能从零开始？</p>\n</li>\n</ul>\n<p>&nbsp;</p>\n<p>学一门课程，或者接触一个新领域、培养一门新兴趣、掌握一门新手艺，都似乎成了需要花费巨大的勇气，才能够去做的事情。</p>\n<p>&nbsp;</p>\n<p>但实际上，看过&nbsp;如何让大脑保持年轻与健康？这篇文章的朋友会知道：学习新东西，并不是「行不行」的问题，而是一件非常有必要的事情。</p>\n<p>&nbsp;</p>\n<p>为什么呢？因为随着年龄推移，我们的神经元损伤都会无可避免地积累，从而影响我们的脑力，甚至提高阿兹海默症的风险 &mdash;&mdash; 而能最有效降低风险、对冲损伤的，就是「学习新事物」这个方式。</p>\n<p>&nbsp;</p>\n<p>换句话说：<strong>你不学，你的脑力就会无可避免地下降；但你学了，这种下降的趋势还可以慢一些，甚至可以不下降。</strong></p>\n<p>&nbsp;</p>\n<p>那么，为什么我们总是会对新事物产生排斥情绪呢？</p>\n<p>&nbsp;</p>\n<p>最主要的原因，不是我们觉得「脑力不行」，而是我们的心态发生了变化。</p>\n<p>&nbsp;</p>\n<p>科幻作家道格拉斯&middot;亚当斯对此有一段非常精辟的描述：</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<blockquote class=\"\" data-type=\"2\" data-url=\"\" data-author-name=\"\" data-content-utf8-length=\"105\" data-source-title=\"\">\n<p>1）任何在我出生时已经有的科技，都是稀松平常的世界本来秩序的一部分。&nbsp;&nbsp;</p>\n<p>2）任何在我15-35岁之间诞生的科技，都是将会改变世界的革命性产物。&nbsp;&nbsp;</p>\n<p>3）任何在我35岁之后诞生的科技，都是违反自然规律，要遭天谴的。</p>\n</blockquote>\n<p>&nbsp;</p>\n<p>在我们年轻的时候，<strong>我们的大脑忙着为世界建模，忙着去探索世界，这个时候，一切新鲜事物对我们来说，都是补充我们认知框架的养分。</strong>我们孜孜不倦地吸收这些养分，希望每天都有新鲜刺激，无法忍受枯燥和无聊。</p>\n<p>&nbsp;</p>\n<p>但随着年龄增长，我们对世界的认知框架愈发固定、完善。这个时候，一切在这个框架之外的新鲜事物，就变成了什么呢？<strong>变成了对我们固有框架的冲击和威胁。</strong></p>\n<p>&nbsp;</p>\n<p>我们会下意识地觉得：它们的存在，使得我们已经固定的认知框架变得「不那么牢靠」，甚至有被推翻和摧毁的风险。</p>\n<p>&nbsp;</p>\n<p>而这意味着什么呢？意味着我们过去几十年所接收的信息、所相信的事物、所践行的行动、所收获的经验，可能都将不再适用。我们就像一个没有保护的孩子，突然被抛到一个全新的世界，一切熟悉的事物都不在身边。</p>\n<p>&nbsp;</p>\n<p>这是非常可怕的，也是我们的大脑竭力在抵抗和「逃避」的。</p>\n<p>&nbsp;</p>\n<p>因此，随着年龄增长，我们的心灵都会越来越趋于保守，越来越趋于封闭。</p>\n<p>&nbsp;</p>\n<p><strong>并不是我们没有能力跟上新的变化，而是我们自己内心深处，不想去面对「新的变化」罢了。</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220312/d130d199f44898232d743db5ee3d9108.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>另一个原因，是随着年龄增长，我们拥有的越来越多，我们的顾虑也就越来越多。</p>\n<p>&nbsp;</p>\n<p>年轻的时候，我们的着眼点更多地放在「未来」。我们会觉得，一切都充满希望，只要我们努力，似乎没有什么是不能得到的。与此同时，由于我们没有什么能够失去，因此，我们会有更强的风险承受能力，愿意去探索，也愿意去冒险。</p>\n<p>&nbsp;</p>\n<p>但随着年龄增长，我们积累的东西越来越多，肩上扛着的担子也越来越重。我们开始会有种种患得患失，开始会有种种顾虑。我们的目光开始从「未来」转移到「过去」。</p>\n<p>&nbsp;</p>\n<p><strong>我们不再想着「如何去得到我想要的东西」，而是「如何维持我已有的东西」。</strong></p>\n<p>&nbsp;</p>\n<p>这就是损失厌恶的力量。你拥有的越多，对于你前进的阻力，也就越大。</p>\n<p>&nbsp;</p>\n<p>因此，对这时的我们来说，最好的策略，就是把自己局限在熟悉的路径和模式里面，用同样的方法做事，争取得到同样的结果。因为我们负担不起「意外」所带来的冲击，无论是对于时间精力的冲击，还是对于心态和思维的冲击。</p>\n<p>&nbsp;</p>\n<p>大脑是喜欢稳定和确定的，因为这是一个低耗能的状态。只有这样，才能给我们带来安全感。</p>\n<p>&nbsp;</p>\n<p>久而久之，我们的心灵领地，就会越来越小，把我们困在这片熟悉的天地里，难以越雷池一步。</p>\n<p>&nbsp;</p>\n<p>当然，我不是说，你要去冒险，要贸然投身于全新的领域，要去抛弃你目前稳定的、确定的生活 &mdash;&mdash; 这同样是没有必要的。</p>\n<p>&nbsp;</p>\n<p>但是，时代的变化不会完全遂意。我们不希望变化，但外界每时每刻都在变化。如果无法理解和接受，那么总有一天，我们会发现，自己已经被时代远远地抛在了身后。</p>\n<p>&nbsp;</p>\n<p>所以，我在之前的文章里就讲过：</p>\n<p>&nbsp;</p>\n<p>也许，在未来的时代，我们的安全感不应该由「我所拥有的、确切且稳定的事物」来提供，而是应该<strong>由我所具备的、能够随时理解和顺应外部世界变化的灵活性来提供。</strong></p>\n<p>&nbsp;</p>\n<p>也就是说，我们要通过一步步的引导和调整，让大脑把「最喜欢的状态」，由稳定状态下的低耗能，转移到「灵活应对变化」下的中等耗能。</p>\n<p>&nbsp;</p>\n<p>一旦你习惯并适应了这种中等耗能的状态，你就不会再觉得它是一种风险和负担 &mdash;&mdash; 从而，你才会有更多的精力和心力，去打开观察这个世界的双眼。</p>\n<p>&nbsp;</p>\n<p>因此，我在&nbsp;2022 年，我的一些小建议&nbsp;中提到：2022 年，我给自己设下的年度关键词，是「灵活」。</p>\n<p>&nbsp;</p>\n<p>只有把自己的心态，从「稳定不变」转变为「灵活」，才能为你创造更适应时代的、更不容易被破坏的安全感。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220312/28cc4131c3ff07d4a6a4bd27724fa67c.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>所以，我想对每一位朋友 &mdash;&mdash; 无论你是年轻人，还是已经到了某个特定年纪 &mdash;&mdash; 说：</p>\n<p>&nbsp;</p>\n<p><strong>打开心扉，迈出脚步。</strong></p>\n<p>&nbsp;</p>\n<p>用英语来说，就叫做「Think open, do big」&mdash;&mdash; 用自己的力量，去对抗外部世界对我们心灵的倾轧，对抗我们心灵逐步固化、萎缩的自然规律。</p>\n<p>&nbsp;</p>\n<p>《稀缺》中提到过一个非常有趣的概念，叫做<strong>「心智带宽」</strong>。作者认为：我们每天能够考虑问题的精力是有限的，贫穷的人之所以难以脱离贫穷，正是因为他们不得不把太多的精力投入在「如何维持生存」上面，从而没有多余的带宽去思考发展的问题。</p>\n<p>&nbsp;</p>\n<p>这个理论用在这里也是非常合适的：</p>\n<p>&nbsp;</p>\n<p>许多人之所以会慢慢丧失锐气，失去对生活的激情和冲劲，很大一部分原因是因为：<strong>他们把太多的带宽，用在「如何维持我现有的生活」「如何避免失去我已有的东西」上面，从而缺乏资源去考虑「如何探索新的领域」。</strong></p>\n<p>&nbsp;</p>\n<p>所以，我想说的是什么呢？</p>\n<p>&nbsp;</p>\n<p>你不需要放弃当下的稳定，但一定要<strong>匀出更多的心智资源，分配给未知的事物和全新的领域。</strong>你可以过着每天熟悉的生活，但一定要拨出一点时间和精力，接触一些不了解的事物，跟不同的人对话沟通，做一些有长期回报的事情，尝试一些不同的生活方式。</p>\n<p>&nbsp;</p>\n<p>这就叫「打开心扉，迈出脚步」。不要对未知和新鲜事物关上心门，要时刻保留改变自己认知和思维的可能性。</p>\n<p>&nbsp;</p>\n<p>比如说，在观点和立场上：</p>\n<p>&nbsp;</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>永远不排除对自己的怀疑：要是我错了，会怎么样？</p>\n</li>\n<li>\n<p>当面临跟自己不同的意见时，想一想有没有可能从更高的层级得到共识；</p>\n</li>\n<li>\n<p>当我形成一个立场时，不妨多了解对立立场的观点，看看有什么是我所不知道的。</p>\n</li>\n</ul>\n<p>&nbsp;</p>\n<p>在生活方式上：</p>\n<p>&nbsp;</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>每天、每周、每月，一定要给自己设一个简单的目标，探索一些没做过的事情；</p>\n</li>\n<li>\n<p>当我觉得自己开始重复过去的做法时，也许就是时候做出改变了；</p>\n</li>\n<li>\n<p>管理好自己的信息输入，拒绝无聊的、庸俗的信息，多想一想自己想要什么、需要什么。</p>\n</li>\n</ul>\n<p>&nbsp;</p>\n<p>在认知和思维上：</p>\n<p>&nbsp;</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>多去了解别人做事的方式、考虑问题的方式、应对挑战的方式，扩充自己的数据库；</p>\n</li>\n<li>\n<p>及时把面临的新问题提炼、梳理成方法论，让一切经历都变成能够指导行动的经验；</p>\n</li>\n<li>\n<p>不放过任何提升自己思维的机会，每一次新鲜知识的注入，都是一种打破旧枷锁的机会。</p>\n</li>\n</ul>\n<p>&nbsp;</p>\n<p>这些是我给自己设下的信条和原则，在这里也分享给大家，与你共勉。</p>\n<p>&nbsp;</p>\n<p>总而言之：</p>\n<p>&nbsp;</p>\n<ul class=\" list-paddingleft-2\">\n<li>\n<p>不是被动接收信息，而是主动出击，像猎人寻求猎物一样，去挖掘这个世界上每个角落在发生的变化。</p>\n</li>\n<li>\n<p>不是停留在自己熟悉的生活模式里，而是想办法改变这个生活模式，不断引入外力来刺激它、冲击它。</p>\n</li>\n<li>\n<p>不要满足于自己已经拥有的事物，而是多想想，有什么事情，是我希望在走到终点之前一定要去做的？</p>\n</li>\n<li>\n<p>不被自己所改变，终将被迫被这个世界所改变。</p>\n</li>\n</ul>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220312/6515cb2aaa365a1bae75f2102c5724ce.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>分享几点小小的思路，希望能给你一些方向。</p>\n<p>&nbsp;</p>\n<p><strong>1）更开放而不是更封闭</strong></p>\n<p>&nbsp;</p>\n<p>当我们说「一个人老了」的时候，我们指的是什么？往往不是说他的反应变慢，行动迟缓，身体衰弱，而是说：他变得更加固执了。</p>\n<p>&nbsp;</p>\n<p>当一个人执着于自己已经建立的框架，不希望它受到一丝一毫的撼动，从而选择对外界的信息一律无视时，他的心灵其实就已经走到暮年了。</p>\n<p>&nbsp;</p>\n<p>所以，一个建议是：在我们日常的生活、工作和学习中，匀出一点心智资源和精力，预留给「可能破坏我们认知框架」的信息，不拒绝这些可能性。</p>\n<p>&nbsp;</p>\n<p>生命并不是一个固定的、圆满的点，而是一个过程。它一旦停下来，也就相当于走到终点了。</p>\n<p>&nbsp;</p>\n<p><strong>2）更陌生而不是更熟悉</strong></p>\n<p>&nbsp;</p>\n<p>我们可以把生活大致分成「运营」和「项目」。你遵循惯性、按照既定方式去做的重复性工作，就叫运营。它是一种填充性的行为，不会为你的回忆留下印记。</p>\n<p>&nbsp;</p>\n<p>而一次性的，带有特定目的的，有开始和结束，需要动脑动手去探索，可以产出特定成果的一系列事项，打包在一起，就是一个「项目」。</p>\n<p>&nbsp;</p>\n<p>打个比方：我每天都会写一个日志，对这一天进行复盘，这是一个运营，因为它是一种日常的重复性事务；但今天我看了一部电影，非常棒，于是我花半小时写了一个简单的影评，分析它好在哪里，为什么棒，那么这就是一个小小的项目 &mdash;&mdash; 因为它使得这一天有了不同。</p>\n<p>&nbsp;</p>\n<p>一个建议是：为自己的生命，去寻找和创造「项目」。它可能是一个新技能，一个新活动，一个新的兴趣爱好&hellip;&hellip;总而言之，是跟日常生活相区分开的事物。通过这种方式，为生活注入新鲜感。</p>\n<p>&nbsp;</p>\n<p><strong>3）更有激情而不是更平稳</strong></p>\n<p>&nbsp;</p>\n<p>随着我们年龄增长，我们慢慢需要去培养和加强的能力是什么？不是理性思考的能力，而是对某种事物、某种目标，去投入激情的能力。</p>\n<p>&nbsp;</p>\n<p>愿意不考虑成本、不计较得失、单纯享受过程中的乐趣，用这样的心态去做一件事情，是一种幸福。</p>\n<p>&nbsp;</p>\n<p>如果你还没有这样的事情，请去找一找。</p>\n<p>&nbsp;</p>\n<p>这会成为你对抗「衰老」最好的方式。</p>\n<p>&nbsp;</p>\n<p><strong>4）更多的联系而不是更少</strong></p>\n<p>&nbsp;</p>\n<p>试着去交更多的朋友，延伸自己跟这个世界的交流。</p>\n<p>&nbsp;</p>\n<p>试着去发出自己的声音，发表自己的观点，分享自己的见解，扩大自己的影响力。</p>\n<p>&nbsp;</p>\n<p>试着去参加更多的活动，发挥自己的才华，让自己被更多的人看到。</p>\n<p>&nbsp;</p>\n<p><strong>当我们用延展的姿态把生命展开时，我们的生命才是最绚丽的。</strong></p>\n<p>&nbsp;</p>\n<h1><strong>-闲聊时刻-</strong></h1>\n<p>&nbsp;</p>\n<p>从现在就开始行动，找出一件新鲜的事情，去试着做一做吧。</p>\n<p>&nbsp;</p>\n<p>可以在评论区留下你的想法，跟其他人一起分享。</p>\n<p>&nbsp;</p>\n<p>也欢迎给我在看、留言、分享，给我一点反馈喔。</p>\n<p>&nbsp;</p>\n<h6>作者简介：Lachel，本文转载自微信公众号：L先生说（ID：lxianshengmiao），专注心理学、认知科学和心智成长。每周四原创更新，与你一起探索事物本质。</h6>\n<h6>&nbsp;</h6>\n</div>\n<div class=\"article-copyright\">\n<p><span class=\"subtitle\">原作者名:</span><span class=\"copyright-desc\">Lachel</span></p>\n<p><span class=\"subtitle\">转载来源:</span><span class=\"copyright-desc\">微信公众号：L先生说（ID：lxianshengmiao）</span></p>\n<p><span class=\"subtitle\">原文标题</span><span class=\"copyright-desc\">如何让心灵永远保持活力？</span></p>\n<p><span class=\"subtitle\">授权说明:</span><span class=\"copyright-desc\">本文转载自公众号，如有侵权，请联系删除</span></p>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/3a1164b45a4645eea3377d37342b06f4file.png', 0, 0, 'Normal', 0, '2022-03-15 19:51:00', '2022-03-15 19:51:15');
INSERT INTO `edu_article` VALUES ('1503705555875704834', '1502246606873903105', '沟通方法', '社交恐惧', '印象管理', '总是担心别人对自己的看法？是因为缺乏被讨厌的勇气', '人际社交', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<h6>文：Mindfront</h6>\n<h6>来源：微信公众号：曼朗mindfront （ID：mindfront）</h6>\n<h6>原文标题：总是担心别人对自己的看法？是因为缺乏「被讨厌的勇气」</h6>\n<p>&nbsp;</p>\n<p>&ldquo;不怕被任何人讨厌才是真正的自由。&rdquo;</p>\n<p>&nbsp;</p>\n<p>自由说不，不用担心得罪任何人，是许多社恐人的终极梦想。</p>\n<p>&nbsp;</p>\n<p>但在现实生活中，我们大都缺乏&ldquo;被讨厌的勇气&rdquo;，会担忧他人对自己的想法，害怕自己会被他人不喜欢。这些顾虑多少缚住了我们的手脚，也阻碍了我们成为真正的自己。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/4eac0d2b2fd94acdbffe85dbc2d2f2e9.png?x-oss-process=image/quality,Q_80\" /></p>\n<h1><strong>01</strong></h1>\n<h1><strong>让所有人都满意是有代价的</strong><br /><br /></h1>\n<p>职场剧《三十而已》里的钟晓芹就是个典型的老好人。在公司，大到帮别人完成工作，小到修咖啡机，只要有点麻烦事，同事就会连绵不绝地呼唤她出现。</p>\n<p>&nbsp;</p>\n<p>在晓芹心中，同事间互相帮助再正常不过。有时即便同事的请求有点过分，她也是心里一边吐槽着，嘴上却忙不迭地答应着，然后急匆匆地去帮忙。</p>\n<p>&nbsp;</p>\n<p><strong>想让所有人都满意是有代价的，钟晓芹成了名副其实的&ldquo;便利贴女孩&rdquo;</strong>。</p>\n<p>&nbsp;</p>\n<p>刚开始同事对于钟晓芹的付出抱有几分感激之情，但时间一长，所有人都视她的帮助理所当然，甚至慢了还会不耐烦地催促&hellip;&hellip;</p>\n<p>&nbsp;</p>\n<p>像钟晓芹一样，落入&ldquo;讨好他人&rdquo;陷阱的人也并不少。<strong>他们大多因为害怕被别人讨厌，总在维持着好人人设，因此毫无原则的妥协和讨好，不敢拒绝他人。</strong></p>\n<p>&nbsp;</p>\n<p>这些老好人也常常因为无法拒绝而感到痛苦，一点点失去了对生活的掌控感，也干扰到了正常工作、生活的节奏。</p>\n<p>&nbsp;</p>\n<p><strong>以下这些迹象表明了我们可能太在乎别人怎么想：</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p>&nbsp;</p>\n<blockquote class=\"\" data-type=\"2\" data-url=\"\" data-author-name=\"\" data-content-utf8-length=\"126\" data-source-title=\"\">\n<p>无论是来自谁、什么样的批评，你都试图通过改变自己来回应；</p>\n<p>想让别人替自己做决定；</p>\n<p>没有设立或维护自己边界的习惯；</p>\n<p>我好像是个&ldquo;完美主义者&rdquo;；</p>\n<p>如果自己的意见与他人的意见不同，就会保持沉默；</p>\n<p>你内心的平静取决于他人的认可；</p>\n<p>经常道歉，即使自己没有做错什么；</p>\n<p>很少说不。</p>\n</blockquote>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/2a36ddf85f81384c5c31dbec80baeab0.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p>人作为一种社会性的动物，希望得到周围人的喜欢和尊重，是很自然的愿望。<strong>但过于担心别人的看法，为此拼命地付出和妥协，则会让人感到迷茫和压力。</strong></p>\n<p>&nbsp;</p>\n<p>脑成像研究表明，来自他人的正面和负面评价，会引发我们大脑中的化学反应。对负面评价的恐惧对于有社交焦虑的人来说尤其强烈。</p>\n<p>&nbsp;</p>\n<p>那些自卑和缺乏社会支持的人也更可能过度在乎他人的观点，并让他们陷入不安全和脆弱的恶性循环。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/821e63ab7125f18b69f182f626adfb89.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p><strong>但和人类拥有的大多数特征一样，适度关心他人对我们自身的看法也是一种进化适应。</strong>根据史密森尼国家自然历史博物馆的观点，加入一个群体并被他人接受对古代人类生存来说至关重要。</p>\n<p>&nbsp;</p>\n<p>进化到今天，人类可能不再需要部落来维系生存，但依旧需要社会中来自他人的陪伴和支持。当我们有意识地反思自己是否无意中对朋友或家人造成伤害时，这能帮助我们及时调整自己的行动来补救这段关系，最终会是值得的。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/40c4229a919941bf419882b39a05386f.png?x-oss-process=image/quality,Q_80\" /></p>\n<h1><strong>02</strong></h1>\n<h1><strong>要如何拥有被讨厌的勇气？</strong></h1>\n<p>&nbsp;</p>\n<p>完美主义往往执着于他人会怎么想，把评价自己的权利完全让渡给他人。但其实不难发现：无论我们怎么妥协，总会有人不满意。与其为了这些外界的声音，而失去做自己的自由，不如为自己改变。</p>\n<p>&nbsp;</p>\n<p>当我们觉察到自己关注外界声音多过内在时，可以采取一些行为来调整成更健康的行为模式。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/430d347e6f80b48d1c200eb75e81fcf9.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p><strong>1. 接受他人对你有意见的事实</strong></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>正如上文所说的，评估他人是社会交往的一部分。我们试图避免他人的看法和判断可能是徒劳的。不<strong>管是好是坏，我们可以提前管理好自己的预期，允许在一定范围内人们有自己的意见。</strong></p>\n<p>&nbsp;</p>\n<p><strong>2. 避免过度解读</strong></p>\n<p>&nbsp;</p>\n<p>根据最新的科学估计，人类平均每天有超过6000个想法，其中很多都是自动产生的。<strong>这种自动化思维往往倾向于负面结论，但这些结论不一定是对的，比如，我不受周围人的欢迎。</strong></p>\n<p>&nbsp;</p>\n<p>因此当我们觉得自己给他人留下了负面印象时，不用急于下结论并试图改变。我们可以检查一下自己的想法，或者等一等，大部分时候我们都可能发现担忧的东西只存在于脑海中。</p>\n<p>&nbsp;</p>\n<p>当我们被他人的评判困扰时，也可以尝试问自己，是谁在表达观点，他的评判是否公正？<strong>和我们脑中的自动化思维一样，他人的话有时也缺少客观性，不要被别人的观点牵着鼻子走。</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/31cb62d9dd4ab62343febf0afe769231.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p><strong>3. 了解自己<br /></strong></p>\n<p>&nbsp;</p>\n<p>正如德尔菲神庙上刻着的箴言一样，我们需要认识你自己。思考一下自己真正喜欢什么，想追求的是什么？试着罗列出几件自己擅长的事情，选择其中一项或几项，让它们在你的生活中占据更大的比重。</p>\n<p>&nbsp;</p>\n<p>通过在这些擅长的事情拓展边际，获得良性反馈，可以建立起一个良好的自我。<strong>当你建立起自己的客观评价体系时，他人的观点也就变得没那么重要了。</strong></p>\n<p>&nbsp;</p>\n<p><strong>4. 做自己的朋友</strong></p>\n<p>&nbsp;</p>\n<p>只要把我们的事情做的足够好，就会得到足够的爱和钦佩。这种想法存在于人们的理想中。更像是一种幻觉。就像阿德勒曾说的那样：&ldquo;要想消除烦恼，只有一个人在宇宙中生存。&rdquo;</p>\n<p>&nbsp;</p>\n<p><strong>也就是说，我们可能永远无法让每个人都喜欢我自己。</strong>更重要的是，对未能达到完美的判断大多是无效的，无助于我们继续做事。因此面对他人的负面看法时，我们不必为此伤心难过。</p>\n<p>&nbsp;</p>\n<p>虽然我们无法控制每个人对你的感觉，但可以减轻自己的担心和焦虑。考虑练习一些正念技巧，比如自我关怀。可以问一问自己，如果是最好的朋友面对这样的困境，我会怎么做？</p>\n<p>&nbsp;</p>\n<p><strong>当我们对待自己和对待朋友一样友善时，许多困扰就会一点点消失。</strong></p>\n<p><strong>&nbsp;</strong></p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/e724dfdea1cf642fdbd1670c3364236e.png?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p><strong>5. 接受专业帮助</strong></p>\n<p>&nbsp;</p>\n<p>你对别人所想的焦虑有时可以通过一点自我意识来克服。但在某些情况下，尤其是那些有潜在创伤或心理健康问题的人，专业帮助可以帮助你找到感情的根源。<strong>给自己一个伸出援手的机会，寻求你需要的照顾，而不是延长你的痛苦。</strong></p>\n<p>&nbsp;</p>\n<p>与治疗师交谈可以帮助您培养应对批评和建立自信的技能，比如认知行为疗法（CBT）。具体来说，致力于建立更有用的思维方式。通过不断练习，我们可以学习新的方法来逃出自动化思维带来的干扰，并释放不必要的压力。</p>\n<p>&nbsp;</p>\n<p><img src=\"https://ossimg.xinli001.com/20220225/20a9f19c46e44835f6c67a15accdb53e.jpeg?x-oss-process=image/quality,Q_80\" /></p>\n<p>&nbsp;</p>\n<p><strong>健康的成长路径应该是关注自我的，而不是过度在意他人的看法。</strong></p>\n<p>&nbsp;</p>\n<p>正如《被讨厌的勇气》一书中提到的。在人际关系中产生的感受是谁的，就是谁的课题，谁就有这件事的选择权和决定权。我们需要把自己和别人的&ldquo;人生课题&rdquo;分开来，为自己的行为和情绪负责，而不是一直活在他人的看法里。</p>\n<p>&nbsp;</p>\n<p><strong>万事开头难，我们很难一次彻底和自己的惯性思维说再见，但我们可以从一些小事开始练习。</strong>比如一次聚餐，一次体育活动，试着不去考虑他人的想法，放飞一下自我。日积月累下来，或许我们能收获一个不一样的自己。</p>\n<p>&nbsp;</p>\n<p><strong>最后祝所有人独立且坚强，一生为自己而活。</strong></p>\n<p>&nbsp;</p>\n<h6>References：</h6>\n<h6>Hayes, S. C. , Villatte, M. , Levin, M. , &amp; Hildebrandt, M. . (2011). Open, aware, and active: contextual approaches as an emerging trend in the behavioral and cognitive therapies. Annual Review of Clinical Psychology, 7(1), 141-168.</h6>\n<h6>Barbanell,L. (2014). Compulsive pleasing is deceptive and dangerous. The NationalPsychologist. Retrieved June 1, 2017.</h6>\n<h6>Lancer, D. (2015). Are you a people-pleaser?. PsychCentral. Retrieved June 1, 2017.</h6>\n<h6>Medical Review：Mindfront Psychotherapist&nbsp;&nbsp;Sophie Deng</h6>\n<h6>&nbsp;</h6>\n<h6>作者简介：Mindfront，本文转载自微信公众号：曼朗mindfront （ID：mindfront），曼朗医疗（mindfront）是全球领先的精神心理医疗集团，在澳洲拥有18家提供精神心理服务的专科和综合医院，2019开始布局中国，在核心城市开设精神心理医疗机构和发展互联网医疗服务，提供整合循证的精神心理专业服务和优质医疗体验。</h6>\n<h6>&nbsp;</h6>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/9410fa298b8746f7b498d86fb7ce3bf7file.png', 0, 0, 'Normal', 0, '2022-03-15 20:11:57', '2022-03-15 20:12:41');
INSERT INTO `edu_article` VALUES ('1503707200537800705', '1502246606873903105', '接纳自我', '自我认同与价值感', '倾听自我', '如何摆脱内卷，活出真实的自我', '自我察觉', '<div class=\"yxl-editor\">\n<div class=\"yxl-editor-article \">\n<h6>作者：Susan Kuang</h6>\n<h6>来源：微信公众号：SusanKuang（ID：susankuang2014）</h6>\n<p>&nbsp;</p>\n<p>自从去年开启了人生教练这一新身份之后，我几乎每天都会跟不同的小伙伴进行深度交流，倾听他们问题和困惑，帮助他们实现想要的改变。</p>\n<p>&nbsp;</p>\n<p>表面上看，大家的问题和困惑各不相同，但究其根本，我发现，大家内心真正渴望的其实都一样，就是一种真实、自信、积极主动，以及充满热情与活力的生命状态。</p>\n<p>&nbsp;</p>\n<p>比方说，我最常遇到的问题就是，如何找到自己真正喜欢做的事情，如何发现自己的优势，找到自己擅长做的事情。而当我问对方，找到了真正喜欢、自己擅长的事情之后会有什么不一样时，他们的答案往往都是，会更投入，更有热情、更自信。</p>\n<p>&nbsp;</p>\n<p>大家总以为，这个世界上存在着某件事情，只要找到了这件事情，就会自动拥有想要的自信、热情、有活力的状态，但事实并非如此，因为问题的关键并不在于所做的事情，而在于所处的环境&mdash;&mdash;<strong>我们所处的是一个不断滋养我们，还是不断消耗我们的环境</strong>。</p>\n<p>&nbsp;</p>\n<p>如果我们去观察身边那些特别小的孩子，我们会发现，他们对周围的世界是如此地好奇，他们总是乐此不疲地沉浸在各种有趣的探索和挑战中。<strong>这其实就是生命原本的样子：充满活力与好奇心，喜欢探索和挑战。</strong></p>\n<p>&nbsp;</p>\n<p>可为什么等到孩子长大一点之后，这种活力与好奇心就逐渐消失了呢？那是因为生命本身很脆弱，它的健康与蓬勃发展依赖于环境的支持和持续的心理滋养。</p>\n<p>&nbsp;</p>\n<p>如果缺乏支持性的环境，内心得不到持续的滋养，就会导致各种不良适应的后果，比如慢慢失去活力，变得消极被动，甚至变得焦虑和抑郁。</p>\n<p>&nbsp;</p>\n<p>所以，在我看来，自我改变和成长的关键不并在于某个具体目标的达成，而在于能否为自己创造出一个支持性的内在环境，然后<strong>用一种全新的方式去支持自我成长与发展，并在这个过程中慢慢找回失去的活力，活出真实的自我</strong>。这才是我们最需要的改变。</p>\n<p>&nbsp;</p>\n<p>做人生教练的这段日子，我对于人的自我发展有了一些新的领悟，也有了更为系统和深入的思考。今天这篇文章就是对近期思考的一次总结。文章有些长，但应该能够从根源上帮你解答许多有关人生和自我发展的困惑。</p>\n<p>&nbsp;</p>\n<h1><strong>01</strong></h1>\n<h1><strong>人的三大基本心理需求</strong></h1>\n<p>&nbsp;</p>\n<p>上面我们提到了一个非常重要的概念&mdash;&mdash;支持性的环境。对此你可能会感到疑惑，什么样的环境才称得上是支持性的，能够给予我们心理滋养的环境呢？</p>\n<p><br />要解释这个问题，我就得先带你了解一下当代最有影响力的动机理论&mdash;&mdash;自我决定论。这个理论认为，人有三个基本心理需求，它们分别是<strong>自主、胜任和联结</strong>。</p>\n<p><br />联结的需求很容易理解。在我们的演化历史中，人类是以部落的形式生存下来的，镌刻在我们基因中的最深层的需求之一，就是与他人的联结。</p>\n<p><br /><strong>人类天生渴望联结，渴望爱与被爱，需要归属感</strong>。因为我们在很大程度上是通过人际关系来获得存在感、建立身份认同、定义自己的，所以我们需要找到同类群体，他们能够与我们的经历和感受产生共鸣，给予我们鼓励和支持，与我们一同分享快乐。</p>\n<p>&nbsp;</p>\n<p>胜任的需求，指的是这样一种内在需求：<strong>我们渴望在与环境的互动过程中感觉到自己是有能力的和高效的</strong>。胜任感涉及三个要素：目的性的、目标导向的活动；目标的达成；取得成就的喜悦。</p>\n<p>&nbsp;</p>\n<p>从出生后的几个月起，人类就是有目的的。即使婴儿也会有意识地采取行动，比如他们会伸手去够自己想要的东西，或试图翻身。当他们成功时，即达成自己的目标时，他们会有明显的愉快表现。他们会面露微笑，发出开心的声音。看上去他们感觉自己很棒。</p>\n<p>&nbsp;</p>\n<p>正是因为有胜任的需求，我们才会在这一生中不断寻求目标和挑战。当我们为重要的事物付出长久而艰辛的努力，并最终达成时，那种自豪感和愉悦感会让我们终生难忘。</p>\n<p>&nbsp;</p>\n<p>当然，努力达成目标不意味着要实现某个远大的愿望，我们只需要接受有意义的个人挑战，并全力以赴，就能感到自己是胜任的。</p>\n<p>&nbsp;</p>\n<p>除了联结和胜任之外，人类还有一种与生俱来的内在需求，那就是对自主的需求，也就是<strong>我们需要感到我们的行为是自己选择的，而不是由某些外部来源强加的</strong>，是因为感兴趣，或者感到有意义，而不是因为必须做、应该做，或者为了满足别人的期待。</p>\n<p>&nbsp;</p>\n<p>任何有损这种自主感的事情，也就是让我们感觉到被控制的事情，都会削弱我们的内在动机，我们在做这件事情的过程中就不会有发自内心的意愿，也不会带着兴趣和决心投入其中，甚至会因为抵触而变得消极和被动。</p>\n<p><strong>&nbsp;</strong></p>\n<p>自主对于心理健康十分重要，因为它允许人们体验自己的真实感受，按照真实的内在自我行事，做自己的主人。<strong>如果没有这种自我决定感，我们就会感觉不到真实的自我</strong>。在这种情况下，生命的本质是缺失的。</p>\n<p>&nbsp;</p>\n<p>了解了这三个基本心理需求之后，我们再回到一开始有关支持性环境的问题。这个时候，答案就变得很简单了。所谓支持性、滋养型的环境，指的就是能够让联结、胜任和自主这些内在需求得到满足的环境。</p>\n<p>&nbsp;</p>\n<h1><strong>02</strong></h1>\n<h1><strong>以爱为名义实现控制</strong></h1>\n<p><strong>&nbsp;</strong></p>\n<p>我们人类其实是一种天生就倾向于不断奋斗并蓬勃发展的有机体，只要能够从环境中得到持续的支持与滋养，这种积极向上的天性就会展现出来。</p>\n<p>&nbsp;</p>\n<p>举例来说，一个孩子来到世上，最重要的心理需求就是与父母的联结。如果这个需求得到了满足，也就是从父母那感受到了无条件的爱，那么他就会形成&ldquo;自己是值得爱的，是可爱&rdquo;的核心信念。</p>\n<p><br />这样的信念会让他有足够的安全感，无需担心自己做错了什么之后父母就不爱自己了。在这种情况下，他与生俱来的好奇心，以及想要探索世界的本能就会自然发展出来。他便会自发地去尝试各种自己感到有兴趣的事情。</p>\n<p><br />这个过程中即便遭遇了挫败，他也不会把这些挫败看成是对自我的一种威胁，而是会执着于自己的目标，努力解决问题。</p>\n<p><br />每一次的成功突破，都会给他带来自豪感。慢慢地，他会觉得自己是有能力的，能够应对挑战。于是，他的胜任感就发展出来了。</p>\n<p><br />这种胜任感又会促使他寻求更多新挑战，他的自主性会增强，能力也会得到不断成长，他甚至还会因此而得到周围人的认可和欣赏。这将成为他自我认同感的重要来源。</p>\n<p><br />这就是一个典型的健康的自我发展过程。当我们成长的环境支持自主，提供了最理想的挑战、并在我们探索自己内在和外在环境的过程中给予无条件的接纳与爱时，真正的自我就会得到最理想的发展。但是，假如这些需求得不到满足，这个过程就会受阻。</p>\n<p><br />然而，在现实生活中，我们却很难找到这样的环境。为什么？原因很简单，因为控制，而非无条件的爱，才是人的本性。<strong>有条件的接纳与爱恰恰是我们实现控制的一种重要手段。</strong></p>\n<p><strong><br /></strong>人类似乎天生就非常擅长利用他人对联结、对爱的需求来实现对他人的控制，让他人按照自己的意愿行事，尤其是当自己处于优势地位的时候。</p>\n<p><br />这就是为什么很少有人能从父母那里感受到无条件的接纳与爱。其实，并不是父母真的不爱我们，而是他们会不自觉地利用有条件的爱来对我们进行管教，很多时候他们自己可能都意识不到。</p>\n<p><br />在成长过程中，父母的管教的确是很必要的，因为父母需要协助孩子完成社会化的过程：向他们传递社会价值观和道德观，让他们接受社会规则，并督促他们好好学习。这些对于孩子长大之后能够融入社会，在社会上立足是非常重要的。</p>\n<p><br />但除了这些必要的管教和约束之外，父母往往还会对孩子有着很多自己的期望和要求，甚至还会把自己的个人愿望和梦想寄托在孩子身上。</p>\n<p><br />对于父母来说，控制孩子最好的方式就是利用有条件的爱，比如威胁孩子，如果不听话就会收回对他们的爱；当他们做得不好，偏离自己的意愿时，通过批评、责骂，甚至是贬低的方式进行惩罚；拿他们与其他小孩进行比较，以此表达他们的期望和价值取向。</p>\n<p><br />这一招通常很有用，因为对于小孩来说，没有什么比失去父母的爱更可怕的了。而且<strong>小孩对于父母的情绪非常敏感</strong>，他们会凭直觉逐渐知道父母想要的是什么，自己需要做什么才能让父母开心，才能得到父母的爱并避免被责备。</p>\n<p><br />为了让父母开心，为了得到父母的爱与肯定，他们就会不自觉地朝父母所期待的方向发展。这样一来，他们就失去了跟随兴趣而去自由探索的机会，自主性也就无法发展出来。</p>\n<p><br />在很长一段时间，他们可能会以为父母想要的就是自己想要的，但总有一天他们会醒悟过来，他们会发现这并不是真实的自己，因为他们感受不到内心的快乐，感受不到生命的活力。</p>\n<p><br />但真实的自己又在哪里？真实的自己想要的又是什么？他们已经不知道了。其实，不知道是正常的，因为真正的自我并没有得到发展，怎么可能会有答案呢？</p>\n<p><br />这就是目前很多人所处的困境：在努力满足外在期待的过程中，与真实的自我失去了联结，结果变得越来越不自信，越来越没有热情和活力。</p>\n<p>&nbsp;</p>\n<h1><strong>03</strong></h1>\n<h1><strong>内卷背后的畸形价值观</strong></h1>\n<p>&nbsp;</p>\n<p>在我们的成长过程中，有一件事情是无法避免，那就是父母一定会不自觉地通过有条件的爱这种隐形的控制方式把自己的价值观，也就是自己对于什么是成功、什么是失败的看法传递给我们，并影响着我们的自我发展。</p>\n<p>&nbsp;</p>\n<p><strong>价值观对一个人的影响是极其深远的</strong>，因为价值观是我们衡量一切事物的基础，而价值观本身是存在着优劣之分的。</p>\n<p>&nbsp;</p>\n<p>如果我们所看重的东西是无益的，或所认为的成功或失败是不恰当的，那么建立在这些价值观基础上的一切，包括思想、情感以及日常感受都将出现异常。</p>\n<p>&nbsp;</p>\n<p>什么样的价值观才算得上良好的价值观呢？</p>\n<p>&nbsp;</p>\n<p>研究人员曾经对6种类型的人生愿望进行过研究，他们想知道不同的人生愿望会对人的心理健康产生怎样的影响。</p>\n<p>&nbsp;</p>\n<p>这6种愿望中有3种是我们所说的外部愿望，即有钱、有名、美貌。之所以叫做外部愿望，是因为<strong>这些愿望的达成都是为了给他人看的，是为了获得他人的关注和羡慕</strong>。如果没有人关注，没有人羡慕，这些愿望也就失去了意义。</p>\n<p>&nbsp;</p>\n<p>另外3种属于内在愿望：拥有令人满意的人际关系、为社会做出贡献、实现个人成长。不同于外部愿望，这些愿望凭借它们自己的力量使人感到满足，不管它们是否导向其他目的，人们都会从这3种内在结果中感到巨大的满足感。</p>\n<p>&nbsp;</p>\n<p>研究结果表明，相比内在愿望，一个人如果对金钱、名声、美貌这3种外在愿望中的任何一种渴望更强烈，那么，这个人很有可能心理健康状况较差。相反，对任何一个内在目标的强烈渴望，都与幸福感呈正相关。</p>\n<p>&nbsp;</p>\n<p>为什么过于在乎外在目标会导致较差的心理健康状况？</p>\n<p>&nbsp;</p>\n<p>一个很重要的原因在于，这些目标并不是自己可以掌控的，不是我们想实现就能实现的。这种不确定性与掌控感的缺失就会让人感到很焦虑。</p>\n<p>&nbsp;</p>\n<p>即便有些人能力很强，认为自己有着很好的机会实现那些外在目标，他们的心理健康状况也不会很好，因为他们依然会因为不确定性而长期处于隐性的焦虑之中。</p>\n<p>&nbsp;</p>\n<p>更为糟糕的情况是，本身非常看重经济成功之类的外在目标，但又不相信自己可以实现。这就会让人变得抑郁。</p>\n<p>&nbsp;</p>\n<p>此外，<strong>这些外部目标往往强调与他人的竞争和比较</strong>，需要以牺牲自主及联结为代价。这就会使得我们一些重要的内在需求无法得到满足。</p>\n<p>&nbsp;</p>\n<p>其实，我们大多数人都心怀这6种人生愿望。对外在目标有渴望本身并没有问题，希望有足够的经济实力，有更舒适的生活都是非常合理的愿望，<strong>关键在于能否在外在和内在目标之间保持平衡，也就是不过分追求外在目标。</strong></p>\n<p>&nbsp;</p>\n<p>保持平衡的最佳的方式，就是尝试把外在目标与内在目标整合起来。比方说，假如我们能够把对金钱的重视，与能够过上充实和平衡的生活，有机会获得更多美好的人生体验，更好地照顾家人，以及实现更大的社会价值等联系起来，那么对于外在目标的追求就不会给心理健康带来任何影响。</p>\n<p>&nbsp;</p>\n<p>如今，整个社会内卷现象十分严重，很多人都活在焦虑和压力之中，甚至出现了各种各样的心理问题，核心原因就在于，<strong>价值观体系出现了严重的失衡。</strong>大家都过分看重外在目标，所有人都在努力让自己看起来更&ldquo;成功&rdquo;，或者至少让自己看上去不像个&ldquo;失败者&rdquo;。</p>\n<p>&nbsp;</p>\n<p>这种价值观的严重失衡，一方面与父母的教养有关，因为很多父母本身的价值观就有问题，他们很在意别人如何看自己，这就会使得他们过于看重外在目标，并且把这种价值观，把他们自身的不安和焦虑传递给孩子。</p>\n<p>&nbsp;</p>\n<p>另一方面与目前的大环境有关。我们已经进入到了一个极端物质主义的时代。<strong>整个社会对于金钱、地位以及美貌的崇拜已经到了史无前例、甚至是扭曲的地步</strong>。大家对于成功的理解也变得十分肤浅，就是有钱有名，年轻貌美，被人羡慕。</p>\n<p>&nbsp;</p>\n<p>一个人如果在成长过程中，没有建立起坚定的自我意识，没有形成良好的价值观，那么进入社会之后，就会很容易被当下主流的物质主义价值观所影响，不自觉地加入到各种内卷的战斗中。</p>\n<p>&nbsp;</p>\n<h1><strong>04</strong></h1>\n<h1><strong>自我卷入与有条件的自尊</strong></h1>\n<p>&nbsp;</p>\n<p>将有条件的接纳与爱作为一种控制手段，不仅会导致我们的自主性无法发展出来，还会带来另一个可悲的后果，那就是，<strong>它会教我们以有条件的方式尊重自己</strong>。</p>\n<p>&nbsp;</p>\n<p>就像我们曾经为了得到父母的爱与认可而必须满足外界的要求一样，现在，我们也学会了利用有条件的接纳和爱来控制自己。只有当我们按照某种特定的方式行事，或者达成了期待的结果时，我们才会认可和接纳自己，<strong>否则我们就会不断指责、攻击和贬低自己</strong>。</p>\n<p>&nbsp;</p>\n<p>自我卷入（ego involvement）是心理学家用来定义人们感觉自身价值依赖于特定结果的一个术语。<strong>只要我们觉得自己必须怎么怎么样，否则自己就不够好时，就是在自我卷入</strong>。当自我卷人时，我们关注的是自己在别人眼中的形象，所以总在评判自己。</p>\n<p>&nbsp;</p>\n<p>其实，很多人之所以会有过度强烈的外在愿望，是因为他们在根本价值感方面缺乏安全感，因此他们需要通过这些外在目标的达成来获得价值感。</p>\n<p>&nbsp;</p>\n<p>这种安全感的缺乏与年少时所经历的有条件的爱与认可有关，<strong>在这过程中，他们慢慢学会了把外在标准当作判断他们价值的基础</strong>&mdash;&mdash;最初是他们的父母认为必要的东西，然后是社会或含蓄或明确地提倡的东西。</p>\n<p>&nbsp;</p>\n<p>当然，即便真的达成了某个想要的外在目标，并因此而获得了良好的自我感觉，这种感觉也将是短暂的，不是真实的，它往往会形成自己比他人更好的感觉，而不是觉得自己和别人一样好和有价值。这不是真正的自尊。</p>\n<p>&nbsp;</p>\n<p>自我卷入和有条件的自尊还会导致一个问题，那就是行动力变弱，很难将一件事情持久地坚持下去。</p>\n<p>&nbsp;</p>\n<p>当我们自我卷入某件事情的时候，我们往往是想要通过做好这件事情、通过达成目标来获得自我价值感，而不是因为真的对这件事情有兴趣，或者出于某个重要的个人追求。</p>\n<p>&nbsp;</p>\n<p>在这种情况下，我们就会缺乏内在动机，而是需要通过给自己施压的方式强迫自己行动。</p>\n<p>&nbsp;</p>\n<p>如果这件事情没有那么难还好，但是如果这件事情本身有挑战，存在着失败、做不好的风险，那么行动就会变得很困难，因为<strong>自我卷入会让我们把失败和做不好解读成对自己的一种否定</strong>，为了逃避这种痛苦，我们就会迟迟不愿意行动。</p>\n<p>&nbsp;</p>\n<p>这个时候，我们可能又会对自己的拖延行为进行评判，认为自己很糟糕，这种自我贬低又会进一步降低行动力。</p>\n<p>&nbsp;</p>\n<p>就算最后出于压力真的行动起来了，在过程中免不了会遇到挫折，比如没有按计划行动、结果不理想等等。只要行为结果与期待的不相符合，我们就又会陷入自责、自我否定和自我贬低。</p>\n<p>&nbsp;</p>\n<p>这种自我评判和自我否定的习惯不仅会导致行动力下降，还会使得我们很难体会到成就感和胜任感，能力也无法得到很好的提升，在面对挑战时，就会对自己没有信心，不相信自己可以做好，于是就会更加担心。逐渐形成恶性循环。</p>\n<p>&nbsp;</p>\n<p>总而言之，只要我们对自己的接纳与尊重是有条件的，这种自我卷入就是不可避免的。自我卷入加上不良价值观，就会让我们永远生活在害怕自己不够好，害怕自己不不如他人，害怕自己是个失败者的焦虑和恐惧中。</p>\n<p>&nbsp;</p>\n<h1><strong>05</strong></h1>\n<h1><strong>如何找回失去的自我<br /></strong></h1>\n<p>&nbsp;</p>\n<p>读到这里，你是否对自己的问题有了更为深入的认识和理解？</p>\n<p>&nbsp;</p>\n<p>不管你想要解决的问题是提升行动力，还是想要变得更自信，或者找到自己真正喜欢和有热情的事情，它都不是一个简单问题。</p>\n<p>&nbsp;</p>\n<p>这些问题其实全都只是表面现象，背后有着更深层次的原因。想要真的实现改变，想要活出真实的自我，拥有蓬勃发展的人生，我们就必须回到根源去解决问题。</p>\n<p>&nbsp;</p>\n<p>如何才能实现根本性的改变？关键还得像我在文章一开始所说的那样，从内在环境的改造开始，先为自己创造一个支持性，能够给予我们心理滋养的内在环境。</p>\n<p>&nbsp;</p>\n<p>所谓的内在环境，指的其实就是<strong>我们与自己的内在对话</strong>。不论你是否有意识到，我们每天都在内心与自己进行着大量的对话，这些内在对话构成了我们的内在环境。</p>\n<p>&nbsp;</p>\n<p>假如你仔细去听这些对话，你就会惊讶地发现，<strong>我们与自己的对话方式和父母曾经与我们的对话方式完全一样</strong>，都是在用一种控制式的、有条件的爱与尊重的方式来实现管控：总拿一些外部标准来评判和要求自己，达不到要求就进行贬低和责骂。</p>\n<p>&nbsp;</p>\n<p>只要这种内在环境不发生改变，那么不管我们如何努力实现外在目标，<strong>游戏本身都是换汤不换药</strong>：依然还是在努力满足外部期待，通过努力成为一个&ldquo;更好的自己&rdquo;来获得认可或者赢得羡慕，以此证明自己是有价值的，是值得被爱的。</p>\n<p>&nbsp;</p>\n<p>那么，怎样才能改变这种内在环境呢？最好的方式就是<strong>自我养育（Self-parenting）</strong>。</p>\n<p>&nbsp;</p>\n<p>自我养育这个概念是我从美国实战派心理学家约翰&middot;波拉德那里学来的。我第一次听到这个说法时，就被它深深地打动和吸引了，因为它能够对我一直在做的各种事情进行特别好的概括。</p>\n<p>&nbsp;</p>\n<p>所谓的自我养育，指的是<strong>在我们内心塑造一个理想的内在父母，重新养育自己，弥补曾经的缺失，帮助内在自我实现健康的发展</strong>。</p>\n<p>&nbsp;</p>\n<p>这意味着，我们需要改变过去从父母那里习得的那种控制、评判和打击的自我对待方式，开始学习无条件地爱自己，以支持自主的方式来引导自我发展，帮助自己重塑价值观，学会为自己的人生负责，鼓励自己克服困难和挑战，慢慢培养出胜任感和自信心。</p>\n<p>&nbsp;</p>\n<p>毫无疑问，这绝不是一件容易的事情。成功的自我养育，一方面需要我们懂得一些相关的心理学甚至是脑科学知识，这能帮助我们更好地理解自己，理解客观规律和方法；另一方面还需要我们不断进行实践，持续练习，直至形成新的心智习惯。</p>\n<p>&nbsp;</p>\n<p>但这些努力都是必须且值得的，因为只有当这些内部问题得到解决之后，我们的状态才会发生根本性的改变，才能回到健康的心理状态，这是蓬勃发展的前提。状态改变之后，各种外部问题也会变得更加容易解决了，有些问题甚至会自己消失。</p>\n<p>&nbsp;</p>\n<p>而且，当我们学会了用友善、理解和尊重的方式与自己沟通之后，我们的人际关系也会越来越好，因为我们也会懂得用同样的方式与他人沟通。这也能帮助我们成为更好的父母，避免下一代重蹈覆辙。</p>\n<p>&nbsp;</p>\n<p><strong>写在最后：</strong></p>\n<p>&nbsp;</p>\n<p>由于篇幅有限，无法在这篇文章对自我养育进行更为深入的讲解，我将在下篇文章跟大家继续探讨这个话题，分享我对自我养育的理解。之后我也会同步推出&ldquo;自我养育&rdquo;计划，带领大家进行系统学习，实现根本性的自我改变。敬请期待～</p>\n<p>&nbsp;</p>\n<h6>作者简介：Susan Kuang，畅销书作者、心理学研究者、CTB人生教练，专注于认知和情绪调节、目标管理，以及高效能思维和行为习惯，希望帮更多人建立积极乐观的人生态度，并因此蓬勃绽放。本文转载自微信公众号：SusanKuang（ID：susankuang2014）。</h6>\n<p>&nbsp;</p>\n</div>\n</div>\n<div id=\"copyright\">\n<p>用户发表的全部原创内容（包括但不仅限于回答、文章和评论），著作权均归用户本人所有。独家文章转载，请联系邮箱：<a href=\"mailto:content@xinli001.com\">content@xinli001.com</a></p>\n</div>', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/7629e03fd69648c7999a7d6292e02e78file.png', 0, 0, 'Normal', 0, '2022-03-15 20:18:29', '2022-03-15 20:18:37');

-- ----------------------------
-- Table structure for edu_article_classify
-- ----------------------------
DROP TABLE IF EXISTS `edu_article_classify`;
CREATE TABLE `edu_article_classify`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美文分类唯一id',
  `classify_title` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类标题名称',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_article_classify
-- ----------------------------
INSERT INTO `edu_article_classify` VALUES ('1231312414', '社会热点', 0, '2021-08-16 16:50:52', '2021-08-16 16:50:54');

-- ----------------------------
-- Table structure for edu_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_article_comment`;
CREATE TABLE `edu_article_comment`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '每条评论唯一id',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `article_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属美文id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的唯一id',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_article_comment
-- ----------------------------
INSERT INTO `edu_article_comment` VALUES ('1447179887996608514', '很多时候生活中的一件很小的事情，一条不起眼的信息，一个不经意间的想法，就让自己看到了理想中的自己，离现实中这个无能的自己如此遥远，所以才有种几乎没有不被觉察到的不爽感。', '1427253476267683842', '1439828722283794435', 0, '2021-10-10 20:39:07', '2021-10-10 20:39:07');
INSERT INTO `edu_article_comment` VALUES ('1447180082071248897', '自由书写的力量，让一切都美好！', '1427253476267683842', '1439828722283794436', 0, '2021-10-10 20:39:54', '2021-10-10 20:39:54');
INSERT INTO `edu_article_comment` VALUES ('1447180441426632705', '虐待，旨在让受害者变得无力。所以当你重获力量时，就能扭转局势，获得成功。', '1427253476267683842', '1439828722283794437', 0, '2021-10-10 20:41:19', '2021-10-10 20:41:19');
INSERT INTO `edu_article_comment` VALUES ('1451534090926907394', '非常有用，值得信赖', '1427253476267683842', '1439828722283794433', 0, '2021-10-22 21:01:10', '2021-10-22 21:01:10');
INSERT INTO `edu_article_comment` VALUES ('1451892228063522818', '不要被表面的话语意思所蒙蔽和影响自己的情绪与判断。\n透过话语看到背后深藏的核心情绪是什么。', '1427253476267683842', '1439828722283794433', 0, '2021-10-23 20:44:17', '2021-10-23 20:44:17');
INSERT INTO `edu_article_comment` VALUES ('1457325909821399042', '12313123', '1439196851220828161', '1439828722283794433', 0, '2021-11-07 20:35:47', '2021-11-07 20:35:47');
INSERT INTO `edu_article_comment` VALUES ('1457325913864708097', '12313123', '1439196851220828161', '1439828722283794433', 0, '2021-11-07 20:35:48', '2021-11-07 20:35:48');
INSERT INTO `edu_article_comment` VALUES ('1503269567823093762', '你00000', '1439196851220828161', '1439828722283794433', 0, '2022-03-14 15:19:29', '2022-03-14 15:19:29');
INSERT INTO `edu_article_comment` VALUES ('1503269571501498369', '你00000', '1439196851220828161', '1439828722283794433', 0, '2022-03-14 15:19:30', '2022-03-14 15:19:30');
INSERT INTO `edu_article_comment` VALUES ('1503351951906086914', '写的不错', '1439196851220828161', '1439828722283794433', 0, '2022-03-14 20:46:51', '2022-03-14 20:46:51');
INSERT INTO `edu_article_comment` VALUES ('1503736988665147393', '写的不错', '1503707200537800705', '1502211201646481410', 0, '2022-03-15 22:16:51', '2022-03-15 22:16:51');
INSERT INTO `edu_article_comment` VALUES ('1503742202507956225', '写的不错呀', '1503698435725975554', '1502211201646481410', 0, '2022-03-15 22:37:34', '2022-03-15 22:37:34');
INSERT INTO `edu_article_comment` VALUES ('1503744814812831746', '继续加油', '1503707200537800705', '1502211201646481410', 0, '2022-03-15 22:47:57', '2022-03-15 22:47:57');
INSERT INTO `edu_article_comment` VALUES ('1506459159294406658', '你好', '1503707200537800705', '1439828722283794433', 0, '2022-03-23 10:33:47', '2022-03-23 10:33:47');

-- ----------------------------
-- Table structure for edu_counselor
-- ----------------------------
DROP TABLE IF EXISTS `edu_counselor`;
CREATE TABLE `edu_counselor`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询师ID',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询师姓名',
  `sex` int(0) NOT NULL DEFAULT 1 COMMENT '性别 1 男， 2 女',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询师简介',
  `career` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '咨询师资历',
  `level` int(0) NOT NULL COMMENT '头衔： 1.一级咨询师 2.二级咨询师 3.三级咨询师',
  `one_meth` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `two_meth` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `three_meth` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_counselor
-- ----------------------------
INSERT INTO `edu_counselor` VALUES ('1238433', '1502211201646481410', '18582416620', '李晴', 2, 21, '爱你所爱，行你所行', '12312', '无', 1, '个人成长', '恋爱心理', '情绪管理', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/19/3088f11ae48a4747bfdce05ade9ad857file.png', 4, 0, '2021-07-10 22:29:59', '2022-03-23 15:47:58');
INSERT INTO `edu_counselor` VALUES ('1416762022814547970', '1502211555981283330', '18582416621', '王梅', 1, 10, '心碎', '12123123', '123', 1, '个人情感', '抑郁减压', '心情疏导', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/19/8dc11b375e9848c7afbae3449f717864file.png', 0, 0, '2021-07-18 22:09:23', '2022-03-23 15:30:03');
INSERT INTO `edu_counselor` VALUES ('1423518629875417089', '1502211653154918401', '18582416622', '李九', 2, NULL, NULL, '123123123', '123123123', 1, '婚姻家庭', '亲子教育', '恋爱经历', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/19/418788f843fc4fe4a34adf67f16b3788file.png', 0, 0, '2021-08-06 13:37:44', '2021-09-19 16:04:11');
INSERT INTO `edu_counselor` VALUES ('1423849443171561474', '1502211793588604930', '18582416623', '艾希', 2, NULL, NULL, '我的缺点', '驱蚊器', 1, '人际关系', '心理健康', '个人成长', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/14/9e026150fe68407ab06e0c5c429cd6f0file.png', 1, 0, '2021-08-07 11:32:16', '2022-03-14 16:34:01');
INSERT INTO `edu_counselor` VALUES ('1502246617544196098', '1502246606873903105', '18582416624', '天云', 2, NULL, NULL, '123123123', '12312312', 1, '心理疏导', '家庭关系', '减压放松', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/11/4d0bb68512f446c5b1baeb759f9d9f17file.png', 0, 0, '2022-03-11 19:34:39', '2022-03-11 19:34:39');

-- ----------------------------
-- Table structure for edu_listener
-- ----------------------------
DROP TABLE IF EXISTS `edu_listener`;
CREATE TABLE `edu_listener`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id号',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '倾听师姓名',
  `sex` int(0) NOT NULL DEFAULT 1 COMMENT '性别 1 男， 2 女',
  `intro` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '倾听师简介',
  `career` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '倾听师资历',
  `level` int(0) NOT NULL COMMENT '头衔： 1.一级倾听师 2.二级倾听师 3.三级倾听师',
  `sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '倾听师签名',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `one_classify` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '擅长方向1',
  `two_classify` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '擅长方向2',
  `total_duration` int(0) NULL DEFAULT 0 COMMENT '倾听总时长',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_listener
-- ----------------------------
INSERT INTO `edu_listener` VALUES ('1442849389802549249', '15892701910', '15892701920', '艾心', 2, '听从你心，无问西东', '听从你心，无问西东', 2, '听从你心，无问西东', NULL, '亲子教育', '职场竞争', 100, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/28/e9735dec6e4649ad88df5dd3412bdf18file.png', 0, '2021-09-28 21:51:16', '2021-09-28 22:49:43');
INSERT INTO `edu_listener` VALUES ('1442859651955761153', '15892701911', '15892701921', '周晴', 2, '理解是⼈与⼈的桥梁。通过真诚、关注、理解之桥，看见你，温暖你，帮你更深地与⾃⼰联结。', '理解是⼈与⼈的桥梁。通过真诚、关注、理解之桥，看见你，温暖你，帮你更深地与⾃⼰联结。', 1, '理解是⼈与⼈的桥梁。通过真诚、关注、理解之桥，看见你，温暖你', NULL, '亲子教育', '家庭关系', 271, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/28/109bae509e824f20875011ac8d5f94d1file.png', 0, '2021-09-28 21:51:16', '2021-09-28 22:52:21');
INSERT INTO `edu_listener` VALUES ('1442860900289683458', '15892701912', '15892701922', '赵杰', 2, '听从你心，无问西东', '听从你心，无问西东', 1, '没有人是一座孤岛，愿与你产生温暖的链接。', NULL, '亲子教育', '心理教育', 980, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/28/e1aa2314fdcc439c8d31c6fda22e3545file.png', 0, '2021-09-28 21:51:16', '2021-09-28 22:52:35');
INSERT INTO `edu_listener` VALUES ('1442861755114004481', '15892701913', '15892701923', '杨晨', 2, '听从你心，无问西东', '听从你心，无问西东', 3, '用心倾听，用爱抱持，让感觉流动', NULL, '亲子教育', '个人成长', 80, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/28/85f748f6bde64a37b5b00ff78d2e29fafile.png', 0, '2021-09-28 21:51:16', '2021-09-28 22:54:50');
INSERT INTO `edu_listener` VALUES ('1442862400495755265', '15892701914', '15892701924', '王夕', 2, '听从你心，无问西东', '听从你心，无问西东', 3, '你自有方向，我只愿为你扬起帆', NULL, '职场竞争', '婚恋', 92, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/28/686bbca90f6342b09fa0d59a1b4a6a91file.png', 0, '2021-09-28 21:51:16', '2021-09-28 22:53:38');
INSERT INTO `edu_listener` VALUES ('1502274678469750786', '15892701915', '18582416627', '沐辰', 2, '123123123', '123123', 1, '与心灵相约，与健康同行', NULL, '心理疏导', '自我疗愈', 0, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/14/5e20d18573c84de38191792851f1328dfile.png', 0, '2022-03-11 21:26:09', '2022-03-14 16:35:10');

-- ----------------------------
-- Table structure for edu_music
-- ----------------------------
DROP TABLE IF EXISTS `edu_music`;
CREATE TABLE `edu_music`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '忆心Music记录唯一id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传用户的id',
  `music_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '音频文件对于url',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音频对应封面',
  `music_mood` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '音频对应心情',
  `collect_count` int(0) NOT NULL DEFAULT 0 COMMENT '音频收藏量',
  `view_count` int(0) NOT NULL DEFAULT 0 COMMENT '音频访问量',
  `comm_count` int(0) NOT NULL DEFAULT 0 COMMENT '音频评论量',
  `sign` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '音频个性签名',
  `title` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '音频标题',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Draft' COMMENT '发布状态',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_music
-- ----------------------------
INSERT INTO `edu_music` VALUES ('1444208758042406913', '1502211201646481410', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/d99df82714894f08bb9a18c258731b35Alec Benjamin - Let Me Down Slowly.mp3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/316de4ea0907483aa6de4ea0446b4c5afile.png', '悲伤', 1206, 0, 0, '决定两个人能否在一起的因素有很多。', 'let me down', 'Normal', 0, '2021-10-02 15:52:55', '2022-03-26 23:00:07');
INSERT INTO `edu_music` VALUES ('1444260851591700482', '1502211555981283330', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/9d1ebc13e99547c2b9751bd9a9e2e24b周杰伦 - 青花瓷 (Remix).mp3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/cb2530b20715413f88658dddfb70410efile.png', '减压', 20, 0, 0, '天青色等烟雨，而我在等你', '青花瓷', 'Normal', 0, '2021-10-02 19:19:55', '2021-10-02 19:19:55');
INSERT INTO `edu_music` VALUES ('1444261494213599234', '1502211653154918401', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/84e26cdce9664469a872db370f42b0feigoo2u - FADE (纯乐版).mp3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/87dd93cc781f487aa66a2c045f85dbcefile.png', '减压', 50, 0, 0, '你爱我像谁，谁像我爱你', 'Fade', 'Normal', 0, '2021-10-02 19:22:28', '2021-10-02 19:22:28');
INSERT INTO `edu_music` VALUES ('1444262847933603841', '1502211793588604930', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/cbf06a369cba45bfad50242a56d4e668音乐黑市 - 【3D环绕】《烟袋斜街》 (原唱_kiss gun).mp3?versionId=CAEQFxiBgIDR6ZGX4hciIDljOTVmNDdlOGEzNTRhYTdhMjI1NjUxODYxMzVmYTk3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/5119f753122647db9020163b22720c9efile.png', '减压', 196, 0, 0, '天边的烟云抹去了淡淡的忧伤，或许我该学会调和等待与惆怅。', '烟袋斜街', 'Normal', 0, '2021-10-02 19:27:51', '2021-10-02 19:27:51');
INSERT INTO `edu_music` VALUES ('1444264759512817665', '1502246606873903105', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/dd02c8b1e09d4dabad8c4106ef969589Windy Hill.mp3?versionId=CAEQFxiBgICQ2oyX4hciIDg1NjY0MDU4YWFkMjRjYmY5OGM1MTc2MzgzNjU4YmJj', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/d6e6c33233814064a385d59daf93ed86file.png', '感动', 349, 0, 0, '景色很美妙，但是思恋和等待也很漫长，不过任然充满希望就是了', 'Windy Hill', 'Normal', 0, '2021-10-02 19:35:26', '2021-10-02 19:35:26');
INSERT INTO `edu_music` VALUES ('1501033514517196801', '1502211201646481410', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/3c04c3a64aec407b8cc89f692b41aadeLeeAlive - Water (Original Mix).mp3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/0b4f606a057e4fa390ff01efdca1b12cfile.png', '感动', 13413, 0, 0, '夏为雨，冬为雪。化而生气，凝而成冰', 'LeeAlive - Water ', 'Normal', 0, '2022-03-08 11:14:12', '2022-03-08 11:51:50');
INSERT INTO `edu_music` VALUES ('1503721359719546881', '1502211201646481410', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/26fa11af21464ba7a9a8d6a18e7f450fRichard Clayderman - 梦中的婚礼 (钢琴曲).mp3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/15/f4f7510026f54a36b7d7384a7d4a7edbfile.png', '孤独', 0, 0, 0, '《梦中的婚礼》（法语：Mariage d\'amour）是法国作曲家及音乐制作人保罗·塞内维尔（Paul De Senneville）和奥立佛·图森（Olivier Toussaint）为钢琴家理查德·克莱德曼量身定制的乐曲，收录于专辑《水边的阿狄丽娜》', 'Richard Clayderman - 梦中的婚礼 (钢琴曲)', 'Normal', 0, '2022-03-15 21:14:45', '2022-03-15 21:14:54');
INSERT INTO `edu_music` VALUES ('1507279469287645186', '1502211201646481410', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/recl-music/c74bd2f15000478aaed617763de09f39123132.mp3', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/25/0b90a586489047b5a0ef05b3a47ae9e7file.png', '迷茫', 4, 100, 100, '如何重新开始，重新应对动荡，重新面对自己', '一个人的繁华', 'Normal', 0, '2022-03-25 16:53:24', '2022-03-26 20:00:01');

-- ----------------------------
-- Table structure for edu_music_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_music_collect`;
CREATE TABLE `edu_music_collect`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏记录唯一id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏用户id',
  `music_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏音频id',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_music_collect
-- ----------------------------
INSERT INTO `edu_music_collect` VALUES ('1507322494118379521', '1439828722283794434', '1444208758042406913', 0, '2022-03-25 19:44:22', '2022-03-25 19:44:22');
INSERT INTO `edu_music_collect` VALUES ('1507338851367108610', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 20:49:22', '2022-03-25 20:49:22');
INSERT INTO `edu_music_collect` VALUES ('1507354364407230465', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 21:51:00', '2022-03-25 21:51:00');
INSERT INTO `edu_music_collect` VALUES ('1507354449027313666', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 21:51:21', '2022-03-25 21:51:21');
INSERT INTO `edu_music_collect` VALUES ('1507357634609590274', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 22:04:00', '2022-03-25 22:04:00');
INSERT INTO `edu_music_collect` VALUES ('1507357747893547009', '1439828722283794433', '1444261494213599234', 1, '2022-03-25 22:04:27', '2022-03-25 22:04:27');
INSERT INTO `edu_music_collect` VALUES ('1507379569473142786', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 23:31:10', '2022-03-25 23:31:10');
INSERT INTO `edu_music_collect` VALUES ('1507384766442242050', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 23:51:49', '2022-03-25 23:51:49');
INSERT INTO `edu_music_collect` VALUES ('1507552933332508673', '1439828722283794433', '1507279469287645186', 1, '2022-03-25 11:00:03', '2022-03-25 11:00:03');
INSERT INTO `edu_music_collect` VALUES ('1507714371975921666', '1439828722283794433', '1507279469287645186', 0, '2022-03-26 21:41:33', '2022-03-26 21:41:33');

-- ----------------------------
-- Table structure for edu_music_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_music_comment`;
CREATE TABLE `edu_music_comment`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '忆心音乐评论id',
  `music_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '音频文件所属id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户的id',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_music_comment
-- ----------------------------
INSERT INTO `edu_music_comment` VALUES ('1507718234414006274', '1507279469287645186', '1439828722283794433', '123123', 0, '2022-03-26 21:56:54', '2022-03-26 21:56:54');
INSERT INTO `edu_music_comment` VALUES ('1507719055293825025', '1507279469287645186', '1439828722283794433', '主播终于更新了', 0, '2022-03-26 22:00:10', '2022-03-26 22:00:10');
INSERT INTO `edu_music_comment` VALUES ('1507723580926914562', '1507279469287645186', '1439828722283794433', '终于等到你了', 0, '2022-03-26 22:18:09', '2022-03-26 22:18:09');
INSERT INTO `edu_music_comment` VALUES ('1507723581035966466', '1507279469287645186', '1439828722283794433', '终于等到你了', 0, '2022-03-26 22:18:09', '2022-03-26 22:18:09');
INSERT INTO `edu_music_comment` VALUES ('1507723595590201345', '1507279469287645186', '1439828722283794433', '终于等到你了', 0, '2022-03-26 22:18:12', '2022-03-26 22:18:12');
INSERT INTO `edu_music_comment` VALUES ('1507723673759444994', '1507279469287645186', '1439828722283794433', '终于等到你了', 0, '2022-03-26 22:18:31', '2022-03-26 22:18:31');
INSERT INTO `edu_music_comment` VALUES ('1507726614251761665', '1507279469287645186', '1439828722283794433', '来了来了', 0, '2022-03-26 22:30:12', '2022-03-26 22:30:12');

-- ----------------------------
-- Table structure for edu_music_cover
-- ----------------------------
DROP TABLE IF EXISTS `edu_music_cover`;
CREATE TABLE `edu_music_cover`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '背景封面图片唯一id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片名称',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '背景图片路径',
  `id_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_music_cover
-- ----------------------------
INSERT INTO `edu_music_cover` VALUES ('1480796421335560194', '蓝天', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/01/11/a4e29491231c4e2da1d95ba6b193c431file.png', 0, '2022-01-11 14:59:13', '2022-01-11 14:59:13');
INSERT INTO `edu_music_cover` VALUES ('1485185056596041730', '微光', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/01/23/30bf90a21213447f930944c8a9234fd5file.png', 0, '2022-01-23 17:38:06', '2022-01-23 17:38:06');
INSERT INTO `edu_music_cover` VALUES ('1485185336481947649', '阳光', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/01/23/1af838264319485d9c76588e4cc54b0cfile.png', 0, '2022-01-23 17:39:12', '2022-01-23 17:39:12');
INSERT INTO `edu_music_cover` VALUES ('1501062183407173633', '水蓝蓝', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/17cf0b7b1e1444678f122a99df57913afile.png', 0, '2022-03-08 13:08:08', '2022-03-08 13:08:08');
INSERT INTO `edu_music_cover` VALUES ('1501063672057937922', '花海', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/d8963b6bb76c4b84a30645fbf8bd10f3file.png', 0, '2022-03-08 13:14:02', '2022-03-08 13:14:02');
INSERT INTO `edu_music_cover` VALUES ('1501065475935813633', '滴水', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/6244ff833bf1454bab698113429a3072file.png', 0, '2022-03-08 13:21:13', '2022-03-08 13:21:13');
INSERT INTO `edu_music_cover` VALUES ('1501065567971426305', '星云', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/9c166c40df4041efa93f3565067fd59ffile.png', 0, '2022-03-08 13:21:35', '2022-03-08 13:21:35');
INSERT INTO `edu_music_cover` VALUES ('1501066221066502146', '蒲公英', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/0c198f3a2da044849f29808e4d1fb013file.png', 0, '2022-03-08 13:24:10', '2022-03-08 13:24:10');
INSERT INTO `edu_music_cover` VALUES ('1501066283628740609', '阳光', 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2022/03/08/5d9701408899494c8c777c1d2f6a8dc5file.png', 0, '2022-03-08 13:24:25', '2022-03-08 13:24:25');

-- ----------------------------
-- Table structure for edu_reservation
-- ----------------------------
DROP TABLE IF EXISTS `edu_reservation`;
CREATE TABLE `edu_reservation`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约记录唯一ID',
  `counselor_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约咨询师ID',
  `reservation_user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约用户ID',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预约用户手机号',
  `method` int(0) NOT NULL COMMENT '咨询方式（0代表电话咨询，1代表线上咨询，2代表线下咨询））',
  `direction` int(0) NOT NULL COMMENT '咨询方向(0代表人际交往，1代表家庭关系，2代表职场竞争，3代表感情恋爱，4代表情绪管理，5代表心理治疗）',
  `previous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '曾经是否接受心理治疗（0代表false，1代表true）',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '咨询备注',
  `deal_result` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Draft' COMMENT '处理结果',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除字段（0代表false，1代表true）',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_reservation
-- ----------------------------
INSERT INTO `edu_reservation` VALUES ('1497930866578546689', '1238433', '1439828722283794433', '18582416628', 0, 0, 1, '', 'Draft', 0, '2022-02-27 21:45:23', '2022-02-27 21:45:23');

-- ----------------------------
-- Table structure for edu_scale
-- ----------------------------
DROP TABLE IF EXISTS `edu_scale`;
CREATE TABLE `edu_scale`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '心理测试量表唯一id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布相关测试的用户唯一id',
  `classify_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试量表一级分类的唯一id',
  `classify_parent_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试量表二级分类的唯一id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试量表标题',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '量表测试所需费用',
  `scale_category` int(0) NOT NULL DEFAULT 0 COMMENT '量表分为组合表和单一表（0代表组合，1代表单一）',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试量表封面图片路径',
  `buy_count` bigint(0) NULL DEFAULT 0 COMMENT '量表购买数量',
  `view_count` bigint(0) NULL DEFAULT 0 COMMENT '浏览量',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '量表描述信息',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Draft' COMMENT '量表发布情况（Draft代表待确认，Verify代表已确认,Normal代表已发布）',
  `version` bigint(0) NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_scale
-- ----------------------------
INSERT INTO `edu_scale` VALUES ('1424953365894311938', '1502211201646481410', '1423931731183964161', '1423931731116855297', '艾森克人格测评(EPQ)', 5.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/08/10/9060f46f93984b5ca4d6c105d3f5a743file.png', 0, 0, 'EPQ有四个量表，分别为精神质（P）、情绪稳定性（N）、内外向（E）和效度量表（L），对个性特质和心理健康都能较好的测查，只有85个题目，题量适中，功能较全，在精神医学、心理咨询等行业都广泛应用，尤其是它的50多年的历史 和几番修订补充，奠定了它在心理学的重要地位，在心理门诊中应用最为广泛。\r\n\r\nEPQ量表主要用于正常人的人格测量，临床上也用于精神病理方面的研究与测量，N量表对临床具有一定的意义，高N分代表情绪的不稳定，有神经症倾向的人N分一般都高。P量表主要用于测查有精神病倾向的人。如果P分很高，则考虑有精神病倾向，应作进一步检查，以明确诊断。\r\n', 'Normal', 6, 0, '2021-08-10 12:38:51', '2022-03-15 20:34:25');
INSERT INTO `edu_scale` VALUES ('1425400052131688449', '1502211201646481410', '1423931731313987586', '1423931731246878721', 'SDS抑郁自评量表', 7.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/08/11/91fc832694c14d818fbf5b56556581b3file.png', 0, 0, '抑郁自评量表(Self-RatingDepression Scale，SDS)由W.瓦Zung编制于1965年，为美国教育卫生福利部推荐的用于精神药理学研究的量表之一。因使用简便，能相当直观地反映病人抑郁的主观感受及其在治疗中的变化，已广泛应用于门诊病人的粗筛、情绪状态评定以及调查、科研等。\r\n\r\nSDS的优点为使用简单，不需要经专门的训练即可指导自评者进行相当有效的评定，而且它的分析相当方便。在一定程度上能够了解被调查者近期心境，可应用于心理咨询门诊中。\r\n如用于评估疗效，应在开始治疗或研究前让自评者评定一次，然后至少应在治疗后或研究结束时再自评一次，以便通过SDS总分变化来分析自评者的症状变化情况。\r\n在治疗或研究期间评定，其时间间隔可由研究者自行安排。\r\n', 'Normal', 1, 0, '2021-08-11 18:13:50', '2021-08-11 18:14:04');
INSERT INTO `edu_scale` VALUES ('1425706032405016577', '1502211555981283330', '1423985140947804162', '1423931730932305921', '大学生心理健康评估（UPI）', 3.00, 2, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/08/12/1d43a8ca0e6e4055829275e4bb1c1df6file.png', 0, 0, 'asqfqfqwdqwdq', 'Normal', 1, 0, '2021-08-12 14:29:41', '2021-08-12 14:30:22');
INSERT INTO `edu_scale` VALUES ('1439197265106358274', '1502211555981283330', '1423931731313987586', '1423931731246878721', '职业性格检测', 0.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/18/7bc75e91067a4baf83dcbd6b13e848f0file.png', 0, 382910, '那么，如何了解自己的职业性格？如何发挥自己的职业潜力？如何利用职业性格优势，规划职业路线？本次测评将从职业性格和职业倾向两方面，系统评估你的职场行为风格、职场优势和劣势，推荐适合你的组织和岗位，并且给出专业的职业发展意见。', 'Normal', 1, 0, '2021-09-18 19:59:02', '2021-09-18 20:00:31');
INSERT INTO `edu_scale` VALUES ('1439197796893773825', '1502211793588604930', '1423985140947804162', '1423931730932305921', '你的心有多坚强', 0.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/18/8c582ead1b4641f895037f6b92d13692file.png', 0, 0, '最是人间留不住，朱颜辞镜花辞树', 'Normal', 1, 0, '2021-09-18 20:01:08', '2021-09-18 20:01:40');
INSERT INTO `edu_scale` VALUES ('1439215188373962753', '1502246606873903105', '1423931731444011009', '1423931731246878721', '测测你的金钱观', 0.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/18/e87a7a84f7c24094a5b20386bae32b42file.png', 0, 0, '最是人间留着不住，朱颜辞镜花辞树', 'Normal', 1, 0, '2021-09-18 21:10:15', '2021-09-18 21:11:13');
INSERT INTO `edu_scale` VALUES ('1439215558429016066', '1502246606873903105', '1423931731183964161', '1423931731116855297', '你有哪种强迫症？', 5.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/18/0f8f796b1c3442c1aa41722f37933751file.png', 0, 0, '最是人间留着不住，朱颜辞镜花辞树', 'Normal', 2, 0, '2021-09-18 21:11:43', '2021-10-06 13:42:14');
INSERT INTO `edu_scale` VALUES ('1439215954828492801', '1502211653154918401', '1423931731704057858', '1423931731116855297', '你身怀哪种绝世武功', 0.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/18/cfc5c4b302dd47a7b5569d49bdf23f87file.png', 0, 0, '最是人间留着不住，朱颜辞镜花辞树', 'Normal', 1, 0, '2021-09-18 21:13:18', '2021-09-18 21:14:22');
INSERT INTO `edu_scale` VALUES ('1459786787397328897', '1502211653154918401', '1423931731183964161', '1423931731116855297', 'SDS抑郁自测', 1.00, 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/11/14/82d2a2708c7c4445bca70849a510e8dffile.png', 0, 0, '用于检验性格与抑郁的关系', 'Normal', 1, 0, '2021-11-14 15:34:26', '2021-11-14 15:34:26');

-- ----------------------------
-- Table structure for edu_scale_appraisal
-- ----------------------------
DROP TABLE IF EXISTS `edu_scale_appraisal`;
CREATE TABLE `edu_scale_appraisal`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '量表评估原则',
  `scale_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属量表id',
  `dimension` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '评估维度',
  `upper_limit` decimal(5, 0) NOT NULL COMMENT '评分上限',
  `lower_limit` decimal(5, 0) NOT NULL COMMENT '评分下限(下限不得低于0， 即不能为负数)',
  `appraisal_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测评结果',
  `coefficient` decimal(3, 2) NOT NULL DEFAULT 1.00 COMMENT '总初分转标准分所需系数(默认为1)',
  `essential_factor_appraisal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '必要判定因子的判断项（1（true）是必要判定因子，2（false）非必要判定因子，默认为false）',
  `vague_factor_appraisal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '模糊判定因子的判断项（1（true）是模糊判定因子项，2（false）非模糊判定因子项，默认为false）',
  `auxiliary_factor_appraisal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '辅助因子的判断项（1（true）是辅助因子项，2（false）非辅助因子项，默认为false）',
  `pseudo_scale_appraisal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '测伪尺度的判断项（1（true）是测伪尺度项，2（false）非测伪尺度项，默认为false）',
  `appraisal_priority` int(0) NOT NULL DEFAULT 1 COMMENT '评估优先级别，值越小优先级别越高，最高为1级，量表评估过程按优先级进行依次评估',
  `warning_level` int(0) NULL DEFAULT NULL COMMENT '预警等级：(0表示正常， 1表示一级预警（测评者有轻微的心理问题），2表示二级预警（测评者有较为严重的心理问题，需要进行心理疏导），3表示三级预警，测评者患有严重心理问题，需要立刻就医治疗)',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_scale_appraisal
-- ----------------------------
INSERT INTO `edu_scale_appraisal` VALUES ('1445044362984599553', '1424953365894311938', 'E', 100, 16, '人格外向，可能好交际，渴望刺激和冒险，情感易于冲动。', 1.00, 0, 0, 0, 0, 1, NULL, 0, '2021-10-04 23:13:18', '2021-10-04 23:13:18');
INSERT INTO `edu_scale_appraisal` VALUES ('1445044363039125506', '1424953365894311938', 'E', 7, 0, '人格外向，如好静，富于内省，不喜欢刺激，喜欢有秩序的生活方式，情绪比较稳定。', 1.00, 0, 0, 0, 0, 1, NULL, 0, '2021-10-04 23:13:18', '2021-10-04 23:13:18');
INSERT INTO `edu_scale_appraisal` VALUES ('1445044363102040065', '1424953365894311938', 'N', 100, 15, '经常感到焦虑、忧心忡忡、常郁郁不乐，有强烈情绪反应，甚至出现不理智行为。', 1.00, 0, 0, 0, 0, 1, NULL, 0, '2021-10-04 23:13:18', '2021-10-04 23:13:18');
INSERT INTO `edu_scale_appraisal` VALUES ('1445044363164954626', '1424953365894311938', 'N', 8, 0, '情绪能够保持稳定', 1.00, 0, 0, 0, 0, 1, NULL, 0, '2021-10-04 23:13:18', '2021-10-04 23:13:18');
INSERT INTO `edu_scale_appraisal` VALUES ('1445044363227869186', '1424953365894311938', 'P', 100, 9, '孤独、不关心他人，难以适应外部环境，不近人情，与别人不友好，喜欢寻衅搅扰，喜欢干奇特的事，并且不顾危险。', 1.00, 0, 0, 0, 0, 1, NULL, 0, '2021-10-04 23:13:18', '2021-10-04 23:13:18');
INSERT INTO `edu_scale_appraisal` VALUES ('1445044363294978050', '1424953365894311938', 'L', 100, 19, '你在测试过程可能存在掩饰倾向，测试结果可能失真', 1.00, 0, 0, 0, 0, 1, NULL, 0, '2021-10-04 23:13:19', '2021-10-04 23:13:19');
INSERT INTO `edu_scale_appraisal` VALUES ('1445315223377420289', '1425400052131688449', 'A', 52, 0, '正常', 1.25, 0, 0, 0, 0, 1, 0, 0, '2021-10-05 17:09:37', '2021-10-05 17:09:37');
INSERT INTO `edu_scale_appraisal` VALUES ('1445315223444529153', '1425400052131688449', 'A', 62, 53, '轻度抑郁', 1.25, 0, 0, 0, 0, 1, 1, 0, '2021-10-05 17:09:37', '2021-10-05 17:09:37');
INSERT INTO `edu_scale_appraisal` VALUES ('1445315223507443713', '1425400052131688449', 'A', 72, 63, '中度抑郁', 1.25, 0, 0, 0, 0, 1, 2, 0, '2021-10-05 17:09:37', '2021-10-05 17:09:37');
INSERT INTO `edu_scale_appraisal` VALUES ('1445315223574552577', '1425400052131688449', 'A', 10000, 72, '重度抑郁', 1.25, 0, 0, 0, 0, 1, 3, 0, '2021-10-05 17:09:37', '2021-10-05 17:09:37');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409404207106', '1425706032405016577', 'A', 56, 25, '需要进一步的诊断被认为确有心理卫生问题的学生，该学生需要进行持续的心理咨询', 1.00, 0, 0, 0, 0, 1, 3, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409433567234', '1425706032405016577', 'A', 1, 1, '需要进一步的诊断被认为确有心理卫生问题的学生，该学生需要进行持续的心理咨询', 1.00, 1, 0, 0, 0, 1, 3, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409509064705', '1425706032405016577', 'A', 4, 2, '需要进一步的诊断被认为确有心理卫生问题的学生，该学生需要进行持续的心理咨询', 1.00, 0, 0, 1, 0, 1, 3, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409563590658', '1425706032405016577', 'A', 24, 20, '没有严重心理卫生问题，但仍然需要关注，该类学生可作为咨询机构今后的关注对象', 1.00, 0, 0, 0, 0, 2, 2, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409702002690', '1425706032405016577', 'A', 3, 1, '没有严重心理卫生问题，但仍然需要关注，该类学生可作为咨询机构今后的关注对象', 1.00, 0, 1, 0, 0, 2, 2, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409764917249', '1425706032405016577', 'A', 1, 0, '没有严重心理卫生问题，但仍然需要关注，该类学生可作为咨询机构今后的关注对象', 1.00, 0, 0, 1, 0, 2, 2, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409840414721', '1425706032405016577', 'A', 4, 2, '检测结果显示你在测试过程有所保留，评估结果不准确', 1.00, 0, 0, 0, 1, 1, NULL, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409911717889', '1425706032405016577', 'A', 4, 2, '检测结果显示你在测试过程有所保留，评估结果不准确', 1.00, 0, 0, 0, 1, 2, NULL, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1446390409962049537', '1425706032405016577', 'A', 2, 0, '检测结果显示你在测试过程有所保留，评估结果不准确', 1.00, 0, 0, 0, 1, 3, NULL, 0, '2021-10-08 16:22:01', '2021-10-08 16:22:01');
INSERT INTO `edu_scale_appraisal` VALUES ('1459795073576255489', '1459786787397328897', 'A', 52, 0, '正常', 1.25, 0, 0, 0, 0, 1, 0, 0, '2021-11-14 16:07:22', '2021-11-14 16:07:22');
INSERT INTO `edu_scale_appraisal` VALUES ('1459795073639170049', '1459786787397328897', 'A', 62, 53, '轻度抑郁', 1.25, 0, 0, 0, 0, 1, 1, 0, '2021-11-14 16:07:22', '2021-11-14 16:07:22');
INSERT INTO `edu_scale_appraisal` VALUES ('1459795073769193473', '1459786787397328897', 'A', 72, 63, '中度抑郁', 1.25, 0, 0, 0, 0, 1, 2, 0, '2021-11-14 16:07:22', '2021-11-14 16:07:22');
INSERT INTO `edu_scale_appraisal` VALUES ('1459795073769193474', '1459786787397328897', 'A', 10000, 72, '重度抑郁', 1.25, 0, 0, 0, 0, 1, 3, 0, '2021-11-14 16:07:22', '2021-11-14 16:07:22');

-- ----------------------------
-- Table structure for edu_scale_classify
-- ----------------------------
DROP TABLE IF EXISTS `edu_scale_classify`;
CREATE TABLE `edu_scale_classify`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '心理测试量表分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类标题',
  `parent_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级分类id',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序，默认为0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_scale_classify
-- ----------------------------
INSERT INTO `edu_scale_classify` VALUES ('1423931730932305921', '情感', '0', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931730932305922', '家庭', '0', 0, 0, '2022-02-28 16:18:59', '2022-02-28 16:19:02');
INSERT INTO `edu_scale_classify` VALUES ('1423931731053940738', '爱情', '1423931730932305921', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931731116855297', '性格', '0', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931731183964161', '自我成长', '1423931731116855297', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931731246878721', '职场', '0', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931731313987586', '职场竞争', '1423931731246878721', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931731444011009', '职场关系', '1423931731246878721', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423931731704057858', '情绪调整', '1423931731116855297', 0, 0, '2021-08-07 16:59:15', '2021-08-07 16:59:15');
INSERT INTO `edu_scale_classify` VALUES ('1423985140947804162', '恋爱心理', '1423931730932305921', 0, 0, '2021-08-07 20:31:29', '2021-08-07 20:31:29');
INSERT INTO `edu_scale_classify` VALUES ('1423985141048467457', '心理年龄', '1423931731116855297', 0, 0, '2021-08-07 20:31:29', '2021-08-07 20:31:29');
INSERT INTO `edu_scale_classify` VALUES ('1423985141111382018', '职场发展', '1423931731246878721', 0, 0, '2021-08-07 20:31:29', '2021-08-07 20:31:29');
INSERT INTO `edu_scale_classify` VALUES ('1423985141178490882', '职场晋升', '1423931731246878721', 0, 0, '2021-08-07 20:31:29', '2021-08-07 20:31:29');
INSERT INTO `edu_scale_classify` VALUES ('1423985141312708609', '友情维护', '1423931730932305921', 0, 0, '2021-08-07 20:31:29', '2021-08-07 20:31:29');
INSERT INTO `edu_scale_classify` VALUES ('1423985141375623169', '家庭情感', '1423931730932305922', 0, 0, '2021-08-07 20:31:29', '2021-08-07 20:31:29');

-- ----------------------------
-- Table structure for edu_scale_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_scale_comment`;
CREATE TABLE `edu_scale_comment`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '量表评论id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者用户id',
  `scale_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应量表id',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '量表评论内容',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_scale_comment
-- ----------------------------
INSERT INTO `edu_scale_comment` VALUES ('123141414', '1439828722283794433', '1439197265106358274', '有帮助，语言展现很精准，而且喜欢最后的延展阅读，重在给到思考方法，逻辑和维度', 0, '2021-09-30 11:35:00', '2021-09-30 11:35:02');
INSERT INTO `edu_scale_comment` VALUES ('123141415', '1439828722283794434', '1439197265106358274', '测评结果基本符合当下的状况，建议实用性比较强。自己也是心理咨询师，这个气质测评问卷效度还是比较高的。', 0, '2021-09-30 11:36:30', '2021-09-30 11:36:33');
INSERT INTO `edu_scale_comment` VALUES ('123141416', '1439828722283794436', '1439197265106358274', '培养心中的希望\r\n希望自己渴望明天的太阳', 0, '2021-09-30 18:37:38', '2021-09-30 18:37:41');
INSERT INTO `edu_scale_comment` VALUES ('123141417', '1439828722283794436', '1425400052131688449', '很符合我现在的状况，量表准确性很高', 0, '2021-10-09 22:04:01', '2021-10-09 22:04:03');
INSERT INTO `edu_scale_comment` VALUES ('123141418', '1439828722283794434', '1425400052131688449', '结果很准确，值得信赖，希望能发布更多种类的量表', 0, '2021-10-09 22:29:47', '2021-10-09 22:29:45');
INSERT INTO `edu_scale_comment` VALUES ('1502991841518170113', '1439828722283794433', '1425400052131688449', '完全地区无法区分', 0, '2022-03-13 20:55:54', '2022-03-13 20:55:54');
INSERT INTO `edu_scale_comment` VALUES ('1502992488472784898', '1439828722283794433', '1425400052131688449', NULL, 0, '2022-03-13 20:58:28', '2022-03-13 20:58:28');
INSERT INTO `edu_scale_comment` VALUES ('1502992825732575233', '1439828722283794433', '1425400052131688449', '结果很准确', 0, '2022-03-13 20:59:49', '2022-03-13 20:59:49');
INSERT INTO `edu_scale_comment` VALUES ('1503895869009702914', '1502211201646481410', '1424953365894311938', '很准确', 0, '2022-03-16 08:48:11', '2022-03-16 08:48:11');
INSERT INTO `edu_scale_comment` VALUES ('1503899967603867650', '1502211201646481410', '1424953365894311938', '和我状况相符合', 0, '2022-03-16 09:04:28', '2022-03-16 09:04:28');

-- ----------------------------
-- Table structure for edu_scale_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `edu_scale_evaluate`;
CREATE TABLE `edu_scale_evaluate`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '量表评分表唯一id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scale_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属量表唯一id',
  `understand_ability` int(0) NOT NULL COMMENT '量表易懂性评分',
  `practice_ability` int(0) NOT NULL COMMENT '量表建议实用性评分',
  `accuracy_ability` int(0) NOT NULL COMMENT '量表易懂性评分',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_scale_evaluate
-- ----------------------------
INSERT INTO `edu_scale_evaluate` VALUES ('123312', NULL, '1439197265106358274', 3, 4, 5, 0, '2021-09-30 19:42:10', '2021-09-30 19:42:13');
INSERT INTO `edu_scale_evaluate` VALUES ('12345567', NULL, '1439197265106358274', 4, 5, 4, 0, '2021-09-30 19:39:34', '2021-09-30 19:39:38');
INSERT INTO `edu_scale_evaluate` VALUES ('1447101094502137858', '1439828722283794433', '1425400052131688449', 3, 2, 5, 0, '2021-10-10 15:26:01', '2021-10-10 15:26:01');
INSERT INTO `edu_scale_evaluate` VALUES ('1447168811963875329', NULL, '1425400052131688449', 4, 3, 5, 0, '2021-10-10 19:55:07', '2021-10-10 19:55:07');
INSERT INTO `edu_scale_evaluate` VALUES ('1447169196325699585', '1439828722283794433', '1425400052131688449', 4, 2, 5, 0, '2021-10-10 19:56:38', '2021-10-10 19:56:38');
INSERT INTO `edu_scale_evaluate` VALUES ('1447169509497602050', '1439828722283794433', '1425400052131688449', 4, 2, 5, 0, '2021-10-10 19:57:53', '2021-10-10 19:57:53');
INSERT INTO `edu_scale_evaluate` VALUES ('1447521119767650305', '1439828722283794433', '1424953365894311938', 1, 5, 5, 0, '2021-10-11 19:15:03', '2021-10-11 19:15:03');
INSERT INTO `edu_scale_evaluate` VALUES ('1447522394601185281', '1439828722283794433', '1425706032405016577', 5, 5, 5, 0, '2021-10-11 19:20:07', '2021-10-11 19:20:07');
INSERT INTO `edu_scale_evaluate` VALUES ('1447523749021638658', '1439828722283794433', '1425400052131688449', 5, 5, 5, 0, '2021-10-11 19:25:30', '2021-10-11 19:25:30');
INSERT INTO `edu_scale_evaluate` VALUES ('1456873263943712770', NULL, '1425400052131688449', 4, 2, 5, 0, '2021-11-06 14:37:08', '2021-11-06 14:37:08');
INSERT INTO `edu_scale_evaluate` VALUES ('1456873542407749633', NULL, '1425400052131688449', 3, 4, 3, 0, '2021-11-06 14:38:15', '2021-11-06 14:38:15');
INSERT INTO `edu_scale_evaluate` VALUES ('1456904272600911874', '1439828722283794433', '1424953365894311938', 5, 5, 5, 0, '2021-11-06 16:40:21', '2021-11-06 16:40:21');
INSERT INTO `edu_scale_evaluate` VALUES ('1456904666286673921', '1439828722283794433', '1424953365894311938', 2, 4, 2, 0, '2021-11-06 16:41:55', '2021-11-06 16:41:55');
INSERT INTO `edu_scale_evaluate` VALUES ('1456904881546743810', '1439828722283794433', '1425400052131688449', 2, 3, 2, 0, '2021-11-06 16:42:46', '2021-11-06 16:42:46');
INSERT INTO `edu_scale_evaluate` VALUES ('1456905048366796801', '1439828722283794433', '1425706032405016577', 3, 3, 5, 0, '2021-11-06 16:43:26', '2021-11-06 16:43:26');
INSERT INTO `edu_scale_evaluate` VALUES ('1456910325292027905', '1439828722283794433', '1424953365894311938', 4, 3, 2, 0, '2021-11-06 17:04:24', '2021-11-06 17:04:24');
INSERT INTO `edu_scale_evaluate` VALUES ('1459769182421794818', NULL, '1424953365894311938', 4, 2, 5, 0, '2021-11-14 14:24:29', '2021-11-14 14:24:29');
INSERT INTO `edu_scale_evaluate` VALUES ('1502974093203427329', '1439828722283794433', '1425400052131688449', 3, 5, 3, 0, '2022-03-13 19:45:22', '2022-03-13 19:45:22');
INSERT INTO `edu_scale_evaluate` VALUES ('1502981811439947777', '1439828722283794433', '1425400052131688449', 5, 3, 5, 0, '2022-03-13 20:16:03', '2022-03-13 20:16:03');
INSERT INTO `edu_scale_evaluate` VALUES ('1502982091615260674', '1439828722283794433', '1425706032405016577', 5, 4, 5, 0, '2022-03-13 20:17:09', '2022-03-13 20:17:09');
INSERT INTO `edu_scale_evaluate` VALUES ('1502982384377679873', '1439828722283794433', '1425706032405016577', 5, 2, 5, 0, '2022-03-13 20:18:19', '2022-03-13 20:18:19');
INSERT INTO `edu_scale_evaluate` VALUES ('1502989682030424066', '1439828722283794433', '1425400052131688449', 5, 2, 5, 0, '2022-03-13 20:47:19', '2022-03-13 20:47:19');
INSERT INTO `edu_scale_evaluate` VALUES ('1502989897705730050', '1439828722283794433', '1425400052131688449', 4, 5, 2, 0, '2022-03-13 20:48:10', '2022-03-13 20:48:10');
INSERT INTO `edu_scale_evaluate` VALUES ('1502991026921418754', '1439828722283794433', '1425400052131688449', 4, 3, 5, 0, '2022-03-13 20:52:40', '2022-03-13 20:52:40');
INSERT INTO `edu_scale_evaluate` VALUES ('1502991812661358594', '1439828722283794433', '1425400052131688449', 5, 3, 5, 0, '2022-03-13 20:55:47', '2022-03-13 20:55:47');
INSERT INTO `edu_scale_evaluate` VALUES ('1502991902029393922', '1439828722283794433', '1425400052131688449', 5, 3, 5, 0, '2022-03-13 20:56:08', '2022-03-13 20:56:08');
INSERT INTO `edu_scale_evaluate` VALUES ('1502992446039011330', '1439828722283794433', '1425400052131688449', 5, 2, 5, 0, '2022-03-13 20:58:18', '2022-03-13 20:58:18');
INSERT INTO `edu_scale_evaluate` VALUES ('1502992760880246785', '1439828722283794433', '1425400052131688449', 4, 1, 5, 0, '2022-03-13 20:59:33', '2022-03-13 20:59:33');
INSERT INTO `edu_scale_evaluate` VALUES ('1502993135129604097', '1439828722283794433', '1425400052131688449', 4, 5, 5, 0, '2022-03-13 21:01:02', '2022-03-13 21:01:02');
INSERT INTO `edu_scale_evaluate` VALUES ('1503270754882428930', '1439828722283794433', '1425706032405016577', 1, 1, 1, 0, '2022-03-14 15:24:12', '2022-03-14 15:24:12');
INSERT INTO `edu_scale_evaluate` VALUES ('1503895818854215682', '1502211201646481410', '1424953365894311938', 4, 3, 5, 0, '2022-03-16 08:47:59', '2022-03-16 08:47:59');
INSERT INTO `edu_scale_evaluate` VALUES ('1503899902734761986', '1502211201646481410', '1424953365894311938', 5, 3, 5, 0, '2022-03-16 09:04:13', '2022-03-16 09:04:13');

-- ----------------------------
-- Table structure for edu_scale_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_scale_subject`;
CREATE TABLE `edu_scale_subject`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '量表题目唯一id',
  `scale_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属量表id',
  `subject_sort` int(0) NOT NULL COMMENT '量表测试项排序',
  `dimension` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'A' COMMENT '题目对应维度',
  `option_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '测试题目标题',
  `option_one` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试项1',
  `option_one_score` int(0) NULL DEFAULT NULL COMMENT '测试项1对应分值',
  `option_two` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试项2',
  `option_two_score` int(0) NULL DEFAULT NULL COMMENT '测试项2对应分值',
  `option_three` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试项3',
  `option_three_score` int(0) NULL DEFAULT NULL COMMENT '测试项3对应分值',
  `option_four` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试项4',
  `option_four_score` int(0) NULL DEFAULT NULL COMMENT '测试项4对应分值',
  `essential_factor` tinyint(1) NOT NULL DEFAULT 0 COMMENT '必要因子，评估标准的优先项，满足这一标准即可得出结果，作为特殊筛选的标准(1(true)是判定因子，0（false）非判定因子，默认为false',
  `vague_factor` tinyint(1) NOT NULL DEFAULT 0 COMMENT '模糊因子，该因子满足一定范围值即可得出结果(1(true)是判定因子，0（false）非判定因子，默认为false）',
  `auxiliary_factor` tinyint(1) NOT NULL DEFAULT 0 COMMENT '辅助因子，辅助因子和模糊因子类似，但优先级更高，辅助因子会结合心理治疗情况',
  `pseudo_scale_measure` tinyint(1) NOT NULL DEFAULT 0 COMMENT '测伪尺度，与粗分或标准分结合判定测试的真伪性（1（true）为测伪尺度,2（false）非测伪尺度）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_scale_subject
-- ----------------------------
INSERT INTO `edu_scale_subject` VALUES ('1445043990920474625', '1424953365894311938', 1, 'E', '你是否有广泛的爱好', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043990987583489', '1424953365894311938', 2, 'P', '在做任何事之前，你是否都要考虑一番？', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991050498050', '1424953365894311938', 3, 'N', '你的情绪时常波动吗？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991117606913', '1424953365894311938', 4, 'L', '当别人做了好事，而周围人认为是你做的，你是否感到洋洋得意？', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991184715777', '1424953365894311938', 5, 'E', '你是一个健谈的人吗？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991251824641', '1424953365894311938', 6, 'N', '你曾经无缘无故觉得自己\"可怜吗\"？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991314739201', '1424953365894311938', 7, 'L', '你曾经有过贪心使自己多得份外的物质利益吗？', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991381848066', '1424953365894311938', 8, 'P', '晚上你是否小心的把门关好？', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991448956930', '1424953365894311938', 9, 'E', '你认为自己活泼吗？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991448956931', '1424953365894311938', 10, 'P', '当你看到小孩（或动物）受折磨时是否感到难受', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991578980354', '1424953365894311938', 11, 'N', '你是否常担心你会说出（或做出）不应该说或做的事?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991650283522', '1424953365894311938', 12, 'L', '若你说过要做某件事，是否不管遇到什么困难都要把它做成?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991650283523', '1424953365894311938', 13, 'E', '在愉快的聚会中你是否通常尽情享受?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991713198081', '1424953365894311938', 14, 'N', '你是一位易激怒的人吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991780306945', '1424953365894311938', 15, 'L', '你是否有过自己做错了事反倒责备别人的时候?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991843221506', '1424953365894311938', 16, 'E', '你喜欢会见陌生人吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991910330370', '1424953365894311938', 17, 'P', '你是否相信参加储蓄是一种好办法?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043991977439234', '1424953365894311938', 18, 'N', '你的感情是否容易受到伤害?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992044548098', '1424953365894311938', 19, 'P', '你是否服用有奇特效果或是有危险性的药物?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992044548099', '1424953365894311938', 20, 'N', '你是否时常感到“极其厌烦”?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992174571521', '1424953365894311938', 21, 'L', '你曾多占多得别人的东西（甚至一针一线)吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992237486082', '1424953365894311938', 22, 'E', '如果条件允许，你喜欢经常外出（旅行）吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992304594945', '1424953365894311938', 23, 'P', '对你所喜欢的人，你是否为取乐开过过头的玩笑?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992371703809', '1424953365894311938', 24, 'N', '你是否常因“自罪感”而烦恼?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992438812673', '1424953365894311938', 25, 'L', '你是否有时候谈论一些你毫无所知的事情?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992501727233', '1424953365894311938', 26, 'E', '你是否宁愿看些书，而不想去会见别人?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992573030402', '1424953365894311938', 27, 'P', '有坏人想要害你吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992573030403', '1424953365894311938', 28, 'N', '你认为自己“神经过敏”吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992631750658', '1424953365894311938', 29, 'E', '你的朋友多吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992694665218', '1424953365894311938', 30, 'N', '你是个忧虑重重的人吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992761774082', '1424953365894311938', 31, 'L', '你在儿童时代是否立即听从大人的吩咐而毫无怨言?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992824688641', '1424953365894311938', 32, 'E', '你是一个无忧无虑逍遥自在的人吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992824688642', '1424953365894311938', 33, 'P', '有礼貌爱整洁对你很重要吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043992895991810', '1424953365894311938', 34, 'N', '你是否担心将会发生可怕的事情?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993030209538', '1424953365894311938', 35, 'E', '在结识新朋友时，你通常是主动的吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993093124097', '1424953365894311938', 36, 'N', '你觉得自己是个非常敏感的人吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993093124098', '1424953365894311938', 37, 'E', '和别人在一起的时候,你是否不常说话?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993160232962', '1424953365894311938', 38, 'P', '你是否认为结婚是个框框，应该废除?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993231536130', '1424953365894311938', 39, 'L', '你有时有点自吹自擂吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993294450689', '1424953365894311938', 40, 'E', '在一个沉闷的场合，你能给大家增添生气吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993361559553', '1424953365894311938', 41, 'P', '慢腾腾开车的司机是否使你讨厌?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993428668417', '1424953365894311938', 42, 'N', '你担心自己的健康吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993558691841', '1424953365894311938', 43, 'E', '你是否喜欢说笑话和谈论有趣的事情?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993625800706', '1424953365894311938', 44, 'P', '你是否觉得大多数事情对你都是无所谓的?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993688715266', '1424953365894311938', 45, 'L', '你小时候有过对父母鲁莽无礼的行为吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993755824129', '1424953365894311938', 46, 'E', '你喜欢和别人打成一片，整天相处在一起吗？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993831321601', '1424953365894311938', 47, 'N', '你失眠吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993890041857', '1424953365894311938', 48, 'L', '你饭前一定先洗手吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043993952956418', '1424953365894311938', 49, 'E', '当别人问你话时，你是否对答如流?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043994082979841', '1424953365894311938', 50, 'P', '你是否宁愿有富裕时间喜欢早点动身去赴约会?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043994150088706', '1424953365894311938', 51, 'N', '你经常无缘无故感到疲倦和无精打采吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:50', '2021-10-04 23:11:50');
INSERT INTO `edu_scale_subject` VALUES ('1445043994217197570', '1424953365894311938', 52, 'L', '在游戏或打牌时你曾经作弊吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994284306433', '1424953365894311938', 53, 'E', '你喜欢紧张的工作吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994347220993', '1424953365894311938', 54, 'N', '你时常觉得自己的生活很单调吗？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994410135554', '1424953365894311938', 55, 'L', '你曾经为了自己而利用过别人吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994477244418', '1424953365894311938', 56, 'E', '你是否参加的活动太多，已超过自己可能分配的时间?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994607267842', '1424953365894311938', 57, 'P', '是否有那么几个人时常躲着你?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994670182402', '1424953365894311938', 58, 'P', '你是否认为人们为保障自己的将来而精打细算、勤俭节约所费的时间太多了?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994737291265', '1424953365894311938', 59, 'N', '你是否曾想过去死?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994804400130', '1424953365894311938', 60, 'L', '若你确知不会被发现时，你会少付给人家钱吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994867314689', '1424953365894311938', 61, 'E', '你能使一个联欢会开得成功吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043994942812161', '1424953365894311938', 62, 'P', '你是否尽力使自己不粗鲁?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995068641281', '1424953365894311938', 63, 'N', '一件使你为难的事情过去之后，是否使你烦恼好久?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995131555842', '1424953365894311938', 64, 'L', '你曾否坚持要照你的想法去办事?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995198664705', '1424953365894311938', 65, 'P', '当你去乘火车时，你是否最后一分钟到达?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995265773569', '1424953365894311938', 66, 'N', '你是否容易紧张?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995332882434', '1424953365894311938', 67, 'N', '你常感到寂寞吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995399991298', '1424953365894311938', 68, 'L', '你的言行总是一致吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995462905858', '1424953365894311938', 69, 'P', '你有时喜欢玩弄动物吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995597123586', '1424953365894311938', 70, 'N', '有人对你或你的工作吹毛求疵时，是否容易伤害你的积极性?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995660038146', '1424953365894311938', 71, 'L', '你去卦约会或上班时，曾否迟到?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995727147009', '1424953365894311938', 72, 'E', '你是否喜欢在你的周围有许多热闹和高兴的事?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995857170433', '1424953365894311938', 73, 'P', '你愿意让别人怕你吗?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995924279298', '1424953365894311938', 74, 'N', '你是否有时兴致勃勃,有时却很懒散不想动弹?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043995991388161', '1424953365894311938', 75, 'L', '你有时会把今天应该做的事拖到明天吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996121411585', '1424953365894311938', 76, 'E', '别人是否认为你是生气勃勃的?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996188520449', '1424953365894311938', 77, 'P', '别人是否对你说过许多慌话?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996255629313', '1424953365894311938', 78, 'N', '你是否对有些事情易性急生气?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996322738178', '1424953365894311938', 79, 'L', '若你犯有错误你是否愿意承认?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996389847041', '1424953365894311938', 80, 'P', '你是一个整洁严谨、有条不紊的人吗?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996456955906', '1424953365894311938', 81, 'L', '在公园里或马路上，你是否总是把果皮或废纸扔到垃圾箱里?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996519870465', '1424953365894311938', 82, 'N', '遇到为难的事情你是否拿不定主意?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996658282498', '1424953365894311938', 83, 'L', '你是否有过随口骂人的时候?', '是', 0, '否', 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996717002754', '1424953365894311938', 84, 'N', '若你乘车或坐飞机外出时，你是否担心会碰撞或出意外?', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445043996779917313', '1424953365894311938', 85, 'E', '你是一个爱交往的人吗？', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-04 23:11:51', '2021-10-04 23:11:51');
INSERT INTO `edu_scale_subject` VALUES ('1445323329981390849', '1425400052131688449', 1, 'A', '我觉得闷闷不乐，情绪低沉', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330035916801', '1425400052131688449', 2, 'A', '我觉得一天之中早晨最好', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330103025666', '1425400052131688449', 3, 'A', '我一阵阵哭出来或觉得想哭', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330165940226', '1425400052131688449', 4, 'A', '我晚上睡眠不好', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330241437697', '1425400052131688449', 5, 'A', '我吃的跟平常一样多', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330295963650', '1425400052131688449', 6, 'A', '我与异性亲密接触时和以往一样感觉愉快', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330358878209', '1425400052131688449', 7, 'A', '我发觉我的体重在下降', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330425987074', '1425400052131688449', 8, 'A', '我有便秘的苦恼', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330493095938', '1425400052131688449', 9, 'A', '我心跳比平时快', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330560204802', '1425400052131688449', 10, 'A', '我无缘无故地感到疲乏', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330560204803', '1425400052131688449', 11, 'A', '我的头脑跟平常一样清楚', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:49', '2021-10-05 17:41:49');
INSERT INTO `edu_scale_subject` VALUES ('1445323330686033922', '1425400052131688449', 12, 'A', '我觉得经常做的事情并没有困难', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323330686033923', '1425400052131688449', 13, 'A', '我觉得不安而平静不下来', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323330753142786', '1425400052131688449', 14, 'A', '我对将来抱有希望', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323330820251650', '1425400052131688449', 15, 'A', '我比平常容易生气激动', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323330950275073', '1425400052131688449', 16, 'A', '我觉得作出决定是容易的', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323331017383937', '1425400052131688449', 17, 'A', '我觉得自己是个有用的人,有人需要我', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323331084492802', '1425400052131688449', 18, 'A', '我的生活过得很有意思', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323331084492803', '1425400052131688449', 19, 'A', '我认为如果我死了别人会生活得好些', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1445323331155795969', '1425400052131688449', 20, 'A', '平常感兴趣的事我仍然照样感兴趣', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-10-05 17:41:50', '2021-10-05 17:41:50');
INSERT INTO `edu_scale_subject` VALUES ('1446285429398618114', '1425706032405016577', 1, 'A', '食欲不振', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285429541224449', '1425706032405016577', 2, 'A', '恶心、胃口难受、肚子疼', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285429667053569', '1425706032405016577', 3, 'A', '容易拉肚子或便秘', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285429667053570', '1425706032405016577', 4, 'A', '关注心悸和脉搏', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285429801271297', '1425706032405016577', 5, 'A', '身体健康状况良好', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285429939683330', '1425706032405016577', 6, 'A', '牢骚和不满多', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285429998403585', '1425706032405016577', 7, 'A', '父母期望过高', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430073901058', '1425706032405016577', 8, 'A', '自己的过去和家庭是不幸的', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430195535873', '1425706032405016577', 9, 'A', '过于担心将来的事情', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430258450434', '1425706032405016577', 10, 'A', '不想见人', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430325559298', '1425706032405016577', 11, 'A', '觉得自己不是自己', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430392668161', '1425706032405016577', 12, 'A', '缺乏热情和积极性', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430459777025', '1425706032405016577', 13, 'A', '悲观', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430522691586', '1425706032405016577', 14, 'A', '思想不集中', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430593994753', '1425706032405016577', 15, 'A', '情绪起伏过大', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430719823874', '1425706032405016577', 16, 'A', '常常失眠', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430791127041', '1425706032405016577', 17, 'A', '头疼', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430854041601', '1425706032405016577', 18, 'A', '脖子、肩膀酸痛', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285430988259330', '1425706032405016577', 19, 'A', '胸疼憋闷', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431055368194', '1425706032405016577', 20, 'A', '总是朝气蓬勃的', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431189585921', '1425706032405016577', 21, 'A', '气量小', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431256694785', '1425706032405016577', 22, 'A', '爱操心', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431323803650', '1425706032405016577', 23, 'A', '焦躁不安', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431390912513', '1425706032405016577', 24, 'A', '容易动怒', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431458021378', '1425706032405016577', 25, 'A', '活着没意思', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431525130241', '1425706032405016577', 26, 'A', '对任何事都没有兴趣', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431592239105', '1425706032405016577', 27, 'A', '记忆力减退', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431659347969', '1425706032405016577', 28, 'A', '缺乏耐力', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431659347970', '1425706032405016577', 29, 'A', '缺乏决断能力', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431793565698', '1425706032405016577', 30, 'A', '过于依赖别人', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431856480257', '1425706032405016577', 31, 'A', '为脸红而苦恼', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431923589122', '1425706032405016577', 32, 'A', '口吃，声音发颤', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285431990697986', '1425706032405016577', 33, 'A', '身体忽冷忽热', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432057806850', '1425706032405016577', 34, 'A', '注意排尿和性器官', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432192024577', '1425706032405016577', 35, 'A', '心情开朗', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432326242306', '1425706032405016577', 36, 'A', '莫名其妙地不安', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432393351170', '1425706032405016577', 37, 'A', '一个人独处时感到不安', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432527568898', '1425706032405016577', 38, 'A', '缺乏自信心', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432607260674', '1425706032405016577', 39, 'A', '办事畏首畏尾', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:52', '2021-10-08 09:24:52');
INSERT INTO `edu_scale_subject` VALUES ('1446285432661786626', '1425706032405016577', 40, 'A', '容易被人误解', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285432724701185', '1425706032405016577', 41, 'A', '不相信别人', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285432858918914', '1425706032405016577', 42, 'A', '过于猜疑', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285432921833473', '1425706032405016577', 43, 'A', '厌恶交往', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285432988942338', '1425706032405016577', 44, 'A', '感到自卑', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433056051202', '1425706032405016577', 45, 'A', '杞人忧天', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433118965761', '1425706032405016577', 46, 'A', '身体倦乏', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433253183490', '1425706032405016577', 47, 'A', '一着急就出汗', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433387401218', '1425706032405016577', 48, 'A', '站起来就头晕', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433458704385', '1425706032405016577', 49, 'A', '有过失去意识，抽筋', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433521618946', '1425706032405016577', 50, 'A', '人缘好受欢迎', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433588727809', '1425706032405016577', 51, 'A', '过于拘泥', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433651642370', '1425706032405016577', 52, 'A', '为忧郁不决而苦恼', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433714556930', '1425706032405016577', 53, 'A', '对脏很在乎', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433781665794', '1425706032405016577', 54, 'A', '摆脱不了毫无意义的想法', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433915883521', '1425706032405016577', 55, 'A', '觉得自己有怪气味', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285433974603778', '1425706032405016577', 56, 'A', '别人在自己背后说坏话', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285434041712642', '1425706032405016577', 57, 'A', '总注意周围的人', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285434104627202', '1425706032405016577', 58, 'A', '在乎别人视线', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285434167541761', '1425706032405016577', 59, 'A', '觉得别人轻视自己', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285434234650626', '1425706032405016577', 60, 'A', '情绪容易被破坏', '是', 1, '否', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285434813464577', '1425706032405016577', 61, 'A', '至今为止，你感到在自身健康方面有问题吗?', '有', 1, '没有', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285435077705729', '1425706032405016577', 62, 'A', '曾经觉得心理卫生方面有问题吗?', '有', 1, '没有', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285435207729153', '1425706032405016577', 63, 'A', '至今为止,你曾经接受过心理卫生的咨询和治疗吗?', '有', 1, '没有', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1446285435270643713', '1425706032405016577', 64, 'A', '你有健康或心理卫生方面想要咨谁的问题吗?', '有', 1, '没有', 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, '2021-10-08 09:24:53', '2021-10-08 09:24:53');
INSERT INTO `edu_scale_subject` VALUES ('1459794323609534465', '1459786787397328897', 1, 'A', '我觉得闷闷不乐，情绪低沉', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794323718586370', '1459786787397328897', 2, 'A', '我觉得一天之中早晨最好', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794323785695234', '1459786787397328897', 3, 'A', '我一阵阵哭出来或觉得想哭', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794323848609794', '1459786787397328897', 4, 'A', '我晚上睡眠不好', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794323915718657', '1459786787397328897', 5, 'A', '我吃的跟平常一样多', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794323978633218', '1459786787397328897', 6, 'A', '我与异性亲密接触时和以往一样感觉愉快', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324112850946', '1459786787397328897', 7, 'A', '我发觉我的体重在下降', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324179959810', '1459786787397328897', 8, 'A', '我有便秘的苦恼', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324314177537', '1459786787397328897', 9, 'A', '我心跳比平时快', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324372897794', '1459786787397328897', 10, 'A', '我无缘无故地感到疲乏', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324440006657', '1459786787397328897', 11, 'A', '我的头脑跟平常一样清楚', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324507115521', '1459786787397328897', 12, 'A', '我觉得经常做的事情并没有困难', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324570030081', '1459786787397328897', 13, 'A', '我觉得不安而平静不下来', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324637138945', '1459786787397328897', 14, 'A', '我对将来抱有希望', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324771356673', '1459786787397328897', 15, 'A', '我比平常容易生气激动', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324834271233', '1459786787397328897', 16, 'A', '我觉得作出决定是容易的', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324897185793', '1459786787397328897', 17, 'A', '我觉得自己是个有用的人,有人需要我', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794324964294658', '1459786787397328897', 18, 'A', '我的生活过得很有意思', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794325027209217', '1459786787397328897', 19, 'A', '我认为如果我死了别人会生活得好些', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 1, '小部分时间(过去一周内，有1-2天有过这类情况)', 2, '相当多时间(过去一周内，3-4天有过这类情况)', 3, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 4, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');
INSERT INTO `edu_scale_subject` VALUES ('1459794325157232641', '1459786787397328897', 20, 'A', '平常感兴趣的事我仍然照样感兴趣', '没有或很少时间(过去一周内，出现这类情况的日子不超过一天)', 4, '小部分时间(过去一周内，有1-2天有过这类情况)', 3, '相当多时间(过去一周内，3-4天有过这类情况)', 2, '绝大部分或全部时间(过去一周内，有5-7天有过这类情况)', 1, 0, 0, 0, 0, 0, '2021-11-14 16:04:23', '2021-11-14 16:04:23');

-- ----------------------------
-- Table structure for member_focus
-- ----------------------------
DROP TABLE IF EXISTS `member_focus`;
CREATE TABLE `member_focus`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户关注记录id',
  `user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '点击关注用户id',
  `focus_user_id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关注用户id',
  `focus_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '关注状态（0表示已关注，1表示已取消关注）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_focus
-- ----------------------------
INSERT INTO `member_focus` VALUES ('1451882037455712257', '1439828722283794433', '1439828722283794433', 0, 0, '2021-10-23 20:03:47', '2022-01-11 12:49:35');
INSERT INTO `member_focus` VALUES ('1451885092557398018', '1439828722283794433', '1439828722283794435', 0, 0, '2021-10-23 20:15:55', '2022-03-14 15:19:49');
INSERT INTO `member_focus` VALUES ('1451885620527996929', '1439828722283794433', '1439828722283794436', 0, 0, '2021-10-23 20:18:01', '2021-10-23 20:18:01');
INSERT INTO `member_focus` VALUES ('1451886142899200002', '1439828722283794433', '1439828722283794437', 1, 0, '2021-10-23 20:20:06', '2021-10-23 20:40:16');
INSERT INTO `member_focus` VALUES ('1503584272697532418', '1502211201646481410', '1439828722283794433', 0, 0, '2022-03-15 12:10:01', '2022-03-15 12:10:01');
INSERT INTO `member_focus` VALUES ('1503584272697532419', '1502211201646481410', '1439828722283794433', 0, 0, '2022-03-15 12:10:01', '2022-03-15 12:10:01');
INSERT INTO `member_focus` VALUES ('1506969436367691777', '1439828722283794433', '1502246606873903105', 0, 0, '2022-03-24 20:21:26', '2022-03-24 20:21:35');

-- ----------------------------
-- Table structure for order_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `order_pay_log`;
CREATE TABLE `order_pay_log`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单日志记录唯一id',
  `order_no` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'UUID生成的唯一订单号',
  `pay_time` datetime(0) NOT NULL COMMENT '订单支付时间',
  `pay_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `total_fee` decimal(10, 2) NOT NULL COMMENT '支付金额（分）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scale_order
-- ----------------------------
DROP TABLE IF EXISTS `scale_order`;
CREATE TABLE `scale_order`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单记录唯一id',
  `order_no` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '利用UUID生成的唯一订单号',
  `scale_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买量表唯一id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买用户唯一id',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_fee` decimal(10, 2) NOT NULL COMMENT '订单金额（分）',
  `pay_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member`  (
  `id` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录信息唯一id',
  `openid` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号（账号）',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `sex` int(0) NULL DEFAULT 1 COMMENT '性别 0 男， 1 女',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sign` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `age` int(0) NOT NULL DEFAULT 0 COMMENT '年龄',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 代表正常，1代表被禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0代表未删除，1代表已删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1439828722283794433', NULL, '18582416628', 'c76133fda827c69efb2258ab2857b73c', '子秦', 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/08/10/9060f46f93984b5ca4d6c105d3f5a743file.png', '人不修为自己，天诛之，地灭之', 21, 0, 0, '2021-09-20 13:48:13', '2022-03-24 12:49:59');
INSERT INTO `ucenter_member` VALUES ('1439828722283794434', NULL, '19822907618', 'c76133fda827c69efb2258ab2857b73c', '凌云', 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/5eef572996354deab1f1f778537790d7file.png?versionId=CAEQFxiBgMCP8a2D4hciIGJlZjc2YzkzNmFlYTQ1YzFiNDdlYTUzZjhmZmJkNjNh', NULL, 0, 0, 0, '2021-10-02 19:50:47', '2021-10-02 19:50:50');
INSERT INTO `ucenter_member` VALUES ('1439828722283794435', NULL, '15583998392', 'c76133fda827c69efb2258ab2857b73c', '风吹起海棠', 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/4701818e1e12486bbb72ee17146b70b9file.png?versionId=CAEQFxiBgMCllbOD4hciIGM4ZWExZmFmMDYzNzQ2YzlhYzAzNWVmYWE1NTgzMjAw', NULL, 0, 0, 0, '2021-10-02 19:53:18', '2021-10-22 21:53:22');
INSERT INTO `ucenter_member` VALUES ('1439828722283794436', NULL, '15892701929', 'c76133fda827c69efb2258ab2857b73c', '霜寒', 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/09/19/418788f843fc4fe4a34adf67f16b3788file.png', NULL, 0, 0, 0, '2021-10-02 19:55:11', '2021-10-22 21:53:18');
INSERT INTO `ucenter_member` VALUES ('1439828722283794437', NULL, '19822907612', 'c76133fda827c69efb2258ab2857b73c', '无关风月', 1, 'https://recl-edu.oss-cn-beijing.aliyuncs.com/2021/10/02/4a7c770ceee943ce85acb5d307b11e93file.png?versionId=CAEQFxiBgMCV0rqD4hciIDVhZDdiZDFhZmNhOTQwNjk5ZmM5NGZiYTAyMTUwNmVk', NULL, 0, 0, 0, '2021-10-02 19:57:25', '2021-10-22 21:53:24');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : workflow

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 29/11/2024 11:02:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for history_logs
-- ----------------------------
DROP TABLE IF EXISTS `history_logs`;
CREATE TABLE `history_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `workflow_id` bigint UNSIGNED NOT NULL,
  `status` enum('success','failure') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `effected_rows` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `history_logs_workflow_id_foreign`(`workflow_id` ASC) USING BTREE,
  CONSTRAINT `history_logs_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history_logs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_11_28_100008_create_workflows_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_11_28_100517_create_workflow_conditions_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_11_28_101450_create_workflow_actions_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_11_28_102820_create_tasks_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_11_28_103533_create_history_logs_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('low','high','medium') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('inactive','active','completed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 'Task 1', 'low', 'active', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (2, 'Task 2', 'medium', 'inactive', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (3, 'Task 3', 'high', 'completed', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (4, 'Task 4', 'medium', 'active', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (5, 'Task 5', 'low', 'inactive', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (6, 'Task 6', 'low', 'active', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (7, 'Task 7', 'medium', 'completed', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (8, 'Task 8', 'high', 'active', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (9, 'Task 9', 'medium', 'inactive', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `tasks` VALUES (10, 'Task 10', 'low', 'active', '2024-11-29 07:02:06', '2024-11-29 07:02:06');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for workflow_actions
-- ----------------------------
DROP TABLE IF EXISTS `workflow_actions`;
CREATE TABLE `workflow_actions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `workflow_id` bigint UNSIGNED NOT NULL,
  `action_type` enum('update_field','log_message') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `workflow_actions_workflow_id_foreign`(`workflow_id` ASC) USING BTREE,
  CONSTRAINT `workflow_actions_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_actions
-- ----------------------------
INSERT INTO `workflow_actions` VALUES (1, 1, 'update_field', 'priority', 'high', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_actions` VALUES (2, 2, 'update_field', 'status', 'inactive', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_actions` VALUES (3, 3, 'update_field', 'status', 'active', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_actions` VALUES (4, 4, 'update_field', 'user_id', '3', '2024-11-29 07:02:07', '2024-11-29 07:02:07');
INSERT INTO `workflow_actions` VALUES (5, 5, 'log_message', NULL, 'This Message For Logging The Task 5', '2024-11-29 07:02:07', '2024-11-29 07:02:07');

-- ----------------------------
-- Table structure for workflow_conditions
-- ----------------------------
DROP TABLE IF EXISTS `workflow_conditions`;
CREATE TABLE `workflow_conditions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `workflow_id` bigint UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `operation` enum('<','>','=','<=','>=') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `workflow_conditions_workflow_id_foreign`(`workflow_id` ASC) USING BTREE,
  CONSTRAINT `workflow_conditions_workflow_id_foreign` FOREIGN KEY (`workflow_id`) REFERENCES `workflows` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_conditions
-- ----------------------------
INSERT INTO `workflow_conditions` VALUES (1, 1, 'status', '=', 'inactive', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_conditions` VALUES (2, 2, 'id', '=', '1', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_conditions` VALUES (3, 3, 'status', '=', 'high', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_conditions` VALUES (4, 4, 'priority', '=', 'high', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflow_conditions` VALUES (5, 5, 'id', '=', '5', '2024-11-29 07:02:07', '2024-11-29 07:02:07');

-- ----------------------------
-- Table structure for workflows
-- ----------------------------
DROP TABLE IF EXISTS `workflows`;
CREATE TABLE `workflows`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger_type` enum('manual','automated') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflows
-- ----------------------------
INSERT INTO `workflows` VALUES (1, 'Workflow1', 'manual', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflows` VALUES (2, 'Workflow2', 'manual', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflows` VALUES (3, 'Workflow3', 'manual', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflows` VALUES (4, 'Workflow4', 'manual', '2024-11-29 07:02:06', '2024-11-29 07:02:06');
INSERT INTO `workflows` VALUES (5, 'Workflow5', 'manual', '2024-11-29 07:02:07', '2024-11-29 07:02:07');

SET FOREIGN_KEY_CHECKS = 1;

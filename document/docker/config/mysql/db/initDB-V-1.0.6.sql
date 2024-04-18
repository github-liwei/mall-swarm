--
-- 创建配置数据库
--
DROP
database IF EXISTS `config-jdbc`;

create database `config-jdbc`;

DROP TABLE IF EXISTS `config-jdbc`.`properties`;

--
-- Table structure for table `properties`
--
CREATE TABLE `config-jdbc`.`properties`
(
    `id`          bigint                                          NOT NULL AUTO_INCREMENT,
    `key`        varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `value`      varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
    `application` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `profile`     varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `label`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 创建默认数据库
--
DROP
database IF EXISTS `housekeeping`;
create
database `housekeeping`;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `housekeeping`.`flyway_schema_history`;

CREATE TABLE `housekeeping`.`flyway_schema_history`
(
    `installed_rank` int           NOT NULL,
    `version`        varchar(50)            DEFAULT NULL,
    `description`    varchar(200)  NOT NULL,
    `type`           varchar(20)   NOT NULL,
    `script`         varchar(1000) NOT NULL,
    `checksum`       int                    DEFAULT NULL,
    `installed_by`   varchar(100)  NOT NULL,
    `installed_on`   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `execution_time` int           NOT NULL,
    `success`        tinyint(1) NOT NULL,
    PRIMARY KEY (`installed_rank`),
    KEY              `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `housekeeping`.`message`;

CREATE TABLE `housekeeping`.`message`
(
    `id`             bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`        varchar(32)  DEFAULT NULL,
    `title`          varchar(255) DEFAULT NULL COMMENT '标题',
    `content`        varchar(255) DEFAULT NULL COMMENT '具体内容',
    `link`           varchar(255) DEFAULT NULL COMMENT '连接',
    `message_status` int          DEFAULT NULL COMMENT '信息状态{未读0，已读1，删除2}',
    `info_from`      varchar(255) DEFAULT NULL COMMENT '来自',
    `created_by`     varchar(32)  DEFAULT NULL COMMENT '创建人',
    `created_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `updated_by`     varchar(32)  DEFAULT NULL COMMENT '更新人',
    `updated_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息表';

--
-- Table structure for table `t_customization`
--

DROP TABLE IF EXISTS `housekeeping`.`t_customization`;

CREATE TABLE `housekeeping`.`t_customization`
(
    `config_id`  bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
    `style_flag` tinyint                                                DEFAULT NULL COMMENT '主题标识',
    `store_name` varchar(50)                                            DEFAULT NULL COMMENT '店名',
    `tenant_id`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '租户标识',
    PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='租户配置表';

--
-- Table structure for table `t_housekeeper_service`
--

DROP TABLE IF EXISTS `housekeeping`.`t_housekeeper_service`;

CREATE TABLE `housekeeping`.`t_housekeeper_service`
(
    `id`            bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
    `service_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '服务名称',
    `service_desc`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '服务描述',
    `img_src`       varchar(500)                                            DEFAULT NULL COMMENT '图片地址',
    `created_by`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建人',
    `created_time`  datetime                                                DEFAULT NULL COMMENT '创建时间',
    `updated_by`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '更新人',
    `updated_time`  datetime                                                DEFAULT NULL COMMENT '更新时间',
    `servie_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT NULL COMMENT '服务状态',
    `delete_flag`   varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT '0' COMMENT '删除标志',
    `revision`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '乐观锁',
    `display_price` decimal(24, 6)                                          DEFAULT NULL COMMENT '服务展示价格',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='服务主表';

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `housekeeping`.`t_order`;

CREATE TABLE `housekeeping`.`t_order`
(
    `id`               int          NOT NULL AUTO_INCREMENT COMMENT '主键',
    `order_number`     varchar(255) NOT NULL COMMENT '订单号',
    `customer_id`      varchar(32)    DEFAULT NULL COMMENT '顾客ID',
    `customer_name`    varchar(32)    DEFAULT NULL COMMENT '顾客姓名',
    `customer_phone`   varchar(255)   DEFAULT NULL COMMENT '顾客电话',
    `sku_id`           int            DEFAULT NULL COMMENT '可选服务表sku_id',
    `price`            decimal(24, 6) DEFAULT NULL COMMENT '订单价格，服务中心获取',
    `appointment_time` datetime       DEFAULT NULL COMMENT '服务时间',
    `amount`           int            DEFAULT NULL COMMENT '数量',
    `remark`           varchar(255)   DEFAULT NULL COMMENT '备注',
    `service_detail`   mediumtext COMMENT '服务详情',
    `payment`          decimal(24, 6) DEFAULT NULL COMMENT '订单价格，价格乘以数量',
    `address`          varchar(255)   DEFAULT NULL COMMENT '服务地址',
    `status`           int            DEFAULT '1' COMMENT '状态，1：待接单，2：已完成，3：取消，4：进行中',
    `employee_id`      varchar(32)    DEFAULT NULL,
    `employee_name`    varchar(32)    DEFAULT NULL COMMENT '工人名称',
    `created_by`       varchar(90)    DEFAULT NULL COMMENT '创建人',
    `created_time`     datetime       DEFAULT NULL COMMENT '创建时间',
    `updated_by`       varchar(90)    DEFAULT NULL COMMENT '更新人',
    `updated_time`     datetime       DEFAULT NULL COMMENT '更新时间',
    `employee_phone`   varchar(255)   DEFAULT NULL COMMENT '工人电话',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

--
-- Table structure for table `t_service_option`
--

DROP TABLE IF EXISTS `housekeeping`.`t_service_option`;

CREATE TABLE `housekeeping`.`t_service_option`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT '选项ID',
    `specification_id` bigint NOT NULL COMMENT '规格ID',
    `name`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项名称',
    `created_by`       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建人',
    `created_time`     datetime                                                DEFAULT NULL COMMENT '创建时间',
    `updated_by`       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '更新人',
    `updated_time`     datetime                                                DEFAULT NULL COMMENT '更新时间',
    `revision`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '乐观锁',
    `delete_flag`      varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci   DEFAULT '0' COMMENT '删除标志',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='规格选项表';

--
-- Table structure for table `t_service_selection`
--

DROP TABLE IF EXISTS `housekeeping`.`t_service_selection`;

CREATE TABLE `housekeeping`.`t_service_selection`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '选集ID',
    `option_id`    bigint                                                 DEFAULT NULL COMMENT '选项ID',
    `sku_id`       bigint                                                 DEFAULT NULL COMMENT 'SKU_ID',
    `created_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    `created_time` datetime                                               DEFAULT NULL COMMENT '创建时间',
    `updated_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
    `updated_time` datetime                                               DEFAULT NULL COMMENT '更新时间',
    `revision`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
    `delete_flag`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT '0' COMMENT '删除标志',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='选集表';

--
-- Table structure for table `t_service_sku`
--

DROP TABLE IF EXISTS `housekeeping`.`t_service_sku`;

CREATE TABLE `housekeeping`.`t_service_sku`
(
    `id`           int NOT NULL AUTO_INCREMENT COMMENT '可选服务ID',
    `service_id`   int                                                    DEFAULT NULL COMMENT '服务ID',
    `price`        decimal(24, 6)                                         DEFAULT NULL COMMENT '价格',
    `created_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
    `created_time` datetime                                               DEFAULT NULL COMMENT '创建时间',
    `updated_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
    `updated_time` datetime                                               DEFAULT NULL COMMENT '更新时间',
    `revision`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
    `delete_flag`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT '0' COMMENT '删除标志',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='可选服务表(SKU)';

--
-- Table structure for table `t_service_specification`
--

DROP TABLE IF EXISTS `housekeeping`.`t_service_specification`;

CREATE TABLE `housekeeping`.`t_service_specification`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '规格ID',
    `service_id`   bigint                                                  DEFAULT NULL COMMENT '服务ID',
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规格名称',
    `created_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '创建人',
    `created_time` datetime                                                DEFAULT NULL COMMENT '创建时间',
    `updated_by`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '更新人',
    `updated_time` datetime                                                DEFAULT NULL COMMENT '更新时间',
    `revision`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  DEFAULT NULL COMMENT '乐观锁',
    `delete_flag`  varchar(1)                                              DEFAULT '0' COMMENT '删除标志',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='规格表';


--
-- Table structure for table `t_task`
--

DROP TABLE IF EXISTS `housekeeping`.`t_task`;

CREATE TABLE `housekeeping`.`t_task`
(
    `id`               bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `customer_id`      varchar(36)                                            DEFAULT NULL COMMENT '顾客id;用户中心上下文',
    `order_id`         bigint                                                 DEFAULT NULL COMMENT '订单id;订单中心上下文',
    `customer_name`    varchar(255)                                           DEFAULT NULL COMMENT '顾客名称',
    `customer_phone`   varchar(255)                                           DEFAULT NULL COMMENT '电话号码',
    `appointment_time` datetime                                               DEFAULT NULL COMMENT '服务时间',
    `address`          varchar(255)                                           DEFAULT NULL COMMENT '地址',
    `service_name`     varchar(255)                                           DEFAULT NULL COMMENT '服务名称;订单中心推送',
    `service_detail`   varchar(255)                                           DEFAULT NULL COMMENT '服务细节;订单中心推送',
    `salary`           decimal(24, 6)                                         DEFAULT NULL COMMENT '佣金,可通过支付金额得出',
    `employee_name`    varchar(255)                                           DEFAULT NULL COMMENT '雇佣名称',
    `amount`           int                                                    DEFAULT NULL COMMENT '订单数量',
    `employee_id`      varchar(32)                                            DEFAULT NULL COMMENT '雇佣id',
    `task_status`      varchar(255)                                           DEFAULT NULL COMMENT '任务状态',
    `created_by`       varchar(90)                                            DEFAULT NULL COMMENT '创建人',
    `created_time`     datetime                                               DEFAULT NULL COMMENT '创建时间',
    `updated_by`       varchar(90)                                            DEFAULT NULL COMMENT '更新人',
    `updated_time`     datetime                                               DEFAULT NULL COMMENT '更新时间',
    `delete_flag`      varchar(1)                                             DEFAULT '0' COMMENT '删除标志',
    `version`          varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
    `remark`           varchar(255)                                           DEFAULT NULL COMMENT '订单备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='任务表';

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `housekeeping`.`tenant`;

CREATE TABLE `housekeeping`.`tenant`
(
    `id`           bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `NAME`         varchar(32)  DEFAULT NULL COMMENT '租户',
    `NUMBER`       varchar(255) DEFAULT NULL COMMENT '统一社会信用码',
    `PHONE`        varchar(32)  DEFAULT NULL COMMENT '租户电话',
    `EMAIL`        varchar(32)  DEFAULT NULL COMMENT '租户邮箱',
    `CONTENT`      varchar(255) DEFAULT NULL COMMENT '具体内容',
    `TAG`          varchar(32)  DEFAULT NULL COMMENT '租户标识',
    `DOMAIN`       varchar(32)  DEFAULT NULL COMMENT '租户域名',
    `STATUS`       int          DEFAULT NULL COMMENT '租户状态{申请中，活跃，停业}',
    `CREATED_BY`   varchar(32)  DEFAULT NULL COMMENT '创建人',
    `CREATED_TIME` datetime     DEFAULT NULL COMMENT '创建时间',
    `UPDATED_BY`   varchar(32)  DEFAULT NULL COMMENT '更新人',
    `UPDATED_TIME` datetime     DEFAULT NULL COMMENT '更新时间',
    `tenant_id`    varchar(32)  DEFAULT NULL COMMENT '租户id',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户表';

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `housekeeping`.`user`;

CREATE TABLE `housekeeping`.`user`
(
    `id`              int                                                         NOT NULL AUTO_INCREMENT,
    `user_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         DEFAULT NULL,
    `USER_NAME`       varchar(255)                                                         DEFAULT NULL,
    `PASSWORD`        varchar(255)                                                         DEFAULT NULL,
    `USER_ROLE`       int                                                                  DEFAULT NULL,
    `DEFAULT_ADDRESS` varchar(255)                                                         DEFAULT NULL,
    `PHONE_NO`        varchar(255)                                                         DEFAULT NULL,
    `CREATED_BY`      varchar(32)                                                          DEFAULT NULL COMMENT '创建人',
    `CREATED_TIME`    datetime                                                             DEFAULT NULL COMMENT '创建时间',
    `UPDATED_BY`      varchar(32)                                                          DEFAULT NULL COMMENT '更新人',
    `UPDATED_TIME`    datetime                                                             DEFAULT NULL COMMENT '更新时间',
    `EMAIL`           varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci            DEFAULT NULL COMMENT '???',
    `ID_CARD`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci        DEFAULT NULL,
    `ACCOUNT_TYPE`    smallint                                                    NOT NULL DEFAULT '1',
    `delete_flag`     varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`, `delete_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

--
-- 创建默认迁移的数据库
--
DROP
database IF EXISTS `saas-housekeeper-flyway`;
create
database `saas-housekeeper-flyway`;


DROP
database IF EXISTS `housekeeperdb`;

create database `housekeeperdb`;


-- housekeeperdb.flyway_schema_history definition

CREATE TABLE `housekeeperdb`.`flyway_schema_history` (
                                                         `installed_rank` int NOT NULL,
                                                         `version` varchar(50) DEFAULT NULL,
                                                         `description` varchar(200) NOT NULL,
                                                         `type` varchar(20) NOT NULL,
                                                         `script` varchar(1000) NOT NULL,
                                                         `checksum` int DEFAULT NULL,
                                                         `installed_by` varchar(100) NOT NULL,
                                                         `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                                         `execution_time` int NOT NULL,
                                                         `success` tinyint(1) NOT NULL,
                                                         PRIMARY KEY (`installed_rank`),
                                                         KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- housekeeperdb.register_record definition

CREATE TABLE `housekeeperdb`.`register_record` (
                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                   `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '邮箱地址',
                                   `delete_flag` tinyint DEFAULT '0' COMMENT '0:未删除 1:已删除',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- housekeeperdb.message definition

CREATE TABLE `housekeeperdb`.`message` (
                                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                           `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                           `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标题',
                                           `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '具体内容',
                                           `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '连接',
                                           `message_status` int DEFAULT NULL COMMENT '信息状态{未读，已读，删除}',
                                           `info_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '来自',
                                           `created_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
                                           `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                           `updated_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
                                           `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1496457136163442691 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='消息表';


-- housekeeperdb.properties definition

CREATE TABLE `housekeeperdb`.`properties` (
                                              `id` bigint NOT NULL AUTO_INCREMENT,
                                              `key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
                                              `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
                                              `application` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
                                              `profile` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
                                              `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
                                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- housekeeperdb.t_customization definition

CREATE TABLE `housekeeperdb`.`t_customization` (
                                                   `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
                                                   `style_flag` tinyint DEFAULT NULL COMMENT '主题标识',
                                                   `store_name` varchar(50) DEFAULT NULL COMMENT '店名',
                                                   `tenant_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '租户标识',
                                                   PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='租户配置表';


-- housekeeperdb.t_housekeeper_service definition

CREATE TABLE `housekeeperdb`.`t_housekeeper_service` (
                                                         `id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
                                                         `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '服务名称',
                                                         `service_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '服务描述',
                                                         `img_src` varchar(500) DEFAULT NULL COMMENT '图片地址',
                                                         `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
                                                         `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                         `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
                                                         `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                         `servie_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '服务状态',
                                                         `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志',
                                                         `revision` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                         `display_price` decimal(24,6) DEFAULT NULL COMMENT '服务展示价格',
                                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1402556441 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务主表';


-- housekeeperdb.t_order definition

CREATE TABLE `housekeeperdb`.`t_order` (
                                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                                           `order_number` varchar(255) NOT NULL COMMENT '订单号',
                                           `customer_id` varchar(32) DEFAULT NULL COMMENT '顾客ID',
                                           `customer_name` varchar(32) DEFAULT NULL COMMENT '顾客姓名',
                                           `customer_phone` varchar(255) DEFAULT NULL COMMENT '顾客电话',
                                           `sku_id` int DEFAULT NULL COMMENT '可选服务表sku_id',
                                           `price` decimal(24,6) DEFAULT NULL COMMENT '订单价格，服务中心获取',
                                           `appointment_time` datetime DEFAULT NULL COMMENT '服务时间',
                                           `amount` int DEFAULT NULL COMMENT '数量',
                                           `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                                           `service_detail` mediumtext COMMENT '服务细节，服务中心获取',
                                           `payment` decimal(24,6) DEFAULT NULL COMMENT '订单价格，价格乘以数量',
                                           `address` varchar(255) DEFAULT NULL COMMENT '服务地址',
                                           `status` int DEFAULT NULL COMMENT '状态',
                                           `employee_id` varchar(32) DEFAULT NULL,
                                           `employee_name` varchar(32) DEFAULT NULL COMMENT '工人名称',
                                           `employee_phone` varchar(255) DEFAULT NULL COMMENT '工人电话',
                                           `service_img` varchar(255) DEFAULT NULL COMMENT '服务图片',
                                           `created_by` varchar(90) DEFAULT NULL COMMENT '创建人',
                                           `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                           `updated_by` varchar(90) DEFAULT NULL COMMENT '更新人',
                                           `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';


-- housekeeperdb.t_service_option definition

CREATE TABLE `housekeeperdb`.`t_service_option` (
                                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选项ID',
                                                    `specification_id` bigint NOT NULL COMMENT '规格ID',
                                                    `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '选项名称',
                                                    `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
                                                    `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                    `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
                                                    `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                    `revision` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                    `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志',
                                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='规格选项表';


-- housekeeperdb.t_service_selection definition

CREATE TABLE `housekeeperdb`.`t_service_selection` (
                                                       `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选集ID',
                                                       `option_id` bigint DEFAULT NULL COMMENT '选项ID',
                                                       `sku_id` bigint DEFAULT NULL COMMENT 'SKU_ID',
                                                       `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
                                                       `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                       `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
                                                       `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                       `revision` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                       `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志',
                                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='选集表';


-- housekeeperdb.t_service_sku definition

CREATE TABLE `housekeeperdb`.`t_service_sku` (
                                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '可选服务ID',
                                                 `service_id` int DEFAULT NULL COMMENT '服务ID',
                                                 `price` decimal(24,6) DEFAULT NULL COMMENT '价格',
                                                 `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
                                                 `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                 `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
                                                 `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                 `revision` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                 `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志',
                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='可选服务表(SKU)';


-- housekeeperdb.t_service_specification definition

CREATE TABLE `housekeeperdb`.`t_service_specification` (
                                                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '规格ID',
                                                           `service_id` bigint DEFAULT NULL COMMENT '服务ID',
                                                           `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规格名称',
                                                           `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
                                                           `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                           `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人',
                                                           `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                           `revision` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                           `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标志',
                                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=810397703 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='规格表';


-- housekeeperdb.t_task definition

CREATE TABLE `housekeeperdb`.`t_task` (
                                          `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                          `customer_id` varchar(36) DEFAULT NULL COMMENT '顾客id;用户中心上下文',
                                          `order_id` bigint DEFAULT NULL COMMENT '订单id;订单中心上下文',
                                          `customer_name` varchar(255) DEFAULT NULL COMMENT '顾客名称',
                                          `customer_phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
                                          `appointment_time` datetime DEFAULT NULL COMMENT '服务时间',
                                          `address` varchar(255) DEFAULT NULL COMMENT '地址',
                                          `service_name` varchar(255) DEFAULT NULL COMMENT '服务名称;订单中心推送',
                                          `service_detail` varchar(255) DEFAULT NULL COMMENT '服务细节;订单中心推送',
                                          `salary` decimal(24,6) DEFAULT NULL COMMENT '佣金,可通过支付金额得出',
                                          `employee_name` varchar(255) DEFAULT NULL COMMENT '雇佣名称',
                                          `amount` int DEFAULT NULL COMMENT '订单数量',
                                          `employee_id` varchar(32) DEFAULT NULL COMMENT '雇佣id',
                                          `task_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
                                          `created_by` varchar(90) DEFAULT NULL COMMENT '创建人',
                                          `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                          `updated_by` varchar(90) DEFAULT NULL COMMENT '更新人',
                                          `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                          `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标志',
                                          `version` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'UUID()' COMMENT '乐观锁',
                                          `remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5043 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='任务表';


-- housekeeperdb.tenant definition

CREATE TABLE `housekeeperdb`.`tenant` (
                                          `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                          `NAME` varchar(32) DEFAULT NULL COMMENT '租户',
                                          `NUMBER` varchar(255) DEFAULT NULL COMMENT '统一社会信用码',
                                          `PHONE` varchar(32) DEFAULT NULL COMMENT '租户电话',
                                          `EMAIL` varchar(32) DEFAULT NULL COMMENT '租户邮箱',
                                          `CONTENT` varchar(255) DEFAULT NULL COMMENT '具体内容',
                                          `TAG` varchar(32) DEFAULT NULL COMMENT '租户标识',
                                          `DOMAIN` varchar(32) DEFAULT NULL COMMENT '租户域名',
                                          `STATUS` int DEFAULT NULL COMMENT '租户状态{申请中，活跃，停业}',
                                          `CREATED_BY` varchar(32) DEFAULT NULL COMMENT '创建人',
                                          `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
                                          `UPDATED_BY` varchar(32) DEFAULT NULL COMMENT '更新人',
                                          `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
                                          `tenant_id` varchar(32) DEFAULT NULL COMMENT '租户id',
                                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307814576 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息表';


-- housekeeperdb.`user` definition

CREATE TABLE `housekeeperdb`.`user` (
                                        `id` int NOT NULL AUTO_INCREMENT,
                                        `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                        `USER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                        `PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                        `USER_ROLE` int DEFAULT NULL,
                                        `DEFAULT_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                        `PHONE_NO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
                                        `CREATED_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
                                        `CREATED_TIME` datetime DEFAULT NULL COMMENT '创建时间',
                                        `UPDATED_BY` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
                                        `UPDATED_TIME` datetime DEFAULT NULL COMMENT '更新时间',
                                        `EMAIL` varchar(100) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL COMMENT '???',
                                        `ID_CARD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                        `ACCOUNT_TYPE` smallint DEFAULT '1',
                                        `test` varchar(255) NOT NULL,
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1860849668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';


DROP TABLE IF EXISTS `t_service_image`;

-- housekeeperdb.t_service_image definition

CREATE TABLE `t_service_image` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图片id',
  `service_id` varchar(100) DEFAULT NULL COMMENT '服务id',
  `image_name` varchar(200) NOT NULL COMMENT '图片名称',
  `type` varchar(100) NOT NULL COMMENT '图片类型',
  `content` mediumblob NOT NULL COMMENT '图片二进制',
  `created_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(100) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
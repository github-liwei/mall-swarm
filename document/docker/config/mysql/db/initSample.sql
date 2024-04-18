INSERT INTO `config-jdbc`.properties
( `key`, `value`, application, profile, label)
VALUES( 'spring.schema.tenant-map.sample', 'tenant_cf7e92055fce4287873e2d4g34fcf2a1', 'application', 'local', 'master');


INSERT INTO housekeeperdb.tenant
( NAME, `NUMBER`, PHONE, EMAIL, CONTENT, TAG, `DOMAIN`, STATUS, CREATED_BY, CREATED_TIME, UPDATED_BY, UPDATED_TIME, tenant_id)
VALUES( 'sample', 'sample', '16666666666', 'housekeeper@huawei-partners.com', 'sample', NULL, 'sample', 2, 'admin', '2023-02-16 03:13:19.000', 'admin', '2023-02-16 03:14:02.000', 'ff3e28f959b440699685d9db6f77e93f');

create database tenant_cf7e92055fce4287873e2d4g34fcf2a1;

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`flyway_schema_history` (
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

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`message` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1625819315881226242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='消息表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_customization` (
                                                                           `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '配置ID',
                                                                           `style_flag` tinyint DEFAULT NULL COMMENT '主题标识',
                                                                           `store_name` varchar(50) DEFAULT NULL COMMENT '店名',
                                                                           `tenant_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '租户标识',
                                                                           PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COMMENT='租户配置表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_housekeeper_service` (
                                                                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '服务ID',
                                                                                 `service_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '服务名称',
                                                                                 `service_desc` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '服务描述',
                                                                                 `img_src` varchar(500) DEFAULT NULL COMMENT '图片地址',
                                                                                 `created_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
                                                                                 `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                                                 `updated_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
                                                                                 `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                                                 `servie_status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '服务状态',
                                                                                 `delete_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志',
                                                                                 `revision` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                                                 `display_price` decimal(24,6) DEFAULT NULL COMMENT '服务展示价格',
                                                                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1402556440 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='服务主表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_order` (
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
                                                                   `order_time` datetime DEFAULT NULL COMMENT '接单时间',
                                                                   `completion_time` datetime DEFAULT NULL COMMENT '完成时间',
                                                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_service_option` (
                                                                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选项ID',
                                                                            `specification_id` bigint NOT NULL COMMENT '规格ID',
                                                                            `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '选项名称',
                                                                            `created_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
                                                                            `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                                            `updated_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
                                                                            `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                                            `revision` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                                            `delete_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志',
                                                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='规格选项表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_service_selection` (
                                                                               `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选集ID',
                                                                               `option_id` bigint DEFAULT NULL COMMENT '选项ID',
                                                                               `sku_id` bigint DEFAULT NULL COMMENT 'SKU_ID',
                                                                               `created_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
                                                                               `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                                               `updated_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
                                                                               `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                                               `revision` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                                               `delete_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志',
                                                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='选集表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_service_sku` (
                                                                         `id` int NOT NULL AUTO_INCREMENT COMMENT '可选服务ID',
                                                                         `service_id` int DEFAULT NULL COMMENT '服务ID',
                                                                         `price` decimal(24,6) DEFAULT NULL COMMENT '价格',
                                                                         `created_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
                                                                         `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                                         `updated_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
                                                                         `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                                         `revision` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                                         `delete_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志',
                                                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='可选服务表(SKU)';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_service_specification` (
                                                                                   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '规格ID',
                                                                                   `service_id` bigint DEFAULT NULL COMMENT '服务ID',
                                                                                   `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '规格名称',
                                                                                   `created_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
                                                                                   `created_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                                                   `updated_by` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
                                                                                   `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
                                                                                   `revision` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '乐观锁',
                                                                                   `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标志',
                                                                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=810397708 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='规格表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`t_task` (
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
                                                                  `version` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'UUID()' COMMENT '乐观锁',
                                                                  `remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
                                                                  PRIMARY KEY (`id`) USING BTREE,
                                                                  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5424 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='任务表';

CREATE TABLE tenant_cf7e92055fce4287873e2d4g34fcf2a1.`user` (
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
                                                                `EMAIL` varchar(100) DEFAULT NULL COMMENT '邮箱',
                                                                `ID_CARD` varchar(255) DEFAULT NULL COMMENT '工人身份证',
                                                                `ACCOUNT_TYPE` smallint DEFAULT '1',
                                                                `delete_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
                                                                PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1860849669 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';


-- flyway

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.flyway_schema_history (installed_rank,version,description,`type`,script,checksum,installed_by,installed_on,execution_time,success) VALUES
(0,NULL,'<< Flyway Schema Creation >>','SCHEMA','`tenant_cf7e92055fce4287873e2d4g34fcf2a1`',NULL,'root','2023-02-15 19:13:56.000',0,1)
                                                                                                                                                                                            ,(1,'20220307194308','create order','SQL','V20220307194308__create_order.sql',-1035822404,'root','2023-02-15 19:13:56.000',99,1)
                                                                                                                                                                                            ,(2,'20220308093212','create housekeeper service','SQL','V20220308093212__create_housekeeper_service.sql',-1903357269,'root','2023-02-15 19:13:56.000',225,1)
                                                                                                                                                                                            ,(3,'20220308093303','create service option','SQL','V20220308093303__create_service_option.sql',-831196736,'root','2023-02-15 19:13:58.000',1263,1)
                                                                                                                                                                                            ,(4,'20220308093341','create service selection','SQL','V20220308093341__create_service_selection.sql',245589254,'root','2023-02-15 19:13:59.000',1100,1)
                                                                                                                                                                                            ,(5,'20220308093410','create service sku','SQL','V20220308093410__create_service_sku.sql',-2027398853,'root','2023-02-15 19:13:59.000',47,1)
                                                                                                                                                                                            ,(6,'20220308093520','create service specification','SQL','V20220308093520__create_service_specification.sql',1387716657,'root','2023-02-15 19:13:59.000',100,1)
                                                                                                                                                                                            ,(7,'20220308093544','create user','SQL','V20220308093544__create_user.sql',1157910310,'root','2023-02-15 19:13:59.000',38,1)
                                                                                                                                                                                            ,(8,'20220308093602','create task','SQL','V20220308093602__create_task.sql',-1177808710,'root','2023-02-15 19:13:59.000',38,1)
                                                                                                                                                                                            ,(9,'20220308093625','create customization','SQL','V20220308093625__create_customization.sql',-1761855520,'root','2023-02-15 19:13:59.000',36,1)
;
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.flyway_schema_history (installed_rank,version,description,`type`,script,checksum,installed_by,installed_on,execution_time,success) VALUES
(10,'20220308093648','create message','SQL','V20220308093648__create_message.sql',-2091067213,'root','2023-02-15 19:13:59.000',60,1)
                                                                                                                                                                                            ,(11,'20220309174147','update order 1.0.0','SQL','V20220309174147__update_order_1.0.0.sql',-852478935,'root','2023-02-15 19:13:59.000',7,1)
                                                                                                                                                                                            ,(12,'20220314181158','update order 1.0.1','SQL','V20220314181158__update_order_1.0.1.sql',1561103948,'root','2023-02-15 19:14:00.000',326,1)
                                                                                                                                                                                            ,(13,'20220317095524','insert user 1.0.0','SQL','V20220317095524__insert_user_1.0.0.sql',1309844765,'root','2023-02-15 19:14:00.000',10,1)
                                                                                                                                                                                            ,(14,'20220322142728','alter user 1.0.0','SQL','V20220322142728__alter_user_1.0.0.sql',-658916112,'root','2023-02-15 19:14:00.000',125,1)
                                                                                                                                                                                            ,(15,'20220328093026','alter publish service 1.0.0','SQL','V20220328093026__alter_publish_service_1.0.0.sql',623667885,'root','2023-02-15 19:14:01.000',644,1)
                                                                                                                                                                                            ,(16,'20220328093215','alter order 1.0.0','SQL','V20220328093215__alter_order_1.0.0.sql',227902324,'root','2023-02-15 19:14:01.000',111,1)
                                                                                                                                                                                            ,(17,'20220328101911','alter order 1.0.1','SQL','V20220328101911__alter_order_1.0.1.sql',-1853415007,'root','2023-02-15 19:14:01.000',77,1)
                                                                                                                                                                                            ,(18,'20220329091139','alter task 1.0.0','SQL','V20220329091139__alter_task_1.0.0.sql',-536872399,'root','2023-02-15 19:14:01.000',80,1)
                                                                                                                                                                                            ,(19,'20220331150142','alter user 1.0.1','SQL','V20220331150142__alter_user_1.0.1.sql',-1886336107,'root','2023-02-15 19:14:01.000',75,1)
;
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.flyway_schema_history (installed_rank,version,description,`type`,script,checksum,installed_by,installed_on,execution_time,success) VALUES
(20,'20220331194611','alter user 1.0.2','SQL','V20220331194611__alter_user_1.0.2.sql',-1828482627,'root','2023-02-15 19:14:01.000',74,1)
                                                                                                                                                                                            ,(21,'20220402104139','alter user 1.0.3','SQL','V20220402104139__alter_user_1.0.3.sql',290966770,'root','2023-02-15 19:14:01.000',27,1)
                                                                                                                                                                                            ,(22,'20220402130729','update order 1.0.2','SQL','V20220402130729__update_order_1.0.2.sql',1437849708,'root','2023-02-15 19:14:01.000',4,1)
                                                                                                                                                                                            ,(23,'20220402152010','update user 1.0.4','SQL','V20220402152010__update_user_1.0.4.sql',-932778009,'root','2023-02-15 19:14:01.000',4,1)
                                                                                                                                                                                            ,(24,'20220402152635','update user 1.0.5','SQL','V20220402152635__update_user_1.0.5.sql',-212117549,'root','2023-02-15 19:14:01.000',8,1)
                                                                                                                                                                                            ,(25,'20220406095200','alter user 1.0.6','SQL','V20220406095200__alter_user_1.0.6.sql',-14868782,'root','2023-02-15 19:14:02.000',8,1)
                                                                                                                                                                                            ,(26,'20220424153303','alter task 1.01','SQL','V20220424153303__alter_task_1.01.sql',217815850,'root','2023-02-15 19:14:02.000',100,1)
                                                                                                                                                                                            ,(27,'20220427192052','alter order 1.0.2','SQL','V20220427192052__alter_order_1.0.2.sql',312926916,'root','2023-02-15 19:14:02.000',594,1);

-- init Sample Data

-- t_housekeeper_service

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_housekeeper_service
(id, service_name, service_desc, img_src, created_by, created_time, updated_by, updated_time, servie_status, delete_flag, revision, display_price)
VALUES(1402556436, '家庭保洁', '清扫室内外环境，消毒、清洁家具、地板、窗户等，以及高温消毒等', NULL, 'admin', '2023-02-16 06:40:28.000', 'admin', '2023-02-16 05:26:16.000', '0', '0', NULL, 78.000000);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_housekeeper_service
(id, service_name, service_desc, img_src, created_by, created_time, updated_by, updated_time, servie_status, delete_flag, revision, display_price)
VALUES(1402556437, '家电清洗', '清洗家用电器，如空调、洗衣机、冰箱等，以及室内外排气管道等', NULL, 'admin', '2023-02-16 06:43:07.000', 'admin', '2023-02-16 05:25:53.000', '0', '0', NULL, 88.000000);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_housekeeper_service
(id, service_name, service_desc, img_src, created_by, created_time, updated_by, updated_time, servie_status, delete_flag, revision, display_price)
VALUES(1402556438, '家居维修', '包括家具、水管、灯具等家居设备的维修，以及电线检查、换电灯泡等', NULL, 'admin', '2023-02-16 06:47:00.000', 'admin', '2023-02-16 05:25:26.000', '0', '0', NULL, 99.000000);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_housekeeper_service
(id, service_name, service_desc, img_src, created_by, created_time, updated_by, updated_time, servie_status, delete_flag, revision, display_price)
VALUES(1402556439, '搬家服务', '搬运家具、电器以及其他家具设备，帮助客户安置好新住所。5. 家政顾问：为客户提供全面的家政管理咨询服务，指导客户正确处理家务事', NULL, 'admin', '2023-02-16 06:49:34.000', 'admin', '2023-02-16 05:24:48.000', '0', '0', NULL, 168.000000);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_housekeeper_service
(id, service_name, service_desc, img_src, created_by, created_time, updated_by, updated_time, servie_status, delete_flag, revision, display_price)
VALUES(1402556440, '宠物服务', '为客户提供宠物保姆服务，包括洗澡、修剪毛发、护理等', NULL, 'admin', '2023-02-16 06:51:42.000', 'admin', '2023-02-16 05:23:36.000', '0', '0', NULL, 199.000000);


-- service specification

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_specification
(id, service_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(810397731, 1402556440, '服务类型', 'admin', '2023-02-16 05:23:17.000', 'admin', '2023-02-16 05:23:17.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_specification
(id, service_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(810397732, 1402556439, '距离', 'admin', '2023-02-16 05:24:18.000', 'admin', '2023-02-16 05:24:18.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_specification
(id, service_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(810397733, 1402556438, '室内外', 'admin', '2023-02-16 05:25:12.000', 'admin', '2023-02-16 05:25:12.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_specification
(id, service_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(810397734, 1402556437, '型号', 'admin', '2023-02-16 05:25:40.000', 'admin', '2023-02-16 05:25:40.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_specification
(id, service_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(810397735, 1402556436, '时常', 'admin', '2023-02-16 05:26:06.000', 'admin', '2023-02-16 05:26:06.000', NULL, '0');

-- sku

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(120, 1402556440, 99.000000, 'admin', '2023-02-16 05:23:22.000', 'admin', '2023-02-16 05:23:22.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(121, 1402556440, 89.000000, 'admin', '2023-02-16 05:23:30.000', 'admin', '2023-02-16 05:23:30.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(122, 1402556440, 77.000000, 'admin', '2023-02-16 05:23:35.000', 'admin', '2023-02-16 05:23:35.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(123, 1402556439, 68.000000, 'admin', '2023-02-16 05:24:24.000', 'admin', '2023-02-16 05:24:47.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(124, 1402556439, 187.000000, 'admin', '2023-02-16 05:24:28.000', 'admin', '2023-02-16 05:24:41.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(125, 1402556439, 267.000000, 'admin', '2023-02-16 05:24:36.000', 'admin', '2023-02-16 05:24:36.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(126, 1402556438, 100.000000, 'admin', '2023-02-16 05:25:17.000', 'admin', '2023-02-16 05:25:17.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(127, 1402556438, 300.000000, 'admin', '2023-02-16 05:25:24.000', 'admin', '2023-02-16 05:25:24.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(128, 1402556437, 199.000000, 'admin', '2023-02-16 05:25:48.000', 'admin', '2023-02-16 05:25:48.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(129, 1402556437, 99.000000, 'admin', '2023-02-16 05:25:52.000', 'admin', '2023-02-16 05:25:52.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(130, 1402556436, 99.000000, 'admin', '2023-02-16 05:26:11.000', 'admin', '2023-02-16 05:26:11.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_sku
(id, service_id, price, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(131, 1402556436, 198.000000, 'admin', '2023-02-16 05:26:15.000', 'admin', '2023-02-16 05:26:15.000', NULL, '0');

-- selection

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(197, 214, 118, 'admin', '2023-02-16 13:03:02.000', 'tenant', '2023-02-15 21:20:05.000', NULL, '1');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(198, 215, 119, 'admin', '2023-02-16 13:03:02.000', 'tenant', '2023-02-15 21:20:05.000', NULL, '1');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(199, 216, 120, 'admin', '2023-02-16 05:23:22.000', 'admin', '2023-02-16 05:23:22.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(200, 217, 121, 'admin', '2023-02-16 05:23:30.000', 'admin', '2023-02-16 05:23:30.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(201, 218, 122, 'admin', '2023-02-16 05:23:35.000', 'admin', '2023-02-16 05:23:35.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(202, 219, 123, 'admin', '2023-02-16 05:24:24.000', 'admin', '2023-02-16 05:24:47.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(203, 220, 124, 'admin', '2023-02-16 05:24:28.000', 'admin', '2023-02-16 05:24:41.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(204, 221, 125, 'admin', '2023-02-16 05:24:36.000', 'admin', '2023-02-16 05:24:36.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(205, 222, 126, 'admin', '2023-02-16 05:25:17.000', 'admin', '2023-02-16 05:25:17.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(206, 223, 127, 'admin', '2023-02-16 05:25:24.000', 'admin', '2023-02-16 05:25:24.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(207, 224, 128, 'admin', '2023-02-16 05:25:48.000', 'admin', '2023-02-16 05:25:48.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(208, 225, 129, 'admin', '2023-02-16 05:25:52.000', 'admin', '2023-02-16 05:25:52.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(209, 226, 130, 'admin', '2023-02-16 05:26:11.000', 'admin', '2023-02-16 05:26:11.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_selection
(id, option_id, sku_id, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(210, 227, 131, 'admin', '2023-02-16 05:26:15.000', 'admin', '2023-02-16 05:26:15.000', NULL, '0');


-- opt

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(169, 810397704, '2H', 'admin', '2023-02-16 06:40:50.000', 'admin', '2023-02-16 06:40:50.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(170, 810397704, '4H', 'admin', '2023-02-16 06:40:50.000', 'admin', '2023-02-16 06:40:50.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(171, 810397705, '初级', 'admin', '2023-02-16 06:41:23.000', 'admin', '2023-02-16 06:41:23.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(172, 810397705, '中级', 'admin', '2023-02-16 06:41:23.000', 'admin', '2023-02-16 06:41:23.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(173, 810397705, '高级', 'admin', '2023-02-16 06:41:23.000', 'admin', '2023-02-16 06:41:23.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(216, 810397731, '洗澡', 'admin', '2023-02-16 05:23:17.000', 'admin', '2023-02-16 05:23:17.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(217, 810397731, '修剪毛发', 'admin', '2023-02-16 05:23:17.000', 'admin', '2023-02-16 05:23:17.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(218, 810397731, '护理', 'admin', '2023-02-16 05:23:17.000', 'admin', '2023-02-16 05:23:17.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(219, 810397732, '1km-20km', 'admin', '2023-02-16 05:24:18.000', 'admin', '2023-02-16 05:24:18.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(220, 810397732, '20km-50km', 'admin', '2023-02-16 05:24:18.000', 'admin', '2023-02-16 05:24:18.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(221, 810397732, '50km-200km', 'admin', '2023-02-16 05:24:18.000', 'admin', '2023-02-16 05:24:18.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(222, 810397733, '室内', 'admin', '2023-02-16 05:25:12.000', 'admin', '2023-02-16 05:25:12.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(223, 810397733, '室外', 'admin', '2023-02-16 05:25:12.000', 'admin', '2023-02-16 05:25:12.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(224, 810397734, '大型', 'admin', '2023-02-16 05:25:40.000', 'admin', '2023-02-16 05:25:40.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(225, 810397734, '小型', 'admin', '2023-02-16 05:25:40.000', 'admin', '2023-02-16 05:25:40.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(226, 810397735, '2h', 'admin', '2023-02-16 05:26:06.000', 'admin', '2023-02-16 05:26:06.000', NULL, '0');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_service_option
(id, specification_id, name, created_by, created_time, updated_by, updated_time, revision, delete_flag)
VALUES(227, 810397735, '4h', 'admin', '2023-02-16 05:26:06.000', 'admin', '2023-02-16 05:26:06.000', NULL, '0');


-- customer

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_customization (style_flag,store_name,tenant_id) VALUES 
(2,NULL,'sample')
;

-- order

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(3, '1676445272881bba23a5f9099420791b8ed253aad1404', '597g0c1160e04a4680dcaf1656e97v35', '王丽丽', '12345123451', 88, 199.000000, '2023-02-02 02:00:00.000', 1, '时代印象12栋15楼1501', '{"serviceDesc":{"price":199.000000,"selections":[{"optionId":182,"optionName":"洗澡","selectionId":157,"specName":"服务类型"}],"servcieId":1402556440,"serviceDesc":"为客户提供宠物保姆服务，包括洗澡、修剪毛发、护理等","serviceName":"宠物服务","skuId":88}}', 199.000000, '上海长宁区城区保利时代印象12栋15楼1501', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 07:14:33.000', 'admin', '2023-02-16 07:14:33.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(4, '167644536888769b4af3d4a994a19805a397d03f971a8', 'a02a942a7e4a407280d9890416bc8835', '李冰冰', '12345123451', 89, 188.000000, '2023-02-15 07:00:00.000', 1, '云金纱6栋601', '{"serviceDesc":{"price":188.000000,"selections":[{"optionId":183,"optionName":"修剪毛发","selectionId":158,"specName":"服务类型"}],"servcieId":1402556440,"serviceDesc":"为客户提供宠物保姆服务，包括洗澡、修剪毛发、护理等","serviceName":"宠物服务","skuId":89}}', 188.000000, '上海崇明区长兴镇碧桂园云金纱6栋601', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 07:16:09.000', 'admin', '2023-02-16 07:16:09.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(5, '167644943349409e440db9e9940809774820aa92409a8', '597g0c1160e04a4680dcaf1656e97v35', '刘小云', '12345123451', 95, 200.000000, '2023-02-16 06:00:00.000', 1, '帝景豪庭13栋7楼702', '{"serviceDesc":{"price":200.000000,"selections":[{"optionId":189,"optionName":"1km-10km","selectionId":165,"specName":"距离"},{"optionId":191,"optionName":"大型","selectionId":166,"specName":"车型"}],"servcieId":1402556439,"serviceDesc":"搬运家具、电器以及其他家具设备，帮助客户安置好新住所。5. 家政顾问：为客户提供全面的家政管理咨询服务，指导客户正确处理家务事","serviceName":"搬家服务","skuId":95}}', 200.000000, '上海长宁区新泾镇帝景豪庭13栋7楼702', 4, '921ddc6e650448889ba12c4a0504852a', 'worker', '12345666666', NULL, 'admin', '2023-02-16 08:23:54.000', 'worker', '2023-02-16 08:24:32.000', '2023-02-16 08:24:32.000', NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(6, '16764495581275193909f60f343e1b93c7f2a3b1de684', '921ddc6e650448889ba12c4a0504852a', '张成功', '16543324211', 80, 100.000000, '2023-02-23 08:30:00.000', 1, '幸福花园1栋3楼201', '{"serviceDesc":{"price":100.000000,"selections":[{"optionId":168,"optionName":"室内","selectionId":149,"specName":"环境"}],"servcieId":1402556437,"serviceDesc":"清洗家用电器，如空调、洗衣机、冰箱等，以及室内外排气管道等","serviceName":"家电清洗","skuId":80}}', 100.000000, '重庆巴南区石龙镇幸福花园1栋3楼201', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:25:58.000', 'admin', '2023-02-16 08:25:58.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(7, '16764496836646edce4d719914a2083383f700bec862a', '921ddc6e650448889ba12c4a0504852a', '李建国', '12345123451', 74, 188.000000, '2023-02-22 11:30:00.000', 1, '幸福花园1栋3楼201', '{"serviceDesc":{"price":188.000000,"selections":[{"optionId":158,"optionName":"4H","selectionId":141,"specName":"时常"},{"optionId":160,"optionName":"中级","selectionId":142,"specName":"级别"}],"servcieId":1402556436,"serviceDesc":"清扫室内外环境，消毒、清洁家具、地板、窗户等，以及高温消毒等","serviceName":"家庭保洁","skuId":74}}', 188.000000, '北京石景山区广宁街道时代天逸8栋5楼501', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:28:04.000', 'admin', '2023-02-16 08:28:04.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(8, '167645012458063753477cdaa4ed58e2afc7066d142cf', '921ddc6e650448889ba12c4a0504852a', '张晓楠', '16666666661', 96, 198.000000, '2023-02-15 07:30:00.000', 1, '时代广场1栋5楼502', '{"serviceDesc":{"price":198.000000,"selections":[{"optionId":193,"optionName":"大型","selectionId":167,"specName":"类型"}],"servcieId":1402556438,"serviceDesc":"包括家具、水管、灯具等家居设备的维修，以及电线检查、换电灯泡等","serviceName":"家居维修","skuId":96}}', 198.000000, '河北保定市博野县博野区时代广场1栋5楼502', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:35:25.000', 'admin', '2023-02-16 08:35:25.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(9, '16764503208128bf3a300eb3b4e61b091f01b4c6cfc01', '921ddc6e650448889ba12c4a0504852a', '张楠楠', '16767676767', 99, 266.000000, '2023-02-23 02:00:00.000', 1, '珠江丽景9栋901', '{"serviceDesc":{"price":266.000000,"selections":[{"optionId":196,"optionName":"30km-100km","selectionId":170,"specName":"距离"}],"servcieId":1402556439,"serviceDesc":"搬运家具、电器以及其他家具设备，帮助客户安置好新住所。5. 家政顾问：为客户提供全面的家政管理咨询服务，指导客户正确处理家务事","serviceName":"搬家服务","skuId":99}}', 266.000000, '浙江嘉兴市海盐县海盐区珠江丽景9栋901', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:38:41.000', 'admin', '2023-02-16 08:38:41.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(10, '167645061570758730db108fb4211bf3aa97a5c29d2a3', '921ddc6e650448889ba12c4a0504852a', '赵钱', '13512345123', 102, 266.000000, '2023-02-25 05:00:00.000', 1, '保利公馆12栋1201', '{"serviceDesc":{"price":266.000000,"selections":[{"optionId":201,"optionName":"1km-30km","selectionId":174,"specName":"距离"},{"optionId":204,"optionName":"大型","selectionId":175,"specName":"车型"}],"servcieId":1402556439,"serviceDesc":"搬运家具、电器以及其他家具设备，帮助客户安置好新住所。5. 家政顾问：为客户提供全面的家政管理咨询服务，指导客户正确处理家务事","serviceName":"搬家服务","skuId":102}}', 266.000000, '广东东莞市常平镇保利公馆12栋1201', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:43:36.000', 'admin', '2023-02-16 08:43:36.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(11, '16764508122838c2a8db7140e451ca6524b3a99b1325d', '597g0c1160e04a4680dcaf1656e97v35', '张筱雨', '14567212341', 75, 222.000000, '2023-02-22 07:00:00.000', 1, '天河壹品8栋801', '{"serviceDesc":{"price":222.000000,"selections":[{"optionId":158,"optionName":"4H","selectionId":143,"specName":"时常"},{"optionId":161,"optionName":"高级","selectionId":144,"specName":"级别"}],"servcieId":1402556436,"serviceDesc":"清扫室内外环境，消毒、清洁家具、地板、窗户等，以及高温消毒等","serviceName":"家庭保洁","skuId":75}}', 222.000000, '湖南长沙市长沙县长沙县天河壹品8栋801', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:46:52.000', 'admin', '2023-02-16 08:46:52.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_order
(id, order_number, customer_id, customer_name, customer_phone, sku_id, price, appointment_time, amount, remark, service_detail, payment, address, status, employee_id, employee_name, employee_phone, service_img, created_by, created_time, updated_by, updated_time, order_time, completion_time)
VALUES(12, '16764510983289b3ceac59782471cbb146b2d000d5dda', '597g0c1160e04a4680dcaf1656e97v35', '王博', '15656565656', 91, 100.000000, '2023-02-21 10:00:00.000', 1, '花溪小镇1901', '{"serviceDesc":{"price":100.000000,"selections":[{"optionId":185,"optionName":"遛狗","selectionId":160,"specName":"服务类型"}],"servcieId":1402556440,"serviceDesc":"为客户提供宠物保姆服务，包括洗澡、修剪毛发、护理等","serviceName":"宠物服务","skuId":91}}', 100.000000, '山东德州市德城区德城区花溪小镇1901', 1, NULL, NULL, NULL, NULL, 'admin', '2023-02-16 08:51:38.000', 'admin', '2023-02-16 08:51:38.000', NULL, NULL);


-- message

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226242, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自asda的订单消息', '附近有宠物服务服务的派单，请留意!', NULL, 0, 'task', 'admin', '2023-02-16 07:14:34.000', 'admin', '2023-02-16 07:14:34.000');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226243, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自asd的订单消息', '附近有宠物服务服务的派单，请留意!', NULL, 0, 'task', 'admin', '2023-02-16 07:16:09.000', 'admin', '2023-02-16 07:16:09.000');
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226244, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自asdas的订单消息', '附近有搬家服务服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:23:54.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226245, '921ddc6e650448889ba12c4a0504852a', '抢单成功：搬家服务', '您好,【搬家服务】服务, 抢单成功!', NULL, 0, 'task', NULL, '2023-02-16 08:24:32.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226246, 'a02a942a7e4a407280d9890416bc8835', '抢单成功：搬家服务', '您的订单【搬家服务】, 雇员【worker】已接单!', NULL, 0, 'task', NULL, '2023-02-16 08:24:32.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226247, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自张成功的订单消息', '附近有家电清洗服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:25:58.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226248, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自李建国的订单消息', '附近有家庭保洁服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:28:04.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226249, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自张晓楠的订单消息', '附近有家居维修服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:35:25.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226250, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自张楠楠的订单消息', '附近有搬家服务服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:38:41.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226251, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自赵钱的订单消息', '附近有搬家服务服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:43:36.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226252, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自张筱雨的订单消息', '附近有家庭保洁服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:46:52.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625819315881226253, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自王博的订单消息', '附近有宠物服务服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 08:51:38.000', NULL, NULL);
INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.message
(id, user_id, title, content, link, message_status, info_from, created_by, created_time, updated_by, updated_time)
VALUES(1625854076066533377, '597g0c1160e04a4680dcaf1656e97v35', '任务大厅：来自啧啧啧的订单消息', '附近有宠物服务服务的派单，请留意!', NULL, 0, 'task', NULL, '2023-02-16 05:46:33.000', NULL, NULL);



--  user

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.`user` (user_id,USER_NAME,PASSWORD,USER_ROLE,DEFAULT_ADDRESS,PHONE_NO,CREATED_BY,CREATED_TIME,UPDATED_BY,UPDATED_TIME,EMAIL,ID_CARD,ACCOUNT_TYPE,delete_flag) VALUES
('597g0c1160e04a4680dcaf1656e97v35','tenant','$2a$10$Guddcyot46dC0ovhY.cbluMwSvZ5jmwQwQZH/rQp4MIRk/So1rEFi',3,NULL,NULL,NULL,NULL,NULL,NULL,'14640cg0@163.com','',3,'0')
,('a02a942a7e4a407280d9890416bc8835','customer','$2a$10$AVhhjUvrmhLDMq689z4lS.RYlRYZ3qVGWJm1HopF6X5IXCxrqjpM.',NULL,NULL,'16784564511','admin','2023-02-15 23:04:18.000','admin','2023-02-15 23:04:18.000','customer@outlook.com',NULL,1,'0')
,('921ddc6e650448889ba12c4a0504852a','worker','$2a$10$5uyOAnI6MLiwATmz4IgKdu4iKfsRR1dz/MZyx72sfJxksCCA3DDei',NULL,NULL,'12345666666','admin','2023-02-15 23:10:02.000','admin','2023-02-15 23:10:02.000',NULL,'420984199912121221',2,'0')
;

-- task

INSERT INTO tenant_cf7e92055fce4287873e2d4g34fcf2a1.t_task (customer_id,order_id,customer_name,customer_phone,appointment_time,address,service_name,service_detail,salary,employee_name,amount,employee_id,task_status,created_by,created_time,updated_by,updated_time,delete_flag,version,remark) VALUES
('597g0c1160e04a4680dcaf1656e97v35',2,'王丽丽','12345123451','2023-02-01 08:00:00.000','上海长宁区城区保利时代印象12栋15楼1501','宠物服务','{"selections":[{"specName":"服务类型","selection":"洗澡"}]}',199.000000,NULL,1,NULL,'waiting','admin','2023-02-15 23:14:34.000','admin','2023-02-15 23:14:34.000','0','f5b7f6a2abd34ae8b7183b7faa2fcf51','sdfsdf')
,('921ddc6e650448889ba12c4a0504852a',3,'李冰冰','12345123451','2023-02-14 08:00:00.000','上海崇明区长兴镇碧桂园云金纱6栋601','宠物服务','{"selections":[{"specName":"服务类型","selection":"修剪毛发"}]}',188.000000,NULL,1,NULL,'waiting','admin','2023-02-15 23:16:09.000','admin','2023-02-15 23:16:09.000','0','3577a72d473742b8b118ed984c8f2369','sadfsdf')
,('597g0c1160e04a4680dcaf1656e97v35',4,'刘小云','12345123451','2023-02-15 08:00:00.000','上海长宁区新泾镇帝景豪庭13栋7楼702','搬家服务','{"selections":[{"specName":"距离","selection":"1km-10km"},{"specName":"车型","selection":"大型"}]}',200.000000,'worker',1,'921ddc6e650448889ba12c4a0504852a','accept','admin','2023-02-16 00:23:54.000','admin','2023-02-16 00:24:32.000','0','2ebd9f3ead0a11edae7f0242ac120003','sdfsdf')
,('921ddc6e650448889ba12c4a0504852a',5,'张成功','16543324211','2023-02-22 02:04:00.000','重庆巴南区石龙镇幸福花园1栋3楼201','家电清洗','{"selections":[{"specName":"环境","selection":"室内"}]}',100.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:25:58.000','admin','2023-02-16 00:25:58.000','0','fb18fa6fc8d340cab58fcb7315951c05','')
,('921ddc6e650448889ba12c4a0504852a',6,'李建国','12345123451','2023-02-21 23:00:00.000','北京石景山区广宁街道时代天逸8栋5楼501','家庭保洁','{"selections":[{"specName":"时常","selection":"4H"},{"specName":"级别","selection":"中级"}]}',188.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:28:04.000','admin','2023-02-16 00:28:04.000','0','2c60bea814324c2aa198575649858b00','幸福花园1栋3楼201')
,('921ddc6e650448889ba12c4a0504852a',7,'张晓楠','16666666661','2023-02-14 23:30:00.000','河北保定市博野县博野区时代广场1栋5楼502','家居维修','{"selections":[{"specName":"类型","selection":"大型"}]}',198.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:35:25.000','admin','2023-02-16 00:35:25.000','0','149abd12a3a2462c887a21abc8645966','时代广场1栋5楼502')
,('921ddc6e650448889ba12c4a0504852a',8,'张楠楠','16767676767','2023-02-22 18:00:00.000','浙江嘉兴市海盐县海盐区珠江丽景9栋901','搬家服务','{"selections":[{"specName":"距离","selection":"30km-100km"}]}',266.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:38:41.000','admin','2023-02-16 00:38:41.000','0','692d68af078e4281944e217f316afe13','珠江丽景9栋901')
,('921ddc6e650448889ba12c4a0504852a',9,'赵钱','13512345123','2023-02-24 21:00:00.000','广东东莞市常平镇保利公馆12栋1201','搬家服务','{"selections":[{"specName":"距离","selection":"1km-30km"},{"specName":"车型","selection":"大型"}]}',266.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:43:36.000','admin','2023-02-16 00:43:36.000','0','a9182647f5eb43b8a2e5cf6d74e7cc3c','保利公馆12栋1201')
,('597g0c1160e04a4680dcaf1656e97v35',10,'张筱雨','14567212341','2023-02-21 23:00:00.000','湖南长沙市长沙县长沙县天河壹品8栋801','家庭保洁','{"selections":[{"specName":"时常","selection":"4H"},{"specName":"级别","selection":"高级"}]}',222.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:46:52.000','admin','2023-02-16 00:46:52.000','0','e16dee27dd0f4a9381feec448a064335','天河壹品8栋801')
,('597g0c1160e04a4680dcaf1656e97v35',11,'王博','15656565656','2023-02-21 02:00:00.000','山东德州市德城区德城区花溪小镇1901','宠物服务','{"selections":[{"specName":"服务类型","selection":"遛狗"}]}',100.000000,NULL,1,NULL,'waiting','admin','2023-02-16 00:51:38.000','admin','2023-02-16 00:51:38.000','0','740f707b0ad3425b840099cdecbbbe54','花溪小镇1901')
;

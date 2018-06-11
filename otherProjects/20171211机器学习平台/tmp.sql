-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.1.203    Database: tueasy5_zhen
-- ------------------------------------------------------
-- Server version	5.6.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `T_DS_CATEGORY`
--

DROP TABLE IF EXISTS `T_DS_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DS_CATEGORY` (
  `CATEGORY_id` varchar(50) NOT NULL COMMENT '数据源种类主键',
  `CATEGORY` varchar(4000) DEFAULT NULL COMMENT '例如：关系数据库、列数据库、分布式文件系统等',
  `DESCr` varchar(4000) DEFAULT NULL COMMENT '描述信息',
  `ACTIVE_YN` char(1) DEFAULT NULL COMMENT '是否可选（0表示可选、1表示不可选）',
  `CREATED_BY` varchar(50) DEFAULT NULL COMMENT '创建者',
  `CREATED_time` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(50) DEFAULT NULL COMMENT '更新者',
  `UPDATED_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`CATEGORY_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源种类类型：这里是数据源信息表中数据源种类的字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_DS_DATASOURCE`
--

DROP TABLE IF EXISTS `T_DS_DATASOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DS_DATASOURCE` (
  `datasource_id` varchar(50) NOT NULL COMMENT '数据源主键，主键，唯一(PK)',
  `SUB_CATEGORYID` varchar(50) DEFAULT NULL COMMENT '数据源子类别主键',
  `DataSource_name` varchar(500) DEFAULT NULL COMMENT '数据源名称；一般采用具有实际意义的英文单词表示。数据源名称由英文字母、数字、下划线等组合而成，必须具有唯一性，并且建议用具有实际意义的字词进行命名，譬如“hnepri_test_hbase”，表示公司的测试的HBase',
  `datasource_title` varchar(500) DEFAULT NULL COMMENT '数据源标题；数据源中文标题',
  `AUTHENTICATION_YN` varchar(5) DEFAULT NULL COMMENT '此数据库是否需要登录验证',
  `SERVER_name` varchar(4000) DEFAULT NULL COMMENT '部署服务器信息',
  `VERSION_` varchar(4000) DEFAULT NULL COMMENT '数据版本信息',
  `INSTALL_TYPE` varchar(4000) DEFAULT NULL COMMENT '数据库安装类型信息',
  `START_STATUS` char(1) DEFAULT NULL COMMENT '此数据库在系统中是否已经启用（启用标志为0、非启用标志为1)',
  `readonly` varchar(2) DEFAULT NULL COMMENT '是否只读(0表示只读、1表示可写)',
  `NOTE` varchar(4000) DEFAULT NULL COMMENT '备注',
  `CREATED_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `CREATED_time` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATED_by` varchar(50) DEFAULT NULL COMMENT '最近更新者',
  `UPDATED_time` datetime DEFAULT NULL COMMENT '最近更新时间',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`datasource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录数据源信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_DS_REGISTRY`
--

DROP TABLE IF EXISTS `T_DS_REGISTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DS_REGISTRY` (
  `register_itemsid` varchar(50) NOT NULL COMMENT '注册项信息主键',
  `datasource_id` varchar(50) DEFAULT NULL COMMENT '外键，关联数据源信息',
  `PARA` varchar(50) DEFAULT NULL COMMENT '参数项名称',
  `PARA_VALUE` varchar(4000) DEFAULT NULL COMMENT '参数值',
  `DESCR` varchar(4000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`register_itemsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源注册项信息，这里主要记录关于数据源的一些选项，比如IP、端口、用户名、密码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `T_DS_SUB_CATEGORY`
--

DROP TABLE IF EXISTS `T_DS_SUB_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_DS_SUB_CATEGORY` (
  `SUB_CATEGORYID` varchar(50) NOT NULL COMMENT '数据源子类别主键',
  `CATEGORY_id` varchar(50) DEFAULT NULL COMMENT '数据源种类',
  `SUB_CATEGORYname` varchar(4000) DEFAULT NULL COMMENT '数据源子类别名称',
  `DESCr` varchar(4000) DEFAULT NULL COMMENT '描述信息',
  `ACTIVE_YN` char(1) DEFAULT NULL COMMENT '是否可选',
  `CREATED_BY` varchar(50) DEFAULT NULL COMMENT '创建者',
  `CREATED_time` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATED_BY` varchar(50) DEFAULT NULL COMMENT '最后更新者',
  `UPDATED_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`SUB_CATEGORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据源子类别:这里关于数据源子类别字典表，例如：Oracle、MySQL等';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_app_developers`
--

DROP TABLE IF EXISTS `t_app_developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_app_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_app_developers_id_unique` (`id`),
  UNIQUE KEY `t_app_developers_user_id_app_id_unique` (`app_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_app_developers_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `t_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_app_developers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_app_managers`
--

DROP TABLE IF EXISTS `t_app_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_app_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_app_managers_id_unique` (`id`),
  UNIQUE KEY `t_app_managers_user_id_app_id_unique` (`app_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_app_managers_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `t_apps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_app_managers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_app_tokens`
--

DROP TABLE IF EXISTS `t_app_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_app_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `vaild_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_app_tokens_id_unique` (`id`),
  UNIQUE KEY `app_id` (`app_id`),
  UNIQUE KEY `t_app_tokens_app_id_unique` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_appdesignermapping`
--

DROP TABLE IF EXISTS `t_appdesignermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_appdesignermapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appId` int(11) DEFAULT NULL COMMENT 't_apps表主键',
  `designerId` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 't_designers表主键',
  `isDetele` tinyint(1) DEFAULT '0' COMMENT '是否被删除',
  UNIQUE KEY `appId` (`appId`,`designerId`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_apps`
--

DROP TABLE IF EXISTS `t_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `width` varchar(255) COLLATE utf8_bin NOT NULL,
  `height` varchar(255) COLLATE utf8_bin NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `auth_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `pages` longtext COLLATE utf8_bin,
  `create_time` datetime DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT b'0',
  `thumbnail` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `industry` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sub_industry` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `stage` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_apps_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_combination`
--

DROP TABLE IF EXISTS `t_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_combination` (
  `id` int(11) NOT NULL COMMENT '组合元素\n',
  `appId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `pageId` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connection_hierarchies`
--

DROP TABLE IF EXISTS `t_connection_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connection_hierarchies` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_id` int(11) DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unique_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `alias_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `view_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`h_id`),
  KEY `FK_lw8t97jq8y9glyi49rmn8kw9l` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connection_level_hierarchies`
--

DROP TABLE IF EXISTS `t_connection_level_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connection_level_hierarchies` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `h_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alias_name` varchar(50) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`l_id`),
  KEY `FK_5e4maed0jym7rs6t04wq20rx0` (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=828 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connection_table_columns`
--

DROP TABLE IF EXISTS `t_connection_table_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connection_table_columns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `t_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alias` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5v37gl9tfduuql35t9dcymih2` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115450 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connection_tables`
--

DROP TABLE IF EXISTS `t_connection_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connection_tables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `conn_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `selected` bit(1) NOT NULL,
  `type` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r7p6qmmgvjph27gnataknu7kf` (`conn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16795 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connectionn_cubes`
--

DROP TABLE IF EXISTS `t_connectionn_cubes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connectionn_cubes` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `conn_id` bigint(20) DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alias_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_vewwsvy3icqpgw8mwdg87bnd` (`conn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connectionn_dimensions`
--

DROP TABLE IF EXISTS `t_connectionn_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connectionn_dimensions` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alias_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `FK_mad3po7avrvkedp1t97nw1ly0` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connectionn_measures`
--

DROP TABLE IF EXISTS `t_connectionn_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connectionn_measures` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alias_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `FK_l0mhpr4m9f5eydq9s1r1ch499` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_connections`
--

DROP TABLE IF EXISTS `t_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_connections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT NULL,
  `db_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `db_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `db_username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源名称',
  `port` int(11) NOT NULL,
  `subtype` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1048 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cube_dimensions`
--

DROP TABLE IF EXISTS `t_cube_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cube_dimensions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cube_id` bigint(20) DEFAULT NULL,
  `data_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `column_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_eub9iajv2lxiirfp1ta0ymaa6` (`cube_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cube_hierarchies`
--

DROP TABLE IF EXISTS `t_cube_hierarchies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cube_hierarchies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dimension_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_11b0d7dt9sims2564o4ivp46s` (`dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cube_levels`
--

DROP TABLE IF EXISTS `t_cube_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cube_levels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `hierarchy_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ismala23eodu1p8oq3nod5v0a` (`hierarchy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cube_measures`
--

DROP TABLE IF EXISTS `t_cube_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cube_measures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cube_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `alias_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q31bxkksw0o5fqgj2rs5efdqc` (`cube_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_cubes`
--

DROP TABLE IF EXISTS `t_cubes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cubes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `app_id` bigint(20) DEFAULT NULL,
  `conn_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_designerdsmapping`
--

DROP TABLE IF EXISTS `t_designerdsmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_designerdsmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `designerId` int(11) DEFAULT NULL COMMENT 't_designers表主键',
  `dsId` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'T_DS_DATASOURCE表主键',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_designers`
--

DROP TABLE IF EXISTS `t_designers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_designers` (
  `id` varchar(50) NOT NULL COMMENT '主键',
  `designerUuid` varchar(50) NOT NULL DEFAULT '0' COMMENT '设计器UUID',
  `designerName` varchar(100) DEFAULT NULL COMMENT '设计器名称',
  `expType` varchar(20) DEFAULT NULL COMMENT '设计器类型，如native/GPU等',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(20) DEFAULT NULL COMMENT '创建人',
  `exeStartTime` datetime DEFAULT NULL COMMENT '运行开始时间',
  `status` varchar(10) DEFAULT NULL COMMENT '状态，取值包括准备/执行/停止等',
  `executeScheme` longtext COMMENT '设计器对应的完整json文件，包括apps',
  `reviewScheme` longtext COMMENT '设计器流程,用户修改和查看实验过程',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `exeEndTime` datetime DEFAULT NULL COMMENT '运行结束时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `modifiedBy` varchar(20) DEFAULT NULL COMMENT '修改人',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_error_logs`
--

DROP TABLE IF EXISTS `t_error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_error_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `params` text COLLATE utf8_bin,
  `message` text COLLATE utf8_bin,
  `stackTrace` mediumblob,
  `time` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=19869 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_info_collect`
--

DROP TABLE IF EXISTS `t_info_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_info_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `often_tool` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_info_collect_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_pages`
--

DROP TABLE IF EXISTS `t_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `thumbnail` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '当前页缩略图',
  `option` text COLLATE utf8_bin,
  `create_time` datetime DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1283 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_registeredtable`
--

DROP TABLE IF EXISTS `t_registeredtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_registeredtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dbId` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库ID,引用T_DATASOURCE表datasource_id列',
  `tableName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据表名',
  `alias` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1752 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_roles`
--

DROP TABLE IF EXISTS `t_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_roles_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_templates`
--

DROP TABLE IF EXISTS `t_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `app_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `sub_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `layout` varchar(255) COLLATE utf8_bin NOT NULL,
  `data_source` longtext COLLATE utf8_bin NOT NULL,
  `option` longtext COLLATE utf8_bin,
  `events` longtext COLLATE utf8_bin,
  `style` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_templates_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user_roles`
--

DROP TABLE IF EXISTS `t_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_user_roles_id_unique` (`id`),
  UNIQUE KEY `t_user_roles_role_id_user_id_unique` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `t_user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `t_users_id_unique` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_view_calculators`
--

DROP TABLE IF EXISTS `t_view_calculators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_view_calculators` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expression` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `f_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `t_id` bigint(20) DEFAULT NULL,
  `v_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_view_columns`
--

DROP TABLE IF EXISTS `t_view_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_view_columns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_distinct` bit(1) DEFAULT NULL,
  `_format` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `column_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `f_id` bigint(20) DEFAULT NULL,
  `t_id` bigint(20) DEFAULT NULL,
  `v_id` bigint(20) DEFAULT NULL,
  `data_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sbl1lm6d5u6s5yupnjiqpvkau` (`v_id`),
  KEY `FK_e64r55s3x3dh0pc3f8ivbxlbc` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14914 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_view_conditions`
--

DROP TABLE IF EXISTS `t_view_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_view_conditions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_id` bigint(20) DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `reverse` bit(1) NOT NULL,
  `t_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `val` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `v_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1ykky99yyw3yuj35ibdpqur8i` (`v_id`),
  KEY `FK_ewlok1cni2016d97sc34w79j5` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_view_splits`
--

DROP TABLE IF EXISTS `t_view_splits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_view_splits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `offset` int(11) DEFAULT NULL,
  `pattern` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `regx` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `t_id` bigint(20) DEFAULT NULL,
  `v_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=902 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_view_table_conditions`
--

DROP TABLE IF EXISTS `t_view_table_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_view_table_conditions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `f_id` bigint(20) DEFAULT NULL,
  `siblings_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `val` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `v_t_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d6ktvxwbuje6npgu0klp6n46` (`v_t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_view_tables`
--

DROP TABLE IF EXISTS `t_view_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_view_tables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `conn_f_id` bigint(20) DEFAULT NULL,
  `conn_owner_f_id` bigint(20) DEFAULT NULL,
  `conn_t_id` bigint(20) DEFAULT NULL,
  `conn_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `t_id` bigint(20) DEFAULT NULL,
  `v_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qxdvheo89yxpglpmagirihgn9` (`t_id`,`v_id`),
  KEY `FK_8aohu27nml0yvbgxp7a0c9bru` (`v_id`),
  CONSTRAINT `FK_4tb8pbo2v14snhm5tmmo95t4a` FOREIGN KEY (`t_id`) REFERENCES `t_connection_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2354 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_views`
--

DROP TABLE IF EXISTS `t_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_views` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(20) DEFAULT NULL,
  `conn_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clgxos73lakv9dmshj0rv06v9` (`conn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1611 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_widgets`
--

DROP TABLE IF EXISTS `t_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `page_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `main_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sub_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `layout` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `data_source` longtext COLLATE utf8_bin,
  `option` longtext COLLATE utf8_bin,
  `events` longtext COLLATE utf8_bin,
  `style` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `delete_flag` bit(1) DEFAULT b'0',
  `info_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '控件的中文名字\n',
  `layers` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '控件的图层，地图组件会有图层',
  `show` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33878 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_test`
--

DROP TABLE IF EXISTS `v_test`;
/*!50001 DROP VIEW IF EXISTS `v_test`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_test` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `width`,
 1 AS `height`,
 1 AS `status`,
 1 AS `auth_id`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `pages`,
 1 AS `create_time`,
 1 AS `delete_flag`,
 1 AS `thumbnail`,
 1 AS `type`,
 1 AS `industry`,
 1 AS `sub_industry`,
 1 AS `stage`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_test`
--

/*!50001 DROP VIEW IF EXISTS `v_test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_test` AS (select `t_apps`.`id` AS `id`,`t_apps`.`name` AS `name`,`t_apps`.`description` AS `description`,`t_apps`.`width` AS `width`,`t_apps`.`height` AS `height`,`t_apps`.`status` AS `status`,`t_apps`.`auth_id` AS `auth_id`,`t_apps`.`start_time` AS `start_time`,`t_apps`.`end_time` AS `end_time`,`t_apps`.`pages` AS `pages`,`t_apps`.`create_time` AS `create_time`,`t_apps`.`delete_flag` AS `delete_flag`,`t_apps`.`thumbnail` AS `thumbnail`,`t_apps`.`type` AS `type`,`t_apps`.`industry` AS `industry`,`t_apps`.`sub_industry` AS `sub_industry`,`t_apps`.`stage` AS `stage` from `t_apps`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-28 15:25:09

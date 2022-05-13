/*
SQLyog Professional v13.1.1 (32 bit)
MySQL - 10.4.22-MariaDB : Database - drink
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`drink` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `drink`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add comany product',7,'add_comanyproduct'),
(26,'Can change comany product',7,'change_comanyproduct'),
(27,'Can delete comany product',7,'delete_comanyproduct'),
(28,'Can view comany product',7,'view_comanyproduct'),
(29,'Can add company',8,'add_company'),
(30,'Can change company',8,'change_company'),
(31,'Can delete company',8,'delete_company'),
(32,'Can view company',8,'view_company'),
(33,'Can add company planogram',9,'add_companyplanogram'),
(34,'Can change company planogram',9,'change_companyplanogram'),
(35,'Can delete company planogram',9,'delete_companyplanogram'),
(36,'Can view company planogram',9,'view_companyplanogram'),
(37,'Can add planogram',10,'add_planogram'),
(38,'Can change planogram',10,'change_planogram'),
(39,'Can delete planogram',10,'delete_planogram'),
(40,'Can view planogram',10,'view_planogram'),
(41,'Can add planogram product',11,'add_planogramproduct'),
(42,'Can change planogram product',11,'change_planogramproduct'),
(43,'Can delete planogram product',11,'delete_planogramproduct'),
(44,'Can view planogram product',11,'view_planogramproduct'),
(45,'Can add process result',12,'add_processresult'),
(46,'Can change process result',12,'change_processresult'),
(47,'Can delete process result',12,'delete_processresult'),
(48,'Can view process result',12,'view_processresult'),
(49,'Can add product',13,'add_product'),
(50,'Can change product',13,'change_product'),
(51,'Can delete product',13,'delete_product'),
(52,'Can view product',13,'view_product'),
(53,'Can add result image',14,'add_resultimage'),
(54,'Can change result image',14,'change_resultimage'),
(55,'Can delete result image',14,'delete_resultimage'),
(56,'Can view result image',14,'view_resultimage'),
(57,'Can add store image',15,'add_storeimage'),
(58,'Can change store image',15,'change_storeimage'),
(59,'Can delete store image',15,'delete_storeimage'),
(60,'Can view store image',15,'view_storeimage');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$320000$dUwSIW7fDq9LqHgPC40JRC$/UAVgA121GGA/4eRatL+QcnkwlNn7IX67O7xhSguMxs=','2022-05-13 23:26:34.783819',1,'dmitrii','','','joaosouto985@gmail.com',1,1,'2022-05-11 15:19:04.594965');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'layouts','comanyproduct'),
(8,'layouts','company'),
(9,'layouts','companyplanogram'),
(10,'layouts','planogram'),
(11,'layouts','planogramproduct'),
(12,'layouts','processresult'),
(13,'layouts','product'),
(14,'layouts','resultimage'),
(15,'layouts','storeimage'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2022-05-11 15:17:57.729846'),
(2,'auth','0001_initial','2022-05-11 15:18:09.280592'),
(3,'admin','0001_initial','2022-05-11 15:18:11.564371'),
(4,'admin','0002_logentry_remove_auto_add','2022-05-11 15:18:11.647354'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-05-11 15:18:11.788239'),
(6,'contenttypes','0002_remove_content_type_name','2022-05-11 15:18:12.891685'),
(7,'auth','0002_alter_permission_name_max_length','2022-05-11 15:18:14.251001'),
(8,'auth','0003_alter_user_email_max_length','2022-05-11 15:18:14.401948'),
(9,'auth','0004_alter_user_username_opts','2022-05-11 15:18:14.473882'),
(10,'auth','0005_alter_user_last_login_null','2022-05-11 15:18:15.068537'),
(11,'auth','0006_require_contenttypes_0002','2022-05-11 15:18:15.109543'),
(12,'auth','0007_alter_validators_add_error_messages','2022-05-11 15:18:15.176474'),
(13,'auth','0008_alter_user_username_max_length','2022-05-11 15:18:15.320392'),
(14,'auth','0009_alter_user_last_name_max_length','2022-05-11 15:18:15.497323'),
(15,'auth','0010_alter_group_name_max_length','2022-05-11 15:18:15.662229'),
(16,'auth','0011_update_proxy_permissions','2022-05-11 15:18:15.726170'),
(17,'auth','0012_alter_user_first_name_max_length','2022-05-11 15:18:15.973049'),
(18,'layouts','0001_initial','2022-05-11 15:18:20.839422'),
(19,'layouts','0002_planogram_descripton_product_descripton','2022-05-11 15:18:21.300162'),
(20,'layouts','0003_alter_planogram_planogram_photo_and_more','2022-05-11 15:18:25.874625'),
(21,'sessions','0001_initial','2022-05-11 15:18:26.808093');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('4v932z9n0a89gozkf4sji0oaeihmra1q','.eJxVjE0OwiAUhO_C2hCg5a9L956BQHm1Ty1tCk00xrtLky50VpP5ZuZNtgxr8hOQjsQJy4pITsT5rYxuRw5jJfw_C76_Q9pBvPl0nWk_p7oMdK_Qg2Z6mSM8zkf372D0eaxrCVwbFTTTDGTbSqYbFpjyveVGqLb1PIjGyF5HMQiwxlgbB1adCAMYZffTDDnjnBw8F1xfpGsY-0kxYXEFJ8jFT4sjHVdSNEpUUWskt0p9voBqVAU:1np8ta:1DlhdISM7l9xnspi0pHczpRYB2C2xfZZ99Cca1KLG7Y','2022-05-12 13:35:22.990194'),
('535vmhpiyimx7z3pncv1vh2nlisto51i','.eJxVjM1uwyAQhN-Fc4UWzM_iY-95BgRmXW9b48gQqVWUd68t5dDcRvN9M3dxa7TXtJIYRVm578ziTcR060s8UeRyEPXa5TR9UT1B-Uz1Y5PTVo9llqcin7TJy1bo-_3pvhwsqS3H2pLy6LIHD2SNseAHyODSFBRqZ0xSWQ9oJ1_0rCkghlBmOJLOM6EL52mj1nirkX6uvP-KcQD413LlHjuv1Hpar1GMylmtMVhjpUPjwOHjD4EFVA8:1nopzN:qqnjOpHC5h6yED-k4xT8gZM-p7QP2X1BQycF4xCxDnE','2022-05-11 17:24:05.695586'),
('5b365h2xaz6z99viq7cayuyk2fgsfx60','.eJxVjc1uhCAUhd-FdUMuKH8uu59nICDXemcqGsGkzWTevZi46OxOznd-nuwouOewIBtYWqjuROyD-XDU2Z_IU2pEvHsxjA_MJ0j3kL9WPq65NSM_I_yihd_WhN-fV_ZtYA5lbm2FwlgdDRhA1fcKTAcRdBidsFL3fRBRdlaNJslJorPWuTRBUzJOaLU7RwuWQmv2-LPR_suGDuCfS5mqr7RgqWHZPBuEVlK6dgtcGwUSzOsPgJJT_g:1noqZQ:u3-15RrE5NC-cgKoChgV2aOa2u3PlUztfmd3cVlbV8Q','2022-05-11 18:01:20.694010'),
('5ejoa5yd2wdbfhb9tnv5jr999i7wcbgi','.eJxVjM1uwyAQhN-Fc4UWzM_iY-95BgRmXW9b48gQqVWUd68t5dDcRvN9M3dxa7TXtJIYRVm578ziTcR060s8UeRyEPXa5TR9UT1B-Uz1Y5PTVo9llqcin7TJy1bo-_3pvhwsqS3H2pLy6LIHD2SNseAHyODSFBRqZ0xSWQ9oJ1_0rCkghlBmOJLOM6EL52mj1nirkX6uvP-KcQD413LlHjuv1Hpar1GMylmt0SCgdNqhguHxB4CuVAA:1nooky:LYvIqfNYEbraYIERDLOkmvhbKLMv7iI3A6F4fawzqf8','2022-05-11 16:05:08.823695'),
('5m4ydlfwcfb3pnz1i6uc6kbr8yzmr8a0','.eJxVjEuOwyAQRO_CeoQazNfL7HMGBKY97pkYR4ZIiaLcfbCUxWRXqlf1nuxWcS9xRTayvFLbidgXC_HWlnCgQLkT8dmlOP1iOUD-ieV749NW-jPxY8LftPLzlvFyem8_BEusS39rFNaZZMECaqU02AESmDh54aRRKookB6cnm-Us0TvnfZ6hJ5lmdMYf0oq10lYC3q-0P9g4APxrqVALjVasLa7XwEZhtBy8dwBcKGW78_UHgNNUDg:1npIfg:ax1hMba801igVHvRVqqvsix2MLkOdCbsLaRlc9lvZxA','2022-05-13 00:01:40.227347'),
('6uq3a3744y3wsduvdnpgp0junfu5ip9c','.eJxVjTluwzAURO_COiC4LyrT-wwEKX5F344oQaSABIbvHgpQEXeDebM8yVFhL3EBMpC8YNsRyQcJ8WhzOFHA3Al_91IcH1BOkO-xfK10XEtvJnpG6EUrva0Zvj-v7NvAHOvc2xq4dSZZZhlopTSzkiVm4ui5E0apyJOQTo82i0mAd877PLGuRJrAGX-OVqgV1xLgZ8P9lwySsX8uFmyh4QK1xWULZOBGC6m9koJq7frj6w8s61PQ:1np8Aa:KUphGvCr7grzDluqTECB5Sb1VxcUWVl_OoKjRDdbwrc','2022-05-12 12:48:52.576495'),
('81b3ardfu1g8tczo2x27fa50v560ambd','.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRZSWy84lY4rK-T7A4CUU_8:1np7mD:9f5EASgvzJ_VuLVSGPpEjEK0w0IH9S9wN7hpa1Np1cQ','2022-05-12 12:23:41.400478'),
('9513wrpcgf0k2rh7mp8ny3rlm65g27dw','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRmqvAniugghC6dcfgNZUBg:1npeYG:Tdycw0IyxhOVnmDv75V6sIleXEdC3xuJE8m8f8LCzRM','2022-05-13 23:23:28.402898'),
('9l4u4bgtvstsz662uwx3xoyzc4hvjn5b','.eJxVjEtuxCAQRO_COkINmJ-X2c8ZEJh23DMxtgyWEo3m7rElLzK7Ur1X9WR7xa3EGVnP8kxtI2IfLMS9TeFEgfJBxHuX4vDAcoJ8j-Vr4cNSjmXip8IvWvltyfj9eblvB1Os07HWKKwzyYIF1F2nwSpIYOLghZOm66JIUjk92CxHid457_MIR5JpRGf8eVqxVlpKwJ-Vtl_WK4B_LRVqodGMtcV5DawXRkvlPUjFnRAg9OsPLLdTwg:1npIT9:zba6qqTTZrMlHVzZCskukzw6fiEl46wFEMK0h1EL0Dg','2022-05-12 23:48:43.920052'),
('9vv6fzo2uczwl3vnicrw769943mvw9db','.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRUoF0UnPnlbf29QYs31PZ:1npJST:XW8-as1F_Ht5JIyOEYaDJcv2YBW5uDTiADfNS6Ee4KI','2022-05-13 00:52:05.921963'),
('cuzyfz9z09oaysv96gzzr4mwlwdva3f4','.eJxVjDtuwzAQRO_COiCWK_Gn0r3PQJDiKtrEogyRBmwYvnskwEXcDea9mae4VdpKXEgMIi_cNmbxJUK8tTkcKHDeifrsUhx_qRwg_8TyvcpxLfsyyUORb1rlec10Ob3dj4M51nlfa1LWmWTBAum-12A7SGDi6JVD0_dRJeycHm3GCck7532eYE-YJnLGH6eVauW1BLpfeXuIoQP413LhFhovVFtcrkEMymhEj9Yb2SnQaMzrD4CvVAI:1noqpo:NU4ld3qSnzYgqxMalgq98AyRdANZH7wKjg0g4B1Tvkk','2022-05-11 18:18:16.337511'),
('eg544c7tbahmohayvfapwavoxxvfgtgu','.eJxVjEuOwyAQRO_CeoSg-XuZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ_OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8blM7b7IQTaLQ2wimRhU1jkB6s1klmUN6MrsAEGLwPoUxiT5An9DYcpw1bo7VGvF9pe7BBCfGvpUo9dlqw9bRcIxukNQBeg1XcaRtAvf4ALOVT0A:1noocB:ociWpxvAyucgy_KCI95Yn07v17_eFC8KYl9T4CCc-Iw','2022-05-11 15:56:03.757935'),
('fzz2js0joud2qu7j7uivmht9vhm93jsj','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRqpglVYctNTC2NcfgGpT-g:1npHlv:4ZVPGhi_nKaZVIIKUdAnbixdYr2Mv3N5SRuGv0fbnmM','2022-05-12 23:04:03.455911'),
('g4mpkhezygkwll9b31f10r5cwkdpt0t4','.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRaKc80lVdpYKez7A4AOU_k:1npLib:d5gtqrRR82IW06cXLvmZFyThCXACexnNanOJ416ZlmI','2022-05-13 03:16:53.719358'),
('gaeanv6e3s87petiq2iu08hwyd3xob04','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRkrvFUgedAhCmdcfgLRUBw:1nopfK:dSD7dbpJCfaSH2JQTrl1B5DNY0EAPbOHEPIXkK67W4Q','2022-05-11 17:03:22.972900'),
('genw4ot9qe5rced950umtgeyqoaydi1p','.eJxVjTluwzAURO_COiC4LyrT-wwEKX5F344oQaSABIbvHgpQEXeDebM8yVFhL3EBMpC8YNsRyQcJ8WhzOFHA3Al_91IcH1BOkO-xfK10XEtvJnpG6EUrva0Zvj-v7NvAHOvc2xq4dSZZZhlopTSzkiVm4ui5E0apyJOQTo82i0mAd877PLGuRJrAGX-OVqgV1xLgZ8P9lwySsX8uFmyh4QK1xWULZOBGC9X_vKVaKuslf_0BgI9UAw:1npKZN:ZMnHFjbcihQk9j6-_Z4V_sTYq2uG6kBGXPgqSp_FXEk','2022-05-13 02:03:17.627728'),
('gikv78ij9mbylslob253g5ynp5io9bk6','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRmowTjrutdKg1OsPgGZT-g:1npKDH:J4Vxq0ItNrdM8GVuR41bSqH6edcUATVXEyF789dN80I','2022-05-13 01:40:27.861393'),
('gmkkiujufl3wl3zimag6zmvuqsu9u8ls','.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRZSG-UE9VwaZ-T7A4C8VAg:1np7P0:z0r4dGZZrjad_QkFlXBHDVn7xJBafbNaB1Zhu5a-pFg','2022-05-12 11:59:42.953662'),
('ht50sh9neoefkke7jagn7ui8e6y07wy4','.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtJSu8wDcSVDK2tcfgF5T_g:1nooWK:PKTUUR95WDPySVAEvk9EvakIrrrE-o6ndqEUqFG9sEI','2022-05-11 15:50:00.837437'),
('ih78h5q6rds6sq4xf33o4ihval3uzxoi','.eJxVjM1qwzAQhN9F5yJWsn59zD3PICRrXW8by8FSICHk3StDDg3MYZhvZp7sVnEvcUU2srxS24nYFwvx1pZwoEC5E_GZpTj9YjlA_onle-PTVvoy8aPC37Ty85bxcnp3Pw6WWJe-1iisM8mCBdRKabADJDBx8sJJo1QUSQ5OTzbLWaJ3zvs8Q3cyzeiMP04r1kpbCXi_0v5g4wDwL6VCLTRasba4XgMbhdFSgQBr-KCk7Xr9AYABU_c:1npJ0G:2lscHZ-xKPL7JrpLoDzeOGyzTMkzRyhtYSbof1ZizNw','2022-05-13 00:22:56.354737'),
('j3ro38tmmaf3s5amkhl8yuif2f1utxm1','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRsqggtPcKy0DqNcfgO1UBw:1nor8o:mSqA5Pqw6DPtj_UPYZf1lmO2HSxeBRCnpq5g2ZACoa0','2022-05-11 18:37:54.886261'),
('kv3gwbal9g4vewxymoqpsh5vv8iey699','.eJxVjUuOwyAQRO_CeoQazNfL7HMGBKY97pkYR4ZIiaLcfbCUxWRXqlefJ7tV3EtckY0sr9R2IvbFQry1JRwoUO5EfHopTr9YDpB_Yvne-LSV3kz8iPA3rfy8Zbyc3tmPgSXWpbc1CutMsmABtVIa7AAJTJy8cNIoFUWSg9OTzXKW6J3zPs_QlUwzOuOP0Yq10lYC3q-0P9g4APxzqVALjVasLa7XwEZhtFTWK6E4qKGfyNcfgH5T-g:1npdNm:RXWDjwDx1m5meSAGYebLEUq_utO3rjxH1sM28Z0KQwQ','2022-05-13 22:08:34.051261'),
('o2fgbzx9uupcz13q945n1doujqa37v4n','.eJxVjEuOwyAQRO_CeoSgMT8vs88ZEJj2uGdiHBkiJYpy98FSFpNdqV7Ve7Jbxb3EFdnI8kptJ2JfLMRbW8KBAuVO5GeX4vSL5QD5J5bvjU9b6c_Ejwl_08rPW8bL6b39ECyxLv2tUVpnkhVWoB4GLawSSZg4eenADEOUCZTTk80wA3rnvM-z6AnSjM74Q1qxVtpKwPuV9gcblRD_WirUQqMVa4vrNbBRGg3Kd7vm4BRYeP0BLRlT0Q:1npIGv:vFP2JtdObAEVPciYHhbPOqr1mxlG9yywMIK2TN_zJjk','2022-05-12 23:36:05.372218'),
('p2nl6d0ljgqdk5to2zl1f6etjye8uo8v','.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRbSWy4NVYILq_37A4CSVAM:1npHyi:GSM3Ata834CM9FbYSia2QAzdNFF6Uut0tvb2ANiRfN4','2022-05-12 23:17:16.493235'),
('p49kp7rz027l7n2bu6pe0469bs8p0ksd','.eJxVjMsOgjAURP-la9O0pU-W7v2GpqUXuSqF0JJojP8uJCx0N5lzZt5kLbDkMAJpSRqxLojkRHxY6-B35DFthP93MXR3yDtIt5CvE-2mvC0j3RV60EIvU4LH-XD_DoZQhm2tgBuro2GGgZJSMdOwyHToHLdCSxl4FI1VnUmiF-CsdS71bEsi9mC1208LlIJT9vCccXmRtmHsp8WM1VccodQwzp60XCvRKGm4oZI7pfTnCyzcU9E:1np6wX:-Ut43QbCkTXGjX2TAQ4jvJmZRGoz0SpzIfHRygVFHp0','2022-05-12 11:30:17.447538'),
('pa3do3f1vbonclpekd9u7x7a0pdpa8bf','.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRbSKGMkFV5yZ_n7A4CiVAM:1np9Wx:HkM_vJJE-1h08oPTjc3jkDidyMKTydWkNqVj5GI0RCw','2022-05-12 14:16:03.297187'),
('rh0clx1n3x5n24rxomz6zs8bs9o5avrf','.eJxVjM2uwiAUhN-FtSFA-Tl06d5nIFBO7bnXUlMw0Rjf3TZxobvJfN_Mk90qriXOyHqWZ2orETuwEG9tCjsKlDcif7sUh38sO8h_sZwXPixlWya-K_xDKz8tGS_Hj_tzMMU6bWuD0oFNTjiBRmsjXCeSsHHwEpTVOsqkOjCDy2pU6AG8z6PYkkojgvX7acVaaSkB71daH6zvhPhqqVALjWasLc7XwHppjeq0M1JyZyyAhtcbgJxUCw:1np54J:UnMeTD-HN2EDLc4ABqqnJSmzhb8NdKu_PKkJH9DOEE8','2022-05-12 09:30:11.783865'),
('v77pa6mfviobgxvqhodqjhzanhr77uda','.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRUjmloOMgpHfGvt6AVlQA:1npegF:KtK7Ip-uWSI2NkOQEFNunh-ubhKrw_5TalO6Pfp9l98','2022-05-13 23:31:43.024964'),
('vc7zy5fx01817j0f2g4vhhpfuxgffh1y','.eJxVjU1uwyAQhe_CukKAgQEvs88ZEJhxPW2MI0OkRFHuXixl0eye3vd-nuxWcS9xRTayvFLbidgXC_HWlnCgQLkT-emlOP1iOUD-ieV749NWejPxI8LftPLzlvFyemc_BpZYl942KMHZBAIEGq2NgEEkYePkpVNW6yiTGpyZIKtZoXfO-zyLrlSa0Vl_jFaslbYS8H6l_cHGQYh_LhVqodGKtcX1GtgorVEaPGjgEvqHHF5_gP1UBg:1npdT9:I6R93rCRBy1mCLLZjJvFyUmOGLHPlJ0Y92fu0xBQqlQ','2022-05-13 22:14:07.191628'),
('vjvp2u6kzuqp9c584qqtqcjvf0g8jino','.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRstNOWckFWAX69QYswFPG:1np7v6:k1zpnZfaKWjsAZVsPvu-yafjzac3Zgva9qgrJTeDiek','2022-05-12 12:32:52.138386'),
('w89ux4wpbphk9zeprr10ow27n2khudc5','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRsoAWkluQSir3OsPgB1T9g:1noqDg:VqurRgePV6O-bz_nWeVAUr_5KbETROZLF1lUK7Ox7IM','2022-05-11 17:38:52.620350'),
('xep20ikib77zjrekr98qub7twsjor4nz','.eJxVjEuOwyAQRO_CeoQazKfxMvucAYFpj5mJcWSIlCjK3QdLWUx2pXqv6slulfYSVmIjS2tue87si_lwa4s_kM-pE_HZxTD9UjlA-gnle-PTVvoy8kPhb1r5eUt0Ob3dj4Ml1KWvNQmLJlqwQFopDXaACCZMTqA0SgUR5YB6sknOkhyic2mGnmScCY07TivVmrfi6X7N-4ONA8C_NpfcfMsr1RbWq2ejMFoqQAPIe3Lo1OsPgLNUDQ:1npKxk:LnyZiZ4U7xe4lKNzJN65nojPBCTvvS-Xft2itlehk2U','2022-05-13 02:28:28.662982'),
('xxnuj2zpw50rq6tdlgt0siwwv4vf6640','.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRmrnlRJcQtBa6NcfgHJT-g:1npd6J:W3_6bdNlkCdobA-p-SMfb1oBTyZCT3eLAktNoY_nh80','2022-05-13 21:50:31.236424'),
('ygtbikl6808yacquuo7xg4bxkg3rdnde','.eJxVjEtuxCAQRO_COkLQmJ-X2c8ZEJh23DMxtgyWEo3m7rElLzK7Ur1X9WR7xa3EGVnP8kxtI2IfLMS9TeFEgfJB5HuX4vDAcoJ8j-Vr4cNSjmXip8IvWvltyfj9eblvB1Os07HWKK0zyQorUHedFlaJJEwcvHRgui7KBMrpwWYYAb1z3udRHAnSiM7487RirbSUgD8rbb-sV0L8a6lQC41mrC3Oa2C9NBrAgbKSg_TWKvX6A4BmU_8:1noo7f:1MC10QLnc7XC2e-2PfGlT5EnJItw9GMK2cFxWRDS0m0','2022-05-11 15:24:31.231765'),
('ysljprtkxzvacmpmrpayzowlmsqkvx6o','.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtFQOpFNceTAd-NcfgIdUAQ:1npdbo:u_LTEEleHWNbPltP1bnJgWP8AHBOeNKb5GQghL_wl6c','2022-05-13 22:23:04.499625');

/*Table structure for table `layouts_comanyproduct` */

DROP TABLE IF EXISTS `layouts_comanyproduct`;

CREATE TABLE `layouts_comanyproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_comanyproduct` */

/*Table structure for table `layouts_company` */

DROP TABLE IF EXISTS `layouts_company`;

CREATE TABLE `layouts_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_company` */

insert  into `layouts_company`(`id`,`company_id`,`company_name`,`created_at`,`updated_at`) values 
(1,1,'aaa','2022-05-13 23:15:53.920848','2022-05-13 23:15:53.920848');

/*Table structure for table `layouts_companyplanogram` */

DROP TABLE IF EXISTS `layouts_companyplanogram`;

CREATE TABLE `layouts_companyplanogram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `planogram_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_companyplanogram` */

/*Table structure for table `layouts_planogram` */

DROP TABLE IF EXISTS `layouts_planogram`;

CREATE TABLE `layouts_planogram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planogram_id` int(11) NOT NULL,
  `planogram_name` varchar(255) NOT NULL,
  `planogram_photo` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_planogram` */

/*Table structure for table `layouts_planogramproduct` */

DROP TABLE IF EXISTS `layouts_planogramproduct`;

CREATE TABLE `layouts_planogramproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `planogram_id` int(11) NOT NULL,
  `rows` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_planogramproduct` */

/*Table structure for table `layouts_processresult` */

DROP TABLE IF EXISTS `layouts_processresult`;

CREATE TABLE `layouts_processresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_image_id` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_processresult` */

/*Table structure for table `layouts_product` */

DROP TABLE IF EXISTS `layouts_product`;

CREATE TABLE `layouts_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_photo` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_product` */

insert  into `layouts_product`(`id`,`product_id`,`product_name`,`product_photo`,`order`,`status`,`created_at`,`updated_at`,`description`) values 
(35,'643a681e-2546-4207-8569-eb00e11b1682','Аранаит','products/ceb3da8f-97bf-48e5-87a8-d79f509e600f.png',1,1,'2022-05-13 03:11:20.536879','2022-05-13 03:11:20.536879',''),
(36,'42d1ee07-81c2-4cfa-a4b9-6fe14db628b8','Bugulma','products/60258679-3065-498e-b626-a2d036871791.png',2,1,'2022-05-13 03:11:27.689483','2022-05-13 03:11:27.689483',''),
(37,'827a9dbf-b779-4450-aeaa-d21a18b8398b','Очистить поле','products/08fbc524-b8ff-4e8e-9244-d25cc2669a9b.png',3,1,'2022-05-13 03:11:39.115662','2022-05-13 03:11:39.115662',''),
(38,'d62aa9ce-bfe7-4889-9bf2-95a328afd0bd','Count Ledoff','products/cfff6b03-48bf-42ed-8b58-c822fd47e315.png',4,1,'2022-05-13 03:11:53.632635','2022-05-13 03:11:53.632635',''),
(39,'2d89c5b7-ecc1-4f2c-a615-bca4312d629e','Count Ledoff Desser','',5,1,'2022-05-13 02:12:39.320443','2022-05-13 02:12:39.320443',''),
(40,'3728a673-052b-4d03-bc6c-0456bfa47c7b','Epiphany','products/3e9322f8-91e8-415a-bc85-1cd16958c6c5.png',6,1,'2022-05-13 21:45:20.297564','2022-05-13 21:45:20.297564',''),
(41,'defc1107-c3a6-4d90-a5f9-6cfa7fb5c083','Glen Rivers\n','',7,1,'2022-05-13 01:29:26.804222','2022-05-13 01:29:26.804222',''),
(42,'e3fa6229-6db7-4a09-8b7c-0bebd858410d','Khanskaya\n','',8,1,'2022-05-13 01:29:26.837416','2022-05-13 01:29:26.837416',''),
(43,'553b8369-8c2c-498c-933f-5a29e5818480','Khlebnaya\n','',9,1,'2022-05-13 01:29:26.870307','2022-05-13 01:29:26.870307',''),
(44,'dea94a9b-8b5d-40ae-ad01-3b9638f36e01','King Cedar\n','',10,1,'2022-05-13 01:29:26.903200','2022-05-13 01:29:26.903200',''),
(45,'ea497af4-18de-48ba-8026-a9f353c1f956','King Cedar Tincture\n','',11,1,'2022-05-13 01:29:26.936691','2022-05-13 01:29:26.936691',''),
(46,'6023ffc1-5411-4bf6-bce2-455e8270a1d8','Old Kazan\n','',12,1,'2022-05-13 01:29:26.970507','2022-05-13 01:29:26.970507',''),
(47,'7d8ce511-426d-4194-90ef-7cd949c8bc5c','Tundra\n','',13,1,'2022-05-13 01:29:27.002841','2022-05-13 01:29:27.002841',''),
(48,'31f2bd27-1e44-45f6-91fb-7034571a7759','Tundra Bitte','',14,1,'2022-05-13 02:12:32.543299','2022-05-13 02:12:32.543299',''),
(49,'d8406ef2-b1c4-4fac-b878-f8c9fdf13b12','Your Choic','',15,1,'2022-05-13 02:12:24.286497','2022-05-13 02:12:24.286497','');

/*Table structure for table `layouts_resultimage` */

DROP TABLE IF EXISTS `layouts_resultimage`;

CREATE TABLE `layouts_resultimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(11) NOT NULL,
  `result_image_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_resultimage` */

/*Table structure for table `layouts_storeimage` */

DROP TABLE IF EXISTS `layouts_storeimage`;

CREATE TABLE `layouts_storeimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `photo_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `layouts_storeimage` */

insert  into `layouts_storeimage`(`id`,`company_id`,`user_id`,`photo_name`,`created_at`,`updated_at`) values 
(1,1,1,'store/d8ec5f6e-2b6f-4ef9-8a11-c538d08259fc.jpg','2022-05-13 23:15:54.027286','2022-05-13 23:15:54.027286');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

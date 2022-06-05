-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 06:13 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drink`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add comany product', 7, 'add_comanyproduct'),
(26, 'Can change comany product', 7, 'change_comanyproduct'),
(27, 'Can delete comany product', 7, 'delete_comanyproduct'),
(28, 'Can view comany product', 7, 'view_comanyproduct'),
(29, 'Can add company', 8, 'add_company'),
(30, 'Can change company', 8, 'change_company'),
(31, 'Can delete company', 8, 'delete_company'),
(32, 'Can view company', 8, 'view_company'),
(33, 'Can add company planogram', 9, 'add_companyplanogram'),
(34, 'Can change company planogram', 9, 'change_companyplanogram'),
(35, 'Can delete company planogram', 9, 'delete_companyplanogram'),
(36, 'Can view company planogram', 9, 'view_companyplanogram'),
(37, 'Can add planogram', 10, 'add_planogram'),
(38, 'Can change planogram', 10, 'change_planogram'),
(39, 'Can delete planogram', 10, 'delete_planogram'),
(40, 'Can view planogram', 10, 'view_planogram'),
(41, 'Can add planogram product', 11, 'add_planogramproduct'),
(42, 'Can change planogram product', 11, 'change_planogramproduct'),
(43, 'Can delete planogram product', 11, 'delete_planogramproduct'),
(44, 'Can view planogram product', 11, 'view_planogramproduct'),
(45, 'Can add process result', 12, 'add_processresult'),
(46, 'Can change process result', 12, 'change_processresult'),
(47, 'Can delete process result', 12, 'delete_processresult'),
(48, 'Can view process result', 12, 'view_processresult'),
(49, 'Can add product', 13, 'add_product'),
(50, 'Can change product', 13, 'change_product'),
(51, 'Can delete product', 13, 'delete_product'),
(52, 'Can view product', 13, 'view_product'),
(53, 'Can add result image', 14, 'add_resultimage'),
(54, 'Can change result image', 14, 'change_resultimage'),
(55, 'Can delete result image', 14, 'delete_resultimage'),
(56, 'Can view result image', 14, 'view_resultimage'),
(57, 'Can add store image', 15, 'add_storeimage'),
(58, 'Can change store image', 15, 'change_storeimage'),
(59, 'Can delete store image', 15, 'delete_storeimage'),
(60, 'Can view store image', 15, 'view_storeimage');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$dUwSIW7fDq9LqHgPC40JRC$/UAVgA121GGA/4eRatL+QcnkwlNn7IX67O7xhSguMxs=', '2022-05-14 15:54:29.585658', 1, 'dmitrii', '', '', 'joaosouto985@gmail.com', 1, 1, '2022-05-11 15:19:04.594965');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'layouts', 'comanyproduct'),
(8, 'layouts', 'company'),
(9, 'layouts', 'companyplanogram'),
(10, 'layouts', 'planogram'),
(11, 'layouts', 'planogramproduct'),
(12, 'layouts', 'processresult'),
(13, 'layouts', 'product'),
(14, 'layouts', 'resultimage'),
(15, 'layouts', 'storeimage'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-11 15:17:57.729846'),
(2, 'auth', '0001_initial', '2022-05-11 15:18:09.280592'),
(3, 'admin', '0001_initial', '2022-05-11 15:18:11.564371'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-11 15:18:11.647354'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-11 15:18:11.788239'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-11 15:18:12.891685'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-11 15:18:14.251001'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-11 15:18:14.401948'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-11 15:18:14.473882'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-11 15:18:15.068537'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-11 15:18:15.109543'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-11 15:18:15.176474'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-11 15:18:15.320392'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-11 15:18:15.497323'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-11 15:18:15.662229'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-11 15:18:15.726170'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-11 15:18:15.973049'),
(18, 'layouts', '0001_initial', '2022-05-11 15:18:20.839422'),
(19, 'layouts', '0002_planogram_descripton_product_descripton', '2022-05-11 15:18:21.300162'),
(20, 'layouts', '0003_alter_planogram_planogram_photo_and_more', '2022-05-11 15:18:25.874625'),
(21, 'sessions', '0001_initial', '2022-05-11 15:18:26.808093');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0qi3nzwal7vcgk6lrt7vz6q8ixjgqsau', '.eJxVjDtuwzAQRO_COiCWK35VpvcZCFJcRZtElCHSQALDd48EuIi7wbw3cxe3RntNK4lRlJX7zizeREy3vsQTRS4HUa9dTtMX1ROUz1Q_Njlt9VhmeSrySZu8bIW-35_uy8GS2nKsDSnnbXbggIzWBtwAGWyagvJotU4q4-DN5ArOSMH7EMoMR8I8k7fhPG3UGm810s-V918xDgD_Wq7cY-eVWk_rNYpRWYNGA2orjUZvFT7-AIBCU_k:1nptCw:FlLJ_Sk7EQ0CnAdBKGwT33KQ5pWliWfbOgcEA7KpfFE', '2022-05-14 15:02:26.564861'),
('0zyuehoaq7nckibceq74heaafyy1g1zm', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRhopglUcnNNaq9cfgHlT_w:1npoS3:wfjeEq2K8RCQqQKnTGdCYnbJ5tNqP7i7antYeiTXiwI', '2022-05-14 09:57:43.135442'),
('26i3zsh6zsq90fbcjyka5dytp9ti41n6', '.eJxVjEuOwyAQRO_CeoQabD7tZfY5AwLTHvdMjCNDpERR7j62lMVkV6r3qp7iVmkrcSExiLxw25jFlwjx1uZwoMB5J-qzS3H8pXKA_BPL9yrHtezLJA9FvmmV5zXT5fR2Pw7mWOd9bUg5b5MDB2T63oDrIIGNIyqvbd9HlXTnzeiynjSh94h5gj3pNJG3eJxWqpXXEuh-5e0hhg7gX8uFW2i8UG1xuQYxKGu0ATTOSI2oAPXrD4DMVAc:1nplEF:MAZkFQb41k4LvWfq-AozUqaHD7rdj5UnAuRcdoL79NU', '2022-05-14 06:31:15.312109'),
('4v932z9n0a89gozkf4sji0oaeihmra1q', '.eJxVjE0OwiAUhO_C2hCg5a9L956BQHm1Ty1tCk00xrtLky50VpP5ZuZNtgxr8hOQjsQJy4pITsT5rYxuRw5jJfw_C76_Q9pBvPl0nWk_p7oMdK_Qg2Z6mSM8zkf372D0eaxrCVwbFTTTDGTbSqYbFpjyveVGqLb1PIjGyF5HMQiwxlgbB1adCAMYZffTDDnjnBw8F1xfpGsY-0kxYXEFJ8jFT4sjHVdSNEpUUWskt0p9voBqVAU:1np8ta:1DlhdISM7l9xnspi0pHczpRYB2C2xfZZ99Cca1KLG7Y', '2022-05-12 13:35:22.990194'),
('535vmhpiyimx7z3pncv1vh2nlisto51i', '.eJxVjM1uwyAQhN-Fc4UWzM_iY-95BgRmXW9b48gQqVWUd68t5dDcRvN9M3dxa7TXtJIYRVm578ziTcR060s8UeRyEPXa5TR9UT1B-Uz1Y5PTVo9llqcin7TJy1bo-_3pvhwsqS3H2pLy6LIHD2SNseAHyODSFBRqZ0xSWQ9oJ1_0rCkghlBmOJLOM6EL52mj1nirkX6uvP-KcQD413LlHjuv1Hpar1GMylmtMVhjpUPjwOHjD4EFVA8:1nopzN:qqnjOpHC5h6yED-k4xT8gZM-p7QP2X1BQycF4xCxDnE', '2022-05-11 17:24:05.695586'),
('5b365h2xaz6z99viq7cayuyk2fgsfx60', '.eJxVjc1uhCAUhd-FdUMuKH8uu59nICDXemcqGsGkzWTevZi46OxOznd-nuwouOewIBtYWqjuROyD-XDU2Z_IU2pEvHsxjA_MJ0j3kL9WPq65NSM_I_yihd_WhN-fV_ZtYA5lbm2FwlgdDRhA1fcKTAcRdBidsFL3fRBRdlaNJslJorPWuTRBUzJOaLU7RwuWQmv2-LPR_suGDuCfS5mqr7RgqWHZPBuEVlK6dgtcGwUSzOsPgJJT_g:1noqZQ:u3-15RrE5NC-cgKoChgV2aOa2u3PlUztfmd3cVlbV8Q', '2022-05-11 18:01:20.694010'),
('5ejoa5yd2wdbfhb9tnv5jr999i7wcbgi', '.eJxVjM1uwyAQhN-Fc4UWzM_iY-95BgRmXW9b48gQqVWUd68t5dDcRvN9M3dxa7TXtJIYRVm578ziTcR060s8UeRyEPXa5TR9UT1B-Uz1Y5PTVo9llqcin7TJy1bo-_3pvhwsqS3H2pLy6LIHD2SNseAHyODSFBRqZ0xSWQ9oJ1_0rCkghlBmOJLOM6EL52mj1nirkX6uvP-KcQD413LlHjuv1Hpar1GMylmt0SCgdNqhguHxB4CuVAA:1nooky:LYvIqfNYEbraYIERDLOkmvhbKLMv7iI3A6F4fawzqf8', '2022-05-11 16:05:08.823695'),
('5m4ydlfwcfb3pnz1i6uc6kbr8yzmr8a0', '.eJxVjEuOwyAQRO_CeoQazNfL7HMGBKY97pkYR4ZIiaLcfbCUxWRXqlf1nuxWcS9xRTayvFLbidgXC_HWlnCgQLkT8dmlOP1iOUD-ieV749NW-jPxY8LftPLzlvFyem8_BEusS39rFNaZZMECaqU02AESmDh54aRRKookB6cnm-Us0TvnfZ6hJ5lmdMYf0oq10lYC3q-0P9g4APxrqVALjVasLa7XwEZhtBy8dwBcKGW78_UHgNNUDg:1npIfg:ax1hMba801igVHvRVqqvsix2MLkOdCbsLaRlc9lvZxA', '2022-05-13 00:01:40.227347'),
('5yievr1xaopyae90wenzn2phan4yrjv0', '.eJxVjMsOgjAURP-la9O0pU-W7v2GpqUXuSqF0JJojP8uJCx0N5lzZt5kLbDkMAJpSRqxLojkRHxY6-B35DFthP93MXR3yDtIt5CvE-2mvC0j3RV60EIvU4LH-XD_DoZQhm2tgBuro2GGgZJSMdOwyHToHLdCSxl4FI1VnUmiF-CsdS71bEsi9mC1208LlIJT9vCccXmRtmHsp8WM1VccodQwzp60XCshnZJK0oYLa7T5fAGAwVQJ:1nphYU:qL6AHfnHBpvVBREmBDZRY7wxUrGHD4T46_g8rp-76fU', '2022-05-14 02:35:54.355876'),
('6uq3a3744y3wsduvdnpgp0junfu5ip9c', '.eJxVjTluwzAURO_COiC4LyrT-wwEKX5F344oQaSABIbvHgpQEXeDebM8yVFhL3EBMpC8YNsRyQcJ8WhzOFHA3Al_91IcH1BOkO-xfK10XEtvJnpG6EUrva0Zvj-v7NvAHOvc2xq4dSZZZhlopTSzkiVm4ui5E0apyJOQTo82i0mAd877PLGuRJrAGX-OVqgV1xLgZ8P9lwySsX8uFmyh4QK1xWULZOBGC6m9koJq7frj6w8s61PQ:1np8Aa:KUphGvCr7grzDluqTECB5Sb1VxcUWVl_OoKjRDdbwrc', '2022-05-12 12:48:52.576495'),
('81b3ardfu1g8tczo2x27fa50v560ambd', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRZSWy84lY4rK-T7A4CUU_8:1np7mD:9f5EASgvzJ_VuLVSGPpEjEK0w0IH9S9wN7hpa1Np1cQ', '2022-05-12 12:23:41.400478'),
('9513wrpcgf0k2rh7mp8ny3rlm65g27dw', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRmqvAniugghC6dcfgNZUBg:1npeYG:Tdycw0IyxhOVnmDv75V6sIleXEdC3xuJE8m8f8LCzRM', '2022-05-13 23:23:28.402898'),
('9l4u4bgtvstsz662uwx3xoyzc4hvjn5b', '.eJxVjEtuxCAQRO_COkINmJ-X2c8ZEJh23DMxtgyWEo3m7rElLzK7Ur1X9WR7xa3EGVnP8kxtI2IfLMS9TeFEgfJBxHuX4vDAcoJ8j-Vr4cNSjmXip8IvWvltyfj9eblvB1Os07HWKKwzyYIF1F2nwSpIYOLghZOm66JIUjk92CxHid457_MIR5JpRGf8eVqxVlpKwJ-Vtl_WK4B_LRVqodGMtcV5DawXRkvlPUjFnRAg9OsPLLdTwg:1npIT9:zba6qqTTZrMlHVzZCskukzw6fiEl46wFEMK0h1EL0Dg', '2022-05-12 23:48:43.920052'),
('9vv6fzo2uczwl3vnicrw769943mvw9db', '.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRUoF0UnPnlbf29QYs31PZ:1npJST:XW8-as1F_Ht5JIyOEYaDJcv2YBW5uDTiADfNS6Ee4KI', '2022-05-13 00:52:05.921963'),
('9xull931x0gms0r0ej7dr6awp0ve12uf', '.eJxVjM1uwyAQhN-Fc4UWzN_62HueAYFZ19vWODJEahXl3WtLOTS30XzfzF3cGu01rSRGUVbuO7N4EzHd-hJPFLkcRL12OU1fVE9QPlP92OS01WOZ5anIJ23yshX6fn-6LwdLasuxtqR8cNmDB7LGWPADZHBpQhW0MyaprIdgJ1_0rAlDQCwzHEnnmYLD87RRa7zVSD9X3n_FOAD8a7lyj51Xaj2t1yhG5aw26B2gdAYHNI8_LV9T3g:1npi7K:S7xTCHhEI-RORaRuovCGSBq2VggVDAjEc39k0Jeyz8k', '2022-05-14 03:11:54.521689'),
('a8n90899kfqf5lsppchc0iko8o8kyhws', '.eJxVjMsOgjAURP-la9O0pU-W7v2GpqUXuSqF0JJojP8uJCx0N5lzZt5kLbDkMAJpSRqxLojkRHxY6-B35DFthP93MXR3yDtIt5CvE-2mvC0j3RV60EIvU4LH-XD_DoZQhm2tgBuro2GGgZJSMdOwyHToHLdCSxl4FI1VnUmiF-CsdS71bEsi9mC1208LlIJT9vCccXmRtmHsp8WM1VccodQwzp60XCshrRaSU22s1MJ8voDBVAk:1npf9t:pLBPpDNqXitRMDteucpwGDc-m4s6wmNnMpF3AgbKprE', '2022-05-14 00:02:21.697461'),
('agfb3bbrgijs9gll9j2kjt0j7ecf0xoi', '.eJxVjEuOwyAQRO_CeoSg-XuZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ_OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8blM7b7IQTaLQ2wimRhU1jkB6s1klmUN6MrsAEGLwPoUxiT5An9DYcpw1bo7VGvF9pe7BBCfGvpUo9dlqw9bRcIxukNWA0SCM4WKUB1OsPf_xT7w:1npthe:WotK_On9PZY1D1AJGJCnkm-SmOJRiGi53GmnJLRu4gA', '2022-05-14 15:34:10.299423'),
('bdax933tqneqnphz5me0157h9xjdkso9', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRhqtwFkegrdOydcfgNlUDQ:1nptwb:8iaJR2od6klzhb6wiis1IkhKLrRa9TT3ouHEmgfDmW4', '2022-05-14 15:49:37.026678'),
('bibex25uh79vex7jfdl2w4207fuveqfn', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtNRCgADujFHaq9cff_JT-g:1nplbS:m2XLjo0TffVzyrJ8L9TTs3t6OBST5MHHv5eMxxK42FY', '2022-05-14 06:55:14.707426'),
('c893b2myyy6fnnhapc0bvbj6tum6s8eu', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRaaC8kt1d4pad37A4BsVAc:1nplwT:hwAy5viVmRsc0Jvb4iR6iB4rqTSLKaNT6ynjfvV07aI', '2022-05-14 07:16:57.609420'),
('cb5sau8wyfcz28l5keup3x3mp994dv3k', '.eJxVjctuwyAQRf-FdYWGN3jZfb4BgRnX09Y4MkRqFeXfi6Usmt3VPfdxZ7eGR00bsomVjfpBxN5YTLe-xhNFKoOIVy-n-QvrCcpnqh87n_c6mpmfEf6kjV_2gt_vz-zLwJraOtoGhfM2O3CARmsDTkEGm-YgvLRaJ5Gl8mZ2RS4Sg_chlAWGknlBb8M52rA12mvEnysdv2xSAP9cqtRjpw1bT9s1sklYI3VQIA13yunx8_gDgHxT_w:1npgvJ:pbod4JKxLB06B6Ys-Hwpp4ObI1hSou3Dno11Id4MHng', '2022-05-14 01:55:25.755417'),
('cuzyfz9z09oaysv96gzzr4mwlwdva3f4', '.eJxVjDtuwzAQRO_COiCWK_Gn0r3PQJDiKtrEogyRBmwYvnskwEXcDea9mae4VdpKXEgMIi_cNmbxJUK8tTkcKHDeifrsUhx_qRwg_8TyvcpxLfsyyUORb1rlec10Ob3dj4M51nlfa1LWmWTBAum-12A7SGDi6JVD0_dRJeycHm3GCck7532eYE-YJnLGH6eVauW1BLpfeXuIoQP413LhFhovVFtcrkEMymhEj9Yb2SnQaMzrD4CvVAI:1noqpo:NU4ld3qSnzYgqxMalgq98AyRdANZH7wKjg0g4B1Tvkk', '2022-05-11 18:18:16.337511'),
('eg544c7tbahmohayvfapwavoxxvfgtgu', '.eJxVjEuOwyAQRO_CeoSg-XuZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ_OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8blM7b7IQTaLQ2wimRhU1jkB6s1klmUN6MrsAEGLwPoUxiT5An9DYcpw1bo7VGvF9pe7BBCfGvpUo9dlqw9bRcIxukNQBeg1XcaRtAvf4ALOVT0A:1noocB:ociWpxvAyucgy_KCI95Yn07v17_eFC8KYl9T4CCc-Iw', '2022-05-11 15:56:03.757935'),
('fhw7tue569xawkf5eavpcsmaioy9uf5a', '.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRUnmjpOdWWwHu9QYtOVPW:1nphoK:SBsgnf2NmPXioaNMLh-_WRqXAdXb0DQ9ae_MmH3Jox8', '2022-05-14 02:52:16.662807'),
('fzz2js0joud2qu7j7uivmht9vhm93jsj', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRqpglVYctNTC2NcfgGpT-g:1npHlv:4ZVPGhi_nKaZVIIKUdAnbixdYr2Mv3N5SRuGv0fbnmM', '2022-05-12 23:04:03.455911'),
('g4mpkhezygkwll9b31f10r5cwkdpt0t4', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRaKc80lVdpYKez7A4AOU_k:1npLib:d5gtqrRR82IW06cXLvmZFyThCXACexnNanOJ416ZlmI', '2022-05-13 03:16:53.719358'),
('gaeanv6e3s87petiq2iu08hwyd3xob04', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRkrvFUgedAhCmdcfgLRUBw:1nopfK:dSD7dbpJCfaSH2JQTrl1B5DNY0EAPbOHEPIXkK67W4Q', '2022-05-11 17:03:22.972900'),
('genw4ot9qe5rced950umtgeyqoaydi1p', '.eJxVjTluwzAURO_COiC4LyrT-wwEKX5F344oQaSABIbvHgpQEXeDebM8yVFhL3EBMpC8YNsRyQcJ8WhzOFHA3Al_91IcH1BOkO-xfK10XEtvJnpG6EUrva0Zvj-v7NvAHOvc2xq4dSZZZhlopTSzkiVm4ui5E0apyJOQTo82i0mAd877PLGuRJrAGX-OVqgV1xLgZ8P9lwySsX8uFmyh4QK1xWULZOBGC9X_vKVaKuslf_0BgI9UAw:1npKZN:ZMnHFjbcihQk9j6-_Z4V_sTYq2uG6kBGXPgqSp_FXEk', '2022-05-13 02:03:17.627728'),
('gikv78ij9mbylslob253g5ynp5io9bk6', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRmowTjrutdKg1OsPgGZT-g:1npKDH:J4Vxq0ItNrdM8GVuR41bSqH6edcUATVXEyF789dN80I', '2022-05-13 01:40:27.861393'),
('gmkkiujufl3wl3zimag6zmvuqsu9u8ls', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRZSG-UE9VwaZ-T7A4C8VAg:1np7P0:z0r4dGZZrjad_QkFlXBHDVn7xJBafbNaB1Zhu5a-pFg', '2022-05-12 11:59:42.953662'),
('h2w2r5w0y1ybt7694wsjj630ur76esyk', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtNSd8kJxD0YI715_gJBUBA:1nprow:9Wuaeef29BjFlyOPfY80o-wJ0Y-FnULXTnlqpedmqro', '2022-05-14 13:33:34.967118'),
('ht50sh9neoefkke7jagn7ui8e6y07wy4', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtJSu8wDcSVDK2tcfgF5T_g:1nooWK:PKTUUR95WDPySVAEvk9EvakIrrrE-o6ndqEUqFG9sEI', '2022-05-11 15:50:00.837437'),
('i4zyv7gwg0bn9zmclsjvgvjz3mdzvrjr', '.eJxVjDtuwzAQRO_COiB2KX5VpvcZCFJcRZtElCHSQALDd48EuIi7wbw3cxe3RntNK4lRlJX7zizeREy3vsQTRS4Hwdcup-mL6gnKZ6ofm5y2eiyzPBX5pE1etkLf70_35WBJbTnWhtB5mx04IKO1ATdABpumgF5ZrRNmNXgzuaJmRcH7EMoMR1J5Jm_DedqoNd5qpJ8r779iHAD-tVy5x84rtZ7WaxQjWqMMBoMg0YHV-PgDLIRTwA:1npnoU:N-zTmggn_QtHvVLg5mjWAnCZVoaCsvaZweso0cOgs7g', '2022-05-14 09:16:50.181644'),
('ih78h5q6rds6sq4xf33o4ihval3uzxoi', '.eJxVjM1qwzAQhN9F5yJWsn59zD3PICRrXW8by8FSICHk3StDDg3MYZhvZp7sVnEvcUU2srxS24nYFwvx1pZwoEC5E_GZpTj9YjlA_onle-PTVvoy8aPC37Ty85bxcnp3Pw6WWJe-1iisM8mCBdRKabADJDBx8sJJo1QUSQ5OTzbLWaJ3zvs8Q3cyzeiMP04r1kpbCXi_0v5g4wDwL6VCLTRasba4XgMbhdFSgQBr-KCk7Xr9AYABU_c:1npJ0G:2lscHZ-xKPL7JrpLoDzeOGyzTMkzRyhtYSbof1ZizNw', '2022-05-13 00:22:56.354737'),
('j3ro38tmmaf3s5amkhl8yuif2f1utxm1', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRsqggtPcKy0DqNcfgO1UBw:1nor8o:mSqA5Pqw6DPtj_UPYZf1lmO2HSxeBRCnpq5g2ZACoa0', '2022-05-11 18:37:54.886261'),
('jm7bqze5kdgtmxtqll4tw6xm3v4zfupt', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRbKS-kNNcpKpeX7A4D2VAo:1nph1I:KFZOqwejNw0SqwQKdVg0xGn1x_VVT3x4sDhcH5eXbh0', '2022-05-14 02:01:36.661344'),
('kpxsy41yesk0huch7sewige7xajggprv', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtNSiA6W511Yo615_gFVUAw:1npm8H:dfyYYXUk8YqrT--iH8nMGu-3TM47ZmgRuoeZTZc37r4', '2022-05-14 07:29:09.346376'),
('kv3gwbal9g4vewxymoqpsh5vv8iey699', '.eJxVjUuOwyAQRO_CeoQazNfL7HMGBKY97pkYR4ZIiaLcfbCUxWRXqlefJ7tV3EtckY0sr9R2IvbFQry1JRwoUO5EfHopTr9YDpB_Yvne-LSV3kz8iPA3rfy8Zbyc3tmPgSXWpbc1CutMsmABtVIa7AAJTJy8cNIoFUWSg9OTzXKW6J3zPs_QlUwzOuOP0Yq10lYC3q-0P9g4APxzqVALjVasLa7XwEZhtFTWK6E4qKGfyNcfgH5T-g:1npdNm:RXWDjwDx1m5meSAGYebLEUq_utO3rjxH1sM28Z0KQwQ', '2022-05-13 22:08:34.051261'),
('mt04hjt6tltqgmxbcss3wwqpaodst3p0', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtFTOWAAuOmm9Eq8_gHRT_A:1npfHI:-8rY5SgTsBLwWiG8s0UokrSwSnyALjrYxJTXVsokYhU', '2022-05-14 00:10:00.151796'),
('o2fgbzx9uupcz13q945n1doujqa37v4n', '.eJxVjEuOwyAQRO_CeoSgMT8vs88ZEJj2uGdiHBkiJYpy98FSFpNdqV7Ve7Jbxb3EFdnI8kptJ2JfLMRbW8KBAuVO5GeX4vSL5QD5J5bvjU9b6c_Ejwl_08rPW8bL6b39ECyxLv2tUVpnkhVWoB4GLawSSZg4eenADEOUCZTTk80wA3rnvM-z6AnSjM74Q1qxVtpKwPuV9gcblRD_WirUQqMVa4vrNbBRGg3Kd7vm4BRYeP0BLRlT0Q:1npIGv:vFP2JtdObAEVPciYHhbPOqr1mxlG9yywMIK2TN_zJjk', '2022-05-12 23:36:05.372218'),
('p2nl6d0ljgqdk5to2zl1f6etjye8uo8v', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRbSWy4NVYILq_37A4CSVAM:1npHyi:GSM3Ata834CM9FbYSia2QAzdNFF6Uut0tvb2ANiRfN4', '2022-05-12 23:17:16.493235'),
('p49kp7rz027l7n2bu6pe0469bs8p0ksd', '.eJxVjMsOgjAURP-la9O0pU-W7v2GpqUXuSqF0JJojP8uJCx0N5lzZt5kLbDkMAJpSRqxLojkRHxY6-B35DFthP93MXR3yDtIt5CvE-2mvC0j3RV60EIvU4LH-XD_DoZQhm2tgBuro2GGgZJSMdOwyHToHLdCSxl4FI1VnUmiF-CsdS71bEsi9mC1208LlIJT9vCccXmRtmHsp8WM1VccodQwzp60XCvRKGm4oZI7pfTnCyzcU9E:1np6wX:-Ut43QbCkTXGjX2TAQ4jvJmZRGoz0SpzIfHRygVFHp0', '2022-05-12 11:30:17.447538'),
('p9arek2roufvdmv4nua399tzqojqw6xf', '.eJxVjEuOwyAQRO_CeoSaXwNeZp8zIDDtMTMxjgyREkW5-9hSFpNdqd6rerJbo63GhdjA8lL6Vgr7YiHe-hwOFEreifjsUhx_qR4g_8T6vfJxrfsy8UPhb9r4ec10Ob3dj4M5tnlfGxLWYbJggYzWBqyCBBhHL5xEraNIUjkz2iwnSd457_MEe5JpIof-OG3UWllroPu1bA82KIB_bamlh14Waj0u18AGgUYahRaQI6DRyr3-AICRVAM:1npsHq:U3HuZoMU9CNupbbjYO7g4LODpTr762zGcIiHSF5Mg0Y', '2022-05-14 14:03:26.609544'),
('pa3do3f1vbonclpekd9u7x7a0pdpa8bf', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRbSKGMkFV5yZ_n7A4CiVAM:1np9Wx:HkM_vJJE-1h08oPTjc3jkDidyMKTydWkNqVj5GI0RCw', '2022-05-12 14:16:03.297187'),
('q23bqdj7k82z3ijz87x7y1kuy2vana8b', '.eJxVjEtuxCAQRO_COkLQmJ-X2c8ZEJh23DMxtgyWEo3m7rElLzK7Ur1X9WR7xa3EGVnP8kxtI2IfLMS9TeFEgfJB5HuX4vDAcoJ8j-Vr4cNSjmXip8IvWvltyfj9eblvB1Os07HWKK0zyQorUHedFlaJJEwcvHRgui7KBMrpwWYYAb1z3udRHAnSiM7487RirbSUgD8rbb-sV0L8a6lQC41mrC3Oa2C9NBq0dA6AK2_AK3j9AYCpVAQ:1npndO:GrN6oULZel-NQq_lHq4V8J44KJvAjufraAhdbdBDpjU', '2022-05-14 09:05:22.408293'),
('qijompjgh3w78gpqo3aqji2zafunnpc0', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRuqgvLZcBDBC2dcfgMpUAw:1nph8Y:MXRwXUHXiz-3gy5SJh4Izsy-Lz1DKN1cA9oNqq4fFh0', '2022-05-14 02:09:06.211513'),
('r3u6qnjc96r2ewmb42c2eua3cba7h111', '.eJxVjM1uwyAQhN-Fc4UAL38-5p5nQGDW9bYxjgyREkV592Iph-Y0o_lm5sluFfcSV2Qjyyu1nYh9sRBvbQkHCpQ7kZ9ZitMvlgPkn1i-Nz5tpS8TPyr8TSs_bxkvp3f342CJdelrjdI6k6ywAjWAFnYQSZg4eemUAYgyqcHpyWY1K_TOeZ9n0Z1KMzrjj9OKtdJWAt6vtD_YOAjxL6VCLTRasba4XgMbpdFKDxaM5ABdAV5_gIlUAA:1npsU1:kHhEPlGDtjJMixqjQebwfc24A8I7dSmiocSxDPzlSHA', '2022-05-14 14:16:01.455744'),
('rh0clx1n3x5n24rxomz6zs8bs9o5avrf', '.eJxVjM2uwiAUhN-FtSFA-Tl06d5nIFBO7bnXUlMw0Rjf3TZxobvJfN_Mk90qriXOyHqWZ2orETuwEG9tCjsKlDcif7sUh38sO8h_sZwXPixlWya-K_xDKz8tGS_Hj_tzMMU6bWuD0oFNTjiBRmsjXCeSsHHwEpTVOsqkOjCDy2pU6AG8z6PYkkojgvX7acVaaSkB71daH6zvhPhqqVALjWasLc7XwHppjeq0M1JyZyyAhtcbgJxUCw:1np54J:UnMeTD-HN2EDLc4ABqqnJSmzhb8NdKu_PKkJH9DOEE8', '2022-05-12 09:30:11.783865'),
('sqnyuz3aqsu7hl98wumj8smokmna7pbq', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRhplQWmurBHaq9cfgEdT-w:1nps70:CTV4fMenHtNzoeOLiCXTJWEZKmxKFes8rbtHlB5wGf0', '2022-05-14 13:52:14.387139'),
('v77pa6mfviobgxvqhodqjhzanhr77uda', '.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRUjmloOMgpHfGvt6AVlQA:1npegF:KtK7Ip-uWSI2NkOQEFNunh-ubhKrw_5TalO6Pfp9l98', '2022-05-13 23:31:43.024964'),
('v9liciilhhoy1tyw7klxdnphu2ozpw46', '.eJxVjUuOwyAQRO_CeoQazNfL7HMGBKY97pkYR4ZIiaLcfbCUxWRXqlefJ7tV3EtckY0sr9R2IvbFQry1JRwoUO5EfHopTr9YDpB_Yvne-LSV3kz8iPA3rfy8Zbyc3tmPgSXWpbc1CutMsmABtVIa7AAJTJy8cNIoFUWSg9OTzXKW6J3zPs_QlUwzOuOP0Yq10lYC3q-0P9g4APxzqVALjVasLa7XwEZhtOxXSmrurbYgX38s5lPO:1npuIL:stiIaMc7-0yVX_sI1S7ZJVaiMu7e1SKySyjTg2iU27w', '2022-05-14 16:12:05.994698'),
('v9r0rvo4bpxhzjc4g661qp30eokk22h7', '.eJxVjMsKwjAURP8lawl5P7p07zeEpLm1V21amgiK-O-24EJ3w5wz8yL3CmuJE5CO5AnbikgOJMR7G8OOAuaN8P8uxf4KZQf5Est5pv1ctmWiu0K_tNLTnOF2_Lp_B2Os47bWwK0zyTLLQCulmZUsMRN7z50wSkWehHS6t1kMArxz3ueBbUmkAZzx-2mFWnEuAR4Lrk_SScZ-WizYQsMJaovTEkjHjRZaSKsM9d5I6-z7A4DuVBQ:1npoup:CSX3jxndZw0M_tymqY496t_7gq3et1eopBoIlZ321KE', '2022-05-14 10:27:27.014381'),
('vc7zy5fx01817j0f2g4vhhpfuxgffh1y', '.eJxVjU1uwyAQhe_CukKAgQEvs88ZEJhxPW2MI0OkRFHuXixl0eye3vd-nuxWcS9xRTayvFLbidgXC_HWlnCgQLkT-emlOP1iOUD-ieV749NWejPxI8LftPLzlvFyemc_BpZYl942KMHZBAIEGq2NgEEkYePkpVNW6yiTGpyZIKtZoXfO-zyLrlSa0Vl_jFaslbYS8H6l_cHGQYh_LhVqodGKtcX1GtgorVEaPGjgEvqHHF5_gP1UBg:1npdT9:I6R93rCRBy1mCLLZjJvFyUmOGLHPlJ0Y92fu0xBQqlQ', '2022-05-13 22:14:07.191628'),
('vjvp2u6kzuqp9c584qqtqcjvf0g8jino', '.eJxVjM2uwiAUhN-FtSEHym-X7n0GAuXUnnstNQUTjfHdbRMXupvM98082a3iWuKMrGd5prYSsQML8damsKNAeSPit0tx-Meyg_wXy3nhw1K2ZeK7wj-08tOS8XL8uD8HU6zTttYorDPJggXUSmmwHSQwcfDCSaNUFEl2Tg82y1Gid877PMKWZBrRGb-fVqyVlhLwfqX1wfoO4KulQi00mrG2OF8D64XRstNOWckFWAX69QYswFPG:1np7v6:k1zpnZfaKWjsAZVsPvu-yafjzac3Zgva9qgrJTeDiek', '2022-05-12 12:32:52.138386'),
('vz0mch2254zy91p5xlefibkf1s1f8aef', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtFROC9lxrcAa7V5_gHNUAg:1nperr:6JUYBa4UZFeDWlu_-nXSK4X6q76fc8vHuQWFZOiFbcc', '2022-05-13 23:43:43.611762'),
('w89ux4wpbphk9zeprr10ow27n2khudc5', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRsoAWkluQSir3OsPgB1T9g:1noqDg:VqurRgePV6O-bz_nWeVAUr_5KbETROZLF1lUK7Ox7IM', '2022-05-11 17:38:52.620350'),
('wczpbtqsk6d7fhxcopyk9g5x0ctsu74o', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtNRCeA9cC6UlyNcfgElT9A:1nplrC:4coqtvGd2BWcStrtz6j1hAiBtkO4yJrtTXm5CnuyE3o', '2022-05-14 07:11:30.525521'),
('x76dh89k8l3q7s0emm7k0dbr2m4zv4jv', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRhothAKuwDjn1OsPf_VT9g:1nptRC:PkLKimoVG8vr0yK9YnMFZfwDUp5elFdSWsxC_ujuQ7I', '2022-05-14 15:17:10.316772'),
('xep20ikib77zjrekr98qub7twsjor4nz', '.eJxVjEuOwyAQRO_CeoQazKfxMvucAYFpj5mJcWSIlCjK3QdLWUx2pXqv6slulfYSVmIjS2tue87si_lwa4s_kM-pE_HZxTD9UjlA-gnle-PTVvoy8kPhb1r5eUt0Ob3dj4Ml1KWvNQmLJlqwQFopDXaACCZMTqA0SgUR5YB6sknOkhyic2mGnmScCY07TivVmrfi6X7N-4ONA8C_NpfcfMsr1RbWq2ejMFoqQAPIe3Lo1OsPgLNUDQ:1npKxk:LnyZiZ4U7xe4lKNzJN65nojPBCTvvS-Xft2itlehk2U', '2022-05-13 02:28:28.662982'),
('xxnuj2zpw50rq6tdlgt0siwwv4vf6640', '.eJxVjEuOwyAQRO_CeoSaP3iZfc6AwLTHPRPjyBApUZS7jy1lMdmV6r2qJ7s13GpakA2sLNQ3IvbFYrr1OR4oUtmJ-OxyGn-xHqD8pPq98nGt-zLzQ-Fv2vh5LXg5vd2Pgzm1eV8bFM7b7MABGq0NOAUZbBqD8NJqnUSWypvRFTlJDN6HUCbYk8wTehuO04at0Voj3q-0PdigAP61VKnHTgu2npZrZIOwRmrnlRJcQtBa6NcfgHJT-g:1npd6J:W3_6bdNlkCdobA-p-SMfb1oBTyZCT3eLAktNoY_nh80', '2022-05-13 21:50:31.236424'),
('ygtbikl6808yacquuo7xg4bxkg3rdnde', '.eJxVjEtuxCAQRO_COkLQmJ-X2c8ZEJh23DMxtgyWEo3m7rElLzK7Ur1X9WR7xa3EGVnP8kxtI2IfLMS9TeFEgfJB5HuX4vDAcoJ8j-Vr4cNSjmXip8IvWvltyfj9eblvB1Os07HWKK0zyQorUHedFlaJJEwcvHRgui7KBMrpwWYYAb1z3udRHAnSiM7487RirbSUgD8rbb-sV0L8a6lQC41mrC3Oa2C9NBrAgbKSg_TWKvX6A4BmU_8:1noo7f:1MC10QLnc7XC2e-2PfGlT5EnJItw9GMK2cFxWRDS0m0', '2022-05-11 15:24:31.231765'),
('ysljprtkxzvacmpmrpayzowlmsqkvx6o', '.eJxVjEtuhDAQRO_idWS1jb8ss58zWDZuQs8Eg7CREo3m7gGJRWZXqveqnmyvuJU4I-tZnqltROyDhbi3KZwoUD6IeO9SHB5YTpDvsXwtfFjKsUz8VPhFK78tGb8_L_ftYIp1OtYahXUmWbCAWikNtoMEJg5eOGmUiiLJzunBZjlK9M55n0c4kkwjOuPP04q10lIC_qy0_bK-A_jXUqEWGs1YW5zXwHphtFQOpFNceTAd-NcfgIdUAQ:1npdbo:u_LTEEleHWNbPltP1bnJgWP8AHBOeNKb5GQghL_wl6c', '2022-05-13 22:23:04.499625'),
('ztj358k985poo49qjftkseard3dtgo8v', '.eJxVjMsOgjAURP-la9P0QV8s3fsNTUsvclUKoSXRGP9dSFjobjLnzLzJWmDJYQTSkjRiXRDJifiw1sHvyGPaCP_vYujukHeQbiFfJ9pNeVtGuiv0oIVepgSP8-H-HQyhDNtaATdWR8MMA9U0ihnJItOhc9wK3TSBRyGt6kwSvQBnrXOpZ1sSsQer3X5aoBScsofnjMuLtJKxnxYzVl9xhFLDOHvScq2EkkpyTbmV2in9-QKAeFQF:1nprvQ:ecOOddwD5UYkvrUBChxuIdoFYBa3PTd79HrH_aOVv30', '2022-05-14 13:40:16.257698');

-- --------------------------------------------------------

--
-- Table structure for table `layouts_company`
--

CREATE TABLE `layouts_company` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layouts_company`
--

INSERT INTO `layouts_company` (`id`, `company_id`, `company_name`, `created_at`, `updated_at`) VALUES
(41, 2, 'cccc', '2022-05-14 09:09:42.740394', '2022-05-14 09:09:42.740394'),
(42, 3, 'eee', '2022-05-14 07:24:05.965149', '2022-05-14 07:24:05.965149'),
(43, 1, 'ssss', '2022-05-14 15:21:20.395474', '2022-05-14 15:21:20.395474'),
(44, 6, 'ghg', '2022-05-14 15:55:03.018468', '2022-05-14 15:55:03.018468'),
(45, 9, 'kkk', '2022-05-14 16:02:35.147385', '2022-05-14 16:02:35.147385');

-- --------------------------------------------------------

--
-- Table structure for table `layouts_companyplanogram`
--

CREATE TABLE `layouts_companyplanogram` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `planogram_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `layouts_companyproduct`
--

CREATE TABLE `layouts_companyproduct` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layouts_companyproduct`
--

INSERT INTO `layouts_companyproduct` (`id`, `company_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 42, 58, '2022-05-14 07:24:08.935380', '2022-05-14 07:24:08.935380'),
(2, 42, 55, '2022-05-14 07:24:08.969380', '2022-05-14 07:24:08.969380'),
(3, 42, 62, '2022-05-14 07:24:09.047374', '2022-05-14 07:24:09.047374'),
(4, 42, 53, '2022-05-14 07:24:09.088379', '2022-05-14 07:24:09.089379'),
(5, 42, 54, '2022-05-14 07:24:09.097376', '2022-05-14 07:24:09.097376'),
(6, 41, 51, '2022-05-14 09:09:46.581427', '2022-05-14 09:09:46.581427'),
(7, 41, 54, '2022-05-14 09:09:46.636425', '2022-05-14 09:09:46.636425'),
(8, 43, 64, '2022-05-14 15:21:24.177328', '2022-05-14 15:21:24.177328'),
(9, 43, 55, '2022-05-14 15:21:24.206282', '2022-05-14 15:21:24.206282'),
(10, 43, 63, '2022-05-14 15:21:24.226334', '2022-05-14 15:21:24.226334'),
(11, 43, 58, '2022-05-14 15:21:24.258330', '2022-05-14 15:21:24.258330'),
(12, 43, 51, '2022-05-14 15:21:24.280331', '2022-05-14 15:21:24.280331'),
(13, 43, 60, '2022-05-14 15:21:24.291332', '2022-05-14 15:21:24.291332'),
(14, 43, 59, '2022-05-14 15:21:24.304320', '2022-05-14 15:21:24.304320'),
(15, 43, 54, '2022-05-14 15:21:24.330332', '2022-05-14 15:21:24.330332'),
(16, 43, 57, '2022-05-14 15:21:24.352332', '2022-05-14 15:21:24.352332'),
(17, 43, 62, '2022-05-14 15:21:24.387332', '2022-05-14 15:21:24.387332'),
(18, 43, 53, '2022-05-14 15:21:24.435329', '2022-05-14 15:21:24.435329'),
(19, 44, 64, '2022-05-14 15:55:06.811168', '2022-05-14 15:55:06.811168'),
(20, 44, 55, '2022-05-14 15:55:06.837167', '2022-05-14 15:55:06.837167'),
(21, 44, 63, '2022-05-14 15:55:06.846168', '2022-05-14 15:55:06.846168'),
(22, 44, 58, '2022-05-14 15:55:06.881162', '2022-05-14 15:55:06.881162'),
(23, 44, 51, '2022-05-14 15:55:06.921166', '2022-05-14 15:55:06.921166'),
(24, 44, 60, '2022-05-14 15:55:06.932165', '2022-05-14 15:55:06.932165'),
(25, 44, 59, '2022-05-14 15:55:06.953165', '2022-05-14 15:55:06.953165'),
(26, 44, 54, '2022-05-14 15:55:06.973888', '2022-05-14 15:55:06.974883'),
(27, 44, 57, '2022-05-14 15:55:07.002875', '2022-05-14 15:55:07.002875'),
(28, 44, 62, '2022-05-14 15:55:07.059658', '2022-05-14 15:55:07.059658'),
(29, 44, 53, '2022-05-14 15:55:07.113658', '2022-05-14 15:55:07.113658'),
(30, 45, 64, '2022-05-14 16:02:38.714562', '2022-05-14 16:02:38.714562'),
(31, 45, 55, '2022-05-14 16:02:38.738563', '2022-05-14 16:02:38.738563'),
(32, 45, 63, '2022-05-14 16:02:38.746561', '2022-05-14 16:02:38.746561'),
(33, 45, 58, '2022-05-14 16:02:38.770564', '2022-05-14 16:02:38.770564'),
(34, 45, 51, '2022-05-14 16:02:38.786563', '2022-05-14 16:02:38.786563'),
(35, 45, 60, '2022-05-14 16:02:38.801561', '2022-05-14 16:02:38.801561'),
(36, 45, 59, '2022-05-14 16:02:38.812562', '2022-05-14 16:02:38.812562'),
(37, 45, 54, '2022-05-14 16:02:38.830562', '2022-05-14 16:02:38.830562'),
(38, 45, 57, '2022-05-14 16:02:38.846534', '2022-05-14 16:02:38.846534'),
(39, 45, 62, '2022-05-14 16:02:38.869562', '2022-05-14 16:02:38.869562'),
(40, 45, 53, '2022-05-14 16:02:38.896563', '2022-05-14 16:02:38.896563');

-- --------------------------------------------------------

--
-- Table structure for table `layouts_planogram`
--

CREATE TABLE `layouts_planogram` (
  `id` int(11) NOT NULL,
  `planogram_id` int(11) NOT NULL,
  `planogram_name` varchar(255) NOT NULL,
  `planogram_photo` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `layouts_planogramproduct`
--

CREATE TABLE `layouts_planogramproduct` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `planogram_id` int(11) NOT NULL,
  `rows` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `layouts_processresult`
--

CREATE TABLE `layouts_processresult` (
  `id` int(11) NOT NULL,
  `store_image_id` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layouts_processresult`
--

INSERT INTO `layouts_processresult` (`id`, `store_image_id`, `result`, `created_at`, `updated_at`) VALUES
(1, 41, 1, '2022-05-14 06:35:34.488749', '2022-05-14 06:35:34.488749'),
(2, 42, 1, '2022-05-14 06:36:54.646822', '2022-05-14 06:36:54.646822'),
(3, 43, 1, '2022-05-14 06:37:35.578048', '2022-05-14 06:37:35.578048'),
(4, 44, 1, '2022-05-14 06:43:00.591112', '2022-05-14 06:43:00.591112'),
(5, 45, 1, '2022-05-14 06:50:14.605429', '2022-05-14 06:50:14.605429'),
(6, 49, 1, '2022-05-14 07:24:09.238377', '2022-05-14 07:24:09.238377'),
(7, 50, 1, '2022-05-14 09:09:46.760428', '2022-05-14 09:09:46.760428'),
(8, 51, 1, '2022-05-14 15:21:24.613332', '2022-05-14 15:21:24.613332'),
(9, 52, 1, '2022-05-14 15:55:07.288660', '2022-05-14 15:55:07.288660'),
(10, 53, 1, '2022-05-14 16:02:39.003558', '2022-05-14 16:02:39.003558');

-- --------------------------------------------------------

--
-- Table structure for table `layouts_product`
--

CREATE TABLE `layouts_product` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_photo` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layouts_product`
--

INSERT INTO `layouts_product` (`id`, `product_id`, `product_name`, `product_photo`, `order`, `status`, `created_at`, `updated_at`, `description`) VALUES
(50, '388c1c1a-edee-4eac-b7f9-176c1ca64a6a', 'Аранаит', '', 1, 1, '2022-05-14 07:23:26.208973', '2022-05-14 07:23:26.208973', ''),
(51, '5597b75a-d61f-4201-8386-810c6a8f9008', 'Bugulma', '', 2, 1, '2022-05-14 07:23:26.213975', '2022-05-14 07:23:26.213975', ''),
(52, '1145d8e1-d2bb-480b-b90b-0bf3119ef717', 'Очистить поле', '', 3, 1, '2022-05-14 07:23:26.216977', '2022-05-14 07:23:26.216977', ''),
(53, '62a91ed9-7bd8-4416-9111-015f679394a9', 'Count Ledoff', 'products/42c10847-8fb5-46c6-94af-4cc19ca36dae.png', 4, 1, '2022-05-14 14:07:48.751236', '2022-05-14 14:07:48.751236', ''),
(54, 'e6c5b5ac-6286-4ad4-8551-deee9493532a', 'Count Ledoff Desser', 'products/d933290d-9aa0-4660-aed4-026509508359.png', 5, 1, '2022-05-14 14:08:07.323217', '2022-05-14 14:08:07.323217', ''),
(55, 'efd4521e-a6c8-477f-a48c-f3dee59986cc', 'Epiphany', '', 6, 1, '2022-05-14 07:23:26.224971', '2022-05-14 07:23:26.224971', ''),
(56, 'afb36b83-c679-46b9-bc7d-6d1e435aff3a', 'Glen Rivers', '', 7, 1, '2022-05-14 07:23:26.227972', '2022-05-14 07:23:26.227972', ''),
(57, 'c9ec2165-076c-45d4-9c7d-fbfb761ab1f3', 'Khanskaya', '', 8, 1, '2022-05-14 07:23:26.230972', '2022-05-14 07:23:26.230972', ''),
(58, '3f8f08d5-a4bc-4715-bfe3-e690a25f0541', 'Khlebnaya', '', 9, 1, '2022-05-14 07:23:26.233970', '2022-05-14 07:23:26.233970', ''),
(59, 'f86197f8-4ba8-4571-a447-161f6538980f', 'King Cedar', '', 10, 1, '2022-05-14 07:23:26.235973', '2022-05-14 07:23:26.235973', ''),
(60, '2f58cbe1-b96e-42e7-a0d9-98d538adb2e9', 'King Cedar Tincture', '', 11, 1, '2022-05-14 07:23:26.237972', '2022-05-14 07:23:26.237972', ''),
(61, 'b8e568fd-bcd3-46f1-b782-26a39fc7cbf3', 'Old Kazan', '', 12, 1, '2022-05-14 07:23:26.239972', '2022-05-14 07:23:26.239972', ''),
(62, 'e8c9b7b0-144d-42e7-878f-3f2d4bfa4a6d', 'Tundra', 'products/ec889b60-2eea-4780-9e06-3118f8a11318.png', 13, 1, '2022-05-14 14:08:33.944621', '2022-05-14 14:08:33.944621', ''),
(63, '8f1609b3-b1da-4e9b-823f-69124f62feff', 'Tundra Bitte', '', 14, 1, '2022-05-14 07:23:26.244973', '2022-05-14 07:23:26.244973', ''),
(64, '167f0acd-bb56-4957-ab65-ff92ed88e891', 'Your Choic', '', 15, 1, '2022-05-14 07:23:26.247975', '2022-05-14 07:23:26.247975', '');

-- --------------------------------------------------------

--
-- Table structure for table `layouts_resultimage`
--

CREATE TABLE `layouts_resultimage` (
  `id` int(11) NOT NULL,
  `result_id` int(11) NOT NULL,
  `result_image_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layouts_resultimage`
--

INSERT INTO `layouts_resultimage` (`id`, `result_id`, `result_image_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'result/19f2583f-bf1c-42c0-aad1-4d333fa2b3f0.jpg', '2022-05-14 06:35:34.502746', '2022-05-14 06:35:34.502746'),
(2, 2, 'result/8f5d29e1-0b41-46be-b8c0-1ce1f3e1b484.jpg', '2022-05-14 06:36:54.649822', '2022-05-14 06:36:54.649822'),
(3, 3, 'result/be5cc632-de9b-4a7c-b801-44be5f438167.jpg', '2022-05-14 06:37:35.588047', '2022-05-14 06:37:35.588047'),
(4, 4, 'result/5cc327be-c241-487c-9190-c97fcd437efd.jpg', '2022-05-14 06:43:00.600117', '2022-05-14 06:43:00.600117'),
(5, 5, 'result/ff14feeb-4fbc-475e-9d36-95beb375255c.jpg', '2022-05-14 06:50:14.609430', '2022-05-14 06:50:14.609430'),
(6, 6, 'result/191f9649-7277-4c9a-8fe4-a9e877af85e0.jpg', '2022-05-14 07:24:09.248381', '2022-05-14 07:24:09.248381'),
(7, 7, 'result/e3dd9b92-9916-45c6-a715-ff6fa0af0954.jpg', '2022-05-14 09:09:46.764430', '2022-05-14 09:09:46.764430'),
(8, 8, 'result/5b168e9c-f756-4eb6-9271-a9530570e952.jpg', '2022-05-14 15:21:24.617324', '2022-05-14 15:21:24.617324'),
(9, 9, 'result/100b8d89-7c7f-4cea-be4a-efa8a6d80a52.jpg', '2022-05-14 15:55:07.293656', '2022-05-14 15:55:07.293656'),
(10, 10, 'result/aaa5ff94-e725-4a8a-9b3f-bebc418a218d.jpg', '2022-05-14 16:02:39.007561', '2022-05-14 16:02:39.007561');

-- --------------------------------------------------------

--
-- Table structure for table `layouts_storeimage`
--

CREATE TABLE `layouts_storeimage` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `photo_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layouts_storeimage`
--

INSERT INTO `layouts_storeimage` (`id`, `company_id`, `user_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(41, 2, 1, 'store/19f2583f-bf1c-42c0-aad1-4d333fa2b3f0.jpg', '2022-05-14 06:35:30.429270', '2022-05-14 06:35:30.429270'),
(42, 3, 1, 'store/8f5d29e1-0b41-46be-b8c0-1ce1f3e1b484.jpg', '2022-05-14 06:36:50.765006', '2022-05-14 06:36:50.765006'),
(43, 3, 1, 'store/be5cc632-de9b-4a7c-b801-44be5f438167.jpg', '2022-05-14 06:37:31.681281', '2022-05-14 06:37:31.681281'),
(44, 2, 1, 'store/5cc327be-c241-487c-9190-c97fcd437efd.jpg', '2022-05-14 06:42:56.602838', '2022-05-14 06:42:56.602838'),
(45, 1, 1, 'store/ff14feeb-4fbc-475e-9d36-95beb375255c.jpg', '2022-05-14 06:50:10.883456', '2022-05-14 06:50:10.883456'),
(49, 3, 3, 'store/191f9649-7277-4c9a-8fe4-a9e877af85e0.jpg', '2022-05-14 07:24:05.982149', '2022-05-14 07:24:05.982149'),
(50, 2, 1, 'store/e3dd9b92-9916-45c6-a715-ff6fa0af0954.jpg', '2022-05-14 09:09:42.754393', '2022-05-14 09:09:42.754393'),
(51, 1, 1, 'store/5b168e9c-f756-4eb6-9271-a9530570e952.jpg', '2022-05-14 15:21:20.417472', '2022-05-14 15:21:20.417472'),
(52, 6, 5, 'store/100b8d89-7c7f-4cea-be4a-efa8a6d80a52.jpg', '2022-05-14 15:55:03.026467', '2022-05-14 15:55:03.026467'),
(53, 9, 8, 'store/aaa5ff94-e725-4a8a-9b3f-bebc418a218d.jpg', '2022-05-14 16:02:35.156385', '2022-05-14 16:02:35.156385');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `layouts_company`
--
ALTER TABLE `layouts_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_companyplanogram`
--
ALTER TABLE `layouts_companyplanogram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_companyproduct`
--
ALTER TABLE `layouts_companyproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_planogram`
--
ALTER TABLE `layouts_planogram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_planogramproduct`
--
ALTER TABLE `layouts_planogramproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_processresult`
--
ALTER TABLE `layouts_processresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_product`
--
ALTER TABLE `layouts_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_resultimage`
--
ALTER TABLE `layouts_resultimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layouts_storeimage`
--
ALTER TABLE `layouts_storeimage`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `layouts_company`
--
ALTER TABLE `layouts_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `layouts_companyplanogram`
--
ALTER TABLE `layouts_companyplanogram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layouts_companyproduct`
--
ALTER TABLE `layouts_companyproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `layouts_planogram`
--
ALTER TABLE `layouts_planogram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layouts_planogramproduct`
--
ALTER TABLE `layouts_planogramproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `layouts_processresult`
--
ALTER TABLE `layouts_processresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `layouts_product`
--
ALTER TABLE `layouts_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `layouts_resultimage`
--
ALTER TABLE `layouts_resultimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `layouts_storeimage`
--
ALTER TABLE `layouts_storeimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

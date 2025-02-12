/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `course_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course` varchar(50) NOT NULL,
  `mentor` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `course_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `course_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_customuser_groups_customuser_id_group_id_2f3de9bf_uniq` (`customuser_id`,`group_id`),
  KEY `course_customuser_groups_group_id_7c58e85e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `course_customuser_gr_customuser_id_3ff738a2_fk_course_cu` FOREIGN KEY (`customuser_id`) REFERENCES `course_customuser` (`id`),
  CONSTRAINT `course_customuser_groups_group_id_7c58e85e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `course_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_customuser_user_p_customuser_id_permission_bf931559_uniq` (`customuser_id`,`permission_id`),
  KEY `course_customuser_us_permission_id_88d74dc4_fk_auth_perm` (`permission_id`),
  CONSTRAINT `course_customuser_us_customuser_id_fe905f87_fk_course_cu` FOREIGN KEY (`customuser_id`) REFERENCES `course_customuser` (`id`),
  CONSTRAINT `course_customuser_us_permission_id_88d74dc4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `course_usercourse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_usercourse_course_id_01b67019_fk_course_course_id` (`course_id`),
  KEY `course_usercourse_user_id_33343d3c_fk_course_customuser_id` (`user_id`),
  CONSTRAINT `course_usercourse_course_id_01b67019_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  CONSTRAINT `course_usercourse_user_id_33343d3c_fk_course_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `course_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course` varchar(50) NOT NULL,
  `mentor` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_course_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_course_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `course_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `userCourse` (
  `id_user` int DEFAULT NULL,
  `id_course` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Member');


INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(2, 1, 29);
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(3, 1, 30);
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(4, 1, 31);
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 32);

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add course', 6, 'add_course'),
(22, 'Can change course', 6, 'change_course'),
(23, 'Can delete course', 6, 'delete_course'),
(24, 'Can view course', 6, 'view_course'),
(25, 'Can add user', 7, 'add_customuser'),
(26, 'Can change user', 7, 'change_customuser'),
(27, 'Can delete user', 7, 'delete_customuser'),
(28, 'Can view user', 7, 'view_customuser'),
(29, 'Can add user course', 8, 'add_usercourse'),
(30, 'Can change user course', 8, 'change_usercourse'),
(31, 'Can delete user course', 8, 'delete_usercourse'),
(32, 'Can view user course', 8, 'view_usercourse');

INSERT INTO `course_course` (`id`, `course`, `mentor`, `title`) VALUES
(1, 'C++', 'Ari', 'Dr.');
INSERT INTO `course_course` (`id`, `course`, `mentor`, `title`) VALUES
(2, 'C#', 'Ari', 'Dr.');
INSERT INTO `course_course` (`id`, `course`, `mentor`, `title`) VALUES
(3, 'C#', 'Ari', 'Dr.');
INSERT INTO `course_course` (`id`, `course`, `mentor`, `title`) VALUES
(4, 'CSS', 'Cania', 'S.Kom'),
(5, 'HTML', 'Cania', 'S.Kom'),
(6, 'Javascript', 'Cania', 'S.Kom'),
(7, 'Python', 'Barry', 'S.T.'),
(8, 'Micropython', 'Barry', 'S.T.'),
(9, 'Java', 'Darren', 'M.T.'),
(10, 'Ruby', 'Darren', 'M.T.');

INSERT INTO `course_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(1, 'pbkdf2_sha256$720000$fRKBbXYgUxq7kftHkAoj9V$E0/NVW60+hDXqvLxiGH8NXKVz9jhH/yGLILTxdmP9zg=', '2024-07-23 03:03:03.526259', 0, 'Andi', '', '', 1, 1, '2019-01-28 05:15:29.000000', 'andi@andi.com');
INSERT INTO `course_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(2, 'pbkdf2_sha256$720000$u0yU11LacDjdJVxTJK3yN6$lOrMDfZDKPm5Z25ZmcWId92FSr1uwlMREtnp1byVmsI=', '2019-01-28 05:15:29.000000', 0, 'Budi', '', '', 1, 1, '2019-01-28 05:15:29.000000', 'budi@budi.com');
INSERT INTO `course_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(3, 'pbkdf2_sha256$720000$j6ES1YtcNXhW1IvspNIpRF$SZGxKwcL5TP9aZ6ncBQNXw1tdVgdK2gNmj2V6oVSalI=', '2024-07-23 03:09:51.319157', 0, 'Caca', '', '', 1, 1, '2019-01-28 05:15:29.000000', 'caca@caca.com');
INSERT INTO `course_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`) VALUES
(4, 'pbkdf2_sha256$720000$tNsPPzXjCZlUjsL1k3zMYD$fPNsQvSh4l1Eg3RXaab4cUfp+yzX5X7rgrocA8AxkCw=', '2019-01-28 05:15:29.000000', 0, 'Deni', '', '', 1, 1, '2019-01-28 05:15:29.000000', 'deni@deni.com'),
(5, 'pbkdf2_sha256$720000$wBkU4A40lIscOlTa2JRZke$yPQkJ6UcFZluV8EVw5xAeg3Z6wwST+IejhmtEa919fE=', '2019-01-28 05:15:29.000000', 0, 'Euis', '', '', 1, 1, '2019-01-28 05:15:29.000000', 'euis@euis.com'),
(6, 'pbkdf2_sha256$720000$x5tTkHDGgai2Q04cuXxAiW$B+lb1EZaeERHJwVTN2TGKl77FnqM9PRBheXTighzxF0=', '2019-01-28 05:15:29.000000', 0, 'Fafa', '', '', 1, 1, '2019-01-28 05:15:29.000000', 'fafa@fafa.com'),
(7, 'pbkdf2_sha256$720000$zaT08jQIPKDj5IHiPcCca0$B4RokYqrHEiMI30uyvsC2IoZG3cP1S9H0qrfBvQcQ7E=', '2024-07-23 03:12:07.955124', 1, 'superadmin', '', '', 1, 1, '2024-07-23 02:52:12.888979', 'admin@admin.com');

INSERT INTO `course_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(1, 1, 1);
INSERT INTO `course_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(2, 2, 1);
INSERT INTO `course_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(3, 3, 1);
INSERT INTO `course_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(4, 4, 1),
(5, 5, 1),
(6, 6, 1);



INSERT INTO `course_usercourse` (`id`, `course_id`, `user_id`) VALUES
(1, 1, 1);
INSERT INTO `course_usercourse` (`id`, `course_id`, `user_id`) VALUES
(2, 2, 1);
INSERT INTO `course_usercourse` (`id`, `course_id`, `user_id`) VALUES
(3, 3, 1);
INSERT INTO `course_usercourse` (`id`, `course_id`, `user_id`) VALUES
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 3),
(10, 1, 4),
(11, 2, 4),
(12, 3, 4),
(13, 4, 5),
(14, 5, 5),
(15, 6, 5),
(16, 7, 6),
(17, 8, 6),
(18, 9, 6);

INSERT INTO `courses` (`id`, `course`, `mentor`, `title`) VALUES
(1, 'C++', 'Ari', 'Dr.');
INSERT INTO `courses` (`id`, `course`, `mentor`, `title`) VALUES
(2, 'C#', 'Ari', 'Dr.');
INSERT INTO `courses` (`id`, `course`, `mentor`, `title`) VALUES
(3, 'C#', 'Ari', 'Dr.');
INSERT INTO `courses` (`id`, `course`, `mentor`, `title`) VALUES
(4, 'CSS', 'Cania', 'S.Kom'),
(5, 'HTML', 'Cania', 'S.Kom'),
(6, 'Javascript', 'Cania', 'S.Kom'),
(7, 'Python', 'Barry', 'S.T.'),
(8, 'Micropython', 'Barry', 'S.T.'),
(9, 'Java', 'Darren', 'M.T.'),
(10, 'Ruby', 'Darren', 'M.T.');

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-07-23 02:45:30.682102', '1', 'superad', 3, '', 7, 2);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(2, '2024-07-23 02:53:10.137309', '7', 'superadmin', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 7, 7);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(3, '2024-07-23 02:57:20.540125', '1', 'Andi', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 7, 7);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(4, '2024-07-23 03:00:59.984825', '1', 'Andi', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 7, 7),
(5, '2024-07-23 03:03:36.683117', '1', 'Andi', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 7, 7),
(6, '2024-07-23 03:07:11.647265', '19', 'Andi - C++', 1, '[{\"added\": {}}]', 8, 1),
(7, '2024-07-23 03:07:50.572044', '1', 'Member', 1, '[{\"added\": {}}]', 3, 7),
(8, '2024-07-23 03:08:56.553664', '1', 'Andi', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"User permissions\"]}}]', 7, 7),
(9, '2024-07-23 03:09:01.258592', '2', 'Budi', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 7, 7),
(10, '2024-07-23 03:09:05.092549', '3', 'Caca', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 7, 7),
(11, '2024-07-23 03:09:09.614907', '4', 'Deni', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 7, 7),
(12, '2024-07-23 03:09:16.513145', '5', 'Euis', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 7, 7),
(13, '2024-07-23 03:09:20.442732', '6', 'Fafa', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 7, 7),
(14, '2024-07-23 03:47:35.218169', '19', 'Andi - C++', 3, '', 8, 7);

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(4, 'contenttypes', 'contenttype'),
(6, 'course', 'course'),
(7, 'course', 'customuser'),
(8, 'course', 'usercourse'),
(5, 'sessions', 'session');

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-07-23 02:25:39.181092');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(2, 'contenttypes', '0002_remove_content_type_name', '2024-07-23 02:25:39.266967');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(3, 'auth', '0001_initial', '2024-07-23 02:25:39.641390');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(4, 'auth', '0002_alter_permission_name_max_length', '2024-07-23 02:25:39.738055'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-07-23 02:25:39.744155'),
(6, 'auth', '0004_alter_user_username_opts', '2024-07-23 02:25:39.751324'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-07-23 02:25:39.758514'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-07-23 02:25:39.764843'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-07-23 02:25:39.773214'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-07-23 02:25:39.781502'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-07-23 02:25:39.789331'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-07-23 02:25:39.813917'),
(13, 'auth', '0011_update_proxy_permissions', '2024-07-23 02:25:39.822059'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-07-23 02:25:39.829940'),
(15, 'course', '0001_initial', '2024-07-23 02:25:40.668963'),
(16, 'admin', '0001_initial', '2024-07-23 02:25:40.863587'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-07-23 02:25:40.873170'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-07-23 02:25:40.884386'),
(19, 'sessions', '0001_initial', '2024-07-23 02:25:40.942920');

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('as0jzk6purvzliu7k1ryha32d5218uc3', '.eJxVjMsOwiAQRf-FtSFAebp07zcQmBmkaiAp7cr479qkC93ec859sZi2tcZt0BJnZGcm2el3ywke1HaA99RunUNv6zJnviv8oINfO9Lzcrh_BzWN-q0VKApJZJXJSGGctBNqMBZMmIIWaLxVwuopFXIyOCKNoIoUkMGX4jx7fwDLxTek:1sW5nr:4AcC1jCprh_3-W2dDOh2fYBl_7Ukb-R3ZBRVmT1nwB0', '2024-08-06 03:03:03.532381');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fuojm1gfgfylyyq83dw4zb28xxq35j4z', '.eJxVjLsOwyAUQ_-FuUJAeHbsnm9A9_IoaSuQQjJV_fcSKUPrxZKP7TfxsG_F7z2tfonkSgy5_GYI4ZnqAeID6r3R0Oq2LkiPCj1pp3OL6XU7u38HBXoZ6-wm5EK6YIZHOWW0CiybUGXDkQk-lC1ILYLiWqNSmnEnM0siDrfk8wXH8Tan:1sW5wd:kAJro7EHuUotpxkkR9fj4zF0kUGYwnS6ka-D89tfyIw', '2024-08-06 03:12:07.960634');


INSERT INTO `userCourse` (`id_user`, `id_course`) VALUES
(1, 1);
INSERT INTO `userCourse` (`id_user`, `id_course`) VALUES
(1, 2);
INSERT INTO `userCourse` (`id_user`, `id_course`) VALUES
(1, 3);
INSERT INTO `userCourse` (`id_user`, `id_course`) VALUES
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 1),
(4, 2),
(4, 3),
(5, 4),
(5, 5),
(5, 6),
(6, 7),
(6, 8),
(6, 9);

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Andi', 'andi@andi.com', '12345', '2019-01-28 05:15:29', '2019-01-28 05:15:29');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Budi', 'budi@budi.com', '67890', '2019-01-28 05:15:29', '2019-01-28 05:15:29');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(3, 'Caca', 'caca@caca.com', 'abcde', '2019-01-28 05:15:29', '2019-01-28 05:15:29');
INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(4, 'Deni', 'deni@deni.com', 'fghij', '2019-01-28 05:15:29', '2019-01-28 05:15:29'),
(5, 'Euis', 'euis@euis.com', 'klmno', '2019-01-28 05:15:29', '2019-01-28 05:15:29'),
(6, 'Fafa', 'fafa@fafa.com', 'pqrst', '2019-01-28 05:15:29', '2019-01-28 05:15:29');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
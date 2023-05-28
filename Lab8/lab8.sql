SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `files` (`id`, `link`) VALUES
(1,	'd/uploadf/file.txt'),
(2,	'd/uploadf/file3.txt'),
(3,	'd/upload/file44.txt');

DROP TABLE IF EXISTS `files_tasks`;
CREATE TABLE `files_tasks` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `file_id` int(15) unsigned NOT NULL,
  `task_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `files_tasks_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`),
  CONSTRAINT `files_tasks_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tasks` (`id`, `name`, `owner_id`, `project_id`) VALUES
(1, 'task12', 1, 1,),
(2, 'task23', 2, 2,),
(3, 'task3', 3, 3,),
(4, 'task1', 4, 4,),
(5, 'task20', 5, 5);


DROP TABLE IF EXISTS `files_projects`;
CREATE TABLE `files_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `files_projects_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `files_projects_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `files_projects` (`id`, `file_id`, `projects_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_projects` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `projects` (`id`, `name`, `user_projects`) VALUES
(1, 'project1', 1),
(2, 'project2', 2),
(3, 'project3', 3),
(4, 'project4', 4),
(5, 'project5', 5);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`id`, `name`, `email`) VALUES
(1, 'user1', 'uniqueuser@gmail.com'),
(2, 'user2', 'uniqueuser2@gmail.com'),
(3, 'user3', 'uniqueuser3@gmail.com'),
(4, 'user4', 'uniqueuser4@gmail.com'),
(5, 'user4', 'uniqueuser5@gmail.com');

DROP TABLE IF EXISTS `users_task`;
CREATE TABLE `users_task` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `task_id` int(15) unsigned NOT NULL,
  `user_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_task_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `users_task_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_task` (`id`, `task_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);


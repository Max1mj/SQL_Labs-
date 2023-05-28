SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS 'news';
CREATE TABLE `news` (
  'id' int(4) unsigned NOT NULL AUTO_INCREMENT
  'title' varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  'category_id' int(11) NOT NULL,
  'publication_date' date NOT NULL,
  'description' varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `news` (`id`, `title`, `category_id`, `publication_date`, `description`) VALUES 
(1, 'first_new1', 1, '21.05.2023', 'IT-sphere'),
(2, 'first_new2', 2, '22.05.2023', 'Nature'),
(3, 'second_new1', 3, '23.05.2023', 'Political_news'),
(4, 'second_new3', 4, '24.05.2023', 'Sport_news'),
(5, 'third_new4', 5, '25.05.2023', 'Buildings');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`user_id`, `name`, `email`) VALUES
(1,	'user1',	'user1f5@gmail.com'),
(2,	'user2',	'user2466@gmail.com'),
(3,	'user3',	'user3981@gmail.com'),
(4, 'user4',  'user4345@gmail.com'),
(5, 'user5',  'user7643@gmail.com');

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` int(1) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `ip` int(6) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_rating_per_news` (`user_id`,`news_id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `ratings_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_6` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  CONSTRAINT `check_mark_range` CHECK (`mark` >= 1 and `mark` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ratings` (`id`, `comment`, `mark`, `user_id`, `news_id`, 'ip') VALUES
(1, 'very bad', 1, 5, 1, 13576),
(2, 'bad', 2, 4, 3, 56829),
(3, 'decent', 3, 2, 2, 76529),
(4, 'good', 4, 1, 4), 11097,
(5, 'perfect', 5, 3, 5, 65278);

DROP TABLE IF EXISTS 'categories';
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
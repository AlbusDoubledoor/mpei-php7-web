-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Апр 28 2020 г., 00:24
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `php7lessons`
--

-- --------------------------------------------------------

--
-- Структура таблицы `board`
--

DROP TABLE IF EXISTS `board`;
CREATE TABLE `board` (
  `board_id` varchar(255) DEFAULT NULL,
  `board_title` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `date` date DEFAULT NULL,
  `board_sort_order` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `board`
--

INSERT INTO `board` (`board_id`, `board_title`, `content`, `date`, `board_sort_order`) VALUES
('7907d13088e211ea8b1200059a3c7a00', 'Новое объявление', 'Вот такое вот объявление', '2020-04-28', 1),
('a6c8563588e311ea8b1200059a3c7a00', 'Новое объявление', 'Вот такое вот объявление', '2020-04-28', 1),
('a7eb4c5a88e311ea8b1200059a3c7a00', 'Новое объявление', 'Вот такое вот объявление', '2020-04-28', 1),
('a8403ca088e311ea8b1200059a3c7a00', 'Новое объявление', 'Вот такое вот объявление', '2020-04-28', 1);

--
-- Триггеры `board`
--
DROP TRIGGER IF EXISTS `ins_board_trigger`;
DELIMITER $$
CREATE TRIGGER `ins_board_trigger` BEFORE INSERT ON `board` FOR EACH ROW begin
if new.board_id IS NULL then set new.board_id = replace(UUID(),'-',''); end if;
if new.board_sort_order IS NULL then set new.board_sort_order = (SELECT MAX(board_sort_order) FROM board)+1; end if;
end
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

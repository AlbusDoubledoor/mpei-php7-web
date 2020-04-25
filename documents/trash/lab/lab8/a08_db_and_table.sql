-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Апр 06 2020 г., 13:23
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
-- База данных: `a08`
--

CREATE DATABASE `a08`;
-- --------------------------------------------------------
USE `a08`;
--
-- Структура таблицы `koval_lab8`
--

CREATE TABLE `koval_lab8` (
  `id` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `resume` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `koval_lab8`
--

INSERT INTO `koval_lab8` (`id`, `lastname`, `firstname`, `sex`, `salary`, `resume`) VALUES
(1, 'Коваль', 'Роман', 'мужчина', '1', 'Студент А-8-17'),
(2, 'Натани', 'Разеппа', 'женщина', '1 000 000', 'Директор завода ПРОМХОЗВОЗ'),
(3, 'Александров', 'Александр', 'мужчина', '26500', 'Ученый'),
(5, 'Александров', 'Александр', 'мужчина', '233333', 'Ученый');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `koval_lab8`
--
ALTER TABLE `koval_lab8`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `koval_lab8`
--
ALTER TABLE `koval_lab8`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

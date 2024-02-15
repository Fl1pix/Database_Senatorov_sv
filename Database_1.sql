-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 15 2024 г., 22:35
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Database_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Маршрут`
--

CREATE TABLE `Маршрут` (
  `id` int NOT NULL,
  `наименование` varchar(30) NOT NULL,
  `Премия_в_баллах` int NOT NULL,
  `Стоимость_в_баллах` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Маршрут`
--

INSERT INTO `Маршрут` (`id`, `наименование`, `Премия_в_баллах`, `Стоимость_в_баллах`) VALUES
(1, 'Сургут - Москва', 100, 1000),
(2, 'Сургут - Тюмень', 30, 450),
(3, 'Москва - Тюмень', 80, 850),
(4, 'Сургут - Санкт-Петербург', 130, 1500),
(5, 'Москва - Санкт-Петербург', 25, 300),
(6, 'Сургут - Владивосток', 200, 2500),
(7, 'Москва - Владивосток', 350, 4000),
(8, 'Санкт-Петербург - Владимосток', 400, 4300),
(9, 'Тюмень - Санкт-Петербург', 60, 800),
(10, 'Москва - Торонто', 800, 10000);

-- --------------------------------------------------------

--
-- Структура таблицы `Пассажир`
--

CREATE TABLE `Пассажир` (
  `id` int NOT NULL,
  `ФИО` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Пассажир`
--

INSERT INTO `Пассажир` (`id`, `ФИО`) VALUES
(1, 'Антоненко Андрей Филипович'),
(2, 'Лукашенко Максим Денисович'),
(3, 'Петухова Анжела Фроловна'),
(4, 'Белякова Неонила Артёмовна'),
(5, 'Иванкова Алина Рубеновна'),
(6, 'Кошелева Андриана Куприяновна'),
(7, 'Овчинников Семен Аристархович'),
(8, 'Авдеев Феликс Миронович'),
(9, 'Кузьмин Севастьян Дмитриевич'),
(10, 'Королёв Антон Проклович');

-- --------------------------------------------------------

--
-- Структура таблицы `Премиальные_полеты`
--

CREATE TABLE `Премиальные_полеты` (
  `id` int NOT NULL,
  `id_маршрута` int NOT NULL,
  `id_пассажира` int NOT NULL,
  `Баллов_получено` int NOT NULL,
  `Дата_время` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Премиальные_полеты`
--

INSERT INTO `Премиальные_полеты` (`id`, `id_маршрута`, `id_пассажира`, `Баллов_получено`, `Дата_время`) VALUES
(1, 1, 6, 100, '2024-01-11'),
(2, 10, 2, 30, '2023-11-22'),
(3, 5, 7, 25, '2023-09-14'),
(4, 9, 3, 60, '2024-01-10'),
(5, 4, 8, 130, '2024-02-02');

-- --------------------------------------------------------

--
-- Структура таблицы `Бонусные_полеты`
--

CREATE TABLE `Бонусные_полеты` (
  `id` int NOT NULL,
  `id_маршрута` int NOT NULL,
  `id_пассажира` int NOT NULL,
  `баллов_потрачено` int NOT NULL,
  `Дата_время` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Бонусные_полеты`
--

INSERT INTO `Бонусные_полеты` (`id`, `id_маршрута`, `id_пассажира`, `баллов_потрачено`, `Дата_время`) VALUES
(1, 2, 4, 450, '2024-01-09'),
(2, 8, 1, 4300, '2024-02-13'),
(3, 6, 5, 2500, '2024-02-02'),
(4, 7, 10, 4000, '2024-01-16'),
(5, 4, 9, 1500, '2024-02-05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Маршрут`
--
ALTER TABLE `Маршрут`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Премия_в_баллах` (`Премия_в_баллах`),
  ADD KEY `Стоимость_в_баллах` (`Стоимость_в_баллах`);

--
-- Индексы таблицы `Пассажир`
--
ALTER TABLE `Пассажир`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Премиальные_полеты`
--
ALTER TABLE `Премиальные_полеты`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_m` (`id_маршрута`),
  ADD KEY `id_p` (`id_пассажира`);

--
-- Индексы таблицы `Бонусные_полеты`
--
ALTER TABLE `Бонусные_полеты`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_m` (`id_маршрута`),
  ADD KEY `id_p` (`id_пассажира`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Маршрут`
--
ALTER TABLE `Маршрут`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Пассажир`
--
ALTER TABLE `Пассажир`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Премиальные_полеты`
--
ALTER TABLE `Премиальные_полеты`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Бонусные_полеты`
--
ALTER TABLE `Бонусные_полеты`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Премиальные_полеты`
--
ALTER TABLE `Премиальные_полеты`
  ADD CONSTRAINT `премиальные_полеты_ibfk_1` FOREIGN KEY (`id_пассажира`) REFERENCES `Пассажир` (`id`),
  ADD CONSTRAINT `премиальные_полеты_ibfk_2` FOREIGN KEY (`id_маршрута`) REFERENCES `Маршрут` (`id`);

--
-- Ограничения внешнего ключа таблицы `Бонусные_полеты`
--
ALTER TABLE `Бонусные_полеты`
  ADD CONSTRAINT `бонусные_полеты_ibfk_1` FOREIGN KEY (`id_пассажира`) REFERENCES `Пассажир` (`id`),
  ADD CONSTRAINT `бонусные_полеты_ibfk_2` FOREIGN KEY (`id_маршрута`) REFERENCES `Маршрут` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

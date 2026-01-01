-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-12-03 02:58:10
-- 服务器版本： 10.4.24-MariaDB
-- PHP 版本： 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
CREATE DATABASE IF NOT EXISTS `uic_without_foreign_keys` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uic_without_foreign_keys`;
--

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(15) NOT NULL,
  `b_title` varchar(40) NOT NULL,
  `author` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`ISBN`, `b_title`, `author`) VALUES
('9780923891579', 'Introduction to Metamathematics', 'Stephen Cole Kleene'),
('9781579550088', 'A New Kind of Science', 'Stephen Wolfram');

-- --------------------------------------------------------

--
-- 表的结构 `borrow`
--

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(15) NOT NULL,
  `return_date` date DEFAULT NULL,
  `borrow_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `borrow`
--

INSERT INTO `borrow` (`id`, `ISBN`, `return_date`, `borrow_date`) VALUES
(20004, '9781579550088', '2013-06-02', '2013-09-02'),
(30001, '9781579550088', '2016-03-24', '2016-03-01'),
(30002, '9781579550088', '2015-10-08', '2015-09-25'),
(30003, '9780923891579', '2014-11-12', '2014-11-22');

-- --------------------------------------------------------

--
-- 表的结构 `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `contact`
--

INSERT INTO `contact` (`id`, `phone`) VALUES
(20002, 13123456789),
(20003, 13165498742),
(20004, 13124521698),
(20005, 13147821652),
(20006, 13152486123),
(20007, 13152168426),
(30001, 13548562132),
(30002, 13521654897),
(30003, 13526489762),
(30004, 13524879653),
(30005, 13564892136),
(30006, 13546892131),
(30007, 13516498554),
(30008, 13579652321);

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `c_name` varchar(40) NOT NULL,
  `credits` int(11) NOT NULL,
  `domain` varchar(4) NOT NULL,
  `c_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`c_name`, `credits`, `domain`, `c_number`) VALUES
('Advanced Statistics', 3, 'STAT', 2003),
('Foundations of C Programming', 3, 'GCIT', 1013),
('Introduction to Biology', 3, 'ENVS', 2001),
('Photography', 3, 'MAD', 3003),
('Software Development Workshop', 1, 'COMP', 3023);

-- --------------------------------------------------------

--
-- 表的结构 `enroll`
--

CREATE TABLE `enroll` (
  `id` int(11) NOT NULL,
  `c_name` varchar(40) NOT NULL,
  `s_number` int(11) NOT NULL,
  `sem` char(3) NOT NULL,
  `grade` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `enroll`
--

INSERT INTO `enroll` (`id`, `c_name`, `s_number`, `sem`, `grade`) VALUES
(30001, 'Advanced Statistics', 1001, '16F', 'A-'),
(30001, 'Foundations of C Programming', 1002, '17S', 'A-'),
(30002, 'Introduction to Biology', 1001, '16F', 'F'),
(30003, 'Photography', 1001, '16F', 'B+'),
(30004, 'Software Development Workshop', 1001, '17S', 'A-'),
(30005, 'Foundations of C Programming', 1001, '17S', 'C+'),
(30006, 'Photography', 1001, '17F', 'B'),
(30007, 'Foundations of C Programming', 1001, '17S', 'A'),
(30008, 'Introduction to Biology', 1001, '16F', 'A-');

-- --------------------------------------------------------

--
-- 表的结构 `instructor`
--

CREATE TABLE `instructor` (
  `id` int(11) NOT NULL,
  `i_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  `p_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `instructor`
--

INSERT INTO `instructor` (`id`, `i_name`, `title`, `salary`, `p_code`) VALUES
(20002, 'S.H. Zee', 'Professor', 100000, 1002),
(20003, 'Eva', 'Professor', 80000, 1003),
(20004, 'Howard', 'Lecturer', 20000, 1003),
(20005, 'Stephen', 'Associate Professor', 60000, 1001),
(20006, 'Paul', 'Lecturer', 10000, 1004),
(20007, 'Kevin', 'Professor', 80000, 1004);

-- --------------------------------------------------------

--
-- 表的结构 `offer`
--

CREATE TABLE `offer` (
  `p_code` int(11) NOT NULL,
  `c_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `offer`
--

INSERT INTO `offer` (`p_code`, `c_name`) VALUES
(1001, 'Foundations of C Programming'),
(1001, 'Software Development Workshop'),
(1002, 'Introduction to Biology'),
(1003, 'Advanced Statistics'),
(1004, 'Photography');

-- --------------------------------------------------------

--
-- 表的结构 `program`
--

CREATE TABLE `program` (
  `p_code` int(11) NOT NULL,
  `p_name` varchar(40) NOT NULL,
  `division` varchar(40) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `program`
--

INSERT INTO `program` (`p_code`, `p_name`, `division`, `director_id`) VALUES
(1001, 'Computer Science', 'Science and Technology', 20005),
(1002, 'Environmental Science', 'Science and Technology', 20002),
(1003, 'Statistic', 'Science and Technology', 20003),
(1004, 'Media Arts and Design', 'Culture and Creativity', 20007);

-- --------------------------------------------------------

--
-- 表的结构 `section`
--

CREATE TABLE `section` (
  `c_name` varchar(40) NOT NULL,
  `s_number` int(11) NOT NULL,
  `sem` char(3) NOT NULL,
  `venue` varchar(10) DEFAULT NULL,
  `s_time` varchar(20) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `section`
--

INSERT INTO `section` (`c_name`, `s_number`, `sem`, `venue`, `s_time`, `instructor_id`) VALUES
('Advanced Statistics', 1001, '16F', 'B-302', 'Thu. 13:00-16:00', 20004),
('Foundations of C Programming', 1001, '17S', 'D-403', 'Tue. 14:00-17:00', 20005),
('Foundations of C Programming', 1002, '17S', 'D-402', 'Wed. 9:00-12:00', 20003),
('Introduction to Biology', 1001, '16F', 'C-303', 'Mon. 13:00-16:00', 20002),
('Photography', 1001, '16F', 'E-102', 'Fri. 13:00-16:00', 20006),
('Photography', 1001, '17F', 'E-104', 'Fri. 9:00-12:00', 20007),
('Software Development Workshop', 1001, '17S', 'D-102', 'Tue. 9:00-12:00', 20005);

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `s_name` varchar(20) NOT NULL,
  `yr` int(11) NOT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `p_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`id`, `s_name`, `yr`, `gpa`, `p_code`) VALUES
(30001, 'Alice', 3, '3.54', 1003),
(30002, 'Bob', 2, '1.36', 1002),
(30003, 'Charlie', 4, '3.14', 1004),
(30004, 'Dave', 2, '3.25', 1001),
(30005, 'Elfrid', 1, '2.94', 1003),
(30006, 'Frank', 1, '3.08', 1004),
(30007, 'Goppa', 2, '3.61', 1001),
(30008, 'Hynuza', 3, '3.72', 1002);

--
-- 转储表的索引
--

--
-- 表的索引 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- 表的索引 `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`,`ISBN`),
  ADD KEY `ISBN` (`ISBN`);

--
-- 表的索引 `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`,`phone`);

--
-- 表的索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_name`);

--
-- 表的索引 `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`id`,`c_name`,`s_number`,`sem`),
  ADD KEY `c_name` (`c_name`,`s_number`,`sem`);

--
-- 表的索引 `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_code` (`p_code`);

--
-- 表的索引 `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`p_code`,`c_name`),
  ADD KEY `c_name` (`c_name`);

--
-- 表的索引 `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`p_code`),
  ADD KEY `director_id` (`director_id`);

--
-- 表的索引 `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`c_name`,`s_number`,`sem`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_code` (`p_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

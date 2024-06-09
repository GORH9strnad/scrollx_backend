-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 10:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrollx`
--

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

CREATE TABLE `episodes` (
  `id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `img_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `episodes`
--

INSERT INTO `episodes` (`id`, `serie_id`, `description`, `img_url`) VALUES
(1, 1, 'First episode', 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/IMG_2022-02-26-13-37-01-389.jpg'),
(2, 1, 'second episode', 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/IMG_20230720_185302162.jpg'),
(3, 2, 'first episode ', 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/IMG_20230819_144709770.jpg'),
(4, 2, 'second episode', 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/IMG_20230905_173959833_HDR.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `img_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `description`, `img_url`) VALUES
(1, 'Self Development', 'Some Instagram reels...', 'https://storage.googleapis.com/scrollx/videos/movie/img.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `scrolls`
--

CREATE TABLE `scrolls` (
  `id` int(11) NOT NULL,
  `episode_id` int(11) NOT NULL,
  `scroll_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scrolls`
--

INSERT INTO `scrolls` (`id`, `episode_id`, `scroll_url`) VALUES
(1, 1, 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/scrolls/SaveInsta.App%20-%203254506140498295281.mp4'),
(2, 1, 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/scrolls/SaveInsta.App%20-%203256798345794032367.mp4'),
(3, 2, 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/scrolls/SaveInsta.App%20-%203268741323002593414.mp4'),
(4, 2, 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/scrolls/SaveInsta.App%20-%203360015837405952281.mp4'),
(5, 2, 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/scrolls/SaveInsta.App%20-%203368189060781009286.mp4'),
(6, 2, 'https://storage.googleapis.com/scrollx/videos/movie/series/episodes/scrolls/SaveInsta.App%20-%203372319288314629060.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `video_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `movie_id`, `order`, `video_url`) VALUES
(1, 1, 1, 'https://storage.googleapis.com/scrollx/videos/movie/series/trailer.mp4'),
(2, 1, 2, 'https://storage.googleapis.com/scrollx/videos/movie/series/trailer2.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `episodes_serie_id` (`serie_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scrolls`
--
ALTER TABLE `scrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scrolls_episode_id` (`episode_id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_movie_id` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scrolls`
--
ALTER TABLE `scrolls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_serie_id` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scrolls`
--
ALTER TABLE `scrolls`
  ADD CONSTRAINT `scrolls_episode_id` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `series_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

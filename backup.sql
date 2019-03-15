-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 11, 2018 at 07:37 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `movies_db2`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actors_id` int(11) NOT NULL,
  `actor_firstname` varchar(45) NOT NULL,
  `actor_lastname` varchar(45) NOT NULL,
  `actor_gender` varchar(6) NOT NULL,
  `actor_birthyear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `uid` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`uid`, `first_name`, `last_name`, `email`, `username`, `password`) VALUES
(1, 'Ryan', 'Reynold', 'ryan@deadpool.com', 'ryan', '$2y$10$7d8LDcUIBlVrR1QanAA1w.TeN89rQZrte6y.5k0kTpdegbpk2rDOW');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `directors_id` int(11) NOT NULL,
  `director_firstname` varchar(45) NOT NULL,
  `director_lastname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genres_id` int(11) NOT NULL,
  `genre_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genres_id`, `genre_type`) VALUES
(1, 'Action'),
(2, 'Comedy');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movies_id` int(11) NOT NULL,
  `movie_title` varchar(255) NOT NULL,
  `movie_runtime` int(11) NOT NULL,
  `movie_release_date` int(11) NOT NULL,
  `movie_description` varchar(255) NOT NULL,
  `movie_rating` enum('G','PG','PG-13','R') NOT NULL,
  `movie_image` varchar(255) NOT NULL,
  `movie_director` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movies_id`, `movie_title`, `movie_runtime`, `movie_release_date`, `movie_description`, `movie_rating`, `movie_image`, `movie_director`) VALUES
(1, 'Avengers: Infinity War\r\n', 149, 2018, 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. ', 'R', 'infinitywar.jpg', 'Anthony Russo, Joe Russo'),
(2, 'Avengers: Thor Ragnarok \r\n', 130, 2017, 'After the events of Avengers: Age of Ultron, Thor, held captive on the planet Sakaar without his hammer, must win a gladiatorial duel against an old friend, the Hulk, in order to return to Asgard in time to stop the villainous Hela.', 'R', 'thor.jpg', 'Taika Waititi\r\n'),
(3, 'Kill Bill: Vol. 1', 111, 2003, 'The lead character, called \'The Bride,\' was a member of the Deadly Viper Assassination Squad, led by her lover \'Bill.\' Upon realizing she was pregnant with Bill\'s child, \'The Bride\' decided to escape her life as a killer. She fled to Texas, met a young ma', 'R', 'killbill.jpg', 'Quentin Tarantino '),
(4, 'The Shawshank Redemption', 142, 1994, '', 'R', 'shawshank.jpg', 'Danny Leiner'),
(5, 'Harold and Kumar Go to White Castle', 88, 2004, 'Harold Lee and Kumar Patel are best friends and roommates who share a common love for marijuana. Harold works for an investment bank while Kumar is being pressured by his father to go into medical school. On a Friday night after smoking marijuana, the duo', 'R', 'handk.jpg', 'Danny Leiner'),
(6, 'Captain Marvel', 100, 2019, 'Carol Danvers becomes one of the universe\'s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.', 'G', 'cmarvel.jpg', 'Anna Boden');

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `movies_movies_id` int(11) NOT NULL,
  `actors_actors_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movie_direction`
--

CREATE TABLE `movie_direction` (
  `movies_movies_id` int(11) NOT NULL,
  `directors_directors_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movies_movies_id` int(11) NOT NULL,
  `genres_genres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actors_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`directors_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genres_id`),
  ADD UNIQUE KEY `genre_type_UNIQUE` (`genre_type`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`movies_movies_id`,`actors_actors_id`),
  ADD KEY `fk_movie_cast_movies1_idx` (`movies_movies_id`),
  ADD KEY `fk_movie_cast_actors1_idx` (`actors_actors_id`);

--
-- Indexes for table `movie_direction`
--
ALTER TABLE `movie_direction`
  ADD PRIMARY KEY (`movies_movies_id`,`directors_directors_id`),
  ADD KEY `fk_movie_direction_movies1_idx` (`movies_movies_id`),
  ADD KEY `fk_movie_direction_directors1_idx` (`directors_directors_id`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movies_movies_id`,`genres_genres_id`),
  ADD KEY `fk_movie_genres_movies1_idx` (`movies_movies_id`),
  ADD KEY `fk_movie_genres_genres1_idx` (`genres_genres_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actors_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `directors_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genres_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movies_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `fk_movie_cast_actors1` FOREIGN KEY (`actors_actors_id`) REFERENCES `actors` (`actors_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_cast_movies1` FOREIGN KEY (`movies_movies_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_direction`
--
ALTER TABLE `movie_direction`
  ADD CONSTRAINT `fk_movie_direction_directors1` FOREIGN KEY (`directors_directors_id`) REFERENCES `directors` (`directors_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_direction_movies1` FOREIGN KEY (`movies_movies_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `fk_movie_genres_genres1` FOREIGN KEY (`genres_genres_id`) REFERENCES `genres` (`genres_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_genres_movies1` FOREIGN KEY (`movies_movies_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE ON UPDATE CASCADE;

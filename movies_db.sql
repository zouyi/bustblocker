-- MySQL Script generated by MySQL Workbench
-- Sat Sep 29 17:13:31 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movies_db2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movies_db2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies_db2` DEFAULT CHARACTER SET utf8 ;
USE `movies_db2` ;

-- -----------------------------------------------------
-- Table `movies_db2`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`movies` (
  `movies_id` INT NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(255) NOT NULL,
  `movie_year` INT NOT NULL,
  `movie_runtime` INT NOT NULL,
  `movie_release_date` DATE NOT NULL,
  `movie_description` VARCHAR(255) NOT NULL,
  `movie_rating` ENUM("G", "PG", "PG-13", "R") NOT NULL,
  PRIMARY KEY (`movies_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db2`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`genres` (
  `genres_id` INT NOT NULL AUTO_INCREMENT,
  `genre_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genres_id`),
  UNIQUE INDEX `genre_type_UNIQUE` (`genre_type` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db2`.`movie_genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`movie_genres` (
  `movies_movies_id` INT NOT NULL,
  `genres_genres_id` INT NOT NULL,
  INDEX `fk_movie_genres_movies1_idx` (`movies_movies_id` ASC) ,
  INDEX `fk_movie_genres_genres1_idx` (`genres_genres_id` ASC) ,
  PRIMARY KEY (`movies_movies_id`, `genres_genres_id`),
  CONSTRAINT `fk_movie_genres_movies1`
    FOREIGN KEY (`movies_movies_id`)
    REFERENCES `movies_db2`.`movies` (`movies_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_genres_genres1`
    FOREIGN KEY (`genres_genres_id`)
    REFERENCES `movies_db2`.`genres` (`genres_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db2`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`actors` (
  `actors_id` INT NOT NULL AUTO_INCREMENT,
  `actor_firstname` VARCHAR(45) NOT NULL,
  `actor_lastname` VARCHAR(45) NOT NULL,
  `actor_gender` VARCHAR(6)  NOT NULL,
 `actor_birthyear` INT  NOT NULL,
  PRIMARY KEY (`actors_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db2`.`movie_cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`movie_cast` (
  `movies_movies_id` INT NOT NULL,
  `actors_actors_id` INT NOT NULL,
  INDEX `fk_movie_cast_movies1_idx` (`movies_movies_id` ASC) ,
  INDEX `fk_movie_cast_actors1_idx` (`actors_actors_id` ASC) ,
  PRIMARY KEY (`movies_movies_id`, `actors_actors_id`),
  CONSTRAINT `fk_movie_cast_movies1`
    FOREIGN KEY (`movies_movies_id`)
    REFERENCES `movies_db2`.`movies` (`movies_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_cast_actors1`
    FOREIGN KEY (`actors_actors_id`)
    REFERENCES `movies_db2`.`actors` (`actors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db2`.`directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`directors` (
  `directors_id` INT NOT NULL AUTO_INCREMENT,
  `director_firstname` VARCHAR(45) NOT NULL,
  `director_lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`directors_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_db2`.`movie_direction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_db2`.`movie_direction` (
  `movies_movies_id` INT NOT NULL,
  `directors_directors_id` INT NOT NULL,
  INDEX `fk_movie_direction_movies1_idx` (`movies_movies_id` ASC) ,
  INDEX `fk_movie_direction_directors1_idx` (`directors_directors_id` ASC) ,
  PRIMARY KEY (`movies_movies_id`, `directors_directors_id`),
  CONSTRAINT `fk_movie_direction_movies1`
    FOREIGN KEY (`movies_movies_id`)
    REFERENCES `movies_db2`.`movies` (`movies_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_direction_directors1`
    FOREIGN KEY (`directors_directors_id`)
    REFERENCES `movies_db2`.`directors` (`directors_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

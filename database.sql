-- MySQL Script generated by MySQL Workbench
-- Sun Jan 27 19:27:26 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema quiz_app
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quiz_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quiz_app` DEFAULT CHARACTER SET utf8 ;
USE `quiz_app` ;

-- -----------------------------------------------------
-- Table `quiz_app`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(25) NULL,
  `Login` VARCHAR(15) NOT NULL,
  `Password` VARCHAR(8) NOT NULL,
  `Permission` VARCHAR(1) NOT NULL,
  `Active` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `idUser_UNIQUE` (`idUser` ASC),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_app`.`Test_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`Test_type` (
  `idTest_type` INT NOT NULL AUTO_INCREMENT,
  `Name_test_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTest_type`),
  UNIQUE INDEX `idTests_type_UNIQUE` (`idTest_type` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_app`.`Level_difficulty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`Level_difficulty` (
  `idLevel_difficulty` INT NOT NULL AUTO_INCREMENT,
  `Name_difficulty_level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLevel_difficulty`),
  UNIQUE INDEX `idLevels_difficulty_UNIQUE` (`idLevel_difficulty` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_app`.`Result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`Result` (
  `idResult` INT NOT NULL AUTO_INCREMENT,
  `Test_name` VARCHAR(45) NOT NULL,
  `Good_answers` INT NOT NULL,
  `All_answers` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  `Tests_type_idTests_type` INT NOT NULL,
  `Levels_difficulty_idLevels_difficulty` INT NOT NULL,
  PRIMARY KEY (`idResult`),
  UNIQUE INDEX `idResult_UNIQUE` (`idResult` ASC),
  INDEX `fk_Result_User_idx` (`User_idUser` ASC),
  INDEX `fk_Result_Tests_type1_idx` (`Tests_type_idTests_type` ASC),
  INDEX `fk_Result_Levels_difficulty1_idx` (`Levels_difficulty_idLevels_difficulty` ASC),
  CONSTRAINT `fk_Result_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `quiz_app`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Result_Tests_type1`
    FOREIGN KEY (`Tests_type_idTests_type`)
    REFERENCES `quiz_app`.`Test_type` (`idTest_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Result_Levels_difficulty1`
    FOREIGN KEY (`Levels_difficulty_idLevels_difficulty`)
    REFERENCES `quiz_app`.`Level_difficulty` (`idLevel_difficulty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_app`.`Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`Test` (
  `idTest` INT NOT NULL AUTO_INCREMENT,
  `Test_name` VARCHAR(25) NOT NULL,
  `Active` VARCHAR(1) NOT NULL,
  `Tests_type_idTests_type` INT NOT NULL,
  `Levels_difficulty_idLevels_difficulty` INT NOT NULL,
  PRIMARY KEY (`idTest`),
  UNIQUE INDEX `idTest_UNIQUE` (`idTest` ASC),
  INDEX `fk_Test_Tests_type1_idx` (`Tests_type_idTests_type` ASC),
  INDEX `fk_Test_Levels_difficulty1_idx` (`Levels_difficulty_idLevels_difficulty` ASC),
  CONSTRAINT `fk_Test_Tests_type1`
    FOREIGN KEY (`Tests_type_idTests_type`)
    REFERENCES `quiz_app`.`Test_type` (`idTest_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Test_Levels_difficulty1`
    FOREIGN KEY (`Levels_difficulty_idLevels_difficulty`)
    REFERENCES `quiz_app`.`Level_difficulty` (`idLevel_difficulty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_app`.`Question_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`Question_answer` (
  `idQuestion_answer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Question` VARCHAR(254) NOT NULL,
  `Answer_1` VARCHAR(254) NOT NULL,
  `Answer_2` VARCHAR(254) NOT NULL,
  `Answer_3` VARCHAR(254) NOT NULL,
  `Answer_4` VARCHAR(254) NOT NULL,
  `Correct_answer` INT NOT NULL,
  `Test_idTest` INT NOT NULL,
  PRIMARY KEY (`idQuestion_answer`),
  UNIQUE INDEX `idQuestion_answer_UNIQUE` (`idQuestion_answer` ASC),
  INDEX `fk_Question_answer_Test1_idx` (`Test_idTest` ASC),
  CONSTRAINT `fk_Question_answer_Test1`
    FOREIGN KEY (`Test_idTest`)
    REFERENCES `quiz_app`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quiz_app`.`Opinion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quiz_app`.`Opinion` (
  `idOpinion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(100) NULL,
  `Opinion_text` VARCHAR(254) NULL,
  `Date` DATE NOT NULL,
  PRIMARY KEY (`idOpinion`),
  UNIQUE INDEX `idOpinion_UNIQUE` (`idOpinion` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

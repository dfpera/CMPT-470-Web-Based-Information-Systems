CREATE DATABASE notedDB;

CREATE TABLE IF NOT EXISTS `notedDB`.`Accounts` (
  `UID` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `lastUpdated` VARCHAR(45) NULL,
  PRIMARY KEY (`UID`));

CREATE TABLE IF NOT EXISTS `notedDB`.`Notes` (
  `noteID` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `text` BLOB NULL,
  `timestamp` VARCHAR(45) NULL,
  `UID` INT NULL,
  PRIMARY KEY (`noteID`),
  INDEX `UID_idx` (`UID` ASC),
  CONSTRAINT `UID`
    FOREIGN KEY (`UID`)
    REFERENCES `notedDB`.`Accounts` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
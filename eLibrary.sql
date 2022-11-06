-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eLibrary
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eLibrary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eLibrary` DEFAULT CHARACTER SET utf8 ;
USE `eLibrary` ;

-- -----------------------------------------------------
-- Table `eLibrary`.`Bibliotheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eLibrary`.`Bibliotheque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Livre_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Livre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eLibrary`.`Membre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eLibrary`.`Membre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(25) NOT NULL,
  `prenom` VARCHAR(25) NOT NULL,
  `adresse` VARCHAR(50) NOT NULL,
  `code_postal` VARCHAR(10) NOT NULL,
  `telephone` VARCHAR(25) NOT NULL,
  `courriel` VARCHAR(50) NOT NULL,
  `num_livre_loue` INT NOT NULL,
  `type_membre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eLibrary`.`Libraire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eLibrary`.`Libraire` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Bibliotheque_id` INT NOT NULL,
  `Membre_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Bibliotheque_id`, `Membre_id`),
  INDEX `fk_Libraire_Bibliotheque1_idx` (`Bibliotheque_id` ASC),
  INDEX `fk_Libraire_Membre1_idx` (`Membre_id` ASC),
  UNIQUE INDEX `Bibliotheque_id_UNIQUE` (`Bibliotheque_id` ASC),
  UNIQUE INDEX `Membre_id_UNIQUE` (`Membre_id` ASC),
  CONSTRAINT `fk_Libraire_Bibliotheque1`
    FOREIGN KEY (`Bibliotheque_id`)
    REFERENCES `eLibrary`.`Bibliotheque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libraire_Membre1`
    FOREIGN KEY (`Membre_id`)
    REFERENCES `eLibrary`.`Membre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eLibrary`.`Livre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eLibrary`.`Livre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(45) NOT NULL,
  `auteur` VARCHAR(45) NOT NULL,
  `maison_edition` VARCHAR(45) NOT NULL,
  `prix` VARCHAR(15) NULL,
  `Membre_id` INT NULL,
  `Libraire_id` INT NULL,
  `Libraire_Bibliotheque_id` INT NOT NULL,
  `Libraire_Membre_id` INT NOT NULL,
  `Bibliotheque_id` INT NOT NULL,
  `Bibliotheque_Livre_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Libraire_Bibliotheque_id`, `Libraire_Membre_id`, `Bibliotheque_id`, `Bibliotheque_Livre_id`),
  INDEX `fk_Livre_Membre1_idx` (`Membre_id` ASC),
  INDEX `fk_Livre_Libraire1_idx` (`Libraire_id` ASC, `Libraire_Bibliotheque_id` ASC, `Libraire_Membre_id` ASC),
  INDEX `fk_Livre_Bibliotheque1_idx` (`Bibliotheque_id` ASC, `Bibliotheque_Livre_id` ASC),
  CONSTRAINT `fk_Livre_Membre1`
    FOREIGN KEY (`Membre_id`)
    REFERENCES `eLibrary`.`Membre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livre_Libraire1`
    FOREIGN KEY (`Libraire_id` , `Libraire_Bibliotheque_id` , `Libraire_Membre_id`)
    REFERENCES `eLibrary`.`Libraire` (`id` , `Bibliotheque_id` , `Membre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Livre_Bibliotheque1`
    FOREIGN KEY (`Bibliotheque_id` , `Bibliotheque_Livre_id`)
    REFERENCES `eLibrary`.`Bibliotheque` (`id` , `Livre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eLibrary`.`Etudiant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eLibrary`.`Etudiant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code_permanent` VARCHAR(45) NOT NULL,
  `Membre_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Membre_id`),
  INDEX `fk_Etudiant_Membre1_idx` (`Membre_id` ASC),
  UNIQUE INDEX `Membre_id_UNIQUE` (`Membre_id` ASC),
  CONSTRAINT `fk_Etudiant_Membre1`
    FOREIGN KEY (`Membre_id`)
    REFERENCES `eLibrary`.`Membre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eLibrary`.`Bibliotheque_Membre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eLibrary`.`Bibliotheque_Membre` (
  `Bibliotheque_id` INT NOT NULL,
  `Bibliotheque_Livre_id` INT NOT NULL,
  `Membre_id` INT NOT NULL,
  PRIMARY KEY (`Bibliotheque_id`, `Bibliotheque_Livre_id`, `Membre_id`),
  INDEX `fk_Bibliotheque_Membre_Membre1_idx` (`Membre_id` ASC),
  INDEX `fk_Bibliotheque_Membre_Bibliotheque1_idx` (`Bibliotheque_id` ASC, `Bibliotheque_Livre_id` ASC),
  CONSTRAINT `fk_Bibliotheque_Membre_Bibliotheque1`
    FOREIGN KEY (`Bibliotheque_id` , `Bibliotheque_Livre_id`)
    REFERENCES `eLibrary`.`Bibliotheque` (`id` , `Livre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bibliotheque_Membre_Membre1`
    FOREIGN KEY (`Membre_id`)
    REFERENCES `eLibrary`.`Membre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tema` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `topico_principal` VARCHAR(255) NOT NULL,
  `sub_topico` VARCHAR(255) NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome_completo` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`postagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `data_hora` DATE NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  `midia` VARCHAR(255) NOT NULL,
  `publicacaoAtiva` TINYINT NULL,
  `usuario_id` BIGINT NOT NULL,
  `tema_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_postagens_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_postagens_tema1_idx` (`tema_id` ASC) VISIBLE,
  CONSTRAINT `fk_postagens_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postagens_tema1`
    FOREIGN KEY (`tema_id`)
    REFERENCES `mydb`.`tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

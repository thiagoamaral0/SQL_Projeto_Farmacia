-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Projeto_farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Projeto_farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Projeto_farmacia` DEFAULT CHARACTER SET utf8 ;
USE `Projeto_farmacia` ;

-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`fabricantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`fabricantes` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`fabricantes` (
  `idfabricantes` INT NOT NULL AUTO_INCREMENT,
  `nome_fabricante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfabricantes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`tipos_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`tipos_produto` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`tipos_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_do_produto` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`produtos` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`produtos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `produto` VARCHAR(45) NOT NULL,
  `designacao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `fabricante_id` INT NOT NULL,
  `tipo_produto_id` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_produtos_1_idx` (`fabricante_id` ASC) ,
  INDEX `fk_produtos_2_idx` (`tipo_produto_id` ASC) ,
  CONSTRAINT `fk_produtos_1`
    FOREIGN KEY (`fabricante_id`)
    REFERENCES `Projeto_farmacia`.`fabricantes` (`idfabricantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_2`
    FOREIGN KEY (`tipo_produto_id`)
    REFERENCES `Projeto_farmacia`.`tipos_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`clientes` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `codigo_postal` VARCHAR(20) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`medicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`medicos` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`medicos` (
  `id_medicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`compras` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`compras` (
  `id_nota_fiscal` INT NOT NULL AUTO_INCREMENT,
  `codigo_cliente` INT NOT NULL,
  `data` DATE NOT NULL,
  `medico_id` INT NOT NULL,
  PRIMARY KEY (`id_nota_fiscal`),
  INDEX `fk_nota_fiscal_1_idx` (`codigo_cliente` ASC) ,
  INDEX `fk_compras_2_idx` (`medico_id` ASC) ,
  CONSTRAINT `fk_compras_1`
    FOREIGN KEY (`codigo_cliente`)
    REFERENCES `Projeto_farmacia`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_2`
    FOREIGN KEY (`medico_id`)
    REFERENCES `Projeto_farmacia`.`medicos` (`id_medicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB; 


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`produtos_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`produtos_compra` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`produtos_compra` (
  `id_produtos_compra` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id_produtos_compra`),
  INDEX `fk_produtos_compra_1_idx` (`id_compra` ASC) ,
  INDEX `fk_produtos_compra_2_idx` (`id_produto` ASC) ,
  CONSTRAINT `fk_produtos_compra_1`
    FOREIGN KEY (`id_compra`)
    REFERENCES `Projeto_farmacia`.`compras` (`id_nota_fiscal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_compra_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `Projeto_farmacia`.`produtos` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Projeto_farmacia`.`receitas_medica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Projeto_farmacia`.`receitas_medica` ;

CREATE TABLE IF NOT EXISTS `Projeto_farmacia`.`receitas_medica` (
  `id_receitas_medica` INT NOT NULL AUTO_INCREMENT,
  `id_produto_compra` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `receita` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_receitas_medica`),
  INDEX `fk_receitas_medicas_1_idx` (`id_produto_compra` ASC) ,
  INDEX `fk_receitas_medica_2_idx` (`id_medico` ASC) ,
  CONSTRAINT `fk_receitas_medica_1`
    FOREIGN KEY (`id_produto_compra`)
    REFERENCES `Projeto_farmacia`.`produtos_compra` (`id_produtos_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receitas_medica_2`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Projeto_farmacia`.`medicos` (`id_medicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

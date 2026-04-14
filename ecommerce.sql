-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`produtos` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  `preco` DECIMAL(12,2) NOT NULL,
  `estoque` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`clientes` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`clientes` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nomeCompleto` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`pedidos` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clientes_cliente_id` INT NOT NULL,
  `data_pedido` DATE NOT NULL,
  `valor_total` DECIMAL(12,2) NOT NULL,
  INDEX `fk_pedidos_clientes_idx` (`clientes_cliente_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pedidos_clientes`
    FOREIGN KEY (`clientes_cliente_id`)
    REFERENCES `ecommerce`.`clientes` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`item_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`item_pedido` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`item_pedido` (
  `pedido_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  PRIMARY KEY (`pedido_id`, `produto_id`),
  INDEX `fk_pedidos_has_produtos_produtos1_idx` (`produto_id` ASC) VISIBLE,
  INDEX `fk_pedidos_has_produtos_pedidos1_idx` (`pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_has_produtos_pedidos1`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `ecommerce`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_has_produtos_produtos1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `ecommerce`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

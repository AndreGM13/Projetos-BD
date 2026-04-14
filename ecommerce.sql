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
-- -----------------------------------------------------
-- Schema ccomp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ccomp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ccomp` DEFAULT CHARACTER SET utf8mb3 ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(250) NULL,
  `preco` DECIMAL(5,2) NOT NULL,
  `estoque` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`clientes`
-- -----------------------------------------------------
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
CREATE TABLE IF NOT EXISTS `ecommerce`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clientes_cliente_id` INT NOT NULL,
  `data_pedido` DATE NOT NULL,
  `valor_total` DECIMAL(5,2) NOT NULL,
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

USE `ccomp` ;

-- -----------------------------------------------------
-- Table `ccomp`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`autor` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`cargo` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `Descricao` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`cliente` (
  `idCLIENTE` INT NOT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `PessoaFJ` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`cliente_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`cliente_pf` (
  `idCLIENTE` INT NOT NULL,
  `CPF` VARCHAR(18) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`),
  CONSTRAINT `fk_table1_CLIENTE1`
    FOREIGN KEY (`idCLIENTE`)
    REFERENCES `ccomp`.`cliente` (`idCLIENTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`cliente_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`cliente_pj` (
  `idCLIENTE` INT NOT NULL,
  `CNPJ` VARCHAR(20) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`),
  CONSTRAINT `fk_table1_CLIENTE10`
    FOREIGN KEY (`idCLIENTE`)
    REFERENCES `ccomp`.`cliente` (`idCLIENTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`departamento` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Niome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`editora` (
  `idEditora` INT NOT NULL AUTO_INCREMENT,
  `RazaoSocial` VARCHAR(100) NOT NULL,
  `CNPJ` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idEditora`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`uf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`uf` (
  `Sigla` CHAR(2) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Sigla`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`funcionario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Matricula` INT NULL DEFAULT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  `CPF` VARCHAR(19) NULL DEFAULT NULL,
  `Endereco` VARCHAR(100) NULL DEFAULT NULL,
  `Numero` VARCHAR(4) NULL DEFAULT NULL,
  `Bairro` VARCHAR(45) NULL DEFAULT NULL,
  `Cidade` VARCHAR(45) NULL DEFAULT NULL,
  `UF_Sigla` CHAR(2) NOT NULL,
  `CEP` VARCHAR(8) NULL DEFAULT NULL,
  `Departamento_ID` INT NOT NULL,
  `UltimoSalario` DECIMAL(8,2) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  INDEX `fk_Funcionario_UF_idx` (`UF_Sigla` ASC) VISIBLE,
  INDEX `fk_Funcionario_Departamento1_idx` (`Departamento_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Departamento1`
    FOREIGN KEY (`Departamento_ID`)
    REFERENCES `ccomp`.`departamento` (`ID`),
  CONSTRAINT `fk_Funcionario_UF`
    FOREIGN KEY (`UF_Sigla`)
    REFERENCES `ccomp`.`uf` (`Sigla`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`funcionariocargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`funcionariocargo` (
  `Funcionario_ID` INT NOT NULL,
  `Cargo_ID` INT NOT NULL,
  `DT_Inicio` DATETIME NOT NULL,
  `DT_Fim` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Funcionario_ID`, `Cargo_ID`),
  INDEX `fk_Funcionario_has_Cargo_Cargo1_idx` (`Cargo_ID` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Cargo_Funcionario1_idx` (`Funcionario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_has_Cargo_Cargo1`
    FOREIGN KEY (`Cargo_ID`)
    REFERENCES `ccomp`.`cargo` (`ID`),
  CONSTRAINT `fk_Funcionario_has_Cargo_Funcionario1`
    FOREIGN KEY (`Funcionario_ID`)
    REFERENCES `ccomp`.`funcionario` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`genero` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`historicosalario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`historicosalario` (
  `Funcionario_ID` INT NOT NULL,
  `MesCompetencia` INT NOT NULL,
  `AnoCompeyencia` INT NOT NULL,
  `Valor` DECIMAL(8,2) NULL DEFAULT NULL,
  `DataDeposito` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`Funcionario_ID`, `MesCompetencia`, `AnoCompeyencia`),
  INDEX `fk_HistoricoSalario_Funcionario1_idx` (`Funcionario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_HistoricoSalario_Funcionario1`
    FOREIGN KEY (`Funcionario_ID`)
    REFERENCES `ccomp`.`funcionario` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`livro` (
  `idLivro` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NULL DEFAULT NULL,
  `ISBN` VARCHAR(20) NULL DEFAULT NULL,
  `Edicao` INT NULL DEFAULT NULL,
  `idEditora` INT NOT NULL,
  `Genero_ID` INT NOT NULL,
  PRIMARY KEY (`idLivro`),
  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC) VISIBLE,
  INDEX `fk_Livro_Editora_idx` (`idEditora` ASC) VISIBLE,
  INDEX `fk_Livro_Genero1_idx` (`Genero_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_Editora`
    FOREIGN KEY (`idEditora`)
    REFERENCES `ccomp`.`editora` (`idEditora`),
  CONSTRAINT `fk_Livro_Genero1`
    FOREIGN KEY (`Genero_ID`)
    REFERENCES `ccomp`.`genero` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`pedido` (
  `PEDIDO_ID` INT NOT NULL,
  `DATA_PEDIDO` VARCHAR(45) NULL DEFAULT NULL,
  `CLIENTE_idCLIENTE` INT NOT NULL,
  PRIMARY KEY (`PEDIDO_ID`),
  INDEX `fk_PEDIDO_CLIENTE1_idx` (`CLIENTE_idCLIENTE` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_idCLIENTE`)
    REFERENCES `ccomp`.`cliente` (`idCLIENTE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`item_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`item_pedido` (
  `PEDIDO_ID` INT NOT NULL,
  `idLivro` INT NOT NULL,
  `QUANTIDADE` INT NULL DEFAULT NULL,
  `PRECO_UNITARIO` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`PEDIDO_ID`, `idLivro`),
  INDEX `fk_PEDIDO_has_Livro_Livro1_idx` (`idLivro` ASC) VISIBLE,
  INDEX `fk_PEDIDO_has_Livro_PEDIDO1_idx` (`PEDIDO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDO_has_Livro_Livro1`
    FOREIGN KEY (`idLivro`)
    REFERENCES `ccomp`.`livro` (`idLivro`),
  CONSTRAINT `fk_PEDIDO_has_Livro_PEDIDO1`
    FOREIGN KEY (`PEDIDO_ID`)
    REFERENCES `ccomp`.`pedido` (`PEDIDO_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `ccomp`.`livroautor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ccomp`.`livroautor` (
  `Livro_idLivro` INT NOT NULL,
  `Autor_ID` INT NOT NULL,
  PRIMARY KEY (`Livro_idLivro`, `Autor_ID`),
  INDEX `fk_Livro_has_Autor_Autor1_idx` (`Autor_ID` ASC) VISIBLE,
  INDEX `fk_Livro_has_Autor_Livro1_idx` (`Livro_idLivro` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_has_Autor_Autor1`
    FOREIGN KEY (`Autor_ID`)
    REFERENCES `ccomp`.`autor` (`ID`),
  CONSTRAINT `fk_Livro_has_Autor_Livro1`
    FOREIGN KEY (`Livro_idLivro`)
    REFERENCES `ccomp`.`livro` (`idLivro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema proyectoaerolinea
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `proyectoaerolinea` ;

-- -----------------------------------------------------
-- Schema proyectoaerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoaerolinea` DEFAULT CHARACTER SET utf8 ;
USE `proyectoaerolinea` ;

-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`tipo_avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`tipo_avion` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`tipo_avion` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(30) NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `año` INT NOT NULL,
  `cant_pasajeros` INT NOT NULL,
  `cant_fila` INT NOT NULL,
  `cant_asientos_por_fila` INT NOT NULL DEFAULT 6,
  `ultimo_usuario` VARCHAR(45) NULL,
  `ultima_fecha` DATETIME NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`pais` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `iso` VARCHAR(2) NOT NULL,
  `nombre` VARCHAR(80) NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`ruta` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`ruta` (
  `id_ruta` INT NOT NULL AUTO_INCREMENT,
  `origen` INT NOT NULL,
  `destino` INT NOT NULL,
  `minutos` INT(5) NOT NULL,
  `descuento` FLOAT NOT NULL DEFAULT 0.0,
  `ultimo_usuario` VARCHAR(45) NULL,
  `ultima_fecha` DATETIME NULL,
  PRIMARY KEY (`id_ruta`),
  INDEX `fk_origen_idx` (`origen` ASC),
  INDEX `fk_destino_idx` (`destino` ASC),
  CONSTRAINT `fk_origen`
    FOREIGN KEY (`origen`)
    REFERENCES `proyectoaerolinea`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_destino`
    FOREIGN KEY (`destino`)
    REFERENCES `proyectoaerolinea`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`aerolinea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`aerolinea` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`aerolinea` (
  `pkIdAerolinea` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `pais` INT NULL,
  `ultimoUsuario` VARCHAR(45) NULL,
  `ultima_fecha` DATETIME NULL,
  PRIMARY KEY (`pkIdAerolinea`),
  INDEX `fk_pais_idx` (`pais` ASC),
  CONSTRAINT `fk_pais`
    FOREIGN KEY (`pais`)
    REFERENCES `proyectoaerolinea`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`avion` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`avion` (
  `id_avion` INT NOT NULL AUTO_INCREMENT,
  `id_tipo` INT NOT NULL,
  `horario_salida` DATETIME NOT NULL,
  `id_ruta` INT NOT NULL,
  `id_aerolinea` INT NOT NULL,
  `ultimo_usuario` VARCHAR(45) NULL,
  `ultima_fecha` DATETIME NULL,
  `horario_llegada` DATETIME NULL,
  PRIMARY KEY (`id_avion`),
  INDEX `fk_tipo_id` (`id_tipo` ASC),
  INDEX `fk_ruta_id` (`id_ruta` ASC),
  INDEX `fk_aerolinea_idx` (`id_aerolinea` ASC),
  CONSTRAINT `fk_tipo`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `proyectoaerolinea`.`tipo_avion` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta`
    FOREIGN KEY (`id_ruta`)
    REFERENCES `proyectoaerolinea`.`ruta` (`id_ruta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aerolinea`
    FOREIGN KEY (`id_aerolinea`)
    REFERENCES `proyectoaerolinea`.`aerolinea` (`pkIdAerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`usuario` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`usuario` (
  `id_usuario` INT NOT NULL,
  `contrasena` VARCHAR(15) NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `direccion` TEXT NOT NULL,
  `nombre` VARCHAR(15) NOT NULL,
  `apellido1` VARCHAR(15) NOT NULL,
  `apellido2` VARCHAR(15) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `numTel` VARCHAR(15) NOT NULL,
  `numCel` VARCHAR(15) NULL DEFAULT NULL,
  `admin` TINYINT(1) NOT NULL DEFAULT 0,
  `ultimo_usuario` VARCHAR(45) NULL,
  `ultima_fecha` DATETIME NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `nombreUsuario_UNIQUE` (`nombreUsuario` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`boleto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`boleto` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`boleto` (
  `consecutivo` INT NULL,
  `id_vuelo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `numAsiento` INT NOT NULL,
  `numFila` INT NOT NULL,
  `fecha_compra` DATE NULL,
  INDEX `fk_usuario_id` (`id_usuario` ASC),
  PRIMARY KEY (`id_vuelo`, `id_usuario`),
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `proyectoaerolinea`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelo`
    FOREIGN KEY (`id_vuelo`)
    REFERENCES `proyectoaerolinea`.`avion` (`id_avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`asiento` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`asiento` (
  `id_asiento` VARCHAR(3) NOT NULL,
  `id_avion` INT NOT NULL,
  `estado` TINYINT(1) NULL,
  PRIMARY KEY (`id_asiento`),
  INDEX `fk_avas_idx` (`id_avion` ASC),
  CONSTRAINT `fk_avas`
    FOREIGN KEY (`id_avion`)
    REFERENCES `proyectoaerolinea`.`avion` (`id_avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

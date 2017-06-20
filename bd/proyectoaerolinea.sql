-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyectoaerolinea
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `proyectoaerolinea` ;

-- -----------------------------------------------------
-- Schema proyectoaerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoaerolinea` DEFAULT CHARACTER SET latin1 ;
USE `proyectoaerolinea` ;

-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`pais` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `iso` VARCHAR(2) NOT NULL,
  `nombre` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`aerolinea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`aerolinea` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`aerolinea` (
  `pkIdAerolinea` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `pais` INT(11) NOT NULL,
  `ultimoUsuario` VARCHAR(45) NULL DEFAULT NULL,
  `ultima_fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`pkIdAerolinea`),
  INDEX `fk_pais_idx` (`pais` ASC),
  CONSTRAINT `fk_pais`
    FOREIGN KEY (`pais`)
    REFERENCES `proyectoaerolinea`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`ruta` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`ruta` (
  `id_ruta` INT NOT NULL AUTO_INCREMENT,
  `origen` INT(11) NOT NULL,
  `destino` INT(11) NOT NULL,
  `minutos` INT(5) NOT NULL,
  `descuento` FLOAT NOT NULL DEFAULT '0',
  `ultimo_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `ultima_fecha` DATETIME NULL DEFAULT NULL,
  `tarifa` FLOAT NULL DEFAULT '0',
  PRIMARY KEY (`id_ruta`),
  INDEX `fk_origen_idx` (`origen` ASC),
  INDEX `fk_destino_idx` (`destino` ASC),
  CONSTRAINT `fk_destino`
    FOREIGN KEY (`destino`)
    REFERENCES `proyectoaerolinea`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_origen`
    FOREIGN KEY (`origen`)
    REFERENCES `proyectoaerolinea`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`tipo_avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`tipo_avion` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`tipo_avion` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(30) NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `año` INT(11) NOT NULL,
  `cant_pasajeros` INT(11) NOT NULL,
  `cant_fila` INT(11) NOT NULL,
  `cant_asientos_por_fila` INT(11) NOT NULL DEFAULT '6',
  `ultimo_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `ultima_fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`avion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`avion` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`avion` (
  `id_avion` INT NOT NULL AUTO_INCREMENT,
  `id_tipo` INT(11) NOT NULL,
  `horario_salida` DATETIME NOT NULL,
  `id_ruta` INT(11) NOT NULL,
  `id_aerolinea` INT(11) NOT NULL,
  `ultimo_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `ultima_fecha` DATETIME NULL DEFAULT NULL,
  `horario_llegada` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_avion`),
  INDEX `fk_tipo_id` (`id_tipo` ASC),
  INDEX `fk_ruta_id` (`id_ruta` ASC),
  INDEX `fk_aerolinea_idx` (`id_aerolinea` ASC),
  CONSTRAINT `fk_aerolinea`
    FOREIGN KEY (`id_aerolinea`)
    REFERENCES `proyectoaerolinea`.`aerolinea` (`pkIdAerolinea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta`
    FOREIGN KEY (`id_ruta`)
    REFERENCES `proyectoaerolinea`.`ruta` (`id_ruta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `proyectoaerolinea`.`tipo_avion` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`asiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`asiento` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`asiento` (
  `id_asiento` INT NOT NULL AUTO_INCREMENT,
  `id_avion` INT(11) NOT NULL,
  `id_usuario` VARCHAR(25) NOT NULL,
  `codigoAsiento` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_asiento`),
  INDEX `fk_avas_idx` (`id_avion` ASC),
  CONSTRAINT `fk_avas`
    FOREIGN KEY (`id_avion`)
    REFERENCES `proyectoaerolinea`.`avion` (`id_avion`)
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
  `admin` TINYINT(1) NOT NULL DEFAULT '0',
  `ultimo_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `ultima_fecha` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `nombreUsuario_UNIQUE` (`nombreUsuario` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `proyectoaerolinea`.`boleto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyectoaerolinea`.`boleto` ;

CREATE TABLE IF NOT EXISTS `proyectoaerolinea`.`boleto` (
  `consecutivo` INT NULL DEFAULT NULL,
  `id_vuelo` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  `numAsiento` INT(11) NOT NULL,
  `numFila` INT(11) NOT NULL,
  `fecha_compra` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_vuelo`, `id_usuario`),
  INDEX `fk_usuario_id` (`id_usuario` ASC),
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into usuario values(000000000,'admin','admin','unknown','admin','admin','admin',current_timestamp,
'rservcr@gmail.com','00000000','00000000',true,null,null);
INSERT INTO pais(iso,nombre) VALUES('AF', 'Afganistán'),
('AL', 'Albania'),('DE', 'Alemania'),
('AD', 'Andorra'),
('AO', 'Angola'),
('AI', 'Anguilla'),
('AQ', 'Antártida'),
('AG', 'Antigua y Barbuda'),
('AN', 'Antillas Holandesas'),
('SA', 'Arabia Saudí'),
('DZ', 'Argelia'),
('AR', 'Argentina'),
('AM', 'Armenia'),
('AW', 'Aruba'),
('AU', 'Australia'),
('AT', 'Austria'),
('AZ', 'Azerbaiyán'),
('BS', 'Bahamas'),
('BH', 'Bahréin'),
('BD', 'Bangladesh'),
('BB', 'Barbados'),
('BY', 'Bielorrusia'),
('BE', 'Bélgica'),
('BZ', 'Belice'),
('BJ', 'Benin'),
('BM', 'Bermudas'),
('BT', 'Bhután'),
('BO', 'Bolivia'),
('BA', 'Bosnia y Herzegovina'),
('BW', 'Botsuana'),
('BR', 'Brasil'),
('BN', 'Brunéi'),
('BG', 'Bulgaria'),
('BF', 'Burkina Faso'),
('BI', 'Burundi'),
('CV', 'Cabo Verde'),
('KH', 'Camboya'),
('CM', 'Camerún'),
('CA', 'Canadá'),
('TD', 'Chad'),
('CL', 'Chile'),
('CN', 'China'),
('CY', 'Chipre'),
('VA', 'Ciudad del Vaticano'),
('CO', 'Colombia'),
('KM', 'Comoras'),
('CG', 'Congo'),
('KP', 'Corea del Norte'),
('KR', 'Corea del Sur'),
('CI', 'Costa de Marfil'),
('CR', 'Costa Rica'),
('HR', 'Croacia'),
('CU', 'Cuba'),
('DK', 'Dinamarca'),
('DM', 'Dominica'),
('EC', 'Ecuador'),
('EG', 'Egipto'),
('SV', 'El Salvador'),
('AE', 'Emiratos Árabes Unidos'),
('ER', 'Eritrea'),
('SK', 'Eslovaquia'),
('SI', 'Eslovenia'),
('ES', 'España'),
('US', 'Estados Unidos'),
('EE', 'Estonia'),
('ET', 'Etiopía'),
('PH', 'Filipinas'),
('FI', 'Finlandia'),
('FJ', 'Fiyi'),
('FR', 'Francia'),
('GA', 'Gabón'),
('GM', 'Gambia'),
('GE', 'Georgia'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GD', 'Granada'),
('GR', 'Grecia'),
('GL', 'Groenlandia'),
('GP', 'Guadalupe'),
('GU', 'Guam'),
('GT', 'Guatemala'),
('GF', 'Guayana Francesa'),
('GN', 'Guinea'),
('GQ', 'Guinea Ecuatorial'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HT', 'Haití'),
('HN', 'Honduras'),
('HK', 'Hong Kong'),
('HU', 'Hungría'),
('IN', 'India'),
('ID', 'Indonesia'),
('IR', 'Irán'),
('IQ', 'Iraq'),
('IE', 'Irlanda'),
('BV', 'Isla Bouvet'),
('CX', 'Isla de Navidad'),
('NF', 'Isla Norfolk'),
('IS', 'Islandia'),
('KY', 'Islas Caimán'),
('CC', 'Islas Cocos'),
('CK', 'Islas Cook'),
('FO', 'Islas Feroe'),
('GS', 'Islas Georgias del Sur y Sandwich del Sur'),
('AX', 'Islas Gland'),
('HM', 'Islas Heard y McDonald'),
('FK', 'Islas Malvinas'),
('MP', 'Islas Marianas del Norte'),
('MH', 'Islas Marshall'),
('PN', 'Islas Pitcairn'),
('SB', 'Islas Salomón'),
('TC', 'Islas Turcas y Caicos'),
('UM', 'Islas Ultramarinas de Estados Unidos'),
('VG', 'Islas Vírgenes Británicas'),
('VI', 'Islas Vírgenes de los Estados Unidos'),
('IL', 'Israel'),
('IT', 'Italia'),
('JM', 'Jamaica'),
('JP', 'Japón'),
('JO', 'Jordania'),
('KZ', 'Kazajstán'),
('KE', 'Kenia'),
('KG', 'Kirguistán'),
('KI', 'Kiribati'),
('KW', 'Kuwait'),
('LA', 'Laos'),
('LS', 'Lesotho'),
('LV', 'Letonia'),
('LB', 'Líbano'),
('LR', 'Liberia'),
('LY', 'Libia'),
('LI', 'Liechtenstein'),
('LT', 'Lituania'),
('LU', 'Luxemburgo'),
('MO', 'Macao'),
('MK', 'Macedonia'),
('MG', 'Madagascar'),
('MY', 'Malasia'),
('MW', 'Malawi'),
('MV', 'Maldivas'),
('ML', 'Malí'),
('MT', 'Malta'),
('MA', 'Marruecos'),
('MQ', 'Martinica'),
('MU', 'Mauricio'),
('MR', 'Mauritania'),
('YT', 'Mayotte'),
('MX', 'México'),
('FM', 'Micronesia'),
('MD', 'Moldavia'),
('MC', 'Mónaco'),
('MN', 'Mongolia'),
('MS', 'Montserrat'),
('MZ', 'Mozambique'),
('MM', 'Myanmar'),
('NA', 'Namibia'),
('NR', 'Nauru'),
('NP', 'Nepal'),
('NI', 'Nicaragua'),
('NE', 'Níger'),
('NG', 'Nigeria'),
('NU', 'Niue'),
('NO', 'Noruega'),
('NC', 'Nueva Caledonia'),
('NZ', 'Nueva Zelanda'),
('OM', 'Omán'),
('NL', 'Países Bajos'),
('PK', 'Pakistán'),
('PW', 'Palau'),
('PS', 'Palestina'),
('PA', 'Panamá'),
('PG', 'Papúa Nueva Guinea'),
('PY', 'Paraguay'),
('PE', 'Perú'),
('PF', 'Polinesia Francesa'),
('PL', 'Polonia'),
('PT', 'Portugal'),
('PR', 'Puerto Rico'),
('QA', 'Qatar'),
('GB', 'Reino Unido'),
('CF', 'República Centroafricana'),
('CZ', 'República Checa'),
('CD', 'República Democrática del Congo'),
('DO', 'República Dominicana'),
('RE', 'Reunión'),
('RW', 'Ruanda'),
('RO', 'Rumania'),
('RU', 'Rusia'),
('EH', 'Sahara Occidental'),
('WS', 'Samoa'),
('AS', 'Samoa Americana'),
('KN', 'San Cristóbal y Nevis'),
('SM', 'San Marino'),
('PM', 'San Pedro y Miquelón'),
('VC', 'San Vicente y las Granadinas'),
('SH', 'Santa Helena'),
('LC', 'Santa Lucía'),
('ST', 'Santo Tomé y Príncipe'),
('SN', 'Senegal'),
('CS', 'Serbia y Montenegro'),
('SC', 'Seychelles'),
('SL', 'Sierra Leona'),
('SG', 'Singapur'),
('SY', 'Siria'),
('SO', 'Somalia'),
('LK', 'Sri Lanka'),
('SZ', 'Suazilandia'),
('ZA', 'Sudáfrica'),
('SD', 'Sudán'),
('SE', 'Suecia'),
('CH', 'Suiza'),
('SR', 'Surinam'),
('SJ', 'Svalbard y Jan Mayen'),
('TH', 'Tailandia'),
('TW', 'Taiwán'),
('TZ', 'Tanzania'),
('TJ', 'Tayikistán'),
('IO', 'Territorio Británico del Océano Índico'),
('TF', 'Territorios Australes Franceses'),
('TL', 'Timor Oriental'),
('TG', 'Togo'),
('TK', 'Tokelau'),
('TO', 'Tonga'),
('TT', 'Trinidad y Tobago'),
('TN', 'Túnez'),
('TM', 'Turkmenistán'),
('TR', 'Turquía'),
('TV', 'Tuvalu'),
('UA', 'Ucrania'),
('UG', 'Uganda'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistán'),
('VU', 'Vanuatu'),
('VE', 'Venezuela'),
('VN', 'Vietnam'),
('WF', 'Wallis y Futuna'),
('YE', 'Yemen'),
('DJ', 'Yibuti'),
('ZM', 'Zambia'),
('ZW', 'Zimbabue');

insert into aerolinea(nombre,pais,ultimoUsuario,ultima_fecha) 
values ('British Airways',180,'admin',current_timestamp),
('Avianca',45,'admin',current_timestamp),('United Airlines',64,'admin',current_timestamp),
('Emirates',59,'admin',current_timestamp),('Mexicana',148,'admin',current_timestamp),
('Iberia',63,'admin',current_timestamp),('Austria Airlines',16,'admin',current_timestamp),
('Swissair',211,'admin',current_timestamp),('Aerolineas Argentinas',12,'admin',current_timestamp),
('US Airways',64,'admin',current_timestamp),('Copa Airlines', 45,'admin',current_timestamp),
('Sky Airline',41,'admin',current_timestamp),('American Airlines',64,'admin',current_timestamp),
('Delta Airlines',64,'admin',current_timestamp),('Qatar Airways',179,'admin',current_timestamp),
('Easyfly',45,'admin',current_timestamp),('Aer Lingus',95,'admin',current_timestamp),
('Turkish Airlines',227,'admin',current_timestamp),('Singapore Airlines',203,'admin',current_timestamp);

insert into ruta(origen,destino,minutos,descuento, ultimo_usuario,ultima_fecha,tarifa) 
values (59,180,600,0,'admin',current_timestamp,2000),(211,12,1800,0,'admin',current_timestamp,5000),
(45,148,1440,0,'admin',current_timestamp,3000),(95,180,180,0,'admin',current_timestamp,800),
(227,179,540,0,'admin',current_timestamp,2000);

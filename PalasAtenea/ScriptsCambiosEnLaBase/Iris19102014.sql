DROP TABLE IF EXISTS `palasatenea`.`alumno`;
CREATE TABLE  `palasatenea`.`alumno` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) DEFAULT NULL,
  `estado` smallint(5) unsigned DEFAULT NULL,
  `nombre1` varchar(50) DEFAULT NULL,
  `nombre2` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `fnacimiento` datetime DEFAULT NULL,
  `lnacimiento` varchar(250) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `religion` varchar(250) DEFAULT NULL,
  `enfermedades` varchar(500) DEFAULT NULL,
  `medicamentos` varchar(500) DEFAULT NULL,
  `alergico` varchar(500) DEFAULT NULL,
  `aprendizaje` varchar(500) DEFAULT NULL,
  `escuelaprevia` varchar(250) DEFAULT NULL,
  `ultgrado` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `palasatenea`.`codalum`;
CREATE TABLE  `palasatenea`.`codalum` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) DEFAULT NULL,
  `anio` int(10) unsigned DEFAULT NULL,
  `correlativo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `palasatenea`.`familiar`;
CREATE TABLE  `palasatenea`.`familiar` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alumno` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `empresa` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `lugtrabajo` varchar(100) DEFAULT NULL,
  `dirtrabajo` varchar(500) DEFAULT NULL,
  `teltrabajo` varchar(45) DEFAULT NULL,
  `exttrabajo` varchar(5) DEFAULT NULL,
  `parentesco` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ident`),
  KEY `FK_familiar_1` (`alumno`),
  CONSTRAINT `FK_familiar_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
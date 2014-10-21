DROP TABLE IF EXISTS `palasatenea`.`alumno`;
CREATE TABLE  `palasatenea`.`alumno` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre1` varchar(50) NOT NULL,
  `nombre2` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
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
  `codigo` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
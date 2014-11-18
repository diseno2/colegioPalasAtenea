-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.40-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema scnpalas
--

CREATE DATABASE IF NOT EXISTS scnpalas;
USE scnpalas;

--
-- Definition of table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` int(10) unsigned DEFAULT NULL COMMENT 'referencia a usuario',
  `carnet` varchar(8) DEFAULT NULL COMMENT 'carnet del alumno',
  `estado` smallint(5) unsigned DEFAULT NULL COMMENT 'estado actual, A(activo), B(inactivo)',
  `nombre1` varchar(50) DEFAULT NULL COMMENT 'primer nombre',
  `nombre2` varchar(50) DEFAULT NULL COMMENT 'segundo nombre',
  `apellido1` varchar(50) DEFAULT NULL COMMENT 'primer apellido',
  `apellido2` varchar(50) DEFAULT NULL COMMENT 'segundo apellido',
  `genero` varchar(1) DEFAULT NULL COMMENT 'M(masculino), F(femenino)',
  `fnacimiento` datetime DEFAULT NULL COMMENT 'fecha de nacimiento',
  `lnacimiento` varchar(250) DEFAULT NULL COMMENT 'lugar de nacimiento',
  `direccion` varchar(500) DEFAULT NULL COMMENT 'direccion',
  `telefono` varchar(8) DEFAULT NULL COMMENT 'telefono',
  `religion` varchar(250) DEFAULT NULL COMMENT 'religion',
  `enfermedades` varchar(500) DEFAULT NULL COMMENT 'enfermedades que padece',
  `medicamentos` varchar(500) DEFAULT NULL COMMENT 'medicamentos que usa',
  `alergico` varchar(500) DEFAULT NULL COMMENT 'alergias que padece',
  `aprendizaje` varchar(500) DEFAULT NULL COMMENT 'observaciones sobre aprendizaje',
  `escuelaprevia` varchar(250) DEFAULT NULL COMMENT 'escuela de la que procede',
  `ultgrado` int(10) unsigned DEFAULT NULL COMMENT 'ultimo grado aprobado',
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ident`),
  KEY `FK_alumno_1` (`usuario`),
  CONSTRAINT `FK_alumno_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='registro de alumno';

--
-- Dumping data for table `alumno`
--

/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`ident`,`usuario`,`carnet`,`estado`,`nombre1`,`nombre2`,`apellido1`,`apellido2`,`genero`,`fnacimiento`,`lnacimiento`,`direccion`,`telefono`,`religion`,`enfermedades`,`medicamentos`,`alergico`,`aprendizaje`,`escuelaprevia`,`ultgrado`,`correo`) VALUES 
 (1,NULL,'VV10031',1,'edwin','josue','velasco','rivas','m','1992-11-02 00:00:00','san vicente','san salvador','75489694','hincha','sangramiento nasal','alcohol','culeros','leer','cefeg',9,NULL),
 (2,NULL,'',0,'joseline','graciela','alfaro','dominguez','F',NULL,'zacatecoluca','zacatecoluca','72825165','apostolica','sinocitis','inhalador','chick','programar','pablo castillo',4,NULL),
 (3,NULL,'',0,'joseline','graciela','velasco','dominguez','F','0017-03-06 00:00:00','san vicente','zacatecoluca','22736382','apostolica','sinocitis','inhalador','chick','programar','pablo castillo',7,NULL);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;


--
-- Definition of table `docente`
--

DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` int(10) unsigned DEFAULT NULL COMMENT 'usuario asignado al docente',
  `nombre1` varchar(45) NOT NULL,
  `nombre2` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fnacimiento` date DEFAULT NULL,
  `fcontrato` date DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE,
  KEY `FK_docente_1` (`usuario`),
  CONSTRAINT `FK_docente_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docente`
--

/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` (`ident`,`usuario`,`nombre1`,`nombre2`,`apellido1`,`apellido2`,`direccion`,`telefono`,`fnacimiento`,`fcontrato`) VALUES 
 (1,NULL,'joseline','gracielaa','alfaro','dominguez','san salvador','75489694',NULL,NULL),
 (2,NULL,'edwin','josue','velasco','rivas','san salvador','75489694',NULL,NULL);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;


--
-- Definition of table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE `evaluacion` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grado_materia` int(10) unsigned NOT NULL,
  `evaluacion` varchar(45) NOT NULL COMMENT 'nombre de la evaluacion, ejemplo: examen corto, parcial, tarea, proyecto, etc.',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'descripcion detallada de la evaluacion',
  `porcentaje` float NOT NULL COMMENT 'porcentaje de la calificacion',
  `bimestre` varchar(45) NOT NULL COMMENT 'bimestre en el que corresponde la evaluacion',
  `fecha` date NOT NULL COMMENT 'fecha propuesta de evaluacion',
  `estado` varchar(1) NOT NULL COMMENT 'estado de la evaluacion A(abierta), C(cerrada)',
  PRIMARY KEY (`ident`),
  KEY `FK_evaluacion_1` (`grado_materia`),
  CONSTRAINT `FK_evaluacion_1` FOREIGN KEY (`grado_materia`) REFERENCES `grado_materia` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='configuracion de evaluaciones a realizar';

--
-- Dumping data for table `evaluacion`
--

/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;


--
-- Definition of table `familiar`
--

DROP TABLE IF EXISTS `familiar`;
CREATE TABLE `familiar` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` int(10) unsigned NOT NULL COMMENT 'referencia a usuario',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'nombre completo',
  `direccion` varchar(500) DEFAULT NULL COMMENT 'direccion del domicilio',
  `telefono` varchar(45) DEFAULT NULL COMMENT 'telefono del domicilio',
  `celular` varchar(45) DEFAULT NULL COMMENT 'celular personal',
  `empresa` varchar(45) DEFAULT NULL COMMENT 'compañia del celular',
  `email` varchar(100) DEFAULT NULL COMMENT 'correo electronico',
  `lugtrabajo` varchar(100) DEFAULT NULL COMMENT 'lugar de trabajo',
  `dirtrabajo` varchar(500) DEFAULT NULL COMMENT 'direccion de trabajo',
  `teltrabajo` varchar(45) DEFAULT NULL COMMENT 'telefono de trabajo',
  `exttrabajo` varchar(5) DEFAULT NULL COMMENT 'extension del telefono de trabajo',
  `parentesco` int(10) unsigned DEFAULT NULL COMMENT 'P(padre), M(madre), T(tutor)',
  PRIMARY KEY (`ident`),
  KEY `FK_familiar_2` (`usuario`),
  CONSTRAINT `FK_familiar_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='registro de familiar del alumno';

--
-- Dumping data for table `familiar`
--

/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;


--
-- Definition of table `familiares`
--

DROP TABLE IF EXISTS `familiares`;
CREATE TABLE `familiares` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alumno` int(10) unsigned NOT NULL,
  `familiar` int(10) unsigned NOT NULL,
  `parentesco` varchar(1) NOT NULL COMMENT 'tipo de parentesco',
  PRIMARY KEY (`ident`),
  KEY `FK_familiares_1` (`alumno`),
  KEY `FK_familiares_2` (`familiar`),
  CONSTRAINT `FK_familiares_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`ident`),
  CONSTRAINT `FK_familiares_2` FOREIGN KEY (`familiar`) REFERENCES `familiar` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relaciones familiares alumno-tutor';

--
-- Dumping data for table `familiares`
--

/*!40000 ALTER TABLE `familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `familiares` ENABLE KEYS */;


--
-- Definition of table `grado`
--

DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `docente` int(10) unsigned NOT NULL COMMENT 'relacion a docente',
  `seccion` int(10) unsigned NOT NULL COMMENT 'relacion a grado',
  `periodo` int(10) unsigned NOT NULL COMMENT 'relacion a periodo',
  `inscritos` int(10) unsigned NOT NULL COMMENT 'representa el numero de alumnos inscritos',
  `estado` varchar(1) NOT NULL COMMENT 'estado del grado A(abierto), C(cerrado), F(finalizado)',
  PRIMARY KEY (`ident`) USING BTREE,
  KEY `FK_grado_1` (`docente`),
  KEY `FK_grado_2` (`seccion`),
  KEY `FK_grado_3` (`periodo`),
  CONSTRAINT `FK_grado_1` FOREIGN KEY (`docente`) REFERENCES `docente` (`ident`),
  CONSTRAINT `FK_grado_2` FOREIGN KEY (`seccion`) REFERENCES `seccion` (`ident`),
  CONSTRAINT `FK_grado_3` FOREIGN KEY (`periodo`) REFERENCES `periodo` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='grado';

--
-- Dumping data for table `grado`
--

/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;


--
-- Definition of table `grado_materia`
--

DROP TABLE IF EXISTS `grado_materia`;
CREATE TABLE `grado_materia` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grado` int(10) unsigned NOT NULL COMMENT 'configuracion de grado',
  `materia` int(10) unsigned NOT NULL COMMENT 'referencia a materia',
  PRIMARY KEY (`ident`) USING BTREE,
  KEY `FK_grado_materia_1` (`grado`),
  KEY `FK_grado_materia_2` (`materia`),
  CONSTRAINT `FK_grado_materia_1` FOREIGN KEY (`grado`) REFERENCES `grado` (`ident`),
  CONSTRAINT `FK_grado_materia_2` FOREIGN KEY (`materia`) REFERENCES `materia` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='detalle de configuracion de grado';

--
-- Dumping data for table `grado_materia`
--

/*!40000 ALTER TABLE `grado_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `grado_materia` ENABLE KEYS */;


--
-- Definition of table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` int(10) unsigned NOT NULL COMMENT 'usuario que realizo la accion',
  `fecha` datetime NOT NULL COMMENT 'fecha y hora en que se realizo la accion',
  `tabla` varchar(45) NOT NULL COMMENT 'tabla en que realizo la modificacion',
  `id_tabla` int(10) unsigned NOT NULL COMMENT 'ident del registro que toco',
  `accion` varchar(1) NOT NULL COMMENT 'accion que realizo A(agrego), M(modifico), B(borro)',
  PRIMARY KEY (`ident`),
  KEY `FK_log_1` (`usuario`),
  CONSTRAINT `FK_log_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla para el log de las transacciones realizadas por los usuarios';

--
-- Dumping data for table `log`
--

/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;


--
-- Definition of table `log_detalle`
--

DROP TABLE IF EXISTS `log_detalle`;
CREATE TABLE `log_detalle` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log` int(10) unsigned NOT NULL COMMENT 'log al que hace referencia',
  `campo` varchar(45) NOT NULL COMMENT 'nombre del campo',
  `valor_original` varchar(1000) NOT NULL COMMENT 'valor original del campo',
  `valor_modificado` varchar(1000) NOT NULL COMMENT 'valor nuevo',
  PRIMARY KEY (`ident`),
  KEY `FK_log_detalle_1` (`log`),
  CONSTRAINT `FK_log_detalle_1` FOREIGN KEY (`log`) REFERENCES `log` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='detalle de los valores de los campos';

--
-- Dumping data for table `log_detalle`
--

/*!40000 ALTER TABLE `log_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_detalle` ENABLE KEYS */;


--
-- Definition of table `materia`
--

DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL COMMENT 'descripcion de la materia, ejemplo: ciencia, mate, etc',
  `activa` varchar(1) NOT NULL COMMENT 'indica si esta activa o no',
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='configuracion de materias';

--
-- Dumping data for table `materia`
--

/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` (`ident`,`descripcion`,`activa`) VALUES 
 (1,'matematicas','S'),
 (2,'mate','S'),
 (3,'biologia','S');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;


--
-- Definition of table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alumno` int(10) unsigned NOT NULL COMMENT 'alumno inscrito',
  `grado` int(10) unsigned NOT NULL COMMENT 'grado en el que esta inscrito',
  `estado` varchar(1) NOT NULL COMMENT 'estado de la matricula: A(activa), B(baja), D(desercion), P(aprobado), R(reprobado)',
  `fecha` date NOT NULL COMMENT 'fecha en que se realizo la matricula',
  PRIMARY KEY (`ident`),
  KEY `FK_matricula_1` (`alumno`),
  KEY `FK_matricula_2` (`grado`),
  CONSTRAINT `FK_matricula_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`ident`),
  CONSTRAINT `FK_matricula_2` FOREIGN KEY (`grado`) REFERENCES `grado` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='datos de la matricula del alumno';

--
-- Dumping data for table `matricula`
--

/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;


--
-- Definition of table `nota`
--

DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alumno` int(10) unsigned NOT NULL COMMENT 'referencia a alumno',
  `periodo` int(10) unsigned NOT NULL COMMENT 'referencia a periodo, debe ser el año activo',
  `materia` int(10) unsigned NOT NULL COMMENT 'referencia a materia',
  `evaluacion` int(10) unsigned DEFAULT NULL COMMENT 'referencia a evaluacion',
  `calificacion` float NOT NULL COMMENT 'calificacion obtenida',
  `tipo_registro` varchar(45) NOT NULL COMMENT 'tipo de registro: E(nota de evaluacion), B(nota de bimestre), F(nota final)',
  PRIMARY KEY (`ident`),
  KEY `FK_nota_1` (`alumno`),
  KEY `FK_nota_2` (`periodo`),
  KEY `FK_nota_3` (`materia`),
  KEY `FK_nota_4` (`evaluacion`),
  CONSTRAINT `FK_nota_1` FOREIGN KEY (`alumno`) REFERENCES `alumno` (`ident`),
  CONSTRAINT `FK_nota_2` FOREIGN KEY (`periodo`) REFERENCES `periodo` (`ident`),
  CONSTRAINT `FK_nota_3` FOREIGN KEY (`materia`) REFERENCES `materia` (`ident`),
  CONSTRAINT `FK_nota_4` FOREIGN KEY (`evaluacion`) REFERENCES `evaluacion` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='registro de nota';

--
-- Dumping data for table `nota`
--

/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;


--
-- Definition of table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `anio` int(10) unsigned NOT NULL COMMENT 'periodo lectivo, ejemplo: 2015, etc.',
  `inicio` date NOT NULL COMMENT 'fecha de inicio del periodo',
  `fin` date NOT NULL COMMENT 'fecha de fin del periodo',
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='periodo lectivo';

--
-- Dumping data for table `periodo`
--

/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` (`ident`,`anio`,`inicio`,`fin`) VALUES 
 (1,2014,'0010-08-07','0018-11-04');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;


--
-- Definition of table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `Ident` int(10) unsigned NOT NULL,
  `Descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


--
-- Definition of table `rol_opciones`
--

DROP TABLE IF EXISTS `rol_opciones`;
CREATE TABLE `rol_opciones` (
  `ident` int(10) unsigned NOT NULL,
  `rol` int(10) unsigned NOT NULL,
  `opcion` varchar(250) NOT NULL,
  PRIMARY KEY (`ident`),
  KEY `FK_rol_opciones_1` (`rol`),
  CONSTRAINT `FK_rol_opciones_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`Ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol_opciones`
--

/*!40000 ALTER TABLE `rol_opciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_opciones` ENABLE KEYS */;


--
-- Definition of table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
CREATE TABLE `seccion` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador unico',
  `grado` varchar(45) NOT NULL COMMENT 'descripcion del grado ejemplo 1°, primero',
  `seccion` varchar(45) NOT NULL COMMENT 'seccion del grado, ejemplo A, B, C',
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='configuracion de la seccion';

--
-- Dumping data for table `seccion`
--

/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` (`ident`,`grado`,`seccion`) VALUES 
 (1,'primero','A');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ident` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` char(45) NOT NULL COMMENT 'nombre del usuario',
  `password` varchar(250) NOT NULL COMMENT 'contraseña',
  `rol` int(10) unsigned NOT NULL COMMENT 'roles validos: A(admin), D(docente), U(usuario alumno o padre de familia)',
  `estado` varchar(1) NOT NULL COMMENT 'estado del usuario, A(activo), I(inactivo)',
  PRIMARY KEY (`ident`),
  KEY `FK_usuario_1` (`rol`),
  CONSTRAINT `FK_usuario_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`Ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='usuarios del aplicativo';

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

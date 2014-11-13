INSERT INTO `materia` (`ident`,`descripcion`,`activa`) VALUES 
 (1,'MATEMATICAS','S'),
 (2,'CIENCIAS, SALUD Y MEDIO AMBIENTE','S'),
 (3,'LENGUAJE Y LITERATURA','S'),
 (4,'ESTUDIOS SOCIALES','S'),
 (5,'EDUCACION FISICA','S'),
 (6,'INGLES','S');
 
 INSERT INTO `rol` (`Ident`,`Descripcion`) VALUES 
 (1,'ROLE_ADMIN'),
 (2,'ROLE_DOCENTE'),
 (3,'ROLE_TUTOR'),
 (4,'ROLE_ALUMNO');
 
 INSERT INTO `usuario` (`ident`,`usuario`,`password`,`rol`,`estado`) VALUES 
 (1,'admin@admin','123456',1,'A'),
 (2,'docente@docente','123456',2,'A');
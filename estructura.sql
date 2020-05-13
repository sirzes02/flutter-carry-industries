-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura para tabla proyecto.carro
CREATE TABLE IF NOT EXISTS `carro` (
  `car_pla` varchar(6) NOT NULL COMMENT 'Placa',
  `car_mar` varchar(35) NOT NULL COMMENT 'Marca',
  `car_mod` smallint(6) NOT NULL COMMENT 'Modelo',
  `car_pre` float NOT NULL COMMENT 'Precio',
  `car_tip` varchar(35) NOT NULL COMMENT 'Tipo',
  `car_usa` bit(1) NOT NULL COMMENT 'Usado?',
  PRIMARY KEY (`car_pla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyecto.carro: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` (`car_pla`, `car_mar`, `car_mod`, `car_pre`, `car_tip`, `car_usa`) VALUES
	('dfs754', 'Ford', 2019, 28.39, 'Camionetas', b'1'),
	('fgh075', 'Kia', 2020, 22.9, 'Camperos', b'1'),
	('fgh098', 'Chevrolet', 2019, 22.9, 'Automovil', b'1'),
	('fgh341', 'Ford', 2020, 120, 'Automovil', b'0'),
	('gfd863', 'Nissan', 2019, 30.5, 'Automovil', b'0'),
	('ghj941', 'Renault', 2019, 16, 'Camperos', b'1'),
	('jhg345', 'Kia', 2020, 30.5, 'Automovil', b'1'),
	('jhg875', 'Hyundai', 2019, 45.8, 'Camionetas', b'0'),
	('kjh234', 'Nissan', 2020, 11.3, 'Camionetas', b'0'),
	('kjh341', 'Chevrolet', 2020, 136.99, 'Camionetas', b'0'),
	('kjh987', 'Toyota', 2019, 29, 'Carga', b'0'),
	('ljy527', 'Renault', 2020, 16, 'Carga', b'1'),
	('sdf978', 'Toyota', 2019, 45.8, 'Camionetas', b'1'),
	('zxc865', 'Hyundai', 2020, 95.99, 'Automovil', b'0');
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;

-- Volcando estructura para tabla proyecto.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usu_cor` varchar(50) NOT NULL COMMENT 'Correo',
  `usu_nom` varchar(50) NOT NULL COMMENT 'Nombre',
  `usu_ape` varchar(50) NOT NULL COMMENT 'Apellido',
  `usu_tel` varchar(50) NOT NULL COMMENT 'Telefonia',
  `usu_dir` varchar(50) NOT NULL COMMENT 'Dirección',
  `usu_pas` varchar(50) NOT NULL COMMENT 'Contraseña',
  `usu_car_rec` longtext COMMENT 'Lista de los carros',
  PRIMARY KEY (`usu_cor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla proyecto.usuarios: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`usu_cor`, `usu_nom`, `usu_ape`, `usu_tel`, `usu_dir`, `usu_pas`, `usu_car_rec`) VALUES
	('andres.orejuela00@usc.edu.co', 'andres', 'orejuela', '3113211192', 'Calle 6a #09-74', '1983', NULL),
	('camilo.valencia00@usc.edu.co', 'camilo', 'valencia', '3104460913', 'Calle 44 #34B-74', '12345', NULL),
	('daniela.velez00@usc.edu.co', 'daniela', 'velez', '3113646998', 'Carrera 8 #88-74', '0993434', NULL),
	('diego.caicedo00usc.edu.co', 'diego', 'caicedo', '3226661208', 'Calle 10a #11-55', '8787856', NULL),
	('luis.giraldo@usc.edu.co', 'luis', 'giraldo', '3008651203', 'Calle 102 #114-22', '232839', 'ghj941-ljy527-fgh075-jhg345-'),
	('tatiana.fernandez00@usc.edu.co', 'tatiana', 'fernandez', '3015559877', 'Carrera 34A #39C-66', '4693232', NULL),
	('valentina.valencia00@usc.edu.co', 'valentina', 'valencia', '3129340988', 'Carrera 39 #35C-98', '199889', NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

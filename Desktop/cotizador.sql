/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    :                                                                    */
/*  FileName : modelo_nuevo.ecm                                                   */
/*  Platform : MySQL 5                                                            */
/*  Version  : Concept                                                            */
/*  Date     : jueves, 03 de diciembre de 2015                                    */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE `usuario` (
  `id_usuario` INT(15) AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(100),
  `apellido` VARCHAR(100),
  `email` VARCHAR(100),
  `password` VARCHAR(150),
  `telefono` VARCHAR(40),
  CONSTRAINT `PK_usuario` PRIMARY KEY (`id_usuario`)
);

CREATE TABLE `carro` (
  `id_vehiculo` INT AUTO_INCREMENT NOT NULL,
  `marca` VARCHAR(100),
  `placa` VARCHAR(40),
  `color` VARCHAR(40),
  `cant_puertas` INT,
  `trasmision` VARCHAR(40),
  `modelofecha` INT,
  `valor_neto` INT,
  `id_usuario` INT NOT NULL,
  CONSTRAINT `PK_carro` PRIMARY KEY (`id_vehiculo`)
);

CREATE TABLE `Cotizador` (
  `id_cotizacion` INT(15) AUTO_INCREMENT NOT NULL,
  `fecha_inicio` DATE,
  `fecha_fin` DATE,
  `precio` INT,
  `id_vehiculo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  CONSTRAINT `PK_Cotizador` PRIMARY KEY (`id_cotizacion`)
);

CREATE TABLE `fotosCarros` (
  `id_fotos` INT AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(150),
  `ruta` VARCHAR(150),
  `id_vehiculo` INT NOT NULL,
  CONSTRAINT `PK_fotosCarros` PRIMARY KEY (`id_fotos`)
);

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE `carro`
  ADD CONSTRAINT `FK_carro_usuario`
  FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `Cotizador`
  ADD CONSTRAINT `FK_Cotizador_carro`
  FOREIGN KEY (`id_vehiculo`) REFERENCES `carro` (`id_vehiculo`);

ALTER TABLE `Cotizador`
  ADD CONSTRAINT `FK_Cotizador_usuario`
  FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `fotosCarros`
  ADD CONSTRAINT `FK_fotosCarros_carro`
  FOREIGN KEY (`id_vehiculo`) REFERENCES `carro` (`id_vehiculo`);

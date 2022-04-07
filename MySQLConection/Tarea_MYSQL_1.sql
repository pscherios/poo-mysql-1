/*Creación de tabla clientes*/
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nit` varchar(9) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Creación tabla empleados con llave foranea*/
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_puesto` smallint DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto_puestos_empleados_idx` (`id_puesto`),
  CONSTRAINT `id_puesto_puestos_empleados` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Creación tabla puestos*/
CREATE TABLE `puestos` (
  `id_puesto` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Codigo para el ingreso, eliminación, remplazo y enlazamiento de datos*/
select * from db_empresa.clientes;

insert into db_empresa.clientes(nit,nombres,apellidos,direccion,telefono,fecha_nacimiento)
values('11234','Jose Luis','Perez Lopez','Guatemala','5555','2000-10-01');

select *from db_empresa.puestos;

INSERT INTO db_empresa.empleados(codigo,nombres,apellidos,direccion,telefono,fecha_nacimiento,id_puesto)
VALUES('E002','Julio','Guzman','Guatemala','222','1993-01-01',2);

select * from db_empresa.empleados;

update db_empresa.empleados set codigo='E002',nombres='Julio',apellidos='Diaz Lopez'
where id_empleado=2;

update db_empresa.empleados set telefono='2222'
where id_empleado=2;

delete from db_empresa.empleados where id_empleado=2;

select e.id_empleado,e.codigo,e.nombres,e.apellidos,e.direccion,e.telefono,e.fecha_nacimiento,p.puesto 
from db_empresa.empleados as e inner join db_empresa.puestos as p on e.id_puesto=p.id_puesto;
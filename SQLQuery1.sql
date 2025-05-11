create database pratica1;

use pratica1;

if object_id ('empleados') is not null
 drop table empleados;

 create table empleados(
 nombre varchar(30) not null,
 apellido varchar(20) not null,
 documento char(8),
 fechanacimiento datetime,
 fechaingreso datetime,
 sueldo decimal(6,2),
 primary key(documento)
);insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);


-- 4- Muestre nombre y apellido concatenados, con el apellido en letras may�sculas, el documento
-- precedido por "DNI N� " y el sueldo precedido por "$ ".
SELECT 
    nombre + ' ' + UPPER(apellido) AS NombreCompleto, 
    'DNI N� ' + documento AS Documento, 
    '$ ' + CAST(sueldo AS VARCHAR) AS Sueldo
FROM empleados;

-- 5- Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$ ".
SELECT 
    documento, 
    '$ ' + CAST(CEILING(sueldo) AS VARCHAR) AS SueldoRedondeado
FROM empleados;

-- 6. Mostrar los nombres y apellidos de los empleados que cumplen a�os en octubre:*  
SELECT nombre, apellido 
FROM empleados 
WHERE MONTH(fechanacimiento) = 10;

-- 7. Mostrar los nombres y apellidos de los empleados que ingresaron en el a�o 2000:*  
SELECT nombre, apellido 
FROM empleados 
WHERE YEAR(fechaingreso) = 2000;
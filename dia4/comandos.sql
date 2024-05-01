-- CREAR UNA BASE DATOS DESDE TERMINAL 
-- paso 1: Acceder con el usuario
psql -U postgres ///#SOLUCIONAR VARIABLES DE ENTORNO

-- CREATE DATABASE nombre_base_datos;
CREATE DATABASE prueba1;

--Listar las bases de datos \l
postgres=# \l

-- CONECTARESE A LA BASE DE DATOS - \c
postgres=# \c prueba1;
prueba1=#

-- ELIMINAR BASE DE DATOS - DROP DATABASE nombre_base_datos;

-- CREAR UNA TABLA 

CREATE TABLE clientes(
    nombre varchar(30),
    apellido varchar(30)
);

-- CONSULTAR LISTA DE TABLAS EN LA BASE DE DATOS \d
prueba1=# \d o \d+

-- CONSULTAR LSTA DE TABLAS EN LA BASE DE DATOS PERO CON DETALLES
prueba1-# \d clientes

-- INSERTAR DATOS N LA TABLA 
INSERT INTO CLIENTES (nombre, apellido) VALUES ('Juan', 'Aguilera'); ---- SEMPRE COMILLAS SIMPLES
INSERT INTO CLIENTES (nombre, apellido) VALUES ('Juan', 'Aguilera');

-- CONSULTAR DATOS EN LA TABLA
select * from clientes;

-- 20248424 DIA 2
select * from productos LIMIT 10;

-- LENGTH
select * from productos ORDER BY LENGTH(nombre_productos) asc;
select *, LENGTH(nombre_producto) from productos ORDER BY LENGTH(nombre_productos) asc;

-- LEFT('cadena', cant_caracteres)
select * LEFT(categoria, 3) as codigo from productos;

-- FUNCIONES DE AGREGADO
-- SUM()

SELECT SUM(precio) FROM PRODUCTOS;

SELECT AVG(precio) as promedio FROM PRODUCTOS;

SELECT MAX(precio) as precio_maximo FROM PRODUCTOS;

SELECT MIN(precio) as precio_minimo FROM PRODUCTOS;


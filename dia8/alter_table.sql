psql -U postgres

--Paso 1: Creamos la base de datos con el nombre Mawashi Phones.
create database mawashi_phones;

--Paso 2: Nos conectamos a la base de datos.
\c mawashi_phones;

--Paso 3: Creamos la tabla con los campos que nos solicita inicialmente el cliente.
create table phones (
    id int primary key, 
    modelo varchar(50), 
    mac_address int unique,
    fecha_fabricacion varchar(50)
);

--Paso 4: Insertamos un registro para probar la tabla.
insert into phones (id, modelo, mac_address, fecha_fabricacion) 
values (1, 'Iphone14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

--Paso 5: Modificamos el tipo de dato definido en el campo mac_address.
alter table phones alter column mac_address type varchar(50);

\d phones

--Paso 7: Insertamos nuevamente el registro.
insert into phones (id, modelo, mac_address, fecha_fabricacion) 
values (1, 'Iphone14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

--Paso 8: Con el alter table también podemos agregar nuevas restricciones sin reescribir las ya existentes.
alter table phones alter column mac_address set not null;


DROP TABLE nombre_tabla; --ELIMINA UNA TABLA 


--Paso 9: Insertamos un nuevo registro a la tabla phones.
insert into phones (id, modelo, mac_address, fecha_fabricacion) 
values (2, 'Iphone13', '5B:1A:2C:7D:8F:7h', '2021-09-24');

DROP TABLE phones;

DROP TABLE autores;

--paso 1: Creacion del usuario con password
CREATE USER felipe WITH PASSWORD 'Admin1234';

--CREATE ROLE

--paso 2: Crear base de datos con el nombre del usuario
CREATE DATABASE felipe WITH OWNER felipe;

--Paso 3: Establecer permisos al usuario
ALTER USER felipe WITH



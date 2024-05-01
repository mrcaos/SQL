-- DDL, DML, DCL

--DML (insert, update, delete)
-- Paso 1: Creamos una base de datos de comidas típicas chilenas.
create database comidas_tipicas;
\c comidas_tipicas
-- Paso 2: Creamos una tabla llamada cocina chilena con los campos id y nombre.
create table cocina_chilena(
    id int, 
    nombre varchar(50)
);

--Paso 3: Insertamos 2 registros a la tabla con sus respectivos campos.
insert into cocina_chilena (id, nombre) values ('1','Pastel de choclo');
insert into cocina_chilena (id, nombre) values ('2', 'Umitas');

-- 3.1 validar la insercion
select * from cocina_chilena;

-- Paso 4: Para actualizar un registro utilizamos update.
UPDATE cocina_chilena 
SET nombre = 'Humitas' 
--where id = 2
;
UPDATE cocina_chilena 
SET nombre = 'Pastel de choclo' 
where id = 1
;

-- Insertar 3 registros mas, con información incorrecta
insert into cocina_chilena (id, nombre) values ('3', 'Porotoz');
insert into cocina_chilena (id, nombre) values ('4', 'Lentejaz');
insert into cocina_chilena (id, nombre) values ('5', 'Arvejaz');

UPDATE cocina_chilena 
SET nombre = 'Porotos' 
where id = 3
;

--Paso 5: Eliminar un registro lo podremos hacer con la sentencia Delete
--DELETE FROM nombre_tabla WHERE condicion;
DELETE FROM cocina_chilena WHERE id = 4;
-- 5.1 Eliminacion Multiple
DELETE FROM cocina_chilena WHERE id IN (5,2,4,3);

-- 5.2 DELETE sin WHERE -> ELIMINA TODOS LOS REGISTROS
DELETE FROM cocina_chilena;

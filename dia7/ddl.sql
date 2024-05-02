psql -U postgres

--Paso 1: Crear una base de datos
create database ddl2;
\c ddl2

create table demo (
    id serial primary key,
    nombre varchar not null,
    rut int not null unique
);

--Paso 2: Mostrar todas las tablas de una base de datos
\dt 

--Paso 3: Mostrar una tabla en específica.
\dt nombre_tabla;

--Paso 4: Eliminar una tabla de la base de datos.
ALTER TABLE demo ADD edad int;

select * from nextval('demo_id_seq');

insert into demo values(nextval('demo_id_seq'),'Camilo','987654321');

insert into demo values(nextval('demo_id_seq'),'Luis','87654321');
/*ERROR:  llave duplicada viola restricción de unicidad «demo_rut_key»
DETAIL:  Ya existe la llave (rut)=(987654321). EL RUT DEBE SER UNICO NO SE PUEDE RPEETIR SE DEBE MODIFICAR */

--Paso 5: Modificar un campo de una tabla.
drop table nombre_tabla;
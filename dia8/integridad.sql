--Paso 1: Creamos la tabla clientes
create table clientes (
    id integer unique not null, 
    name varchar(25) not null, 
    email varchar(50) DEFAULT '',
    monto int default 0
);

--Paso 2: Insertamos al menos 3 registros, todos sin ingresar el campo email.
insert into clientes(id, name) values (1, 'Nombre 1');
insert into clientes(id, name) values (2, 'Nombre 2');
insert into clientes(id, name) values (3, 'Nombre 3');
insert into clientes(id, name) values (4, 'Nombre 4');

select * from clientes;

--Paso 3: Modificamos el campo email a not null con alter table.
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;
-- ERROR:  column "email" of relation "clientes" contains null values

--Paso 4: Modificamos registros sin email
UPDATE clientes SET email = '' WHERE email is NULL;

--Paso 5:
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

--Paso 6: En la tabla clientes del ejercicio anterior, crearemos un campo fecha.
--Para esto, modifica la tabla y asigna la restricción
ALTER TABLE clientes ADD COLUMN fecha DATE NOT NULL DEFAULT now();

insert into clientes(id, name,email) values (4, 'Nombre 4','');

/*Paso 7: Agregamos un nuevo campo a la tabla de clientes pero los registros
que ya existen no tienen dicha fecha incorporada. Asignemos una fecha a esos
registros con COALESCE.
*/

-- COALESCE: Retorna el primer valor no nulo en una lista de argumentos

select COALESCE(email,'a@a.cl') from clientes;

-- agregar la columna direccion 
ALTER TABLE clientes ADD COLUMN direccion varchar(50);

select *, COALESCE(direccion,'Direccion nula') from clientes;

insert into clientes(id, name,email,direccion) values (5, 'Nombre 5','a@a.cl','direccion 5');

UPDATE clientes SET direccion = COALESCE(direccion,'Direccion nula') 
---WHERE direccion is NULL
;




-- Tabla Padre
CREATE TABLE autores (
    id INT,
    nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE libros (
    id INT,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

INSERT INTO autores (id, nombre)
VALUES
(1, 'Juan Pérez'),
(2, 'María García'),
(3, 'Pedro Rodríguez');

select * from autores;

INSERT INTO libros (id, titulo, autor_id)
VALUES
(1, 'El Quijote', 1),
(2, 'La Divina Comedia', 2),
(3, 'Hamlet', 3);

select * from libros;

--JOIN

SELECT * from 
autores aut
INNER JOIN libros lib
ON aut.id = lib.autor_id;

delete from autores where id = 3;
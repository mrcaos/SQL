-- PASO 1 CREAMOS LA BASE DE DATOS
create database bbdd_gimnasios;

-- PASO 2 NOS CONECTAMOS A LA BASE DE DATOS UNA VEZ YA CREADA
\c bbdd_gimnasios;

-- PASO 3 CREAR UNA TABLA / CREAR LA TABLA EN LA TERMINAL 
create table clientes(
    nombre varchar(50), 
    apellido varchar(50), 
    rut int,
    email varchar(50)
);

-- PASO 4    DESCRIBE LA TABLA DE CLINETES
\d clientes

--PASO 5 ESTABLECER 
alter table clientes add primary key(rut);

-- PASO 6 CREAR TABLA MATRICULAS
create table matricula(
    monto varchar(50),
    estado boolean,
    cliente_rut int references clientes(rut)
);

-- PASO 7
insert into clientes values ('Cliente 1', 'Apellido cliente 1','999999999', 'cliente1@email.com');
insert into clientes values ('Cliente 2', 'Apellido cliente 2','888888888', 'cliente2@email.com');
insert into clientes values ('Cliente 3', 'Apellido cliente 3','777777777', 'cliente3@email.com');
insert into clientes values ('Cliente 4', 'Apellido cliente 4','666666666', 'cliente4@email.com');
insert into clientes values ('Cliente 5', 'Apellido cliente 5','555555555', 'cliente5@email.com');

-- PASO 8
select * from clientes;

-- PASO 9
insert into matricula values ('40000', True, '999999999');
insert into matricula values ('40000', False, '888888888');
insert into matricula values ('55000', True, '555555555');
insert into matricula values ('35000', True, '777777777');
insert into matricula values ('60000', False, '666666666');

-- PASO 10 CONSULTANDO TODOS LOS REGISTROS DE TABLA MATRICULA
select * from matricula;

-- PASO 11 SQL JOINS
SELECT * 
FROM TABLAA A -- AQUELLA TABLA QUE TENGA LA PK
INNER JOIN TABLAB B -- LA TABLA QUE TIENE FK
ON A.key = B.key 

-- CLIENTES; MATRICULA
SELECT * 
FROM clientes cli 
INNER JOIN matricula mat 
ON cli.rut = mat.cliente_rut;

select clientes.email, clientes.rut, matricula.monto, matricula.estado
from clientes 
inner join matricula 
on clientes.rut = cliente_rut;

SELECT mat.cliente_rut as rut
FROM clientes cli 
INNER JOIN matricula mat 
ON cli.rut = mat.cliente_rut;

SELECT clientes.email, clientes.rut, matricula.monto, matricula.estado
FROM clientes 
INNER JOIN matricula 
ON clientes.rut = matricula.cliente_rut;
order by 3; ---- oder by matricula.monto

-- PASO 12 INSERSION PARA NUEVA MATRICULA DE MISMO CLIENTE
insert into matricula value ('784512', True, '77777777')

---PASO 13
select monto, count(monto)
from matricula 
group by monto 
having count(monto) >= 2;

select email, rut, monto, estado, count(matricula.*) 
from clientes
inner join matricula 
on clientes.rut = cliente_rut 
group by email, monto, rut, estado;
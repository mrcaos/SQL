psql -U postgres

create database datos_bancarios;

\l

\c datos_bancarios

create table clientes (
    id serial primary key,
    nombre varchar not null,
    apellido varchar not null,
    rut int not null unique,
    telefono int not null,
    email varchar not null unique
);

select * from clientes;

create table cuentas (
    id serial primary key,
    numero_cuenta varchar not null,
    fecha_creacion date not null,
    balance int not null default 0,
    cliente_id int not null,
    foreign key (cliente_id) references clientes(id)
);

select * from cuentas;
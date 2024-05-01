psql -U postgres

CREATE DATABASE desafio_Juan_Aguilera_999;

\l

\c desafio_Juan_Aguilera_999;

CREATE TABLE clientes (
    email varchar(50),
    nombre varchar,
    telefono varchar(16),
    empresa varchar(50),
    prioridad smallint
);

SELECT * FROM clientes;

INSERT INTO CLIENTES (email,nombre,telefono,empresa,prioridad)
VALUES
('1@1.com','uno','111','empresa_uno',1),
('2@2.com','dos','222','empresa_dos',2),
('3@3.com','tres','333','empresa_tres',3),
('4@4.com','cuatro','444','empresa_cuatro',4),
('5@5.com','cinco','555','empresa_cinco',5);

SELECT * FROM clientes;

SELECT * FROM clientes ORDER BY prioridad DESC LIMIT 3;

SELECT * FROM clientes WHERE prioridad <= 2;

--1. Creación de la tabla:
create table cuentas (
    numero_cuenta int not null unique primary key,
    balance float check(balance >= 0.00)
);
--2. Inserción de registros:
insert into cuentas (numero_cuenta, balance) values (1, 1000);
insert into cuentas (numero_cuenta, balance) values (2, 1000);
--3. Transacción controlada donde pasamos los $1000 de la cuenta 1 a la cuenta 2.
begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
--4. Confirmamos la transacción:
commit;

-- hoy
select * from cuentas;

\c transacciones;
BEGIN TRANSACTION;
UPDATE cuentas SET balance = balance + 1000 WHERE numero_cuenta = 2;
select * from cuentas;

UPDATE cuentas SET balance = balance - 1000 WHERE numero_cuenta = 1;
-- ERROR:  new row for relation "cuentas" violates check constraint "cuentas_balance_check"
-- DETAIL:  Failing row contains (1, -1000).

select * from cuentas;
--ERROR:  current transaction is aborted, commands ignored until end of transaction block

ROLLBACK;
select * from cuentas;

--Save point

/*Paso 4: Intentemos registrar una nueva cuenta de número 3 en nuestra tabla
“cuentas” con un saldo de $5000 y justo luego guardemos ese punto de la
transacción con un SAVEPOINT de nombre “nueva_cuenta”.
*/
BEGIN TRANSACTION;
INSERT INTO cuentas(numero_cuenta, balance) VALUES (4,5000);
SAVEPOINT nueva_cuenta;
/*Paso 5: Hasta este punto tenemos la transacción en curso y hemos fijado que
podríamos volver a este estado en cualquier circunstancia. Ahora, intentemos
transferir a esta nueva cuenta $3000 desde la cuenta 2. Para esto continua la
transacción de la siguiente manera.*/
UPDATE cuentas SET balance = balance + 3000 WHERE numero_cuenta = 4;
select * from cuentas;
UPDATE cuentas SET balance = balance - 3000 WHERE numero_cuenta = 2;
/*
ERROR:  new row for relation "cuentas" violates check constraint "cuentas_balance_check"
DETAIL:  Failing row contains (2, -1000).
*/
select * from cuentas;
-- Justo acá deberás recibir un error
ROLLBACK TO nueva_cuenta;
select * from cuentas;
COMMIT;
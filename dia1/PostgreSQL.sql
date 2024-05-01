-- selecciona todas las columnas y registros de la tabla demo
select  * from  demo;

-- selecciona todos registros de la tabla demo, pero solo muestra la columna name
select name,id from  demo;

-- Clausula Where -> condicional para las columnas, filtro de registros
select name from  demo WHERE name = 'test';

select * from  demo WHERE name = 'test';

-- where con and 
select * from  demo WHERE hint = '300';
select * from  demo WHERE hint = '300' and id = 4;-- no existe el registro que cumpla ambas condiciones

-- WHERE con OR
select * from  demo WHERE hint = '300' OR id = 7;

select * from  demo WHERE id = 2 OR id = 6;

-- LIMIT -> emtrega cantidad limitada, mostrando los primeros que cumplan la condicion
select * from  demo LIMIT 2;
select * from  demo WHERE id = 6 OR id = 2 LIMIT 1;

-- ORDER BY -> orden ascendente/alfabeticamente por default
select * from  demo ORDER BY name;
select * from  demo ORDER BY hint;

select * from  demo ORDER BY 2;
select name, hint from  demo ORDER BY 2;

-- DESC -> orden descendente
select * from  demo ORDER BY 1 DESC; --ASC


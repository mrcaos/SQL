--1. ¿Cuál es el promedio de ventas?
select * from ventas;
select *, (cantidad * precio_unitario) as venta from ventas;
select AVG(precio_unitario) from ventas; -- 227.0
select AVG(cantidad * precio_unitario) from ventas; -- 381

--2. ¿Cuál es el promedio de ventas por producto?
select * from ventas order by producto;
-- mostrar los datos unicos
select producto from ventas group by producto;
select producto,AVG(precio_unitario) from ventas group by producto;
select producto,AVG(cantidad * precio_unitario) from ventas group by producto;

--3. ¿Cuál es el promedio de ventas por producto después del '2024-01-05'?
select producto,AVG(precio_unitario) from ventas 
where fecha > '2024-01-05'
group by producto;

select producto,AVG(cantidad * precio_unitario) from ventas 
where fecha > '2024-01-05'
group by producto;
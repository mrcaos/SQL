-- subconsultas
select * from pedidos_detalle;
select * from productos;

select id_producto, count(id_producto) as cantidad
from pedidos_detalle 
where cantidad > 10
group by id_producto;

-- variante

select * 
from (
    select id_producto, count(id_producto) as cantidad
    from pedidos_detalle 
    group by id_producto
) as temporal 
where cantidad > 1 
;

select * from productos
where id_producto in
    (
        select id_producto
        from (
            select id_producto, count(id_producto) as cantidad
            from pedidos_detalle
            group by id_producto
        ) as temporal
        where cantidad > 1
    )
;

-- =====================================
-- REPORTE SQL - CHALLENGER SISTEMA VENTAS
-- =====================================

-- 1. Mostrar todos los clientes registrados
select *
from clientes;

-- 2. Mostrar todos los productos disponibles
select *
from productos;

-- 3. Mostrar todas las ventas realizadas
select *
from ventas;

-- 4. Mostrar solo nombre y email de clientes
select nombre, email
from clientes;

-- 5. Mostrar solo nombre y precio de productos
select nombre, precio
from productos;

-- 6. Productos con precio mayor a 50000
select *
from productos
where precio > 50000;

-- 7. Ventas realizadas el 2026-04-02
select *
from ventas
where fecha = '2026-04-02';

-- 8. Productos ordenados de mayor a menor precio
select *
from productos
order by precio desc;

-- 9. Clientes ordenados por nombre
select *
from clientes
order by nombre; 

-- 10. Detalles de venta con cantidad >= 2
select *
from detalle_venta
where cantidad >= 2;

-- 11. Total de clientes
select count(*)
from clientes;

-- 12. Total de productos
select count(*)
from productos;

-- 13. Total de ventas
select count(*)
from ventas;

-- 14. Precio promedio de productos
select avg(precio)
from productos;

-- 15. Suma total de precios de productos
select sum(precio)
from productos;

-- 16. Mostrar venta + nombre del cliente + fecha
select v.id_venta, c.nombre, v.fecha
from ventas v
join clientes c
on v.id_venta = c.id_cliente;


-- 17. Mostrar detalle de ventas con id_venta + nombre producto + cantidad
select d.id_venta, p.nombre, d.cantidad
from detalle_venta d
join productos p 
on d.id_producto = d.id_producto; 

-- 18. Mostrar nombre del cliente + id de venta + fecha
SELECT c.nombre, v.id_venta, v.fecha
FROM clientes c
JOIN ventas v
ON c.id_cliente = v.id_cliente;

-- 19. Mostrar nombre del producto + cantidad vendida + id de venta
select p.nombre, d.cantidad, d.id_venta
from productos p
join detalle_venta d
on p.id_producto = p.id_producto;

-- 20. Mostrar cuántas ventas ha realizado cada cliente
select c.nombre, count(*)
from clientes c
join ventas v 
on c.id_cliente = c.id_cliente
group by c.nombre;

-- 21. Mostrar solo los clientes con más de una venta
select c.nombre, count(*)
from clientes c
join ventas v 
on c.id_cliente = c.id_cliente
group by c.nombre
having count (*) > 1;

-- 22. Mostrar cuántas veces aparece cada producto en detalle_venta
SELECT p.nombre, COUNT(*)
FROM productos p
JOIN detalle_venta d
ON p.id_producto = d.id_producto
GROUP BY p.nombre;

-- 23. Mostrar solo los productos que aparecen más de una vez
SELECT p.nombre, COUNT(*)
FROM productos p
JOIN detalle_venta d
ON p.id_producto = d.id_producto
GROUP BY p.nombre
having count(*) > 1;

-- 24. Mostrar las ventas que tienen más de un producto asociado
select id_venta, count(*)
from detalle_venta
group by id_venta 
having count (*) > 1;

-- 25. Mostrar clientes cuya suma total de unidades compradas sea mayor a 2
select c.nombre,sum(d.cantidad)
from clientes c 
join ventas v 
on c.id_cliente = v.id_cliente
join detalle_venta d
on d.id_venta = d.id_venta
group by c.nombre 
having sum(d.cantidad ) > 2;

-- 26. Consulta trampa que no devuelva resultados
-- Explicar por qué el resultado vacío es correcto
select *
from productos
where precio < 0;

/*
No devuelve resultados porque la tabla productos
tiene la restricción CHECK (precio > 0),
por lo que no pueden existir precios negativos.
*/

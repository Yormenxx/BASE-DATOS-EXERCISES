#solve exercises ventas 1
-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por
-- la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido;

select * from pedido
order by fecha desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor
select * from pedido
order by total desc
limit 2;

-- 3.Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuen
-- ta que no debe mostrar identificadores que estén repetidos

select distinct c.id,p.total,p.fecha
from cliente c
join pedido p on c.id = p.id;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea
-- superior a 500€

select * from pedido
where YEAR(fecha) =2017  and total > 500;

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05
-- y 0.11.

select * from comercial;

select nombre, apellido1, apellido2,comision
from comercial
where comision between 0.05 and 0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

select max(comision)
from comercial;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es
-- NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

select * from cliente;

select *
from cliente
where (apellido1  is not null) and apellido2  is not null;
















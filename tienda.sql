DROP DATABASE IF EXISTS tienda;
use tienda;

 CREATE DATABASE tienda CHARACTER SET utf8mb4;
 USE tienda;
 
CREATE TABLE fabricante (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL
 );
 
 CREATE TABLE producto (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 precio DOUBLE NOT NULL,
 id_fabricante INT UNSIGNED NOT NULL,
 FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


-- Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;

-- Lista los nombres y los precios de todos los productos de la
-- tabla producto.
select nombre,precio from producto;

-- Lista todas las columnas de la tabla producto.
select * from producto;

/* 4. Lista el nombre de los productos, el precio en euros y el precio en
dólares estadounidenses (USD). */
select nombre, precio, (precio * 0.88) as precio_dolar
from producto;

/* 5. Lista los nombres y los precios de todos los productos de la
tabla producto, convirtiendo los nombres a mayúscula. */

select upper(nombre),precio 
from producto;

/* 6. Lista los nombres y los precios de todos los productos de la
tabla producto, convirtiendo los nombres a minúscula. */

select lower(nombre), precio
from producto;

/* 7. Lista el nombre de todos los fabricantes en una columna, y en otra
columna obtenga en mayúsculas los dos primeros caracteres del
nombre del fabricante. */


select nombre, upper(left(nombre,2)) as nombre_mayus
from fabricante;

/* 9. Lista los nombres y los precios de todos los productos de la
tabla producto, truncando el valor del precio para mostrarlo sin
ninguna cifra decimal. */

select * from producto;


select nombre, truncate(precio,0)
from producto;


drop view vista_fabri;
create view vista_fabri as
select id,nombre as fabricante
from fabricante;

create view vista_produ as
select id , nombre, precio
from producto
where precio >50;

select * from producto;
select COUNT(*) from producto;
select sum(precio) from producto;
select avg(precio) from producto;
select min(precio) from producto;
select max(precio) from producto;

select id_fabricante , sum(precio) from producto group by id_fabricante;
select id_fabricante, min(precio) from producto group by id_fabricante;
select id_fabricante, max(precio) from producto group by id_fabricante;


select * from producto;






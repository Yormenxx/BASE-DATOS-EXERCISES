CREATE DATABASE IF NOT EXISTS empresa1;
USE empresa1;

CREATE TABLE tblUsuarios (
   idx INT PRIMARY KEY AUTO_INCREMENT,
   usuario VARCHAR(20),
   nombre VARCHAR(20),
   sexo VARCHAR(1),
   nivel TINYINT,
   email VARCHAR(50),
   telefono VARCHAR(20),
   marca VARCHAR(20),
   compañia VARCHAR(20),
   saldo FLOAT,
   activo BOOLEAN
);

INSERT INTO tblUsuarios 
VALUES 
('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','SAMSUNG','IUSACELL','100','1'),
('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG','TELCEL','0','1'),
('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','NOKIA','MOVISTAR','150','1'),
('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','SAMSUNG','TELCEL','50','1'),
('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','NOKIA','IUSACELL','50','0'),
('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','SONY','UNEFON','100','1'),
('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACKBERRY','AXEL','0','1'),
('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG','IUSACELL','50','1'),
('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG','UNEFON','100','1'),
('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','SAMSUNG','TELCEL','500','1'),
('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','SONY','UNEFON','100','0'),
('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOTOROLA','IUSACELL','150','1'),
('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACKBERRY','AT&T','50','0'),
('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOTOROLA','NEXTEL','150','1'),
('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACKBERRY','IUSACELL','0','1'),
('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','SAMSUNG','AXEL','0','0'),
('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOTOROLA','MOVISTAR','500','1'),
('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','SONY','IUSACELL','200','1'),
('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACKBERRY','UNEFON','100','1'),
('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','SONY','UNEFON','150','1'),
('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOTOROLA','AT&T','500','1');

select * from tblUsuarios;

select MAX(saldo) as saldo_maximo
from tblUsuarios 
where sexo = 'M';

select nombre , telefono,marca 
from tblUsuarios 
where marca in('NOKIA''BLACKBERRY','SONY');


-- Contar los usuarios sin saldo o inactivos
select count(usuario)
from tblUsuarios 
where saldo<0 or activo = 0;

-- Listar el login de los usuarios con nivel 1,2,3

select usuario
from tblUsuarios 
where nivel in(1,2,3);

-- Listar los números de teléfono con saldo menor o igual a 300

select usuario,telefono 
from tblUsuarios 
where saldo <=300;

-- Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL

select sum(saldo)
from tblUsuarios 
where compañia = 'NEXTEL';

-- Contar el número de usuarios por compañía telefonia

select count(usuario) as total_usuario , compañia
from tblusuarios
group by compañia;

-- Contar el número de usuarios por nivel

select count(usuario) as total_usuario, nivel
from tblusuarios
group by nivel;

-- Listar el login de los usuarios con nivel 2

select * 
from tblusuarios
where nivel = 2;

-- Mostrar el email de los usuarios que usan gmail

select * 
from tblusuarios
where email like ('%gmail.com%');

-- Listar nombre y teléfono de los usuarios con teléfono LG, SAMSUNG o MOTOROLA

select nombre, telefono
from tblusuarios
where marca IN('LG','MOTOROLA','SAMSUNG');

-- Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG

select nombre, telefono,marca
from tblusuarios
where marca NOT IN('LG','SAMSUNG');


-- Mostrar el email de los usuarios que no usan yahoo

select email,usuario
from tblusuarios
where email not like('%yahoo.com%');


-- Listar las diferentes marcas de celular en orden alfabético descendentemente

select *
from tblusuarios
order by marca desc;

-- Calcular el saldo promedio de los usuarios que tienen teléfono marca LG

select avg(saldo) as saldo_prom
from tblusuarios
where marca = 'LG';

-- Listar el login de los usuarios con nivel 1 o 3

select * 
from tblusuarios
where nivel = 1 or nivel =  3;

-- Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACKBERRY

select nombre, telefono, marca 
from tblusuarios
where marca <> 'BLACKBERRY';






















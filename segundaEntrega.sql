create table comercio (
id_comercio int auto_increment primary key,
nombre_empleado varchar (20),
apellido_empleado varchar (20),
numero_documento int,
horario time,
sueldo numeric,
id_clientes int,
foreign key  (id_clientes) references clientes (id_clientes)
);

insert into comercio values
(1,'Yamila', 'Amin', 30123456, 08-00-00, 1000, 1),
(2, 'Matias', 'Cobos', 34123456, 08-00-00, 1000, 2),
(3, 'Jose', 'Perez', 31123456, 09-00-00, 1000, 5),
(4, 'Marta', 'Gomez', 40123456, 09-00-00, 2000, 3),
(5, 'Rita', 'Gonzalez', 20123456, 13-00-00, 2000, 4);

create table ropa (
id_numero_articulo int auto_increment primary key,
talle varchar (5),
marca varchar (30),
tipo_de_ropa varchar (30)
);

insert into ropa (precio) values (100);
insert into ropa values 
(1, 'L', 'Adidas', 'Pantalon', 100),
(2, 'XL', 'Nike', 'Remera'),
(3, 'M', 'Puma', 'Short'),
(4, 'S', 'Reebok', 'Musculosa'),
(5, 'XXL', 'Toper', 'Buzo');

-- UPDATE `proyecto_final`.`ropa` SET `precio` = '450' WHERE (`id_numero_articulo` = '3');

create table clientes (
id_clientes int auto_increment primary key,
nombre_cliente varchar (30),
apellido_cliente varchar (30),
telefono numeric,
id_numero_articulo int,
foreign key (id_numero_articulo) references ropa (id_numero_articulo)
); 

insert into clientes values 
(1, 'Estela', 'Lapalma', 1234567, 1),
(2, 'Marcelo', 'Acosta', 456789, 3),
(3, 'Alejandro', 'Abdala', 987654, 1),
(4, 'Augusto', 'Batalla', 765432, 4),
(5, 'Nestor', 'Ortigoza', 789765, 5);

create table facturas (
id_factura int auto_increment primary key,
id_numero_factura int,
id_clientes int,
id_numero_articulo int,
fecha date,
razon_social varchar (30),
foreign key (id_clientes) references clientes (id_clientes),
foreign key (id_numero_articulo) references ropa (id_numero_articulo)
);

insert into facturas values
(1, 30, 1, 1, '2023-09-12', 'Estela'),
(2, 31, 2, 3, '2023-09-11', 'Marcelo'),
(3, 32, 3, 1, '2023-09-10', 'Alejandro'),
(4, 33, 4, 4, '2023-09-24', 'Augusto'),
(5, 34, 5, 5, '2023-09-24', 'Nestor');

-- vista que trae el resumen de la factura, joinenando las tablas facturas, clientes y ropa
create view resumen_factura as
SELECT id_numero_factura, fecha, nombre_cliente, apellido_cliente, telefono, tipo_de_ropa, marca, talle, precio FROM facturas f
inner join clientes c on c.id_clientes = f.id_clientes
inner join ropa r on r.id_numero_articulo = f.id_numero_articulo;

select * from resumen_factura;

-- Funcion que calcula el total de una compra 
delimiter $$

create function total (cantidad int, precio int)
returns int
deterministic

begin

declare res int;

set res = cantidad * precio;

return res;
end;

delimiter;

delimiter $$

call total(2, 4)


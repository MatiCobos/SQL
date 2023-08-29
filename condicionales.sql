-- select id_system_user, first_name, email
-- from system_user;

-- select name
-- from game

-- pedir nombres pero descartar duplicados
-- select distinct first_name
-- from system_user

-- select * -- first_name, last_name, id_system_user
-- from system_user
-- where first_name = 'gillie'

-- comentarios desde 2019 en adelante
-- select * from commentary
-- where comment_date >= '2019-01-01'

-- comentarios anteriores a 2011
-- select * from commentary
-- where comment_date <= '2011-01-01'

-- comentarios solo de id game 73
-- select id_game, commentary
-- from commentary
-- where id_game = 73

-- comentarios que no sean id game 73
-- select id_game, commentary
-- from commentary
-- where id_game != 73

-- juegos de nivel 1
-- select name, id_level 
-- from game
-- where id_level = 1

-- juegos de nivel 14, 5 o 9
-- select name, id_level
-- from game
-- where id_level in (14,5,9)

-- juegos de nombre: riders republi, the dark pictures
-- select name
-- from game
-- where name in ('the dark pictures: house of ashes', 'riders republic')

-- juegos cuyos nombres empiecen con 'gran'
-- select name
-- from game
-- where name like 'gran%'

-- juegos que contenga 'field'
-- select name from game
-- where name like '%field%'

-- funciones de agragacion
-- muestra el maxino numero de id class
-- select max(id_class)
-- from game

/*select id_game, count(*)
from play
where 1=1
group by id_game
having count(*) >15
order by id_game
*/
-- Nombres que comienzan con j
select first_name from system_user
where first_name like 'j%';

-- Apellidos que contentan w
select last_name from system_user
where last_name like '%w%';

-- Que contenga la letra i en segundo lugar
select first_name from system_user
where first_name like '_i%';

-- Cuyo nombre finalicen con letra K
select first_name from system_user
where first_name like '%k';

-- Nombres que no tengan CH
select first_name from system_user
where first_name like '[^ch]%';

-- Nombre que contenga CH
select first_name from system_user
where first_name like '%ch%';

-- ejemplo de sub consulta sobre dos tablas
select * from system_user
where id_user_type = (select max(id_user_type)from user_type)
order by last_name desc;

-- ejemplo de sub consulta sobre una misma tabla
select id_system_user from vote
where value = (select truncate (avg (value),0)from vote);

-- ejemplo de sub consulta interna
select sum(value) from vote
where id_game = (select min(id_game) from game);

select * from play;
select * from game;

--

CREATE SCHEMA `nuestra_primera_base` ;

create table yamila (
id int not null auto_increment primary key, -- auto_increment incrementa los id automaticamente
nombre varchar (30), -- varchar es cantidad de caracteres que permito
fechaNac date, -- tipo de dato
socio char
);

desc yamila; -- ver que tiene la tabla

alter table yamila -- agregar campo de la tabla
add age int;

alter table yamila -- modificar campo de la tabla
modify nombre varchar(50) not null; -- sume cantidad de caracteres

alter table yamila -- cambio nombre de la tabla (ojo no recomendable)
rename to matias;

drop table yamila; -- borra la tabla entera (no usar, es destructivo)

truncate table yamila; -- borro todos los registros, pero deja la estructura armada

-- funciones escalares

select concat(first_name, ' ', last_name) as nombreYapellido from system_user; -- concatenar nombre y apellido
select ucase(concat (first_name, ' ', last_name )) from system_user; -- todo a mayuscula

select datediff(curdate(), '2023-08-01'); -- diferencia de dias entre hoy y el dia que le puse entre ''

select ucase(concat('matias', ' ', 'cobos')); -- concatene mi nombre y apellido y lo pase a  mayusculas
select (1988/0815); -- divide tu año y tus dias
select round(2,4393); -- redondea el resultado anterior
select datediff(curdate(), '1988-08-15'); -- dias entre hoy y mi fecha de nacimiento
select dayname('1988-08-15'); -- dia en que naci

create table GrupoAmigo(
idGrupo int,
descGrupo varchar (30),
primary key(idGrupo)
);

insert into GrupoAmigo -- insertar datos a la tabla
values
(1, 'Secundario'),
(2, 'Primario'),
(4, 'Oficina'),
(3, 'Facultad');

create table friend(
idFriend int NOT NULL,
first_name varchar (30) NOT NULL,
last_name varchar (30) default null,
idGrupo int not null,
primary key (idFriend),
foreign key (idGrupo) references GrupoAmigo (idGrupo)
);

insert into friend -- insertar datos a la tabla
values
(1, 'Pablo', 'Alvarez', 2),
(2, 'Andrea', 'Romero', 4),
(3, 'Javier', 'Torres', 1),
(4, 'Matias', 'Sanchez', 2),
(5, 'Merlina', 'Addams', 2);

-- Vistas
create view friend_v as
select *
from friend;

-- funciones
delimiter $$

create function suma (a int, b int, c int)
returns int
deterministic

begin

declare res int;

set res = a+b+c;

return res;
end;

delimiter;


CREATE SCHEMA `practica_clase` ;

create table comercio (
idEmpleado int not null auto_increment primary key, -- auto_increment incrementa los id automaticamente
nombre varchar (30), -- varchar es cantidad de caracteres que permito
apellido varchar (30), -- tipo de dato
numeroDoc char
);

create table ropa (
idRopa int not null auto_increment primary key, -- auto_increment incrementa los id automaticamente
talle varchar (30), -- varchar es cantidad de caracteres que permito
marca varchar (30), -- tipo de dato
numeroArt int
);

create table clientes(
idClient int NOT NULL auto_increment primary key,
first_name varchar (30),
last_name varchar (30) ,
phone char
);

create table facturas(
idFactura int NOT NULL auto_increment primary key,
fecha date NOT NULL,
razon_social varchar (30) default null
);

--

desc 

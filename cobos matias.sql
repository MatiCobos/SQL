create table comercio (
id_comercio int not null primary key, 
nombre_empleado varchar (30), 
apellido_empleado varchar (30), 
numero_doc varchar (20),
horario time,
sueldo char,
id_cliente int not null,

foreign key (id_cliente) references clientes (id_cliente)
);

create table ropa (
id_numeroArt int not null primary key, 
talle varchar (4), 
marca varchar (30),
tipo_de_ropa varchar (20)
);

create table clientes(
id_cliente int NOT NULL auto_increment primary key,
nombre_cliente varchar (30),
apellido_cliente varchar (30) ,
telefono varchar (20),
id_numeroArt int,

foreign key (id_numeroArt) references ropa (id_numeroArt)
);

create table facturas(
id_factura int NOT NULL auto_increment primary key,
id_numero int,
fecha date NOT NULL,
monto numeric,
tipo_de_ropa varchar (30),
razon_social varchar (30),
id_cliente int not null,
id_numeroArt int not null,

foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_numeroArt) references ropa (id_numeroArt)
);



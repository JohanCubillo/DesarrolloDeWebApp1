use AnayDis;

create table users(
IdUser int NOT NULL IDENTITY(1,1),
Username varchar(100)  not null,
IdRolUser int  not null,
Pass varchar(100)  not null,
Email varchar(100)  not null,
Ciudad varchar(100)  not null,
Edad int
PRIMARY KEY (IdUser)
)
create table rol(
IdRolUser int NOT NULL IDENTITY(1,1),
IdUser int,
RolName varchar(100) not null,
Statestatus varchar(100) not null,
PRIMARY KEY (IdRolUser), 
constraint FK_rol foreign key(IdUser) references users(IdUser),
)

create table infoSolicitudes(
IdSolicitud int NOT NULL IDENTITY(1,1),
IdUser int not null,
EstadoSoli varchar(100) not null,
Mensaje varchar(100) not null,
Monto varchar(100) not null,
PRIMARY KEY (IdSolicitud), 
constraint FK_users foreign key(IdUser) references users(IdUser),
)

create table solicitudes(
IdSolicitudes int NOT NULL IDENTITY(1,1),
IdSolicitud int,
IdUser int not null,
PRIMARY KEY (IdSolicitudes), 
constraint FK_IdSolicitud foreign key(IdSolicitud) references infoSolicitudes(IdSolicitud),
constraint FK_solicitudesuser foreign key(IdUser) references users(IdUser),
)



--Campos de usuarios
 insert into users (Username, IdRolUser, Pass,Email,Ciudad,Edad) VALUES ('johasal', 1, 'password', 'johan@prueba.com','Cariari',21); 
 insert into users (Username, IdRolUser, Pass,Email,Ciudad,Edad) VALUES ('mariosa', 1, 'password', 'mariosa@prueba.com','San Jose',41); 
 insert into users (Username, IdRolUser, Pass,Email,Ciudad,Edad) VALUES ('juanjo', 3, 'password', 'juanjo@prueba.com','Alajuela',34); 
 insert into users (Username, IdRolUser, Pass,Email,Ciudad,Edad) VALUES ('pablosa', 4, 'password', 'pablosa@prueba.com','San Jose',41); 
 insert into users (Username, IdRolUser, Pass,Email,Ciudad,Edad) VALUES ('martinja', 4, 'password', 'martinja@prueba.com','Alajuela',34);
 insert into users (Username, IdRolUser, Pass,Email,Ciudad,Edad) VALUES ('daniels', 4, 'password', 'daniels@prueba.com','Alajuela',30);
 

 --Campos de roles
 insert into rol(IdUser, RolName, Statestatus) VALUES (1,'Administrador de sistema', 'active'); 
 insert into rol(IdUser, RolName, Statestatus) VALUES (1,'Aprobador financiero', 'active'); 
 insert into rol(IdUser, RolName, Statestatus) VALUES (2,'Aprobador Jefe', 'active'); 
 insert into rol(IdUser, RolName, Statestatus) VALUES (3,'Usuario', 'active'); 
 insert into rol(IdUser, RolName, Statestatus) VALUES (4,'Usuario', 'active'); 
 insert into rol(IdUser, RolName, Statestatus) VALUES (6,'Usuario', 'pending'); 

 --Informacion de solicitud
  insert into infoSolicitudes(IdUser, EstadoSoli, Mensaje, Monto) VALUES (4,'Pending', 'Hola esta es una solicitud de ...', '100.000');
  insert into infoSolicitudes(IdUser, EstadoSoli, Mensaje, Monto) VALUES (3,'Pending', 'Hola esta es una solicitud de ...', '700.000'); 
  insert into infoSolicitudes(IdUser, EstadoSoli, Mensaje, Monto) VALUES (5,'Pending', 'Hola esta es una solicitud de ...', '3.000.000'); 

  -- Array de solicitudes
  insert into solicitudes (IdUser,IdSolicitud) VALUES (4,2);
  insert into solicitudes (IdUser,IdSolicitud) VALUES (2,2);
  


CREATE TABLE creador_de_contenido 
    ( id bigint NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre VARCHAR (350) , 
     Fecha_de_Alta DATETIME , 
     Fecha_de_Actualizacion DATETIME , 
     Empleados_ID INTEGER NOT NULL , 
     Tipos_de_Creadores_ID INTEGER NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de creador de contenido' , 'USER' , 'dbo' , 'TABLE' , 'Creador_de_Contenido' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Nombre del Creador de contenido' , 'USER' , 'dbo' , 'TABLE' , 'Creador_de_Contenido' , 'COLUMN' , 'Nombre' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Fecha en que se dio de alta el creador de contenido' , 'USER' , 'dbo' , 'TABLE' , 'Creador_de_Contenido' , 'COLUMN' , 'Fecha_de_Alta' go

ALTER TABLE Creador_de_Contenido ADD constraint creador_de_contenido_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE empleados 
    ( id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre VARCHAR (250) , 
     Fecha_de_Alta DATETIME , 
     Fecha_de_Actualizacion DATETIME 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador de Empleado unico' , 'USER' , 'dbo' , 'TABLE' , 'Empleados' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Fecha que se dio de alta al empleado' , 'USER' , 'dbo' , 'TABLE' , 'Empleados' , 'COLUMN' , 'Fecha_de_Alta' go

ALTER TABLE Empleados ADD constraint empleados_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE grupo_videos_usuario 
    ( id bigint NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre_de_Grupo VARCHAR (250) , 
     Descripcion_del_Grupo VARCHAR (Max) , 
     Fecha_de_Creacion DATETIME , 
     Fecha_Actualizacion_Grupo DATETIME , 
     Creador_de_Contenido_ID BIGINT NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de Grupo de Videos' , 'USER' , 'dbo' , 'TABLE' , 'Grupo_Videos_Usuario' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Nombre del grupo de videos' , 'USER' , 'dbo' , 'TABLE' , 'Grupo_Videos_Usuario' , 'COLUMN' , 'Nombre_de_Grupo' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Descripción del Grupo' , 'USER' , 'dbo' , 'TABLE' , 'Grupo_Videos_Usuario' , 'COLUMN' , 'Descripcion_del_Grupo' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Fecha y Hora de Creacion del video' , 'USER' , 'dbo' , 'TABLE' , 'Grupo_Videos_Usuario' , 'COLUMN' , 'Fecha_de_Creacion' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Fecha y Hora en que se actualizo el grupo' , 'USER' , 'dbo' , 'TABLE' , 'Grupo_Videos_Usuario' , 'COLUMN' , 'Fecha_Actualizacion_Grupo' go

ALTER TABLE Grupo_Videos_Usuario ADD constraint grupo_videos_usuario_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE promocion 
    ( id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre VARCHAR (250) , 
     Descripcion VARCHAR (Max) , 
     Tipo_de_Descuento VARCHAR , 
     Monto_Descuento DECIMAL (28) , 
     Codigo_Descuento VARCHAR , 
     Empleados_ID INTEGER NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unido de promoción' , 'USER' , 'dbo' , 'TABLE' , 'Promocion' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Tipo de promocion:
1.- Descuento del total
2.- Porcentaje
3.- etc.' , 'USER' , 'dbo' , 'TABLE' , 'Promocion' , 'COLUMN' , 'Tipo_de_Descuento' go

ALTER TABLE Promocion ADD constraint promocion_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE subscripcion_por_usuario (
    subscripciones_id       INTEGER NOT NULL,
    usuarios_id             INTEGER NOT NULL,
    total_de_subscripcion   DECIMAL(28),
    fecha_de_inicio         datetime,
    fecha_de_termino        datetime,
    fecha_de_alta           datetime,
    estatus                 varchar,
    promocion_id            INTEGER NOT NULL
)

go 



EXEC sp_addextendedproperty 'MS_Description' , 'Estatus de la subscripcion' , 'USER' , 'dbo' , 'TABLE' , 'Subscripcion_por_Usuario' , 'COLUMN' , 'Estatus' go

ALTER TABLE Subscripcion_por_Usuario ADD constraint subscripcion_por_usuario_pk PRIMARY KEY CLUSTERED (Promocion_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE subscripciones 
    ( id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre_Subscripcion VARCHAR (500) , 
     Descripcion VARCHAR (max) , 
     Costo DECIMAL (28) , 
     Fecha_de_Alta DATETIME , 
     Fecha_de_Actualizacion DATETIME , 
     Empleados_ID INTEGER NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificafor Unico de subcripciones' , 'USER' , 'dbo' , 'TABLE' , 'Subscripciones' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Costo de Subscripcion' , 'USER' , 'dbo' , 'TABLE' , 'Subscripciones' , 'COLUMN' , 'Costo' go

ALTER TABLE Subscripciones ADD constraint subscripciones_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE tipos_de_creadores 
    ( id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Tipo_de_Creador VARCHAR (250) , 
     Fecha_de_Alta DATETIME , 
     Fecha_de_Actualizacion DATETIME , 
     Empleados_ID INTEGER NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador de tipos de creadores' , 'USER' , 'dbo' , 'TABLE' , 'Tipos_de_Creadores' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Catalogo de Creadores' , 'USER' , 'dbo' , 'TABLE' , 'Tipos_de_Creadores' , 'COLUMN' , 'Tipo_de_Creador' go

ALTER TABLE Tipos_de_Creadores ADD constraint tipos_de_creadores_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE usuarios 
    ( id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre VARCHAR (250) NOT NULL , 
     Correo_Electronico VARCHAR (250) , 
     Servicio_de_Autenticacion INTEGER NOT NULL , 
     Seudonimo VARCHAR (250) , 
     Fecha_de_Alta DATETIME NOT NULL , 
     Estatus VARCHAR , 
     Fecha_de_Actualización DATETIME 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de usuario, valor auto incremental' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Nombre de Usuario, nombre de Pila.' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Nombre' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Correo Electronico de Usuario' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Correo_Electronico' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Catalago de Servicio que usa el usuario para ingresar a la plataformo:

1.- Propio
2.- Google 
3.- Facebook
4.- Ninguno
5.- Otro' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Servicio_de_Autenticacion' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Nombre que utiliza el usuario para darse a conocer dentro de la plataforma' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Seudonimo' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esto nos dira cuando el usuario se dio de alta con respecto a UTC' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Fecha_de_Alta' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Estatus del Usuario:
Por definir
Ex:
Activo
Inactivo
etc.' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Estatus' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Fecha en que el usuario actualizo sus datos' , 'USER' , 'dbo' , 'TABLE' , 'Usuarios' , 'COLUMN' , 'Fecha_de_Actualización' go

ALTER TABLE Usuarios ADD constraint usuarios_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

CREATE TABLE videos 
    ( id bigint NOT NULL IDENTITY NOT FOR REPLICATION , 
     Nombre_Video VARCHAR (350) , 
     Fecha_de_Creacion DATETIME , 
     Tag_de_Clasificacion UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    , 
     Tipo_de_Video VARCHAR (250) , 
     Grupo_Videos_Usuario_ID BIGINT NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de video' , 'USER' , 'dbo' , 'TABLE' , 'Videos' , 'COLUMN' , 'ID' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Nombre que el usuario le asigno al video' , 'USER' , 'dbo' , 'TABLE' , 'Videos' , 'COLUMN' , 'Nombre_Video' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Fecha y hora en que el usuario creo el video' , 'USER' , 'dbo' , 'TABLE' , 'Videos' , 'COLUMN' , 'Fecha_de_Creacion' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Tipo de Video' , 'USER' , 'dbo' , 'TABLE' , 'Videos' , 'COLUMN' , 'Tipo_de_Video' go

ALTER TABLE Videos ADD constraint videos_pk PRIMARY KEY CLUSTERED (ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON ) go

ALTER TABLE Creador_de_Contenido
    ADD CONSTRAINT creador_de_contenido_empleados_fk FOREIGN KEY ( empleados_id )
        REFERENCES empleados ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Creador_de_Contenido
    ADD CONSTRAINT creador_de_contenido_tipos_de_creadores_fk FOREIGN KEY ( tipos_de_creadores_id )
        REFERENCES tipos_de_creadores ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Grupo_Videos_Usuario
    ADD CONSTRAINT grupo_videos_usuario_creador_de_contenido_fk FOREIGN KEY ( creador_de_contenido_id )
        REFERENCES creador_de_contenido ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Promocion
    ADD CONSTRAINT promocion_empleados_fk FOREIGN KEY ( empleados_id )
        REFERENCES empleados ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Subscripcion_por_Usuario
    ADD CONSTRAINT subscripcion_por_usuario_promocion_fk FOREIGN KEY ( promocion_id )
        REFERENCES promocion ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Subscripcion_por_Usuario
    ADD CONSTRAINT subscripcion_por_usuario_subscripciones_fk FOREIGN KEY ( subscripciones_id )
        REFERENCES subscripciones ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Subscripcion_por_Usuario
    ADD CONSTRAINT subscripcion_por_usuario_usuarios_fk FOREIGN KEY ( usuarios_id )
        REFERENCES usuarios ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Subscripciones
    ADD CONSTRAINT subscripciones_empleados_fk FOREIGN KEY ( empleados_id )
        REFERENCES empleados ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Tipos_de_Creadores
    ADD CONSTRAINT tipos_de_creadores_empleados_fk FOREIGN KEY ( empleados_id )
        REFERENCES empleados ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE Videos
    ADD CONSTRAINT videos_grupo_videos_usuario_fk FOREIGN KEY ( grupo_videos_usuario_id )
        REFERENCES grupo_videos_usuario ( id )
ON DELETE NO ACTION 
    ON UPDATE no action go
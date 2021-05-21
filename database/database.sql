DROP DATABASE IF EXISTS tienda_master;
CREATE DATABASE tienda_master;
USE tienda_master;

DROP TABLE IF EXISTS lineas_pedidos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios(
    id          int(255) auto_increment not null,
    nombre      varchar(100) not null,
    apellidos   varchar(255),
    email       varchar(255) not null,
    password    varchar(255) not null,
    rol         varchar(20),
    imagen      varchar(255),
    CONSTRAINT pk_usuarios PRIMARY KEY(id),
    CONSTRAINT uq_email UNIQUE(email)

)Engine=InnoDB;

INSERT INTO usuarios VALUES(DEFAULT, 'Admin',"","admin@admin.com","contraseña","admin","");


CREATE TABLE categorias(
    id          int(255) auto_increment not null,
    nombre      varchar(100) not null,
    CONSTRAINT pk_categorias PRIMARY KEY(id)
    
)Engine=InnoDB;

INSERT INTO categorias VALUES(DEFAULT,"Manga corta");
INSERT INTO categorias VALUES(DEFAULT,"Tirantes");
INSERT INTO categorias VALUES(DEFAULT,"Manga larga");
INSERT INTO categorias VALUES(DEFAULT,"Sudadera");

CREATE TABLE productos(
    id              int(255) auto_increment not null,
    categoria_id    int(255) not null,
    nombre          varchar(100) not null,
    descripcion     text,
    precio          float(100,2) not null,
    stock           int(255) not null,
    oferta          varchar(2),
    fecha           date not null,
    imagen          varchar(255),
    CONSTRAINT pk_categorias PRIMARY KEY(id),
    CONSTRAINT fk_producto_categoria FOREIGN KEY(categoria_id) REFERENCES categorias(id)

)Engine=InnoDB;

CREATE TABLE pedidos(
    id              int(255) auto_increment not null,
    usuario_id      int(255) not null,
    provincia       varchar(255) not null,
    localidad       varchar(100) not null,
    direccion       varchar(255) not null,
    coste      float(200,2) not null,
    estado          varchar(20) not null,
    fecha           date,
    hora            time,
    CONSTRAINT pk_pedidos PRIMARY KEY(id),
    CONSTRAINT fk_pedido_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id)

)Engine=InnoDB;

CREATE TABLE lineas_pedidos(
    id              int(255) auto_increment not null,
    pedido_id       int(255) not null,
    producto_id     int(255) not null,
    unidades        int(255) not null
    CONSTRAINT pk_lineas_pedidos PRIMARY KEY(id),
    CONSTRAINT fk_linea_pedido FOREIGN KEY(pedido_id) REFERENCES pedidos(id),
    CONSTRAINT fk_linea_producto FOREIGN KEY(producto_id) REFERENCES productos(id)

)Engine=InnoDB;
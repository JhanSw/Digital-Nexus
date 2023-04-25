-- Crear la base de datos
CREATE DATABASE tienda_tecnologia;

-- Seleccionar la base de datos
USE tienda_tecnologia;

-- Crear la tabla de clientes
CREATE TABLE clientes (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  contrasena VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

-- Crear la tabla de administradores
CREATE TABLE administradores (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  contrasena VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

-- Crear la tabla de productos
CREATE TABLE productos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(500) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  imagen VARCHAR(100) NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id)
);

-- Crear la tabla de pedidos
CREATE TABLE pedidos (
  id INT NOT NULL AUTO_INCREMENT,
  fecha TIMESTAMP NOT NULL,
  estado VARCHAR(50) NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Crear la tabla de detalles de pedidos
CREATE TABLE detalles_pedidos (
  id INT NOT NULL AUTO_INCREMENT,
  cantidad INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  pedido_id INT NOT NULL,
  producto_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Crear la tabla de inventario
CREATE TABLE inventario (
  id INT NOT NULL AUTO_INCREMENT,
  fecha DATE NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  ganancias DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

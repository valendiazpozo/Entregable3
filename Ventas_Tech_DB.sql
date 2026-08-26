/*Sos el DBA de TechStore, una cadena de tiendas de tecnología. Tu tarea es crear la base de datos Ventas_Tech_DB con un modelo relacional correcto que soporte las operaciones de ventas del negocio.*/
/*Crear Base de Datos y posicionarse*/
CREATE DATABASE Ventas_Tech_DB;
GO
USE Ventas_Tech_DB;
GO
/*Drop Tables */
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
GO
/*Categorías*/
CREATE TABLE dbo.DimCategoria (
id_categoria INT PRIMARY KEY,
Nombre_categoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(200)
);

CREATE TABLE dbo.DimClientes (
id_cliente INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Ciudad VARCHAR(50),
Fecha_registro DATE NOT NULL
);

CREATE TABLE dbo.DimProductos (
id_producto INT PRIMARY KEY,
Nombre_producto VARCHAR(100) NOT NULL,
id_categoria INT FOREIGN KEY References dbo.DimCategoria(id_categoria),
Precio DECIMAL(10,2) NOT NULL,
Stock INT DEFAULT 0,
activo TINYINT
);

CREATE TABLE dbo.Ventas (
id_venta INT PRIMARY KEY,
id_cliente INT FOREIGN KEY References dbo.DimClientes(id_cliente),
id_producto INT FOREIGN KEY References dbo.DimProductos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
fecha_venta DATE NOT NULL
);

GO
/* INSERT DATA*/
INSERT INTO Dbo.DimCategoria VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO Dbo.DimCategoria VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO Dbo.DimCategoria VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO Dbo.DimCategoria VALUES (4, 'Almacenamiento', 'Discos y memorias');
INSERT INTO Dbo.DimClientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO Dbo.DimClientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO Dbo.DimClientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO Dbo.DimClientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO Dbo.DimClientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');
INSERT INTO Dbo.DimProductos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO Dbo.DimProductos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO Dbo.DimProductos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO Dbo.DimProductos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO Dbo.DimProductos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO Dbo.DimProductos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);
INSERT INTO Dbo.Ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO Dbo.Ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO Dbo.Ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO Dbo.Ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO Dbo.Ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO Dbo.Ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO Dbo.Ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO Dbo.Ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO Dbo.Ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO Dbo.Ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

GO

/*Verificar Integridad*/
SELECT * FROM dbo.DimCategoria;
SELECT * FROM dbo.DimClientes;
SELECT * FROM dbo.DimProductos;
SELECT * FROM dbo.Ventas;

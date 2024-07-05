--Trabajo sumativo semana 7

--Se crea nombre de base de datos
create database Prestamo

--Se referencia la base datos a utilizar
use Prestamo

--Se crea la tabla pelicula
CREATE TABLE pelicula(
codigo numeric unique not null,
titulo varchar(35),
nacionalidad varchar(50),
productora varchar(50),
fechaEstreno date,
codDirector numeric,
codCategoria numeric
);

--Se crea la tabla director
CREATE TABLE director(
codDirector numeric unique not null,
nombre varchar(35),
apellidos varchar(50)
);

--Se crea la tabla categoría
CREATE TABLE categoria(
codCategoria numeric unique not null,
nombre varchar(35)
);

--Se crea la tabla cliente
CREATE TABLE cliente(
codCliente numeric unique not null,
nombre varchar(20),
dirección varchar(50),
teléfono varchar(7)
);

--Se crea la tabla pago
CREATE TABLE pago(
codPago numeric unique not null,
codCliente numeric not null,
fechaPago date,
monto numeric
);

--Se crea la tabla reproduce
CREATE TABLE reproduce(
codReproduce numeric unique not null,
fechaCom date,
fechaTer date,
codCliente numeric not null,
codPelicula numeric not null
);

--Creacion de claves primarias
ALTER TABLE cliente
ADD CONSTRAINT PK_cliente PRIMARY KEY (codCliente)

ALTER TABLE pelicula
ADD CONSTRAINT PK_pelicula PRIMARY KEY (codigo)

ALTER TABLE director
ADD CONSTRAINT PK_director PRIMARY KEY (codDirector)

ALTER TABLE categoria
ADD CONSTRAINT PK_categoria PRIMARY KEY (codCategoria)

ALTER TABLE pago
ADD CONSTRAINT PK_pago PRIMARY KEY (codPago)

ALTER TABLE reproduce
ADD CONSTRAINT PK_reproduce PRIMARY KEY (codReproduce)

--Creacion de llaves foraneas
ALTER TABLE pelicula
ADD FOREIGN KEY (codDirector) REFERENCES director (codDirector)

ALTER TABLE pelicula
ADD FOREIGN KEY (codCategoria) REFERENCES categoria (codCategoria)

ALTER TABLE pago
ADD FOREIGN KEY (codCliente) REFERENCES cliente (codCliente)

ALTER TABLE reproduce
ADD FOREIGN KEY (codCliente) REFERENCES cliente (codCliente)

ALTER TABLE reproduce
ADD FOREIGN KEY (codPelicula) REFERENCES pelicula (codigo)

--Se insertan datos en tabla director
  INSERT INTO director (codDirector, nombre, apellidos)
  VALUES (9, 'Francis', 'Coppola'),
  (11, 'Ridley', 'Scott'),
  (12, 'Quentin', 'Tarantino'),
  (10, 'Michael', 'Curtiz'),
  (17, 'Steven', 'Spielberg'),
  (13, 'Orson', 'Welles'),
  (5, 'Peter', 'Jackson'),
  (20, 'Katsushiro', 'Otomo');

--Se insertan datos en tabla categoria
INSERT INTO categoria (codCategoria, nombre)
VALUES (2, 'Crimen'),
(10, 'Ciencia Ficcion'),
(14, 'Crimen'),
(8, 'Drama'),
(4, 'Romance'),
(12, 'Fantasia'),
(6, 'Drama'),
(16, 'Drama');

--Se insertan datos en tabla cliente
INSERT INTO cliente (codCliente, nombre, dirección, teléfono)
VALUES (1, 'Pedro', 'Buin 356', '434-326'),
(2, 'Jose', 'Maipu 1820', '422-566'),
(3, 'Manuel', 'Av Corrientes 1255', '412-735'),
(4, 'Maria', 'Virreyes 680', '403-332'),
(5, 'Leonel', 'Av Leonidas 4292', '464-716'),
(6, 'Daniela', 'Belgrano', '490-366'),
(7, 'Mirtha', 'Egaña 3250', '425-824'),
(8, 'Martin', 'San Miguel 136', '411-513');

--Se insertan datos en tabla pago
INSERT INTO pago (codPago, codCliente, fechaPago, monto)
VALUES (110, 1, '2024-03-22', 3000),
(120, 2, '2024-05-08', 1500),
(130, 3, '2022-07-15', 4200),
(140, 4, '2000-10-28', 2600),
(150, 5, '2011-05-14', 3000),
(160, 6, '1998-03-17', 1800),
(170, 7, '2000-09-11', 4100),
(180, 8, '2008-06-15', 2500);

--Se insertan datos en tabla pelicula
INSERT INTO pelicula (codigo, titulo, nacionalidad, productora, fechaEstreno, codDirector, codCategoria)
VALUES (1233, 'El padrino', 'Italia', 'Paramounts Pictures', '1972-02-11', 9, 2),
(1244, 'Blade Runner', 'Estados Unidos', 'Warnes Bros.', '1982-05-14', 11, 10),
(1255, 'Pulp Fiction', 'Estados Unidos', 'Miramax Films', '1994-11-02', 12, 14),
(1266, 'Ciudadano Kane', 'Estados Unidos', 'RKO Radio Pictures', '1941-07-23', 13, 8),
(1277, 'Casablanca', 'Estados Unidos', 'Warner Bros.', '1942-09-16', 10, 4),
(1288, 'El Señor de los Anillos', 'Nueva Zelanda', 'New Line Cinema', '2003-04-19', 5, 12),
(1299, 'La Lista de Schindler', 'Estados Unidos', 'Universal Pictures', '1993-01-29', 17, 6),
(1310, 'Akira', 'Japon', 'Tokyo Movie Shinsha', '1988-12-03', 20, 16);

--Se insertan datos en tabla reproduce
INSERT INTO reproduce (codReproduce, fechaCom, fechaTer, codCliente, codPelicula)
VALUES (222, '2024-02-11', '2024-02-14', 1, 1288),
(333, '2024-04-03', '2024-04-04', 5, 1244),
(444, '2024-06-21', '2024-06-28', 3, 1310),
(555, '2024-02-15', '2024-02-17', 7, 1266),
(666, '2024-01-09', '2024-01-13', 2, 1299),
(777, '2024-12-03', '2024-12-06', 6, 1233),
(888, '2024-03-07', '2024-03-11', 4, 1277),
(999, '2024-09-04', '2024-09-12', 8, 1255);

--Se crea una copia de respaldo de la base de datos creada 'Prestamo'
backup database Prestamo
to disk = 'C:\Backup\Respaldo.bak'

--Para restaurar una copia de seguridad de forma manual: 1) nos dirigimos a la BD, boton izquierdo del mouse (opcion task), 2) luego restore y database 3) elegimos la ubicacion, modo full o parcial y ok
--Se crea restauracion de base de datos 'Prestamo' con codigo, previamente eliminando la base de datos
drop database Prestamo go
restore database Prestamo file = 'Prestamo' from disk = 'C:\Backup\Respaldo.bak'

--Se muestran todas las peliculas ordenadas por titulo
select titulo from pelicula order by titulo

--Se muestran todas peliculas que su nombre comience con E
select titulo from pelicula where titulo like 'E%'

--Se muestran todos los codigos de las peliculas que terminan con R
select codigo, titulo from pelicula where titulo like '%R'

--Se muestran los 3 primeros directores
select distinct top 3 nombre, apellidos from director order by nombre

--Se muestran las 3 ultimas categorias
select distinct top 3 codCategoria, titulo from pelicula order by codCategoria desc

--Se cuentan las peliculas por categorias
select nombre, count(*) as cantidadPeliculas from categoria group by nombre order by cantidadPeliculas desc
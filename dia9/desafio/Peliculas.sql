CREATE DATABASE Peliculas;

CREATE TABLE peliculas ( id INT PRIMARY KEY, titulo VARCHAR, año_estreno INT, director VARCHAR );

CREATE TABLE reparto ( pelicula_id INT, actor VARCHAR, FOREIGN KEY (pelicula_id) REFERENCES peliculas(id) );

truncate peliculas;
select *from reparto;

copy peliculas from 'C:/python/M5_BASE_DATOS/dia9/desafio/peliculas.csv' delimiter ',' csv header;
copy reparto from 'C:/python/M5_BASE_DATOS/dia9/desafio/reparto.csv' delimiter ',' csv header;

select * from peliculas;
select *from reparto;

SELECT id FROM peliculas WHERE titulo = 'Titanic';

SELECT Actor FROM reparto WHERE pelicula_id = ( SELECT id FROM peliculas WHERE titulo = 'Titanic');

SELECT COUNT(*) AS total_peliculas FROM reparto JOIN peliculas ON reparto.pelicula_id = peliculas.id WHERE reparto.actor = 'Harrison Ford';

SELECT titulo FROM peliculas WHERE "año_estreno" BETWEEN 1990 AND 1999 ORDER BY titulo ASC;

SELECT titulo, LENGTH(titulo) AS longitud_titulo FROM peliculas;

SELECT MAX(LENGTH(titulo)) AS longitud_mas_grande FROM peliculas;
CREATE TABLE peliculas(
id SERIAL PRIMARY KEY,
nombre varchar,
anno integer
);

CREATE TABLE tags(
id SERIAL PRIMARY KEY,
tag varchar(32)
);

CREATE TABLE pelicula_tag(
id SERIAL PRIMARY KEY,
pelicula_id int,
tag_id int,
FOREIGN KEY (pelicula_id) REFERENCES peliculas(id),
FOREIGN KEY (tag_id) REFERENCES tags(id)
);


--Inserta 5 películas y 5 tags, 
INSERT INTO peliculas (nombre,anno) VALUES ('EL JOVEN MANOS DE TIJERA',1997); 
INSERT INTO peliculas (nombre,anno) VALUES ('EL SEÑOR DE LOS ANILLOS',2001); 
INSERT INTO peliculas (nombre,anno) VALUES ('TITANIC',1997); 
INSERT INTO peliculas (nombre,anno) VALUES ('LO QUE EL VIENTO SE LLEVO',1960); 
INSERT INTO peliculas (nombre,anno) VALUES ('MATRIX',2000); 

INSERT INTO tags (tag) VALUES ('Drama'); 
INSERT INTO tags (tag) VALUES ('Aventura'); 
INSERT INTO tags (tag) VALUES ('Romance'); 
INSERT INTO tags (tag) VALUES ('Accion'); 
INSERT INTO tags (tag) VALUES ('Fantasia'); 

--la primera película tiene que tener 3 tags asociados, 
INSERT INTO pelicula_tag (pelicula_id,tag_id) VALUES (1,1);
INSERT INTO pelicula_tag (pelicula_id,tag_id) VALUES (1,3);
INSERT INTO pelicula_tag (pelicula_id,tag_id) VALUES (1,5);

--la segunda película debe tener dos tags asociados.
INSERT INTO pelicula_tag (pelicula_id,tag_id) VALUES (2,2);
INSERT INTO pelicula_tag (pelicula_id,tag_id) VALUES (2,5);


--Cuenta la cantidad de tags que tiene cada película. 
--Si una película no tiene tags debe mostrar 0.
SELECT * 
FROM peliculas p
inner join pelicula_tag pt
on p.id = pt.pelicula_id;

SELECT * 
FROM peliculas p
LEFT join pelicula_tag pt
on p.id = pt.pelicula_id;

--rpt
SELECT p.nombre, count(pt.pelicula_id) as cantidad_tag
FROM peliculas p
LEFT join pelicula_tag pt
on p.id = pt.pelicula_id
GROUP BY p.nombre
ORDER BY 2 DESC;

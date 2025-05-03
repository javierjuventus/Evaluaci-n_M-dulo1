-- Parte A: Lenguaje DDL (10 puntos)
-- 1.- Escribe el comando SQL para crear la tabla anterior. (5 pts)
USE escuela;

CREATE TABLE alumnos2 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  edad INT,
  promedio DECIMAL(4,2),
  genero CHAR(1),
  fecha_ingreso DATE
);
-- 2.- Agrega una restricción para que el promedio no pueda ser menor a 6. (5 pts)
CREATE TABLE alumnos2 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  edad INT,
  promedio DECIMAL(4,2) CHECK (promedio >= 6),
  genero CHAR(1),
  fecha_ingreso DATE
);

-- Parte B: Inserción y actualización (20 puntos)
-- 3.- Inserta tres alumnos con datos reales. (10 pts)
INSERT INTO alumnos2 (nombre, edad, promedio, genero, fecha_ingreso)
VALUES ('Javier Hernández', 20, 8.50, 'F', '2024-08-15');

INSERT INTO alumnos2 (nombre, edad, promedio, genero, fecha_ingreso)
VALUES ('Juan Hernández', 22, 7.30, 'M', '2023-09-10');

INSERT INTO alumnos2 (nombre, edad, promedio, genero, fecha_ingreso)
VALUES ('Lucía Hernández', 19, 9.10, 'F', '2025-01-20');

-- 4.- Actualiza el promedio de un alumno a 9.5. (10 pts)
UPDATE alumnos2
SET promedio = 5
WHERE nombre = 'Lucía Hernández';


-- Parte C: Consultas básicas (30 puntos)
-- 5.- Muestra todos los alumnos. (5 pts)
SELECT * FROM alumnos2;

-- Muestra solo los nombres de las alumnas. (5 pts)
SELECT nombre
FROM alumnos2
WHERE genero = 'F';

-- 7.- Muestra los alumnos con promedio mayor a 8. (5 pts
SELECT nombre, promedio
FROM alumnos2
WHERE promedio > 8;

-- 8.- Muestra los alumnos ordenados por fecha de ingreso. (5 pts)
SELECT nombre, fecha_ingreso
FROM alumnos2
ORDER BY fecha_ingreso;

-- 9.- Muestra el nombre y promedio con alias. (5 pts)
SELECT nombre AS 'Nombre del Alumno', promedio AS 'Promedio Final'
FROM alumnos2;

-- 10.- Busca alumnos cuyo nombre comience con "A". (5 pts)
SELECT nombre
FROM alumnos2
WHERE nombre LIKE 'A%';

-- Parte D: Funciones y operadores (20 puntos)
-- 11.- Cantidad total de alumnos. (5 pts)
SELECT COUNT(*) AS 'Cantidad Total de Alumnos'
FROM alumnos2;

-- 12.- Promedio general. (5 pts)
SELECT AVG(promedio) AS 'Promedio General'
FROM alumnos2;

--  13.-Alumno con menor promedio. (5 pts)
SELECT nombre, promedio
FROM alumnos2
WHERE promedio = (SELECT MIN(promedio) FROM alumnos2);

-- 14.- Alumnos que ingresaron este año. (5 pts)
SELECT nombre, fecha_ingreso
FROM alumnos2
WHERE YEAR(fecha_ingreso) = YEAR(CURDATE());




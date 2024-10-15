create database escuela;

use escuela;


CREATE TABLE estudiantes(

id int PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
apellidos VARCHAR(50),
fecha_nacimiento DATE,
direccion TEXT,
telefono VARCHAR(20),
grado INT
);

CREATE TABLE profesor(
id_profesor INT primary key auto_increment,
nombre VARCHAR(60),
apellido VARCHAR(60),
materia VARCHAR(30),
experiencia INT
);


-- Tabla cursos
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    nivel VARCHAR(20),
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);

-- Tabla calificaciones
CREATE TABLE calificaciones (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT,
    id_curso INT,
    calificacion DECIMAL(4,2),
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla aulas
CREATE TABLE aulas (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    numero_aula VARCHAR(10),
    capacidad INT
);

-- Tabla materias
CREATE TABLE materias (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    nivel VARCHAR(20)
);



-- Insertamos 20 registros aleatorios en la tabla estudiantes
INSERT INTO estudiantes (nombre, apellidos, fecha_nacimiento, direccion, telefono, grado)
SELECT 
    CONCAT(SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1),
            SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1)),
    CONCAT(SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1),
            SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1)),
    DATE_FORMAT(DATE_ADD('2000-01-01', INTERVAL FLOOR(RAND() * 18) YEAR), '%Y-%m-%d'),
    CONCAT('Calle ', FLOOR(RAND() * 100) + 1, ', Ciudad Ejemplo'),
    CONCAT('123', FLOOR(RAND() * 89999999)),
    FLOOR(RAND() * 12) + 1
FROM 
    (SELECT 1) AS x
CROSS JOIN
    (SELECT 1) AS y
LIMIT 20;

-- Insertamos 20 registros aleatorios en la tabla profesores
INSERT INTO profesores (nombre, apellido, materia, experiencia)
SELECT 
    CONCAT(SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1),
            SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1)),
    CONCAT(SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1),
            SUBSTRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ', FLOOR(RAND() * 26) + 1, 1)),
    'Materia ' || FLOOR(RAND() * 10) + 1,
    FLOOR(RAND() * 20) + 1
FROM 
    (SELECT 1) AS x
CROSS JOIN
    (SELECT 1) AS y
LIMIT 20;

-- ... y así sucesivamente para las demás tablas


select * from estudiantes;




DROP DATABASE IF EXISTS DB_Examen;
CREATE DATABASE DB_Examen;
USE DB_Examen;

-- 1. Tabla DEPARTAMENTOS
CREATE TABLE Departamentos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50)
);

-- 2. Tabla EMPLEADOS (Incluye reflexiva id_jefe)
CREATE TABLE Empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    puesto VARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_alta DATE,
    id_departamento INT,
    id_jefe INT, -- Clave foránea a sí misma
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id),
    FOREIGN KEY (id_jefe) REFERENCES Empleados(id)
);

-- 3. Tabla MENTORIAS (Reflexiva con Tabla Nueva - N:M)
-- Sirve para relacionar empleados con múltiples mentores
CREATE TABLE Mentorias (
    id_alumno INT,
    id_mentor INT,
    tema VARCHAR(50),
    PRIMARY KEY (id_alumno, id_mentor),
    FOREIGN KEY (id_alumno) REFERENCES Empleados(id),
    FOREIGN KEY (id_mentor) REFERENCES Empleados(id)
);

-- INSERCIÓN DE DATOS --

-- Departamentos
INSERT INTO Departamentos VALUES 
(1, 'Desarrollo', 'Madrid'),
(2, 'Ventas', 'Barcelona'),
(3, 'Recursos Humanos', 'Madrid'),
(4, 'Innovación', 'Valencia'); -- Dept vacío para probar LEFT JOINs

-- Empleados
-- Estructura: El ID 1 es el JEFAZO (Jefe NULL). El 2 y 3 son Jefes intermedios.
INSERT INTO Empleados VALUES
(1, 'Sofia', 'CEO', 9000.00, '2010-01-01', 1, NULL),       -- Jefa Suprema
(2, 'Carlos', 'Jefe Desarrollo', 5000.00, '2012-05-20', 1, 1),
(3, 'Elena', 'Jefa Ventas', 4800.00, '2013-03-15', 2, 1),
(4, 'David', 'Senior Dev', 3500.00, '2015-02-10', 1, 2),
(5, 'Ana', 'Junior Dev', 1800.00, '2022-08-01', 1, 2),     -- Cobra poco
(6, 'Luis', 'Becario Dev', 900.00, '2023-01-01', 1, 4),    -- Su jefe es David
(7, 'Maria', 'Comercial', 2500.00, '2018-11-11', 2, 3),
(8, 'Jorge', 'Comercial', 2400.00, '2019-06-23', 2, 3),
(9, 'Lucia', 'Recruiter', 2000.00, '2020-01-10', 3, 1);    -- Reporta a Sofia

-- Mentorias (Ana tiene dos mentores: David y Carlos)
INSERT INTO Mentorias VALUES
(5, 2, 'Liderazgo'), -- Ana aprende de Carlos
(5, 4, 'Java'),      -- Ana aprende de David
(6, 4, 'SQL'),       -- Luis aprende de David
(2, 1, 'Gestión');   -- Carlos aprende de Sofia
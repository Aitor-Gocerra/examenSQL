/* Muestra los nombres de los Departamentos en los que NO 
trabaja nadie actualmente. Pista: Busca los departamentos 
cuyo ID no esté en la lista de departamentos de la tabla Empleados. */

SELECT Departamentos.nombre
FROM Departamentos
WHERE id NOT IN (
    SELECT DISTINCT id_departamento
    FROM Empleados
    WHERE id_departamento IS NOT NULL
);



-- A. COUNT(*) : Cuenta TODO (filas totales de la tabla)
-- Resultado: 9 (todos los empleados)
SELECT COUNT(*) AS total_fichas 
FROM Empleados;

-- B. COUNT(campo) : Cuenta valores NO NULOS
-- Resultado: 8 (El CEO tiene id_jefe NULL, así que no se cuenta)
SELECT COUNT(id_jefe) AS empleados_con_jefe 
FROM Empleados;

-- C. COUNT(DISTINCT campo) : Cuenta valores ÚNICOS
-- Resultado: 3 (Aunque hay muchos empleados, solo hay 3 departamentos activos en la tabla empleados: 1, 2 y 3)
SELECT COUNT(DISTINCT id_departamento) AS departamentos_activos
FROM Empleados;

-- D. MAX / MIN con FECHAS
-- Resultado: La fecha más antigua (el empleado más veterano)
SELECT MIN(fecha_alta) AS fecha_mas_antigua 
FROM Empleados;
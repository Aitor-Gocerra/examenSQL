/* Muestra el nombre, salario y departamento de los empleados que ganan más 
que el salario promedio DE SU PROPIO DEPARTAMENTO. 
(Pista: La subconsulta debe conectarse con la tabla de fuera). */

SELECT
FROM Empleados
WHERE salario > (
    SELECT AVG(Empleados.salario)
    FROM Empleados
    WHERE Empleados -- Como comparo aqui?¿
)
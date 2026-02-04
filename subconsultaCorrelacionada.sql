/* Muestra el nombre, salario y departamento de los empleados que ganan más 
que el salario promedio DE SU PROPIO DEPARTAMENTO. 
(Pista: La subconsulta debe conectarse con la tabla de fuera). */

SELECT nombre, salario
FROM Empleados AS Emple1
WHERE salario > (
    SELECT AVG(Emple2.salario)
    FROM Empleados AS Emple2
    WHERE Emple1.id_departamento = Emple2.id_departamento
);
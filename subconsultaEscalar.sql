/* Muestra el nombre, puesto y salario de los empleados que ganan más que 
el salario promedio de TODOS los empleados de la empresa. */

SELECT Empleados.nombre, Empleados.puesto, Empleados.salario
FROM Empleados
WHERE salario > (
    SELECT AVG(Empleados.salario),
    FROM Empleados;
);

--  No entiendo porque esta consulta me da error

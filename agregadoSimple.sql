/* Muestra el nombre del departamento y el salario promedio de sus empleados.
Solo muestra aquellos departamentos donde el salario promedio sea mayor a
2000. Ordenalos de mayor a menor */

SELECT Departamentos.nombre, AVG(empleados.salario) as promedio
FROM Departamentos
INNER JOIN Empleados ON Empleados.id_departamento = Departamentos.id
GROUP BY Departamentos.nombre
HAVING AVG(empleados.salario) > 2000
ORDER BY promedio DESC;


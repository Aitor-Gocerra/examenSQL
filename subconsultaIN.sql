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

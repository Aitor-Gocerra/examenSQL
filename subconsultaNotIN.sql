/* Muestra los nombres de los empleados que NO están 
asignados a ningún proyecto actualmente. */

SELECT nombre
FROM Empleados
WHERE id NOT IN (
    SELECT id_empleado
    FROM Asignaciones
)
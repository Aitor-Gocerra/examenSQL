/* Muestra los nombres de los proyectos que tienen más de 2 empleados asignados 
y cuyo presupuesto sea superior A 20.000. */

SELECT P.nombre
FROM Proyectos P
JOIN Asignaciones A ON P.id = A.id_proyecto
WHERE P.presupuesto > 20000    
GROUP BY P.id, P.nombre
HAVING COUNT(A.id_empleado) > 2; 

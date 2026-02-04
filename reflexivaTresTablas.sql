/* Listado de supervisión: 
Muestra el nombre del Jefe, el nombre de su Subordinado y 
el nombre del Proyecto en el que trabaja ese subordinado. */

SELECT J.nombre AS Jefe, E.nombre AS Empleado, P.nombre
FROM Empleados E
LEFT JOIN Empleados J ON E.id_jefe = J.id
INNER JOIN Asignaciones A ON A.id_empleado = E.id
INNER JOIN Proyectos P ON P.id = A.id_proyecto

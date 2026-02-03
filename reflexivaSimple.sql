/* Obtén una lista con el nombre del empleado y el nombre de su jefe. 
IMPORTANTE: Deben aparecer TODOS los empleados, incluido el CEO 
(que no tiene jefe, debe salir NULL o vacío). */

SELECT empleado.nombre as Jefe, jefe.nombre as Empleado
FROM Empleados as empleado
LEFT JOIN Empleados as jefe ON empleado.id = jefe.id_jefe;
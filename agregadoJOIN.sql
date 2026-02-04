/* Queremos saber qué proyectos están consumiendo más recursos humanos. 
Muestra el nombre del proyecto y la suma total de horas dedicadas por todos los empleados. 
Ordena de mayor a menor horas. */

SELECT P.nombre, A.horas_totales
FROM Proyectos P
INNER JOIN Asignaciones A ON P.id = A.id_proyecto
INNER JOIN Empleados E ON E.id = A.id_empleado


-- Consulta final

SELECT P.nombre, SUM(horas_totales)
FROM Asignaciones A
INNER JOIN Proyectos P ON A.id_proyecto = P.id
INNER JOIN Empleados E ON E.id = A.id_empleado
GROUP BY P.id
HAVING SUM(horas_totales)
ORDER BY horas_totales DESC
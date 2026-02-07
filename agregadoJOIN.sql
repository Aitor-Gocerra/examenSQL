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


/* "Departamentos de Ventas Fuertes" 
Muestra el nombre de los departamentos que tienen más de un empleado 
cuyo puesto sea exactamente 'Comercial'. */

SELECT Departamentos.nombre, COUNT(E.id) as num_comerciales
FROM Departamentos
INNER JOIN Empleados E ON E.id_departamento = Departamentos.id
WHERE E.puesto = 'Comercial'
GROUP BY Departamentos.nombre
HAVING COUNT(e.id) > 1;

/* "Proyectos Multidisciplinares" 
Muestra el nombre de los proyectos en los que colaboran empleados 
de al menos 2 departamentos diferentes. */


SELECT P.nombre, D.nombre
FROM Proyectos P
INNER JOIN Asignaciones A ON A.id_proyecto = P.id
INNER JOIN Empleados E ON E.id = A.id_empleado
INNER JOIN Departamentos D ON D.id = E.id_departamento
GROUP BY P.id, P.nombre
HAVING COUNT(DISTINCT E.id) >= 2


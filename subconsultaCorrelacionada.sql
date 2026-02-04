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

/* Queremos detectar a los "trabajadores estrella". 
Muestra el nombre del empleado, el nombre del proyecto y las horas dedicadas, 
PERO solo para aquellos empleados que han dedicado más horas que el promedio de horas de 
ESE mismo proyecto. */

SELECT E.nombre, P.nombre, A.horas_totales
FROM Asignaciones A
INNER JOIN Proyectos P ON P.id = A.id_proyecto
INNER JOIN Empleados E ON E.id = A.id_empleado
WHERE horas_totales > (
    SELECT AVG(AE.horas_totales)
    FROM Asignaciones AE
    WHERE AE.id_proyecto = A.id_proyecto
)

/* "Proyectos Baratos para su categoría" 
Muestra el nombre, estado y presupuesto de los proyectos que 
tienen un presupuesto inferior al promedio de los proyectos de su mismo estado. 
Pista: Si el proyecto es 'Activo', compáralo solo con la media de los 'Activos'. */

SELECT P.nombre, P.estado, P.presupuesto
FROM Proyectos P
WHERE P.presupuesto < (
    SELECT AVG(PE.presupuesto)
    FROM Proyectos PE
    WHERE PE.estado = P.estado
)


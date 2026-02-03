/* Queremos ver las mentorías. 
Muestra el nombre del alumno, el nombre del mentor y 
el tema que están estudiando. */

SELECT Empleados.nombre AS Estudiante, Empleados.nombre AS Mentor, Estudiante.tema
FROM Mentorias AS Estudiante
INNER JOIN Mentorias AS Mentor ON Estudiante.id_alumno = Mentor.id_mentor
INNER JOIN Empleados ON Empleados.id = Estudiante.id_alumno;

-- Esta consulta me arroja una sola fila...


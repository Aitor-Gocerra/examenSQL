/* Queremos ver las mentorías. 
Muestra el nombre del alumno, el nombre del mentor y 
el tema que están estudiando. */

SELECT Alumno.nombre AS Estudiante, Mentor.nombre AS Mentor, Mentorias.tema
FROM Mentorias AS Mentorias
INNER JOIN Empleados AS Alumno ON Mentorias.id_alumno = Alumno.id
INNER JOIN Empleados AS Mentor ON Mentorias.id_mentor = Mentor.id;

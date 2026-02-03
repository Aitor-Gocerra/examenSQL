/* Muestra el nombre de los empleados que tienen al menos 
un alumno a su cargo en las mentorías. */

SELECT 
FROM Empleados
WHERE EXISTS (
    SELECT *
    FROM Mentorias
    WHERE Mentorias.id_mentor = Empleados.id
);
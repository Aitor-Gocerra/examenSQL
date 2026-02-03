/* La empresa quiere saber la variedad de perfiles. 
¿Cuántos puestos de trabajo distintos existen en la tabla de empleados? 
(No quiero saber cuántos empleados hay, sino cuántos tipos de cargos 
existen). */

SELECT COUNT(puesto) as Total_puestos
FROM Empleados;

SELECT COUNT(DISTINCT puesto) as Total_puestos
FROM Empleados;
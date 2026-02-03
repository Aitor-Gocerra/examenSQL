/* Muestra el nombre de cada empleado, su salario, 
y en una tercera columna muestra la diferencia entre su salario 
y el salario máximo de toda la empresa. */

SELECT nombre, salario, (SELECT MAX(salario) FROM Empleados) - salario AS diferencia
FROM Empleados;

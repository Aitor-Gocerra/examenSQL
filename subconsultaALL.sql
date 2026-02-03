/* Muestra el nombre y salario de los empleados que ganan más que TODOS 
los empleados del departamento de 'Ventas' (id=2). 
Pista: Es decir, tu sueldo tiene que superar al 
sueldo más alto de Ventas. */

SELECT Empleados.nombre, Empleados.salario
FROM Empleados
WHERE salario > ALL (
    SELECT salario
    FROM empleados
    WHERE id_departamento = 2
);
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

/* Muestra el nombre y presupuesto de los proyectos que tienen un presupuesto 
MAYOR que TODOS los proyectos que ya están 'Finalizado'. */

SELECT P.nombre, P.presupuesto
FROM Proyectos P 
WHERE presupuesto > ALL (
    SELECT PF.presupuesto
    FROM Proyectos PF 
    WHERE PF.estado = 'Finalizado'
)
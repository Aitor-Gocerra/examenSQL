**GUÍA DEFINITIVA: SQL AVANZADO (Agregados, Subconsultas y Reflexivas)**

**1. FUNCIONES DE AGREGADO (Ampliación)**

Las funciones de agregado condensan muchas filas en un solo valor.
Recuerda: **Los NULL suelen ser ignorados**, excepto en COUNT(\*).

  -----------------------------------------------------------------------
  **Función**           **Qué hace**         **Truco de Examen / Nuance**
  --------------------- -------------------- ----------------------------
  COUNT(\*)             Cuenta **filas       Cuenta nulos también.
                        totales**.           

  COUNT(campo)          Cuenta filas donde   Ignora los NULL.
                        campo tiene valor.   

  **COUNT(DISTINCT      **(NUEVO)** Cuenta   Si tienes 100 empleados pero
  campo)**              valores **únicos**.  solo 3 puestos distintos,
                                             devuelve 3.

  SUM / AVG             Suma / Promedio.     Solo numéricos. Ignoran
                                             NULL.

  MAX / MIN             Máximo / Mínimo.     Funcionan con números,
                                             fechas y texto (A-Z).
  -----------------------------------------------------------------------

**2. SUBCONSULTAS: Teoría y Reglas (Según tu PDF)**

**Definición:** Una consulta que aparece dentro de otra consulta. Van
siempre **entre paréntesis**.

**A. ¿Dónde se ponen?**

1.  **En el WHERE o HAVING:** Actúan como un filtro. Sustituyen al
    operando de la derecha en una comparación.

2.  **En el SELECT:** Actúan como una columna calculada (ej. (SELECT
    MAX(salario)\...)).

3.  **En el FROM:** Actúan como una \"tabla temporal\" (aunque esto es
    menos común en exámenes básicos).

**B. Reglas de Oro**

-   Una subconsulta solo puede devolver **una columna** (a menos que
    sustituya a una tabla entera).

-   **Visibilidad:** La subconsulta puede \"ver\" las columnas de la
    consulta principal (consulta externa), pero la principal no puede
    ver las de dentro.

-   **Anidación:** Puedes meter una subconsulta dentro de otra. El
    estándar SQL no pone límite, pero afecta al rendimiento (se vuelve
    lento).

**3. OPERADORES DE SUBCONSULTAS (Lo Nuevo)**

Aquí es donde se decide la nota del examen. Dependiendo de si la
subconsulta devuelve un solo valor o una lista, usas unos u otros.

**Caso 1: La subconsulta devuelve UN SOLO valor**

Usas los operadores relacionales clásicos: =, \>, \<, \>=, \<=, \<\>.

-   *Ejemplo:* WHERE salario \> (SELECT AVG(salario)\...)

**Caso 2: La subconsulta devuelve UNA LISTA de valores**

Aquí no puedes usar un simple =, necesitas \"ayudantes\":

A. Operadores ANY (o SOME) y ALL

Se combinan con los comparadores (\> ALL, \< ANY, etc.).

  --------------------------------------------------------------------------
  **Operador**   **Significado**      **Traducción Mental**
  -------------- -------------------- --------------------------------------
  **\> ANY**     Mayor que **alguno** ¿Soy más rico que **al menos una**
                 de la lista.         persona de ese grupo? (Equivale a \>
                                      MIN).

  **= ANY**      Igual a **alguno**   Es exactamente lo mismo que usar IN.
                 de la lista.         

  **\> ALL**     Mayor que **todos**  ¿Soy más rico que **absolutamente
                 los de la lista.     todos** en ese grupo? (Equivale a \>
                                      MAX).

  **\< ALL**     Menor que **todos**. Soy más pobre que el más pobre del
                                      grupo.
  --------------------------------------------------------------------------

**B. Operador IN y NOT IN**

-   **IN**: Devuelve TRUE si el valor coincide con **uno** de los
    valores de la lista.

-   **NOT IN**: Cuidado con los NULL. Si la subconsulta devuelve un
    NULL, NOT IN a veces falla y no devuelve nada (dependiendo del
    gestor). *Consejo: Filtra nulos dentro de la subconsulta.*

**Caso 3: Comprobación de Existencia (EXISTS)**

-   **EXISTS**: Comprueba si la subconsulta produce **alguna fila**.

-   No devuelve datos, devuelve TRUE o FALSE. Si no devuelve filas, es
    FALSE.

-   Se usa casi exclusivamente con **Subconsultas Correlacionadas**.

**4. ESTRATEGIA: GROUP BY vs HAVING**

El error número 1 en los exámenes es confundir cuándo filtrar.

1.  **Fase 1: WHERE (Filtro individual)**

    -   Filtra filas **antes** de que se formen los grupos.

    -   *Ej:* \"No tengas en cuenta a los Becarios\".

2.  **Fase 2: GROUP BY (Agrupación)**

    -   Crea los \"cubos\" o categorías.

3.  **Fase 3: HAVING (Filtro grupal)**

    -   Filtra los grupos **ya formados**. Siempre lleva una función de
        agregado (SUM, COUNT, AVG).

    -   *Ej:* \"Solo departamentos con promedio \> 1000\".

**5. CONSULTAS REFLEXIVAS (Self-Joins)**

Es unir una tabla consigo misma.

-   **Clave:** Usar **ALIAS** (Empleados AS e1, Empleados AS e2) para
    diferenciarlas.

-   **Tipo Jerárquico (Jefe-Empleado):**

    -   Usa LEFT JOIN si quieres que salga el \"Jefazo\" (el que tiene
        jefe NULL).

    -   Condición: e1.id_jefe = e2.id.

-   **Tipo Combinatorio (Todos con todos):**

    -   Condición: e1.id \<\> e2.id (para no compararse consigo mismo).

**Resumen Rápido para leer en la puerta del examen:**

1.  ¿Te piden contar **tipos** de cosas? -\> COUNT(DISTINCT campo).

2.  ¿Te piden comparar con **\"cualquiera\"** de un grupo? -\> ANY.

3.  ¿Te piden comparar con **\"todos\"** los de un grupo? -\> ALL.

4.  ¿Te piden verificar si **hay relación** sin importar el dato? -\>
    EXISTS.

5.  ¿Filtro por promedio o suma? -\> HAVING.

6.  ¿Filtro por atributo normal (ciudad, nombre)? -\> WHERE.

-- a)
SELECT m.nombre AS Mascota,
       e.especie AS Especie,
       r.raza AS Raza
       -- se selecciona las columnas de nombre, especie y raza de la tabla mascota y se las renombra
FROM mascota m
JOIN raza r ON m.id_raza = r.id_raza -- basados en los id de las tablas razas y mascota se busca el nombre de la mascota su especie y raza
JOIN especie e ON r.id_dominio = e.id_dominio
              AND r.id_reino = e.id_reino
              AND r.id_filo = e.id_filo
              AND r.id_clase = e.id_clase
              AND r.id_orden = e.id_orden
              AND r.id_familia = e.id_familia
              AND r.id_genero = e.id_genero
              AND r.id_especie = e.id_especie;
-- como especie esta formado por pk compuestas se tiene que relacionar todos los campos 
-- b)
SELECT e.especie AS Especie, -- se selecciona el campo de especie de la tabla Especie
       COUNT(m.id_mascota) AS Cantidad_Mascotas -- se cuenta la cant de ids que hay en la tabla mascotas
FROM mascota m
JOIN raza r ON m.id_raza = r.id_raza -- se relacionan los ids de mascota con los id de raza
JOIN especie e ON r.id_dominio = e.id_dominio -- se relaciona los id de raza con todos los pk compuyestos de especie
              AND r.id_reino = e.id_reino
              AND r.id_filo = e.id_filo
              AND r.id_clase = e.id_clase
              AND r.id_orden = e.id_orden
              AND r.id_familia = e.id_familia
              AND r.id_genero = e.id_genero
              AND r.id_especie = e.id_especie
GROUP BY e.especie; -- se agrupa por especies

-- c)
SELECT r.raza AS Raza, -- se selecciona la column raza de la tabla raza 
       COUNT(m.id_mascota) AS Cantidad_Mascotas -- se cuenta la cant de ids que hay en la tabla mascota
FROM mascota m 
JOIN raza r ON m.id_raza = r.id_raza
GROUP BY r.raza; -- se agrupa por razas para mostrar la cant qu ehay
-- d)
SELECT m.nombre AS Mascota, -- se seleciona la columna nombre de la tabla mascotas
       COUNT(c.id_consulta) AS Cantidad_Visitas -- se cuenta 
FROM mascota m
LEFT JOIN consulta c ON m.id_mascota = c.id_mascota
GROUP BY m.nombre;
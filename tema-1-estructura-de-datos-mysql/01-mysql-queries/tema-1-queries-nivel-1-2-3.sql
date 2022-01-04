-- TIENDA CONSULTAS --
-- 01
SELECT nombre FROM producto;

-- 02
SELECT nombre, precio FROM producto;

-- 03
SELECT * FROM producto;

-- 03 BIS > CORREGIDO
show columns from producto;

-- 04
SELECT nombre, precio, (precio * 1.13) FROM producto;

-- 05 > CORREGIDO
SELECT nombre as 'nombre de producto', precio as euros, (precio * 1.13) as 'dólares estadounidenses' FROM producto;

-- 06
SELECT UPPER(nombre), precio FROM producto;

-- 07
SELECT LOWER(nombre), precio FROM producto;

-- 08
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;

-- 09
SELECT nombre, ROUND(precio) FROM producto;

-- 10
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- 11
SELECT fabricante.codigo FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 12
SELECT fabricante.codigo FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.codigo;

-- 12 BIS > CORREGIDO
SELECT fabricante.codigo FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo GROUP BY fabricante.codigo;

-- 13
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 13
SELECT nombre FROM fabricante ORDER BY nombre;

-- 14
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15
SELECT nombre, precio FROM tienda.producto ORDER BY nombre ASC, precio DESC;

-- 16
SELECT * FROM fabricante LIMIT 5;

-- 17
SELECT * FROM fabricante LIMIT 3, 2;

-- 18
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;

-- 23
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ORDER BY producto.precio ASC LIMIT 1;

-- 25
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ORDER BY producto.precio DESC LIMIT 1;

-- 26
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';

-- 27
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 28
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 29
SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');

-- 31
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');

-- 32
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

-- 33
SELECT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34
SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34 BIS > CORREGIDO
SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante

-- 35
SELECT fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo != producto.codigo_fabricante WHERE NOT fabricante.codigo = ANY (SELECT producto.codigo_fabricante FROM producto) GROUP BY fabricante.nombre;

-- 36
SELECT * FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo');

-- 37
SELECT * FROM producto WHERE producto.precio = (SELECT max(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo'));

-- 38
SELECT producto.nombre FROM producto WHERE producto.precio = (SELECT max(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo'));

-- 39
SELECT producto.nombre FROM producto WHERE producto.precio = (SELECT min(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Hewlett-Packard'));

-- 40
SELECT * FROM producto WHERE producto.precio >= (SELECT max(producto.precio) FROM producto WHERE producto.codigo_fabricante = (SELECT fabricante.codigo FROM fabricante WHERE fabricante.nombre = 'Lenovo'));

-- 41
SELECT * FROM producto, fabricante WHERE fabricante.nombre = 'Asus' AND producto.codigo_fabricante = fabricante.codigo AND producto.precio > (SELECT AVG(producto.precio) FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Asus');

---------------------

-- UNIVERSIDAD CONSULTAS --
-- PARTE 1
-- 01
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 02
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

-- 03
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- 03 BIS > CORREGIDO
YEAR

-- 04
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 05
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 06
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1 ASC, apellido2 ASC, persona.nombre ASC;

-- 07
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin, persona.nif FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE nif = '26902806M';

-- 08
SELECT departamento.nombre, asignatura.id_profesor, grado.nombre FROM grado INNER JOIN asignatura ON grado.id = asignatura.id_grado INNER JOIN profesor ON asignatura.id_profesor = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)' GROUP BY departamento.nombre, asignatura.id_profesor, grado.nombre;

-- 08 BIS > CORREGIDO
SELECT departamento.nombre, asignatura.id_profesor FROM asignatura INNER JOIN profesor ON asignatura.id_profesor = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id WHERE asignatura.id_grado = 4 GROUP BY id_profesor

-- 09
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 and curso_escolar.anyo_fin = 2019 GROUP BY persona.nombre;


-- PARTE 2 --
-- 01
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 02
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' and profesor.id_departamento is null ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

-- 03
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento is null;

-- 04
SELECT profesor.id_profesor, persona.nombre, persona.apellido1, persona.apellido2 FROM profesor LEFT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor is null;

-- 05
SELECT * FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor is null;

-- 06
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE  asignatura.id_profesor is null GROUP BY departamento.nombre;


-- CONSULTAS RESUMEN --
-- 01
SELECT COUNT(persona.nombre) FROM persona WHERE tipo = 'alumno';

-- 02
SELECT COUNT(persona.fecha_nacimiento) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- 03
SELECT d.nombre, count(pr.id_departamento) as numero_profesores_por_departamento FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY numero_profesores_por_departamento DESC;

-- 04
SELECT departamento.nombre, count(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;

-- 05
SELECT g.nombre, count(a.id) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY count(a.id) DESC;

-- 06
SELECT g.nombre, count(a.id) FROM asignatura a LEFT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre HAVING count(a.id) > 40;

-- 07
SELECT g.nombre, a.tipo, sum(a.creditos) FROM asignatura a LEFT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre;

-- 07 BIS > CORREGIDA
SELECT g.nombre, a.tipo, sum(a.creditos) FROM asignatura a LEFT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre, a.tipo

-- 08
SELECT curso_escolar.anyo_inicio, count(alumno_se_matricula_asignatura.id_alumno) FROM alumno_se_matricula_asignatura LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.anyo_inicio;

-- 09
SELECT COUNT(asignatura.id_profesor) AS numero_asignaturas, persona.id, persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN asignatura ON  persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY numero_asignaturas DESC;

-- 10
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;

-- 11
SELECT p.nombre, p.apellido1, p.apellido2, p.tipo, d.nombre, a.nombre AS nombre_asignatura FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = 'profesor' and a.id_profesor is null;

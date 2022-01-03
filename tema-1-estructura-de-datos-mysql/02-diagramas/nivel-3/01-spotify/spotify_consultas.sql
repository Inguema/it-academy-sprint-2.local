-- Consultas Prueba Spotify --
-- 01
select * from usuarios

-- 02
select  nombre from usuarios inner join usuarios_tipo on usuarios.id_usuarios_tipo = usuarios_tipo.id

-- 03
select  nombre from usuarios inner join usuarios_tipo on usuarios.id_usuarios_tipo = usuarios_tipo.id where usuarios_tipo.tipo = 'Premium'

-- 04
select  nombre_artista from artistas inner join usuarios_artistas on artistas.id = usuarios_artistas.id_artista inner join usuarios on usuarios_artistas.id_usuario = usuarios.id

-- 05
select  nombre_artista from artistas inner join usuarios_artistas on artistas.id = usuarios_artistas.id_artista inner join usuarios on usuarios_artistas.id_usuario = usuarios.id where usuarios.nombre = 'Alberto'

-- 06
select  titulo from canciones inner join usuarios_favoritas on canciones.id = usuarios_favoritas.id_cancion inner join usuarios on usuarios_favoritas.id_usuario = usuarios.id where usuarios.nombre = 'Alberto'

-- 07
select  nombre_artista from artistas inner join artistas_relacionados on artistas.id = artistas_relacionados.id_artista


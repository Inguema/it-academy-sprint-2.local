-- PIZZERÍA CONSULTAS --
-- Para verificar que tu diseño es correcto, efectúa las siguientes consultas y comprueba que devuelven resultados correctos:


-- Lista cuántos productos de tipo 'Bebidas' se han vendido en una determinada localidad
select
    productos_tipo.tipo,
    pedidos.cantidad_producto as Número_de_Productos_Vendidos_por_Tipo,
    ubicacion_localidades.nombre
from pedidos
         inner join productos
                    on pedidos.id = productos.id_pedido
         inner join productos_tipo
                    on productos.id_tipo_producto = productos_tipo.id
         inner join clientes
                    on pedidos.id_cliente = clientes.id
         inner join ubicacion_localidades
                    on clientes.id_localidad = ubicacion_localidades.id
where productos_tipo.tipo = 'Bebidas' and ubicacion_localidades.nombre = 'Calatayud'



-- Lista cuántos pedidos ha efectuado un determinado empleado
select
    count(pedidos.id) as NÚM_PEDIDOS,
    empleados.nombre as NOMBRE_EMPLEADO
from pedidos
         join tiendas
              on pedidos.id = tiendas.id_pedido
         join empleados
              on tiendas.id_empleado = empleados.id
where empleados.nombre = 'Juan'
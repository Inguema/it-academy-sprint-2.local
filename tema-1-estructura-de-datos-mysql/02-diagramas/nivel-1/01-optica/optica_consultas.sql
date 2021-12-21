-- ÓPTICA CONSULTAS --
-- Para verificar que tu diseño es correcto, efectúa las siguientes consultas y comprueba que devuelven resultados correctos:

-- Lista el total de compras de un cliente
select
    *
from ventas
         inner join clientes
                    on ventas.id_cliente = clientes.id
where clientes.id = 1



-- Lista las distintas gafas que ha vendido un empleado durante un año
select
    gafas.id,
    gafas.nombre,
    gafas.precio,
    empleados.id as empleado,
    empleados.nombre,
    empleados.apellido_primero
from ventas
         inner join empleados
                    on ventas.id_empleado = empleados.id
         inner join gafas
                    on ventas.id_gafa = gafas.id
where empleados.nombre = 'Dora' and ventas.fecha_venta between '2021-01-01' AND '2021-12-31'



-- Lista los distintos proveedores que han suministrado gafas vendidas con éxito por la óptica
select
    proveedores.nombre as Nombre_Proveedor,
    count(gafas.nombre) as Gafas_vendidas_por_Proveedor
from proveedores
         inner join marcas
                    on proveedores.id = marcas.id_proveedor
         inner join gafas
                    on marcas.id = gafas.id_marca
group by proveedores.nombre order by Gafas_vendidas_por_Proveedor desc

/*1.	Consultar el supermercado que tenga más cantidad de productos con el tipo “CARNICOS” 
que han vendido hasta la fecha 31 de diciembre del 2013 retornando el nombre del supermercado
, la cantidad, la descripción del tipo de supermercado y la fecha de venta.(8 minutos)*/
select a.NOMBRE_SUPERMERCADO ,c.CANTIDAD,D.DESCRIPCION_PRODUCTO,c.FECHA_VENTE from ((((
[dbo].[SUPERMERCADO] AS a 
inner join [dbo].[VENDEDOR] AS b on a.ID_SUPERMERCADO = b.ID_SUPERMERCADO)
inner join [dbo].[FACTURA] AS c on b.ID_VENDEDOR = c.ID_VENDEDOR)
inner join [dbo].[PRODUCTO] AS d on c.ID_PRODUCTO = d.ID_PRODUCTO)
inner join [dbo].[TIPO_PRODUCTO] e on d.ID_TIPO_PRODUCTO = e.ID_TIPO_PRODUCTO)
where e.DESCRIPCION_TIPO='Carnicos' AND c.FECHA_VENTE = '2013-12-31'
/* No retorna nada, debido a que no hay productos que se hayan vendido en esa fecha */


/*2.	Seleccionar los clientes que compran en el SUPERMERCADO “Exito” cuya compra supera los $150.000 mil peso
 e imprimir todos los datos del cliente más el nombre del supermercado y el valor de venta, y ordenarlos descendentemente
 .(10 minutos)*/
 select a.*,e.NOMBRE_SUPERMERCADO,b.VALOR_VENTA from (((
 [dbo].[CLIENTE]AS a 
inner join [dbo].[FACTURA] AS b on a.ID_CLIENTE = b.ID_CLIENTE)
inner join [dbo].[VENDEDOR] AS c on c.ID_VENDEDOR = b.ID_VENDEDOR)
inner join [dbo].[SUPERMERCADO] AS e on c.ID_SUPERMERCADO = e.ID_SUPERMERCADO)
where b.VALOR_VENTA >150000 Order By b.VALOR_VENTA DESC


/*3.	Construir la consulta que permita conocer las ventas totales de cada vendedor en cada SUPERMERCADO, 
retornando el nombre del vendedor, SUPERMERCADO y valor total de ventas por cada vendedor ordenado descendentemente 
por valor.(8 minutos)*/
SELECT SUM(A.VALOR_VENTA) AS VALOR_VENTA, B.NOMBRE_VENDEDOR, C.NOMBRE_SUPERMERCADO FROM(([dbo].[FACTURA] AS A
INNER JOIN [dbo].[VENDEDOR]  AS B ON A.ID_VENDEDOR = B.ID_VENDEDOR)
INNER JOIN [dbo].[SUPERMERCADO] AS C ON B.ID_SUPERMERCADO = C.ID_SUPERMERCADO)
GROUP BY B.NOMBRE_VENDEDOR,C.NOMBRE_SUPERMERCADO
ORDER BY VALOR_VENTA DESC


/*4.	Consultar las facturas cuyo valor es superior a $100.000 pesos y el código del vendedor sea el 3,
 retornando el número de la factura, el valor de la factura y el nombre del vendedor.(10 minutos)*/
SELECT  a.NUMERO_FACTURA, a.VALOR_VENTA, b.NOMBRE_VENDEDOR FROM([dbo].[FACTURA] AS A
INNER JOIN [dbo].[VENDEDOR]  AS B ON A.ID_VENDEDOR = B.ID_VENDEDOR)
where A.VALOR_VENTA >100000 and b.ID_VENDEDOR = 3
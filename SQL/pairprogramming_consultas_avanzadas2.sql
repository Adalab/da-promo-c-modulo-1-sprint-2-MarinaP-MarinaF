USE sys;

#1 Relación entre número de pedidos y máxima carga:
# Desde logística nos piden el número de pedidos y la máxima cantidad de carga de entre los mismos
# (freight) que han sido enviados por cada empleado (mostrando el ID de empleado en cada caso).

SELECT COUNT(order_id), employee_id, freight
FROM orders
WHERE freight >= 100
GROUP BY employee_id, freight;

#2 Descartar pedidos sin fecha y ordénalos:
# Una vez han revisado los datos de la consulta anterior, nos han pedido afinar un poco más el "disparo". En
# el resultado anterior se han incluido muchos pedidos cuya fecha de envío estaba vacía, por lo que 
# tenemos que mejorar la consulta en este aspecto. También nos piden que ordenemos los resultados
# según el ID de empleado para que la visualización sea más sencilla.

SELECT COUNT(order_id), employee_id, freight, shipped_date
FROM orders
WHERE shipped_date
GROUP BY employee_id, freight, shipped_date
ORDER BY employee_id;

#3 Números de pedidos por día:
# El siguiente paso en el análisis de los pedidos va a consistir en conocer mejor la distribución de los 
# mismos según las fechas. Por lo tanto, tendremos que generar una consulta que nos saque el número de
# pedidos para cada día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año 
# (YEAR()).

SELECT COUNT(DISTINCT order_id) AS NumeroPedido, DAY(order_date) AS Día, MONTH(order_date) AS Mes, YEAR(order_date) AS Año
FROM orders
GROUP BY DAY(order_date), MONTH(order_date), YEAR(order_date);


#4 Número de pedidos por mes y año:
# La consulta anterior nos muestra el número de pedidos para cada día concreto, pero esto es demasiado 
# detalle. Genera una modificación de la consulta anterior para que agrupe los pedidos por cada mes 
# concreto de cada año.

SELECT COUNT(DISTINCT order_id) AS NumeroPedido, MONTH(order_date) AS Mes, YEAR(order_date) AS Año
FROM orders
GROUP BY MONTH(order_date), YEAR(order_date) ORDER BY YEAR(order_date);

#5 Seleccionad las ciudades con 4 o más empleadas:
# Desde recursos humanos nos piden seleccionar los nombres de las ciudades con 4 o más empleadas de 
# cara a estudiar la apertura de nuevas oficinas.

SELECT order_id AS OrderID, unit_price AS PrecioUnidad,
CASE
	WHEN unit_price > 2000 THEN "Alto"
    ELSE "Bajo"
    END AS PrecioPedido
FROM order_details;


#6 Cread una nueva columna basándonos en la cantidad monetaria:
# Necesitamos una consulta que clasifique los pedidos en dos categorías ("Alto" y "Bajo") en función de la
# cantidad monetaria total que han supuesto: por encima o por debajo de 2000 euros.

SELECT order_id as NumeroPedido, ROUND(unit_price * quantity, 1) AS Total,
CASE 
WHEN unit_price * quantity > 2000 THEN "Alto"
ELSE "Bajo"
END AS Categoria
FROM order_details;
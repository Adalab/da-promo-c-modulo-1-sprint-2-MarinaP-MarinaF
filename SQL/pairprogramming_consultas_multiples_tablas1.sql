#1 Desde las oficinas de UK nos pide que realicemos una consulta a la BBDD con la que podamos conocer
# cuantos pedidos ha realizado cada empresa cliente de UK. Nos piden el id del cliente y el nombre de la
# empresa y el número de pedidos. Deberéis obtener una tabla similar a esta:

SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, COUNT(orders.order_id) as NumeroPedidos
FROM customers
CROSS JOIN orders
WHERE customers.customer_id = orders.customer_id
GROUP BY Identificador;

#2 Hacer un query que nos permita conocer cuántos objetos ha pedido cada empresa de UK durante cada año,
# nos piden conocer el nombre de la empresa, cada año y el número de objetos que han pedido, Para ello,
# hará falta hacer dos joins, hará falta una tabla que tenga tres columnas: nombre empresa, año, num objetos.

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) AS Año, SUM(order_details.quantity) AS NumObjetos
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = orders.customer_id
WHERE orders.ship_country = "UK"
GROUP BY customers.company_name, YEAR(orders.order_date)
ORDER BY customers.company_name;

# SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, YEAR(orders.shipped_date) AS Año, COUNT(products.units_on_order) as NumeroObjetos
# FROM customers
# CROSS JOIN orders
# CROSS JOIN products
# WHERE customers.customer_id = orders.customer_id
# GROUP BY Identificador;

# CROSS JOIN products
# WHERE orders.order_id = products.units_on_order
# GROUP BY Identificador;

# SELECT customers.company_name, YEAR(order_date), order_id
# FROM orders
# CROSS JOIN customers
# WHERE customers.customer_id = orders.customer_id;

#3 Nos piden la misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa
# cantidad de objetos, teniendo en cuenta los descuentos. Ojo que los descuentos en nuestra tabla nos salen
# en porcentajes, 15% nos sale como 0.15

SELECT customers.company_name AS NombreEmpresa, YEAR(orders.order_date) as Año, SUM(order_details.quantity) as Objetos,(SUM(order_details.quantity)*(unit_price - unit_price*discount)) as DineroTotal
FROM orders
INNER JOIN customers 
	ON customers.customer_id = orders.customer_id 
INNER JOIN order_details 
	ON  orders.order_id= order_details.order_id
WHERE customers.country = 'UK'
GROUP BY company_name, order_date, quantity, unit_price, discount;

	# No sale lo mismo.

#4 Una consulta que indique el nombre de cada compañía cliente junto con cada pedido que han realizado
# y su fecha.

SELECT company_name AS NombreEmpresa, order_id AS PedidoID, order_date AS Fecha
FROM orders
NATURAL JOIN customers;
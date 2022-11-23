# Pedidos por empres en UK
# Desde las oficinas de UK nos pide que realicemos una consulta a la BBDD con la que podamos conocer
# cuantos pedidos ha realizado cada empresa cliente de UK. Nos piden el id del cliente y el nombre de la
# empresa y el número de pedidos. Deberéis obtener una tabla similar a esta:

SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, COUNT(orders.order_id) as NumeroPedidos
FROM customers
CROSS JOIN orders
WHERE customers.customer_id = orders.customer_id
GROUP BY Identificador;

# Productos pedidos por empresa UK por año:
# Hacer un query que nos permita conocer cuántos objetos ha pedido cada empresa de UK durante cada año,
# nos piden conocer el nombre de la empresa, cada año y el número de objetos que han pedido, Para ello,
# hará falta hacer dos joins, hará falta una tabla que tenga tres columnas: nombre empresa, año, num objetos.

SELECT customers.company_name AS NombreEmpresa, YEAR(order_date) AS Año, order_id,  count(units_on_order)
FROM orders, customers
CROSS JOIN customers, products
WHERE customers.customer_id = orders.customer_id
GROUP BY NombreEmpresa;


SELECT customers.company_name AS NombreEmpresa, YEAR(order_date) AS Año, order_id
FROM orders
CROSS JOIN customers
WHERE customers.customer_id = orders.customer_id;
SELECT customers.company_name AS NombreEmpresa, YEAR(order_date) AS Año, count(units_on_order)
FROM orders, customers
CROSS JOIN products
WHERE customers.customer_id = orders.customer_id
GROUP BY NombreEmpresa;



# SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, YEAR(orders.shipped_date) AS Año, COUNT(products.units_on_order) as NumeroObjetos
# FROM customers
# CROSS JOIN orders
# CROSS JOIN products
# WHERE customers.customer_id = orders.customer_id
# GROUP BY Identificador;

# CROSS JOIN products
# WHERE orders.order_id = products.units_on_order
# GROUP BY Identificador;

# , COUNT(products.units_on_order) as NumeroObjetos

# SELECT customers.company_name, YEAR(order_date), order_id
# FROM orders
# CROSS JOIN customers
# WHERE customers.customer_id = orders.customer_id;
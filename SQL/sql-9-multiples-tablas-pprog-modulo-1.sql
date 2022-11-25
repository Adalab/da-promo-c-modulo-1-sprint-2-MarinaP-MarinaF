USE sys;

#1 Qué empresas tenemos en la BBDD Northwind.
# Debemos obtener una consulta SQL que nos devuelva el nombre de todas la empresas cliente, los ID de sus pedidos
# y las fechas.

SELECT orders.order_id AS OrderID, customers.company_name AS CompanyName, orders.order_date AS OrderDate
FROM customers
	LEFT JOIN orders
	ON customers.customer_id = orders.customer_id;

#2 Desde la oficina de RU nos solicitan información acerca del número de pedidos que ha realizado
# cada cliente del propio RU de cara a conocerlos mejor y poder adaptarse al mercado actual.
# Nos piden el nombre de cada compañía cliente junto con el número de pedidos.

SELECT customers.company_name AS NombreCliente, COUNT(distinct orders.order_id) AS NumeroPedidos   
FROM customers
	LEFT JOIN orders
	ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY NombreCliente;
 
#3 Empresas de UK y sus pedidos.
# Nos han pedido que obtengamos todos los nombres de las empresas cliente de RU (tengan pedidos o no)
# junto con los ID de todos los pedidos que han realizado, el nombre de contacto de cada empresa
# y la fecha del pedido.
 
SELECT orders.order_id AS OrderId, customers.company_name AS NombreEmpresa, customers.contact_name AS Contacto, orders.order_date AS FechaPedido
FROM customers
	LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK';
 
#4 Desde recursos humanos nos piden realizar una consulta que muetre por pantalla los datos de todas las empleadas y sus supervisoras.
# Nos piden ubicación, nombre y apellido tanto de las empleadas como de las jefas. Investiga el resultado,
# ¿sabrías decir quién es el director?
 
SELECT concat(A.first_name, " ", A.last_name) AS NombreEmpleada, A.city AS CiudadEmpleada, concat(B.first_name, " ", B.last_name) AS NombreJefa, B.city AS CiudadJefa
FROM employees AS A, employees AS B
WHERE  A.reports_to = B.employee_id;

# El director es Andrew Fuller.

# BONUS: Selecciona todos los pedidos, tengan empresa asociado o no, y todas las empresas tengan
# pedidos asociados o no. Muestra el ID del pedido, el nombre de la empresa y la fecha del pedido si existe.

SELECT orders.order_id AS OrderID, customers.company_name AS NombreCliente, orders.order_date AS FechaPedido
FROM orders 
LEFT JOIN customers
ON orders.customer_id = customers.customer_id
UNION
SELECT orders.order_id AS OrderID, customers.company_name AS NombreCliente, orders.order_date AS FechaPedido
FROM orders LEFT JOIN customers
ON orders.customer_id = customers.customer_id
ORDER BY NombreCliente;

# No sale lo mismo.
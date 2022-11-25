#1 Extraed los pedidos con el máximo order_date para cada empleado.
# Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado.
# Para eso nos pide que lo hagamos con una query correlacionada.

	# Hacemos un primer intento:

SELECT orders.order_id AS OrderID, orders.customer_id AS CustomerID, employees.employee_id AS EmployeeId, MAX(orders.order_date) AS OrderDate, orders.required_date AS RequiredDate
FROM orders, employees
WHERE employees.employee_id = orders.employee_id
GROUP BY OrderID, CustomerID
ORDER BY order_date;

	# Hacemos un segundo intento:

SELECT Orders.order_id AS OrderID, Orders.customer_id AS CustomerID, Orders.employee_id AS EmployeeId, MAX(Orders.order_date) AS OrderDate, Orders.required_date AS RequiredDate
FROM orders AS Orders
WHERE Orders.order_date =(
    SELECT MAX(Orders.order_date)
    FROM employees AS Employees
    WHERE Orders.employee_id = Employees.employee_id)
GROUP BY OrderID;

# Solución:

SELECT o1.order_id AS OrderID, o1.customer_id AS CustomerID, o1.employee_id AS EmployeeID, o1.order_date AS OderDate, o1.required_date as RequiredDate
FROM orders as o1
WHERE o1.order_date >= (
	SELECT max(o2.order_date)
	FROM orders as o2
	WHERE o2.employee_id = o1.employee_id)
ORDER BY order_date DESC;

#2 Extraed el precio unitario máximo (unit_price) de cada producto vendido.
# Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio
# unitario. De nuevo lo tendréis que hacer con queries correlacionadas.

	# Hacemos un primer intento:

SELECT product_id AS ProductId , unit_price AS Max_unit_price_sold
FROM products as t1
WHERE ProductId(
	SELECT orders.product_id
    FROM orders as t2
    WHERE orders.product_id = products.product_id)
ORDER BY ProductId;

	# Hacemos un segundo intento:

SELECT product_id, MAX(unit_price)
FROM products AS e1  
WHERE unit_price >= (
    SELECT AVG(e2.salario)  
    FROM empleadas AS e2  
    WHERE e1.pais = e2.pais)  
ORDER BY salario;

	# Solución:

SELECT unit_price AS Max_unit_price_sold, product_id AS ProductID
FROM order_details as o1
WHERE o1.unit_price = (select max(unit_price)
					from order_details as o2
                    where o1.product_id = o2.product_id)
ORDER BY ProductID;

#3 Ciudades que empiezan con A o B.
# Necesita que devolvamos la ciudad, el nombre de la compañía, y el nombre de contacto.

SELECT city AS City, company_name AS CompanyName, contact_name AS ContactName
FROM customers
WHERE city LIKE 'A%' or city LIKE 'B%';

#4 Número de pedidos que han hecho en las ciudades que empiezan con L. Devolver los mismos
# campos que en la query anterior el número total de pedidos que han hecho todas las ciudades que
# empiezan por L.

SELECT city AS Ciudad, company_name AS Empresa, contact_name AS PersonaContacto, COUNT(distinct order_id) AS NumeroPedidos
FROM customers
INNER JOIN orders
USING (customer_id)
WHERE city LIKE 'L%'
GROUP BY company_name, city, contact_name;

#5 Todos los clientes cuyo contact_title no inclua Sales.
# Extraer el nombre de contacto, su posición (contact_title) y el nombre de la compañía.

SELECT contact_name, contact_title, company_name
FROM customers
WHERE contact_title NOT LIKE '%Sales%';

#6 Todos los clientes que tengan una A en lsegunda posición en s unombre.
# Devolved únicamente el nombre de contacto.

SELECT contact_name AS ContactName
FROM customers
WHERE contact_name NOT LIKE '_a%';
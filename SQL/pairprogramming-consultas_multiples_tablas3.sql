#1 Todos los clientes y proveedores de la BBDD, ciudad, nombre de empresa, nombre de contacto y relación
# (tabla nueva: Relationship). No debe haber duplicados.

USE sys;

SELECT 'Customers' AS Relationship
FROM customers;

SELECT city AS City, company_name AS CompanyName, contact_name AS ContactName
FROM customers
UNION
SELECT city AS City, company_name AS CompanyName, contact_name AS ContactName
FROM suppliers;

#2 Extraer todos los pedidos gestionados por Nancy Davolio, todos los detalles tramitados por ella.

	# Un método en el que conocemos el ID de la empleada:
    
SELECT order_id AS OrderID, customer_id AS CustomerID, employee_id AS EmployeeIF, order_date AS OrderDate, required_date AS RequiredDate, shipped_date AS ShippedDate, ship_via AS ShipVia, freight AS Freight, ship_name AS ShipName, ship_address AS ShipAddress, ship_city AS ShipCity, ship_postal_code AS ShipPostalCode, ship_country AS ShipCountry
FROM orders
WHERE employee_id = 1

	# Un método en el que no:

SELECT *
FROM orders
WHERE employee_id IN(
		SELECT first_name = 'Nancy' AND last_name = 'Davolio'
        FROM employees);

#3 Extraer todas las empresas que han comprado en el año 1997.

	# Hacemos un primer intento:

SELECT country AS Country, company_name AS CompanyName, YEAR(order_date) AS OrderDate
FROM customers, orders
WHERE YEAR(order_date) = 1997

	# Hacemos un segundo intento:

SELECT country AS Country, company_name AS CompanyName, YEAR(order_date) AS OrderDate
FROM customers, orders
WHERE YEAR(order_date) = 1997 NOT IN(
	SELECT YEAR(order_date)
	FROM orders;)
    
	# Solución:

SELECT company_name AS Empresas, country as País
FROM customers
WHERE customer_id NOT IN(
	SELECT customer_id
	FROM orders WHERE YEAR(order_date) = 1997);
    
#3 Extraer toda la información de los pedidos donde tengamos "Konbu".

SELECT *
FROM orders
INNER JOIN order_details
USING (order_id)
WHERE product_id IN(
	SELECT product_id
    FROM products WHERE product_name = 'Konbu');
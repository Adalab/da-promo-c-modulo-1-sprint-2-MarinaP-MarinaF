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

SELECT order_id AS OrderID, customer_id AS CustomerID, employee_id AS EmployeeIF, order_date AS OrderDate, required_date AS RequiredDate, shipped_date AS ShippedDate, ship_via AS ShipVia, freight AS Freight, ship_name AS ShipName, ship_address AS ShipAddress, ship_city AS ShipCity, ship_postal_code AS ShipPostalCode, ship_country AS ShipCountry
FROM orders
WHERE employee_id = 1

#3 Extraer todas las empresas que han comprado en el año 1997.


SELECT country AS Country, company_name AS CompanyName, YEAR(order_date) AS OrderDate
FROM customers, orders
WHERE YEAR(order_date) = 1997

SELECT country AS Country, company_name AS CompanyName, YEAR(order_date) AS OrderDate
FROM customers, orders
WHERE YEAR(order_date) = 1997 NOT IN(
	SELECT YEAR(order_date)
	FROM orders;
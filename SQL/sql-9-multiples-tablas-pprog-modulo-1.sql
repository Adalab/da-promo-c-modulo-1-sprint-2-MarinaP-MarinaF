use northwind
-- 1
SELECT orders.order_id AS OrderID, customers.company_name AS CompanyName, orders.order_date AS OrderDate
FROM customers  LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- 2 ERROR!!!!!!!!!!!!!!
SELECT customers.company_name AS NombreCliente, COUNT(orders.order_id) AS NumeroPedidos   
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY COUNT(orders.order_id);
 
 -- 3
 SELECT orders.order_id AS OrderId, customers.company_name AS NombreEmpresa, customers.contact_name AS NombreCliente, orders.order_date AS FechaPedido
 FROM orders RIGHT JOIN customers
 ON orders.customer_id = customers.customer_id;
 
 -- 4 
 SELECT employees.city, employees.first_name AS NombreEmpleado, employees.last_name AS ApellidoEmpleado, 
 
 
 -- 5
 SELECT orders.order_id AS OrderID, customers.company_name AS NombreCliente, orders.order_date AS FechaPedido
 FROM orders 
 LEFT JOIN customers
 ON orders.customer_id = customers.customer_id
 UNION
 SELECT orders.order_id AS OrderID, customers.company_name AS NombreCliente, orders.order_date AS FechaPedido
 FROM orders LEFT JOIN customers
 ON orders.customer_id = customers.customer_id;
 
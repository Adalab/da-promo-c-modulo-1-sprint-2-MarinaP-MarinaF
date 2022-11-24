# Extraed los pedidos con el máximo order_date para cada empleado.
# Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado.
# Para eso nos pide que lo hagamos con una query correlacionada.

SELECT orders.order_id AS OrderID, orders.customer_id AS CustomerID, employees.employee_id AS EmployeeId, MAX(orders.order_date) AS OrderDate, orders.required_date AS RequiredDate
FROM orders, employees
WHERE employees.employee_id = orders.employee_id
GROUP BY OrderID, CustomerID
ORDER BY order_date;

SELECT Orders.order_id AS OrderID, Orders.customer_id AS CustomerID, Orders.employee_id AS EmployeeId, MAX(Orders.order_date) AS OrderDate, Orders.required_date AS RequiredDate
FROM orders AS Orders
WHERE Orders.order_date =(
    SELECT MAX(Orders.order_date)
    FROM employees AS Employees
    WHERE Orders.employee_id = Employees.employee_id)
GROUP BY OrderID;

% Sirve para que las coincidencias sean de un string de cero o más caracteres.
_ Este realiza las coincidencias para cualquier carácter individual.

# Extraed el precio unitario máximo (unit_price) de cada producto vendido.
# Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio
# unitario. De nuevo lo tendréis que hacer con queries correlacionadas.

SELECT product_id AS ProductId , unit_price AS Max_unit_price_sold
FROM products as t1
WHERE ProductId(
	SELECT orders.product_id
    FROM orders as t2
    WHERE orders.product_id = products.product_id)
ORDER BY ProductId;
    

SELECT product_id, MAX(unit_price)
FROM products AS e1  
WHERE unit_price >= (
    SELECT AVG(e2.salario)  
    FROM empleadas AS e2  
    WHERE e1.pais = e2.pais)  
ORDER BY salario;  


# Ciudades que empiezan con A o B.
# Necesita que devolvamos la ciudad, el nombre de la compañía, y el nombre de contacto.

# Número de pedidos que han hecho en las ciudades que empiezan con L. Devolver los mismos
# campos que en la query anterior el número total de pedidos que han hecho todas las ciudades que
# empiezan por L.

# Todos los clientes cuyo contact_title no inclua Sales.
# Extraer el nombre de contacto, su posición (contact_title) y el nombre de la compañía.

# Todos los clientes que tengan una A en lsegunda posición en s unombre.
# Devolved únicamente el nombre de contacto.
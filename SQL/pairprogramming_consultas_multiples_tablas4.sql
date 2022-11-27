USE sys

#1 Devolver ID del producto, nombre del producto e ID de categoría de los productos con la categoría
# 'Beverages'.

SELECT product_id AS ProductID, product_name AS ProductName, category_id AS CategoryID
FROM products
WHERE category_id IN (
		SELECT category_id
		FROM categories
		WHERE category_name = 'Beverages');
        
#2 Extraer una lista de países donde viven los clientes en los que no hay
# ningún proveedor.

SELECT country
FROM customers
GROUP BY country
HAVING country NOT IN(
			SELECT country
			FROM suppliers);
            
#3 Extraer el OrderID y el nombre de los clientes que pidieron más de 20 artículos del producto
# 'Grandma's Boysenberry Spread' en un solo pedido.

SELECT  order_id AS OrderID, customer_id AS CustomerID
FROM customers
INNER JOIN orders
USING (customer_id)
WHERE order_id IN(
		SELECT order_id
		FROM order_details
		WHERE quantity > 20 AND product_id IN (
						SELECT product_id
						FROM products
						WHERE product_name = "Grandma's Boysenberry Spread"));
                        
#4 Extraer los 10 productos más caros.

SELECT product_name AS Ten_Most_Expensive_Products, unit_price AS UnitPrice
FROM products
ORDER BY unit_price DESC
LIMIT 10;
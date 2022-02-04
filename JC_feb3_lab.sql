#Jordan Crivella (joc6peh) 
#Homework from 2/3
#DS3002

-- ------------------
-- 1. Query to get product name and quantity/unit
-- ------------------
SELECT product_name
	, quantity_per_unit
FROM northwind.products; 

-- ------------------
-- 2. Query to get current product list (id and name)
-- ------------------
SELECT id AS product_id
	, product_name
FROM northwind.products
WHERE discontinued = 0;

-- ------------------
-- 3. Query to get discontinued product list (id and name)
-- ------------------
SELECT id AS product_id
	, product_name
FROM northwind.products
WHERE discontinued = 1;

-- --------------
-- 4. Write a query to get most expense and least expensive Product list (name and unit price).  
-- --------------
SELECT product_name
	, list_price
FROM northwind.products
WHERE list_price IN (SELECT MIN(list_price) FROM products)
OR list_price IN (SELECT MAX(list_price) FROM products);


-- ------------------
-- 5.  Query to get  product list with cost less then 20
-- ------------------
SELECT id AS product_id
	, product_name
    , list_price
FROM northwind.products
WHERE list_price<20.0000;

-- ------------------
-- 6. Query to get  product list with cost between 15 and 20
-- ------------------
SELECT id AS product_id
	, product_name
    , list_price
FROM northwind.products
WHERE list_price between 15.0000 and 25.0000;

-- ------------------
-- 7. Query to get  product list above average price
-- ------------------
SELECT id AS product_id
	, product_name
    , list_price
FROM northwind.products
WHERE list_price > (SELECT avg(list_price) FROM northwind.products);

-- ------------------
-- 8. Query to get 10 most expensive
-- ------------------
SELECT id as product_id
	, product_name as ten_most_expensive_products
    , list_price
FROM northwind.products 
ORDER by list_price desc
LIMIT 10; 

-- ------------------
-- 9. Query count discontinued and continued products
-- ------------------
SELECT COUNT(product_name)
FROM northwind.products
GROUP BY discontinued;

-- ------------------
-- 10. Query to get Product list (name, units on order, units in stock) 
-- of stock is less than the quantity on order
-- ------------------
SELECT product_name
	, reorder_level as units_in_stock
	, target_level as units_on_order
FROM northwind.products
WHERE ((discontinued = 0) AND ((reorder_level) < target_level));


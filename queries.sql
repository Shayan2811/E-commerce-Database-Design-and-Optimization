-- Retrieve All Customers
SELECT * FROM "customers";

-- Retrieve Products in a Specific Category
SELECT * FROM "products"
WHERE "category_id" = (
  SELECT "category_id" FROM "categories" 
  WHERE "name" = 'Electronics'
);

-- Calculate Total Order Amount for a Customer
SELECT "customers"."first_name", "customers"."last_name", SUM("products"."price" * "order_items"."quantity") AS total_amount
FROM "customers"
JOIN "orders" ON "customers"."customer_id" = "orders"."customer_id"
JOIN "order_items" ON "orders"."order_id" = "order_items"."order_id"
JOIN "products" ON "order_items"."product_id" = "products"."product_id"
WHERE "customers"."customer_id" = 1
GROUP BY "customers"."first_name", "customers"."last_name";

-- List Categories with Product Counts
SELECT "categories"."name", COUNT("products"."product_id") AS "product_count"
FROM "categories"
LEFT JOIN "products" ON "categories"."category_id" = "products"."category_id"
GROUP BY "categories.name";

-- Retrieve Latest Orders
SELECT "orders"."order_id", "orders"."order_date", "customers"."first_name", "customers"."last_name"
FROM "orders"
JOIN "customers" ON "orders"."customer_id" = "customers"."customer_id"
ORDER BY "orders"."order_date" DESC
LIMIT 10;

-- Find Customers with No Orders
SELECT "customers"."first_name", "customers"."last_name"
FROM "customers"
LEFT JOIN "orders" ON "customers"."customer_id" = "orders"."customer_id"
WHERE "orders"."order_id" IS NULL;

-- Calculate Total Sales by Category
SELECT "categories"."name" AS "category_name", SUM("products"."price" * "order_items"."quantity") AS "total_sales"
FROM "categories"
LEFT JOIN "products" ON "customers"."category_id" = "products"."category_id"
LEFT JOIN "order_items" ON "products"."product_id" = "order_items"."product_id"
GROUP BY "categories"."name";

-- Retrieve Order Details Including Product Information
SELECT "orders"."order_id", "products"."name" AS "product_name", "products"."price", "order_items"."quantity"
FROM "orders"
JOIN "order_items" ON "orders"."order_id" = "order_items"."order_id"
JOIN "products" ON "order_items"."product_id" = "products"."product_id"
WHERE "orders"."order_id" = 1;

-- Find Best-Selling Products
SELECT "products"."name" AS "product_name", SUM("order_items"."quantity") AS "total_sold"
FROM "products"
JOIN "order_items" ON "products"."product_id" = "order_items"."product_id"
GROUP BY "products"."name"
ORDER BY "total_sold" DESC
LIMIT 5;

-- Delete Customer and Associated Orders
DELETE FROM "customers"
WHERE "customer_id" = 1;

DELETE FROM orders
WHERE "customer_id" = 1;


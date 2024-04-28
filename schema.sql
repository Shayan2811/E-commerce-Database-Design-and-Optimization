-- Customers table
CREATE TABLE "customers" (
    "customer_id" SERIAL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) UNIQUE,
    PRIMARY KEY ("customer_id")
);

-- Products table
CREATE TABLE "products" (
    "product_id" SERIAL,
    "name" VARCHAR(255) NOT NULL,
    "category_id" INT,
    "price" DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY ("product_id"),
    FOREIGN KEY ("category_id") REFERENCES "categories"("category_id")
);

-- Categories table
CREATE TABLE "categories" (
    "category_id" SERIAL,
    "name" VARCHAR(100) NOT NULL,
    PRIMARY KEY ("category_id")
);

-- Orders table
CREATE TABLE "orders" (
    "order_id" SERIAL,
    "customer_id" INT,
    "order_date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("order_id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id")
);

-- Order Items table (for many-to-many relationship between orders and products)
CREATE TABLE "order_items" (
    "order_item_id" SERIAL,
    "order_id" INT,
    "product_id" INT,
    "quantity" INT NOT NULL,
    PRIMARY KEY ("order_item_id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("order_id"),
    FOREIGN KEY ("product_id") REFERENCES "products"("product_id")
);

-- Index on Customer Email
CREATE INDEX "idx_customers_email" ON "customers" ("email");
CREATE INDEX "idx_orders_order_date" ON "orders" ("order_date");
CREATE INDEX "idx_products_category_id" ON "products" ("category_id");
CREATE INDEX "idx_order_items_order_product" ON "order_items" ("order_id", "product_id");
CREATE INDEX "idx_products_name" ON "products" ("name");

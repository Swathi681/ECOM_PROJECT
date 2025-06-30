CREATE DATABASE ecommerce_db;
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50)
);
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
     price DECIMAL(10, 2),
    description TEXT,
    stockQuantity INT
);

CREATE TABLE carts (
    cart_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE orderss (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    total_price DECIMAL(10, 2),
    shipping_address TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE orderss_items (
    orderss_item_id INT IDENTITY(1,1) PRIMARY KEY,
    orderss_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (orderss_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customer VALUES (1, 'John Doe', 'john@example.com', '1234');
INSERT INTO product VALUES (101, 'Laptop', 50000.00, 'Gaming Laptop', 10);
INSERT INTO product VALUES (102, 'Mouse', 500.00, 'Wireless Mouse', 25);

SELECT * FROM customer;
SELECT * FROM carts;
SELECT * FROM orderss;
SELECT * FROM product;
SELECT * FROM orderss_items;


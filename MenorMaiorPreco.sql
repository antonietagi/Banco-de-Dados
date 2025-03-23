CREATE TABLE products (
id numeric PRIMARY KEY,
name VARCHAR(255),
amount numeric,
price numeric
);

INSERT INTO products (id, name, amount, price) 
VALUES
(1, 'Two-doors', 100, 800),
(2, 'Dining table', 1000, 560),
(3, 'Towel holder', 10000, 25.50),
(4, 'Computer desk', 350, 320.50),
(5, 'Chair', 3000, 210.64),
(6, 'Single bed', 750, 460);

SELECT 
MIN(price) AS 'Menor Preço'
MAX(price) AS 'Maior Preço'
FROM products;

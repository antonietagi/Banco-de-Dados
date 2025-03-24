-- Criação da Tabela categories
CREATE TABLE categories (
id INT PRIMARY KEY,
name VARCHAR(50)
);

-- Inserção de Dados na Tabela categories
INSERT INTO categories (id, name) VALUES
(1, 'old stock'),
(2, 'new stock'),
(3, 'modern'),
(4, 'commercial'),
(5, 'recyclable'),
(6, 'executive'),
(7, 'superior'),
(8, 'wood'),
(9, 'super luxury'),
(10, 'vintage');

-- Criação da Tabela products
CREATE TABLE products (
id INT PRIMARY KEY,
name VARCHAR(50),
amount NUMERIC,
price NUMERIC,
id_categories INT REFERENCES categories(id)
);

-- Inserção de Dados na Tabela products
INSERT INTO products (id, name, amount, price, id_categories) VALUES

(1, 'Lampshade', 100, 800, 4),
(2, 'Table for painting', 1000, 560, 9),
(3, 'Notebook desk', 10000, 25.50, 9),
(4, 'Computer desk', 350, 320.50, 6),
(5, 'Chair', 3000, 210.64, 9),
(6, 'Home alarm', 750, 460, 4);

SELECT products.id, products.name
FROM products
JOIN categories ON products.id_categories = categories.id
WHERE categories.name LIKE 'Super%';

CREATE VIEW pega_palavras_super AS
SELECT products.id, products.name
FROM products
JOIN categories ON products.id_categories = categories.id
WHERE categories.name LIKE 'Super%';

DELIMITER $$
	CREATE TRIGGER super_com_desconto
    BEFORE UPDATE ON products
    FOR EACH ROW
    BEGIN
		IF (SELECT name FROM customers WHERE id = NEW.id_categories) LIKE 'Super%' THEN
			SET NEW.price = NEW.price * 0.9;
				END IF;
    END $$
DELIMITER ;

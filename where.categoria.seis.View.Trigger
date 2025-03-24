DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS providers;
DROP TABLE IF EXISTS categories;

CREATE TABLE products (
id numeric PRIMARY KEY,
name VARCHAR(255),
amount numeric,
price numeric,
id_providers numeric,
FOREIGN KEY (id_providers) REFERENCES providers(id),
id_categories numeric,
FOREIGN KEY (id_categories) REFERENCES categories(id)
);

CREATE TABLE providers (
id numeric PRIMARY  KEY,
name VARCHAR(255),
street VARCHAR(255),
city VARCHAR(255),
state CHAR(2)
);

CREATE TABLE customers (
id numeric PRIMARY KEY,
name VARCHAR(255)
);

INSERT INTO products (id, name, amount, price, id_providers, id_categories)
VALUES
(1, "Two-door wardrobe", 100, 800, 6, 8),
(2, "Dining tab", 1000, 560, 1, 9),
(3, "Towel holder", 10000, 25.50, 5, 1),
(4, "Computer desk", 350, 320.50, 4, 6),
(5, "Chair", 3000, 210.64, 3, 6),
(6, "Single bed", 750, 460, 1, 2);

INSERT INTO providers (id, name, street, city, state)
VALUES
(1, "Henrique", "Av Brasil", "Rio de Janeiro", "RJ" ),
(2, "Marcelo Augusto", "Rua Imigrantes", "Belo Horizonte", "MG"),
(3, "Caroline Silva", "Av São Paulo", "Salvador", "BA"),
(4,"Guilherme Staff","Rua Central","Porto Alegre","RS"),
(5,"Isabela Moraes","Av Juiz Grande","Curitiba","PR"),
(6,"Francisco Accerr","Av Paulista","São Paulo","SP");

INSERT INTO categories (id, name)
VALUES
(1, "old stock"),
(2,"new stock"),
(3, "modern"),
(4, "commercial"),
(5, "recycable"),
(6,"executive"),
(7,"superior"),
(8, "wood"),
(9, "super luxury"),
(10, "vintage");

-- Seu trabalho é retornar os nomes dos produtos e dos 
-- fornecedores cujo código da categoria é 6.

SELECT products.name, providers.name
FROM products
JOIN providers ON products.id_providers = providerss.id
JOIN categories ON products.id_categories = categories.id
WHERE categories.id ='6';

-- criando a view
CREATE VIEW pega_categoria_seis AS
SELECT products.name, providers.name
FROM products
JOIN providers ON products.id_providers = providerss.id
JOIN categories ON products.id_categories = categories.id
WHERE categories.id ='6';

-- chamando a view
SELECT * FROM pega_categoria_seis

-- criando a trigger

DELIMITER $$ 
	CREATE TRIGGER maior_que_trezentos 
    BEFORE UPDATE ON products
    FOR EACH ROW
    BEGIN
		IF NEW.price > 300 THEN 
			SET NEW.price = NEW.price * 0.90;
		END IF
	END $$
DELIMITER;




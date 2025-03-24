-- Criação da tabela customers
CREATE TABLE customers (
id numeric PRIMARY KEY,
name varchar(255),
street varchar(255),
city varchar(255), 
state char(2),
credit_limit decimal(10,2)
);

-- Inserção de dados na tabela customers
INSERT INTO customers (id, name, street, city, state, credit_limit)
VALUES
(1, 'Pedro Augusto da Rocha', 'Rua Pedro Carlos Hoffman', 'Porto Alegre',
'RS', 700.00),
(2, 'Antonio Carlos Mamel', 'Av. Pinheiros', 'Belo Horizonte', 'MG', 3500.50),
(3, 'Luiza Augusta Mhor', 'Rua Salto Grande', 'Niteroi', 'RJ', 4000.00),
(4, 'Jane Ester', 'Av 7 de setembro', 'Erechim', 'RS', 800.00),
(5, 'Marcos Antônio dos Santos', 'Av Farrapos', 'Porto Alegre', 'RS', 4250.25);

SELECT name
FROM customers
WHERE state = 'RS';

-- Criação da View
CREATE VIEW customers_in_rs AS
SELECT name
FROM customers
WHERE state = 'RS';

-- para consultar a view
SELECT * FROM customers_in_rs;

-- Muda o delimitador de comando para $$ para que possamos usar o ; dentro do corpo da trigger
DELIMITER $$

-- Criação da trigger chamada 'check_credit_limit'
-- 'BEFORE INSERT' significa que a trigger será executada **antes** da inserção do novo cliente
CREATE TRIGGER checar_credit_limit
BEFORE INSERT ON customers -- A trigger será criada na tabela 'customers'
FOR EACH ROW -- A trigger será executada para cada linha inserida na tabela
BEGIN
    -- Se o valor de 'credit_limit' da nova linha (NEW) for menor que 1000
    IF NEW.credit_limit < 1000 THEN
        -- Modifica o valor de 'credit_limit' para 1000, caso seja menor que 1000
        SET NEW.credit_limit = 1000;
    END IF;
END$$ -- Fim do corpo da trigger

-- Retorna o delimitador padrão ';', que é utilizado normalmente no MySQL
DELIMITER ;



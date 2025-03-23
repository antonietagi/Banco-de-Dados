-- Criação da Tabela providers
CREATE TABLE providers (
id INT PRIMARY KEY,
name VARCHAR(50),
street VARCHAR(50),
city VARCHAR(50),
state CHAR(2)
);

-- Inserção de Dados na Tabela providers
INSERT INTO providers (id, name, street, city, state) VALUES
(1, 'Henrique', 'Av Brasil', 'Rio de Janeiro', 'RJ'),
(2, 'Marcelo Augusto', 'Rua Imigrantes', 'Belo Horizonte', 'MG'),
(3, 'Caroline Silva', 'Av São Paulo', 'Salvador', 'BA'),

(4, 'Guilherme Staff', 'Rua Central', 'Porto Alegre', 'RS'),
(5, 'Isabela Moraes', 'Av Juiz Grande', 'Curitiba', 'PR'),
(6, 'Francisco Accerr', 'Av Paulista', 'São Paulo', 'SP');

-- Consulta solicitada
SELECT DISTINCT city
FROM providers
ORDER BY city ASC;

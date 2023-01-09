-- Para criar um banco de dados --
CREATE DATABASE fs06_api;


-- Para selecionar um banco de dados --
USE fs06_api;


CREATE TABLE tb_veiculo (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    ano INT(4) NOT NULL
);

-- Manipulação de Dados --

-- Para inserir dados na tabela --
INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2010, 'Celta', 'Chevrolet');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2014, 'Classic', 'Chevrolet');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2004, 'Gol', 'VolksWalgen');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (1998, 'Uno', 'Fiat');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2014, 'C180', 'Mercedes');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2015, 'Celta', 'Chevrolet');

INSERT INTO tb_veiculo (ano, modelo, marca)
VALUES (2021, 'Mobi', 'Fiat');


CREATE TABLE tb_cliente (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

INSERT INTO tb_cliente (nome, email, cpf)
VALUES 
('Alessandro', 'ale@email.com', '12312312312'),
('Rafael', 'raf@email.com', '22312312312'),
('Michael', 'mic@email.com', '32312312312'),
('Victor', 'vic@email.com', '42312312312'),
('Guilherme', 'gui@email.com', '52312312312');



-- Adicionando um relacionamento entre clientes e veiculos --

INSERT INTO tb_cliente (nome, email, cpf) VALUES ('Nao definido', '---', '---');

ALTER TABLE tb_veiculo ADD COLUMN 
    cliente_id INT (11) 
        NOT NULL DEFAULT 6;

ALTER TABLE tb_veiculoconst database = require('../connection/databaseConnection');

    ADD FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id);



-- 1 cliente pode ter varios produtos --
-- varios produtos podem pertencer a 1 cliente -- 


CREATE TABLE tb_produto (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco FLOAT(7) NOT NULL,
    quantidade INT(7) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    categoria VARCHAR(11) NOT NULL UNIQUE,
    cliente_id INT (11) NOT NULL DEFAULT 6
);

ADD FOREIGN KEY (cliente_id) REFERENCES tb_cliente(id);

INSERT INTO tb_produto (nome, preco, quantidade, descricao, categoria)
VALUES 
('Pneu', 499.9, 100, 'Pneu 265/70R16 Goodyear Wrangler at Adventure 112T', 'Carro'),
('Notebook', 3254.07, 63, 'Notebook Acer Intel Core i5 8GB 512GB SSD 15,6” - Full HD Windows 11 Aspire 3.', 
'Informática'),
('Hidratante Facial', 112.5, 120, 'Hidratante Facial Vichy - Minéral 89 - 30ml', 'Dermocosmético'),
('Vestido', 174.9, 110, 'Vestido jeans franja bordado', 'Vestuário'),
('Mouse', 21.9, 53, 'Mouse sem fio USB slim box 1200dpi, MO307, Preto, Multi - CX 1 UN', 'Informática');
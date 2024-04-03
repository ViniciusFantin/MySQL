CREATE DATABASE NOTA_FISCAL_NORMALIZADA;

USE `NOTA_FISCAL_NORMALIZADA`;

CREATE TABLE `NOTA_FISCAL`(
	`NRO_NOTA`INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `NM_CLIENTE` VARCHAR(256) NOT NULL,
    `END_CLIENTE` VARCHAR(256) NOT NULL,
    `NM_VENDEDOR` VARCHAR(256) NOT NULL,
    `DT_EMISSAO` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `VL_TOTAL` FLOAT NOT NULL
);

CREATE TABLE `PRODUTO` (
	`COD_PRODUTO` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `DESC_PRODUTO` VARCHAR(256) NOT NULL,
    `UN_MED` CHAR(2) NOT NULL,
    `VL_PRODUTO` FLOAT NOT NULL    
);

CREATE TABLE `ITEM_NOTA_FISCAL`(
	`NRO_NOTA`INT NOT NULL,
    `COD_PRODUTO` INT NOT NULL,
    `QTD_PRODUTO` INT NOT NULL,
    `VL_PRECO` FLOAT NOT NULL,
    `VL_TOTAL` FLOAT NOT NULL,
    PRIMARY KEY(NRO_NOTA, COD_PRODUTO),
    CONSTRAINT FK_NRO_NOTA_NOTA_FISCAL 
		FOREIGN KEY (NRO_NOTA) REFERENCES NOTA_FISCAL(NRO_NOTA),
    CONSTRAINT FK_COD_PRODUTO_PRODUTO 
		FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO(COD_PRODUTO)
);

-- 

INSERT INTO `PRODUTO` (DESC_PRODUTO, UN_MED, VL_PRODUTO)
VALUES('Leite', 'LT', 4.50);

INSERT INTO `PRODUTO` (DESC_PRODUTO, UN_MED, VL_PRODUTO)
VALUES('Desodorante', 'UN', 8.00);

INSERT INTO `PRODUTO` (DESC_PRODUTO, UN_MED, VL_PRODUTO)
VALUES('Salame', 'KG', 40.00);

-- nota fiscal

INSERT INTO `NOTA_FISCAL`(NM_CLIENTE, END_CLIENTE, NM_VENDEDOR, VL_TOTAL)
VALUES ('Aragorn', 'Terra Média', 'Bilbo', 100.00 );

INSERT INTO `NOTA_FISCAL`(NM_CLIENTE, END_CLIENTE, NM_VENDEDOR, VL_TOTAL)
VALUES ('Gandalf', 'Terra Média', 'Frodo', 100.00 );

INSERT INTO `NOTA_FISCAL`(NM_CLIENTE, END_CLIENTE, NM_VENDEDOR, VL_TOTAL)
VALUES ('Boromir', 'Mordor', 'Sam', 100.00 );

INSERT INTO `NOTA_FISCAL`(NM_CLIENTE, END_CLIENTE, NM_VENDEDOR, VL_TOTAL)
VALUES ('Galadriel', 'Valinor', 'Saruman', 100.00 );

SELECT * FROM `NOTA_FISCAL`;

-- Itens da Nota

INSERT INTO `ITEM_NOTA_FISCAL` (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRECO, VL_TOTAL)
VALUES (3, 1, 1, 9.00, 18.00);

INSERT INTO `ITEM_NOTA_FISCAL` (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRECO, VL_TOTAL)
VALUES (3, 2, 2, 400.00, 80.00);

INSERT INTO `ITEM_NOTA_FISCAL` (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRECO, VL_TOTAL)
VALUES (3, 3, 10, 400.00, 2000.00);

INSERT INTO `ITEM_NOTA_FISCAL` (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRECO, VL_TOTAL)
VALUES (4, 1, 1, 9.00, 18.00);

INSERT INTO `ITEM_NOTA_FISCAL` (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRECO, VL_TOTAL)
VALUES (4, 3, 2, 400.00, 820.00);

INSERT INTO `ITEM_NOTA_FISCAL` (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VL_PRECO, VL_TOTAL)
VALUES (4, 2, 12, 402.00, 2200.00);

SELECT * FROM `ITEM_NOTA_FISCAL`;













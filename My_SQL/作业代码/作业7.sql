-- 1、完成销售50台的触发器实现
-- 2、完成进已存在的货物200台的触发器实现

-- 创建数据库

CREATE DATABASE Income_Sale_Store;

-- 创建产品表

CREATE TABLE produce 
(
	produceId INT PRIMARY KEY AUTO_INCREMENT,
	produceName VARCHAR(100),
	produceDesc TEXT
);

-- 创建存储表

CREATE TABLE store
(
	storeId INT PRIMARY KEY AUTO_INCREMENT,
	storeNum INT,
	produceId INT,
	FOREIGN KEY (produceId) REFERENCES produce(produceId) ON UPDATE CASCADE
);

-- 创建进货表

CREATE TABLE income
(
	incomeId INT PRIMARY KEY AUTO_INCREMENT	,
	incomeNum INT,
	incomeTime DATETIME,
	incomePrice DOUBLE,
	produceId INT,
	FOREIGN KEY (produceId) REFERENCES produce(produceId) ON UPDATE CASCADE
);

-- 创建销售表

CREATE TABLE sale
(
	saleId INT PRIMARY KEY AUTO_INCREMENT,
	saleNum INT,
	saleTime DATETIME,
	salePrice DOUBLE,
	produceId INT,
	FOREIGN KEY (produceId) REFERENCES produce(produceId) ON UPDATE CASCADE
);

DROP TRIGGER produce_sale_trigger;

-- 1、完成销售50台的触发器实现

DELIMITER ||

CREATE TRIGGER produce_sale_trigger BEFORE INSERT ON sale
FOR EACH ROW
BEGIN
UPDATE store SET storeNum  = storeNum - @storeNum WHERE produceId = @produceId;
END||

SET @storeNum = 50;
SET @salePrice = 7000.0;
SET @produceId = 2;

INSERT INTO sale(saleNum,saleTime,salePrice,produceId) VALUE (@storeNum,NOW(), @salePrice,@produceId);

-- 2、完成进已存在的货物200台的触发器实现

DROP TRIGGER store_trigger;

DELIMITER ||

CREATE TRIGGER store_trigger AFTER INSERT ON income
FOR EACH ROW
BEGIN
UPDATE store SET storeNum  = storeNum + @incomeNum WHERE produceId = @produceId;
END ||

SET @incomeNum = 200;
SET @incomePrice = 500.0;
SET @produceId = 2;

INSERT INTO income (incomeNum,incomeTime,incomePrice,produceId) VALUE (@incomeNum,NOW(),@incomePrice,@produceId);

SELECT * FROM income;

SELECT * FROM sale;

SELECT * FROM store;

SELECT * FROM produce;
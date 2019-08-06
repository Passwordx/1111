-- 创建一张银行信息表，一张用户信息表，一张银行收益表，一张用户转账记录表。
-- 字段内容自己分析，满足三大范式
-- 通过触发器实现以下功能：
-- 当用户转账时会相应减少金额，收款方会相应的增加金额，记录转账的信息
-- 不同银行间转账收取百分之一的手续费，最低2元最高不超过50元。作为银行的收益。
-- 通过查询出相应的结果
-- 某用户的转账记录 ，某用户的收款记录 ， 银行的收益记录 

CREATE DATABASE bank_01;


-- 银行信息表

CREATE TABLE bank(
bankId INT PRIMARY KEY AUTO_INCREMENT ,
bankName VARCHAR(100) 
);

-- 用户信息表

CREATE TABLE bankUser(
bankUserId INT PRIMARY KEY AUTO_INCREMENT ,
bankUserName VARCHAR(100) ,
money DOUBLE ,
bankId INT ,
FOREIGN KEY (bankId) REFERENCES bank(bankId) ON UPDATE CASCADE 
); 

-- 银行收益表

CREATE TABLE  bankReturns(
bankReturnsId INT PRIMARY KEY AUTO_INCREMENT ,
bankReturnsNumber DOUBLE ,
bankReturnsTime DATETIME ,
bankId INT ,
FOREIGN KEY (bankId) REFERENCES bank(bankId) ON UPDATE CASCADE
);

-- 转账记录表

CREATE  TABLE transfer(
transferId INT PRIMARY KEY AUTO_INCREMENT ,
transferInput DOUBLE ,
transferOutput DOUBLE ,
transferTime DATETIME ,
bankUserId INT ,
bankId INT ,
FOREIGN KEY (bankUserId) REFERENCES bankUser(bankUserId) ON UPDATE CASCADE ,
FOREIGN KEY (bankId) REFERENCES bank(bankId) ON UPDATE CASCADE 
);


SELECT * FROM bank;

SELECT * FROM bankUser;

SELECT * FROM bankReturns;

SELECT * FROM transfer;


INSERT INTO bank (bankName) VALUES('Bank of China'),('Bank of Communications');

INSERT INTO bankUser (bankUserName,money,bankId) VALUES ('Bruce Lee',100,1),('Jackie Chan',300,2),('Blaine',200,1);

-- 当用户转账时会相应减少金额，收款方会相应的增加金额，记录转账的信息

DELIMITER ||

CREATE TRIGGER transferTrigger AFTER UPDATE ON transfer 
FOR EACH ROW 
BEGIN
INSERT INTO bankUser (money) VALUE ()
END ||


SELECT 


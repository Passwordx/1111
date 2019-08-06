作业： -- 创建一张银行信息表，一张用户信息表，一张银行收益表，一张用户转账记录表。
-- 字段内容自己分析，满足三大范式
-- 通过触发器实现以下功能：
-- 当用户转账时会相应减少金额，收款方会相应的增加金额，记录转账的信息
-- 不同银行间转账收取百分之一的手续费，最低2元最高不超过50元。作为银行的收益。
-- 通过查询出相应的结果
-- 某用户的转账记录 ，某用户的收款记录 ， 银行的收益记录 

CREATE DATABASE bankdb;
DROP DATABASE bankdb;

CREATE TABLE bank (
  bankId INT PRIMARY KEY AUTO_INCREMENT,
  bankName VARCHAR (100),
  bankAddress VARCHAR (100)
) ;

CREATE TABLE human
(
  humanId INT  AUTO_INCREMENT,
  humanBankCode VARCHAR(100) ,
  humanName VARCHAR(100),
  humanRegistTime DATETIME,
  humanMoney DOUBLE,
  bankId INT ,
  PRIMARY KEY(humanId,humanBankCode)
);

CREATE TABLE transfer
(
  transferId INT PRIMARY KEY AUTO_INCREMENT,
  transferAmount DOUBLE,
  transferTime DATETIME,
  transferHumanId INT,
  transferIncomeHumanId INT,
  transferBankId INT,
  transferIncomeBankId INT
);

CREATE TABLE income
(
  incomeId INT PRIMARY KEY AUTO_INCREMENT,
  incomeAmount DOUBLE,
  incomeTime DATETIME,
  transferId INT,
  bankId INT
);


ALTER TABLE human ADD CONSTRAINT human_1 
FOREIGN KEY (bankId) REFERENCES bank (bankId) ;

ALTER TABLE transfer ADD CONSTRAINT transfer_1
FOREIGN KEY (transferHumanId) REFERENCES human (humanId) ;

ALTER TABLE transfer ADD CONSTRAINT transfer_2 
FOREIGN KEY (transferIncomeHumanId) REFERENCES human (humanId) ;

ALTER TABLE transfer ADD CONSTRAINT transfer_3 
FOREIGN KEY (transferBankId) REFERENCES bank (bankId) ;

ALTER TABLE transfer ADD CONSTRAINT transfer_4 
FOREIGN KEY (transferIncomeBankId) REFERENCES bank (bankId) ;

ALTER TABLE income ADD CONSTRAINT income_1 
FOREIGN KEY (transferId) REFERENCES transfer (transferId) ;

ALTER TABLE income ADD CONSTRAINT income_2 
FOREIGN KEY (bankId) REFERENCES bank (bankId) ;

INSERT INTO bank (bankName,bankAddress) VALUES ('ICBC','China001'),('ABC','china002');

INSERT INTO human (humanName,humanBankCode,humanRegistTime,humanMoney,bankId)
VALUES
('LYY','123',NOW(),1000,1),
('MQH','234',NOW(),500,1),
('XJJ','345',NOW(),2000,2)

SELECT * FROM bank;
SELECT * FROM human;

-- 转账
DROP TRIGGER transferTigger;

DELIMITER ||
CREATE TRIGGER transferTigger BEFORE INSERT ON transfer
FOR EACH ROW
BEGIN
UPDATE human SET humanMoney = humanMoney - @transferAmount WHERE humanId = @transferHumanId;
UPDATE human SET humanMoney = humanMoney + @transferAmount WHERE humanId = @transferIncomeHumanId;
UPDATE human SET humanRegistTime = NOW() WHERE humanId = @transferHumanId OR humanId = @transferIncomeHumanId ;
END ||

-- LYY 转账给MQH 
-- LYY ：123  MQH：234 amount：100


SELECT @transferHumanId := humanId , @transferBankId := bankId
FROM human WHERE humanBankCode ='123';

SELECT @transferIncomeHumanId := humanId , @transferIncomeBankId := bankId 
FROM human WHERE humanBankCode ='234';

SET @transferAmount = 100;

SELECT * FROM transfer;
SELECT * FROM human;

INSERT INTO transfer (transferAmount,transferTime,transferHumanId,transferIncomeHumanId,transferBankId,transferIncomeBankId)
VALUE
(@transferAmount,NOW(),@transferHumanId,@transferIncomeHumanId,@transferBankId,@transferIncomeBankId);

DELIMITER ||

CREATE TRIGGER transferTigger BEFORE INSERT ON transfer
FOR EACH ROW
BEGIN
IF @transferBankId = @transferIncomeBankId THEN
UPDATE human SET humanMoney = humanMoney - @transferAmount WHERE humanId = @transferHumanId;
UPDATE human SET humanMoney = humanMoney + @transferAmount WHERE humanId = @transferIncomeHumanId;
ELSE
UPDATE human SET humanMoney = humanMoney - @transferAmount * 1.01 WHERE humanId = @transferHumanId;
UPDATE human SET humanMoney = humanMoney + @transferAmount WHERE humanId = @transferIncomeHumanId;
INSERT INTO income (incomeAmount,incomeTime,transferId,bankId) VALUE
(@transferAmount * 0.01 , NOW(),new.transferId,@transferBankId);
END IF ;
END ||










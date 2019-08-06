

DROP PROCEDURE p_bank;
DELIMITER ||
CREATE PROCEDURE p_bank(OUT p_bankName VARCHAR(100))
BEGIN
SELECT bankName INTO p_bankName FROM bank WHERE bankId = 1;
END; ||

CALL p_bank(@myBankName);

SELECT @myBankName;

SELECT * FROM bank WHERE bankName = @myBankName;

DELIMITER ||
CREATE PROCEDURE p_bank(OUT p_bankName VARCHAR(100) , IN p_bankId INT)
BEGIN
SELECT bankName INTO p_bankName FROM bank WHERE bankId = p_bankId;
END; ||

CALL p_bank(@myBankName , 2);
SELECT @myBankName;
SELECT * FROM bank WHERE bankName = @myBankName;

DELIMITER||
CREATE PROCEDURE bankProcedure (IN p_TransferBankCode VARCHAR(100), IN p_IncomeBankcode VARCHAR(100) ,
 IN P_BankMoney )

 BEGIN
 
 END ||

--  用存储过程计算银行转账手续费

DROP PROCEDURE p_bank;
DELIMITER ||

CREATE PROCEDURE p_bank (
  IN p_TransferBankCode VARCHAR (100),
  IN p_IncomeBankcode VARCHAR (100),
  IN P_BankMoney DOUBLE
) 
BEGIN
  DECLARE b1 INT ;
  DECLARE b2 INT ;
  DECLARE pMoney DOUBLE;
  SELECT 
    bankId INTO b1 
  FROM
    human 
  WHERE humanBankCode = p_TransferBankCode ;
  SELECT 
    bankId INTO b2 
  FROM
    human 
  WHERE humanBankCode = p_IncomeBankcode ;
  IF b1 = b2 THEN 
  UPDATE human SET humanMoney = humanMoney - P_BankMoney WHERE humanBankCode = p_TransferBankCode;
  UPDATE human SET humanMoney = humanMoney + P_BankMoney WHERE humanBankCode = p_IncomeBankcode;
  ELSE 
  SET pMoney = P_BankMoney * 0.01;
  IF pMoney <= 2 THEN SET pMoney = 2.00; END IF;
  IF pMoney >= 50 THEN SET pMoney = 50.00; END IF;
  SET myPmoney = pMoney;
  UPDATE human SET humanMoney = humanMoney - P_BankMoney - pMoney WHERE humanBankCode = p_TransferBankCode;
  UPDATE human SET humanMoney = humanMoney + P_BankMoney WHERE humanBankCode = p_IncomeBankcode;
 INSERT INTO income (incomeAmount,transferHumanId,transferIncomeHumanId) VALUE
(pMoney ,p_TransferBankCode,p_IncomeBankcode);
  END IF ;
  
END ||

CALL p_bank('123','345',10000.00 , @pm);

SELECT @pm;


SELECT * FROM human;



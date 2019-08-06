DELIMITER ||
CREATE FUNCTION myfunction()
RETURNS VARCHAR(500)
BEGIN
RETURN 'china';
END
||


SELECT * FROM human;

DROP FUNCTION myfunction

DELIMITER ||
CREATE FUNCTION myfunction()
RETURNS VARCHAR(500)
BEGIN
DECLARE hName VARCHAR(500);
SELECT humanName INTO hName FROM human WHERE humanId = 1;
RETURN hName;
END ||

SELECT myfunction();


-- 计算银行收益

SELECT * FROM human;

DROP FUNCTION myfunction
DELIMITER ||

CREATE FUNCTION myfunction (
  bcode1 VARCHAR (100),
  bcode2 VARCHAR (100),
  bMoney DOUBLE
) RETURNS DOUBLE 
BEGIN
  DECLARE bId1 INT ;
  DECLARE bId2 INT ;
  DECLARE charge DOUBLE ;
  
  SELECT 
    bankId INTO bId1 
  FROM
    human 
  WHERE humanBankCode = bcode1 ;
  
  SELECT 
    bankId INTO bId2 
  FROM
    human 
  WHERE humanBankCode = bcode2 ;
  IF bId1 != bId2 
  THEN SET charge = bMoney * 0.01 ;
  IF charge >= 50.00 
  THEN SET charge = 50.0 ;
  END IF ;
  IF charge <= 2.00 
  THEN SET charge = 2.0 ;
  END IF ;
  
  ELSE SET charge = 0.00 ;
  END IF ;
  RETURN charge ;
  
END ||

SELECT @a := myfunction('123','345' , 6000);

SELECT @a + 100;











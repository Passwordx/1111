SELECT* FROM income;

DELIMITER ||
  CREATE PROCEDURE incomeNum(IN pId INT , OUT pNum INT)
    BEGIN
      SELECT COUNT(*) INTO pNum FROM income WHERE produceId = pId;
    END ||
    
SET @PId = 1;
CALL incomeNum(1,@pNum);

SELECT * FROM produce;
SELECT * FROM store;
SELECT * FROM income;
SELECT * FROM sale;

SELECT * , SUM(s.saleNum) FROM income i INNER JOIN sale s 
ON i.produceId = s.produceId AND i.produceId = 3 GROUP BY s.saleId;


SELECT SUM(s.saleNum) FROM income i INNER JOIN sale s 
ON i.produceId = s.produceId AND i.produceId = 3;

SELECT SUM(saleNum) FROM sale WHERE produceId = 3;

SELECT 
(
(SELECT SUM(s.saleNum) * s.salePrice FROM sale s WHERE s.produceId = 3)
-
(SELECT SUM(s.saleNum) * i.incomePrice FROM sale s WHERE s.produceId = 3 )
) AS 'pofit'
FROM income i WHERE i.produceId = 3 GROUP BY i.produceId;


-- 作业修改代码

SELECT 
(
(SELECT SUM(s.saleNum) * s.salePrice FROM sale s WHERE s.produceId = 3 GROUP BY s.salePrice)
-
(SELECT SUM(s.saleNum) * i.incomePrice FROM sale s WHERE s.produceId = 3 )
) AS 'pofit'
FROM income i WHERE i.produceId = 3 GROUP BY i.produceId;

DESCRIBE produce;


DELIMITER ||
  CREATE PROCEDURE pro_CreateProduce(IN pName VARCHAR(100), IN pDesc TEXT )
    BEGIN
      INSERT INTO produce (produceName , produceDesc) VALUE (pName , pDesc);
    END ||


CALL pro_CreateProduce ('HuaWei' , 'China Phone');

--求利润   两条数据合成一条数据
SELECT 
(
(SELECT SUM(s.saleNum * s.salePrice) FROM sale s WHERE s.produceId = 3)
-
(SELECT SUM(s.saleNum) * i.incomePrice FROM sale s WHERE s.produceId = 3 )
) AS 'pofit'
FROM income i WHERE i.produceId = 3 GROUP BY i.produceId;





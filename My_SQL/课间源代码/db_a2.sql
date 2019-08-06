CREATE TABLE produce
(
  produceId INT PRIMARY KEY AUTO_INCREMENT,
  produceName VARCHAR(100),
  produceAddr TEXT
);

INSERT INTO produce ( produceName , produceAddr)
VALUE 
('computer','China');

SELECT * FROM produce;


ALTER TABLE produce ADD produceAddr1 TEXT;
ALTER TABLE produce ADD produceAddr2 TEXT;
INSERT INTO produce ( produceName , produceAddr,produceAddr1,produceAddr2)
VALUE 
('TV','China','KO','Japan1');

DROP TABLE produce;

CREATE TABLE produce
(
  produceId INT PRIMARY KEY AUTO_INCREMENT,
  produceName VARCHAR(100)
);

CREATE TABLE address
(
  addressId INT PRIMARY KEY AUTO_INCREMENT,
  addressText TEXT,
  AID INT,
  FOREIGN KEY(AID) REFERENCES produce(produceId)
);

INSERT INTO produce(produceId,produceName) VALUE (100, 'Computer');
INSERT INTO address (addressText,produceId) VALUE ('China',100) ;
INSERT INTO address (addressText,produceId) VALUE ('KO',100) ;
INSERT INTO address (addressText,produceId) VALUE ('America',100) ;

INSERT INTO produce(produceId,produceName) VALUE (20, 'TV TCL');
INSERT INTO address (addressText,produceId) VALUE ('China',20) ;

SELECT * FROM produce
SELECT * FROM address;

DELETE FROM address WHERE produceId = 20;
DELETE FROM produce WHERE produceName = 'TV TCL';

DELETE FROM address WHERE produceId = 100;
DELETE FROM produce WHERE produceName = 'Computer';

DROP TABLE address;
DROP TABLE produce;

CREATE TABLE produce
(
  produceId INT PRIMARY KEY AUTO_INCREMENT,
  produceName VARCHAR(100)
);

CREATE TABLE address
(
  addressId INT PRIMARY KEY AUTO_INCREMENT,
  addressText TEXT,
  produceId INT,
  FOREIGN KEY(produceId) REFERENCES produce(produceId)
  ON UPDATE CASCADE  ON DELETE CASCADE 
);



INSERT INTO produce(produceId,produceName) VALUE (100, 'Computer');
INSERT INTO address (addressText,produceId) VALUE ('China',100) ;
INSERT INTO address (addressText,produceId) VALUE ('KO',100) ;
INSERT INTO address (addressText,produceId) VALUE ('America',100) ;

SELECT * FROM produce;
SELECT * FROM address;

UPDATE produce SET produceId = 123 WHERE produceId = 100;
DELETE FROM produce WHERE produceId = 123;

SELECT * FROM produce;
SELECT * FROM address;


// AND  OR  &&  ||
SELECT addressText FROM address WHERE addressId = 4;
SELECT addressText FROM address WHERE addressId > 4;
SELECT addressText FROM address WHERE addressId > 4 AND addressId < 6;
SELECT * FROM address WHERE addressId != 5;

SELECT * FROM address ORDER BY addressId DESC;
SELECT * FROM address ORDER BY addressText ASC;


SELECT * FROM address  GROUP BY addressText;

SELECT * FROM address  GROUP BY addressText ORDER BY addressId;

SELECT * FROM address WHERE addressId < 12  GROUP BY addressText ORDER BY addressId;

SELECT * FROM address WHERE addressId < 12  ORDER BY addressId DESC;

DESCRIBE address

SELECT * FROM address ORDER BY addressId DESC LIMIT 3;
SELECT * FROM address ORDER BY addressId ASC LIMIT 3;

SELECT * FROM address LIMIT 5,3;

SELECT * FROM address HAVING addressId = 12;

SELECT COUNT(*) AS 'cas'  , address.* FROM address
GROUP BY addressText HAVING cas > 10 ;

INSERT INTO produce(produceId,produceName) VALUE (10, 'Hello');
INSERT INTO produce(produceId,produceName) VALUE (11, 'java');
INSERT INTO produce(produceId,produceName) VALUE (12, 'cool');

SELECT * FROM produce WHERE produceName LIKE 'c%';
SELECT * FROM produce WHERE produceName LIKE '%c%';
SELECT * FROM produce WHERE produceName LIKE '%c';









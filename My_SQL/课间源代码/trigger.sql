CREATE TABLE ONE (
  oneId INT PRIMARY KEY AUTO_INCREMENT,
  oneName VARCHAR (100),
  oneTitle VARCHAR (100)
) ;

CREATE TABLE two (
  twoId INT PRIMARY KEY AUTO_INCREMENT,
  twoName VARCHAR (100),
  twoContent VARCHAR (100),
  twoTime DATETIME
) ;

SHOW TABLES ;

-- 当插入one表是会把one表中的内容也同时插入到two表中
DELIMITER |

CREATE TRIGGER oneTrigger AFTER INSERT 
ON ONE FOR EACH ROW 
BEGIN
  INSERT INTO two (twoName, twoContent, twoTime) 
  VALUES
    (new.oneName, new.oneTitle, NOW()) ;
END |


SELECT 
  * 
FROM
  ONE ;
SELECT 
  * 
FROM
  two ;
INSERT INTO ONE (oneName, oneTitle) VALUE ('xiaoming', 'I like java') ;作业： 

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

create  table transfer(
transferId int primary key auto_increment ,
transferNumber double ,
transferTime datetime ,
bankUserId int ,
bankId int ,
foreign key (bankUserId) references bankUser(bankUserId) on update cascade ,
foreign key (bankId) references bank(bankId) on update cascade 
);


select * from bank;

select * from bankUser;

select * from bankReturns;

select * from transfer;


insert into bank (bankName) values('Bank of China'),('Bank of Communications');

insert into bankUser (bankUserName,money,bankId) values ('Bruce Lee',1000000,1),('Jackie Chan',3000000,2),('Blaine',2000000,1);


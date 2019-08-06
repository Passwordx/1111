
-- 创建数据库 medal_statistics

CREATE DATABASE medal_statistics;


-- （1）创建表 运动员(运动员标识，运动员名称，国家，昵称，参加项目)
--  奖牌（奖牌标识，名称（内容包括金、银、铜牌）；

CREATE TABLE sportsman(
sportsmanId INT PRIMARY KEY AUTO_INCREMENT ,
sportsmanName VARCHAR(100) ,
sportsmanState VARCHAR(100) ,
sportsmanNickname VARCHAR(100) ,
sportsmanEvent VARCHAR(100) 
);

CREATE TABLE medal (
medalId INT PRIMARY KEY ,
medalNmae VARCHAR(100) ,
sportsmanId INT ,
FOREIGN KEY (sportsmanId) REFERENCES sportsman(sportsmanId) 
);

-- （2）运动员表中新增字段性别（类型为字符型，值分别为'男'，'女'），生日

ALTER TABLE sportsman ADD sportsmanSex ENUM('男','女') ;

ALTER TABLE sportsman ADD sportsmanBirthday DATE ;

-- （3）用两种不同的方法分别往运动员表、奖牌表添加数据

INSERT INTO sportsman (sportsmanName,sportsmanState,sportsmanNickname,
sportsmanEvent,sportsmanSex,sportsmanBirthday) 
VALUES ('jackie Chan' , 'china' , 'boss' , 'basketball','男','1966-01-05') ,
 ('bruce Lee' , 'china' , 'tigerkin' , 'baseball','男','1955-01-05');


INSERT INTO medal VALUES (1 ,'gold',1),(2,'silver',1),(3,'copper',2);

-- （4）在（1）-（3）都完成的前提下，修改运动员性别字段类型为整型（0—女  1—男）
-- 同时把原来的数据进行转换，保证语句能够运行。

ALTER TABLE sportsman CHANGE sportsmanSex sportsmanSex INT;

UPDATE  sportsman SET sportsmanSex = 0 WHERE sportsmanSex = '女'；

UPDATE  sportsman SET sportsmanSex = 1 WHERE sportsmanSex = '男'；

-- （5）创建表来表示运动员所获奖牌的信息，要求包括获取时间，并采用与（3）不同的两种方法新增数据。

CREATE TABLE information(
informationId INT PRIMARY KEY ,
medalTime DATE ,
medalId INT ,
sportsmanId INT ,
FOREIGN KEY (medalId) REFERENCES medal(medalId) ON UPDATE CASCADE ,
FOREIGN KEY (sportsmanId) REFERENCES sportsman(sportsmanId) ON UPDATE CASCADE
);

-- （6）为了统计方便，新建国家奖牌总数统计表，字段为国家 金牌数 银牌数 铜牌数 总数，并新增数据。
-- 并依次按照金牌数、银牌数、铜牌数倒序排序

CREATE TABLE statistics(
 statisticsId INT PRIMARY KEY AUTO_INCREMENT ,
 state VARCHAR(100) ,
 goldNumber VARCHAR(100) ,
 silverNumber VARCHAR(100) ,
 copperNumber VARCHAR(100) ,
 number VARCHAR(100) , 
);

INSERT INTO  statistics (NULL , 'China', 30 , 15 , 10 , 55);

SELECT  * FROM  statistics ORDER BY goldNumber,silverNumber,copperNumber DESC;
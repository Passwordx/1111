
-- 球队名称、比赛场数、积分、胜场数、平场数、输场数、进球数、丢球数、净胜球。

CREATE DATABASE integral_01 ;

CREATE TABLE integral(integralId INT PRIMARY KEY AUTO_INCREMENT ,
teamName VARCHAR(20) , gamePlay VARCHAR(100) , integralNum DOUBLE ,
wins VARCHAR(100) , flat VARCHAR(100) , loseFew VARCHAR(100) , goals VARCHAR(100) ,
lost VARCHAR(100) , goalDifference VARCHAR(100)
);

SELECT * FROM integral;

-- 采用四种不同的方法新增6个球队数据，初始数据为球队名称（名称分别为A、B、C、D、E、F），
-- 其他字段（比赛场数、积分、胜场数、平场数、输场数、进球数、丢球数、净胜球）均为0。

INSERT INTO integral(teamName,gamePlay,integralNum,wins,flat,loseFew,goals,lost,goalDifference) 
VALUE ('A',0,0,0,0,0,0,0,0);

INSERT INTO integral(teamName,gamePlay,integralNum,wins,flat,loseFew,goals,lost,goalDifference) 
VALUES ('B',0,0,0,0,0,0,0,0),('C',0,0,0,0,0,0,0,0);

INSERT INTO integral VALUE ('4','D',0,0,0,0,0,0,0,0);

INSERT INTO integral VALUES ('5','E',0,0,0,0,0,0,0,0),('6','F',0,0,0,0,0,0,0,0);

-- （2）在进行第一轮比赛后，比赛结果为
-- A-B  2:1    C-D  0:1  E-F 0:0
-- 胜一场得3分  负一场得0分  平一场各1分，更新积分表。

UPDATE integral SET gamePlay = '1';

UPDATE integral SET integralNum = '3' WHERE teamName = 'A' OR teamName = 'D' ;

UPDATE integral SET integralNum = '1' WHERE teamName = 'E' OR teamName = 'F' ;

-- D队因为违规，需要从积分表中删除该队的信息。

DELETE FROM integral WHERE teamName = 'D';


SELECT * FROM integral ;
-- 1、创建表house、human、humanEmail、girlFriends。字段除了外键，包括id，name即可
--   要求：  house 是human的主表
--     human是humanEmail的主表
--    human是girlFriends的主表
--    house是girlFriends的主表
-- 用子查询实现：
-- （1）找出全部有女朋友的人所在的house名称（用两种方法）
-- （2）找出所有的有邮箱但是没有女朋友的人的名称。

CREATE TABLE house (
houseId INT PRIMARY KEY AUTO_INCREMENT ,
houseName varcahr(100),
houseAddr VARCHAR(100)
);


CREATE TABLE human(
humanId INT PRIMARY KEY AUTO_INCREMENT ,
humanName VARCHAR(100),
humanSex VARCHAR(30),
girlFriendsName VARCHAR(100),
houseId INT ,
FOREIGN KEY (houseId) REFERENCES house(houseId) ON UPDATE CASCADE
);

CREATE TABLE humanEmail(
humanEmailId INT PRIMARY KEY AUTO_INCREMENT ,
humanEmailName VARCHAR(100),
humanEmailCode VARCHAR(100),
humanId INT,
FOREIGN KEY (humanId) REFERENCES human(humanId) ON UPDATE CASCADE
);
 
 
CREATE TABLE girlFriends (
girlfriendsId INT PRIMARY KEY AUTO_INCREMENT ,
girlfriendsName VARCHAR(100) ,
houseId INT ,
FOREIGN KEY (girlfriendsName) REFERENCES human(girlFriendsName) ON UPDATE CASCADE ,
FOREIGN KEY (houseId) REFERENCES house(houseId) ON UPDATE CASCADE
);

SELECT houseName FROM house h1 INNER JOIN human h2 ON h1.houseId = h2.houseId WHERE girlfriendsName != NULL ;

SELECT humanName FROM human h INNER JOIN humanEmail e ON h.humanId = e,humanId WHERE  humanEmailCode != NULL
AND girlFriendsName = NULL;

-- 2、根据作业3所创建的student_score表，创建student和course（课程表），student_score分别参照student和course
-- （课程表）， 得到查询结果学生姓名  课程名称   成绩

CREATE TABLE course (
courseId INT PRIMARY KEY AUTO_INCREMENT ,
courseName VARCHAR(100) ,
);

CREATE TABLE student (
studentId INT PRIMARY KEY AUTO_INCREMENT ,
studentName VARCHAR(100) ,
studentSex VARCHAR(100) ,
studentBirthday DATE ,
courseId INT ,
FOREIGN KEY (courseId) REFERENCES course(courseId) ON UPDATE CASCADE
); 


CREATE TABLE score (
scoreId INT PRIMARY KEY AUTO_INCREMENT ,
studentId INT,
courseId INT,
number VARCHAR(100),
FOREIGN KEY (studentId) REFERENCES student(studentId) ON UPDATE CASCADE,
FOREIGN KEY (courseId) REFERENCES course(courseId) ON UPDATE CASCADE
); 


-- 3、找出数学分数比小明的所有课程的分数都高的学生姓名，用两种方法实现
-- 4、找出英语分数与小明其中一门课程相同分数的同学

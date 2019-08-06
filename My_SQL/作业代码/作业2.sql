-- 1、重新创建表student,teacher,university,collage，增加主外键约束关系。
--  （1）不考虑级联更新和级联删除
--      （a）修改学校名称
--      （b）修改学校Id
--      （c）修改学院名称、学院标识
--      （d）删除标识为1的学院
--       （e）删除名称为小明的学生

CREATE TABLE university(
universityId INT PRIMARY KEY ,
universityName VARCHAR(100),
universityStudentNum  VARCHAR(100),
universityTime DATE,
universityType VARCHAR(100),
universityAddr TEXT ,
);

CREATE TABLE collage(
collageId INT PRIMARY KEY ,
collageName VARCHAR(100),
universityId INT ,
FOREIGN KEY (universityId) REFERENCES university(universityId) ON UPDATE CASCADE
);

CREATE TABLE teacher (
teacherId INT PRIMARY KEY AUTO_INCREMENT ,
teacherName VARCHAR(100),
teacherSex VARCHAR(30),
universityId INT,
collageId INT ,
FOREIGN KEY (universityId) REFERENCES university(universityId) ON UPDATE CASCADE ,
FOREIGN KEY (collageId) REFERENCES collage(collageId) ON UPDATE CASCADE
);

CREATE TABLE student(
studentId INT PRIMARY KEY AUTO_INCREMENT ,
studentName VARCHAR(100),
studentsex VARCHAR(100),
studentBirthday DATE,
teacherId INT,
universityId INT,
collageId INT ,
FOREIGN KEY (universityId) REFERENCES university(universityId) ON UPDATE CASCADE ,
FOREIGN KEY (collageId) REFERENCES collage(collageId) ON UPDATE CASCADE ,
FOREIGN KEY (teacherId) REFERENCES teacher(teacherId) ON UPDATE CASCADE
);

INSERT INTO university (universityId,universityName,universityStudentNum,universityTime) 
VALUES (1 , 'guangxi university' , 100000, '1975-02-01'),(2 , 'nanning university' , 12000 , '1985-02-06');

INSERT INTO collage VALUES ( 4 ,'computer' , 2) , ( 5 ,'history' , 2) ,( 6 ,'math' , 2);

INSERT INTO student VALUES ( 1 ,'xiaoming' , 'male' , '1995-01-06', 1 , 2 , 3);




SELECT * FROM student;







--      （a）修改学校名称
--      （b）修改学校Id
--      （c）修改学院名称、学院标识
--      （d）删除标识为1的学院
--       （e）删除名称为小明的学生

UPDATE university SET universityName = ' nationalities university' WHERE universityId = 1 ;

UPDATE university SET universityId = 3 WHERE universityName = ' nationalities university';

UPDATE collage SET collageName = ' manage ' WHERE collageId = 1 ;

UPDATE collage SET WHERE collageId = 9 WHERE collageName = ' history ' ;

DELETE FROM collage WHERE collageId = 1 ;

DELETE FROM student WHERE studentName = 'xiaoming' ;


--  （2）考虑级联更新和级联删除
--       再次完成（a）-(e）

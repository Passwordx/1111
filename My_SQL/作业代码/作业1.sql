
CREATE DATABASE school_01;

-- 1、创建数据库study，在数据库中创建表student,teacher,university,collage。每个表至少要有三个字段。

CREATE TABLE student(
studentId INT PRIMARY KEY AUTO_INCREMENT ,
studentName VARCHAR(100),
studentsex VARCHAR(100),
studentBirthday DATE
);

CREATE TABLE teacher (
teacherId INT PRIMARY KEY AUTO_INCREMENT ,
teacherName VARCHAR(100),
teacherSex VARCHAR(30)
);

CREATE TABLE university(universityId INT PRIMARY KEY ,
universityName VARCHAR(100),
universityStudentNum  VARCHAR(100),
universityTime DATE
);

CREATE TABLE collage(
collageId INT PRIMARY KEY ,
collageName VARCHAR(100),
collageNum VARCHAR(100)
);

-- 2、在第一题student表（a)新增stuentInformation字段，text类型(b)将studentSex字段改为ssex，
-- 类型为varchar（20）。(c)将studentBirthday改名为birthDate。(d)删除studentInformation字段。
-- (e)将表名改为myStudent

ALTER TABLE student ADD stuentInformation TEXT;

ALTER TABLE student CHANGE studentSex ssex VARCHAR(20);

ALTER TABLE student CHANGE studentBirthday birthDate DATE;

ALTER TABLE student DROP stuentInformation ;

DESCRIBE student;

-- 3、对第二题的myStudent表新增数据  用四种不同的方法新增数据

INSERT INTO student(studentName,ssex,birthDate) VALUE ('xiaoming','male','1997-02-01');

INSERT INTO student(studentName,ssex,birthDate) VALUES 
('xaiohua','female','1997-06-01'),('xiaohong','female','1997-08-03');

INSERT INTO student VALUE (NULL,'xiaoli','female','1997-12-01');

INSERT INTO student VALUES (NULL,'xiaoli','female','1997-12-01'),(NULL,'xiaoQiang','male','1997-03-20');

-- 4、对第一题的表新增数据
--   （1）将所有满足1995-05-01以后出生的学生的性别改为男；
--   （2)删除1994-01-01到1994-12-31之间出生的所有学生。至少要用两种不同的方法实现。
--    (3)将性别为男或者年龄在20-23岁之间的学生生日修改为1993-03-03，用两种不同的方法实现

UPDATE student SET ssex = 'male' WHERE birthDate > '1995-05-01';

DELETE FROM student WHERE birthDate < '1994-12-31' AND birthDate > '1994-01-01' ;
 
DELETE FROM student WHERE birthDate < '1994-12-31' OR birthDate > '1994-01-01' ;

UPDATE student SET birthDate = '1993-03-03' WHERE ssex = 'male' OR  
 
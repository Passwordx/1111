CREATE DATABASE give_instruction;


-- 创建class表

CREATE TABLE class(
classId INT PRIMARY KEY AUTO_INCREMENT ,
 classAption VARCHAR(100)
);

-- 创建student表

CREATE TABLE student(
studentId INT PRIMARY KEY AUTO_INCREMENT ,
studentName VARCHAR(100),
studentGender VARCHAR(30),
classId INT,
FOREIGN KEY (classId) REFERENCES class(classId) ON UPDATE CASCADE
);

-- 创建teacher表

CREATE TABLE teacher (
teacherId INT PRIMARY KEY AUTO_INCREMENT ,
 teacherName VARCHAR(100)
);

-- 创建course表

CREATE TABLE course (
courseId INT PRIMARY KEY AUTO_INCREMENT ,
courseName VARCHAR(100),
teacherId INT,
studentId INT,
FOREIGN KEY (teacherId) REFERENCES teacher(teacherId) ON UPDATE CASCADE,
FOREIGN KEY (studentId) REFERENCES student(studentId) ON UPDATE CASCADE
);

-- 创建score表

CREATE TABLE score(
scoreId INT PRIMARY KEY AUTO_INCREMENT ,
studentId INT,
courseId INT,
number VARCHAR(100),
FOREIGN KEY (studentId) REFERENCES student(studentId) ON UPDATE CASCADE,
FOREIGN KEY (courseId) REFERENCES course(courseId) ON UPDATE CASCADE
);




-- 往上述表中新增数据，要求用到四种方法

INSERT INTO class(classAption) VALUES ('一年级一班'),('一年级二班');

INSERT INTO student(studentName,studentGender,classId) VALUES ('小明','男','1'),('小芳','女','2');

INSERT INTO student(studentName,studentGender,classId) VALUE ('小天','男','3');

INSERT INTO teacher VALUES ('1','小强'),('2','小军');

INSERT INTO course  VALUES (2,'数学',2);

INSERT INTO score(studentId,courseId,number) VALUES 
(1,1,70),(1,2,65),(2,1,55),(2,2,56),(3,1,62),(3,2,65);


-- 查询没有学全所有课的同学的学号、姓名

SELECT studentId,studentName FROM student s INNER JOIN course c ON student.studentId = course.studentId AND courseName IS NULL


SELECT * FROM student

SELECT * FROM course



CREATE TABLE card
(
  cardId INT PRIMARY KEY AUTO_INCREMENT,
  cardCode VARCHAR(100)
);

-- one to one
CREATE TABLE human
(
  humanId INT PRIMARY KEY AUTO_INCREMENT,
  humanName VARCHAR(100),
  cardId INT UNIQUE,
  FOREIGN KEY (cardId) REFERENCES card(cardId) ON UPDATE CASCADE
);

INSERT INTO card (cardCode) VALUE ('452701198302062730');

INSERT INTO human (humanName , cardId) VALUE ('LRJ' , 1);

-- one to many
CREATE TABLE email
(
  emailId INT PRIMARY KEY AUTO_INCREMENT,
  emailAddress TEXT,
  humanId INT,
  FOREIGN KEY(humanId) REFERENCES human(humanId) ON UPDATE CASCADE
);

INSERT INTO email (emailAddress , humanId) VALUES 
('lrj@sian.com' , 1),
('lrj@QQ.com' , 1),
('lrj@Gmail.com' , 1);

 UPDATE human SET humanId  = 9527 WHERE humanId = 1;
 
 
 -- many to many
 CREATE TABLE student
 (
  studentId INT PRIMARY KEY AUTO_INCREMENT,
  studentName VARCHAR(100)
 );


CREATE TABLE teacher
(
  teacherId INT PRIMARY KEY AUTO_INCREMENT,
  teacherName VARCHAR(100)
);


CREATE TABLE student_teacher_relation
(
  relationId INT PRIMARY KEY,
  teacherId INT,
  studentId INT,
  FOREIGN KEY(teacherId) REFERENCES teacher(teacherId) ON UPDATE CASCADE,
  FOREIGN KEY(studentId) REFERENCES student(studentId) ON UPDATE CASCADE
);

ALTER TABLE student_teacher_relation CHANGE relationId  relationId INT AUTO_INCREMENT ;

学生 ：小明 小红 老师： 老王 老张

小明 --+ 老王  小明 --+ 老张
小红 --+ 老王  小红 --+ 老张

INSERT INTO teacher(teacherId ,  teacherName) VALUES (123, 'laowang') , (234,'laozhang');
INSERT INTO student(studentId , studentName) VALUES (101 , 'xiaohong') , (102 , 'xiaoming');

INSERT INTO student_teacher_relation (teacherId , studentId) VALUES 
(123 , 102), (234 , 102) , (123 , 101),(234 , 101);


SELECT t.* FROM teacher t INNER JOIN student_teacher_relation str ON
t.teacherId = str.teacherId INNER JOIN student s ON s.studentId = str.studentId AND 
s.studentName = 'xiaoming';




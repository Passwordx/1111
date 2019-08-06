CREATE DATABASE relation ;

DROP DATABASE relation ;

CREATE TABLE human (
  humanId INT PRIMARY KEY AUTO_INCREMENT,
  humanName VARCHAR (100)
) ;

-- 一对一
CREATE TABLE identifyCard (
  identifyCardId INT PRIMARY KEY AUTO_INCREMENT,
  identifyCardCode VARCHAR (500),
  humanId INT UNIQUE-- 设置该字段不重复
) ;

ALTER TABLE identifyCard 
  ADD CONSTRAINT identifyCard_humanId_foreignKey FOREIGN KEY (humanId) REFERENCES human (humanId) ;

CREATE INDEX human_humanName_index 
ON human (humanName (20)) ;

CREATE INDEX identifyCard_identifyCardCode_index 
ON identifyCard (identifyCardCode (20)) ;

INSERT INTO identifyCard (identifyCardCode, humanId) 
VALUES
  ('china002', 1) ;

SELECT 
  * 
FROM
  identifyCard ;

SELECT 
  * 
FROM
  human ;

INSERT INTO human (humanName) 
VALUES
  ('xiaoming') ;

-- 一对多 一：human 多： email
CREATE TABLE email (
  emailId INT PRIMARY KEY AUTO_INCREMENT,
  emailContent VARCHAR (500),
  humanId INT
) ;

ALTER TABLE email 
  ADD CONSTRAINT email_human_humanId_foreignkey FOREIGN KEY (humanId) REFERENCES human (humanId) ;

INSERT INTO email (emailContent, humanId) 
VALUES
  ('America001', 1),
  ('japan001', 1),
  ('England002', 1) ;

SELECT 
  e.emailContent 
FROM
  email e 
  INNER JOIN human h 
    ON e.`humanId` = h.humanId 
    AND h.`humanName` = 'xiaoming' ;

CREATE TABLE teacher (
  teacherId INT PRIMARY KEY AUTO_INCREMENT,
  teacherName VARCHAR (100)
) ;

-- 多对多的关系 多：human  多: teacher
CREATE TABLE human_teacher_relation
(
teacherId INT,
humanId INT,
PRIMARY KEY(teacherId,humanId)
);

ALTER TABLE  human_teacher_relation ADD CONSTRAINT  human_teacher_relation_teacherId_foreignKey
FOREIGN KEY(teacherId) REFERENCES teacher(teacherId);
ALTER TABLE  human_teacher_relation ADD CONSTRAINT  human_teacher_relation_humanId_foreignKey
FOREIGN KEY(humanId) REFERENCES human(humanId);

INSERT INTO human (humanName) 
VALUES
  ('xiaohong') ;
  
  INSERT INTO teacher (teacherName) 
VALUES
  ('laozhang'),('laoliu'),('laojiang') ;
  
  SELECT * FROM teacher;
  
INSERT INTO human_teacher_relation (teacherId,humanId) VALUES
(3,1),(3,2),(1,1),(1,2),(2,1),(2,2);

SELECT * FROM human_teacher_relation;


-- 1、创建一个视图，用到第一次作业的学生、学院、学校表。
--   显示内容：
--   学生学号、姓名、所做学院名称、学院人数、学校名称
 
SELECT * FROM collage;

SELECT * FROM student;

SELECT * FROM university; 
 
 CREATE VIEW show_school (studentId,studentName,collageName,collageStudentNumber,universityName) AS 
 SELECT studentId,studentName,collageName,collageStudentNumber,universityName FROM 
 student s INNER JOIN university  u ON s.universityId = u.universityId
 INNER JOIN collage c ON s.collageId = c.collageId ;
 
 SELECT * FROM show_school;
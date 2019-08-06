-- 1、找出有成绩的学生姓名、性别（无成绩的不显示）；
SELECT * FROM  class;

SELECT * FROM course;

SELECT * FROM score;

SELECT * FROM student;

SELECT * FROM teacher;

SELECT studentName,studentGender FROM student s INNER JOIN score ON number != 0 GROUP BY studentName; 


-- 2、新建课程表，找出有学生成绩的课程名称，如果没有学生成绩的课程用null表示。

CREATE TABLE course (
courseId INT PRIMARY KEY AUTO_INCREMENT ,
courseName VARCHAR(100),
teacherId INT,
FOREIGN KEY (teacherId) REFERENCES teacher(teacherId) ON UPDATE CASCADE
);

SELECT courseName,COUNT(courseName) FROM  course c INNER JOIN score s ON s.number != 0 GROUP BY courseName;

SELECT IF ( (SELECT courseName FROM  course c RIGHT JOIN score s ON s.number = 0),
(UPDATE course SET courseName = 'NULL'  ),0);

-- 3、用全连接的方式把student_score表的学生标识和课程标识分别用学生姓名、课程姓名来替代（显示替代）
 
-- 4、用select-if语句来实现student_score表分数的显示，例如 90-100 显示优秀等。

-- 5、用select-case语句显示分数的等级，例如A, 显示优秀。

SELECT CASE A
WHEN A THEN '优秀' 
WHEN B THEN '良好'
WHEN C THEN '及格'
WHEN D THEN '不及格'
ELSE '输入错误' END;

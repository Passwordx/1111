-- 1、选出所有年龄大于23岁的所有女生（sex字段为0)

-- 2、选出软件学院的所有女生。

SELECT studentsex = '女' FROM student WHERE collageId = '6' ;

-- 3、选出学校类型为985，或者地址在北京或上海或广州的学校。

SELECT  universityName FROM university WHERE universityType = 985 OR universityAddr = '北京' OR
universityAddr = '上海' OR universityAddr = '广州' ;

-- 4、对student_course对学生学号为001的学生成绩倒序排序。

SELECT * FROM student_course WHERE studentId = '001' ORDER BY studentNumber DESC;

-- 5、对student_course按成绩倒序排序，如果成绩相同，分别按照学号升序，课程降序再进行排序。


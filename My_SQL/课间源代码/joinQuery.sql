CREATE TABLE leftTable
(
  leftTableId INT PRIMARY KEY,
  leftTableContent VARCHAR(100)
);

CREATE TABLE rightTable
(
  rightTableId INT PRIMARY KEY,
  rightTableContent VARCHAR(100)
);

INSERT INTO leftTable (leftTableId,leftTableContent) 
VALUES (1,'banana'),(2,'apple'),(3,'orange');

INSERT INTO rightTable (rightTableId,rightTableContent)
VALUES (3, 'LOL') , (4,'PUBG'),(7,'EA');

INSERT INTO rightTable (rightTableId,rightTableContent) VALUES (8, 'GSL') ;

SELECT * FROM leftTable;
SELECT * FROM rightTable;
 
-- LEFT JOIN 必须要有约束条件 使用on来代替where
SELECT * FROM leftTable l  LEFT JOIN rightTable r ON
l.leftTableId = r.rightTableId;

-- right join
SELECT * FROM leftTable l  RIGHT JOIN rightTable r ON
l.leftTableId = r.rightTableId;

-- inner join 内连接 可以使用 where 和 on
SELECT * FROM leftTable l INNER JOIN rightTable r WHERE
l.leftTableId = r.rightTableId;

-- 全连接

SELECT * FROM leftTable l  FULL JOIN rightTable r;

SELECT * FROM leftTable l , rightTable r ;

-- 查询will.simth的所在部门与所担任的职务。以及当前的薪资


SELECT e.employeeName , d.departmentName , j.jobName , s.salaryNumber
FROM employee e INNER JOIN relation r  
ON e.employeeId = r.employeeId AND e.employeeName='Will.Simth'
INNER JOIN department d ON d.departmentId = r.departmentId 
INNER JOIN job j ON j.jobId = r.jobId 
INNER JOIN salary s ON s.employeeId = e.employeeId GROUP BY j.jobName;



























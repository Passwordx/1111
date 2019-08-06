

DROP DATABASE employee_a2;

CREATE DATABASE  employee_a2;
-- 部门信息表
CREATE TABLE department
(
  departmentId INT PRIMARY KEY AUTO_INCREMENT,
  departmentName VARCHAR(100)
);



-- 职务信息表
CREATE TABLE job
(
  jobId INT PRIMARY KEY AUTO_INCREMENT,
  jobName VARCHAR(100),
  departmentId INT,
  FOREIGN KEY(departmentId) REFERENCES department(departmentId)
  ON UPDATE CASCADE
);

-- 员工信息表
CREATE TABLE employee
(
  employeeId INT PRIMARY KEY AUTO_INCREMENT,
  employeeName VARCHAR(100),
  employeeSex VARCHAR(100),
  employeeBirthday DATE,
  employeeEntry DATE,
  employeeOut DATE
)
-- 员工与部门以及部门和职务之间的关系表
CREATE TABLE relation
(
  relationId INT PRIMARY KEY AUTO_INCREMENT,
  departmentId INT ,
  jobId INT,
  employeeId INT,
  FOREIGN KEY(departmentId) REFERENCES department(departmentId)
  ON UPDATE CASCADE,
  FOREIGN KEY(jobId) REFERENCES job(jobId)
  ON UPDATE CASCADE,
  FOREIGN KEY(employeeId) REFERENCES employee(employeeId)
  ON UPDATE CASCADE
);

-- 薪资信息表
CREATE TABLE salary
(
  salaryId INT PRIMARY KEY AUTO_INCREMENT,
  salaryNumber  DOUBLE,
  salaryTime DATETIME,
  employeeId INT,
  FOREIGN KEY(employeeId) REFERENCES employee(employeeId)
  ON UPDATE CASCADE
);

CREATE TABLE schedul
(
  schedulId INT PRIMARY KEY AUTO_INCREMENT,
  schedulTime DATE,
  schedulContent TEXT,
  departmentIdOld INT,
  departmentIdNew INT,
  jobIdOld INT,
  jobIdNew INT,
  employeeId INT,
  FOREIGN KEY(departmentIdOld) REFERENCES department(departmentId)
  ON UPDATE CASCADE,
  FOREIGN KEY(departmentIdNew) REFERENCES department(departmentId)
  ON UPDATE CASCADE,
  FOREIGN KEY(jobIdOld) REFERENCES job(jobId)
  ON UPDATE CASCADE,
  FOREIGN KEY(jobIdNew) REFERENCES job(jobId)
  ON UPDATE CASCADE,
  FOREIGN KEY(employeeId) REFERENCES employee(employeeId)
  ON UPDATE CASCADE
);

DESCRIBE department;
-- 创建部门信息
INSERT INTO department (departmentId,departmentName) VALUES (NULL , 'HR') , (NULL , 'Technology');
1

-- 创建部门对应的职务
SELECT * FROM job ; 

INSERT INTO job (jobName,departmentId) 
SELECT 'manager' , departmentId FROM department WHERE departmentName = 'HR';

INSERT INTO job (jobName,departmentId) 
SELECT 'HR director' , departmentId FROM department WHERE departmentName = 'HR';


INSERT INTO job (jobName,departmentId) 
SELECT 'coding' , departmentId FROM department WHERE departmentName = 'Technology';

INSERT INTO job (jobName,departmentId) 
SELECT 'Test' , departmentId FROM department WHERE departmentName = 'Technology';

-- 创建一个员工信息
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM job;

INSERT INTO employee (employeeName,employeeSex,employeeBirthday) 
VALUES
('will.Simth','sir','1967-08-08');

-- will.simth是HR部门的经理 ，又是Technology部门的coding
INSERT INTO relation(departmentId,jobId,employeeId)
VALUES (1,1,1),(2,3,1);
SELECT * FROM relation;


SELECT j.jobName , e.employeeName , d.departmentName 
FROM job j INNER JOIN relation r ON j.jobId = r.jobId
INNER JOIN employee e ON e.employeeId = r.employeeId AND e.employeeName = 'will.Simth'
INNER JOIN department d ON d.departmentId = r.departmentId;

-- 发工资 20000元
SELECT * FROM salary;
INSERT INTO salary(salaryNumber,salaryTime,employeeId) VALUE
(20000.00 , NOW(),1);

SELECT e.employeeName , s.salaryNumber , s.salaryTime
FROM employee e INNER JOIN salary s ON e.employeeId = s.employeeId
ORDER BY salaryTime DESC LIMIT 1;

SELECT * FROM employee;
INSERT INTO  schedul(`schedulTime`,`schedulContent`,`departmentIdOld`,`departmentIdNew`,`jobIdOld`,`jobIdNew`,`employeeId`)
VALUES
`schedul`

UPDATE relation SET `departmentId` = 1 , `jobId` = 2 WHERE `relationId` = 1;

SELECT * FROM schedul;
DESCRIBE schedul;`relation`






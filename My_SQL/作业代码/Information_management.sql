
-- 建立雇员管理数据库
CREATE DATABASE employee_management;

-- 建立部门信息表
CREATE TABLE department(
departmentId INT PRIMARY KEY AUTO_INCREMENT ,
departmentName VARCHAR(100) ,
departmentNumber VARCHAR(100)
);

-- 建立职务信息表
CREATE TABLE job(
jobId INT PRIMARY KEY AUTO_INCREMENT ,
jobName VARCHAR(100) ,
departmentId INT,
FOREIGN KEY(departmentId) REFERENCES department(departmentId) ON UPDATE CASCADE
);

-- 建立员工信息表
CREATE TABLE employee
(
employeeId INT PRIMARY KEY AUTO_INCREMENT,
employeeName VARCHAR(100),
employeeSex VARCHAR(100),
employeeBirthday DATE
);

-- 建立部门、职务、员工之间的关系表
CREATE TABLE relation
(
relationId INT PRIMARY KEY AUTO_INCREMENT,
departmentId INT ,
jobId INT ,
employeeId INT ,
FOREIGN KEY(departmentId) REFERENCES department(departmentId) ON UPDATE CASCADE ,
FOREIGN KEY(jobId) REFERENCES job(jobId) ON UPDATE CASCADE ,
FOREIGN KEY(employeeId) REFERENCES employee(employeeId) ON UPDATE CASCADE
);

-- 建立工资表
CREATE TABLE salary(
salaryId INT PRIMARY KEY AUTO_INCREMENT ,
salaryNumber  DOUBLE ,
salaryTime DATETIME ,
employeeId INT ,
FOREIGN KEY(employeeId) REFERENCES employee(employeeId) ON UPDATE CASCADE
);

-- 建立绩效表
CREATE TABLE performance(
performanceId INT PRIMARY KEY AUTO_INCREMENT ,
performancePoint DOUBLE ,
salaryId INT ,
FOREIGN KEY(salaryId) REFERENCES salary(salaryId) ON UPDATE CASCADE
);

-- 建立入职表
CREATE TABLE entry(
entryId INT PRIMARY KEY AUTO_INCREMENT ,
entryTime DATE ,
employeeId INT ,
FOREIGN KEY(employeeId) REFERENCES employee(employeeId) ON UPDATE CASCADE
);

-- 建立离职表
CREATE TABLE dimission(
dimissionId INT PRIMARY KEY ,
dimissionTime DATE ,
employeeId INT ,
FOREIGN KEY(employeeId) REFERENCES employee(employeeId) ON UPDATE CASCADE
);

-- 建立人事调动表
CREATE TABLE transfer (
transferId INT PRIMARY KEY AUTO_INCREMENT ,
transferTime DATE ,
transferPost VARCHAR(100) ,
employeeId INT ,
FOREIGN KEY(employeeId) REFERENCES employee(employeeId) ON UPDATE CASCADE
);
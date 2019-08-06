SELECT * FROM employee;
SELECT * FROM department;

-- 查询will.smith所在的部门。


SELECT  employeeId FROM employee WHERE employeeName = 'Will.Simth';

SELECT departmentId FROM relation WHERE employeeId = 1; 

SELECT * FROM department WHERE departmentId = 1 OR departmentId = 2;
 
-- ANY SOME     IN ALL  
SELECT * FROM department WHERE departmentId = SOME
(SELECT departmentId FROM relation WHERE employeeId = (
SELECT  employeeId FROM employee WHERE employeeName = 'Will.Simth'
));

-- 查询will.simth的所在部门与所担任的职务。以及当前的薪资
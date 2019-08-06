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
-- 员工、部门、职务之间的关系表
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


-- 人事调动表

CREATE TABLE transfer (
transferId INT PRIMARY KEY AUTO_INCREMENT,
new_jobId INT,
old_jobId INT,
employeeId INT,
FOREIGN KEY (new_jobId) REFERENCES job(jobId),
FOREIGN KEY (old_jobId) REFERENCES job(jobId),
FOREIGN KEY (employeeId) REFERENCES employee(employeeId),
);

-- 入职、离职表

CREATE TABLE entry_dimission(
entry_dimissionId INT PRIMARY KEY AUTO_INCREMENT,
entryTime DATE,
dimissionTime DATE,
dimissionCause VARCHAR(100),
employeeId INT ,
FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);

-- 考勤表

CREATE TABLE  checkIn(
checkinId INT PRIMARY KEY AUTO_INCREMENT,
absenteeismTime DATE,
absenteeismDays VARCHAR(40),
attendanceDays VARCHAR(40),
employeeId INT,
FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);

-- 请假表

CREATE TABLE ask_leave(
ask_leaveId INT PRIMARY KEY AUTO_INCREMENT,
ask_leaveTime DATETIME,
ask_leaveCause VARCHAR(100),
checkinId INT ,
FOREIGN KEY (checkinId) REFERENCES checkin(checkinId)
);


-- 奖惩表

CREATE TABLE reward_punishment(
reward_punishmentId INT PRIMARY KEY AUTO_INCREMENT,
rewards DOUBLE ,
rewardsCause VARCHAR(100),
punishment DOUBLE,
punishmentCause VARCHAR(100)
checkinId INT ,
employeeId INT,
FOREIGN KEY (checkinId) REFERENCES checkin(checkinId),
FOREIGN KEY (employeeId) REFERENCES employee(employeeId)
);


-- 绩效表

CREATE TABLE performance(
performanceId INT PRIMARY KEY AUTO_INCREMENT,
performancePoint DOUBLE,
salaryId INT ,
FOREIGN KEY (salaryId) REFERENCES salary(salaryId)
);
drop table if exists department;

drop table if exists employee;

drop table if exists job;

drop table if exists transfer;

drop table if exists quit;

drop table if exists relation;

drop table if exists salary;

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   departmentId         int not null,
   departmentName       varchar(100),
   primary key (departmentId)
);

alter table department comment 'department';

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee
(
   employeeId           int not null auto_increment,
	 employeeNumber       int,
   employeeName         varchar(100),
   employeeGender       varchar(100),
   employeeBirthday     date,
	 employeeNativePlace  varchar(100),
   employeeAddress      varchar(100),
   employeePhone        varchar(100),
	 employeeEmail        varchar(100),
   employeeHireDate     date,
	 employeeEducation    varchar(100),
	 employeeMajor        varchar(100)
	 employeeNation       varchar(100),
	 employeeMarriage     varchar(100),
   primary key (employeeId)
);

alter table employee comment 'employee';

/*==============================================================*/
/* Table: job                                                   */
/*==============================================================*/
create table job
(
   jobId                int not null,
   jobName              varchar(100),
	 jobDescribe          text,
   departmentId         varchar(100),
   primary key (jobId)
);

alter table job comment 'job';

/*==============================================================*/
/* Table: promote                                               */
/*==============================================================*/
create table transfer
(
   transferId            int not null,
   employeeId            int,
   transferDate          date,
   transferOldJobId      int,
   transferNewJobId      int,
	 transferType          varchar(100),
	 transferReasons       text,	 
   primary key (transferId)
);

alter table transfer comment 'transfer';

/*==============================================================*/
/* Table: quit                                                  */
/*==============================================================*/
create table quit
(
   employeeId           int not null,
   quitDate             date,
	 quitPreviousJobId    int,
	 quitReasons          text,	
   primary key (employeeId)
);

alter table quit comment 'quit';

/*==============================================================*/
/* Table: relation                                              */
/*==============================================================*/
create table relation
(
   relationId           int not null,
   employeeId           int,
   jobId                int,
   departmentId         int,
   primary key (relationId)
);

alter table relation comment 'relation';

/*==============================================================*/
/* Table: salary                                                */
/*==============================================================*/
create table salary
(
   salaryId             int not null,
   transferId           int,
   salaryAmount         double,
   salaryDate           date,
   primary key (salaryId)
);

alter table salary comment 'salary';

alter table job add constraint FK_Reference_4 foreign key (departmentId)
      references department (departmentId) on delete restrict on update restrict;
			
alter table promote add constraint FK_Reference_17 foreign key (promoteOldJobId)
      references job (jobId) on delete restrict on update restrict;

alter table promote add constraint FK_Reference_18 foreign key (promoteNewJobId)
      references job (jobId) on delete restrict on update restrict;

alter table promote add constraint FK_Reference_7 foreign key (employeeId)
      references employee (employeeId) on delete restrict on update restrict;

alter table quit add constraint FK_Reference_13 foreign key (employeeId)
      references employee (employeeId) on delete restrict on update restrict;

alter table quit add constraint FK_Reference_5 foreign key (quitPreviousJobId)
      references job (jobId) on delete restrict on update restrict;

alter table relation add constraint FK_Reference_1 foreign key (employeeId)
      references employee (employeeId) on delete restrict on update restrict;

alter table relation add constraint FK_Reference_2 foreign key (jobId)
      references job (jobId) on delete restrict on update restrict;

alter table relation add constraint FK_Reference_3 foreign key (departmentId)
      references department (departmentId) on delete restrict on update restrict;

alter table salary add constraint FK_Reference_8 foreign key (transferId)
      references transfer (transferId) on delete restrict on update restrict;

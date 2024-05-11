create database organization;
use organization;

create table [employee history](
empid int primary key ,
empname varchar(40) not null,
designation varchar(45) not null,
salary money check(salary >18000),
dob date not null,
department varchar(45) not null,
joiningdate date default getdate(),
country varchar(45) not null,
city varchar(45) default 'plz fill',
gender varchar(45),
qualification varchar(45) not null,
phoneno varchar(45) unique,
cnic varchar(45) unique,
email varchar(45) unique default 'plz enter email'

)


select * from [employee history]

insert into [employee history] values (1,'Areeba','student',45000,'2003/7/24','BSSE','2021/2/14','Pakistan','karachi','Female','Intermediate','0325-6576868','42000-45676687-9','sp22bsse0041@maju.edu.pk');
insert into [employee history](empid,empname,designation,salary,dob,department,joiningdate,country,city,gender,qualification,phoneno,email) values (2,'Aisha','student',45000,'2002/12/6','BSSE','2021/2/14','Pakistan','karachi','Female','Intermediate','0325-6545568','sp22bsse0051@maju.edu.pk');
insert into [employee history](empid,empname,designation,salary,dob,department,joiningdate,country,gender,qualification,phoneno,cnic,email) values (3,'Hira','Teacher',77000,'1999/12/6','BSCS','2022/2/14','Pakistan','Female','MSSE','0345-654776568','42000-46475786-7','sp22bsse0061@maju.edu.pk');
insert into [employee history](empid,empname,designation,salary,dob,department,joiningdate,country,gender,qualification,phoneno,cnic,email) values (4,'Hina','Teacher',87000,'1997/10/6','BSCS','2022/2/14','Pakistan','Female','MSSE','0345-654444568','42000-46475786-8','sp22bsse0071@maju.edu.pk');
insert into [employee history](empid,empname,designation,salary,dob,department,joiningdate,country,gender,qualification,phoneno,cnic,email) values (5,'Laraib','Employee',85600,'2003/10/6','BSPH','2022/2/14','Bangladesh','Female','BSPH','0345-65433368','42000-46475222-5','sp22bsse0081@maju.edu.pk');
insert into [employee history] values (6,'Alishba','student',77000,'2002/7/24','MSSE','2021/2/14','India','Lahore','Female','Bachelors','0325-6222868','42000-45671117-2','sp22bsse0091@maju.edu.pk');
insert into [employee history] values (7,'Zoella','student',97000,'2001/7/24','MSSE','2021/2/14','Turkey','Islamabad','Female','Maters','0325-611168','42000-4568887-1','sp22bsse0001@maju.edu.pk');
insert into [employee history] values (8,'Salama','student',94000,'2003/7/24','BSCS','2022/2/14','Turkey','Islamabad','Female','Maters','0325-600068','42000-4500087-1','sp22bsse0003@maju.edu.pk');
insert into [employee history] values (9,'Marayam','student',96000,'2002/7/24','BSCS','2022/2/14','Turkey','Islamabad','Female','Bachelors','0325-6123068','42000-4533387-1','sp22bsse0004@maju.edu.pk');
insert into [employee history](empid,empname,designation,salary,dob,department,country,gender,qualification,phoneno,cnic,email) values (10,'Amna','Teacher',66000,'2003/7/24','BSSE','Turkey','Female','Bachelors','0325-6144468','42000-4537777-1','sp22bsse0006@maju.edu.pk');





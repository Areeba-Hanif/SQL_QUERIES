create database join2
use join2

create table employee(
empid int primary key,
empname varchar(50),
empno bigint
)
insert into employee values(101,'Ashish',9746455545),(102,'Raj',9742347545),(103,'Vivek',9746111335),(104,'Shantanu',973335545),(105,'Khanak',97123545)
select * from employee

create table employment(
empid int primary key,
profile varchar(50),
country varchar(50),
joindate date
)
update employment set empid=104 where profile='Data Analyst'

insert into employment values(101,'Content writer','Germany','2021-04-20'),(102,'Data Analyst','India','2022-04-20'),(103,'Software Engineer','India','2023-04-20'),(104,'Developemnt Executive','Europe','2020-04-20'),(105,'Marketign Manager','Mexico','2021-04-20')
select * from employment


select employee.empid,employee.empname,employee.empno,employment.profile,employment.country
from employee join employment on employee.empid=employment.empid



create table Tb1_employee(
empid int primary key,
empname varchar(50),
empno bigint
)
insert into Tb1_employee values(101,'Ashish',9746455545),(102,'Raj',9742347545),(103,'Vivek',9746111335),(104,'Shantanu',973335545),(105,'Khanak',97123545)
select * from tb1_employee


create table Tb2_employment(
empid int primary key,
profile varchar(50),
country varchar(50),
joindate date
)
insert into Tb2_employment values(101,'Content writer','Germany','2021-04-20'),(102,'Data Analyst','India','2022-04-20'),(103,'Software Engineer','India','2023-04-20'),(104,'Developemnt Executive','Europe','2020-04-20'),(105,'Marketign Manager','Mexico','2021-04-20')

select * from Tb2_employment


select Tb1_employee.empname,Tb1_employee.empno,Tb2_employment.profile,Tb2_employment.joindate
from Tb1_employee left join Tb2_employment 
on Tb1_employee.empid=Tb2_employment.empid


select Tb1_employee.empname,Tb1_employee.empno,Tb2_employment.profile,Tb2_employment.joindate
from Tb1_employee left join Tb2_employment 
on Tb1_employee.empid=Tb2_employment.empid


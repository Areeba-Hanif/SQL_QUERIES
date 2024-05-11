create database  LAB_12
use LAB_12
create table Info(
id int identity(1,1),
name varchar (45),
email varchar(50),
country varchar(45),
dob date
)
insert into Info values('Areeba','areeba111@gmail.com','pakistan','2023-12-12');
insert into Info values('Aisha','aisha111@gmail.com','Turkey','2023-11-4');
select * from Info

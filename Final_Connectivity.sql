create database final_practise_winForm
use final_practise_winForm
create table Employees(
id int identity(1,1),
name varchar(45),
email varchar(45),
country varchar(45),
password varchar(45),
gender varchar(45),
dob date,
age tinyint,
picture varchar(MAX)
)

select * from Employees
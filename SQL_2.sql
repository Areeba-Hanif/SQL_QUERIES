create database dbms
use dbms

create table products(
productname varchar(45),
price int,
quantity int
)

select * from dbms.dbo.products
insert into products values('pen',50,10),('pencil',20,15),('eraser',10,20);

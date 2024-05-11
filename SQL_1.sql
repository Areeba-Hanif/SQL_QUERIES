select * from [employee history]

select * from [employee history] where cnic is  null
select * from [employee history] where cnic is not  null
select distinct count (distinct empname) from [employee history]
update [employee history] set empname ='Bushra' where empid=8
update [employee history] set designation ='CEO' where city ='islamabad'

select city,salary from [employee history] order by empname
alter table info add  hobby varchar(50)
alter table info add id int
 






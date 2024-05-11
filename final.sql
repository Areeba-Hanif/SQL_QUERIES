create table practise(
id int identity(1,1),
name varchar(45),
age tinyint,
country varchar(45),
amount money
)

alter table practise add constraint pk_0000012abc primary key(id)
select * from practise

insert into practise values('arwa',9,'turkey',7000);
update practise set name ='aisha' where age=10

select * from practise where id in  (select min(age) from practise)
select * from practise where id =  (select min(age) from practise)
select * from practise where age =any(select  age from practise where age=10)
select * from practise
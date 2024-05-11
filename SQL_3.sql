create database [dbms 1]
use [dbms 1]

create table info(
id varchar(25),
fname varchar(35),
lname varchar(35),
age tinyint,
country varchar(35)
)


insert into info values ('SP22-BSSE-0041','areeba','hanif',20,'pakistan');
insert into info values ('SP22-BSSE-0021','aisha','nazir',21,'india');
insert into info values ('SP22-BSSE-0031','soha','abdullah',19,'china');
insert into info values ('SP22-BSSE-0020','areeba','khalid',20,'pakistan');
insert into info values ('SP22-BSSE-0002','laraib','bhatti',21,'iran');
insert into info values (' SP22-BSSE-0001 ',' laiba','bha tti',21,'iran');

insert into info (fname,lname) values ('naz', 'muhammad');

select fname,lname from info;
select distinct country from info; /* selects different countries only*/
select * from info where country='Pakistan';
select * from info where fname='areeba';
select * from info where age<20;
select * from info where age between 20 and 21;
select * from  info order by age;
select * from  info order by country;
select fname,lname from  info order by age;
select fname,lname from  info order by fname;
select fname,lname from  info order by fname desc; /* in descending order  and by default in ascending order */
select * from  info order by fname desc,lname asc;
select * from info where lname like '%f';
select * from info where lname not like '%f';
select * from info where fname ='areeba' and lname like 'h%';
select * from info where fname ='areeba' and lname like 'k%';
select * from info where fname ='areeba' or lname like 'u%';
select * from info where age is null;
select * from info where age is not null;

update info set fname='hina',lname='hanif' where fname ='naz';
delete from info where id is null;
select * from info;

select trim('# 'from '# android seekho') as trimmedString; 
select ltrim('       android seekho           ') as leftTrimmedString; 
select rtrim('       android seekho           ') as rightTrimmedString; 
select DATALENGTH(' #android seekho');
select len(' #android seekho');
select left(fname,3) from info;
select right(fname,3) from info;
select upper(fname) from info;
select lower(fname) from info;
select substring (fname,1,5) from info;
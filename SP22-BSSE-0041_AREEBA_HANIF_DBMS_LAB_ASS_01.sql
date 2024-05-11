create database assignment1
use assignment1

create table customers (
customer_id int primary key,
first_name varchar(45) ,
last_name varchar(45) ,
email varchar(45),
phone varchar(45)

)
insert into customers values(1,'areeba','hanif','areeba.hanif222@gmail.com','3647856475') ,(2,'laraib','bhatti','laraib.bhatti222@gmail.com','4645758922'),(3,'aisha','hanif','aisha.hanif222@gmail.com','0346-585745');
insert into customers values(4,'laiba','khalid','laiba.khalid222@gmail.com','36478345455') ,(5,'arwa','fatima','arwa.fatima222@gmail.com','36111111455')


create table orders (
order_id int primary key,
customer_id int foreign key references customers(customer_id),
order_date date,
total_amount money 

)
insert into orders values (1,1,'2023/11/2',4500),(2,2,'2023/11/1',6750),(3,3,'2023/10/24',3500);
insert into orders values (4,4,'2023/6/22',1200),(5,5,'2023/10/15',2200)


select * from customers
select * from orders

----------------------------Q1 QUERY-----------------------

select c.first_name,count(o.order_id) as [order_count],
sum(o.total_amount) as [total_amount_spent] , o.order_date
from customers c, orders o
where c.customer_id = o.customer_id
and o.order_date >= DATEADD(DAY, -30, GETDATE())
group by c.customer_id, c.first_name,o.order_date;

----------------------------Q2 QUERY-----------------------

select c.first_name,sum(total_amount) as [total_amount_spent]
from customers c, orders o
where c.customer_id = o.customer_id
group by c.customer_id, c.first_name
order by total_amount_spent desc


----------------------------Q3 QUERY-----------------------

select c.first_name,avg(total_amount) as [average_order_amount]
from customers c,orders o 
where c.customer_id = o.customer_id
group by c.customer_id,c.first_name


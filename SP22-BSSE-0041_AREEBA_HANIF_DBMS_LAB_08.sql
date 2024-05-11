create database hotel_information
use hotel_information


create table Hotel (
	Hotel_ID int primary key,
	Hotel_Name varchar(50) ,
	City varchar(50)
);

insert into Hotel values(420,'Ramada Plaza','Islamabad'),(421,'PC Hotel','Islamabad'),(422,'Movenpick','Karachi'),(423,'Movenpick','Islamabad'),(424,'Movenpick','Karachi'),(425,'PC Hotel','Karachi'),(426,'Movenpick','Islamabad'),(427,'PC Hotel','Islamabad')
select * from Hotel

create table Room (
	Room_Number  int primary key, 
	Hotel_ID int foreign key references Hotel(Hotel_ID),
	Room_Type varchar(50),
	Price money
);

insert into Room values(420,420,'King Size',50000),(421,421,'Normal',60000),(422,422,'Standard',50000),(423,423,'Normal',80000),(424,424,'Small Size',70000),(425,425,'Standard',56000),(426,426,'Standard',56000),(427,427,'King Size',90000)
select * from Room

create table Guest (
	Guest_ID int primary key,
	Guest_Name varchar(50),
	Guest_Address varchar(50)
);
insert into Guest values (420,'ABC','abc,karachi'),(421,'XYZ','xyz,karachi'),(422,'ABC','abc,islamabad'),(423,'XYZ','xyz,karachi'),(424,'PQR','pqr,islamabad')
insert into Guest values(426,'Mr Raza','Parsi colony karachi')
insert into Guest values(427,'Mr Hasan','khudadad colony Lahore')
select * from Guest

create table Stay (
	Date_From date,
	Date_To date, 
	Room_Number int foreign key references Room(Room_Number),
	Guest_ID int foreign key references Guest(Guest_ID), 
	Hotel_ID int foreign key references Hotel(Hotel_ID)
);

insert into Stay values('2023-03-23','2022-12-15',420,420,420), ('2023-03-23','2023-06-15',421,421,421),('2023-08-23','2023-12-15',422,422,422),('2023-03-23','2023-12-15',423,423,423),('2023-03-23','2023-03-15',424,424,424),('2023-08-12','2023-12-23',425,425,425),('2023-08-12','2023-12-23',426,426,426),('2023-08-12','2023-08-23',427,427,427)
select * from Stay


----------------------------QUERY 01------------------------
select count(Guest.Guest_ID) as[Total number of Guests] from Guest
join Stay on
Guest.Guest_ID = Stay.Guest_ID 
join Hotel
on Stay.Hotel_ID=Hotel.Hotel_ID
where  Hotel.Hotel_Name='PC hotel'  and  (month(Stay.Date_From)=8 or month(Stay.Date_To)=8)

----------------------------QUERY 02------------------------

select Room.Price,Room.Room_Number ,Hotel.Hotel_Name from Room 
join Hotel on Room.Hotel_ID=Hotel.Hotel_ID
where Room.Room_Type='King Size'


----------------------------QUERY 03------------------------
select Guest.Guest_Name from Guest 
join Stay on Guest.Guest_ID=Stay.Guest_ID
join Hotel on Stay.Hotel_ID=Hotel.Hotel_ID 
where Hotel.City='Islamabad'
----------------------------QUERY 04------------------------
select Guest.Guest_Name,Guest.Guest_ID from Guest 
join Stay on Guest.Guest_ID=Stay.Guest_ID
join Room on Stay.Room_Number=Room.Room_Number
join Hotel on Room.Hotel_ID=Hotel.Hotel_ID
where Hotel.Hotel_Name='Ramada Plaza' and Room.Room_Number=420
and (Stay.Date_From='2022-03-23' or Stay.Date_To='2022-03-23')

----------------------------QUERY 05------------------------
select count(Room.Room_Number) as [Total number of Rooms] from Room 
join Hotel on Room.Hotel_ID=Hotel.Hotel_ID
where Room.Room_Type='Standard' and Hotel.Hotel_Name='Movenpick'


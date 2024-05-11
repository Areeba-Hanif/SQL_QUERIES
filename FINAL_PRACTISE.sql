create database Final
use Final

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(50),
    PublishedYear INT
);

-- Author Table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255),
    BirthYear INT,
    Nationality VARCHAR(100)
);


-- Member Table
CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Address VARCHAR(500),
    PhoneNumber VARCHAR(15)
);

-- BorrowedBooks Table
CREATE TABLE BorrowedBooks (
    TransactionID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);


-- Inserting data into Book Table
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
(3, '1984', 'George Orwell', 'Dystopian', 1949);
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES(4,'My Favourite Book','Me','Self',2021);
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES(5, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925)
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES(6,'Peer e Kamil','Umera Ahmed','Religious',2021);
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear,AuthorID) VALUES(7,'AAb e hayat','Umera Ahmed','Religious',2021,7);


-- Inserting data into Author Table
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(1, 'F. Scott Fitzgerald', 1896, 'American'),
(2, 'Harper Lee', 1926, 'American'),
(3, 'George Orwell', 1903, 'British');
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(5, 'Areeba Hanif', 2003, 'Pakistani')

INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(6, 'Eman Zahra', 2019, 'Pakistani')
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(9, 'Eshal Fatima', 2019, 'Turkish')
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(7, 'Eshal Fatima', 2019, 'Turkish')
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(4, 'Eshal Fatima', 2019, 'Turkish')
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(12, 'Areeba Hanif', 2002, 'Pakistani')
-- Inserting data into Member Table

INSERT INTO Member (MemberID, FirstName, LastName, Address, PhoneNumber) VALUES
(1, 'John', 'Doe', '123 Main St, City', '555-1234'),
(2, 'Jane', 'Smith', '456 Oak Ave, Town', '555-5678'),
(3, 'Bob', 'Johnson', '789 Pine Rd, Village', '555-9876');

-- Inserting data into BorrowedBooks Table
INSERT INTO BorrowedBooks (TransactionID, BookID, MemberID, BorrowDate, ReturnDate) VALUES
(1, 1, 1, '2024-01-01', '2024-01-15'),
(2, 2, 2, '2024-02-01', '2024-02-14'),
(3, 3, 3, '2024-03-01', '2024-03-10');

-- Publisher Table
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(255),
    FoundedYear INT,
    HQLocation VARCHAR(500)
);

-- BookPublisher Table
CREATE TABLE BookPublisher (
    BookID INT,
    PublisherID INT,
    PRIMARY KEY (BookID, PublisherID),

    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- LibraryBranch Table
CREATE TABLE LibraryBranch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255),
    Location VARCHAR(500)
);

-- BookCopy Table
CREATE TABLE BookCopy (
    CopyID INT PRIMARY KEY,
    BookID INT,
    BranchID INT,
    AvailabilityStatus VARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (BranchID) REFERENCES 

LibraryBranch(BranchID)
);

-- Inserting data into Publisher Table
INSERT INTO Publisher (PublisherID, PublisherName, FoundedYear, HQLocation) VALUES
(1, 'Penguin Books', 1935, 'New York, USA'),
(2, 'HarperCollins', 1989, 'London, UK'),
(3, 'Random House', 1927, 'New York, USA');

-- Inserting data into BookPublisher Table
INSERT INTO BookPublisher (BookID, PublisherID) VALUES
(1, 1),
(2, 2),
(3, 3);


-- Inserting data into LibraryBranch Table
INSERT INTO LibraryBranch (BranchID, BranchName, Location) VALUES
(1, 'Main Library', 'City Center, City'),
(2, 'North Branch', 'North Suburb, Town'),
(3, 'South Branch', 'South Suburb, Town');

-- Inserting data into BookCopy Table
INSERT INTO BookCopy (CopyID, BookID, BranchID, AvailabilityStatus) VALUES
(1, 1, 1, 'Available'),
(2, 2, 2, 'Checked Out'),
(3, 3, 3, 'Available');



select * from Author
select * from Book
select * from BookCopy
select * from BookPublisher
select * from BorrowedBooks
select * from LibraryBranch
select * from Member
select * from Publisher

----------------Joins --------------------------
select Book.AuthorID , Book.Genre,Book.Title,Author.AuthorID,Author.AuthorName,Author.Nationality from Book full outer join Author on Book.AuthorID=Author.AuthorID
select Book.AuthorID , Book.Genre,Book.Title,Author.AuthorID,Author.AuthorName,Author.Nationality from Book left join Author on Book.AuthorID=Author.AuthorID
select Book.AuthorID , Book.Genre,Book.Title,Author.AuthorID,Author.AuthorName,Author.Nationality from Book right join Author on Book.AuthorID=Author.AuthorID
select Book.AuthorID , Book.Genre,Book.Title,Author.AuthorID,Author.AuthorName,Author.Nationality from Book cross join Author 
select b.Title as[Book Title] ,a.Title as[Author Book ],b.BookID,a.AuthorID  from Book b ,Book a where b.BookID=a.AuthorID

alter table Book add  AuthorID int foreign key references Author(AuthorID)
update  Book set AuthorID = 7 where BookID=7

---------------variables , Conditionals & Loops-------------------------

--declare @name varchar(45) ='Areeba';
--declare @age int
--set @age = 20
--print 'Hi '+@name+'Your age is : '+cast(@age as varchar(45));

declare @name varchar(45) ='Areeba';
declare @age int
set @age = 18
begin   -- work also without begin end
if(@age>=18)
print @name+ ' Your are eligible for voting'
else
print @name+ ' Your are not eligible for voting'
end
---------print 1-10
declare @loop int = 0
while(@loop<10)
begin 
print @loop
set @loop=@loop +1;
end

-------print even numbers 0-20
declare @loop int=0;
while(@loop<=20)
begin
print @loop
set @loop=@loop+2
end

-------print odd numbers 1-19
declare @loop int=1;
while(@loop<=20)
begin
print @loop
set @loop=@loop+2
end

-------print Multiple of 3
declare @num int =3
declare @loop int = 1;
while(@loop<=10)
begin
print @loop*@num
set @loop=@loop+1
end

-------print Multiples in Format
print ' Times Tables'
declare @num int =3
declare @loop int = 1;
while(@loop<=10)
begin
print +cast(@num as varchar(45))+' X '+cast (@loop as varchar(45)) +' = '+cast(@loop*@num as varchar(45))
set @loop=@loop+1
end

----------Triggers---------------
create trigger tg1
on Book 
for insert 
as
begin 
if (select Title from inserted  )='areeba'
select * from Book
end
drop trigger tg1

INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES
(21, 'areeba', 'F. Scott Fitzgerald', 'Fiction', 2026)

create trigger tg3
on Author
instead of insert
as 
begin
print 'Data cant be inserted !!'
select * from Author
end
drop trigger tg3
INSERT INTO Author (AuthorID, AuthorName, BirthYear, Nationality) VALUES
(13, 'Trigger data', 2019, 'Turkish')

create trigger tg5
on Book 
for insert 
as begin 
if (select PublishedYear from inserted  )>year(getDate())
rollback
end
drop trigger tg5
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES
(25, 'new Trigger data', 'F. Scott Fitzgerald', 'Fiction', 2020)

select * from Book
create trigger tg6
on Book
for delete 
as begin
if (select Title from deleted )='Peer e Kamil'
rollback
end

drop trigger tg6
delete from Book where BookID=24


create trigger tg7
on Book
for delete 
as begin
print 'Data Cant be Deleted  '
rollback   -- work as instead
end
drop trigger tg7
delete from Book where BookID=23
select * from Book


create trigger tg8
on Book 
for update
as begin
select * from Book
rollback
end
drop trigger tg8
update Book set title='XYZ' where BookID=18

create trigger tg9
on Book
instead of delete 
as begin
if (select Title from deleted) ='XYZ'
select * from Book
end
drop trigger tg9
delete from Book where Title ='areeba'

create trigger tg9 
on Book
after update 
as begin
IF UPDATE(Title) 
rollback
end
drop trigger tg9
update Book set Title ='JKP' where BookID=19
update Book set Genre ='Fiction' where BookID=19
select * from Book
----------------------switch Statements------------
select BookID,Title,AuthorID,
case 
when AuthorID is null then BookID
else AuthorID 
end 
as [AuthorID/BookID]
from Book

select * from Author

select AuthorID,AuthorName,BirthYear,
case 
when BirthYear <2015 then 'Eligible'
else 'Not ELigible' 
end 
as [Eligibility]
from Author

select AuthorID,AuthorName,BirthYear,
case 
when BirthYear <2015 then 'Eligible'
when  BirthYear =2019 then 'Perfect'
else 'Not ELigible' 
end 
as [Eligibility]
from Author
-----------------------Basic Concepts--------------------
select len(Title) from Book
select left(Title,5) from Book
select upper(Title) from Book
select substring(Title,3,len(Title)-3) from Book where BookID=1
select trim(Title) from Book
select abs(PublishedYear) from Book
select distinct(Genre) from Book
select * from Book
select distinct(PublishedYear) from Book
select * from Book where Title like '%e'

select day(getDate())
select month(getDate())
select year(getDate())
select round(12.22677,2)
select sqrt(16)
select power(2,3)
select * from Author where AuthorName in ('Eshal Fatima','Arwa Fatima')
select * from Author where AuthorName = ('Eshal Fatima')
select * from Author where AuthorName in (select AuthorName from Author where AuthorName='Eshal Fatima')
select * from Book where exists (select AuthorID from Author  where Author.AuthorID=Book.AuthorID)
select * from Author where not exists (select BookID from Book  where Author.AuthorID=Book.AuthorID)
select AuthorName,min(BirthYear)  from Author group by AuthorName 
select AuthorName,min(BirthYear),Nationality  from Author group by AuthorName ,Nationality
select AuthorName,min(BirthYear),Nationality  from Author group by AuthorName ,Nationality having AuthorName='Areeba Hanif'
select * into newTable from Book
select * from newTable
select * from Book 
select * from Author
select * from Book where AuthorID = all(select AuthorID from Author where Nationality='Pakistani' )
select * from Author where AuthorID = any(select AuthorID from Author where Nationality='Pakistani' )

select top 5 * from Book
select top 5 BookID,Genre from Book
select * from Book where Title between 'a' and 'o'


create view vw3
as
select * from Book

select * from vw3
update  vw1  set Genre='Religious' where BookID=4


create view vw2 (BookTitle,BookId,Authorname)
as 
select Book.Title,count(Book.BookID),Author.AuthorName from Book join Author on Book.AuthorID=Author.AuthorID
group by Book.Title,Author.AuthorName having Author.AuthorName between 'a' and 'z'
select * from vw2

------------STORED PROCEDURES----------
select * from Author

create procedure pc1
@name varchar(45)
as
select * from Author where AuthorName = @name
GO
execute pc1 @name='Harper Lee'
drop proc pc1

create proc pc4
@name varchar(45)
as 
begin
select * from Author where AuthorName= @name
end
execute pc4 @name='Areeba Hanif'
drop procedure pc4


create procedure pc3
as
begin
select * from Book
end
execute pc3 
drop procedure pc3

create proc pc2
@age int,
@name varchar(45)
as
begin
update Author set BirthYear=@age where AuthorName=@name
end
execute pc2 @name='Harper Lee'  ,@age=2008
select * from Book

create procedure pc5
@bookName varchar(45)
as
begin
select Book.BookID,Book.Title,Book.Genre ,Author.AuthorName,Author.Nationality
from Book join Author on Book.AuthorID=Author.AuthorID
where Book.Title=@bookName
end
drop proc pc5
execute pc5 @bookName='To kill a Mockingbird'
select * from Book


create procedure cou
@genr varchar(45),
@totals int output
as
begin
select @totals=count(BookID) from Book where Genre=@genr
end

declare @totalcount int
exec cou 'Religious',@totalcount out
print @totalcount

-------------TRANSACTIONS--------------
begin try
begin tran
INSERT INTO Book (BookID, Title, Author, Genre, PublishedYear) VALUES(24,'My Favourite Book','Me','Self',2021);
delete from Book where BookID=26
end try
begin catch
print 'Not Found'
end catch


select * from Book

begin try
begin tran
select Book.BookID,Book.Title,Book.Genre ,Author.AuthorName,Author.Nationality
from Book join Author on Book.AuthorID=Author.AuthorID
where Book.Title='To kill a Mockingbird'
commit
print 'its true'
end try
begin catch
rollback tran
print 'not'
end catch


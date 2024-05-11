create database join2
use join2

--Table Student
create table Student(
Student_Id int primary key,
Roll_number int,
Student_Name varchar(50),
DOB Date,
Gender varchar(50),
);
insert into Student(Student_Id, Roll_number, Student_Name, DOB, Gender) values
(1, 101, 'Talha', '2000-01-01', 'Male'),
(2, 102, 'Hanan', '2000-02-02', 'Female'),
(3, 103, 'Hamza', '2000-03-03', 'Male'),
(4, 104, 'Zainab', '2000-04-04', 'Female'),
(5, 105, 'Areeba', '2003-07-24', 'Female'),
(6, 106, 'Saad',   '1999-01-03', 'Male')
select * from Student

--Table Course
create table Course(
Course_Id int primary key,
Course_Code int Not null,
Course_Name Varchar(50),
Credit_Hours numeric,
);
insert into Course(Course_Id, Course_Code, Course_Name, Credit_Hours) values
(1, 101, 'Database Management Systems', 3),
(2, 102, 'Artificial Intelligence', 4),
(3, 103, 'Data Structures and Algorithms', 3),
(4, 104, 'Software Engineering', 4),
(5, 105, 'Calculus', 3)

select * from Course

--Table Semester
create table Semester(
Semester_Id int primary key,
Season Varchar(50),
years int,
);
insert into Semester(Semester_Id, Season, years) values
(1, 'Fall', 2020),
(2, 'Summer', 2021),
(3, 'Spring', 2021),
(4, 'Fall', 2021),
(5, 'Spring',2020)
select * from Semester 

 
--Table offered_courses
CREATE TABLE offered_courses(
Offered_Courses_Id int PRIMARY KEY,
Course_Id int FOREIGN KEY REFERENCES Course(Course_Id),
Semester_Id int FOREIGN KEY REFERENCES Semester(Semester_Id)
);
insert into offered_courses(Offered_Courses_Id, Course_Id, Semester_Id) values
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
	(5, 5, 5)
    select * from offered_courses
	
--Table teacher
create table teacher(
Teacher_Id int PRIMARY KEY,
Teacher_Name varchar(50),
Designation varchar(50),
);
insert into teacher(Teacher_Id, Teacher_Name, Designation) values
(1, 'anam', 'Professor'),
(2, 'aroona', 'Assistant Professor'),
(3, 'mehak', 'Associate Professor'),
(4, 'hira', 'Lecturer'),
(5, 'aleeza', 'lecturer')
select * from teacher

--Table sections
create table section(
Offeredcourse_Id int FOREIGN KEY REFERENCES offered_courses(Offered_Courses_Id),
[section] varchar(50) PRIMARY KEY,
Teacher_Id int FOREIGN KEY REFERENCES teacher(Teacher_Id),
);
insert into section(Offeredcourse_Id, section, Teacher_Id) values
(1,'Section A', 1),
(2,'Section D', 2),
(3,'Section C', 3),
(4,'Section F', 4),
(5,'Section B', 5)
select * from section


--Table Registrations
CREATE TABLE Registrations(
Registration_Id int PRIMARY KEY,
Student_Id int FOREIGN KEY REFERENCES Student (Student_Id),
offeredCourse_Id int FOREIGN KEY REFERENCES offered_courses(Offered_Courses_Id),
[Section] varchar(50) FOREIGN KEY REFERENCES section (section),
Registration_Date Date
);
insert into Registrations (Registration_Id, Student_Id, offeredCourse_Id, Section, Registration_Date) values
(1, 1, 1, 'Section A', '2021-02-24'),
(2, 2, 2, 'Section D', '2023-04-27'),
(3, 3, 3, 'Section C', '2021-02-20'),
(4, 4, 4, 'Section F', '2022-01-20'),
(5, 5, 5, 'Section B', '2023-03-21')

select * from Registrations
select * from offered_courses
select * from teacher
select * from Course
select * from section
select * from semester
select * from Student


----------------------------Q1 QUERY-----------------------
select Student.Student_Name, Student.DOB from Student where DOB < '2000/01/03'


----------------------------Q2 QUERY-----------------------
select teacher.Teacher_Name , concat(Semester.Season,' ', Semester.years) as [Session & Year] from teacher
join section
on teacher.Teacher_Id=section.Teacher_Id
join offered_courses
on section.Offeredcourse_Id=offered_courses.Offered_Courses_Id
join course
on offered_courses.Offered_Courses_Id=course.Course_Id
join semester
on offered_courses.Semester_Id=semester.Semester_Id
where course.Course_Name='Database Management Systems' and Semester.Season='Fall' and Semester.years=2020

----------------------------Q3 QUERY-----------------------
select teacher.Teacher_Name, concat(Semester.Season,' ', Semester.years) as [Session & Year] from teacher
join section
on teacher.Teacher_Id=section.Teacher_Id
join offered_courses
on section.Offeredcourse_Id=offered_courses.Offered_Courses_Id
join course
on offered_courses.Offered_Courses_Id=course.Course_Id
join semester
on offered_courses.Semester_Id=semester.Semester_Id
where course.Course_Name='Database Management Systems' 
and Semester.Season='Fall' and Semester.years=2020 
or Semester.Season='Spring'  and Semester.years=2020

----------------------------Q4 QUERY-----------------------

select Student.Student_Name, Registrations.Registration_Date from Student
join Registrations
on Student.Student_Id=Registrations.Student_Id
join offered_courses
on Registrations.offeredCourse_Id=offered_courses.Offered_Courses_Id
join Course
on offered_courses.Course_Id=Course.Course_Id
join Semester
on offered_courses.Semester_Id=Semester.Semester_Id
where Course.Course_Name='Artificial Intelligence'
and Semester.Season='Summer' and Semester.years=2021

----------------------------Q5 QUERY-----------------------

select Student.Student_Name,Registrations.Registration_Date from Student
join Registrations
on Student.Student_Id=Registrations.Student_Id
join section on Registrations.section=section.section
join offered_courses
on section.offeredCourse_Id=offered_courses.Offered_Courses_Id
join Course
on offered_courses.Course_Id=Course.Course_Id
join Semester
on offered_courses.Semester_Id=Semester.Semester_Id
where Student.Gender='Female' and Course.Course_Name='Calculus' and  Semester.Season='Spring'
and Semester.years=2020 and section.section='Section B'

----------------------------Q6 QUERY-----------------------

select teacher.Teacher_Name , concat(Semester.Season,' ', Semester.years) as [Session & Year] from teacher
join section
on teacher.Teacher_Id=section.Teacher_Id
join offered_courses
on section.Offeredcourse_Id=offered_courses.Offered_Courses_Id
join course
on offered_courses.Offered_Courses_Id=course.Course_Id
join semester
on offered_courses.Semester_Id=semester.Semester_Id
where course.Course_Name='Database Management Systems' and Semester.Season='Fall'
and Semester.years=2020 and section.section='Section A'

----------------------------Q7 QUERY-----------------------
select teacher.Teacher_Name , concat(Semester.Season,' ', Semester.years) as [Session & Year] from teacher
join section
on teacher.Teacher_Id=section.Teacher_Id
join offered_courses
on section.Offeredcourse_Id=offered_courses.Offered_Courses_Id
join course
on offered_courses.Offered_Courses_Id=course.Course_Id
join semester
on offered_courses.Semester_Id=semester.Semester_Id
where Semester.Season='Fall' and Semester.years=2020 




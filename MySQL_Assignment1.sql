-- create database-- 
create database Mysqldb;

-- create student table--  
create table student(
stud_id int primary key auto_increment,
firstname varchar(50),
middlename varchar(50),
lastname varchar(50),
dob date,
email varchar(100),
contact_no bigint,
address varchar(100),
city varchar(30),
state varchar(30),
pincode int
);

-- insert record into student table-- 
insert into student
values(0,'vrunda','J','savaliya','1999/11/11','vrunda@gmail.com',9624669004,'5,shantinagar','surat','Gujarat',395006);
insert into student
values(0,'vihani','J','desai','1999/11/11','vihani@gmail.com',9624669006,'5,sundarbag','surat','Gujarat',395006);

-- create category table--  
create table category
(
category_id int primary key auto_increment,
category_name varchar(50)
);

-- insert record into category table-- 
insert into category
values(0,'IT');
insert into category
values(0,'Business');

-- create sub_category table--  
create table sub_category
(
sub_category_id int primary key auto_increment,
sub_category_name varchar(50),
category_id int  REFERENCES category(category_id)
);
-- insert record into sub_category table-- 
insert into sub_category
values(0,'Computer',1);
insert into sub_category
values(0,'Programming',1);
insert into sub_category
values(0,'Automotive',2);
insert into sub_category
values(0,'Business Support & Supplies ',2);

-- create course table--  
create table course(
course_id int primary key auto_increment,
sub_category_id int REFERENCES sub_category(sub_category_id),
course_title varchar(100),
course_description text,
Duration varchar(15),
course_level varchar(20),
start_date date,
end_date date

);
-- insert record into course table-- 
insert into course
values(0,2,'Learn Java','Easy step to learn java programming','2 month','Beginner','2021/08/01','2021/10/01');
insert into course
values(0,1,' Network Administration','Certificate Course in Network Administration','1 month','Intermediate','2021/09/01','2021/10/01');
insert into course
values(0,3,'Service, Repair & Parts','Easy step to learn Service, Repair & Parts','3 month','Beginner','2021/08/01','2021/11/01');

-- create enrollment table--  
create table enrollment(
enrollment_id int primary key auto_increment,
stud_id int references student(stud_id),
course_id int references course(course_id),
enrollment_date date
);
-- insert record into enrollment table-- 
insert into enrollment
values(0,1,1,'2021/08/01');
insert into enrollment
values(0,1,3,'2021/08/05');
insert into enrollment
values(0,2,3,'2021/08/05');
insert into enrollment
values(0,2,2,'2021/08/05');
select * from enrollment;



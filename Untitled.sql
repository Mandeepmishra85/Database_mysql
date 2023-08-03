CREATE DATABASE ACEM;
USE ACEM;

CREATE TABLE students(
id int,
Name varchar(20),
Roll int,
Batch int
);

CREATE TABLE TEACHER(
TID int,
Name varchar(20),
Faculty varchar(20)
);

insert into students values(820,'Mandeep Mishra',1,2077),(821,'Miraj Maharajan',2,2077),(822,'Aashiq kumar',3,2077),(823,'Bishal Mahato',4,2077),(824,'Kishan Mishra',5,2077);
insert into TEACHER values(230,'Subarna Sakya','BEI'),(231,'Dhiraj Pyakhurel','BEX'),(232,'Vikash Acharya','BCE'),(233,'Ajaya Shrestha','BEI'),(234,'Babita Mam','BCT');

SELECT * from students ;
SELECT * from teacher ;

-- TO DELETE ROLL FROM STUDENT
ALTER TABLE students
DROP column roll;

-- TO ADD SALARY ATTRIBUTE IN TEACHER 
ALTER TABLE Teacher
ADD salary int;

create table copy(
name varchar(20)
);

-- TO COPY TO NEW RELATION FROM OLD
INSERT INTO copy (name)
SELECT name FROM students;

SELECT name into copy From students;

-- 

CREATE TABLE Employee(
ID int,
name varchar(20),
Date date,
Salary int
);
ALTER TABLE Employee
add primary key(id)

CREATE TABLE Booklist(
isbn int,
name varchar(20),
Publication varchar(20)
);

CREATE TABLE Book(
bid int,
bname varchar(20),
author varchar(20),
price int
);

CREATE TABLE Issues(
iid int NOT NULL,
TID int NOT NULL,
name varchar(20),
Date date
);

-- SET SID AS PRIMARY KEY 	
					  -- ALTER TABLE STUDENTS
					  -- ALTER COLUMN ID INT NOT NULL
                      -- PRIMARY KEY(ATTRIBUTE)
ALTER TABLE students
ADD primary key(id);  

ALTER TABLE students
ADD TID INT;

UPDATE Students 
SET TID = 230 
WHERE ID = 820;

UPDATE Students 
SET TID = 231 
WHERE ID = 821;

UPDATE Students 
SET TID = 232
WHERE ID = 822;

UPDATE Students 
SET TID = 233 
WHERE ID = 823;

UPDATE Students 
SET TID = 234 
WHERE ID = 824;

UPDATE teacher 
SET salary = 23000
where tid = 230;

UPDATE teacher 
SET salary = 2300
where tid = 231;

UPDATE teacher 
SET salary = 24000
where tid = 232;

UPDATE teacher 
SET salary = 2760
where tid = 233;

UPDATE teacher 
SET salary = 1400
where tid = 234;

UPDATE teacher 
SET salary = 22456
where tid = 235;


ALTER TABLE Teacher
ADD CONSTRAINT p_k1 primary key(TID); 

-- SET TEACHERS TID AS FOREIGNKEY
ALTER TABLE Students
ADD CONSTRAINT f_k FOREIGN KEY(TID)
REFERENCES Teacher(TID);

-- Default 
ALTER TABLE Employee
ALTER Date
SET DEFAULT '2010-01-01';

Select * from Employee;

-- Bid as foreign key
ALTER Table Book
ADD primary key(bid)
ALTER TABLE Book
DROP PRIMARY KEY;

ALTER TABLE Booklist
ADD primary key(isbn)
-- ---------------------------ADDED FOREIGN KEY
ALTER TABLE Book
ADD CONSTRAINT f_k1
FOREIGN KEY(bid)
REFERENCES Booklist(isbn)
-- ----------------------------------------------
ALTER TABLE Issues DROP CONSTRAINT f_k1;

-- iid as foreign key
ALTER TABLE BOOK 
ADD PRIMARY KEY(bid)
ALTER TABLE Issues
ADD CONSTRAINT f_k2
FOREIGN KEY(iid)
REFERENCES book(bid)
-- --------------------

-- Must less than 5000 while entering
ALTER TABLE book
ADD CONSTRAINT chk
CHECK (price<5000);

-- INSERTING 
insert into  Employee (ID,name,Salary) values(1,'RAM',2500),(2,'Shyam',5000),(3,'Beni',3000),(4,'Asmita',6000),(5,'Kabita',7000);
SELECT * From Employee;
UPDATE Employee
SET salary = 23000
where id = 230;

insert into Booklist values(1,'Sci-fi','Asmita'),(2,'Fiction','Gate'),(3,'Rome','Geo'),(4,'Man','Hume');
SELECT * From Booklist;

insert into Book values(1,'Science','W.C',2300),(2,'Anime','Robert',2700),(3,'Bot','Hummn',2600),(4,'Sing a song','Writer me',4999);
SELECT * From Book


insert into Issues values(1,230,'Lack of water','2006-03-05'),(2,232,'Fight','2010-01-09'),(3,234,'Money Disflow','2020-05-30'),(4,233,'Security','2006-11-21'),(5,236,'Kings of Lord','2009-05-05');
SELECT * From Issues;

ALTER TABLE ISSUES
ADD primary key(iid);
				--
ALTER table ISSUES--
ADD CONSTRAINT f_k3--
FOREIGN KEY(tid) --
REFERENCES Teacher(TID);--

DROP table issues;
insert into Issues values(5,'Mains','2000-09-01');


-- Display salary less than 10000
 
-- Todays Lab

-- -- -- For Full Join
SELECT *
FROM Booklist
LEFT JOIN Book
ON Booklist.isbn = Book.bid

UNION
-- Boookname and Publication name and Author name where pub name is Asmita
SELECT *
FROM Booklist
Right JOIN Book
ON Booklist.isbn = Book.bid
WHERE Booklist.publication ='Asmita';

-- -- -- --

-- Select teacher.name , teacher.faculty 
Select *
From Teacher 
Left Join issues
On teacher.tid = issues.tid 


Union
-- question no. 2
Select teacher.name , teacher.faculty 
From Teacher 
INNER Join issues
On teacher.tid = issues.tid 
Where issues.date ='2006-03-05';

-- QUES 3 
-- Without using join
SELECT employee.name 
From employee , teacher
WHERE employee.id = teacher.tid AND  employee.salary >10000 AND Teacher.faculty = 'BEI';

-- ques 5
-- without using join
SELECT teacher.name , book.bname
from teacher,book,issues
WHERE issues.iid = book.bid AND issues.tid = teacher.tid AND teacher.name LIKE 'S%';

Select * from issues;
select * from book;
select * from teacher;

-- with join
SELECT *
FROM Teacher
 JOIN Issues
ON teacher.tid = issues.tid

join BOOK
ON Book.bid = issues.iid
WHERE teacher.name LIKE 'S%';

-- Ques 7
Update employee
SET salary = salary * 1.1 ;



-- ques 9
Update employee
SET salary = salary + salary*0.2
Where salary < 4000 ;
SELECT * from employee;

update employee 
set salary = 3000
where id = 2;

update employee 
set salary = 4000
where id = 3;

update employee 
set salary = 7000
where id = 4;

update employee 
set salary = 3030
where id = 5;



-- ques lab
DELETE FROM employee
WHERE id=230;

-- ques 10 Provide 5% increment to all salaries whose salary is greater than 5000 and 20% increment in rest of salaries.
-- (use CASE WHEN <CONDITION>THEN <STATEMENT> ELSE<STATEMENT> END).
update employee 
SET Salary = 
    CASE
        WHEN salary > 5000 THEN salary*1.05
        ELSE salary*1.2
    END ;

select * from teacher;
select * from employee;
insert into employee values (230 , 'Mandeep' , '2002-02-02' , 8000);
-- ques 12 Use sub query to find all teachers name and faculty whose date of employee is _________
select name , faculty from teacher where Tid in(select id from employee where date ='2002-02-02');

select * from book;
select * from booklist;


-- ques 13. Use sub query to find all the book name and author name whose publication is “shaja prakashan”.
select bname , author from book where bid in(select isbn from booklist where publication = 'Asmita');


-- --------------------------------------------------LAB 4----------------------------------------------------------------------------------
-- 1. Sort the employee records in descending order.
SELECT * FROM employee
ORDER BY id desc;

-- 2. Sort name and publication name in ascending order.
Select name , publication from booklist 
order by name;

-- 3. Display top three records from teachers relation.
SELECT *
FROM teacher 
ORDER BY salary DESC
LIMIT 3;

-- 4. Display the sum of salaries of all employees.
SELECT sum(salary)
from employee;

-- 5. Display the minimum salary of employee.
select * 
FROM employee
ORDER BY salary 
LIMIT 1;

-- 6. Display the average price of book written by same author.
SELECT AVG(salary)
from employee;

-- 7. Display publication name and number of books published by it from book list relation publication wise.
-- SELECT COUNT(*) FROM employee_tbl ;
SELECT  * from book;
SELECT * from booklist;
SELECT Publication , count(*) from booklist 
group by publication;

-- 8 Display the bid and bname of books whose price is greater than average prices of book.
SELECT  * from book;
SELECT  avg(price) from book;
SELECT bid,bname from book where price >  (select AVG(price) from book);










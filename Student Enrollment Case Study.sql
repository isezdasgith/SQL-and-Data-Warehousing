-- (1) Create Subject2 table and insert the above 5 records
Create Table Subject2
(Ucode CHAR(5) NOT NULL PRIMARY KEY,
Utitle VARCHAR2(20) NOT NULL,
Ucredits NUMBER(2) NOT NULL);

INSERT INTO Subject2 VALUES ('IT001', 'Database', 5);
INSERT INTO Subject2 VALUES ('IT002', 'Java', 5); 
INSERT INTO Subject2 VALUES ('IT003', 'SAP', 10);
INSERT INTO Subject2 VALUES ('IT004', 'Network', 5);
INSERT INTO Subject2 VALUES ('IT005', 'ASP.net', 5);

select * from Subject2;

-- (2) Create Student2 table
Create Table Student2
As Select *
From dtaniar.Student2;
select * from Student2;

-- (3) Describe the structure of table Student2
DESC Student2;

-- (4) Insert 3 additional records into Student2 table
insert ALL
into Student2
VALUES ('10008', 'Miler', 'Larry', 'M', to_date('22-Jul-73', 'DD-MON-YY'), 211)
into Student2
VALUES ('10009', 'Smith', 'Leonard', 'M', to_date('26-May-85', 'DD-MON-YY'), 211)
into Student2
VALUES ('10010', 'Brown', 'Menson', 'M', to_date('12-Jul-83', 'DD-MON-YY'), 112)
select * from dual;

select * from Student2;

-- (4) Create  OFFERING2 and ENROLLMENT2 tables from dtaniar account
-- Offering2 table
Create Table Offering2
As Select *
From dtaniar.Offering2;
select * from Offering2;

-- Enrollment2 table
Create Table Enrollment2
As Select *
From dtaniar.Enrollment2;
select * from Enrollment2;

-- (5) SQL  Queries
-- (5a)How many students enrolled in the Database unit offered in Main campus

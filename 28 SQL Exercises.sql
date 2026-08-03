-- (1) environment setup 
SELECT * FROM TAB; 

-- (2) create table LECTURER
CREATE TABLE LECTURER
(StaffNO 			NUMBER(6) 		NOT NULL, 
 Title				VARCHAR2(3),
 FName 				VARCHAR2(30),
 LName				VARCHAR2(30),
 StreetAddress		VARCHAR2(70), 
 Suburb				VARCHAR2(40), 
 City				VARCHAR2(40), 
 PostCode			VARCHAR2(4), 
 Country				VARCHAR2(30),
 LecturerLevel		CHAR(2), 
 BankNO				CHAR(20),
 BankName			VARCHAR2(40),
 Salary				NUMBER(8,2), 
 WorkLoad			NUMBER(2,1) 	NOT NULL, 
 ResearchArea			VARCHAR2(40),
 PRIMARY KEY(StaffNo));

-- (3) observe the table structure
SELECT * FROM TAB; 

-- (4a) insert data into LECTURER table
INSERT INTO LECTURER (StaffNO, Title, FName, LName, StreetAddress, Suburb,City, PostCode, Country, LecturerLevel, BankNO, BankName, Salary, WorkLoad, ResearchArea)
VALUES (1000,'Dr','David','Taniar','3 Robinson Av', 'Kew', 'Melbourne', '3080', 'Australia', '5', '1000567237', 'CommBank', 89000.00, 2.0, 'O-R DB');

-- (4b) insert data into LECTURER table
INSERT INTO LECTURER (StaffNO, Title, FName, LName, StreetAddress, Suburb, City, PostCode, Country, LecturerLevel, BankNO, BankName, Salary, WorkLoad, ResearchArea)
VALUES (2000,'Ms','Julie','Main','6 Algorithm Av', 'Montmorency', 'Melbourne', '3089', 'Australia', '5', '1000123456', 'CommBank', 89000.00, 2.0, 'CBR');

-- (4c) insert data into LECTURER table if entering values for all attributes
INSERT INTO LECTURER VALUES (3000, 'Mr', 'Daniel', 'Wright', '22 Crystal Cres', 'Alphington', 'Melbourne', '3790', 'Australia', '5', '1000654321', 'CommBank', 89000.00, 2.0, 'DB');

-- (4d) insert data into LECTURER table if entering PARTIAL values specific attributes
INSERT INTO LECTURER (StaffNO, Title, FName, LName, StreetAddress, Suburb, PostCode, Country, ResearchArea, Workload)
VALUES (4000, 'Mr', 'RaiHong', 'Lam', '12 Oracle Dr', 'Fitzroy', '3424', 'Australia', 'Data Mining', 1);

-- (5) observe the table structure
SELECT * FROM LECTURER; 

-- (6a) create STUDENT table
DROP TABLE STUDENT;
CREATE TABLE STUDENT
(StudentNO			NUMBER(6)	NOT NULL, 
 DOB				DATE, 
 FName 			VARCHAR2(30),
 LName			VARCHAR2(30),
 -- city spelt CiTTy
 CiTTy			VARCHAR2(40),
 PostCode			VARCHAR2(4), 
 Country			VARCHAR2(30),
 FeePaid			NUMBER(8,2), 
 LastFeeDate		DATE,
 PRIMARY KEY(StudentNo));

-- (6b) Insert 5 students into the student table, with student number 30001, 30002, 30003,
-- 30004 and 30005. Assign all attributes values. Note format for inserting date: ‘12-FEB-2002’
INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (30001, TO_DATE('12-FEB-2002','DD-MON-YYYY'), 'John', 'Smith', 'Melbourne', '3000', 'Australia', 1500.00, TO_DATE('15-JAN-2024','DD-MON-YYYY'));

INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (30002, TO_DATE('23-JUN-2001','DD-MON-YYYY'), 'Sarah', 'Jones', 'Sydney', '2000', 'Australia', 1800.50, TO_DATE('20-FEB-2024','DD-MON-YYYY'));

INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (30003, TO_DATE('05-SEP-2000','DD-MON-YYYY'), 'Michael', 'Brown', 'Brisbane', '4000', 'Australia', 2000.00, TO_DATE('10-MAR-2024','DD-MON-YYYY'));

INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (30004, TO_DATE('18-NOV-2002','DD-MON-YYYY'), 'Emily', 'Davis', 'Perth', '6000', 'Australia', 1650.75, TO_DATE('05-APR-2024','DD-MON-YYYY'));

INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (30005, TO_DATE('30-MAR-2001','DD-MON-YYYY'), 'David', 'Wilson', 'Adelaide', '5000', 'Australia', 1900.25, TO_DATE('12-MAY-2024','DD-MON-YYYY'));

-- (7) Alter STUDENT table to add StreetAddress and Suburb attributes. 
-- Note: StreetAddress is VARCHAR2(70) and Suburb is VARCHAR2(40)
ALTER TABLE STUDENT ADD 
(StreetAddress		VARCHAR2(70), 
 Suburb				VARCHAR2(40));

-- (8) Observe the STUDENT table structure
DESCRIBE STUDENT;

-- (9) AND (10) Update CiTTy attribute to City and modify the data type of City to CHAR(40)
ALTER TABLE STUDENT
RENAME COLUMN CiTTy TO City;
DESCRIBE STUDENT;

ALTER TABLE STUDENT
MODIFY (City CHAR(40));
DESCRIBE STUDENT;

-- (11) Modify the data type of City to VARCHAR2(40)
ALTER TABLE STUDENT
MODIFY (City VARCHAR2(40));
DESCRIBE STUDENT;

-- Difference between CHAR and VARCHAR2:

-- CHAR is a fixed length string data type. In Question#10 above, if the length of a city is
-- less than 40 characters, the system will pad with spaces in order to fill up the 40 character
-- spaces allocated to the City attribute

-- VARCHAR2 is a variable length string data type. In Question#11, if the length of a city is
-- less than 40 characters, the system will not pad with additional spaces at the end.

-- (12) Update the StreetAddress of student number 30001 to '12 New St'
UPDATE STUDENT
SET StreetAddress = '12 New St'
WHERE StudentNo = 30001;

-- (13) Check to see if the update was successful
SELECT * FROM STUDENT
WHERE STUDENTNO = 30001;

-- (14) Can you ADD a new field and DROP another field in one SQL Statement?
-- Answer: No. One Alter Table statement for Adding new attributes, and a separate Alter Table
-- statement for deleting attributes.

-- PART B
-- (16) Tables SUBJECT, LECTURE, TUTOR, LAB, STUDENT_ENROLMENT, and
-- LAB_SIGNUP have been created in the dtaniar account. Several records have been
-- inserted to this table. You can now import the tables into your account using the following
-- SQL statement, for e.g.:
        -- Create Table SUBJECT
        -- As Select *
        -- From dtaniar.SUBJECT;
-- You need to import all other tables (i.e. LECTURE, TUTOR, LAB, STUDENT_ENROLMENT, and LAB_SIGNUP). 

CREATE TABLE LECTURE
AS SELECT *
FROM dtaniar. LECTURE;

CREATE TABLE TUTOR
AS SELECT *
FROM dtaniar. TUTOR;

CREATE TABLE LAB
AS SELECT *
FROM dtaniar. LAB;

CREATE TABLE STUDENT_ENROLMENT
AS SELECT *
FROM dtaniar. STUDENT_ENROLMENT;

CREATE TABLE LAB_SIGNUP
AS SELECT *
FROM dtaniar. LAB_SIGNUP;

-- (17) SQL statement to list all the lecturers and their lecture schedules
SELECT L.LName, L.FName, S.SubjectCode, S.LectDay, S.LectTime
FROM Lecturer L, Lecture S
WHERE L.StaffNo = S.StaffNo;

-- (18) Are there any lecturers who are not teaching?
SELECT FName, LName
FROM Lecturer
WHERE StaffNo 
NOT IN (SELECT StaffNo
        FROM Lecture);

-- (19) List all the tutors
SELECT *
FROM TUTOR;

-- (20) List all the students by first-name, last-name, date-of-birth, and fee-paid details, who are
-- born after 1990 and before 1995.
SELECT FName, LName, DOB, FeePaid
FROM Student
WHERE DOB BETWEEN to_date('01-JAN-1991','DD-MON-YYYY')
AND to_date('31-DEC-1994','DD-MON-YYYY');


-- (21) List all the students enrolled in the database subject.
-- (Note: database = CSE21DB, CSE31DB, CSE41FDB)
SELECT DISTINCT S.StudentNo, FName, LName
FROM Student S, Student_Enrolment SE
WHERE (SubjectCode = 'CSE21DB'
OR SubjectCode = 'CSE31DB'
OR SubjectCode = 'CSE41FDB')
AND S.StudentNo = SE.StudentNo;


-- (22) List the students who are tutors.
SELECT T.TutorNo, T.StudentNo, FName, LName
FROM Student S, Tutor T
WHERE S.StudentNo = T.StudentNo;

-- (23) Select the lecturer(s) whose research area is ‘Network Management’.
SELECT StaffNo, FName, LName
FROM Lecturer
WHERE ResearchArea = 'Network Management';

-- (24) Calculate the average salary of a lecturer.
-- Notes: NULL values will not be included in the average calculation. If you would include the
-- NULL values into the average calculation, then you could use the NVL function.
-- In this example, if Salary is NULL then Salary=0.
SELECT AVG(NVL(SALARY,0)) AS "Average Salary"
FROM Lecturer;

-- (25) Calculate the minimum and maximum salary of the lecturers.
SELECT MIN(Salary) AS "Min Salary", MAX(Salary) AS "Max Salary"
FROM Lecturer;

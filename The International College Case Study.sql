-- checking to see if the contents for each table is correct
select * from opdb.enrolment;
select * from opdb.agent;
select * from opdb.payment;
select * from opdb.course;
select * from opdb.campus;
select * from opdb.student;

-- code to implement the star schema
/*
 drop table AgentDim;
 drop table CountryDim;
 drop table CourseDim;
 drop table YearDim;
 drop table CollegeFact;
*/

-- Agent Dimension
create table AgentDim as
select * from opdb.Agent;
select * from AgentDim;

--Country Dimension
create table CountryDim as
select distinct Country
from opdb.Student;
select * from CountryDim;

--Course Dimension
create table CourseDim as
select CourseCode, CourseName, Duration, CourseLevel
from opdb.Course;
select * from CourseDim;

--Year Dimension
create table YearDim as
select distinct EnrolmentYear
from opdb.Enrolment;
select * from YearDim;

--Fact Table
create table CollegeFact as
select
    S.Country,
    E.AgentNo,
    E.CourseCode,
    E.EnrolmentYear,
count(p.PaymentNo) as Number_of_payments,
sum(P.Amount) as Total_Income
from opdb.Student S, opdb.Enrolment E, opdb.Payment P
where E.EnrolmentNo = P.EnrolmentNo
and E.StudentID = S.StudentID
group by
    S.Country,
    E.AgentNo,
    E.CourseCode,
    E.EnrolmentYear;

select * from CollegeFact;

-- SQL Statements to query the star schema
-- (1) What is the total income coming from Australia?
select sum(Total_Income) as Total_Income_Australia
from CollegeFact
where upper(Country) = upper('Australia');

-- (2) What is the total income for each course?
select CourseCode, sum(Total_Income) as Total_Income_Per_Course
from CollegeFact
group by CourseCode;

-- (3) What is the total income for the Master of Data Science 
-- course(C6003) in 2019?
select sum(Total_Income) as Total_Income_C6003_2019
from CollegeFact
where upper(CourseCode) = upper('C6003') and EnrolmentYear = 2019;

-- (4) What is the total income from New Star Agent?
select sum(Total_Income) as Total_Income_New_Star_Agent
from CollegeFact
where AgentNo = 'NSA';
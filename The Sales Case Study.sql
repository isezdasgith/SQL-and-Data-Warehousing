-- Checking to see if the connected database has the correct tables and data
select * from opdb.SALES;
select * from opdb.BRANCH;
select * from opdb.PRODUCT;
select * from opdb.CATEGORY;

-- code to implement the star schema
/*
 drop table ProdCategoryDim;
 drop table BranchDim;
 drop table TimeDim;
 drop table TempFact;
 drop table SalesFact;
*/

-- Prodcategory Dimension
create table ProdCategoryDim as
select * from opdb.Category;
select * from ProdCategoryDim;

-- Branch Dimension
create table BranchDim as
select * from opdb.Branch;
select * from BranchDim;

--Time Dimension
create table TimeDim
(
 Quarter number(1),
 Description varchar2(20)
);
insert into TimeDim values (1, 'Jan-Mar');
insert into TimeDim values (2, 'Apr-Jun');
insert into TimeDim values (3, 'Jul-Sep');
insert into TimeDim values (4, 'Oct-Dec');
select * from TimeDim;

-- TempFact Table
create table TempFact as
select SalesDate, BranchID, CategoryID, TotalPrice
from opdb.Sales natural join opdb.Product;
alter table TempFact
add (Quarter number(1));
update TempFact
set Quarter = 1
where to_char(SalesDate, 'MM') >= '01'
and to_char(SalesDate, 'MM') <= '03';
update TempFact
set Quarter = 2
where to_char(SalesDate, 'MM') >= '04'
and to_char(SalesDate, 'MM') <= '06';
update TempFact
set Quarter = 3
where to_char(SalesDate, 'MM') >= '07'
and to_char(SalesDate, 'MM') <= '09';
update TempFact
set Quarter = 4
where Quarter is null;
select * from TempFact;

-- SalesFact Table
create table SalesFact as
select Quarter, BranchID, CategoryID,
sum(TotalPrice) as Total_Sales
from TempFact
group by Quarter, BranchID, CategoryID;
select * from SalesFact;

-- SQL Statements to query the star schema
-- (1) Show the total sales in different quarters.
select quarter, description, sum(Total_Sales) as Total_Sales
from SalesFact natural join TimeDim
group by quarter, description;

-- (2) Show the total sales for different branches and product categories.
select BranchID, categorydesc, sum(Total_Sales) as Total_Sales
from SalesFact natural join prodcategorydim
group by BranchID, categoryDesc;


-- (3) Show the total sales of Kitchen supplies in Quarter 1
select categorydesc, sum(Total_Sales) as Total_Sales
from SalesFact natural join prodcategorydim
where upper(categorydesc) = upper('Kitchen Supplies') and quarter = 1
group by categorydesc;
